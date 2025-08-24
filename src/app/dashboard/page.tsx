export default function DashboardPage() {
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-7xl mx-auto">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">IT-DMS Dashboard</h1>
          <p className="text-gray-600 mt-2">Welcome to your IT Department Management System</p>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <div className="card">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Total Assets</h3>
            <p className="text-3xl font-bold text-primary-600">0</p>
          </div>
          
          <div className="card">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Active Incidents</h3>
            <p className="text-3xl font-bold text-warning-600">0</p>
          </div>
          
          <div className="card">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Pending Requisitions</h3>
            <p className="text-3xl font-bold text-info-600">0</p>
          </div>
          
          <div className="card">
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Employees</h3>
            <p className="text-3xl font-bold text-success-600">0</p>
          </div>
        </div>
        
        <div className="card">
          <h2 className="text-xl font-semibold text-gray-900 mb-4">Quick Actions</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <button className="btn-primary">
              Add New Asset
            </button>
            <button className="btn-secondary">
              Create Requisition
            </button>
            <button className="btn-secondary">
              Report Incident
            </button>
          </div>
        </div>
      </div>
    </div>
  );
} 