import { lazy } from 'react';

const CapitalHistoryList = lazy(() => import('./CapitalHistory/CapitalHistoryList'));
const CompaniesList = lazy(() => import('./Companies/CompaniesList'));
const Settings = lazy(() => import('./Settings/SettingsForm'));

const PageList = {
    companies: {
        label: 'Companies',
        id: 'companies',
        permission: '4',
        path: '',
        component:CompaniesList,
    },
    capital: {
        label: 'Capital',
        id: 'capital',
        permission: '1',
        path: '',
        component:CapitalHistoryList,
    },
    settings: {
        label: 'Settings',
        id: 'settings',
        permission: '4',
        path: '',
        component:Settings,
    },
};

export default PageList;