import { lazy, React, Suspense } from 'react';

const CapitalHistoryList = lazy(() => import('./CapitalHistory/CapitalHistoryList'));
const CompaniesList = lazy(() => import('./Companies/CompaniesList'));

const PageList = {
    companies: {
        permission: '',
        path: '',
        component:CompaniesList,
    },
    capital: {
        permission: '',
        path: '',
        component:CapitalHistoryList,
    },
};

export default PageList;