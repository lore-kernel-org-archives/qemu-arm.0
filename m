Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp1051799njc;
        Wed, 26 Jun 2024 11:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPZB7qJmFnb7q0YFDX/lpQWOroUxM9sp+D5UjcP927T4ZVMwlU1bfyUI8EsH0vGuMZ20MjfjWLh3lcSErPq53gD0UQpVeT
X-Google-Smtp-Source: AGHT+IHGMaNogfeQcAux1v87CPnXZFKabzEhIu8gbC2umvnQA8A5GXcYGh9P7l5o6i2jkHq1QyBx
X-Received: by 2002:a5d:524f:0:b0:366:dee6:a9ea with SMTP id ffacd0b85a97d-3673cca439amr360019f8f.26.1719424885605;
        Wed, 26 Jun 2024 11:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719424885; cv=none;
        d=google.com; s=arc-20160816;
        b=OJO1lwTiBBaAOtqNR6KGiFeiF9LjCQOLzXkBjLtpclJCUKm7mcTbSU1VHFkWTpeBbJ
         h5SK6oxqHDrOiGt+8aPZr07rD9yxVWE7XRS7ZVGQ9/1917dllEacNsQx1rezEDsk0UB0
         2FLk7tJ8+OOUY9TANtx+WJhrXGbSuTyTF/ZYlTgb3T5HLW5b1zRTnz7lNyCfvBzEnvyw
         TNJKwPfChRbIp7XmSL8ykBxVS5Izaq5Xm9oqMf2c7tGwzHtfP6xTBy0OYeHvf3g7Oj/H
         jHtrWxEwfrZzrrfGkDlVN4cieZLRAyJ1bm0D/gaPSicOTYtqr54GYArrUmOzIWNwfDHC
         cNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=O2+7XQPvKpruLF2QOSJW+4uTR8US558fgJa4m82x4vk=;
        fh=OV3aMIo0Vng6dWYx4u1DBX2Lu/+rpQXTbkHiD5P80yw=;
        b=C4cspA+RP/M/eL2NxKRNwWL1IyvQHTsB24yXm0bl9LCYbbZeJfRStaX1IOnWcUXdRW
         tnOQ6BqeX4ociA0HJ4aHfIz9eRB/LYEwaCjGcPYU8/J3zdFTQ5mCjyMeX0Dx+PVfTNKY
         7mEtqVOvmrTJQl1MdVQ62BdpIjrDQYBckQplcCVoq30Ez4KFACoEG646Cr/gApF2AWN3
         perevKIhPIv2zT+pFzkRizxqr12/ijT8fenSgSCHk/ml78oNmzZLY6fmgsIPM3ylEfcl
         I/a024zjGIJj8lNZxYCh1UybbvyS+HNgQ3BmlwvR+3h9Ad/qesWOw7G690JijMvovrcm
         BpSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3666f5ec529si7003719f8f.184.2024.06.26.11.01.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2024 11:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W8TxB0ZSdz6K9LZ;
	Thu, 27 Jun 2024 01:59:42 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (unknown [7.191.162.67])
	by mail.maildlp.com (Postfix) with ESMTPS id C5C4E140A87;
	Thu, 27 Jun 2024 02:01:24 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 19:01:24 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Wed, 26 Jun 2024 19:01:24 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Topic: [PATCH RFC V3 00/29] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Index: AQHaveq2F6TAeAWelEWGVYAetyN5RLHZ0LIAgACXIUA=
Date: Wed, 26 Jun 2024 18:01:24 +0000
Message-ID: <e3668ef162b5428ba2422bb7607d20b4@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <3d4692d4-b802-4367-87f8-411a8a7b6b3f@amperemail.onmicrosoft.com>
In-Reply-To: <3d4692d4-b802-4367-87f8-411a8a7b6b3f@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.33.18]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: myJkHwtEz7fe

SGkgVmlzaG51LA0KIA0KPiBGcm9tOiBWaXNobnUgUGFqanVyaSA8dmlzaG51QGFtcGVyZW1haWwu
b25taWNyb3NvZnQuY29tPiANCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI2LCAyMDI0IDEwOjUz
IEFNDQo+IFRvOiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgbXN0QHJlZGhhdC5jb20NCj4gDQo+
IEhpIFNhbGlsLA0KPiBPbiAxNC0wNi0yMDI0IDA1OjA2LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4g
UFJPTE9HVUUNCj4gPT09PT09PT0NCj4gDQo+IFRvIGFzc2lzdCBpbiByZXZpZXcgYW5kIHNldCB0
aGUgcmlnaHQgZXhwZWN0YXRpb25zIGZyb20gdGhpcyBSRkMsIHBsZWFzZSBmaXJzdA0KPiByZWFk
IHRoZSBzZWN0aW9ucyAqQVBQRU5ERUQgQVQgVEhFIEVORCogb2YgdGhpcyBjb3ZlciBsZXR0ZXI6
DQo+IA0KPiAxLiBJbXBvcnRhbnQgKkRJU0NMQUlNRVIqIFtTZWN0aW9uIChYKV0NCj4gMi4gV29y
ayBwcmVzZW50ZWQgYXQgS1ZNRm9ydW0gQ29uZmVyZW5jZSAoc2xpZGVzIGF2YWlsYWJsZSkgW1Nl
Y3Rpb24gKFYpRl0NCj4gMy4gT3JnYW5pemF0aW9uIG9mIHBhdGNoZXMgW1NlY3Rpb24gKFhJKV0N
Cj4gNC4gUmVmZXJlbmNlcyBbU2VjdGlvbiAoWElJKV0NCj4gNS4gRGV0YWlsZWQgVE9ETyBsaXN0
IG9mIGxlZnRvdmVyIHdvcmsgb3Igd29yay1pbi1wcm9ncmVzcyBbU2VjdGlvbiAoSVgpXQ0KPiAN
Cj4gVGhlcmUgaGFzIGJlZW4gaW50ZXJlc3Qgc2hvd24gYnkgb3RoZXIgb3JnYW5pemF0aW9ucyBp
biBhZGFwdGluZyB0aGlzIHNlcmllcw0KPiBmb3IgdGhlaXIgYXJjaGl0ZWN0dXJlLiBIZW5jZSwg
UkZDIFYyIFsyMV0gaGFzIGJlZW4gc3BsaXQgaW50byBhcmNoaXRlY3R1cmUNCj4gKmFnbm9zdGlj
KiBbMjJdIGFuZCAqc3BlY2lmaWMqIHBhdGNoIHNldHMuDQo+IA0KPiBUaGlzIGlzIGFuIEFSTSBh
cmNoaXRlY3R1cmUtc3BlY2lmaWMgcGF0Y2ggc2V0IGNhcnZlZCBvdXQgb2YgUkZDIFYyLiBQbGVh
c2UNCj4gY2hlY2sgc2VjdGlvbiAoWEkpQiBmb3IgZGV0YWlscyBvZiBhcmNoaXRlY3R1cmUgYWdu
b3N0aWMgcGF0Y2hlcy4NCj4gDQo+IFNFQ1RJT05TIFtJIC0gWElJSV0gYXJlIGFzIGZvbGxvd3M6
DQo+IA0KPiAoSSkgS2V5IENoYW5nZXMgW2RldGFpbHMgaW4gbGFzdCBzZWN0aW9uIChYSVYpXQ0K
PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBS
RkMgVjIgLT4gUkZDIFYzDQo+IA0KPiAxLiBTcGxpdCBpbnRvIEFyY2hpdGVjdHVyZSAqYWdub3N0
aWMqIChWMTMpIFsyMl0gYW5kICpzcGVjaWZpYyogKFJGQyBWMykgcGF0Y2ggc2V0cy4NCj4gMi4g
QWRkcmVzc2VkIGNvbW1lbnRzIGJ5IEdhdmluIFNoYW4gKFJlZEhhdCksIFNoYW9xaW4gSHVhbmcg
KFJlZEhhdCksIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIChMaW5hcm8pLA0KPiA+IEpvbmF0aGFu
IENhbWVyb24gKEh1YXdlaSksIFpoYW8gTGl1IChJbnRlbCkuDQo+IEkgdHJpZWQgZm9sbG93aW5n
IHRlc3QgY2FzZXMgd2l0aCByZmMtdjMgYW5kIGtlcm5lbCBwYXRjaGVzIHYxMCwgYW5kIGl0J3Mg
bG9va2luZyBnb29kIG9uIEFtcGVyZSBwbGF0Zm9ybXMuDQo+IOKAoiBSZWd1bGFyIGhvdHBsdWcg
YW5kIGhvdCB1bnBsdWcgdGVzdHMNCj4g4oCiIExpdmUgbWlncmF0aW9uIHdpdGggYW5kIHdpdGgg
b3V0IGhvdC1wbHVnZ2luZyB2Y3B1cyB0ZXN0cw0KPiBQbGVhc2UgZmVlbCBmcmVlIHRvIGFkZCwN
Cj4gVGVzdGVkLWJ5OiBWaXNobnUgUGFqanVyaSBtYWlsdG86dmlzaG51QG9zLmFtcGVyZWNvbXB1
dGluZy5jb20NCg0KDQpNYW55IHRoYW5rcyBmb3IgdGVzdGluZyBhbmQgY29uZmlybWluZyB0aGUg
ZnVuY3Rpb25hbGl0eS4gUmVhbGx5IGFwcHJlY2lhdGUgdGhpcyENCg0KQmVzdA0KU2FsaWwuDQoN
Cg0KPiANCj4gUmVnYXJkcywNCj4gLVZpc2hudS4NCj4gDQo+IFJGQyBWMSAtPiBSRkMgVjINCj4g
DQo=
