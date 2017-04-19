
import * as React from 'react';
import { Table, TableBody, TableFooter, TableHeader, TableHeaderColumn, TableRow, TableRowColumn } from 'material-ui/Table';
import { ApplicationTemplate } from '../../../models/application';
import { connect } from 'react-redux';
import { State } from '../../states/state';
import { selectApplications } from '../../reducers/db';
import { bindActionCreators } from 'redux';
import { navigate, store } from '../../index';
import { browserHistory } from 'react-router';

import { publicPath } from '../../util';
import { DeleteApplicationAction, DELETE_APPLICATION } from '../../../actions';
import RaisedButton from 'material-ui/RaisedButton';

import { classIcons } from '../../../assets/assets';

interface AppListProps {
  apps?: ApplicationTemplate[];
  isAdmin?: boolean;
  delete?: (appId: number) => DeleteApplicationAction;
}

const appStatus = [
  'Draft',
  'New',
  'Pending',
  'Withdrawn',
  'Interview',
  'Accepted',
  'Declined'
];

const AppList = (props: AppListProps) => {
  const authorClassName = props.isAdmin ? 'col-xs-2' : 'col-xs-4';
  return (
    <div className='section'>
      <div className='panel'>
        <h2 className='panel__header'>Applications</h2>
        <div className='panel__content'>
          <table className='table'>
            <thead>
              <tr className='row'>
                <th className='col-xs-1' >Id</th>
                <th className='col-xs-1 col-sm-3' >Character</th>
                <th className={authorClassName} >Author</th>
                <th className='col-xs-3 col-sm-2' >Status</th>
                <th className='col-xs-3 col-sm-2' >Changed</th>
                {
                  props.isAdmin
                    ? <th className='col-xs-2' ></th>
                    : ''
                }
              </tr>
            </thead>
            <tbody style={
              {
                // backgroundColor: "#cce4f2",
              }
            }>
              {
                props.apps.map((app, i) =>
                  <tr key={app.appId} className='row clickable' style={
                    {
                      background: i % 2 === 0 ? '#cce4f2' : 'transparent',
                    }
                  } onClick={() => window.ajaxify.go(`/application/${app.appId}`)}>
                    <td className='col-xs-1'>{app.appId}</td>
                    <td className='col-sm-3'>
                      {
                        app.characters[0].class
                          ? <img className='roster__class-icon'
                            src={`${publicPath}/${classIcons[app.characters[0].class.toLowerCase().replace(' ', '-')]}`}
                            alt={app.characters[0].class}></img>
                          : ''
                      }
                      <span className='hidden-xs'>{app.characters[0].name}</span>
                    </td>
                    <td className={authorClassName}>{app.author}</td>
                    <td className='col-xs-3 col-sm-2'>{appStatus[app.status]}</td>
                    <td className='col-xs-3 col-sm-2'>
                      <span title={new Date(app.changed).toString()}>{window.jQuery.timeago(app.changed)}</span>
                    </td>
                    {
                      props.isAdmin
                        ? <td className='col-xs-2' >
                          <RaisedButton
                            secondary={true}
                            label='Delete'
                            onClick={(e) => {
                              props.delete(app.appId);
                              e.stopPropagation();
                            }}
                          />
                        </td>
                        : ''
                    }
                  </tr>)
              }
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

const mapStateToProps = (state: State) => {
  const props: AppListProps = {
    apps: selectApplications(state),
    isAdmin: window.app.user.isAdmin
  };
  return props;
};

const mapDispatchToProps = (dispatch: any, ownProps: AppListProps) => {
  const props: AppListProps = bindActionCreators({
    delete: (appId: number) => {
      return {
        type: DELETE_APPLICATION,
        payload: {
          appId
        }
      };
    }
  }, dispatch);
  return props;
};

export const AppListContainer = connect(mapStateToProps, mapDispatchToProps)(AppList);
