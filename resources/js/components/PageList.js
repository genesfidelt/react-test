import { lazy, React, Suspense } from 'react';

const CapitalHistoryList = lazy(() => import('./CapitalHistory/CapitalHistoryList'));
const CompaniesList = lazy(() => import('./Companies/CompaniesList'));
const Settings = lazy(() => import('./Settings/SettingsForm'));

const PageList = {
    companies: {
        label: '',
        permission: '',
        path: '',
        component:CompaniesList,
    },
    capital: {
        label: '',
        permission: '',
        path: '',
        component:CapitalHistoryList,
    },
    settings: {
        label: '',
        permission: '',
        path: '',
        component:Settings,
    },
};

export default PageList;