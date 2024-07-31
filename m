Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp324070njb;
        Wed, 31 Jul 2024 05:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPazLlCncsVGZpiQvMYWbsZ6VvOGtO8uThbc5gCE7jG5p5rrzXBmE3xiWUFFlaFha0fPuWFAxMF6UBOH/xWrVIsbqGVbiT
X-Google-Smtp-Source: AGHT+IHfhuBxTQl1WRtJdVczlnvTnUp/QZ3yiHbBraTGipGUo4bVHTt/EBoV4PBjhSoCE8UwZrAZ
X-Received: by 2002:a2e:a4b8:0:b0:2ef:185d:e3e2 with SMTP id 38308e7fff4ca-2f12ee422b8mr88294881fa.36.1722429175941;
        Wed, 31 Jul 2024 05:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722429175; cv=none;
        d=google.com; s=arc-20160816;
        b=uifMIuwPMRirCYgTNRoFGqOds4YBre1OJhvzZM7OYPVjc+SLCLnKsNHiWyG8E4Fwfj
         jKTdJ+aghpnjfiKKM8K+7p0YIStR9N0LdO+spFuI3WLs6xA4Gykp2cbGaUrKIkQOvYIE
         LG0WZCGzMb0netIA47cgfAnpuz1XqkuXAqWPNAeXfwMzZqW4oAhVZyKZMy6Nih+uNEtf
         KpJzlJuixjGSPeLT+/wpxPSOIk1N/ya03KYgUlWsLv5OqGIkJtk+s4PnyI+V38/TB6lg
         SM/9eiPFwmAnH4GE9/IPksYjn1lR4SVDtdYSdnuaLeunB8oI6s0a6cnQK6iRRjwnf0v+
         31Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=pgmQ1ZntfQOtDfboT/0UEpqjz+3LbKcSND8F7rFy9+Q=;
        fh=zeSUOGPNFnVyw29Gjalp8NvGRfJuTqv813gxO1vXSeQ=;
        b=pomu49py3Br9qct0rm5LKWL4M2Sv7aAkWAWbS6BVypTL/NPmvVEZIfmUene2dHt54X
         ymavlxmlHJMuvm2KebjxXWiT/khDKDL/aPWT51yZynp6rwCgW58RQLHtuJ3OS2V/HfTV
         dd/em7niYudX84J245FGzKBhU4csSHC0nNOmB/a8mMzOKctpcFTGRDpwKQP/+Eszgiz2
         FwsCGGb/IK3Jboi/BnPjMqJY4OSycAPigFI4S8W6oLwm+UMnVycWaDOd3DvR7jJIEX5P
         y1IY7JY2Y+bU8lTFwHXudH7xQu5dZdWWEN/ePydZw+UXIaHtBPXbtlA27KdtoCW2/rdh
         aG5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4282b89ec8fsi6987335e9.11.2024.07.31.05.32.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2024 05:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WYrzh5BpZz6K5Xy;
	Wed, 31 Jul 2024 20:30:56 +0800 (CST)
Received: from lhrpeml500003.china.huawei.com (unknown [7.191.162.67])
	by mail.maildlp.com (Postfix) with ESMTPS id CFA1714065C;
	Wed, 31 Jul 2024 20:32:54 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 13:32:54 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Wed, 31 Jul 2024 13:32:54 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
	<mtsirkin@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
	<mst@redhat.com>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com"
	<harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark
 logic
Thread-Topic: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU
 unpark logic
Thread-Index: AQHa3qJBk0Exld31N0eXTFVI7pTjNrIIr9WAgAffXcCAAB9RAIAAH4Ig
Date: Wed, 31 Jul 2024 12:32:54 +0000
Message-ID: <b389af46566a4eb69f19dc9d81de43b3@huawei.com>
References: <20240725145132.99355-1-salil.mehta@huawei.com>
 <20240726113355.731e61fe@imammedo.users.ipa.redhat.com>
 <ae5fa879bb7d416b92face2dcf9045fd@huawei.com>
 <CAFEAcA-MrfFiJcrKabz2MYiu6VHju6+yUAeeLB7MBrT-0tAWCw@mail.gmail.com>
In-Reply-To: <CAFEAcA-MrfFiJcrKabz2MYiu6VHju6+yUAeeLB7MBrT-0tAWCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.35.90]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: W6VTtqRpknyX

PiAgRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiAgU2Vu
dDogV2VkbmVzZGF5LCBKdWx5IDMxLCAyMDI0IDEyOjM5IFBNDQo+ICBUbzogU2FsaWwgTWVodGEg
PHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ICANCj4gIE9uIFdlZCwgMzEgSnVsIDIwMjQgYXQg
MDk6NDksIFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPiB3cm90ZToNCj4gID4N
Cj4gID4gSGVsbG8sDQo+ICA+DQo+ICA+IEEgcXVpY2sgY2hlY2sgYW5kIGEgZ2VudGxlIHJlbWlu
ZGVyLCBoYXMgdGhpcyBwYXRjaCBiZWVuIGFjY2VwdGVkPw0KPiAgDQo+ICBUaGFua3MgZm9yIHRo
ZSBwaW5nLiBJJ20gZG9pbmcgYSB0YXJnZXQtYXJtIHB1bGxyZXEgdG9tb3Jyb3cgc28gSSdsbCB0
YWtlIGl0IHZpYQ0KPiAgbXkgcXVldWUuDQoNCkdyZWF0LiBUaGFua3MhDQoNCkJlc3QgcmVnYXJk
cw0KU2FsaWwuDQoNCj4gIA0KPiAgLS0gUE1NDQo=
