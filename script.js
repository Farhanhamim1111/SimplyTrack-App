const addActivityBtn = document.getElementById('addActivityBtn');
const modal = document.getElementById('modal');
const closeBtn = document.getElementById('closeBtn');
const addBtn = document.getElementById('addBtn');

const settingsBtn = document.getElementById('settingsBtn');
const settingsModal = document.getElementById('settingsModal');
const closeSettingsBtn = document.getElementById('closeSettingsBtn');
const themeSelect = document.getElementById('themeSelect');

const activityListContainer = document.getElementById('activityListContainer');
const currentActivityDiv = document.getElementById('currentActivity');

let activities = [];

// Show Add Activity Modal
addActivityBtn.addEventListener('click', () => {
    modal.classList.remove('hidden');
});

// Close Add Activity Modal
closeBtn.addEventListener('click', () => {
    modal.classList.add('hidden');
});

// Add Activity
addBtn.addEventListener('click', () => {
    const title = document.getElementById('title').value;
    const description = document.getElementById('description').value;
    const startTime = document.getElementById('startTime').value;
    const endTime = document.getElementById('endTime').value;
    const repeat = document.getElementById('repeat').checked;
    const repeater = document.getElementById('repeater').value;

    if(title && startTime && endTime){
        const activity = {
            title,
            description,
            firstTimeChoice: startTime,
            secondTimeChoice: endTime,
            wantFrequency: repeat,
            repeater
        };
        activities.push(activity);
        renderActivities();
        modal.classList.add('hidden');
    }
});

// Render Activities
function renderActivities(){
    activityListContainer.innerHTML = '';
    const now = new Date();
    let currentActivity = null;

    activities.forEach(a => {
        const start = parseTime(a.firstTimeChoice);
        const end = parseTime(a.secondTimeChoice);
        if(start <= now && now <= end && !currentActivity){
            currentActivity = a;
        }

        const div = document.createElement('div');
        div.className = 'activity';
        div.innerHTML = `<b>${a.title}</b><br>${a.description}<br>${a.firstTimeChoice} - ${a.secondTimeChoice}`;
        activityListContainer.appendChild(div);
    });

    if(currentActivity){
        currentActivityDiv.innerHTML = `<p>Current Activity: <b>${currentActivity.title}</b><br>${currentActivity.firstTimeChoice} - ${currentActivity.secondTimeChoice}</p>`;
    } else {
        currentActivityDiv.innerHTML = '<p>No activity right now.</p>';
    }
}

// Convert HH:MM to Date object today
function parseTime(timeStr){
    const [hours, minutes] = timeStr.split(':').map(Number);
    const date = new Date();
    date.setHours(hours, minutes, 0, 0);
    return date;
}

// Update current activity every minute
setInterval(renderActivities, 60000);

// Settings Modal
settingsBtn.addEventListener('click', () => {
    settingsModal.classList.remove('hidden');
});

closeSettingsBtn.addEventListener('click', () => {
    settingsModal.classList.add('hidden');
});

themeSelect.addEventListener('change', () => {
    const theme = themeSelect.value;
    if(theme === 'light'){
        document.documentElement.style.setProperty('--bg-color','#f0f0f0');
        document.documentElement.style.setProperty('--text-color','#000');
    } else if(theme === 'dark'){
        document.documentElement.style.setProperty('--bg-color','#121212');
        document.documentElement.style.setProperty('--text-color','#fff');
    } else {
        document.documentElement.style.removeProperty('--bg-color');
        document.documentElement.style.removeProperty('--text-color');
    }
});
