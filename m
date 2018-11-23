Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1745905wrt;
        Fri, 23 Nov 2018 01:15:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5fjw0zX/1hnUCWyKEnII1REU+byEIOkL9OoAvVu+geyZM7iAco2McCxr03JrXpsn4F1URRN
X-Received: by 2002:a81:2185:: with SMTP id h127-v6mr15125421ywh.331.1542964501974;
        Fri, 23 Nov 2018 01:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964501; cv=none;
        d=google.com; s=arc-20160816;
        b=A4wf31BUP2Nl4mgAg0ZVknRfhwLDId/svazkM/leDdephkeVPY4GMF4MdCGh+V8HP2
         QdbBgkyp6hjNi2Tw5NWTa/63yUc8w+FepsetqUCnFyY9u6W27ln7Kb/1Fx9Ls6sOB9OR
         Zuk4YvqIqCYHZqOrdypOBzeBpKpwGK6cUbvH6T70qGJxF5YAERvH9YlFg8AEsaGV4YMI
         1KfbopbCbRS/1YmgXwmgzdQR4YrS0yST5Mk24uqkfsBlRuCjii0baXVim99D5jsbzfOk
         LkPkEWR5Acl+OL90TKpPB3fKuTig06WnLPt9FNDDS17WZR0A+GLpY2csTuIHzPa/PPbW
         xvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=mNwY5IoIAo33yCQPF951tq3RAttnyWN66vRswIy6LkM=;
        b=PXxFxAqeExbmLXHbNNe7+DJpLiIU5isaJYRDKrNXXrc8CJ2HmEZxQ9oWkaAaFIrmvt
         mgQsRbupzV7hVHWqlYxUdbQLpkl3be7lp+kBJBcH33pFE81bQHrHwmL7QqPSiCKAl9tR
         svIfT5crNkyN4WD9sG4ak3MFa6e2+fcFEtHUdUhUgv8TUjrmcJwDGZoNzuaMql/z70Q7
         OdmGomNCR5oKjj+s8uiaqKFfjo+qDEAoZJg3GGwcGlZu7QP7DVpmeancLuT8U57N01vq
         am7PnYoZHHTRLPALnQJgxuxCe4jWJLpNPO/VyKCtLwifdECpSHJW9EdnPYexez4ryXQh
         us/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=UhNSlYmo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g7-v6si32727765ybd.11.2018.11.23.01.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=UhNSlYmo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:51129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7YD-0006kY-Bt
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:15:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gQ7Y1-0006j0-0p
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:14:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gQ7Xz-0003fp-9V
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:14:48 -0500
Received: from mail-ve1eur03on060c.outbound.protection.outlook.com
	([2a01:111:f400:fe09::60c]:50176
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gQ7Xs-0003Tw-DG; Fri, 23 Nov 2018 04:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mNwY5IoIAo33yCQPF951tq3RAttnyWN66vRswIy6LkM=;
	b=UhNSlYmo9GvsBYvBHPQozSAtQNa59+G/RBiw2EG7eCjx0h7RXOcgoCftHFAMCUCywX1cAq6X7R7csQQ36BYZhi3X41T00LEzMWIS3fkrxUxgKBDaegHZfmLjZPiDqpyOCkxt0+r8XQQMEOFUWxejRpCfaGJ/rooLLftG/ywmcG0=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (20.177.33.16) by
	AM6PR04MB5925.eurprd04.prod.outlook.com (20.179.3.158) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.14; Fri, 23 Nov 2018 09:14:37 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
	([fe80::25cb:1714:8bcf:918c]) by
	AM6PR04MB4838.eurprd04.prod.outlook.com
	([fe80::25cb:1714:8bcf:918c%5]) with mapi id 15.20.1294.048;
	Fri, 23 Nov 2018 09:14:37 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
Thread-Topic: [Qemu-devel] [RFC v9 06/17] virtio-iommu: Endpoint and domains
	structs and helpers
Thread-Index: AQHUgocWUvJY1jFZFUKe5ns8xItHyaVc5s4AgAAXXACAABRJsA==
Date: Fri, 23 Nov 2018 09:14:37 +0000
Message-ID: <AM6PR04MB48383B55B9ECFE4E231405179AD40@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
	<20181122171538.12359-7-eric.auger@redhat.com>
	<VI1PR04MB484549F41959A613D3517F7D9AD40@VI1PR04MB4845.eurprd04.prod.outlook.com>
	<19f3bee1-48e3-444b-ec90-702d9dae4c70@redhat.com>
In-Reply-To: <19f3bee1-48e3-444b-ec90-702d9dae4c70@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [14.142.187.166]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR04MB5925;
	6:dFd761WtTx/uy+qD2D3x2rL85rcd8J9iezYTHqMjZ4TC3q7bNBAIFZkwLm6qpq97GAJdsfjvv5mdEnH6SsWGHreUC5JMsb3B8+gtdTTvecjQVkf1jNsPQje+sgzBkG8upHAjfnZxStlgCJeLUWgATvmHc9M7Uu3w/jzEQyRjVMvtC3tGfj5nTdnqrbN3YIdNSVShMtOi+ZeDVJE8cn3b1Hg5XkV0dDfvwnveJkZzDH/2GiQPAs0AX070CHQRui+oKV35Ap53CBxms8P9jPRjg17hJA3ZfbNeT0SVN7PcZtw6Xvw9B3/GVTzHzzow4UV3/DHbL5+p2oBzdDonUNr2DBDiA7GVM1tB5jlczBLQ2zxBNRr2ZslBw2akyGDt3JOCII8vy0UJ+3dq6nJh6TnZH2Sf8Fyd045iHwdwH99P6i5iBj+sMsL3MkzawCp4HwJqUbQrsoUPE339wg1GbNz8fA==;
	5:zNCh8QsP8WsKQLPvQOovFDmkZvJDRkNjp91kSKukvPi+GWs2nidQORZYd9Prsf/+iXHHaKBz2zZFydU19u7f9fm4qmkVIW1JBqPwukWONhUx1NG32dPOsiKd8piERdSQFx2KADZIEE1gbTFvb5k0GqYbLSoUkGvR7sWVnRER0so=;
	7:gKFL9gfIuSuS7USbgzUE47No5Hd5chNS7nGl0zcOp6RQ2U/Sn3qaXlyiu5GAQSzY7kGzXahZHWh/yueR/2LjsW6u5F4ZYwI5G4INfx6Qk1OIGRGcIFxKM5C3z+eMT0MlVrwrutm+5yxRkZeL2TzRoQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9070653f-1359-49fc-b762-08d6512417c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR04MB5925; 
x-ms-traffictypediagnostic: AM6PR04MB5925:
x-microsoft-antispam-prvs: <AM6PR04MB59253B283ACC0AC644B92FA89AD40@AM6PR04MB5925.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231442)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR04MB5925; BCL:0; PCL:0; RULEID:; SRVR:AM6PR04MB5925; 
x-forefront-prvs: 086597191B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(366004)(376002)(136003)(396003)(199004)(189003)(13464003)(55236004)(76176011)(7696005)(476003)(186003)(3846002)(5024004)(53936002)(4744004)(6246003)(25786009)(6436002)(53546011)(14444005)(256004)(6506007)(478600001)(102836004)(68736007)(2501003)(44832011)(99286004)(11346002)(486006)(26005)(6116002)(2906002)(2900100001)(229853002)(446003)(66066001)(54906003)(105586002)(71190400001)(2201001)(71200400001)(110136005)(8676002)(8936002)(78486014)(316002)(97736004)(81156014)(81166006)(106356001)(5660300001)(9686003)(93886005)(4326008)(55016002)(7416002)(39060400002)(33656002)(7736002)(86362001)(14454004)(74316002)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB5925;
	H:AM6PR04MB4838.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: v/QXfd/iWQPjAWGlI0yI9H9M8evELCEjAIz+HC+KCm5mPEUzCssuGcMnrV4wDdIKMcywuqJ6lrAatgY7mo/H2YqxYLnBubM13+JrXQSidZb2HAnbLN4dZBoeRnpRVMohHe7JJG21xxI61eVK2FrMNTnllwVG+SXnD2VEbZ455+nvW2+m3knjP2bnfZtdj/2GpATmDIPFBRIVbeSUIXGcBBEQizTuNLyQ08Q/V6ukuPA6HPdQesudHb9JJC8g9Z1BTZIRVZao6sPrcuUapMM1sUx+PD8LjE1PVVSdA1qpzSnuA9w0YlwmjuczoYEuoi7nzTGMkrYtbIe2KslOcF8Ok77y2+AqMPvnBmJXBdGs2qA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9070653f-1359-49fc-b762-08d6512417c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2018 09:14:37.7802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5925
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe09::60c
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v9 06/17] virtio-iommu: Endpoint
 and domains structs and helpers
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SAS9eP0Fdg/r

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjMs
IDIwMTggMToyMyBQTQ0KPiBUbzogQmhhcmF0IEJodXNoYW4gPGJoYXJhdC5iaHVzaGFuQG54cC5j
b20+Ow0KPiBlcmljLmF1Z2VyLnByb0BnbWFpbC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsg
cWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgbXN0QHJl
ZGhhdC5jb207IGplYW4tDQo+IHBoaWxpcHBlLmJydWNrZXJAYXJtLmNvbQ0KPiBDYzogdG5Ac2Vt
aWhhbGYuY29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgcGV0ZXJ4QHJlZGhhdC5jb20NCj4gU3Vi
amVjdDogUmU6IFtRZW11LWRldmVsXSBbUkZDIHY5IDA2LzE3XSB2aXJ0aW8taW9tbXU6IEVuZHBv
aW50IGFuZA0KPiBkb21haW5zIHN0cnVjdHMgYW5kIGhlbHBlcnMNCj4gDQo+IEhpIEJoYXJhdCwN
Cj4gDQo+IE9uIDExLzIzLzE4IDc6MzggQU0sIEJoYXJhdCBCaHVzaGFuIHdyb3RlOg0KPiA+IEhp
IEVyaWMsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
RXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBUaHVyc2RheSwg
Tm92ZW1iZXIgMjIsIDIwMTggMTA6NDUgUE0NCj4gPj4gVG86IGVyaWMuYXVnZXIucHJvQGdtYWls
LmNvbTsgZXJpYy5hdWdlckByZWRoYXQuY29tOyBxZW11LQ0KPiA+PiBkZXZlbEBub25nbnUub3Jn
OyBxZW11LWFybUBub25nbnUub3JnOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7DQo+ID4+IG1z
dEByZWRoYXQuY29tOyBqZWFuLXBoaWxpcHBlLmJydWNrZXJAYXJtLmNvbQ0KPiA+PiBDYzoga2V2
aW4udGlhbkBpbnRlbC5jb207IHRuQHNlbWloYWxmLmNvbTsgQmhhcmF0IEJodXNoYW4NCj4gPj4g
PGJoYXJhdC5iaHVzaGFuQG54cC5jb20+OyBwZXRlcnhAcmVkaGF0LmNvbQ0KPiA+PiBTdWJqZWN0
OiBbUkZDIHY5IDA2LzE3XSB2aXJ0aW8taW9tbXU6IEVuZHBvaW50IGFuZCBkb21haW5zIHN0cnVj
dHMNCj4gPj4gYW5kIGhlbHBlcnMNCj4gPj4NCj4gPj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgZG9t
YWluIGFuZCBlbmRwb2ludCBpbnRlcm5hbCBkYXRhdHlwZXMuIEJvdGggYXJlDQo+ID4+IHN0b3Jl
ZCBpbiBSQiB0cmVlcy4gVGhlIGRvbWFpbiBvd25zIGEgbGlzdCBvZiBlbmRwb2ludHMgYXR0YWNo
ZWQgdG8gaXQuDQo+ID4+DQo+ID4+IEhlbHBlcnMgdG8gZ2V0L3B1dCBlbmQgcG9pbnRzIGFuZCBk
b21haW5zIGFyZSBpbnRyb2R1Y2VkLg0KPiA+PiBnZXQoKSBoZWxwZXJzIHdpbGwgYmVjb21lIHN0
YXRpYyBpbiBzdWJzZXF1ZW50IHBhdGNoZXMuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEVy
aWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4gPj4NCj4gPj4gLS0tDQo+ID4+DQo+
ID4+IHY2IC0+IHY3Og0KPiA+PiAtIG9uIHZpcnRpb19pb21tdV9maW5kX2FkZF9hcyB0aGUgYnVz
IG51bWJlciBjb21wdXRhdGlvbiBtYXkNCj4gPj4gICBub3QgYmUgZmluYWxpemVkIHlldCBzbyB3
ZSBjYW5ub3QgcmVnaXN0ZXIgdGhlIEVQcyBhdCB0aGF0IHRpbWUuDQo+ID4+ICAgSGVuY2UsIGxl
dCdzIHJlbW92ZSB0aGUgZ2V0X2VuZHBvaW50IGFuZCBhbHNvIGRvIG5vdCB1c2UgdGhlDQo+ID4+
ICAgYnVzIG51bWJlciBmb3IgYnVpbGRpbmcgdGhlIG1lbW9yeSByZWdpb24gbmFtZSBzdHJpbmcg
KG9ubHkNCj4gPj4gICB1c2VkIGZvciBkZWJ1ZyB0aG91Z2gpLg0KPiA+DQo+ID4gRW5kcG9pbnQg
cmVnaXN0cmF0aW9uIGZyb20gdmlydGlvX2lvbW11X2ZpbmRfYWRkX2FzIHRvIFBST0JFIHJlcXVl
c3QuDQo+ID4gSXQgaXMgbWVudGlvbmVkIHRoYXQgIiB0aGUgYnVzIG51bWJlciBjb21wdXRhdGlv
biBtYXkgbm90IGJlIGZpbmFsaXplZCAiLg0KPiBDYW4geW91IHBsZWFzZSBnaXZlIHNvbWUgbW9y
ZSBpbmZvcm1hdGlvbi4NCj4gPiBJIGFtIGFza2luZyB0aGlzIGJlY2F1c2UgZnJvbSB2ZmlvIHBl
cnNwZWN0aXZlIHRyYW5zbGF0ZS9yZXBsYXkgd2lsbCBiZQ0KPiBjYWxsZWQgbXVjaCBiZWZvcmUg
dGhlIFBST0JFIHJlcXVlc3QgYW5kIGVuZHBvaW50IG5lZWRlZCB0byBiZQ0KPiByZWdpc3RlcmVk
IGJ5IHRoYXQgdGltZS4NCj4gV2hlbiBmcm9tIHZpcnRpb19pb21tdV9maW5kX2FkZCgpIGdldHMg
Y2FsbGVkLCB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlDQo+IEJERiBvZiB0aGUgZGV2aWNlIGlz
IG5vdCB5ZXQgY29tcHV0ZWQsIHR5cGljYWxseSBpZiB0aGUgRVAgaXMgcGx1Z2dlZCBvbiBhDQo+
IHNlY29uZGFyeSBidXMuIFRoYXQncyB3aHkgSSBwb3N0cG9uZWQgdGhlIHJlZ2lzdHJhdGlvbi4g
RG8geW91IGhhdmUgaWRlYQ0KPiBXaGVuIHlvdSB3b3VsZCBuZWVkIHRoZSByZWdpc3RyYXRpb24g
dG8gaGFwcGVuPw0KDQpXZSB3YW50IHRoZSBlbmRwb2ludCByZWdpc3RlcmF0aW9uIGJlZm9yZSBy
ZXBsYXkvdHJhbnNsYXRlKCkgaXMgY2FsbGVkIGZvciBib3RoIHZpcnRpby92ZmlvIGFuZCBJIGFt
IHRyeWluZyB0byB1bmRlcnN0YW5kIHdoZW4gd2Ugc2hvdWxkIHJlZ2lzdGVyIHRoZSBlbmRwb2lu
dC4NCkkgYW0gbG9va2luZyBhdCBhbWQgaW9tbXUsIHRoZXJlIHBjaV9zZXR1cF9pb21tdSgpIHBy
b3ZpZGVzIHRoZSBjYWxsYmFjayBmdW5jdGlvbiB3aGljaCBpcyBjYWxsZWQgd2l0aCAiZGV2Zm4i
IGZyb20gcGNpX2RldmljZV9pb21tdV9hZGRyZXNzX3NwYWNlKCkuIEFyZSB5b3Ugc2F5aW5nIHRo
YXQgZGV2Zm4gcHJvdmlkZWQgYnkgcGNpX2RldmljZV9pb21tdV9hZGRyZXNzX3NwYWNlKCkgY2Fu
IGJlIGludmFsaWQ/IA0KDQpUaGFua3MNCi1CaGFyYXQNCg0KPiANCj4gVGhhbmtzDQo+IA0KPiBF
cmljDQo+ID4NCj4gPg0KPiA+IFRoYW5rcw0KPiA+IC1CaGFyYXQNCj4gPg0KPiA+Pg0KPiA+PiB2
NCAtPiB2NToNCj4gPj4gLSBpbml0aWFsaXplIGFzLT5lbmRwb2ludF9saXN0DQo+ID4+DQo+ID4+
IHYzIC0+IHY0Og0KPiA+PiAtIG5ldyBzZXBhcmF0ZSBwYXRjaA0KPiA+PiAtLS0NCj4gPj4gIGh3
L3ZpcnRpby90cmFjZS1ldmVudHMgICB8ICAgNCArKw0KPiA+PiAgaHcvdmlydGlvL3ZpcnRpby1p
b21tdS5jIHwgMTI1DQo+ID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQ0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3RyYWNlLWV2ZW50cyBiL2h3L3Zp
cnRpby90cmFjZS1ldmVudHMgaW5kZXgNCj4gPj4gOTI3MGIwNDYzZS4uNGIxNTA4Njg3MiAxMDA2
NDQNCj4gPj4gLS0tIGEvaHcvdmlydGlvL3RyYWNlLWV2ZW50cw0KPiA+PiArKysgYi9ody92aXJ0
aW8vdHJhY2UtZXZlbnRzDQo+ID4+IEBAIC02MSwzICs2MSw3IEBAIHZpcnRpb19pb21tdV9tYXAo
dWludDMyX3QgZG9tYWluX2lkLCB1aW50NjRfdA0KPiA+PiB2aXJ0X3N0YXJ0LCB1aW50NjRfdCB2
aXJ0X2VuZCwgdWluICB2aXJ0aW9faW9tbXVfdW5tYXAodWludDMyX3QNCj4gPj4gZG9tYWluX2lk
LCB1aW50NjRfdCB2aXJ0X3N0YXJ0LCB1aW50NjRfdCB2aXJ0X2VuZCkgImRvbWFpbj0lZA0KPiB2
aXJ0X3N0YXJ0PTB4JSJQUkl4NjQiDQo+ID4+IHZpcnRfZW5kPTB4JSJQUkl4NjQgIHZpcnRpb19p
b21tdV90cmFuc2xhdGUoY29uc3QgY2hhciAqbmFtZSwNCj4gPj4gdWludDMyX3QgcmlkLCB1aW50
NjRfdCBpb3ZhLCBpbnQgZmxhZykgIm1yPSVzIHJpZD0lZCBhZGRyPTB4JSJQUkl4NjQiDQo+IGZs
YWc9JWQiDQo+ID4+ICB2aXJ0aW9faW9tbXVfaW5pdF9pb21tdV9tcihjaGFyICppb21tdV9tcikg
ImluaXQgJXMiDQo+ID4+ICt2aXJ0aW9faW9tbXVfZ2V0X2VuZHBvaW50KHVpbnQzMl90IGVwX2lk
KSAiQWxsb2MgZW5kcG9pbnQ9JWQiDQo+ID4+ICt2aXJ0aW9faW9tbXVfcHV0X2VuZHBvaW50KHVp
bnQzMl90IGVwX2lkKSAiRnJlZSBlbmRwb2ludD0lZCINCj4gPj4gK3ZpcnRpb19pb21tdV9nZXRf
ZG9tYWluKHVpbnQzMl90IGRvbWFpbl9pZCkgIkFsbG9jIGRvbWFpbj0lZCINCj4gPj4gK3ZpcnRp
b19pb21tdV9wdXRfZG9tYWluKHVpbnQzMl90IGRvbWFpbl9pZCkgIkZyZWUgZG9tYWluPSVkIg0K
PiA+PiBkaWZmIC0tZ2l0IGEvaHcvdmlydGlvL3ZpcnRpby1pb21tdS5jIGIvaHcvdmlydGlvL3Zp
cnRpby1pb21tdS5jDQo+ID4+IGluZGV4DQo+ID4+IGRlYWQwNjJiYWYuLjFiOWMzYmE0MTYgMTAw
NjQ0DQo+ID4+IC0tLSBhL2h3L3ZpcnRpby92aXJ0aW8taW9tbXUuYw0KPiA+PiArKysgYi9ody92
aXJ0aW8vdmlydGlvLWlvbW11LmMNCj4gPj4gQEAgLTMzLDIwICszMywxMjQgQEANCj4gPj4gICNp
bmNsdWRlICJody92aXJ0aW8vdmlydGlvLWJ1cy5oIg0KPiA+PiAgI2luY2x1ZGUgImh3L3ZpcnRp
by92aXJ0aW8tYWNjZXNzLmgiDQo+ID4+ICAjaW5jbHVkZSAiaHcvdmlydGlvL3ZpcnRpby1pb21t
dS5oIg0KPiA+PiArI2luY2x1ZGUgImh3L3BjaS9wY2lfYnVzLmgiDQo+ID4+ICsjaW5jbHVkZSAi
aHcvcGNpL3BjaS5oIg0KPiA+Pg0KPiA+PiAgLyogTWF4IHNpemUgKi8NCj4gPj4gICNkZWZpbmUg
VklPTU1VX0RFRkFVTFRfUVVFVUVfU0laRSAyNTYNCj4gPj4NCj4gPj4gK3R5cGVkZWYgc3RydWN0
IHZpb21tdV9kb21haW4gew0KPiA+PiArICAgIHVpbnQzMl90IGlkOw0KPiA+PiArICAgIEdUcmVl
ICptYXBwaW5nczsNCj4gPj4gKyAgICBRTElTVF9IRUFEKCwgdmlvbW11X2VuZHBvaW50KSBlbmRw
b2ludF9saXN0OyB9IHZpb21tdV9kb21haW47DQo+ID4+ICsNCj4gPj4gK3R5cGVkZWYgc3RydWN0
IHZpb21tdV9lbmRwb2ludCB7DQo+ID4+ICsgICAgdWludDMyX3QgaWQ7DQo+ID4+ICsgICAgdmlv
bW11X2RvbWFpbiAqZG9tYWluOw0KPiA+PiArICAgIFFMSVNUX0VOVFJZKHZpb21tdV9lbmRwb2lu
dCkgbmV4dDsNCj4gPj4gKyAgICBWaXJ0SU9JT01NVSAqdmlvbW11Ow0KPiA+PiArfSB2aW9tbXVf
ZW5kcG9pbnQ7DQo+ID4+ICsNCj4gPj4gK3R5cGVkZWYgc3RydWN0IHZpb21tdV9pbnRlcnZhbCB7
DQo+ID4+ICsgICAgdWludDY0X3QgbG93Ow0KPiA+PiArICAgIHVpbnQ2NF90IGhpZ2g7DQo+ID4+
ICt9IHZpb21tdV9pbnRlcnZhbDsNCj4gPj4gKw0KPiA+PiAgc3RhdGljIGlubGluZSB1aW50MTZf
dCB2aXJ0aW9faW9tbXVfZ2V0X3NpZChJT01NVURldmljZSAqZGV2KSAgew0KPiA+PiAgICAgIHJl
dHVybiBQQ0lfQlVJTERfQkRGKHBjaV9idXNfbnVtKGRldi0+YnVzKSwgZGV2LT5kZXZmbik7ICB9
DQo+ID4+DQo+ID4+ICtzdGF0aWMgZ2ludCBpbnRlcnZhbF9jbXAoZ2NvbnN0cG9pbnRlciBhLCBn
Y29uc3Rwb2ludGVyIGIsIGdwb2ludGVyDQo+ID4+ICt1c2VyX2RhdGEpIHsNCj4gPj4gKyAgICB2
aW9tbXVfaW50ZXJ2YWwgKmludGEgPSAodmlvbW11X2ludGVydmFsICopYTsNCj4gPj4gKyAgICB2
aW9tbXVfaW50ZXJ2YWwgKmludGIgPSAodmlvbW11X2ludGVydmFsICopYjsNCj4gPj4gKw0KPiA+
PiArICAgIGlmIChpbnRhLT5oaWdoIDw9IGludGItPmxvdykgew0KPiA+PiArICAgICAgICByZXR1
cm4gLTE7DQo+ID4+ICsgICAgfSBlbHNlIGlmIChpbnRiLT5oaWdoIDw9IGludGEtPmxvdykgew0K
PiA+PiArICAgICAgICByZXR1cm4gMTsNCj4gPj4gKyAgICB9IGVsc2Ugew0KPiA+PiArICAgICAg
ICByZXR1cm4gMDsNCj4gPj4gKyAgICB9DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gK3N0YXRpYyB2
b2lkDQo+ID4+IHZpcnRpb19pb21tdV9kZXRhY2hfZW5kcG9pbnRfZnJvbV9kb21haW4odmlvbW11
X2VuZHBvaW50DQo+ID4+ICsqZXApIHsNCj4gPj4gKyAgICBRTElTVF9SRU1PVkUoZXAsIG5leHQp
Ow0KPiA+PiArICAgIGVwLT5kb21haW4gPSBOVUxMOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICt2
aW9tbXVfZW5kcG9pbnQgKnZpcnRpb19pb21tdV9nZXRfZW5kcG9pbnQoVmlydElPSU9NTVUgKnMs
DQo+ID4+IHVpbnQzMl90DQo+ID4+ICtlcF9pZCk7IHZpb21tdV9lbmRwb2ludCAqdmlydGlvX2lv
bW11X2dldF9lbmRwb2ludChWaXJ0SU9JT01NVQ0KPiAqcywNCj4gPj4gK3VpbnQzMl90IGVwX2lk
KSB7DQo+ID4+ICsgICAgdmlvbW11X2VuZHBvaW50ICplcDsNCj4gPj4gKw0KPiA+PiArICAgIGVw
ID0gZ190cmVlX2xvb2t1cChzLT5lbmRwb2ludHMsIEdVSU5UX1RPX1BPSU5URVIoZXBfaWQpKTsN
Cj4gPj4gKyAgICBpZiAoZXApIHsNCj4gPj4gKyAgICAgICAgcmV0dXJuIGVwOw0KPiA+PiArICAg
IH0NCj4gPj4gKyAgICBlcCA9IGdfbWFsbG9jMChzaXplb2YoKmVwKSk7DQo+ID4+ICsgICAgZXAt
PmlkID0gZXBfaWQ7DQo+ID4+ICsgICAgZXAtPnZpb21tdSA9IHM7DQo+ID4+ICsgICAgdHJhY2Vf
dmlydGlvX2lvbW11X2dldF9lbmRwb2ludChlcF9pZCk7DQo+ID4+ICsgICAgZ190cmVlX2luc2Vy
dChzLT5lbmRwb2ludHMsIEdVSU5UX1RPX1BPSU5URVIoZXBfaWQpLCBlcCk7DQo+ID4+ICsgICAg
cmV0dXJuIGVwOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtzdGF0aWMgdm9pZCB2aXJ0aW9faW9t
bXVfcHV0X2VuZHBvaW50KGdwb2ludGVyIGRhdGEpIHsNCj4gPj4gKyAgICB2aW9tbXVfZW5kcG9p
bnQgKmVwID0gKHZpb21tdV9lbmRwb2ludCAqKWRhdGE7DQo+ID4+ICsNCj4gPj4gKyAgICBpZiAo
ZXAtPmRvbWFpbikgew0KPiA+PiArICAgICAgICB2aXJ0aW9faW9tbXVfZGV0YWNoX2VuZHBvaW50
X2Zyb21fZG9tYWluKGVwKTsNCj4gPj4gKyAgICAgICAgZ190cmVlX3VucmVmKGVwLT5kb21haW4t
Pm1hcHBpbmdzKTsNCj4gPj4gKyAgICB9DQo+ID4+ICsNCj4gPj4gKyAgICB0cmFjZV92aXJ0aW9f
aW9tbXVfcHV0X2VuZHBvaW50KGVwLT5pZCk7DQo+ID4+ICsgICAgZ19mcmVlKGVwKTsNCj4gPj4g
K30NCj4gPj4gKw0KPiA+PiArdmlvbW11X2RvbWFpbiAqdmlydGlvX2lvbW11X2dldF9kb21haW4o
VmlydElPSU9NTVUgKnMsDQo+IHVpbnQzMl90DQo+ID4+ICtkb21haW5faWQpOyB2aW9tbXVfZG9t
YWluDQo+ICp2aXJ0aW9faW9tbXVfZ2V0X2RvbWFpbihWaXJ0SU9JT01NVQ0KPiA+PiAqcywNCj4g
Pj4gK3VpbnQzMl90IGRvbWFpbl9pZCkgew0KPiA+PiArICAgIHZpb21tdV9kb21haW4gKmRvbWFp
bjsNCj4gPj4gKw0KPiA+PiArICAgIGRvbWFpbiA9IGdfdHJlZV9sb29rdXAocy0+ZG9tYWlucywN
Cj4gR1VJTlRfVE9fUE9JTlRFUihkb21haW5faWQpKTsNCj4gPj4gKyAgICBpZiAoZG9tYWluKSB7
DQo+ID4+ICsgICAgICAgIHJldHVybiBkb21haW47DQo+ID4+ICsgICAgfQ0KPiA+PiArICAgIGRv
bWFpbiA9IGdfbWFsbG9jMChzaXplb2YoKmRvbWFpbikpOw0KPiA+PiArICAgIGRvbWFpbi0+aWQg
PSBkb21haW5faWQ7DQo+ID4+ICsgICAgZG9tYWluLT5tYXBwaW5ncyA9DQo+ID4+IGdfdHJlZV9u
ZXdfZnVsbCgoR0NvbXBhcmVEYXRhRnVuYylpbnRlcnZhbF9jbXAsDQo+ID4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIChHRGVzdHJveU5vdGlmeSlnX2ZyZWUsDQo+
ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChHRGVzdHJveU5vdGlmeSln
X2ZyZWUpOw0KPiA+PiArICAgIGdfdHJlZV9pbnNlcnQocy0+ZG9tYWlucywgR1VJTlRfVE9fUE9J
TlRFUihkb21haW5faWQpLA0KPiBkb21haW4pOw0KPiA+PiArICAgIFFMSVNUX0lOSVQoJmRvbWFp
bi0+ZW5kcG9pbnRfbGlzdCk7DQo+ID4+ICsgICAgdHJhY2VfdmlydGlvX2lvbW11X2dldF9kb21h
aW4oZG9tYWluX2lkKTsNCj4gPj4gKyAgICByZXR1cm4gZG9tYWluOw0KPiA+PiArfQ0KPiA+PiAr
DQo+ID4+ICtzdGF0aWMgdm9pZCB2aXJ0aW9faW9tbXVfcHV0X2RvbWFpbihncG9pbnRlciBkYXRh
KSB7DQo+ID4+ICsgICAgdmlvbW11X2RvbWFpbiAqZG9tYWluID0gKHZpb21tdV9kb21haW4gKilk
YXRhOw0KPiA+PiArICAgIHZpb21tdV9lbmRwb2ludCAqaXRlciwgKnRtcDsNCj4gPj4gKw0KPiA+
PiArICAgIFFMSVNUX0ZPUkVBQ0hfU0FGRShpdGVyLCAmZG9tYWluLT5lbmRwb2ludF9saXN0LCBu
ZXh0LCB0bXApIHsNCj4gPj4gKyAgICAgICAgdmlydGlvX2lvbW11X2RldGFjaF9lbmRwb2ludF9m
cm9tX2RvbWFpbihpdGVyKTsNCj4gPj4gKyAgICB9DQo+ID4+ICsgICAgZ190cmVlX2Rlc3Ryb3ko
ZG9tYWluLT5tYXBwaW5ncyk7DQo+ID4+ICsgICAgdHJhY2VfdmlydGlvX2lvbW11X3B1dF9kb21h
aW4oZG9tYWluLT5pZCk7DQo+ID4+ICsgICAgZ19mcmVlKGRvbWFpbik7DQo+ID4+ICt9DQo+ID4+
ICsNCj4gPj4gIHN0YXRpYyBBZGRyZXNzU3BhY2UgKnZpcnRpb19pb21tdV9maW5kX2FkZF9hcyhQ
Q0lCdXMgKmJ1cywgdm9pZA0KPiA+PiAqb3BhcXVlLA0KPiA+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBkZXZmbikgIHsNCj4gPj4gICAgICBWaXJ0
SU9JT01NVSAqcyA9IG9wYXF1ZTsNCj4gPj4gICAgICBJT01NVVBjaUJ1cyAqc2J1cyA9IGdfaGFz
aF90YWJsZV9sb29rdXAocy0+YXNfYnlfYnVzcHRyLCBidXMpOw0KPiA+PiArICAgIHN0YXRpYyB1
aW50MzJfdCBtcl9pbmRleDsNCj4gPj4gICAgICBJT01NVURldmljZSAqc2RldjsNCj4gPj4NCj4g
Pj4gICAgICBpZiAoIXNidXMpIHsNCj4gPj4gQEAgLTYwLDcgKzE2NCw3IEBAIHN0YXRpYyBBZGRy
ZXNzU3BhY2UNCj4gPj4gKnZpcnRpb19pb21tdV9maW5kX2FkZF9hcyhQQ0lCdXMgKmJ1cywgdm9p
ZCAqb3BhcXVlLA0KPiA+PiAgICAgIGlmICghc2Rldikgew0KPiA+PiAgICAgICAgICBjaGFyICpu
YW1lID0gZ19zdHJkdXBfcHJpbnRmKCIlcy0lZC0lZCIsDQo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVFlQRV9WSVJUSU9fSU9NTVVfTUVNT1JZX1JFR0lPTiwNCj4g
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfYnVzX251bShidXMp
LCBkZXZmbik7DQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXJf
aW5kZXgrKywgZGV2Zm4pOw0KPiA+PiAgICAgICAgICBzZGV2ID0gc2J1cy0+cGJkZXZbZGV2Zm5d
ID0gZ19tYWxsb2MwKHNpemVvZihJT01NVURldmljZSkpOw0KPiA+Pg0KPiA+PiAgICAgICAgICBz
ZGV2LT52aW9tbXUgPSBzOw0KPiA+PiBAQCAtNzUsNiArMTc5LDcgQEAgc3RhdGljIEFkZHJlc3NT
cGFjZQ0KPiA+PiAqdmlydGlvX2lvbW11X2ZpbmRfYWRkX2FzKFBDSUJ1cyAqYnVzLCB2b2lkICpv
cGFxdWUsDQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBVSU5UNjRfTUFY
KTsNCj4gPj4gICAgICAgICAgYWRkcmVzc19zcGFjZV9pbml0KCZzZGV2LT5hcywNCj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIE1FTU9SWV9SRUdJT04oJnNkZXYtPmlvbW11X21yKSwN
Cj4gPj4gVFlQRV9WSVJUSU9fSU9NTVUpOw0KPiA+PiArICAgICAgICBnX2ZyZWUobmFtZSk7DQo+
ID4+ICAgICAgfQ0KPiA+Pg0KPiA+PiAgICAgIHJldHVybiAmc2Rldi0+YXM7DQo+ID4+IEBAIC0z
MzIsNiArNDM3LDEzIEBAIHN0YXRpYyBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24NCj4gPj4gdm1z
dGF0ZV92aXJ0aW9faW9tbXVfZGV2aWNlID0gew0KPiA+PiAgICAgIH0sDQo+ID4+ICB9Ow0KPiA+
Pg0KPiA+PiArc3RhdGljIGdpbnQgaW50X2NtcChnY29uc3Rwb2ludGVyIGEsIGdjb25zdHBvaW50
ZXIgYiwgZ3BvaW50ZXINCj4gPj4gK3VzZXJfZGF0YSkgew0KPiA+PiArICAgIHVpbnQgdWEgPSBH
UE9JTlRFUl9UT19VSU5UKGEpOw0KPiA+PiArICAgIHVpbnQgdWIgPSBHUE9JTlRFUl9UT19VSU5U
KGIpOw0KPiA+PiArICAgIHJldHVybiAodWEgPiB1YikgLSAodWEgPCB1Yik7DQo+ID4+ICt9DQo+
ID4+ICsNCj4gPj4gIHN0YXRpYyB2b2lkIHZpcnRpb19pb21tdV9kZXZpY2VfcmVhbGl6ZShEZXZp
Y2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+IHsNCj4gPj4gICAgICBWaXJ0SU9EZXZpY2Ug
KnZkZXYgPSBWSVJUSU9fREVWSUNFKGRldik7IEBAIC0zNTYsNiArNDY4LDggQEANCj4gPj4gc3Rh
dGljIHZvaWQgdmlydGlvX2lvbW11X2RldmljZV9yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVy
cm9yICoqZXJycCkNCj4gPj4gICAgICB2aXJ0aW9fYWRkX2ZlYXR1cmUoJnMtPmZlYXR1cmVzLCBW
SVJUSU9fSU9NTVVfRl9NQVBfVU5NQVApOw0KPiA+PiAgICAgIHZpcnRpb19hZGRfZmVhdHVyZSgm
cy0+ZmVhdHVyZXMsIFZJUlRJT19JT01NVV9GX0JZUEFTUyk7DQo+ID4+DQo+ID4+ICsgICAgcWVt
dV9tdXRleF9pbml0KCZzLT5tdXRleCk7DQo+ID4+ICsNCj4gPj4gICAgICBtZW1zZXQocy0+YXNf
YnlfYnVzX251bSwgMCwgc2l6ZW9mKHMtPmFzX2J5X2J1c19udW0pKTsNCj4gPj4gICAgICBzLT5h
c19ieV9idXNwdHIgPSBnX2hhc2hfdGFibGVfbmV3KE5VTEwsIE5VTEwpOw0KPiA+Pg0KPiA+PiBA
QCAtMzY0LDExICs0NzgsMjAgQEAgc3RhdGljIHZvaWQNCj4gPj4gdmlydGlvX2lvbW11X2Rldmlj
ZV9yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4gPj4gICAgICB9IGVs
c2Ugew0KPiA+PiAgICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJWSVJUSU8tSU9NTVUgaXMgbm90
IGF0dGFjaGVkIHRvIGFueSBQQ0kgYnVzISIpOw0KPiA+PiAgICAgIH0NCj4gPj4gKw0KPiA+PiAr
ICAgIHMtPmRvbWFpbnMgPSBnX3RyZWVfbmV3X2Z1bGwoKEdDb21wYXJlRGF0YUZ1bmMpaW50X2Nt
cCwNCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIE5VTEwsIHZp
cnRpb19pb21tdV9wdXRfZG9tYWluKTsNCj4gPj4gKyAgICBzLT5lbmRwb2ludHMgPSBnX3RyZWVf
bmV3X2Z1bGwoKEdDb21wYXJlRGF0YUZ1bmMpaW50X2NtcCwNCj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTlVMTCwgTlVMTCwNCj4gPj4gKyB2aXJ0aW9faW9tbXVfcHV0
X2VuZHBvaW50KTsNCj4gPj4gIH0NCj4gPj4NCj4gPj4gIHN0YXRpYyB2b2lkIHZpcnRpb19pb21t
dV9kZXZpY2VfdW5yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yDQo+ID4+ICoqZXJycCkg
ew0KPiA+PiAgICAgIFZpcnRJT0RldmljZSAqdmRldiA9IFZJUlRJT19ERVZJQ0UoZGV2KTsNCj4g
Pj4gKyAgICBWaXJ0SU9JT01NVSAqcyA9IFZJUlRJT19JT01NVShkZXYpOw0KPiA+PiArDQo+ID4+
ICsgICAgZ190cmVlX2Rlc3Ryb3kocy0+ZG9tYWlucyk7DQo+ID4+ICsgICAgZ190cmVlX2Rlc3Ry
b3kocy0+ZW5kcG9pbnRzKTsNCj4gPj4NCj4gPj4gICAgICB2aXJ0aW9fY2xlYW51cCh2ZGV2KTsN
Cj4gPj4gIH0NCj4gPj4gLS0NCj4gPj4gMi4xNy4yDQo+ID4NCj4gPg0K
