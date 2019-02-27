Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp12553075wrx;
        Wed, 27 Feb 2019 10:30:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZBVrR4cZkKW+RRT52p2yhiBaD/b7yijZhyuDItQWg47KzwHofvQogCriLi0e2veBZ31GzC
X-Received: by 2002:a81:60c4:: with SMTP id u187mr2309105ywb.345.1551292254279;
        Wed, 27 Feb 2019 10:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551292254; cv=none;
        d=google.com; s=arc-20160816;
        b=dOXcK5ABWTQC+cmjbqvz21+RNJQ+CeniT8NlGrcOritjNQb3kyxZOIectuFH71MSpc
         BAmcuc0rfE3rDlXmAq+xgygrWx13fSLuz2EPHNqwodEC8DIcfIacZrvVFsgJ3jZjF3xO
         PcRCN54/e513I/qbmc4bEy4JRb7U01lk3+Bbd5+He/JBIPEtStBFx4QZEMi/kisoWmxZ
         dRWTCHkCH1YOOzznyf6oVJCSUqVSAFpfdsfYDkT7cur3ffmHETeZ+NIeNulS4SnGj/Bh
         iJAG9ZZaF/j6GAk17j5fZjzIDNogivKfQdOP+frW2B4fQ84gG5DQ+AdBRw/tPTpBGhML
         Gcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:dkim-signature;
        bh=va9L2tU9s2TNY4NOB2xXa42M4hL7nJdZZmnvso2b9v4=;
        b=qElJI344r+j9kZ1X4rXMgWy8VdDzK+GCx7mZ0dbFgBsYNcaXZB2YtHanbrW/coCBnS
         /v7GwIWvX16iP+v37W/hpn+GZJwRTquxQSAdKqqgUNcdRqHSLssG9siQY9lXkWzEM3cE
         g7yIp2Wr4jskvTr3ZDOucdVAqbQIDckrImi+iWDNlcUNEd8+8fQNfvGyCafYkoIRYvMK
         8VpL3rjBVJj+wKl0KuON4WTcYiO0YiWy3C9ZCCwJN/qJlZfc5l0UDUPdyhqXsABrUrHt
         JONS1/lNYHnDSJm504jjD0MOws0i0nui6lqIOrDrijYWt4aOb/OabrBGAjBjUMlp5gUO
         70Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=ixAfzgff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si9049349ybk.359.2019.02.27.10.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 10:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=ixAfzgff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:48891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gz3yn-0005xh-Nj
	for alex.bennee@linaro.org; Wed, 27 Feb 2019 13:30:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gz3yB-0005cu-Ap
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 13:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gz3yA-00038s-Ge
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 13:30:15 -0500
Received: from mail-eopbgr780100.outbound.protection.outlook.com
	([40.107.78.100]:17728
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1gz3y9-000377-W0; Wed, 27 Feb 2019 13:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=va9L2tU9s2TNY4NOB2xXa42M4hL7nJdZZmnvso2b9v4=;
	b=ixAfzgffdVLgRrEGC0Xhpx6LXuAfHOaMt/D3FET6XNM7NvzP653UwGMfoZSlZ3ETfLhRl98zS6OhIMrXbYrB5YzzFRhkOGFgH8mVDLB3TsO+ViMuhdiHlsQtJ/BxP+LM2g4Qh73Fh9sMR6zgi3NOcX3bdBNRrxIH+TaWQl5fj1I=
Received: from BN6PR21MB0785.namprd21.prod.outlook.com (10.175.131.19) by
	BN6PR21MB0785.namprd21.prod.outlook.com (10.175.131.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.2; Wed, 27 Feb 2019 18:30:10 +0000
Received: from BN6PR21MB0785.namprd21.prod.outlook.com
	([fe80::352d:19a5:2127:47db]) by
	BN6PR21MB0785.namprd21.prod.outlook.com
	([fe80::352d:19a5:2127:47db%9]) with mapi id 15.20.1686.004;
	Wed, 27 Feb 2019 18:30:10 +0000
To: bzt <bztemail@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH] Added periodic IRQ support for bcm2836_control local
	timer
Thread-Index: AQHUzcfSvKzO+BpATkmmcANei0i4C6XyAREAgAGJvwCAAGwU4A==
Date: Wed, 27 Feb 2019 18:30:10 +0000
Message-ID: <BN6PR21MB0785CB5DAEB34BB0F1C465E09E740@BN6PR21MB0785.namprd21.prod.outlook.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9G73yrRvj3AdyxAi2uUBH9GPPerwi7y38oMDKw8F0B=A@mail.gmail.com>
	<CADYoBw2pm=j8QejJyC17MNye==gcyM1TgG=jN+0nGjgYJ0qkFQ@mail.gmail.com>
In-Reply-To: <CADYoBw2pm=j8QejJyC17MNye==gcyM1TgG=jN+0nGjgYJ0qkFQ@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:4898:80e8:8:c113:981:13c3:70e2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf2e4704-df24-4b33-fb8b-08d69ce19b35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BN6PR21MB0785; 
x-ms-traffictypediagnostic: BN6PR21MB0785:
x-o365-sonar-daas-pilot: True
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjIxTUIwNzg1OzIzOldUc1hHemZvWUxjTHprVGNQc3NHOEViblcw?=
	=?utf-8?B?Y1hSRGE3bFRZOEZUd1hMdjZzVXA4Q241VjdZd00ybWQ0d3RCUVFodGk0bHo0?=
	=?utf-8?B?RXQrRGxwTk0wNXljbmZ5UWVUUjBWZGtXMWVMK3BDQ05mM05XdTNFN3RKMTYx?=
	=?utf-8?B?QUw4TkZ4T1k5VEoyakZoL0U4V2Q2QXRpNFM4M2JTdXVzVHZlM1U0VmVYYVYx?=
	=?utf-8?B?TXoxZzc2U2ZmR1VzUUp5VGRhekNmK2lKTlkybUlCVHY3S0xtMmE1NTJBQ3oz?=
	=?utf-8?B?Z1hnMERXRzdFSVoxYmpoeDV4MmpTZzQySFB3czJFbC9GUStONmRhL2JtZk8v?=
	=?utf-8?B?N29BbE5EM0R1dDlvSUdRNTNHWFpqUUNFOHdsajBqNi82QXVFd1RxZldRM0lo?=
	=?utf-8?B?MnNFdFR5S3hoWDV1UEVkZEhVT3docG5NVmhST25BcHZhUVJGcmJLcHRpT1Y4?=
	=?utf-8?B?Z3M0ZnduTWQ0N1pHcytmVy9HZ0RVdE5ESksybmlLS1VRNFBoZCs2dTNDaG50?=
	=?utf-8?B?cmgrWDJlcDN0Z3lwNjROTFdpaDVVWGJWaFQ4NlVHckhtWHpKWmRpMzlIdStH?=
	=?utf-8?B?UzFqNjA4OGtPbFlzM2VNUjcxS3FyYU9BcUJtWktpenNyQWZnc0NlMjN1ZWhQ?=
	=?utf-8?B?eFNMa0M5N0RKMEVlZytpMGM1N0hVLzV0K0VBZWtnMUFNVlIxNTZQZGFRVkJy?=
	=?utf-8?B?UjBENWtUVS9MQmU4bTd2cHhPaHJiNDMya25uOVZtTXJRaGdxdE5zb2Z0YVUv?=
	=?utf-8?B?SGpFOU91NVoxemtIRFcrRzV4SUZxSDlvWGJlSHJEeDcxVGpSQnBjempXbkxV?=
	=?utf-8?B?S2Zzc1BIcTRWeVVtSjR2bkY0elZ4bFZ4Sjl3bitqMG9od2J3Yk11QVNMWHVx?=
	=?utf-8?B?MVV5aWdIRlZxRjdteWdLU1l0SU5JTDh3VjBNSVRPVmtVTFpXcXJyeDRqL3J2?=
	=?utf-8?B?MUhtUXRLT09kcmlxdnpodTJuc2ZIWUdEczJvNXo2bkxoWWl4VTliUXptYlFz?=
	=?utf-8?B?ZTM3Q0taeEF0MXo5ZjZkZERDSnhlTDZ1bFlONU5rcktQZnpScDk4WGNvM2Fa?=
	=?utf-8?B?RVpyR0pTMFFncDcrdnQ3dGJ5d1cwVHk0Y0dHWVFxL3VPbldBUElZT2xIZmhq?=
	=?utf-8?B?SXZEbnNVTUw1dlVWV2tGUmhTRXFNUDhuOTdSUy9KOFhhdk04WUV1L2Y5M1pD?=
	=?utf-8?B?UkgvczVuMDl1bm43ZWpXRmFWYmtLbjN3WGJwbVpoUFBMZVIvdGVCUXV6UmZI?=
	=?utf-8?B?dUZ0VndGLzZncVlJOFpsK0N2UWcxekk5QzkvenFCaTMxZ1hZVGFwVVpXNVBW?=
	=?utf-8?B?NVJTT05pckRBQ01Ub1dmeTBLUWRGajZzVWNzOUNFNWJQcHc4eHFveG51dE12?=
	=?utf-8?B?N1ZxRDRLT0Q2N1VHTVVYTlR3U3lSSno3Z1RjNU4xc3B2WEZHWkVIYjQzaU15?=
	=?utf-8?B?OUxmdCt4TFQva1grQS9iTVNoWjg1VlVMQjN3S1I0UkNUaW1uVXlkUWtKNEdN?=
	=?utf-8?B?TXZxUzdLWStuRDJrcWhZZHZHUEJiaWdXZkhOVmZDckxQZGppbld3Y05MY3BE?=
	=?utf-8?B?cys3Y1dhbGVxVVNUaUtkbFRMQ1o3MXM1OW9QNWt6MHpSdHZuYjdvMFNPY0VR?=
	=?utf-8?B?aFNSNk51UDMzZi9Rd0NFOWI2MWdhci9IeUdyMHV6dmo2eUFvZnoxNGVjd3RQ?=
	=?utf-8?B?VDhiMUZ3NEhCZHMzeDQ5a0JBNXNSdmg5SDdQaFZoZWRQWXk5aURXQ2JVUE1h?=
	=?utf-8?B?OVhldmpELytNV0I2SEZoZmNmZnN4OHczWFFwSGdKRnhPcnE4bEtNUGZWZ09Y?=
	=?utf-8?Q?o1Jtg8xIKZ81j?=
x-microsoft-antispam-prvs: <BN6PR21MB0785BD20629F73B21251D5519E740@BN6PR21MB0785.namprd21.prod.outlook.com>
x-forefront-prvs: 0961DF5286
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(136003)(39860400002)(366004)(199004)(189003)(11346002)(7736002)(102836004)(71190400001)(10090500001)(110136005)(2906002)(446003)(74316002)(305945005)(54906003)(53936002)(4326008)(25786009)(55016002)(33656002)(46003)(486006)(476003)(6116002)(9686003)(68736007)(6246003)(10290500003)(106356001)(105586002)(478600001)(8676002)(14454004)(8936002)(81166006)(81156014)(186003)(316002)(22452003)(229853002)(6436002)(52536013)(8990500004)(6346003)(72206003)(86362001)(256004)(7696005)(97736004)(76176011)(86612001)(5660300002)(6506007)(99286004)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR21MB0785;
	H:BN6PR21MB0785.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IfRE66PmzdscvkSJfAEx7aVsJvV5EdD17KyT52w6PrYRMRWa0ZKN/CacAaYY+8ABgAX45D5qWFXIAuxTK2eXi94rqWtcO4Aj3derqbTjqPt89qYVDBd9nCKL8E1m2SgE4TvdyF2k1JY+cRj9RBiQCAqELzbEneG9LrPrm8PDDGFzZgXQ0B9Qeu4rH0jxxCqTuw37k2gMdQv342AtPcir55/dSF48M9oHSocFSpvU7rr6k2pBOeR0UeSlskdZu2/rdGIfkZH+0gFMKsNtxbZQfILEa4i1Dn5td7mFrcr4ZMR6nHoMOe3eWQE8dinktbf2RIC9o+SSD1GVr/JyQAvZvXYMyowX3D5IOm9AeK0FNyAVFJgxFYMtFMXdomsS/+zes0jh72rOtIaGKWEw4Gm7PR4Rz7TnbIwnllWRBiS8b+g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2e4704-df24-4b33-fb8b-08d69ce19b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2019 18:30:10.2632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR21MB0785
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.100
Subject: Re: [Qemu-arm] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +RA4J8beQbiP

PiBGcm9tOiBienQgPGJ6dGVtYWlsQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCAyNyBG
ZWJydWFyeSAyMDE5IDAzOjU0DQo+IA0KPiBJJ2QgbGlrZSB0byBhZGQgbW9yZSBkcml2ZXJzIGZv
ciB0aGUgYmNtMjgzWzU2N10gdG9vLCBhbmQgdGhpcyBxdWVzdGlvbiBnb2VzIHRvDQo+IEFuZHJl
dyBCYXVtYW5uIG1vc3RseS4gSSd2ZSBzZWVuIGltcGxlbWVudGVkIHRob3NlIG1pc3NpbmcgZHJp
dmVycyBpbiBoaXMNCj4gcmVwbywgd2hpY2ggYXJlbid0IGluIHRoZSBxZW11IG1haW5saW5lIHll
dC4gSSBkb24ndCB3YW50IHRvIHJlaW52ZW50IHRoZSB3aGVlbCwNCj4gc28gSSdtIHdpbGxpbmcg
dG8gZml4IHRob3NlIGNsYXNzZXMgdG8gZ2V0IHRoZW0gcmlnaHQsIGJ1dCBJJ2QgbGlrZSB0byBr
bm93IHdoYXQncw0KPiB3cm9uZyB3aXRoIHRoZW0gaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpOb3Ro
aW5nJ3Mgd3Jvbmcgd2l0aCB0aGVtIHBlciBzZSwgYnV0IHdoZW4gSSB3YXMgd29ya2luZyBvbiB1
cHN0cmVhbWluZyB0aGUgcmFzcGkgYm9hcmQgSSBwcmlvcml0aXNlZCB0aGUgZGV2aWNlIHN1cHBv
cnQgbmVlZGVkIHRvIGJvb3QgTGludXggYW5kIFdpbmRvd3Mgb24gcmFzcGkyLiBUaGUgcmVtYWlu
aW5nIGRldmljZXMgd2VyZSBhbHdheXMgcGxhbm5lZCBmb3IgZXZlbnR1YWwgaW5jbHVzaW9uLCBi
dXQganVzdCBmZWxsIG9mZiB0aGUgZW5kIG9mIG15IFRPRE8gbGlzdC4gVGhleSBuZXZlciB3ZW50
IHRocm91Z2ggY29kZSByZXZpZXcgb24gcWVtdS1kZXZlbCwgc28gd291bGQgcHJvYmFibHkgbmVl
ZCBzb21lIHdvcmsgdG8gYnJpbmcgdGhlbSB1cCB0byBtb2Rlcm4gcWVtdSBBUElzIGFuZCBzdGFu
ZGFyZHMuDQoNCj4gSSdtIGludGVyZXN0ZWQgaW4gZml4aW5nIHRoZQ0KPiBUWVBFX0JDTTI4MzVf
UE9XRVIgYW5kIFRZUEVfQkNNMjgzNV9TVCBkcml2ZXJzLCB3aGljaCBJIGtub3cgbWFueQ0KPiBo
b3BweSBPUyBkZXZlbG9wZXJzIGxhY2sgYW5kIHdvdWxkIGltcHJvdmUgdGhlIHJhc3BpIGVtdWxh
dGlvbiBleHBlcmllbmNlDQo+IHJlbWFya2FibHkuDQoNClNvdW5kcyBnb29kIHRvIG1lISANCg0K
PiBJdCB3b3VsZCBiZSBzdGlsbCBhIGxvbmcgd2F5IHRvIGJvb3QgYSByYXNwYmlhbiBpbWFnZSwg
YnV0IHN0aWxsLCBhDQo+IHNtYWxsIHN0ZXAgdG93YXJkcyB0aGF0IGdvYWwgYXQgbGVhc3QuDQoN
ClRoYXQncyBpbnRlcmVzdGluZy4gUmFzcGJpYW4gZGlkIHNlZW0gdG8gYmUgd29ya2luZyAob24g
cGkyKSB3aGVuIEkgbGFzdCB3b3JrZWQgb24gdGhpcy4gUGVyaGFwcyBpdCBub3cgZGVwZW5kcyBv
biB0aGVzZSBkZXZpY2VzLCBidXQgZGlkbid0IGJlZm9yZT8NCg0KQ2hlZXJzLA0KQW5kcmV3DQo=
