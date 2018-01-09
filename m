Received: by 10.28.173.206 with SMTP id w197csp3086129wme;
        Mon, 8 Jan 2018 16:24:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBoufVxwjb2YtwNb7tJgO/omoAdYz/4L50MDSiTjdFgCrfthoaTGQUTSgs9RyZrfpp6wwmjtt
X-Received: by 10.37.45.28 with SMTP id t28mr12856849ybt.200.1515457486611;
        Mon, 08 Jan 2018 16:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515457486; cv=none;
        d=google.com; s=arc-20160816;
        b=KKVVgZuh9mTacTNMNVVvuW/LevZfy0kd0Y2fDsKo7XQipgjlQNmKOMigHXpFKRoZ4q
         Ec2kOUXh/emWjWZLPMicoGtAGuY5+ALIeKQBY5DL4fVrqLkExLpMs90BYWUoAMi5Y6cO
         Ayfu1fV3khm7RTMBx3vOeItSyX45DmWvJT65VGJiT9VXZkf5pH3vqbhzsbabTnUiKCND
         xf068MYbv6DMtHhPVnVRJsVukgOa6yCBXFn9wQFs0mokuMQew//OvYHnPmyGoAt+sjGr
         CzH+QDFYtVN9TRrRLbZmL/pEJoBEcfD8Un3gAX2waGMhMgy4XesseWmjvypEYSLTU2rC
         HDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=IARoz3TL8qFWHVjbZqWgAKmgEriSwY2x6nRF9vapMbQ=;
        b=HBOvaCl9CfVN6crCeVkH/pzyizku2lo/RkUNt9z/TerLe3gVZ2vP00qn+CmUrAiJR+
         rN/zFDEdzEihCW4Sb6uuQv0+lzg6/OxLkRXo3ITYv6zExjI2EgAY6Al7N+SlDvTKET4O
         OEGBHu7KK2iq3/8/4sx9I5iSUQp0UqJZsteP++0KzUtXXH+7frE6UDWXZpb+n6wSHG9e
         a2/losBVVxv5o+MfuRmkFbUVIv+NCn2Fim3RlwUVnOjCt+jgnfF8qxZyMRVlxTf5dbLV
         nZW4b4Cx4mAE2HzF37ynHWWvJFVbAdwZMbKtO6juChGqcUPVzsCETHAS2iOxoaYQl2An
         C6ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=UNvaWZUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11si2683367ywh.235.2018.01.08.16.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 16:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=UNvaWZUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYhig-00086w-1Z
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 19:24:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1eYhiV-00085H-A3
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 19:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1eYhiU-0002wn-G1
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 19:24:35 -0500
Received: from mail-by2nam01on0112.outbound.protection.outlook.com
	([104.47.34.112]:2512
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1eYhiO-0002tF-D7; Mon, 08 Jan 2018 19:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=IARoz3TL8qFWHVjbZqWgAKmgEriSwY2x6nRF9vapMbQ=;
	b=UNvaWZUkRH0MtNgp/PBmiJQ/NZDM5gFqGDtkNJo9c8lNZbcnYmY+EwAyTiNv/wgiO5MHlJZpITRIPW+2J2eCqoe3jVz2jwOXkRHZXZ8SigFBiryo+uQX18Sj9AbwIUBx4VbYM+WEbrEP2RUmCv4y3Qc8MwlNnKZXVuZOftM4yxg=
Received: from CY4PR21MB0469.namprd21.prod.outlook.com (10.172.121.147) by
	CY4PR21MB0822.namprd21.prod.outlook.com (10.173.192.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.407.2; Tue, 9 Jan 2018 00:24:24 +0000
Received: from CY4PR21MB0469.namprd21.prod.outlook.com ([10.172.121.147]) by
	CY4PR21MB0469.namprd21.prod.outlook.com ([10.172.121.147]) with mapi id
	15.20.0428.002; Tue, 9 Jan 2018 00:24:24 +0000
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "Alistair
	Francis" <alistair.francis@xilinx.com>, "Edgar E . Iglesias"
	<edgar.iglesias@xilinx.com>, Peter Maydell <peter.maydell@linaro.org>, 
	"Andrey Smirnov" <andrew.smirnov@gmail.com>,
	=?utf-8?B?R3LDqWdvcnkgRXN0cmFkZSBncmVnb3J5IC4gZXN0cmFkZSBAIGdtYWlsIC4g?=
	=?utf-8?Q?com_Clement_Deschamps?= <clement.deschamps@antfield.fr>, "Ashok
	kumar" <ashoks@broadcom.com>
Thread-Topic: [PATCH v3 33/42] hw/arm/bcm2835_peripherals: implement SDHCI
	Spec v3
Thread-Index: AQHTgM2lWbyQR8bQFEiAg/fy4R9lF6NqvjPQ
Date: Tue, 9 Jan 2018 00:24:24 +0000
Message-ID: <CY4PR21MB04692645342E2571EF5FA87F9E100@CY4PR21MB0469.namprd21.prod.outlook.com>
References: <20171229174933.1781-1-f4bug@amsat.org>
	<20171229174933.1781-34-f4bug@amsat.org>
In-Reply-To: <20171229174933.1781-34-f4bug@amsat.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-01-09T00:24:20.8951435Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:5::690]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR21MB0822;
	7:iQ6KLkr/4CjefgV+21QZpQwn/PAnWMjCDAy67TO5TQUxQOW15/wcDp/tQGrZUwbdGZxacRTOULe5LWGeM/mjMQHP/SIGxtqZRjDava2J+fSOsfvNWo5k1NPwHzRWl6lofidSVy1ixODiUY7oWAOGXwftRZ4p6rMNZ9KSPk/IEieoZbU+qU/s70yMJm6PApHPesXlc3f3O/BOr8IoqsgGhsWo/rVIz/CKCyFfEvOAngMZMJGNjintT2OI2JxB+D3g
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: e1be1176-95cd-417b-28e1-08d556f75650
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020040)(4652020)(4534070)(4602075)(4627166)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(48565401081)(2017052603307)(7193020);
	SRVR:CY4PR21MB0822; 
x-ms-traffictypediagnostic: CY4PR21MB0822:
x-microsoft-antispam-prvs: <CY4PR21MB08227BC0A2DDDE8F694158EA9E100@CY4PR21MB0822.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(6040470)(2401047)(5005006)(8121501046)(3002001)(3231023)(944501104)(10201501046)(93006095)(93001095)(6055026)(61426038)(61427038)(6041268)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR21MB0822; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR21MB0822; 
x-forefront-prvs: 0547116B72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(39860400002)(346002)(396003)(39380400002)(199004)(189003)(229853002)(106356001)(2906002)(5660300001)(2950100002)(6116002)(102836004)(72206003)(22452003)(14454004)(6246003)(110136005)(54906003)(4326008)(7696005)(59450400001)(99286004)(2900100001)(6436002)(478600001)(15760500003)(76176011)(81166006)(6506007)(25786009)(86612001)(8656006)(105586002)(10290500003)(9686003)(316002)(86362001)(8666007)(77096006)(53936002)(39060400002)(7416002)(305945005)(7736002)(10090500001)(3280700002)(97736004)(8990500004)(8936002)(68736007)(3660700001)(8676002)(33656002)(55016002)(74316002)(81156014)(6346003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0822;
	H:CY4PR21MB0469.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-message-info: sx9EyFZxAC2DIICyKTLHigyf4U/39ynlX6rCKLsa8Q0Hm+kM98uII7cqAZPLZxAJ4G/ifc6gk3ZXSfPPHINtkA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1be1176-95cd-417b-28e1-08d556f75650
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2018 00:24:24.6867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0822
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.112
Subject: Re: [Qemu-arm] [PATCH v3 33/42] hw/arm/bcm2835_peripherals:
 implement SDHCI Spec v3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mmBNY1YFMrR2

PiBGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSBbbWFpbHRvOnBoaWxpcHBlLm1hdGhpZXUu
ZGF1ZGVAZ21haWwuY29tXQ0KPiBTZW50OiBGcmlkYXksIDI5IERlY2VtYmVyIDIwMTcgMDk6NDkN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNh
dC5vcmc+DQo+IC0tLQ0KPiANCj4gTm90ZSwgdGhlIGJjbTI4MzUgc2VlbXMgdG8gaGF2ZSAxS0Ig
bWluaW11bSBibG9ja3NpemUsIGhvd2V2ZXIgdGhlDQo+IGN1cnJlbnQNCj4gbW9kZWwgaXMgaW1w
bGVtZW50ZWQgd2l0aCA1MTJCLg0KPiANCj4gQ2FuIHNvbWVvbmUgd2l0aCBhY2Nlc3MgdG8gdGhl
IGRhdGFzaGVldHMgdmVyaWZ5Pw0KDQpUaGUgcHVibGljIEJDTTI4MzUgcGVyaXBoZXJhbHMgZGF0
YXNoZWV0IHNheXM6DQogICJUaGUgRU1NQyBtb2R1bGUgcmVzdHJpY3RzIHRoZSBtYXhpbXVtIGJs
b2NrIHNpemUgdG8gdGhlIHNpemUgb2YgdGhlIGludGVybmFsIGRhdGEgRklGTw0KICB3aGljaCBp
cyAxayBieXRlcy4iDQouLi4gc28gSSB0aGluayB5b3VyIHBhdGNoIGlzIGNvcnJlY3QuDQoNCkFu
ZHJldw0K
