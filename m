Received: by 10.223.197.9 with SMTP id q9csp7030066wrf;
        Thu, 19 Oct 2017 10:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R2aAIl31rLIS9SEyzyAUyYeX6oF7I/L9eC+YXCWgNwdAnQk1V4oWtynZFCimeDNZMjEiOl
X-Received: by 10.200.48.151 with SMTP id v23mr2845980qta.97.1508432823289;
        Thu, 19 Oct 2017 10:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508432823; cv=none;
        d=google.com; s=arc-20160816;
        b=hfcu517kWdna0hu/rqYsJ47FR1OglSXKNqULbUQ4fB1tVkyD6pso9/MR8z4On/PNp3
         LAvHRujc0lziU9qXSIfpu2odgM+iI0CI0l98hft5Iu0KqHjlYYH5wtsnsalDOF85xGbY
         p8rHkVOeuDTTxCyDzx2Rcyk3IFhpqCw0ZQfVmlnnVW/qdi6jERFrtEEnOVt6zChvQqdf
         qWGJKuxa0Ttv7JL+YJmflJQu1X55DzwBDYllDIOh1GOREcYu0oKG6yMcX+UJsJeto2T5
         goyIjObdtNnxkH8aNExVUMomlTDIy8jhY1Zaho4Fa3mVOZnuyCXDXRbSzehYAdbDF/Ox
         qmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :dkim-signature:arc-authentication-results;
        bh=UXj5uqN0rHRZIf9Tg1Z/9tyyAzPLbDn5ohXnvflb0kI=;
        b=wVjIbZm82KD0+B5n1YqI/FaFQtgciyWjfVfspPqHE4szU0aLkU5E3wJ5wTFqFWROoo
         bPHHYAMr9UHsJME9fWhH7duV06SUv4glqMlK8SP8k6wU56Hmxoi7ENVflM9xQcdiOktg
         suncObo6Wjx9W+qL4Wa+l/Z+67QCQxQ9nHc/sq01XmAH66LgCGpzrlh/BrwR1VHP4bh+
         tmsOcj6wRJ/+HG9ItslwSpmHfyouEdzmJNdGaEih/P6aBjHZyWce6VKu1qlM7DKvtwCs
         XfDHuT7XVwu3LxxNDioawOp9s+AX6CJSDhzxT+lJ1WxO629CwOukl6xSefUS8hopUHti
         nnTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=XPBOXMaG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v49si8730078qtv.77.2017.10.19.10.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 10:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=XPBOXMaG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5EHc-0001p0-Ur
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 13:07:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e5EFY-0000Tk-UT
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 13:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e5EFV-0006lg-Jr
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 13:04:52 -0400
Received: from mail-by2nam03on0134.outbound.protection.outlook.com
	([104.47.42.134]:47418
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e5EFV-0006i4-0K; Thu, 19 Oct 2017 13:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=UXj5uqN0rHRZIf9Tg1Z/9tyyAzPLbDn5ohXnvflb0kI=;
	b=XPBOXMaGnc2F3Ozo9EH4CH3egyZZP1Pu5nBvUCMD2b8baPFxPQ2fepsrX5NwK5dnRMMBorKMaxcYNY9Z3ExxFa9NBN8b29/ruHNz5LfLaUfpoLSKQ8uB2BcG6pgWRncF7p4aUfWjYYqcTrNFJ/KVUwoRdBIJd7K+GzVW/UGpfAg=
Received: from MWHPR21MB0159.namprd21.prod.outlook.com (10.173.52.17) by
	MWHPR21MB0829.namprd21.prod.outlook.com (10.173.51.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.178.2; Thu, 19 Oct 2017 17:04:46 +0000
Received: from MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) by
	MWHPR21MB0159.namprd21.prod.outlook.com ([10.173.52.17]) with mapi id
	15.20.0178.002; Thu, 19 Oct 2017 17:04:46 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [RFC PATCH] arm: implement cache/shareability attribute bits for
	PAR registers
Thread-Index: AQHTR6ZaDqdmxFeJsUOUTpprFzxHTaLrZXKAgAAA1SA=
Date: Thu, 19 Oct 2017 17:04:46 +0000
Message-ID: <MWHPR21MB0159A19F056CEE571E0397009E420@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <20171018001608.8388-1-Andrew.Baumann@microsoft.com>
	<CAFEAcA-6saNdT9k9Oo+cMoPWR-miaDq08EhN=3pbVzbadwzOwA@mail.gmail.com>
In-Reply-To: <CAFEAcA-6saNdT9k9Oo+cMoPWR-miaDq08EhN=3pbVzbadwzOwA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Ref=https://api.informationprotection.azure.com/api/72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=baumann@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2017-10-19T10:04:46.0833758-07:00;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
	Sensitivity=General
x-originating-ip: [2001:4898:80e8:c::529]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0829;
	6:A58fbI+QKENufh+voC3VoXshR8++cyleGQbjZo473NdVsiWaKCLDg61EmMMIq/j5rLpCS8v4YjVEvKc7sC1s+ozOoSyHgGXFCGtP0GHFE5chay18OiT3oS8nEBSmUjGKZfIICzXM8oC3Xfz2NxXKAqoIjyi05FK9r0OBOXT7okyVVgwuhuik7OMEeMRNf/ctsZZtZYBWgi+EQT9eoLTiiFd2H+lFabqw1oROpcwXHtuyfkViUXnjlk5kOE68uzXaI9mb3Vs2Yeo7BBqtNeAjldCdLaBHibjO6rcFwDugzUAhKq1VVnIRaNWl2W/itiKpthQu59Xy7DMDZXw/WhxRVAAma06XcFvF0RfM2pDh0/Y=;
	5:p6HZUh1Pjd8qCTpusJIPxZSvUfFKRKZgHfvuq5B9eoCw8sv9H2bidDjitsbZ0MvEENtyJ2TLJbTs4p3Bz5ygC+PQo3VeyKZknL/w4uN5sOcLdCoUwDf67oIi7qdbGNscIbIG0k7/+ZSeLlr/p61s+4UfGdd8tQE6eh8akajOst0=;
	24:5iWlBRWrRldTM6USxEzp7GKrsCm8nxRgboO+LDPmSBODOQrIk/cm0+e1EcspKc5tGcfqsmiFZLsg3s3r9t4N55GzOS48PpwYIU37fRBwdxA=;
	7:i/ENHbfs7gZpgVn9uadGD4VtEdAJOF05WFENDI8RLUDx/ltM3AI+NLTK29sJvJsHY859PfYIljBHH9dZmPHhrRXeA6OgrY0K+hDgYmXt891hz+4KFxfYedau5BSFb+AKwlbfA+r4H7UZwweEHMmmExEemfStlkzBKSR1etkIVGRSyvxu8PF87P8rS362Hy7NFUpEaxz0hdexGr9vZaUUXqf0+mbik0Z5QyYQ4Lxeq2P9dWi9DAR7QEeQM9yc5+tn
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 340225a8-2462-4a95-7087-08d517137fff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254171)(4534019)(4602075)(4627075)(201703031133081)(201702281549075)(48565401081)(2017052603229)(201703131423094);
	SRVR:MWHPR21MB0829; 
x-ms-traffictypediagnostic: MWHPR21MB0829:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-exchange-antispam-report-test: UriScan:(89211679590171);
x-microsoft-antispam-prvs: <MWHPR21MB0829055A8ACADBE0C243A4659E420@MWHPR21MB0829.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6055026)(61426038)(61427038)(6041248)(20161123558100)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0829; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0829; 
x-forefront-prvs: 0465429B7F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39860400002)(376002)(346002)(47760400005)(51914003)(199003)(24454002)(189002)(33656002)(8990500004)(7736002)(305945005)(189998001)(8936002)(86612001)(81156014)(8676002)(81166006)(74316002)(55016002)(86362001)(99286003)(2950100002)(6916009)(50986999)(10290500003)(9686003)(76176999)(54356999)(101416001)(25786009)(72206003)(478600001)(229853002)(551934003)(6436002)(6506006)(2900100001)(5660300001)(2906002)(77096006)(106356001)(105586002)(6116002)(7696004)(6246003)(3660700001)(102836003)(3280700002)(97736004)(10090500001)(4326008)(68736007)(22452003)(53546010)(54906003)(14454004)(53936002)(316002)(21314002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0829;
	H:MWHPR21MB0159.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340225a8-2462-4a95-7087-08d517137fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2017 17:04:46.1387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0829
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.134
Subject: Re: [Qemu-devel] [RFC PATCH] arm: implement cache/shareability
 attribute bits for PAR registers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Andrew Baumann via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cp+bQN3UiU/

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBUaHVyc2RheSwgMTkgT2N0b2JlciAyMDE3IDA5OjUxDQo+IA0KPiBPbiAxOCBPY3Rv
YmVyIDIwMTcgYXQgMDE6MTYsIEFuZHJldyBCYXVtYW5uDQo+IDxBbmRyZXcuQmF1bWFubkBtaWNy
b3NvZnQuY29tPiB3cm90ZToNCj4gSGk7IHRoYW5rcyBmb3IgdGhpcyBwYXRjaC4gTG9va3MgbGlr
ZSB5b3UgZm9yZ290IHRvIGFkZCB5b3VyDQo+IHNpZ25lZC1vZmYtYnkgbGluZS4NCg0KVGhhbmtz
IGZvciB0aGUgcmV2aWV3ISANCg0KSSBkaWRu4oCZdCBzaWduIHRoZSBwYXRjaCwgYmVjYXVzZSBp
dCB3YXNuJ3QgcmVhZHkgdG8gZ28gaW4sIGFuZCBteSAobGltaXRlZCkgdW5kZXJzdGFuZGluZyBv
ZiB0aGUgcHJvdG9jb2wgaXMgdGhhdCB0aGF0J3Mgb25lIG9mIHRoZSB0aGluZ3MgeW91J3JlIGNl
cnRpZnlpbmcgaW4gYSBzaWduYXR1cmUuDQoNCj4gPiAxLiBJcyBhZGRpbmcgdGhlc2UgZW50aXJl
bHkgQVJNLXNwZWNpZmljIGZpZWxkcyB0byB0aGUgZ2VuZXJpYw0KPiA+ICAgIE1lbVR4QXR0cnMg
Yml0ZmllbGQgdGhlIHJpZ2h0IGFwcHJvYWNoLCBvciB3b3VsZCB5b3UgcHJlZmVyIGEgbmV3DQo+
ID4gICAgcmV0dXJuIGZpZWxkIGZyb20gZ2V0X3BoeXNfYWRkcigpIGFuZCBmcmllbmRzPw0KPiAN
Cj4gTWVtVHhBdHRycyBpcyBmb3IgYXR0cmlidXRlcyBvZiBhIG1lbW9yeSB0cmFuc2FjdGlvbiBh
cyB0aGV5DQo+IGdvIG91dCBvbiBhIGJ1cyAoY29uY2VwdHVhbGx5IHNwZWFraW5nKS4gV2hpbGUg
c29tZSBvZiB0aGUNCj4gY2FjaGVhYmlsaXR5IGluZm8gZG9lcyBnbyBvdXQgb24gYSBoYXJkd2Fy
ZSBBWEkgYnVzLCBpdA0KPiBvYnZpb3VzbHkgaXNuJ3QgZm9ybWF0dGVkIGFzIGFuIGluZGV4IGlu
dG8gdGhlIE1BSVIgcmVnaXN0ZXJzLA0KPiBzaW5jZSB0aG9zZSBhcmUgZW50aXJlbHkgQ1BVIGlu
dGVybmFsLiBJJ20gbm90IHN1cmUgdGhlDQo+IHNoYXJlYWJpbGl0eSBzdHVmZiBnb2VzIG91dHNp
ZGUgdGhlIENQVSBhdCBhbGwsIGJ1dCBJIGhhdmVuJ3QNCj4gbG9va2VkIGNsb3NlbHkgYXQgdGhl
IEFYSSBzcGVjLg0KPiANCj4gV2hpbGUgeW91IGNvdWxkIHdhZGUgaW50byB0aGUgY29tcGxleGl0
aWVzIG9mIGZpZ3VyaW5nIG91dCB3aGF0DQo+IGF0dHJpYnV0ZXMgd2Ugd2FudCB0byBleHBvc2Ug
dG8gZGV2aWNlcyB2aWEgdGhlIE1lbVR4QXR0cnMgZmllbGRzLA0KPiBJIHdvdWxkIHN1Z2dlc3Qg
a2VlcGluZyB0aGluZ3MgaW50ZXJuYWwgdG8gdGhlIENQVSBpbXBsZW1lbnRhdGlvbiwNCj4gYnkg
YWRkaW5nIGFub3RoZXIgcGFyYW1ldGVyIHRvIGdldF9waHlzX2FkZHIoKSAmYy4NCg0KT2ssIHdp
bGwgZG8uDQoNCj4gPiAyLiBJcyBpdCBhY2NlcHRhYmxlIHRvIGltcGxlbWVudCB0aGlzIHBpZWNl
bWVhbCBmb3IgdGhlIHNwZWNpYWwgTFBBRQ0KPiA+ICAgIGNhc2Ugd2UgY2FyZSBhYm91dCwgYW5k
IGRlZmVyIHRoZSBtZXNzeSBzcGVjaWFsIGNhc2VzIGZvciBsYXRlcj8gKEkNCj4gPiAgICBob3Bl
IHNvISkNCj4gDQo+IERlcGVuZHMgd2hldGhlciBJIGxvb2sgYXQgdGhlIG90aGVyIHBhcnRzIGFu
ZCBkZWNpZGUgb24geW91cg0KPiBiZWhhbGYgdGhhdCB0aGV5J3JlIGVhc3kgOy0pDQoNCkkgdGhp
bmsgSSB3aWxsIHRha2UgYSBzdGFiIGF0IHRoZSBzdGFnZSAyIHRyYW5zbGF0aW9ucywgYnV0IGdy
b3ZlbGxpbmcgdGhyb3VnaCB0aGUgZGV0YWlscyBvZiB0aGUgdmFyaW91cyBzaG9ydCBQVEUgZm9y
bWF0cyBhbmQgdGhlaXIgcmVtYXBwaW5nIG1lY2hhbmlzbXMgd2Fzbid0IG15IGlkZWEgb2YgYSBm
dW4gdGltZSA6KQ0KDQo+ID4gMy4gSXMgbXkgaW1wbGVtZW50YXRpb24gb2YgbWFpcjAgYW5kIG1h
aXIxICh3aXRoIHRoZSBYWFggY29tbWVudHMpDQo+ID4gICAgc2FuZT8gSSBzdXNwZWN0IGl0J3Mg
bm90LiBJIGhhZCBhIGhhcmQgdGltZSBtYXBwaW5nIHdoYXQgdGhlIEFSTQ0KPiA+ICAgIEFSTSBk
ZXNjcmliZXMgKGUuZy4gaW4gdGhlIHBzZXVkb2NvZGUgZm9yIEFBcmNoMzIuUzFBdHRyRGVjb2Rl
IGFuZA0KPiA+ICAgIEFBcmNoNjQuUzFBdHRyRGVjb2RlKSB0byB0aGUgdW5pb24gaW50ZXJwcmV0
aW5nIG1haXJfZWxbMF0gYW5kDQo+ID4gICAgbWFpcl9lbFsxXS4NCj4gDQo+IFdoZXJlIHRoZSBB
QXJjaDY0LlMxQXR0ckRlY29kZSgpIHBzZXVkb2NvZGUgc2F5cyBNQUlSW10gdGhpcyBpcw0KPiBN
QUlSW1MxVHJhbnNsYXRpb25SZWdpbWUoKV0sIHdoaWNoIGluIFFFTVUgdGVybXMgaXMNCj4gZW52
LT5jcDE1Lm1haXJfZWxbcmVnaW1lX2VsKGVudiwgbW11X2lkeCldLg0KPiANCj4gRm9yIEFBcmNo
MzIgdGhpbmdzIGFyZSBhIGxpdHRsZSB0cmlja2llci4gTlMgTUFJUjAvTUFJUjEgYXJlIGFsd2F5
cw0KPiBpbiBlbnYtPmNwMTUubWFpcjBfbnMgYW5kIGVudi0+Y3AxNS5tYWlyMV9ucyAoYW5kIGlm
IHlvdSBoYXBwZW4gdG8NCj4gd2FudCB0aGUgY29tYmluZWQgNjQgYml0cyBNQUlSMTpNQUlSMCB0
aGVuIGVudi0+Y3AxNS5tYWlyX2VsWzFdDQo+IHdpbGwgZ2l2ZSB5b3UgdGhhdCkuIEJ1dCB3aGVy
ZSBTZWN1cmUgTUFJUjAvTUFJUjEgbGl2ZSBkZXBlbmRzDQo+IG9uIHdoZXRoZXIgRUwzIGlzIEFB
cmNoMzIgb3IgQUFyY2g2NC4gSWYgRUwzIGlzIEFBcmNoMzIgdGhlbiB0aGUNCj4gTUFJUjAvTUFJ
UjEgYXJlIHJlYWxseSBiYW5rZWQgcmVnaXN0ZXJzLCBhbmQgdGhlIHNlY3VyZSBjb3BpZXMNCj4g
YXJlIGluIGVudi0+Y3AxNS5tYWlyMF9zIGFuZCBlbnYtPmNwMTUubWFpcjFfcyAod2l0aCB0aGUg
TUFJUjE6TUFJUjANCj4gY29tYm8gYmVpbmcgaW4gZW52LT5jcDE1Lm1haXJfZWxbM10pKS4gQnV0
IGlmIEVMMyBpcyBBQXJjaDY0IHRoZW4NCj4gdGhlc2UgcmVnaXN0ZXJzIGFyZSBhcmNoaXRlY3R1
cmFsbHkgbm90IGJhbmtlZCwgYW5kIGEgc2VjdXJlIEVMMQ0KPiB3aWxsIGJlIHVzaW5nIGVudi0+
Y3AxNS5tYWlyMF9ucyBhbmQgbWFpcjFfbnMganVzdCBsaWtlIE5TIEVMMS4NCj4gDQo+IEhlbHBm
dWxseSwgcmVnaW1lX2VsKCkgYWJzdHJhY3RzIGF3YXkgbW9zdCBvZiB0aGlzLCBzbyBpZiBhbGwN
Cj4geW91IHdhbnQgaXMgYSBNQUlSMTpNQUlSMCBwYWlyIHlvdSBjYW4ganVzdCBzYXkNCj4gIGVu
di0+Y3AxNS5tYWlyX2VsW3JlZ2ltZV9lbChlbnYsIG1tdV9pZHgpXTsNCj4gdGhlIHNhbWUgYXMg
Zm9yIEFBcmNoNjQuDQo+IA0KPiBXZSBkb24ndCBpbXBsZW1lbnQgQUFyY2gzMiBFTDIgeWV0LCBz
byB0aGUgZGF0YXN0cnVjdHVyZSBpc24ndA0KPiBxdWl0ZSByaWdodCBmb3IgaXQgeWV0LCBidXQg
SE1BSVIxOkhNQUlSMCBpcyBpbiBtYWlyX2VsWzJdDQo+IChhbmQgdGhlIDMyLWJpdCBwYXJ0IG9m
IHRoZSB1bmlvbiBzaG91bGQgaGF2ZSB1aW50MzJfdCBmb3INCj4gaG1haXIwIGFuZCBobWFpcjEg
d2hlcmUgaXQgY3VycmVudGx5IGhhcyBfdW51c2VkX21haXJfMSkuDQoNCkdvdCBpdC4gVGhhbmtz
Lg0KDQpbLi4uXQ0KPiA+IEBAIC0yMTczLDcgKzIyMjQsOSBAQCBzdGF0aWMgdWludDY0X3QgZG9f
YXRzX3dyaXRlKENQVUFSTVN0YXRlICplbnYsDQo+IHVpbnQ2NF90IHZhbHVlLA0KPiA+ICAgICAg
ICAgICAgICBpZiAoIWF0dHJzLnNlY3VyZSkgew0KPiA+ICAgICAgICAgICAgICAgICAgcGFyNjQg
fD0gKDEgPDwgOSk7IC8qIE5TICovDQo+ID4gICAgICAgICAgICAgIH0NCj4gPiAtICAgICAgICAg
ICAgLyogV2UgZG9uJ3Qgc2V0IHRoZSBBVFRSIG9yIFNIIGZpZWxkcyBpbiB0aGUgUEFSLiAqLw0K
PiA+ICsgICAgICAgICAgICBwYXI2NCB8PSAodWludDY0X3QpZ2V0X21lbWF0dHJzKGVudiwgbW11
X2lkeCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
dHRycy5hcm1fYXR0cmluZHgpIDw8IDU2OyAvKkFUVFIqLw0KPiANCj4gSSB0aGluayB0aGlzIGlz
IHRoZSB3cm9uZyBwbGFjZSB0byB0cnkgdG8gZG8gdGhlIGxvb2t1cCBmcm9tDQo+IEF0dHJJbmRl
eFtdIHBhZ2V0YWJsZSBiaXRzIHRvIG1lbW9yeSBhdHRyaWJ1dGVzIHZpYSB0aGUgTUFJUiosDQo+
IGJlY2F1c2Ugbm90IGV2ZXJ5IGtpbmQgb2YgcGFnZSB0YWJsZSBkb2VzIG1lbW9yeSBhdHRyaWJ1
dGVzDQo+IHRoYXQgd2F5LiBJbiBwYXJ0aWN1bGFyIGZvciBzaG9ydCBkZXNjcmlwdG9ycyB3aXRo
IFRFWCByZW1hcA0KPiBkaXNhYmxlZCwgdGhlIGF0dHJpYnV0ZXMgYXJlIGRpcmVjdGx5IGluIHRo
ZSBwYWdlIGRlc2NyaXB0b3JzLA0KPiBhbmQgdGhpcyBpcyBhbHNvIHRydWUgZm9yIHN0YWdlIDIg
dHJhbnNsYXRpb24gdGFibGVzLg0KPiANCj4gU28geW91IHdhbnQgdGhlIHBhZ2UgdGFibGUgd2Fs
ayBmdW5jdGlvbnMgdG8gZGlyZWN0bHkgZmlsbCBpbg0KPiB0aGUgaW5mb3JtYXRpb24gYWJvdXQg
Y2FjaGVhYmlsaXR5IGFuZCBzaGFyZWFiaWxpdHksIGluY2x1ZGluZw0KPiBkb2luZyBsb29rdXBz
IGluIE1BSVIgcmVnaXN0ZXJzIChvciBQUlJSL05NUlIgcmVnaXN0ZXJzLCB3aGljaA0KPiBRRU1V
IHN0b3JlcyBpbiB0aGUgc2FtZSBDUFVTdGF0ZSBmaWVsZHMsIGJ1dCB0aGV5IGhhdmUgYSBkaWZm
ZXJlbnQNCj4gZm9ybWF0LikNCg0KSSBhZ3JlZS4gRldJVywgdGhlIG9yaWdpbmFsIHJlYXNvbiBm
b3IgZG9pbmcgaXQgaGVyZSB3YXMgdGhhdCBJIGRpZG4ndCB3YW50IHRvIHNsb3cgZG93biB0aGUg
bm9ybWFsIHBhZ2UtdGFibGUgd2FsayB3aXRoIGFkZGl0aW9uYWwgbG9naWMgdG8gY29tcHV0ZSB0
aGUgYXR0cmlidXRlcywgd2hpY2ggaXNuJ3QgbmVjZXNzYXJ5IGZvciBhIFRMQiBmaWxsLiBJZiB3
ZSdyZSBhZGRpbmcgZXh0cmEgb3V0IHBhcmFtZXRlcnMgdG8gdGhlIHdhbGtlciwgdGhlbiBJIGNh
biBtYWtlIHRob3NlIG9wdGlvbmFsIGFuZCBza2lwIGNvbXB1dGluZyB0aGVtIHdoZW4gdGhlIHBh
cmFtZXRlciBpcyBOVUxMLg0KDQpBbmRyZXcNCg==
