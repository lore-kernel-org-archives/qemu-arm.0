Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp96574lfg;
        Mon, 24 Feb 2020 01:36:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/ssnZVKuJcnhxs5f1bZS/EJEjk0cre4eSaH8m1eEvgGNqyMOYiOt3jUpizCo/aYDZyJmm
X-Received: by 2002:a0c:cdcb:: with SMTP id a11mr42871525qvn.244.1582536995399;
        Mon, 24 Feb 2020 01:36:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582536995; cv=pass;
        d=google.com; s=arc-20160816;
        b=pLE9gL+nLeJg3If5r0aaqRlSJzsU84CD0rHXWyfsUOMHgKSoLyqBa0GYlhPcRTGyZo
         E+f9heuZGIVp52K+QIzHzayjRR+daGz6n1RmgYK1Wdr1TsJO423Vh6gDHYdgnKFQhZBX
         VelC6s/O1qWszZdnzyixiOJB+luAnDa557KRee9lFlBDy7FdBhES1V9r7ahBKi7X1ep6
         WSG8dEA+XWCE3yrNz9pXbnG2lczMLctXD3hSSl1qJ67tAQaYcBpjALiH/o8JmAjR5EBY
         R+th/dL5JXH/dv992+HCduok1rVp9GFHCgLh0hrTYXU02wCC1nQ9l5tAmxAWajewL2Cn
         khPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:dkim-signature;
        bh=mE1F+tEzjJPCjd6egndwVlbSHt7tDekBeaUTbsGSbsU=;
        b=kBq68HdXqPFIKK8VXfjIKQv7WB7mSprKrGfetZ3b7gkVK6bNRPlYC91eF5OQyixPn0
         I9jGCmx41KU3h7mPuGc2eHksy11d8XWLLQevMtMKAh4psWHwXRoua6Bg0GuHraTQ5W/t
         vASTtIsUHluzX6MaogCsM8FVtSYnsDN8qv18xiD02OgYAyrZud4RfU1zJkhMWBzmQZ1U
         2HFN+thF4uFmDRl+uVCUSnOtkZrG8bU5D6C3K2AnP9K+YjpdI4umVptXToOL+4+CnBYC
         EGRVkAwR2UW3rtekkxUggPqwgXLfiaYTBToolH0ww4bM6zuL7KSoZq4AVSnKBw2Eg1ZM
         rbfQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=Z3uosDBX;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dkim=pass dkdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si5249143qvz.12.2020.02.24.01.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 01:36:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=Z3uosDBX;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dkim=pass dkdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6AAE-00075e-P9
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 04:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <saipava@xilinx.com>) id 1j6AA5-00075P-KP
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 04:36:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <saipava@xilinx.com>) id 1j6AA3-0002wD-PM
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 04:36:24 -0500
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com
 ([40.107.93.86]:61888 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <saipava@xilinx.com>)
 id 1j6AA3-0002vL-Gt; Mon, 24 Feb 2020 04:36:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1H4csAwAOvG8JfMNxsCDufNwbeM/Mv6IX3wYmyLsxqauzmJNAMPqxl6UzMERKuGS7NvAaxKgR3c1ndziWxqZ0ljptJgaxR6KRqVKscZ8CS1stdAcx9eDl+mGO9PfydYuStHVY5jg6QtLC6w8RDtACsomjCUc840aFmukan8UUWAdtoQhY0lOkxp0tJP2KbA9m+/QnngziBvW0BSpM50E8n767ebmC87jPsqH0lNFtvuZcanNWKc6MRwEKSbcwf5R3O5ThxxT7BEtNhIpEwV5mPrNbTKRhiahSi6PTC98EwfVHECOFZJW0O3OA5hxcnavPTeCBgqD0Nqs4TAWAA/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE1F+tEzjJPCjd6egndwVlbSHt7tDekBeaUTbsGSbsU=;
 b=i4vpE/jo5aIyIsqsqmxy+uUds7GyGrP27QEp+cMEH0emaMfrZSAOT7nvJPnVLIMGJiJjvtByuESKzY4WKqZIl1z2hzYl7HLQAjmMnttO/sU2ufDIAJMuT96YILutgonUycsFlBCu0qN945krlvvm4abjcoJ2bJq9gQJBSuuLxi7y6qYkfDmho3+cb2FA2rkTNA8702vDRJOtwW+StCwEvzcfldD5YEjA23L2++iX1XD1k0w1Wg7G/YvJKJ3fCBhhafNT7yEiOxvx0DimXKejejIadMjiYsoZpGkok/ggqiKaIhNnLwGqHHKFH3n/V0HaVP5fWDASWhi7IWRzg08ukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE1F+tEzjJPCjd6egndwVlbSHt7tDekBeaUTbsGSbsU=;
 b=Z3uosDBXO3cCSYM/7tDb0zQNSEL7La3cIOH3A7gxpgmSc2fGUCOABko+kmSgkiuoHhT7YFMwgpyJWF59tKaBu0jc2bHXDRPOI/IRxnZi/QALFIIfDpA4sQKh2c/yGGWi+PMM1drVS3TtMzXua5KpQ7xPQbARZDLa8ZAqzBRZxdk=
Received: from MN2PR02MB5935.namprd02.prod.outlook.com (2603:10b6:208:111::23)
 by MN2PR02MB6094.namprd02.prod.outlook.com (2603:10b6:208:1b7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Mon, 24 Feb
 2020 09:36:19 +0000
Received: from MN2PR02MB5935.namprd02.prod.outlook.com
 ([fe80::7161:a3a3:c491:10cd]) by MN2PR02MB5935.namprd02.prod.outlook.com
 ([fe80::7161:a3a3:c491:10cd%4]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:36:19 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 1/3] arm_gic: Mask the un-supported priority bits
Thread-Topic: [PATCH v2 1/3] arm_gic: Mask the un-supported priority bits
Thread-Index: AQHV6MvW5OVOjUky5kS8GDicr+iv86gqGXvQ
Date: Mon, 24 Feb 2020 09:36:19 +0000
Message-ID: <MN2PR02MB5935A5AFB306C8B5D513CBD2CAEC0@MN2PR02MB5935.namprd02.prod.outlook.com>
References: <1582270927-2568-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1582270927-2568-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAFEAcA-NYkaQuJq=0Ft7j0XEPqJQz=G=wwKTWTxdbCmSRUh6uA@mail.gmail.com>
In-Reply-To: <CAFEAcA-NYkaQuJq=0Ft7j0XEPqJQz=G=wwKTWTxdbCmSRUh6uA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saipava@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5577e2f-71fe-49cf-f720-08d7b90d00e5
x-ms-traffictypediagnostic: MN2PR02MB6094:
x-microsoft-antispam-prvs: <MN2PR02MB6094902B1D0D61F05DB88927CAEC0@MN2PR02MB6094.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(199004)(189003)(33656002)(55016002)(71200400001)(478600001)(66446008)(76116006)(64756008)(66556008)(66476007)(66946007)(6916009)(7696005)(9686003)(86362001)(5660300002)(2906002)(52536014)(316002)(8936002)(53546011)(54906003)(26005)(6506007)(186003)(4326008)(81166006)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB6094;
 H:MN2PR02MB5935.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lCxcuqIPZ6kz4ABpCV1sfOMiFvH1dIdMp47sh3UTFqfEpf82s3LDbuhBWrGnfkvkFlvLWQs4laJ4tFmHu5nPI9882/at6fOdPIqViFE8p7TfcWjTvrL+nesXtMiE51NyZhGTu6WbFIrUpii2o+9tHTg+zHkzpbNl9zx9pPgSYwaKFUaSh8owKZahZvfXS02cFdRBbQy8ovOKaPMbPaq+S7cMTTybm8ho/97+LHnByZmQ6geklP9wCDnhq5++nZsBGHeNUwXJ6LEro57hhrROLK8qfvos8OSA+w2x+4hAYNxxCADv7JzbE6ilBthOCufr5K6Wrwl+Gn0XImaq7QySPWneZU4EMdKNcNovdPadWgoCR0ZqjIn6wmYXdlioPF9AnnX46Ze5ojWAZBbSN0UFvx6OVt12p6pV8gHkxZlVsX/F50h94eODzIIyJXGFe7oQ
x-ms-exchange-antispam-messagedata: 8YRAD0OVPdIYDnDvjZUXkKqbvGgoTFsudTUv7od9H7FhjFX9F9arGMx74mawJFASRsAbgZoFPl2rf9MjD6G3musjRbrdI5+1Iwf+TdNThp1LfXp/bN0W1c/UZCrxVVTRmricQGspqkLaRJueUQFwaQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5577e2f-71fe-49cf-f720-08d7b90d00e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 09:36:19.4650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mi4Q7b8LqdQii+3o8mhY5iU1n4/b1pBFRqnr90RsmV6Lqie2PgOfrQbgCIAnbs0riGZBL754Er6jUZiKMvJbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6094
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.93.86
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anthony Liguori <anthony@codemonkey.ws>,
 =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /P0zkncHIo9J

SGkgUGV0ZXIsDQoNCldpbGwgc2VuZCBWMyBmb3IgYmVsb3cgY29tbWVudHMuDQpJbiB2MiBJIG1h
eSBoYXZlIGNvbmZ1c2VkIHdpdGggZnVuY3Rpb25hbGl0eSBvZiBncm91cCBwcmlvcml0eSBpbnRl
cnJ1cHQgYml0cy4gTm93IHRoaW5ncyBsb29rIGNsZWFyLiBUaGFua3MuDQoNClJlZ2FyZHMsDQpT
YWkgUGF2YW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBN
YXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVh
cnkgMjEsIDIwMjAgOTowMCBQTQ0KPiBUbzogU2FpIFBhdmFuIEJvZGR1IDxzYWlwYXZhQHhpbGlu
eC5jb20+DQo+IENjOiBFZGdhciBFIC4gSWdsZXNpYXMgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNv
bT47IEFsaXN0YWlyIEZyYW5jaXMNCj4gPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+OyBBbnRob255
IExpZ3VvcmkgPGFudGhvbnlAY29kZW1vbmtleS53cz47DQo+IEFuZHJlYXMgRsOkcmJlciA8YWZh
ZXJiZXJAc3VzZS5kZT47IHFlbXUtYXJtIDxxZW11LWFybUBub25nbnUub3JnPjsNCj4gUUVNVSBE
ZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMS8zXSBhcm1fZ2ljOiBNYXNrIHRoZSB1bi1zdXBwb3J0ZWQgcHJpb3JpdHkgYml0cw0KPiAN
Cj4gT24gRnJpLCAyMSBGZWIgMjAyMCBhdCAwNzo0NiwgU2FpIFBhdmFuIEJvZGR1DQo+IDxzYWku
cGF2YW4uYm9kZHVAeGlsaW54LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBQcmlvcml0eSBiaXRzIGlt
cGxlbWVudGVkIGluIGFybS1naWMgY2FuIGJlIDggdG8gNCwgdW4taW1wbGVtZW50ZWQNCj4gPiBi
aXRzIGFyZSByZWFkIGFzIHplcm9zKFJBWikuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWkg
UGF2YW4gQm9kZHUgPHNhaS5wYXZhbi5ib2RkdUB4aWxpbnguY29tPg0KPiA+IC0tLQ0KPiA+ICBo
dy9pbnRjL2FybV9naWMuYyAgICAgICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrKy0tDQo+ID4gIGh3L2ludGMvYXJtX2dpY19jb21tb24uYyAgICAgICAgIHwgIDEgKw0KPiA+
ICBpbmNsdWRlL2h3L2ludGMvYXJtX2dpY19jb21tb24uaCB8ICAxICsNCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2h3L2ludGMvYXJtX2dpYy5jIGIvaHcvaW50Yy9hcm1fZ2ljLmMgaW5kZXgNCj4gPiAx
ZDdkYTdiLi5kZWM4NzY3IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2ludGMvYXJtX2dpYy5jDQo+ID4g
KysrIGIvaHcvaW50Yy9hcm1fZ2ljLmMNCj4gPiBAQCAtNjQxLDYgKzY0MSwyMyBAQCB1aW50MzJf
dCBnaWNfYWNrbm93bGVkZ2VfaXJxKEdJQ1N0YXRlICpzLCBpbnQNCj4gY3B1LCBNZW1UeEF0dHJz
IGF0dHJzKQ0KPiA+ICAgICAgcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB1
aW50MzJfdCBnaWNfZnVsbHByaW9fbWFzayhHSUNTdGF0ZSAqcywgaW50IGNwdSkgew0KPiA+ICsg
ICAgLyoNCj4gPiArICAgICAqIFJldHVybiBhIG1hc2sgd29yZCB3aGljaCBjbGVhcnMgdGhlIHVu
aW1wbGVtZW50ZWQgcHJpb3JpdHkNCj4gPiArICAgICAqIGJpdHMgZnJvbSBhIHByaW9yaXR5IHZh
bHVlIGZvciBhbiBpbnRlcnJ1cHQuIChOb3QgdG8gYmUNCj4gPiArICAgICAqIGNvbmZ1c2VkIHdp
dGggdGhlIGdyb3VwIHByaW9yaXR5LCB3aG9zZSBtYXNrIGRlcGVuZHMgb24gQlBSLikNCj4gPiAr
ICAgICAqLw0KPiA+ICsgICAgaW50IHVuaW1wQml0czsNCj4gPiArDQo+ID4gKyAgICBpZiAoZ2lj
X2lzX3ZjcHUoY3B1KSkgew0KPiA+ICsgICAgICAgIHVuaW1wQml0cyA9IEdJQ19WSVJUX01BWF9H
Uk9VUF9QUklPX0JJVFM7DQo+ID4gKyAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgIHVuaW1wQml0
cyA9IDggLSBzLT5uX3ByaW9fYml0czsNCj4gDQo+IFRoaXMgaXNuJ3QgcmlnaHQ7IEdJQ19WSVJU
X01BWF9HUk9VUF9QUklPX0JJVFMgc2hvdWxkIGJlIGhhbmRsZWQgdGhlDQo+IHNhbWUgd2F5IGFz
IHMtPm5fcHJpb19iaXRzLiBUaGUgZXhwcmVzc2lvbiBJIHN1Z2dlc3RlZCBpbiBteSBjb21tZW50
IG9uDQo+IHlvdXIgdjEgc2hvdWxkIHdvcms6DQo+IA0KPiAgICAgaWYgKGdpY19pc192Y3B1KGNw
dSkpIHsNCj4gICAgICAgICBwcmliaXRzID0gR0lDX1ZJUlRfTUFYX0dST1VQX1BSSU9fQklUUzsN
Cj4gICAgIH0gZWxzZSB7DQo+ICAgICAgICAgcHJpYml0cyA9IHMtPm5fcHJpb19iaXRzOw0KPiAg
ICAgfQ0KPiAgICAgcmV0dXJuIH4wVSA8PCAoOCAtIHMtPm5fcHJpb19iaXRzKTsNCj4gDQo+ID4g
KyAgICB9DQo+ID4gKyAgICByZXR1cm4gfjBVIDw8IHVuaW1wQml0czsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgdm9pZCBnaWNfZGlzdF9zZXRfcHJpb3JpdHkoR0lDU3RhdGUgKnMsIGludCBjcHUsIGlu
dCBpcnEsIHVpbnQ4X3QgdmFsLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgTWVtVHhBdHRy
cyBhdHRycykgIHsNCj4gDQo+IA0KPiBZb3Ugc2VlbSB0byBoYXZlIGxvc3QgdGhlIHBhcnQgb2Yg
dGhlIHBhdGNoIHdoaWNoIGFwcGxpZXMgdGhlIG1hc2sgaW4NCj4gZ2ljX2Rpc3Rfc2V0X3ByaW9y
aXR5KCkuIElmIHRoZSBHSUMgb25seSBoYXMgNSBiaXRzIG9mIHByaW9yaXR5IHdlIHNob3VsZCBu
b3QNCj4gYWxsb3cgdGhlIGd1ZXN0IHRvIHNldCBtb3JlIHRoYW4gdGhhdC4NCj4gDQo+ID4gQEAg
LTY2OSw3ICs2ODYsNyBAQCBzdGF0aWMgdWludDMyX3QgZ2ljX2Rpc3RfZ2V0X3ByaW9yaXR5KEdJ
Q1N0YXRlICpzLA0KPiBpbnQgY3B1LCBpbnQgaXJxLA0KPiA+ICAgICAgICAgIH0NCj4gPiAgICAg
ICAgICBwcmlvID0gKHByaW8gPDwgMSkgJiAweGZmOyAvKiBOb24tc2VjdXJlIHZpZXcgKi8NCj4g
PiAgICAgIH0NCj4gPiAtICAgIHJldHVybiBwcmlvOw0KPiA+ICsgICAgcmV0dXJuIHByaW8gJiBn
aWNfZnVsbHByaW9fbWFzayhzLCBjcHUpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQg
Z2ljX3NldF9wcmlvcml0eV9tYXNrKEdJQ1N0YXRlICpzLCBpbnQgY3B1LCB1aW50OF90DQo+ID4g
cG1hc2ssIEBAIC02ODQsNyArNzAxLDcgQEAgc3RhdGljIHZvaWQgZ2ljX3NldF9wcmlvcml0eV9t
YXNrKEdJQ1N0YXRlDQo+ICpzLCBpbnQgY3B1LCB1aW50OF90IHBtYXNrLA0KPiA+ICAgICAgICAg
ICAgICByZXR1cm47DQo+ID4gICAgICAgICAgfQ0KPiA+ICAgICAgfQ0KPiA+IC0gICAgcy0+cHJp
b3JpdHlfbWFza1tjcHVdID0gcG1hc2s7DQo+ID4gKyAgICBzLT5wcmlvcml0eV9tYXNrW2NwdV0g
PSBwbWFzayAmIGdpY19mdWxscHJpb19tYXNrKHMsIGNwdSk7DQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgdWludDMyX3QgZ2ljX2dldF9wcmlvcml0eV9tYXNrKEdJQ1N0YXRlICpzLCBpbnQgY3B1
LA0KPiA+IE1lbVR4QXR0cnMgYXR0cnMpIEBAIC0yMDU1LDYgKzIwNzIsMTEgQEAgc3RhdGljIHZv
aWQNCj4gYXJtX2dpY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4g
PiAgICAgICAgICByZXR1cm47DQo+ID4gICAgICB9DQo+ID4NCj4gPiArICAgIGlmIChzLT5uX3By
aW9fYml0cyA+IDgpIHsNCj4gPiArICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJudW0tcHJpb3Jp
dHktYml0cyBjYW5ub3QgYmUgZ3JlYXRlciB0aGFuIDgiKTsNCj4gPiArICAgICAgICByZXR1cm47
DQo+ID4gKyAgICB9DQo+IA0KPiBZb3UgbmVlZCB0byBhbHNvIGNoZWNrIHRoYXQgdGhlIHZhbHVl
IGlzIGF0IGxlYXN0IGFzIGxhcmdlIGFzIHRoZSBsb3dlc3QNCj4gcGVybWl0dGVkIHZhbHVlLCBh
cyBJIHN1Z2dlc3RlZCBpbiBteSB2MSBjb21tZW50Lg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K
