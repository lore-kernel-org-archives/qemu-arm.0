Received: by 10.223.159.82 with SMTP id f18csp1971014wrg;
        Mon, 27 Nov 2017 11:07:00 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbHsKRVOJceAVbQEeedb3uAOAXtn8AaJT46dCeMro1K4854CUX2ivCiqH9hZllrG1mDpkrU
X-Received: by 10.37.189.131 with SMTP id f3mr25438030ybh.262.1511809620542;
        Mon, 27 Nov 2017 11:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511809620; cv=none;
        d=google.com; s=arc-20160816;
        b=F2DljXEgE7QNKxD0FskHBS/3HP2vtbLry8RiwbcaHIvLksWji6ryg+lHHbPY2HbjNP
         E41ASV5n0laekRfd8zTt30eoiOiCK02DWD7/v7KTb8vW27EINCIjJ3zNmX6fZAOrQFHX
         4dHDIiGzVhbLOPhm+1rMNoRptwVHv6B3CdkI9z3jYIWBBDSjdAZ584gp6M3y0z69Hc+e
         L2Ie5Pu3IaikKmITxEy7x5kOHJx0RWmauRXQNOtcSWHzoO/557I0KCaLNE2n8DaoCFAy
         YzmtiamlIXwyQqinhf+6/1QMgTylgkiaVB7IAXGoON6/Vl7+WqB9HY4pXw6Ae17k4anq
         dvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=OXASziOFgmz/F7C+JkU1nnjW6HOEuGqbZfX/KYg+kyE=;
        b=uNrAEaqvHSZnDJ1x9vnNoAolBF9PPQntb5DBHzLiBAAQgWfcefUUM0DWVM2U/mo5S5
         GFqBrkYjMwS0DvYRsQRAQbvK6tKDt6eE7zKHlTNFsnIM7DlqygO2R43xBihdedPo5byx
         95mv3nlQ0LnNCs6uT5u3K72eGByME34/KGbJKzBxwJSRQ1AW6cxh/o3ZeARQXyjAMuwT
         /aBhEi2vcLQELzZz2ls2G1yRpHKKgbOE40Wq7FDFMo7xX0CIqphKCFG/SCaUGJ4rAFj9
         RTCXwxniGp5UaFddO2+rLSwldWjB38W+6Ggk4jcnMtbjGUg7qpXZsGckWCuLnwYv3fUc
         /mSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=jpJPNXVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l39si6153536ybj.704.2017.11.27.11.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Nov 2017 11:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=jpJPNXVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJOk6-0007CL-Hx
	for alex.bennee@linaro.org; Mon, 27 Nov 2017 14:06:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1eJOjs-0006ys-Cp
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 14:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1eJOjr-0003AA-E2
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 14:06:44 -0500
Received: from mail-by2nam03on0137.outbound.protection.outlook.com
	([104.47.42.137]:63899
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1eJOjm-000370-5z; Mon, 27 Nov 2017 14:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=OXASziOFgmz/F7C+JkU1nnjW6HOEuGqbZfX/KYg+kyE=;
	b=jpJPNXVQ9YeySc0lPXlmVRDE6oXHZthfnL+o158i6H34BsX5swcwksTeq2yZRitJhzg/tBEz/SackqO1rMvFLzMi85DnoMS3SRaCIhnH61yqmbJCtFz6Wd505Ws4+KUwvVOTbduX46MbmV6XlMHFbiax/xGxbeadVc0lAO4c/l0=
Received: from MWHPR21MB0480.namprd21.prod.outlook.com (10.172.102.19) by
	MWHPR21MB0637.namprd21.prod.outlook.com (10.175.141.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.0; Mon, 27 Nov 2017 19:06:35 +0000
Received: from MWHPR21MB0480.namprd21.prod.outlook.com ([10.172.102.19]) by
	MWHPR21MB0480.namprd21.prod.outlook.com ([10.172.102.19]) with mapi id
	15.20.0302.001; Mon, 27 Nov 2017 19:06:35 +0000
To: Peter Maydell <peter.maydell@linaro.org>, bzt bzt <bztemail@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
Thread-Index: AQHTS1iaOqiv7GBJY0mQ9agTHxJPvKLxn5ZggAElsACAAG5+QIABEqMAgDE7+ACAABalgIADNFwA
Date: Mon, 27 Nov 2017 19:06:35 +0000
Message-ID: <MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
In-Reply-To: <CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-11-27T19:06:31.6290277Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:b::75b]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0637;
	6:bqkIOm5h1d4IV6j3xevED+A/zEqo1T4hJZkdr0Kxj8IztAW3+gvJ5FPetISSi+++AIl1Wy6NSVfc3xUEKBOeFDrJt/ydpLYopFSfmj+hA+h1A0RvyvRtz7WWhL6rEBtQ2eIuHQouWr5+/A6c9Ox1rbU9t4BsnUhrEMmqSE0aVHB+u/lqWI+pmv5rGK0igSnzVsArVo1Q6cdTFA869rbRj+h4lCmNBD52LoEq+/TQPyfIeAdiMkZKnhwwjJcItHm7rcoa0gh+wLF7ectOWsyuw9kBvJL0YL2KmGLe7eUcvym1gZFLPONGUA0MAGIrOxR0srPC7CUmXvybvejPOmRY+ZSlnMBPGzKtxzWhA76jako=;
	5:dDXGLAJsmx32ROJhiJBhr+RwGJjen6o3USE1qhV4fs5Z6Xh4MatL5p8n1icdEM/zE23qtZfuu59E82bFIbnmS56bsaWAqeXK4Xv3QaE52FzIQ8Ub+jQKGrck4SjFc0gSerXPe6bMvGfkTRsGTNKyXwrJNXdREWZyt0XzbjIqQKc=;
	24:BMbWrbIsRLtZvAWkxhMkwSOWx+fJZr8UYb/1iPPms+Izs1KrzJUdSjtZm6+dGRisq5s9uhcu9/fNgYL0YEKfzdxdYaUSpPJQvyYP7gVWzHY=;
	7:g7m2fl2XOewnTH8l9VfZOFRBy2G+uhLQqfY34nZuBkIFBGLKcJgFW8/ODIsc3yjRjapmYKWW+K85SVenX4j3FPxaaak53jmTkUsnONwFc1wOcdNiogMEr+9upcwMKYkZhqoczME+Thy+GQT6Ipu1b5F45VyWrTTe64o5m7UrBb+Q+jNXFakeTrkBR3Y2S7Uv7SsftzZwdtPHqT6sqCsy+x1YPffW14oHuBSAaMiA4w9BoBpAlACgmG+osWYG9uRO
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cbd97349-70fb-47c9-7616-08d535c9fae8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(2017052603258);
	SRVR:MWHPR21MB0637; 
x-ms-traffictypediagnostic: MWHPR21MB0637:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB063771B3815E38B4950334169E250@MWHPR21MB0637.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(72170088055959);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(6040450)(2401047)(5005006)(8121501046)(3231022)(10201501046)(93006095)(93001095)(3002001)(6055026)(61426038)(61427038)(6041248)(20161123560025)(20161123555025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011);
	SRVR:MWHPR21MB0637; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR21MB0637; 
x-forefront-prvs: 0504F29D72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(366004)(39860400002)(376002)(346002)(47760400005)(199003)(189002)(24454002)(33656002)(105586002)(14454004)(72206003)(7696005)(8676002)(81156014)(81166006)(10090500001)(966005)(110136005)(22452003)(316002)(189998001)(6116002)(93886005)(86362001)(478600001)(68736007)(99286004)(102836003)(8936002)(8990500004)(2906002)(54906003)(86612001)(9686003)(6436002)(25786009)(6306002)(53936002)(3280700002)(53546010)(6506006)(7736002)(77096006)(74316002)(39060400002)(55016002)(229853002)(4326008)(305945005)(10290500003)(97736004)(2900100001)(101416001)(106356001)(54356999)(5660300001)(50986999)(6246003)(76176999)(3660700001)(2950100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0637;
	H:MWHPR21MB0480.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd97349-70fb-47c9-7616-08d535c9fae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2017 19:06:35.5624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0637
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.137
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
X-TUID: sqW0Wetmzq6a

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBTYXR1cmRheSwgMjUgTm92ZW1iZXIgMjAxNyAxMDowNQ0KDQo+IE9uIDI1IE5vdmVt
YmVyIDIwMTcgYXQgMTY6NDMsIGJ6dCBienQgPGJ6dGVtYWlsQGdtYWlsLmNvbT4gd3JvdGU6DQo+
ID4gRGVhciBBbmRyZXcsDQo+ID4NCj4gPiBBIG1vbnRoIHBhc3NlZCwgYW5kIHRoZSBtYWludGFp
bmVycyBkaWRuJ3QgZ2F2ZSBhIGRhbW4gYWJvdXQgcmFzcGkzDQo+IHN1cHBvcnQNCj4gPiBpbiBx
ZW11LiBBbnkgaWRlYXM/DQo+IA0KPiBTb3JyeSB0aGlzIHBhdGNoIGZlbGwgdGhyb3VnaCB0aGUg
Y3JhY2tzLCBidXQgaXQgbG9va2VkIHRvIG1lDQo+IHRvIGJlIGluIHRoZSBzdGF0ZSAicGF0Y2gg
Z290IGNvZGUgcmV2aWV3IGNvbW1lbnRzLCB3YWl0aW5nIGZvcg0KPiBzdWJtaXR0ZXIgdG8gcmVz
ZW5kIGEgbmV3IHZlcnNpb24iIChmcm9tIGFib3V0IHRoZSBwb2ludCBLb25yYWQNCj4gc2FpZCAi
c3BsaXQgdGhpcyB1cCwgaXQncyB0b28gYmlnIiwgd2hpY2ggSSBhZ3JlZSB3aXRoLikNCj4gUUVN
VSBnZXRzIGEgbG90IG9mIHBhdGNoZXMgZXZlcnkgZGF5LCBzbyBvdXIgY29kZSBwcm9jZXNzIHJl
bGllcw0KPiBvbiB0aGUgc3VibWl0dGVyIHRvIHByb2QgdGhpbmdzIGlmIHdoYXQgdGhleSdyZSBp
bnRlcmVzdGVkIGluDQo+IHNlZW1zIHRvIGhhdmUgYmVlbiBhY2NpZGVudGFsbHkgaWdub3JlZDoN
Cj4gaHR0cHM6Ly93aWtpLnFlbXUub3JnL0NvbnRyaWJ1dGUvU3VibWl0QVBhdGNoI0lmX3lvdXJf
cGF0Y2hfc2VlbXNfdG9faGF2DQo+IGVfYmVlbl9pZ25vcmVkDQo+IA0KPiBGV0lXLCBhcyBmYXIg
YXMgSSdtIGNvbmNlcm5lZCBBbmRyZXcgcHJldHR5IG11Y2ggaXMgdGhlIG1haW50YWluZXINCj4g
YXMgZmFyIGFzIHRoZSByYXNwaSBib2FyZHMgYXJlIGNvbmNlcm5lZCwgc28gYXMgZmFyIGFzIHRo
b3NlDQo+IGJpdHMgb2YgY29kZSBnb2VzIEknbSBoYXBweSB0byB0YWtlIGhpcyBvcGluaW9uIG9u
IGl0Lg0KDQpJbiB0aGF0IGNhc2UsIElJUkMgbXkgaGlnaC1sZXZlbCBzdWdnZXN0aW9uIHdhcyB0
byBlaXRoZXIgcGFyYW1ldGVyaXNlIGJjbTI4MzYgdG8gdGFrZSBhIENQVSBtb2RlbCBzdHJpbmcs
IG9yIGVsc2UgbW92ZSB0aGUgQ1BVIGNyZWF0aW9uIG91dCBvZiBiY20yODM2LmMgaW50byB0aGUg
Ym9hcmQgZmlsZS4gRnJvbSB3aGF0IEkndmUgdW5kZXJzdG9vZCB0aHVzIGZhciBhYm91dCBwaTMs
IGl0IGRvZXMgbm90IHNlZW0gbmVjZXNzYXJ5IHRvIGhhdmUgYSBzZXBhcmF0ZSBiY20yODM3IGlt
cGxlbWVudGF0aW9uLiBJIHN1c3BlY3QgYXQgdGhhdCBwb2ludCB0aGUgcGF0Y2ggd291bGQgYmUg
c21hbGwgZW5vdWdoIHRoYXQgaXQgZGlkbid0IHJlcXVpcmUgZnVydGhlciBzcGxpdHRpbmcuDQoN
Cj4gUFM6IGlmIHlvdSBzZW5kIGEgbmV3IHBhdGNoLCBzZW5kIGl0IGFzIGEgbmV3IHRvcCBsZXZl
bA0KPiB0aHJlYWQgLS0gaWYgeW91IHNlbmQgaXQgYXMgYSByZXBseS9mb2xsb3d1cCB0byB0aGUN
Cj4gZmlyc3QgcGF0Y2ggaXQncyBsaWFibGUgdG8gbm90IGJlIG5vdGljZWQuDQoNClBsZWFzZSBh
bHNvIENDIG1lIG9uIHRoZSBuZXcgcGF0Y2ggYXMgSSBhbSBub3QgdmVyeSByZWxpYWJsZSBhdCBt
b25pdG9yaW5nIHFlbXUtZGV2ZWwuDQoNClRoYW5rcyENCkFuZHJldw0K
