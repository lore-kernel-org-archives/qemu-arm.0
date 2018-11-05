Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2887734wro;
        Mon, 5 Nov 2018 10:00:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5ceZXlmv6hnRC4lZQhwZDWk4DXGesrYUBhmNT5CEY1SPuVSy3aekumVfpENGtZ+ZTLNsfE0
X-Received: by 2002:a0c:ebc8:: with SMTP id k8mr16767333qvq.14.1541440807635;
        Mon, 05 Nov 2018 10:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541440807; cv=none;
        d=google.com; s=arc-20160816;
        b=q21UziE1ysJiL67/MKeSri8SX64ZakovjbWoK8InCAV/AyVQR2BRlMxqZPnr41FM7b
         bZ4OOnrwDD2YGXUM+7sdYPZGvYEFPkunhefmdvxccrUmeJ2cLAIyVuDj7S/FnMmJ+BPH
         u5SvhXyf75JRN5MUh9hHd6Z3aoEnCX/vc4tPlnJbgZNWhDu/3TtgcoSAKG/zdPERZ4El
         LR/aSIVJUQJi7aOhe9Bmtcajnft25ZrieAIelBeD/sg1fhqyP3HtCOmi+6W6UARs4f9Q
         yRslmzKrBOPheRsQBs1Jm+ki8VxxsRnP0h384tvP5XpAGKO/x797VOLN24HVhdG+r989
         qNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to
         :dkim-signature;
        bh=E2DHxVmKPxIDqWA3eWc5ccx9Q2rBb4b4QGeEEhH8NUE=;
        b=IaB7mruHYFg14alNnFPqtLAHFfTYl4EELcqj6ZuTfw5w9Re5f9doxVbH27RVp0HjPh
         4Wq4r8cUl+Oq7gOAKa0pby5N7ztjJ/astI9TeHErC+iur2wbMsXs+vExDs4obb6kSCTj
         9kGQyIzhTJVf7GSqqbQl8todmITAMtYi2R91ngcW3XIuVbogE4pPDeiq4a9awb8HyKST
         pHhr1NCj/wOEY/2okYuPlyrPOV+h2XegsyqS57PRxWvlqJIjhs7d734WSEyYMA+HAkGc
         1VyA4k6IUM5yGmXrXxmztLM8yYKw5UKAhoCM+UxAX58GFZgRrPHd1UGRj4PuuSETNkdE
         eTnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=LAStrsAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7-v6si923583qtr.249.2018.11.05.10.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=LAStrsAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjAU-0004xz-SW
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:00:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gJjAK-0004we-Dr
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 12:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gJjAJ-000489-KL
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 12:59:56 -0500
Received: from mail-eopbgr740103.outbound.protection.outlook.com
	([40.107.74.103]:34240
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1gJjAE-0003zH-Vf; Mon, 05 Nov 2018 12:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=E2DHxVmKPxIDqWA3eWc5ccx9Q2rBb4b4QGeEEhH8NUE=;
	b=LAStrsABEykQw8nEztMvpvYVxqbDA1hL/aAzlC5hVwe1pnGezemrs/npzg4pBU1R+amVmn00ig7AMpTPTUmd222VY3zbm+TXAv2FzM33/z1OzcoHQqFez7Ze11t1JWZr88uOl27qrDy0S9KJ/rv2UnEJidJ3O5dWtmGcSgygcy8=
Received: from MWHPR21MB0189.namprd21.prod.outlook.com (10.173.52.135) by
	MWHPR21MB0143.namprd21.prod.outlook.com (10.173.52.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.6; Mon, 5 Nov 2018 17:59:49 +0000
Received: from MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::cdac:4513:3c87:dd56]) by
	MWHPR21MB0189.namprd21.prod.outlook.com
	([fe80::cdac:4513:3c87:dd56%16]) with mapi id 15.20.1339.006;
	Mon, 5 Nov 2018 17:59:48 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry for the
	Raspberry Pi machines
Thread-Index: AQHUdRvimBICU3vmBUWrS716vXkjCqVBaLPwgAAPKACAAABxUA==
Date: Mon, 5 Nov 2018 17:59:48 +0000
Message-ID: <MWHPR21MB0189B958EA566F8418FBC44B9ECA0@MWHPR21MB0189.namprd21.prod.outlook.com>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-2-f4bug@amsat.org>
	<CAFEAcA-DZMivo-epUmM6NxPzCUbGCfSU+SxEjszTNLdVaB8UxQ@mail.gmail.com>
	<MWHPR21MB018970A4F8FA0E42B5DD48229ECA0@MWHPR21MB0189.namprd21.prod.outlook.com>
	<CAFEAcA-=Y80ZgFOJfVzCxqjaJvG1yO5aBR7efX4OGtOKSXeq2w@mail.gmail.com>
In-Reply-To: <CAFEAcA-=Y80ZgFOJfVzCxqjaJvG1yO5aBR7efX4OGtOKSXeq2w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.107.147.183]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0143;
	6:iGhb26zCJun3IEgzza58np9a95LVKYYX6wq6muKtB+jwzseRtQdeDPgM2jWIKkNTLSWE40VooPmvlxQP8tPOCD7SpjAkdRTjck/8bqJ6+qBdU7KHnPdcfCcC6YijZ4uGigVUckfaGPvmpXrPylc4dQn8e13XACI4C5ae0PQLkcaulYHLkVxUSiq12vO4CV6eijlFDINemsMlPIA+RFOlmzb+9HGGKpXgtZh3ojl5d5mPYdrpR3/blZiFqvXK6KBnPM30aZMQdfxobtfBRUz3QtoPL3MAH4ok1KmkNRGbJB8PzkIDY4/o0LBP6DN+8W/fqwOoputPIZaMqv8IrE1s0N8BSRH1jMOjmMZjs5Pjr1JI2rO/YO9v7kdsPHGgvV83NASc+fgzsrDmXXf1G31WtVi42WxYSNrNtuG7hKyodiSschIPLSkGj52RXllbBlTly2X85dardAmcwgtNC2wYdg==;
	5:2H4SG7FZlpBxgEsqNkBVV0zf685DGdLfA8+2aoKCmbcqfCVw82aQ+wA/pz5fEtGe4FxBUAJD5AkwiqhbVe5PYhmZJ/Aa7BQ1yRrC7dYtQhUKcNd8F9kubqnsdTwJxuGBAgylhf0z850q0mQtlC1HONkfgYf0KnKNvIcL6f5I1Bk=;
	7:kTYM16jCWo1qw4w6lymkJsTgrCwxPzV4IM7MthWF6N0vGhMmAQ5Yw4OvMNnbYhE5+v9CkqH8RNpBbZ0MlEr6KSKSMqI5MXOEZ13Fz+mBYpLkkqiHuCOMYbssPJeu+4hg0wdFFxhKUPV2RMieGWei4A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 104994cf-e435-45c4-b5ce-08d643487a68
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:MWHPR21MB0143; 
x-ms-traffictypediagnostic: MWHPR21MB0143:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-o365-sonar-daas-pilot: True
x-o365eop-header: O365_EOP: Allow for Unauthenticated Relay
x-o365ent-eop-header: Message processed by -  O365_ENT: Allow from ranges
	(Engineering ONLY)
x-microsoft-antispam-prvs: <MWHPR21MB014336D3C3729EBF076478A39ECA0@MWHPR21MB0143.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(8220035)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(2018427008)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR21MB0143; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0143; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(189003)(199004)(86612001)(71190400001)(71200400001)(102836004)(26005)(99286004)(66066001)(10090500001)(7696005)(186003)(53546011)(6506007)(76176011)(97736004)(68736007)(53936002)(316002)(54906003)(22452003)(93886005)(6436002)(9686003)(2900100001)(6916009)(14454004)(55016002)(8936002)(81166006)(2906002)(3846002)(4326008)(6116002)(10290500003)(6246003)(72206003)(81156014)(8676002)(478600001)(106356001)(8990500004)(446003)(25786009)(476003)(11346002)(256004)(486006)(229853002)(305945005)(86362001)(33656002)(105586002)(5660300001)(7736002)(74316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0143;
	H:MWHPR21MB0189.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: vR99VQzfzMDI9sB8JdtQsTQHeo8c1zxuSEE1pB+KSsnvx3zgwgbaRHh6Z7E+axP59v41f3Ct/bVr2tdaDCZV2fsdGPCCd7iy3INIVuTcyfGA8ygB1cCfzstEX5u6OlFdHGguOrtOFfMDEjoz1IKC93Wg2k033qhvylKPpn1H3gi186lSoOVE3PfZvlZSeCmxo41vObC8EsT+2T9IoAe9ps/4jMBsgjDcdKx5+IPx+FNP/OBhK0a404KapYDYdgZtuBpc7uuoFU+9TYMX8DYmOoby6R24rTt72xY7ejdCn7dQudSrTYTghmCaMe+/CR8LIX+3WtRXRP0pK4nMU1BBpSsaxhwVlYGjbiIVnh7SfHs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104994cf-e435-45c4-b5ce-08d643487a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 17:59:48.7851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0143
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.103
Subject: Re: [Qemu-arm] [PATCH for 3.1 v2 1/7] MAINTAINERS: Add an entry for
 the Raspberry Pi machines
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
	Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BUwXg5ijOExN

PiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6
IE1vbmRheSwgNSBOb3ZlbWJlciAyMDE4IDA5OjU4DQo+IA0KPiBPbiA1IE5vdmVtYmVyIDIwMTgg
YXQgMTc6MDYsIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29t
PiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc+DQo+ID4+IEFuZHJldywgYXMgdGhlIG9yaWdpbmFsIHN1Ym1pdHRlciBvZiB0aGUgUmFzcGJl
cnJ5IFBpIGNvZGUgd291bGQgeW91DQo+ID4+IGxpa2UgdG8gYmUgbGlzdGVkIGFzIGEgbWFpbnRh
aW5lciBmb3IgaXQ/DQo+ID4NCj4gPiBUaGFua3MgZm9yIGFza2luZzsgcHJvYmFibHkgbm90IC0t
IEknbSBoYXBweSB0byByZXZpZXcgdGhlIG9kZCBwYXRjaA0KPiA+IGlmIG15IGlucHV0IHdvdWxk
IGJlIGhlbHBmdWwsIGJ1dCBJIGhhdmVuJ3Qgd29ya2VkIG9uIGl0IGZvciB5ZWFycywNCj4gPiBh
bmQgSSBkb24ndCBoYXZlIHNwYXJlIGN5Y2xlcywgc28gSSdkIGp1c3QgYmUgYSBib3R0bGVuZWNr
Lg0KPiANCj4gU3VyZSwgbm8gcHJvYmxlbS4gV291bGQgeW91IGxpa2UgdG8gYmUgbGlzdGVkIGFz
IGEgInJldmlld2VyIg0KPiAobWVhbnMgcGVvcGxlIHdpbGwgQ0MgeW91IG9uIHBhdGNoZXMsIGJh
c2ljYWxseSksIG9yIG5vdCBhdCBhbGw/DQoNClN1cmUsIHJldmlld2VyIGlzIGZpbmUgd2l0aCBt
ZS4NCg0KQW5kcmV3DQo=
