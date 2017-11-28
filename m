Received: by 10.223.159.82 with SMTP id f18csp3182975wrg;
        Tue, 28 Nov 2017 09:54:19 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZqtqzLh7ums9+FtWdQiDH7EDuk9h00WfLDuVj4FpGuVYSrx2DQh7RclZiFq6ACyn1Me9jQ
X-Received: by 10.37.131.129 with SMTP id t1mr28485745ybk.243.1511891659644;
        Tue, 28 Nov 2017 09:54:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511891659; cv=none;
        d=google.com; s=arc-20160816;
        b=P3l/vU7tpRSgorxuD6Nx5RG2EEYbr0DPFIKHW0GZpr+X5SSkA8d+u7KeBbLq3BChOZ
         K58foatoqjppj1VJZc/Ie+3pyhwRkZ5CpFM+66Yi8WI29kaXs+s7V5T/OqR4NvkQbiVI
         g/vR6RVdCCwSGvlJ6DseNHnfNAjXGAgsGoHGW2FI4+uJxkfdU05FrvISun0KPOvvRyjW
         OsOEY8G+GGjDL8vo7vXztbqbxClT2/YGBKed70iQqnj9NUlV61AVsf5iZNpBrXSdpcbE
         Z32Gy9eQZx2GXxnXQP0Wycvikcq3s3FubTQCqNSn2cNKn3CQkvrBfg+H7NNOr6Rck5r9
         W0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=pCvWdYKkwcHz7I3ch2OwYnHGsEt4lALFhlBmDf+rxMs=;
        b=gW3dkAp2jThgv3zvqcql3p7JUucKR5tghIuIdyOW2NByswA4BNnmjNJiatrdP8cobT
         MDJKUzwNb4B8m+aaKS26eQwHDprLXLoSsbS08A3b/ilcZZYioalHuLSOiBaQyiMsSw8X
         D4WSou5fkpVn/8ic6e1JJjcVhVYRscvrFRYBeUlx+rryS3r5gnO1DO3RQWX1H89CPnFR
         x2lVfmiy5xixoonfKfJjFvGrCuwVj7mpPB4GT2fhqgeh6TW2OHA3PwVJCFzXCHXDNy9q
         HDGkt6M/OPYllkeLy9RVbXlIQFS1uS6n8jvLF+1q0bHqEoJNlABjTMIJnyDB1SO0U36f
         lLaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=Vl1Cvlp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p123si6740905ywe.622.2017.11.28.09.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 09:54:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=Vl1Cvlp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJk5L-0007Yp-1y
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 12:54:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1eJk5C-0007XR-0O
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 12:54:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1eJk5B-0003S4-6l
	for qemu-arm@nongnu.org; Tue, 28 Nov 2017 12:54:10 -0500
Received: from mail-dm3nam03on0101.outbound.protection.outlook.com
	([104.47.41.101]:45498
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1eJk56-0003O3-9J; Tue, 28 Nov 2017 12:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=pCvWdYKkwcHz7I3ch2OwYnHGsEt4lALFhlBmDf+rxMs=;
	b=Vl1Cvlp+qpD5oFCf0T/dpudxujf5JUMihEeWn1XehJhfdLWd/rPiwZ9fXwu5eglZyh+Kle9OknC9+osw/RgD/0U04RG0nrrLECuRxUZnk4jgl5X6GtvzDrfTclBfNjQjfLMVOtyZD6+9Q4iNsx5/xjtHguPLCLXNI6QgrYrKjLg=
Received: from MWHPR21MB0480.namprd21.prod.outlook.com (10.172.102.19) by
	MWHPR21MB0174.namprd21.prod.outlook.com (10.173.52.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.0; Tue, 28 Nov 2017 17:54:01 +0000
Received: from MWHPR21MB0480.namprd21.prod.outlook.com ([10.172.102.19]) by
	MWHPR21MB0480.namprd21.prod.outlook.com ([10.172.102.19]) with mapi id
	15.20.0302.001; Tue, 28 Nov 2017 17:54:01 +0000
To: bzt bzt <bztemail@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
Thread-Index: AQHTS1iaOqiv7GBJY0mQ9agTHxJPvKLxn5ZggAElsACAAG5+QIABEqMAgDE7+ACAABalgIADNFwAgAETcwCAAGrg4A==
Date: Tue, 28 Nov 2017 17:54:01 +0000
Message-ID: <MWHPR21MB0480A1F01D2CEF51E7CE21B09E3A0@MWHPR21MB0480.namprd21.prod.outlook.com>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
	<MWHPR21MB01591543E188B048145985709E470@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw0RjiW2as9jGtPg92E8XK3KR+gM9C5vjC7HHsBauFn4ug@mail.gmail.com>
	<CADYoBw19GifmUR=Rztkzzc-v3-zWR6frjiNb_wjzsevreAqPDQ@mail.gmail.com>
	<CAFEAcA9_+wZJa7Ht6EHCCZYm+hrfdbjd9gUmVJPGgZ0yvbZOPA@mail.gmail.com>
	<MWHPR21MB0480DE1F826056BC8377EE289E250@MWHPR21MB0480.namprd21.prod.outlook.com>
	<CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
In-Reply-To: <CADYoBw31C0Z2vp0S0ZFBOC6A3146wxtZWvzJabACkGh44ZwC0w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-11-28T17:53:56.0351157Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [50.35.74.146]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0174;
	6:lhX76dfdCM0J015H4nH6vZIJ4lByb3xEuSbVvS249qc8H/1JrlzAoX0aw/Ob90+CRYz4oNYyjsUQVqmw9tcZuSSHk4AS4rl7uOCfSkxb8nlPm8bOf2oGU+V3L8jU2i1Q8lBlJT5YnfBABziXPQdqgz0rwjfiqcXbQCObZcHrsRyk/z58rDHSoEBAxIEmJo/S0zK2WJYan4HiPhyKtByITrwE6f/kBHEZukbbm1XwToQ7ce6YRg1hm6QDiwqP8IAvaXIVn5o8tU9jVTvdGyZ2bWkszeDgfVKaYHQfNQ6bYFo0Kv5+9ubFBXonnecCE6G9oGuBqX8AwECBx+Q1pPHcgEZ/3RoOOMRikxfJwWo80uQ=;
	5:ZHLVJKtbSo0cuAgv1cfJVlt/0HKFp9nIz6G4S6B0oTWCFf7IT6IymVHE55BRuczDRI8Kbn8GWPyhoYk3a9wuOx73s0HTgGizfw5Djvk0iTHZ2UQAApMAaRFy0obBLWJqGRTRav3qpvgbUD5gi2mXpozXPITJzs5p93k45Z8Mky0=;
	24:bXso8TMtrhe+PeoYnQuZeBNfBLrf4mH2LxUsIo1Qg9hprBoQiE5TDNWzeVfgNzXtK4HoxXkEuSe32cuAxQkWsPZn6qn/a8nHC8u15drm61Q=;
	7:BnVVnADn19R6euHzuSWcnCf13yXbQEV0/2gX66X4KsReQnvnVvtX1kH+N+/pYbvamRQ+boe6FIh3f2bmn2wxvE4X0uNtPeMRhVsJ4+LF331iNa4Fwygm3PHZQXckjVLcJioih7DTZRrsKwct0rTcxiv0LbNPYnLR2pdrtGLHvYTeiob9SZ+RhVxGO1k9vgpqNwN3xTpHKhzPWaOtrd5ooOR1iiimZerz/YNC5T9M6F8TLG32tycH6lmGuWBepu/K
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3daa03bb-3ac4-4ab8-1df4-08d5368901e4
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603258);
	SRVR:MWHPR21MB0174; 
x-ms-traffictypediagnostic: MWHPR21MB0174:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB0174D0B0CDF19CD764497CF09E3A0@MWHPR21MB0174.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(226959686518644)(22074186197030);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(6040450)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231022)(6055026)(61426038)(61427038)(6041248)(20161123555025)(20161123562025)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011);
	SRVR:MWHPR21MB0174; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR21MB0174; 
x-forefront-prvs: 0505147DDB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(376002)(366004)(346002)(39860400002)(47760400005)(199003)(189002)(99286004)(101416001)(4326008)(74316002)(8936002)(305945005)(7736002)(189998001)(478600001)(6116002)(102836003)(3846002)(53936002)(25786009)(10290500003)(6306002)(39060400002)(86612001)(14454004)(8676002)(10090500001)(68736007)(86362001)(72206003)(6246003)(81166006)(81156014)(6506006)(77096006)(9686003)(66066001)(97736004)(8990500004)(6436002)(229853002)(3660700001)(3280700002)(54906003)(105586002)(106356001)(7696005)(93886005)(33656002)(55016002)(2906002)(22452003)(316002)(1411001)(6916009)(54356999)(2950100002)(76176999)(50986999)(5660300001)(2900100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0174;
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3daa03bb-3ac4-4ab8-1df4-08d5368901e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2017 17:54:01.1846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0174
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.101
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dd2HfdelPybc

PiBGcm9tOiBienQgYnp0IFttYWlsdG86Ynp0ZW1haWxAZ21haWwuY29tXQ0KPiBTZW50OiBUdWVz
ZGF5LCAyOCBOb3ZlbWJlciAyMDE3IDAzOjI3DQoNCj4gWWVzLCBJIGFncmVlLiBJJ3ZlIHByb3Zp
ZGVkIGEgcGFyYW1ldGVyaXNlZCB2ZXJzaW9uIG9uIE9jdCAyNCwgd2hpY2ggZG9lcyBub3QNCj4g
aGF2ZSBhIHNlcGFyYXRlIGJjbTI4MzcgaW1wbGVtZW50YXRpb24uIElzIHRoYXQgcGF0Y2ggb2s/
DQoNClRoYXQgcGF0Y2ggd2FzIG1vdmluZyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLCBidXQgSSB0
aGluayB0aGVyZSB3ZXJlIHR3byBwcm9ibGVtcyB3aXRoIGl0LiBGaXJzdCwgdGhlIHJpZ2h0IHdh
eSB0byBwYXNzIGEgcGFyYW1ldGVyIGlzIHZpYSBhIHByb3BlcnR5IGZpZWxkIChhcyBQZXRlciBl
eHBsYWluZWQpLiBTZWNvbmQsIElNTyB0aGUgcGFyYW1ldGVyIHNob3VsZCBiZSB0aGUgQ1BVIG1v
ZGVsIHN0cmluZyB0byBpbnN0YW50aWF0ZSBhbmQgbm90IHRoZSBQaSB2ZXJzaW9uIG51bWJlci4N
Cg0KPiBPciBzaG91bGQgSSB3YWl0DQo+IGZvciBBbGlzdGFpcidzIHBhdGNoIChodHRwczovL2xp
c3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAxNy0NCj4gMTAvbXNnMDQxNTMu
aHRtbCk/DQoNCkFsaXN0YWlyJ3MgcGF0Y2ggZG9lc24ndCBhY3R1YWxseSBoZWxwIHlvdSBhcyBm
YXIgYXMgSSBjYW4gc2VlLCBzaW5jZSBpdCBkb2Vzbid0IGNoYW5nZSB3aGF0IENQVSBiY20yODM2
IGluc3RhbnRpYXRlcy4gSSB0aGluayBpdCBqdXN0IG1lYW5zIHRoYXQgaWYgdGhlIHVzZXIgc3Bl
Y2lmaWVzIGEgZGlmZmVyZW50IENQVSB0eXBlIHRoZXkgZ2V0IGFuIGVycm9yIHJhdGhlciB0aGFu
IGJlaW5nIHNpbGVudGx5IGlnbm9yZWQuDQoNCkFuZHJldw0K
