import { AirplanemodeActive } from '@material-ui/icons';
import { create } from 'apisauce';

const api = create({
    headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    },
});

export const loginUser = () => api.post('/api/auth/login');

export default api;