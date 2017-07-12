Received: by 10.25.44.15 with SMTP id s15csp286347lfs;
        Tue, 11 Jul 2017 20:50:51 -0700 (PDT)
X-Received: by 10.55.201.201 with SMTP id m70mr3977627qkl.20.1499831451680;
        Tue, 11 Jul 2017 20:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499831451; cv=none;
        d=google.com; s=arc-20160816;
        b=sp/Tj4nWmz4QwuKilT/4LGd9MNCcs8xv+ZcvxLyBdlW/iGx7obkPkBTquL7BgrDBL5
         7iBhr8/uAihldsHMMg5mPMLMcqH6Opxwc/gLTGdaCOHcWPf5W80VlTTt+OnLvbrsnhZt
         hyJfUhwVhdDsRMXVMa/yXT7Ux879W7WCYtNwClOg0dXU4l8SMm7ABazZSohFy/TefLV/
         Fhbr2H29wS07KdpVgPkCslY81MEsNe9zVr+rvT2zSyE479hfs4AC4Bzyraf+kRzWrBpt
         gnf/IZGfV9xPd9HVOgkybijbI2Ww5DLObAc6PI9x0dE9/nkcyXNZWqcCcvazCbUyUBWM
         fEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=ePXzmc0Rj0s4i8GLx+mfaoXl+ZiOR80SGrzEfrdK+G4=;
        b=y9MpbBM/fimKgE94muFuv7WC7NkpTgAu3rAqiNXP01XOUCm8N4laxOW+QdrWaybDHN
         VpKYau1/uojRS38wXfY5zhEP3A8uMVb00C54EZhqYRGW2QNMgTxSwlywfQEjrVRL3IuE
         D4PedOi5yZnI58e6+UJIRMyFnrSlzdWdCzCYwap1M/hcA2TP0qq81smkS2U1P9tm6CA/
         6PjmW/8OZ9JpQa5/KFwliiia13fUUr1VSUj6j6rGd5I2Z2la/vAyiHyVFvd4Oh65AO3b
         POXw02w6GPIagQg0phOIezy9u1aRJuyY31JnvkX3NzI4moCcv96Ksc+PO2elRHQFn2jN
         ipbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=gyOXQERT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q78si1170802qka.79.2017.07.11.20.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 20:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=gyOXQERT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:50157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dV8fo-0006i3-Pf
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 23:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dV8fh-0006hw-NN
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 23:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dV8fd-0004Rq-Hv
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 23:50:41 -0400
Received: from mail-db5eur01on0049.outbound.protection.outlook.com
	([104.47.2.49]:37232
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dV8fc-0004QC-U6; Tue, 11 Jul 2017 23:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ePXzmc0Rj0s4i8GLx+mfaoXl+ZiOR80SGrzEfrdK+G4=;
	b=gyOXQERTn/D8qe9qx9ZZ72dF09O8pyhoTuCqebPCqr91t+CMPDiqEMQfdcWvmeOyhyarjASi7AxUQpbQs6wTqcBDunMckiyUbC27dnPXoIgbhY7JPjbNsoclwVIYis7GLCKAx5EWM3xZiRC5xllRG5rc7cA+rZkmZOaRd4x3pm8=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Wed, 12 Jul 2017 03:50:33 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2%17]) with mapi id 15.01.1240.013;
	Wed, 12 Jul 2017 03:50:33 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Auger Eric
	<eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuAgAAYhwCAAABHwIABqBOAgAAO8rCAAK1NgIAAlZ9ggAAUmACAAEJWMIAAQhWAgAWiB3CAAH22AIAA+W8Q
Date: Wed, 12 Jul 2017 03:50:32 +0000
Message-ID: <AM5PR0401MB25457988FA1531A684FF0DC09AAF0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
	<AM5PR0401MB2545C23F66D6D0E096DCB0369AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<a67cb139-e1b6-02fc-d451-4001bcbfceb3@redhat.com>
	<AM5PR0401MB2545A78764598CD87827B14F9AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<615e22ce-80b3-b000-360f-7272a867cdf9@arm.com>
	<AM5PR0401MB2545F60CA898D23D5E2F1E6D9AAE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9cdd8947-2c8a-4106-1a1a-56c2238843d6@arm.com>
In-Reply-To: <9cdd8947-2c8a-4106-1a1a-56c2238843d6@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
	header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	7:2Bm4318tTmruE3VbQ9wRdnwxQdNqRZbo7Ytsf4kIZGVuvlqcSMSHFC3T9dSMkM+cGSFZ3VRKhf92Tf0RYQG3ibWy6NrLtoGExW3yrnMcOu6Oy+aolzv7ByHYsaGheeJd203mQXhXugfHjt0VoakbE1GFBflrXHjLxM4kbkNu5qze74L2zRHD+kngAhhRUo+wr0d0xd4aNdLOJj0D3gOsjURk4zgHPC+9bK0e9y/Vw6ZBJ687RoDgRaowi9jWbKsYrta1ERhkZEiXHU10S72uqBaNiVwaTGOO2d4PZgCYdzJyjCNBadpndzb+KhObTCZXU42uE/MejNaKmkHu4EkfmkgPePXgyubF1rtnNddwOFmPp6KwPCT9cuHoOsi4Du2HBi/QLEs614UkkOYdtD/X4XRI9fcabwJc48B9joaraG1a2gu8AnbAr2+LyZTwLN/fTf7hWlD1IwcVSsFnX3PbJ2Y6dkrBoEfX/yPWO2J4jJnGCEb4KkjqGH4r6O4U34j4gET7ssXT9kP9KEeaUYtfPCszw7ZLidS3DQ0/z2OJn87nrleJNz3W7wAAxNb+Z1AcYD3QoC146lEn/mgQhIWPuJu0KFZzwj6+BWWV7zBP72VdfRnUHys34DPXyq4zx/OvIV4TQoQkpZTbevfr3AxFEFTE05b5M3vjb0vGSiJsloyIlmRHvqPbNeG0XVEyPFUdUYE1gY0mqmTee1Nq0RsEipXLJsPpVVCnufJd4s9gnGGXJvw0GgXOMAhCfhCVZgXM19QqePiatbtEkqjcYJRZFakf9Fi4bBeq3kC7hSffQro=
x-ms-office365-filtering-correlation-id: 070f36ec-884a-4c4b-ef24-08d4c8d925b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2548; 
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(788757137089)(148574349560750)(228905959029699)(247924648384137);
x-microsoft-antispam-prvs: <AM5PR0401MB25488B2B6DF8A3F57F1095369AAF0@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123560025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39850400002)(39860400002)(39400400002)(39410400002)(39450400003)(39840400002)(377454003)(13464003)(51234002)(24454002)(74316002)(305945005)(5890100001)(8676002)(53936002)(54356999)(478600001)(2906002)(39060400002)(5250100002)(38730400002)(7736002)(99286003)(4326008)(6246003)(81166006)(7416002)(50986999)(2201001)(86362001)(561944003)(3280700002)(575784001)(3660700001)(2501003)(55016002)(6506006)(93886004)(8936002)(76176999)(5660300001)(54906002)(551934003)(9686003)(53546010)(25786009)(7696004)(6436002)(6116002)(3846002)(229853002)(66066001)(102836003)(189998001)(2900100001)(33656002)(14454004)(2950100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2017 03:50:33.0443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.49
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N+lqSgARodND

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVhbi1QaGlsaXBwZSBC
cnVja2VyIFttYWlsdG86amVhbi1waGlsaXBwZS5icnVja2VyQGFybS5jb21dDQo+IFNlbnQ6IFR1
ZXNkYXksIEp1bHkgMTEsIDIwMTcgNjoyMSBQTQ0KPiBUbzogQmhhcmF0IEJodXNoYW4gPGJoYXJh
dC5iaHVzaGFuQG54cC5jb20+OyBBdWdlciBFcmljDQo+IDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+
OyBlcmljLmF1Z2VyLnByb0BnbWFpbC5jb207DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsg
YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOw0KPiBxZW11LWFybUBu
b25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHdlaUByZWRoYXQuY29tOyBr
ZXZpbi50aWFuQGludGVsLmNvbTsgbWFyYy56eW5naWVyQGFybS5jb207DQo+IHRuQHNlbWloYWxm
LmNvbTsgd2lsbC5kZWFjb25AYXJtLmNvbTsgZHJqb25lc0ByZWRoYXQuY29tOw0KPiByb2Jpbi5t
dXJwaHlAYXJtLmNvbTsgY2hyaXN0b2ZmZXIuZGFsbEBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUWVtdS1kZXZlbF0gW1JGQyB2MiAwLzhdIFZJUlRJTy1JT01NVSBkZXZpY2UNCj4gDQo+IE9u
IDExLzA3LzE3IDA2OjU0LCBCaGFyYXQgQmh1c2hhbiB3cm90ZToNCj4gPiBIaSBKZWFuLA0KPiA+
DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEplYW4tUGhpbGlw
cGUgQnJ1Y2tlciBbbWFpbHRvOmplYW4tcGhpbGlwcGUuYnJ1Y2tlckBhcm0uY29tXQ0KPiA+PiBT
ZW50OiBGcmlkYXksIEp1bHkgMDcsIDIwMTcgODo1MCBQTQ0KPiA+PiBUbzogQmhhcmF0IEJodXNo
YW4gPGJoYXJhdC5iaHVzaGFuQG54cC5jb20+OyBBdWdlciBFcmljDQo+ID4+IDxlcmljLmF1Z2Vy
QHJlZGhhdC5jb20+OyBlcmljLmF1Z2VyLnByb0BnbWFpbC5jb207DQo+ID4+IHBldGVyLm1heWRl
bGxAbGluYXJvLm9yZzsgYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207DQo+IG1zdEByZWRoYXQu
Y29tOw0KPiA+PiBxZW11LWFybUBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4g
Pj4gQ2M6IHdlaUByZWRoYXQuY29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgbWFyYy56eW5naWVy
QGFybS5jb207DQo+ID4+IHRuQHNlbWloYWxmLmNvbTsgd2lsbC5kZWFjb25AYXJtLmNvbTsgZHJq
b25lc0ByZWRoYXQuY29tOw0KPiA+PiByb2Jpbi5tdXJwaHlAYXJtLmNvbTsgY2hyaXN0b2ZmZXIu
ZGFsbEBsaW5hcm8ub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUWVtdS1kZXZlbF0gW1JGQyB2MiAw
LzhdIFZJUlRJTy1JT01NVSBkZXZpY2UNCj4gPj4NCj4gPj4gT24gMDcvMDcvMTcgMTI6MzYsIEJo
YXJhdCBCaHVzaGFuIHdyb3RlOg0KPiA+Pj4+PiBJbiB0aGlzIHByb3Bvc2FsLCBRRU1VIHJlc2Vy
dmVzIGEgaW92YS1yYW5nZSBmb3IgZ3Vlc3QgKG5vdCBob3N0KQ0KPiA+Pj4+PiBhbmQNCj4gPj4g
Z3Vlc3QNCj4gPj4+PiBrZXJuZWwgd2lsbCB1c2UgdGhpcyBhcyBtc2ktaW92YSB1bnRyYW5zbGF0
ZWQgKElPTU1VX1JFU1ZfTVNJKS4NCj4gPj4+PiBXaGlsZQ0KPiA+PiB0aGlzDQo+ID4+Pj4gZG9l
cyBub3QgY2hhbmdlIGhvc3QgaW50ZXJmYWNlIGFuZCBpdCB3aWxsIGNvbnRpbnVlIHRvIHVzZSBo
b3N0DQo+ID4+Pj4gcmVzZXJ2ZWQgbWFwcGluZyBmb3IgYWN0dWFsIGludGVycnVwdCBnZW5lcmF0
aW9uLCBubz8NCj4gPj4+PiBCdXQgdGhlbiB1c2Vyc3BhY2UgbmVlZHMgdG8gcHJvdmlkZSBJT01N
VV9SRVNWX01TSSByYW5nZSB0bw0KPiBndWVzdA0KPiA+Pj4+IGtlcm5lbCwgcmlnaHQ/IFdoYXQg
d291bGQgYmUgdGhlIHByb3Bvc2VkIG1hbm5lcj8NCj4gPj4+DQo+ID4+PiBKdXN0IGFuIG9waW5p
b24sIHdlIGNhbiBkZWZpbmUgZmVhdHVyZQ0KPiA+PiAoVklSVElPX0lPTU1VX0ZfUkVTX01TSV9S
QU5HRSkgYW5kIHByb3ZpZGUgdGhpcyBpbmZvIHZpYSBhDQo+IGNvbW1hbmQNCj4gPj4gKFZJUlRJ
T19JT01NVV9UX01TSV9SQU5HRSkuIEd1ZXN0IGlvbW11LWRyaXZlciB3aWxsIG1ha2UgdGhpcyBj
YWxsDQo+ID4+IGR1cmluZyBpbml0aWFsaXphdGlvbiBhbmQgc3RvcmUgdGhlIHZhbHVlLiBUaGlz
IHZhbHVlIHdpbGwganVzdA0KPiA+PiByZXBsYWNlIE1TSV9JT1ZBX0JBU0UgYW5kIE1TSV9JT1ZB
X0xFTkdIVCBoYXNoIGRlZmluZS4gUmVzdCB3aWxsDQo+ID4+IHJlbWFpbiBzYW1lIGluIHZpcnRp
by1pb21tdSBkcml2ZXIuDQo+ID4+DQo+ID4+IFllcyBJIGhhZCBzb21ldGhpbmcgc2ltaWxhciBp
biBtaW5kLCBhbHRob3VnaCBtb3JlIGdlbmVyaWMgc2luY2UNCj4gPj4gd2UnbGwgbmVlZCB0byBn
ZXQgb3RoZXIgYml0cyBvZiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBkZXZpY2UgaW4gZnV0dXJlDQo+
ID4+IGV4dGVuc2lvbnMgKGZhdWx0IGhhbmRsaW5nLCBwYWdlIHRhYmxlIGZvcm1hdHMgYW5kIGR5
bmFtaWMgcmVzZXJ2ZXMNCj4gPj4gb2YgbWVtb3J5IGZvciBTVk0pLCBhbmQgbWF5YmUgYWxzbyBm
b3IgZmluZGluZyBvdXQgcGVyLWFkZHJlc3Mtc3BhY2UNCj4gPj4gcGFnZSBncmFudWxhcml0eSAo
c2VlIG15IHJlcGx5IG9mIHBhdGNoIDMvOCkuIFRoZXNlIGFyZSBwZXItZW5kcG9pbnQNCj4gPj4g
cHJvcGVydGllcyB0aGF0IGNhbm5vdCBiZSBhZHZlcnRpc2UgaW4gdGhlIHZpcnRpbyBjb25maWcg
c3BhY2UuDQo+ID4+DQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICoqKg0K
PiA+Pg0KPiA+PiBTbyBJIHByb3Bvc2UgdG8gYWRkIGEgcGVyLWVuZHBvaW50IHByb2JpbmcgbWVj
aGFuaXNtIG9uIHRoZSByZXF1ZXN0DQo+ID4+IHF1ZXVlOg0KPiA+DQo+ID4gV2hhdCBpcyBwZXIt
ZW5kcG9pbnQ/IElzIGl0ICJwZXItcGNpL3BsYXRmb3JtLWRldmljZSI/DQo+IA0KPiBZZXMsIGl0
J3MgYSBwY2kgb3IgcGxhdGZvcm0gZGV2aWNlIG1hbmFnZWQgYnkgdGhlIElPTU1VLiBJbiB0aGUg
c3BlYyBJJ20NCj4gbm93IHVzaW5nIHRoZSB0ZXJtICJlbmRwb2ludCIgdG8gZWFzaWx5IGRpZmZl
cmVudGlhdGUgZnJvbSB0aGUgdmlydGlvLWlvbW11DQo+IGRldmljZSAoInRoZSBkZXZpY2UiKS4N
Cj4gDQo+ID4+ICogVGhlIGRldmljZSBhZHZlcnRpc2VzIGEgbmV3IGNvbW1hbmQgVklSVElPX0lP
TU1VX1RfUFJPQkUgd2l0aA0KPiA+PiBmZWF0dXJlIGJpdCBWSVJUSU9fSU9NTVVfRl9QUk9CRS4N
Cj4gPj4gKiBXaGVuIHRoaXMgZmVhdHVyZSBpcyBhZHZlcnRpc2VkLCB0aGUgZGV2aWNlIHNldHMg
cHJvYmVfc2l6ZSBmaWVsZA0KPiA+PiBpbiB0aGUgdGhlIGNvbmZpZyBzcGFjZS4NCj4gPg0KPiA+
IFByb2JhYmx5IEkgZGlkIG5vdCBnZXQgaG93IHZpcnRpby1pb21tdSBkZXZpY2UgZW11bGF0aW9u
IGRlY2lkZXMgdmFsdWUgb2YNCj4gInByb2JlX3NpemUiLCBjYW4geW91IHNoYXJlIG1vcmUgaW5m
bz8NCj4gDQo+IFRoZSBzaXplIG9mIHRoZSB2aXJ0aW9faW9tbXVfcmVxX3Byb2JlIHN0cnVjdHVy
ZSBpcyB2YXJpYWJsZSwgYW5kIGRlcGVuZHMNCj4gd2hhdCBmaWVsZHMgdGhlIGRldmljZSBpbXBs
ZW1lbnRzLiBTbyB0aGUgZGV2aWNlIGluaXRpYWxseSBjb21wdXRlcyB0aGUgc2l6ZSBpdA0KPiBu
ZWVkcyB0byBmaWxsIHZpcnRpb19pb21tdV9yZXFfcHJvYmUsIGRlc2NyaWJlcyBpdCBpbiBwcm9i
ZV9zaXplLCBhbmQgdGhlDQo+IGRyaXZlciBhbGxvY2F0ZXMgdGhhdCBtYW55IGJ5dGVzIGZvciB2
aXJ0aW9faW9tbXVfcmVxX3Byb2JlLmNvbnRlbnRbXQ0KPiANCj4gPj4gKiBXaGVuIGRldmljZSBv
ZmZlcnMgVklSVElPX0lPTU1VX0ZfUFJPQkUsIHRoZSBkcml2ZXIgc2hvdWxkIHNlbmQNCj4gYW4N
Cj4gPj4gVklSVElPX0lPTU1VX1RfUFJPQkUgcmVxdWVzdCBmb3IgZWFjaCBuZXcgZW5kcG9pbnQu
DQo+ID4+ICogVGhlIGRyaXZlciBhbGxvY2F0ZXMgYSBkZXZpY2Utd3JpdGVhYmxlIGJ1ZmZlciBv
ZiBwcm9iZV9zaXplIChwbHVzDQo+ID4+IGZyYW1pbmcpIGFuZCBzZW5kcyBpdCBhcyBhIFZJUlRJ
T19JT01NVV9UX1BST0JFIHJlcXVlc3QuDQo+ID4+ICogVGhlIGRldmljZSBmaWxscyB0aGUgYnVm
ZmVyIHdpdGggdmFyaW91cyBpbmZvcm1hdGlvbi4NCj4gPj4NCj4gPj4gc3RydWN0IHZpcnRpb19p
b21tdV9yZXFfcHJvYmUgew0KPiA+PiAJLyogZGV2aWNlLXJlYWRhYmxlICovDQo+ID4+IAlzdHJ1
Y3QgdmlydGlvX2lvbW11X3JlcV9oZWFkIGhlYWQ7DQo+ID4+IAlsZTMyIGRldmljZTsNCj4gPj4g
CWxlMzIgZmxhZ3M7DQo+ID4+DQo+ID4+IAkvKiBtYXliZSBhbHNvIGxlMzIgY29udGVudF9zaXpl
LCBidXQgaXQgbXVzdCBiZSBlcXVhbCB0bw0KPiA+PiAJICAgcHJvYmVfc2l6ZSAqLw0KPiA+DQo+
ID4gQ2FuIHlvdSBwbGVhc2UgZGVzY3JpYmUgd2h5IHdlIG5lZWQgdG8gcGFzcyBzaXplIG9mICJw
cm9iZV9zaXplIiBpbiBwcm9iZQ0KPiByZXF1ZXN0Pw0KPiANCj4gV2UgZG9uJ3QuIEkgZG9uJ3Qg
dGhpbmsgd2Ugc2hvdWxkIGFkZCB0aGlzICdjb250ZW50X3NpemUnIGZpZWxkIHVubGVzcyB0aGVy
ZSBpcw0KPiBhIGNvbXBlbGxpbmcgcmVhc29uIHRvIGRvIHNvLg0KPiANCj4gPj4NCj4gPj4gCS8q
IGRldmljZS13cml0ZWFibGUgKi8NCj4gPj4gCXU4IGNvbnRlbnRbXTsNCj4gPg0KPiA+IEkgYXNz
dW1lIGNvbnRlbnRfc2l6ZSBhYm92ZSBpcyB0aGUgc2l6ZSBvZiBhcnJheSAiY29udGVudFtdIiBh
bmQgbWF4IHZhbHVlDQo+IGNhbiBiZSBlcXVhbCB0byBwcm9iZV9zaXplIGFkdmVydGlzZWQgYnkg
ZGV2aWNlPw0KPiANCj4gcHJvYmVfc2l6ZSBpcyBleGFjdGx5IHRoZSBzaXplIG9mIGFycmF5IGNv
bnRlbnRbXS4gVGhlIGRyaXZlciBtdXN0IGFsbG9jYXRlIGENCj4gYnVmZmVyIG9mIHRoaXMgc2l6
ZSAocGx1cyB0aGUgc3BhY2UgbmVlZGVkIGZvciBoZWFkLCBkZXZpY2UsIGZsYWdzIGFuZCB0YWls
KS4NCj4gDQo+IFRoZW4gdGhlIGRldmljZSBpcyBmcmVlIHRvIGxlYXZlIHBhcnRzIG9mIGNvbnRl
bnRbXSBlbXB0eS4gRmllbGQgJ3R5cGUnIDAgd2lsbCBiZQ0KPiByZXNlcnZlZCBhbmQgbWFyayB0
aGUgZW5kIG9mIHRoZSBhcnJheS4NCj4gDQo+ID4+IAlzdHJ1Y3QgdmlydGlvX2lvbW11X3JlcV90
YWlsIHRhaWw7DQo+ID4+IH07DQo+ID4+DQo+ID4+IEknbSBzdGlsbCBzdHJ1Z2dsaW5nIHdpdGgg
dGhlIGNvbnRlbnQgYW5kIGxheW91dCBvZiB0aGUgcHJvYmUNCj4gPj4gcmVxdWVzdCwgYW5kIHdv
dWxkIGFwcHJlY2lhdGUgYW55IGZlZWRiYWNrLiBUbyBiZSBlYXNpbHkgZXh0ZW5kZWQsIEkNCj4g
Pj4gdGhpbmsgaXQgc2hvdWxkIGNvbnRhaW4gYSBsaXN0IG9mIGZpZWxkcyBvZiB2YXJpYWJsZSBz
aXplOg0KPiA+Pg0KPiA+PiAJfDAgICAgICAgICAgIDE1fDE2ICAgICAgICAgICAzMXwzMiAgICAg
ICAgICAgICAgIE58DQo+ID4+IAl8ICAgICB0eXBlICAgICB8ICAgIGxlbmd0aCAgICAgfCAgICAg
IHZhbHVlcyAgICAgIHwNCj4gPj4NCj4gPj4gJ2xlbmd0aCcgbWlnaHQgYmUgbWFkZSBvcHRpb25h
bCBpZiBpdCBjYW4gYmUgZGVkdWNlZCBmcm9tIHR5cGUsIGJ1dA0KPiA+PiBtaWdodCBtYWtlIGRy
aXZlci1zaWRlIHBhcnNpbmcgbW9yZSByb2J1c3QuDQo+ID4+DQo+ID4+IFRoZSBwcm9iZSBjb3Vs
ZCBlaXRoZXIgYmUgZG9uZSBmb3IgZWFjaCBlbmRwb2ludCwgb3IgZm9yIGVhY2ggYWRkcmVzcw0K
PiA+PiBzcGFjZS4gSSBtdWNoIHByZWZlciBlbmRwb2ludCBiZWNhdXNlIGl0IGlzIHRoZSBzbWFs
bGVzdCBncmFudWxhcml0eS4NCj4gPj4gVGhlIGRyaXZlciBjYW4gdGhlbiBkZWNpZGUgd2hhdCBl
bmRwb2ludHMgdG8gcHV0IHRvZ2V0aGVyIGluIHRoZSBzYW1lDQo+ID4+IGFkZHJlc3Mgc3BhY2Ug
YmFzZWQgb24gdGhlaXIgaW5kaXZpZHVhbCBjYXBhYmlsaXRpZXMuIFRoZQ0KPiA+PiBzcGVjaWZp
Y2F0aW9uIHdvdWxkIGRlc2NyaWJlZCBob3cgZWFjaCBlbmRwb2ludCBwcm9wZXJ0eSBpcyBjb21i
aW5lZA0KPiA+PiB3aGVuIGVuZHBvaW50cyBhcmUgcHV0IGluIHRoZSBzYW1lIGFkZHJlc3Mgc3Bh
Y2UuIEZvciBleGFtcGxlLCB0YWtlDQo+ID4+IHRoZSBtaW5pbXVtIG9mIGFsbCBQQVNJRCBzaXpl
LCB0aGUgbWF4aW11bSBvZiBhbGwgcGFnZSBncmFudWxhcml0aWVzLA0KPiA+PiBjb21iaW5lIGRv
b3JiZWxsIGFkZHJlc3NlcywgZXRjLg0KPiA+Pg0KPiA+PiBJZiB3ZSBkaWQgdGhlIHByb2JlIG9u
IGFkZHJlc3Mgc3BhY2VzIGluc3RlYWQsIHRoZSBkcml2ZXIgd291bGQgaGF2ZQ0KPiA+PiB0byBy
ZS1zZW5kIGEgcHJvYmUgcmVxdWVzdCBlYWNoIHRpbWUgYSBuZXcgZW5kcG9pbnQgaXMgYXR0YWNo
ZWQgdG8gYW4NCj4gPj4gZXhpc3RpbmcgYWRkcmVzcyBzcGFjZSwgdG8gc2VlIGlmIGl0IGlzIHN0
aWxsIGNhcGFibGUgb2YgcGFnZSB0YWJsZQ0KPiA+PiBoYW5kb3ZlciBvciBpZiB0aGUgZHJpdmVy
IGp1c3QgY29tYmluZWQgYSBWRklPIGFuZCBhbiBlbXVsYXRlZA0KPiA+PiBlbmRwb2ludCBieSBh
Y2NpZGVudC4NCj4gPj4NCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKioq
DQo+ID4+DQo+ID4+IFVzaW5nIHRoaXMgZnJhbWV3b3JrLCB0aGUgZGV2aWNlIGNhbiBkZWNsYXJl
IGRvb3JiZWxsIHJlZ2lvbnMgYnkNCj4gPj4gYWRkaW5nIG9uZSBvciBtb3JlIFJFU1YgZmllbGRz
IGludG8gdGhlIHByb2JlIGJ1ZmZlcjoNCj4gPj4NCj4gPj4gLyogJ3R5cGUnICovDQo+ID4+ICNk
ZWZpbmUgVklSVElPX0lPTU1VX1BST0JFX1RfUkVTViAJMHgxDQo+ID4+DQo+ID4+IC8qICd2YWx1
ZXMnLiAnbGVuZ3RoJyBpcyBzaXplb2Yoc3RydWN0IHZpcnRpb19pb21tdV9wcm9iZV9yZXN2KSAq
Lw0KPiA+PiBzdHJ1Y3QgdmlydGlvX2lvbW11X3Byb2JlX3Jlc3Ygew0KPiA+PiAJbGU2NCBncGE7
DQo+ID4+IAlsZTY0IHNpemU7DQo+ID4+DQo+ID4+ICNkZWZpbmUgVklSVElPX0lPTU1VX1BST0JF
X1JFU1ZfTVNJCTB4MQ0KPiA+PiAJdTggdHlwZTsNCg0KVG8gYmUgc3VyZSBJIGFtIHVuZGVyc3Rh
bmRpbmcgaXQgY29ycmVjdGx5LCBJcyB0aGlzICJ0eXBlIiBpbiBzdHJ1Y3QgdmlydGlvX2lvbW11
X3JlcV9oZWFkPw0KDQpUaGFua3MNCi1CaGFyYXQNCg0KPiA+DQo+ID4gdHlwZSBpcyAxNiBiaXQg
YWJvdmU/DQo+IA0KPiBBaCwgdGhlIG5hbWluZyBpc24ndCBncmVhdC4gVGhpcyBpcyBub3QgdGhl
IHNhbWUgYXMgYWJvdmUsIGFuZCBjb3VsZCBiZSBjYWxsZWQNCj4gJ3N1YnR5cGUnIHRvIGF2b2lk
IGNvbmZ1c2lvbi4gVGhlIGFib3ZlIDE2LWJpdCB0eXBlIGRlc2NyaWJlcyB0aGUgZmllbGQgdHlw
ZSwNCj4gZS5nLiBzdHJ1Y3QgdmlydGlvX2lvbW11X3Byb2JlX3Jlc3YuIEkgcHJvcG9zZWQgMTYt
Yml0IGJlY2F1c2UgaXQgc2VlbXMNCj4gZWFzeSB0byByZWFjaCBtb3JlIHRoYW4gMjU1IGtpbmRz
IG9mIGVuZHBvaW50IHByb3BlcnRpZXMsIGJ1dA0KPiA2NTUzNSBzaG91bGQgZG8uDQo+IA0KPiBU
aGlzIHN1YnR5cGUgZGVzY3JpYmVzIHdoaWNoIGtpbmQgb2YgcmVzdiByZWdpb24gaXMgZGVzY3Jp
YmVkIGluIHRoZSBzdHJ1Y3R1cmUuDQo+IEZvciB0aGUgbW9tZW50IHRoZXJlIG9ubHkgaXMgVklS
VElPX0lPTU1VX1BST0JFX1JFU1ZfTVNJLCBidXQgd2UNCj4gY291bGQgZm9yIGV4YW1wbGUgYWRk
IHJlc3YgcmVnaW9ucyB0aGF0IHRoZSBkcml2ZXIgc2hvdWxkIG5ldmVyIHVzZSBvciB0aGF0IGl0
DQo+IHNob3VsZCBpZGVudGl0eS1tYXAgKGVxdWl2YWxlbnQgdG8gSU9NTVVfUkVTVl9SRVNFUlZF
RC9ESVJFQ1QgaW4NCj4gTGludXgpLiBJIHRoaW5rIDggYml0cyBzaG91bGQgYmUgZW5vdWdoIHRv
IGNvbnRhaW4gYW55IGZ1dHVyZSB0eXBlcywgdW5sZXNzIHdlDQo+IG1ha2UgdGhpcyBhIGJpdGZp
ZWxkLiBGb3IgaWRlbnRpdHktbWFwLCB0aGVyZSBtYXkgYmUgYW4gYWRkaXRpb25hbCBmbGFncyBm
aWVsZA0KPiBkZXNjcmliaW5nIHRoZSBwcm90ZWN0aW9uLg0KPiANCj4gPj4gfTsNCj4gPj4NCj4g
Pj4gU3VjaCBhIHJlZ2lvbiB3b3VsZCBiZSBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgcnVsZXM6
DQo+ID4+DQo+ID4+ICogRHJpdmVyIHNob3VsZCBub3QgdXNlIGFueSBJT1ZBIGRlY2xhcmVkIGFz
IFJFU1ZfTVNJIGluIGEgbWFwcGluZy4NCj4gPj4gKiBEZXZpY2Ugc2hvdWxkIGxlYXZlIGFueSB0
cmFuc2FjdGlvbiBtYXRjaGluZyBhIFJFU1ZfTVNJIHJlZ2lvbiBwYXNzDQo+ID4+IHRocm91Z2gg
dW50cmFuc2xhdGVkLg0KPiA+PiAqIElmIHRoZSBkZXZpY2UgZG9lcyBub3QgYWR2ZXJ0aXNlIGFu
eSBSRVNWIHJlZ2lvbiwgdGhlbiB0aGUgZHJpdmVyDQo+ID4+IHNob3VsZCBhc3N1bWUgdGhhdCBN
U0kgZG9vcmJlbGxzLCBsaWtlIGFueSBvdGhlciBHUEEsIG11c3QgYmUgbWFwcGVkDQo+ID4+IHdp
dGggYW4gYXJiaXRyYXJ5IElPVkEgaW4gb3JkZXIgZm9yIHRoZSBlbmRwb2ludCB0byBhY2Nlc3Mg
dGhlbS4NCj4gPj4gKiBHaXZlbiB0aGF0IHRoZSBkcml2ZXIgKnNob3VsZCogcGVyZm9ybSBhIHBy
b2JlIHJlcXVlc3QgaWYNCj4gPj4gYXZhaWxhYmxlLCBhbmQgaXQgKnNob3VsZCogdW5kZXJzdGFu
ZCB0aGUNCj4gVklSVElPX0lPTU1VX1BST0JFX1RfUkVTVg0KPiA+PiBmaWVsZCwgdGhlbiB0aGlz
IGZpZWxkIHRlbGxzIHRoZSBndWVzdCBob3cgaXQgc2hvdWxkIGhhbmRsZSBNU0kNCj4gPj4gZG9v
cmJlbGxzLCBhbmQgd2hldGhlciBpdCBzaG91bGQgbWFwIHRoZSBhZGRyZXNzIHZpYSBNQVAgcmVx
dWVzdHMgb3INCj4gbm90Lg0KPiA+Pg0KPiA+PiBEb2VzIHRoaXMgbWFrZSBzZW5zZSBhbmQgZGlk
IEkgb3Zlcmxvb2sgc29tZXRoaW5nPw0KPiA+DQo+ID4gT3ZlcmFsbCBpdCBsb29rcyBnb29kIHRv
IG1lLiBEbyB5b3UgaGF2ZSBwbGFucyB0byBpbXBsZW1lbnRzIHRoaXMgaW4gdmlydGlvLQ0KPiBp
b21tdSBkcml2ZXIgYW5kIGt2bXRvb2w/DQo+IA0KPiBZZXMsIGlmIHRoZXJlIGlzIG5vIG9iamVj
dGlvbiBJJ2xsIHRyeSB0byBmb3JtYWxpemUgaXQgYW5kIGltcGxlbWVudCBpdCByaWdodCBhd2F5
Lg0KPiANCj4gVGhhbmtzLA0KPiBKZWFuDQo=
