Received: by 10.25.44.15 with SMTP id s15csp2954979lfs;
        Thu, 6 Jul 2017 23:25:55 -0700 (PDT)
X-Received: by 10.55.65.22 with SMTP id o22mr65975781qka.213.1499408755173;
        Thu, 06 Jul 2017 23:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499408755; cv=none;
        d=google.com; s=arc-20160816;
        b=YIiFyLT0d8cjh2GgAbgYuFcUn6pg9FjFqd/PbAkD9QDftIctug/U0bH2LpWOGIBkAS
         68Csc8D1FHocuZ6AGk0uwylTeOXrB9NurmHgxIUh3uhVuQRy/NRLSi63lOX2Kw1wCRzE
         3ST081GjXzpUlz7et4EA/UoOJsKkRRbIiykkCwJbZbz/OLWJ+x++Kupx0gdqYaMnUoDA
         a7bOGj69I/86tmeahASuTRJc+D/Gd2vDLc+TcP5dUpGrH25Z7sISJPqgR1fWpQ2cGOF0
         PNSmkbCkPigRhsabXAz5eufxJYFeaFGCye0ZX7b9kFkR+kGOa3zb9TOB5m//VidXLlBB
         nDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=SZYozlUSPNMri4XSnNJVxH6EJtvE1wsQzVzFww+Mk9g=;
        b=UA8t/xfKjCtUhhMCCUDSqo9UxfBy7ddiOL5Lm13lIfo1tmWJ10N+MUZBniTUzGS3oC
         2mbkqjnApqtOjqUgPk453E6KW0CQZmlD/CCJscH/QmuLtffxpNuhJrosCm1R9mMSEXS2
         T+q02j3pN3oI9YAIt7XKqTZwz/pQ2AJxQjFD8SJKqMpDvOdYxfXPsFT32/vDjWwN4jUF
         7NvGgrBvcuIFeCcafeBGrWCmuNqnfAzc60NrvrWdY6y+ZsVnUBrqCOgdxgY5UA9SnbJe
         qH36xA96rS1bGhnlX5D2Hx1+pwZOF1doWBEURbYFsAh8sBafdt1+1QUCFHp4zNRarcb9
         xEqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=pELQ19gQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p130si2387586qka.0.2017.07.06.23.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 23:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=pELQ19gQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:54788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTMi8-0002hb-7p
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 02:25:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dTMi0-0002ff-6a
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 02:25:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dTMhw-0001sV-2k
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 02:25:44 -0400
Received: from mail-db5eur01on0072.outbound.protection.outlook.com
	([104.47.2.72]:57056
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dTMhu-0001rd-Rl; Fri, 07 Jul 2017 02:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SZYozlUSPNMri4XSnNJVxH6EJtvE1wsQzVzFww+Mk9g=;
	b=pELQ19gQ/21FDtlByX3LE5uvnc8KHacoO+F3icfdEieueTlTuDagWyH4tiQLwqA7eO1TW3BnpBJY/bCA2J4b+0drRm3WKODy9yvd+fOBhRJBdmuoZhx0vvqARcCHI501b4yGLuHmlS+YpHiHDj7T0wJbszvK7EFkrt+0btctQiE=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Fri, 7 Jul 2017 06:25:35 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2%17]) with mapi id 15.01.1240.013;
	Fri, 7 Jul 2017 06:25:35 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, Jean-Philippe Brucker
	<jean-philippe.brucker@arm.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuAgAAYhwCAAABHwIABqBOAgAAO8rCAAK1NgIAAlZ9g
Date: Fri, 7 Jul 2017 06:25:35 +0000
Message-ID: <AM5PR0401MB2545C23F66D6D0E096DCB0369AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
In-Reply-To: <15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	7:UmNLyKOXVkfSs0j6ueCNrNlcn4UNRx17ATEouIxnXUR12Ur+Cjhgjs+NZ5skuY/Pv/TlflaubM3OUoZcfuHt7vwud2CE50zlp16EjUJLjijfegYbZO6LR8SUNTn8sHSYqQClzShUQM5AFKJ5RWoKIB+J3KxJiRt+1xRemCi+B1ENV6QhS39NWYlwwATR/Hpzzz+ZrGZ4qffL2tmim0wH5vQFyvCkBwRYQZsty0Rcpvw6XOOY2eMTD+4qiGbnhiUAAQ60sBgnzBAPw3DygCamPuiLtqk7I4Qo9NkBg4uDe8TOF9QMsJuK4n/nRsOIVQjaHXwiFQ34JscpgJ2c+iv/jd6XRndRG1ENUZXRn81mGF6tDbqC0HdQBbp1Hsu5uTeS4PNjgupPg+YgHgJ54YiDa+y3s2RohhAkx+hLpxsI8oSolXQk5ZJwW50S+ah4WjMAbLJ2DpD5pAKtqRU5eKH872+xRIGfnfd3ZVtB+enCRaUn5EQrQmGHI9D7H1GsqPbgvF5BojrDmN0QLyEhM7Kxoph4Ru7Sb7oJhg28hI2eKD6qOOAQ6qPnSdDMWIdocvSr1RnFUnecoDrxioGbsDkm3Zr0nmSC4VbyfMx6YxSCU6roWblVBljtJzEamxeYkM8BR+Ox97kvYH94TsX+sE1y19kgZMbGZ0PAWeKqOxCBj89Ts+kzJr1O/TqU2qUPYsKY/eraJfvZ5EYqhtEvW8gAZ3fW14LhaXS5LoGyg+MAsLN7rkuKnpYittgU30XGk7ycBNZhsNwGajdBV75f9CD4ajduQoDZx48MwrSKnXV3nwc=
x-ms-office365-filtering-correlation-id: d4591196-b32e-43b9-1d43-08d4c500fa31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2545; 
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-microsoft-antispam-prvs: <AM5PR0401MB25453E3D90CB36F0BDF8F7E89AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(48057245064654)(148574349560750)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(2017060910059)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(39400400002)(39410400002)(39850400002)(39840400002)(39450400003)(24454002)(377454003)(13464003)(38730400002)(54356999)(6116002)(3660700001)(8936002)(50986999)(76176999)(7736002)(81166006)(33656002)(39060400002)(102836003)(189998001)(2201001)(8676002)(74316002)(3846002)(25786009)(305945005)(5250100002)(2906002)(561944003)(551934003)(14454004)(54906002)(93886004)(68736007)(9686003)(2501003)(7416002)(3280700002)(4326008)(2900100001)(99286003)(86362001)(55016002)(5660300001)(66066001)(6246003)(478600001)(53546010)(229853002)(2950100002)(6506006)(6436002)(7696004)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2017 06:25:35.3027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.72
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
X-TUID: xLm65MsvAlF6

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiBGcmlkYXksIEp1bHkg
MDcsIDIwMTcgMjo0NyBBTQ0KPiBUbzogQmhhcmF0IEJodXNoYW4gPGJoYXJhdC5iaHVzaGFuQG54
cC5jb20+OyBKZWFuLVBoaWxpcHBlIEJydWNrZXINCj4gPGplYW4tcGhpbGlwcGUuYnJ1Y2tlckBh
cm0uY29tPjsgZXJpYy5hdWdlci5wcm9AZ21haWwuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmc7IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsNCj4gcWVt
dS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiB3ZWlAcmVkaGF0
LmNvbTsga2V2aW4udGlhbkBpbnRlbC5jb207IG1hcmMuenluZ2llckBhcm0uY29tOw0KPiB0bkBz
ZW1paGFsZi5jb207IHdpbGwuZGVhY29uQGFybS5jb207IGRyam9uZXNAcmVkaGF0LmNvbTsNCj4g
cm9iaW4ubXVycGh5QGFybS5jb207IGNocmlzdG9mZmVyLmRhbGxAbGluYXJvLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtSRkMgdjIgMC84XSBWSVJUSU8tSU9NTVUgZGV2aWNlDQo+
IA0KPiBIaSBCaGFyYXQsDQo+IA0KPiBPbiAwNi8wNy8yMDE3IDEzOjI0LCBCaGFyYXQgQmh1c2hh
biB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEplYW4tUGhpbGlwcGUgQnJ1Y2tlciBbbWFpbHRvOmplYW4tcGhpbGlwcGUuYnJ1Y2tl
ckBhcm0uY29tXQ0KPiA+PiBTZW50OiBUaHVyc2RheSwgSnVseSAwNiwgMjAxNyAzOjMzIFBNDQo+
ID4+IFRvOiBCaGFyYXQgQmh1c2hhbiA8YmhhcmF0LmJodXNoYW5AbnhwLmNvbT47IEF1Z2VyIEVy
aWMNCj4gPj4gPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT47IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNv
bTsNCj4gPj4gcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBhbGV4LndpbGxpYW1zb25AcmVkaGF0
LmNvbTsNCj4gbXN0QHJlZGhhdC5jb207DQo+ID4+IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZw0KPiA+PiBDYzogd2VpQHJlZGhhdC5jb207IGtldmluLnRpYW5AaW50
ZWwuY29tOyBtYXJjLnp5bmdpZXJAYXJtLmNvbTsNCj4gPj4gdG5Ac2VtaWhhbGYuY29tOyB3aWxs
LmRlYWNvbkBhcm0uY29tOyBkcmpvbmVzQHJlZGhhdC5jb207DQo+ID4+IHJvYmluLm11cnBoeUBh
cm0uY29tOyBjaHJpc3RvZmZlci5kYWxsQGxpbmFyby5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtR
ZW11LWRldmVsXSBbUkZDIHYyIDAvOF0gVklSVElPLUlPTU1VIGRldmljZQ0KPiA+Pg0KPiA+PiBP
biAwNS8wNy8xNyAwOTo0OSwgQmhhcmF0IEJodXNoYW4gd3JvdGU6Pj4+IEFsc28gd2hlbiBzZXR1
cCBtc2ktcm91dGUNCj4gPj4ga3ZtX2lycWNoaXBfYWRkX21zaV9yb3V0ZSgpIHdlIG5lZWRlZCB0
bw0KPiA+Pj4+IHByb3ZpZGUgdGhlIHRyYW5zbGF0ZWQgYWRkcmVzcy4NCj4gPj4+Pj4gQWNjb3Jk
aW5nIHRvIG15IHVuZGVyc3RhbmRpbmcgdGhpcyBpcyByZXF1aXJlZCBiZWNhdXNlIGtlcm5lbCBk
b2VzDQo+ID4+Pj4+IG5vIGdvDQo+ID4+Pj4gdGhyb3VnaCB2aW9tbXUgdHJhbnNsYXRpb24gd2hl
biBnZW5lcmF0aW5nIGludGVycnVwdCwgbm8/DQo+ID4+Pj4NCj4gPj4+PiB5ZXMgdGhpcyBpcyBu
ZWVkZWQgd2hlbiBLVk0gTVNJIHJvdXRlcyBhcmUgc2V0IHVwLCBpZS4gYWxvbmcgd2l0aA0KPiA+
Pj4+IEdJQ1YzDQo+ID4+IElUUy4NCj4gPj4+PiBXaXRoIEdJQ3YyTSwgcWVtdSBkaXJlY3QgZ3Np
IG1hcHBpbmcgaXMgdXNlZCBhbmQgdGhpcyBpcyBub3QgbmVlZGVkLg0KPiA+Pj4+DQo+ID4+Pj4g
U28gSSBkbyBub3QgdW5kZXJzdGFuZCB5b3VyIHByZXZpb3VzIHNlbnRlbmNlIHNheWluZyAiTVNJ
DQo+ID4+Pj4gaW50ZXJydXB0cyB3b3JrcyB3aXRob3V0IGFueSBjaGFuZ2UiLg0KPiA+Pj4NCj4g
Pj4+IEkgaGF2ZSBhbG1vc3QgY29tcGxldGVkIHZmaW8gaW50ZWdyYXRpb24gd2l0aCB2aXJ0aW8t
aW9tbXUgYW5kIG5vdw0KPiA+Pj4gdGVzdGluZyB0aGUgY2hhbmdlcyBieSBhc3NpZ25pbmcgZTEw
MDAgZGV2aWNlIHRvIFZNLiBGb3IgdGhpcyBJIGhhdmUNCj4gPj4+IGNoYW5nZWQgdmlydGlvLWlv
bW11IGRyaXZlciB0byB1c2UgSU9NTVVfUkVTVl9NU0kgcmF0aGVyIHRoYW4gc3ctDQo+IG1zaQ0K
PiA+Pj4gYW5kIHRoaXMgZG9lcyBub3QgbmVlZCBjaGFuZ2VkIGluIHZmaW9fZ2V0X2FkZHIoKSAg
YW5kDQo+ID4+PiBrdm1faXJxY2hpcF9hZGRfbXNpX3JvdXRlKCkNCj4gPj4NCj4gPj4gSSB1bmRl
cnN0YW5kIHlvdSdyZSByZXNlcnZpbmcgcmVnaW9uIDB4MDgwMDAwMDAtMHgwODEwMDAwMCBhcw0K
PiA+PiBJT01NVV9SRVNWX01TSSBpbnN0ZWFkIG9mIElPTU1VX1JFU1ZfU1dfTVNJPyBJIHRoaW5r
IHRoaXMgb25seQ0KPiB3b3Jrcw0KPiA+PiBiZWNhdXNlIFFlbXUgcGxhY2VzIHRoZSB2Z2ljIGlu
IHRoYXQgYXJlYSBhcyB3ZWxsIChpbiBody9hcm0vdmlydC5jKS4NCj4gPj4gSXQncyBub3QgYSBj
b2luY2lkZW5jZSBpZiB0aGUgYWRkcmVzc2VzIGFyZSB0aGUgc2FtZSwgYmVjYXVzZSBFcmljDQo+
ID4+IGNob3NlIHRoZW0gZm9yIHRoZSBMaW51eCBTTU1VIGRyaXZlcnMgYW5kIEkgY29waWVkIHRo
ZW0uDQo+ID4+DQo+ID4+IFdlIGNhbid0IHJlbHkgb24gdGhhdCBiZWhhdmlvciwgdGhvdWdoLCBp
dCB3aWxsIGJyZWFrIE1TSXMgaW4NCj4gPj4gZW11bGF0ZWQgZGV2aWNlcy4gQW5kIGlmIFFlbXUg
aGFwcGVucyB0byBtb3ZlIHRoZSBNU0kgZG9vcmJlbGwgaW4NCj4gPj4gZnV0dXJlIG1hY2hpbmUg
cmV2aXNpb25zLCB0aGVuIGl0IHdvdWxkIGFsc28gYnJlYWsgVkZJTy4NCj4gPg0KPiA+IFllcywg
bWFrZSBzZW5zZSB0byBtZQ0KPiA+DQo+ID4+DQo+ID4+IEp1c3QgZm9yIG15IG93biB1bmRlcnN0
YW5kaW5nIC0tIHdoYXQgaGFwcGVucywgSSB0aGluaywgaXMgdGhhdCBpbg0KPiA+PiBMaW51eCBp
b3ZhX3Jlc2VydmVfaW9tbXVfcmVnaW9ucyBpbml0aWFsbHkgcmVzZXJ2ZXMgdGhlDQo+ID4+IGd1
ZXN0LXBoeXNpY2FsIGRvb3JiZWxsIDB4MDgwMDAwMDAtMHgwODEwMDAwMC4gVGhlbiBtdWNoIGxh
dGVyLCB3aGVuDQo+ID4+IHRoZSBkZXZpY2UgZHJpdmVyIHJlcXVlc3RzIGFuIE1TSSwgdGhlIGly
cWNoaXAgZHJpdmVyIGNhbGxzDQo+ID4+IGlvbW11X2RtYV9tYXBfbXNpX21zZyB3aXRoIHRoZSBn
dWVzdC0gcGh5c2ljYWwgZ2ljdjJtIGFkZHJlc3MNCj4gPj4gMHgwODAyMDAwMC4gVGhlIGZ1bmN0
aW9uIGZpbmRzIHRoZSByaWdodCBwYWdlIGluIG1zaV9wYWdlX2xpc3QsIHdoaWNoDQo+ID4+IHdh
cyBhZGRlZCBieSBjb29raWVfaW5pdF9od19tc2lfcmVnaW9uLCB0aGVyZWZvcmUgYnlwYXNzaW5n
IHRoZQ0KPiB2aW9tbXUgYW5kIHRoZSBHUEEgZ2V0cyB3cml0dGVuIGluIHRoZSBNU0ktWCB0YWJs
ZS4NCj4gPg0KPiA+IFRoaXMgbWVhbnMgaW4gY2FzZSB0b21vcnJvdyB3aGVuIHFlbXUgY2hhbmdl
cyB2aXJ0IG1hY2hpbmUgYWRkcmVzcw0KPiBtYXAgYW5kIHZnaWMtaXRzIChpdHMtdHJhbnNsYXRv
ciByZWdpc3RlciBhZGRyZXNzKSBhZGRyZXNzIHJhbmdlIGRvZXMgbm90IGZhbGwNCj4gaW4gdGhl
IG1zaV9wYWdlX2xpc3QgdGhlbiBpdCB3aWxsIGFsbG9jYXRlIGEgbmV3IGlvdmEsIGNyZWF0ZSBt
YXBwaW5nIGluDQo+IGlvbW11LiBTbyB0aGlzIHdpbGwgbm8gbG9uZ2VyIGJlIGlkZW50aXR5IG1h
cHBlZCBhbmQgZmFpbCB0byB3b3JrIHdpdGggbmV3DQo+IHFlbXU/DQo+ID4NCj4gWWVzIHRoYXQn
cyBjb3JyZWN0Lg0KPiA+Pg0KPiA+PiBJZiBhbiBlbXVsYXRlZCBkZXZpY2Ugc3VjaCBhcyB2aXJ0
aW8tbmV0LXBjaSB3ZXJlIHRvIGdlbmVyYXRlIGFuIE1TSSwNCj4gPj4gdGhlbiBRZW11IHdvdWxk
IGF0dGVtcHQgdG8gYWNjZXNzIHRoZSBkb29yYmVsbCB3cml0dGVuIGJ5IExpbnV4IGludG8NCj4g
Pj4gdGhlIE1TSS1YIHRhYmxlLCAweDA4MDIwMDAwLCBhbmQgZmF1bHQgYmVjYXVzZSB0aGF0IGFk
ZHJlc3Mgd2Fzbid0DQo+ID4+IG1hcHBlZCBpbiB0aGUgdmlvbW11Lg0KPiA+Pg0KPiA+PiBTbyBm
b3IgVkZJTywgeW91IGVpdGhlciBuZWVkIHRvIHRyYW5zbGF0ZSB0aGUgTVNJLVggZW50cnkgdXNp
bmcgdGhlDQo+ID4+IHZpb21tdSwgb3IganVzdCBhc3N1bWUgdGhhdCB0aGUgdmFkZHIgY29ycmVz
cG9uZHMgdG8gdGhlIG9ubHkgTVNJDQo+ID4+IGRvb3JiZWxsIGFjY2Vzc2libGUgYnkgdGhpcyBk
ZXZpY2UgKGJlY2F1c2UgaG93IGNhbiB3ZSBiZSBjZXJ0YWluDQo+ID4+IHRoYXQgdGhlIGd1ZXN0
IGFscmVhZHkgbWFwcGVkIHRoZSBkb29yYmVsbCBiZWZvcmUgd3JpdGluZyB0aGUgZW50cnk/KQ0K
PiA+Pg0KPiA+PiBGb3IgQVJNIG1hY2hpbmVzIGl0J3MgcHJvYmFibHkgYmVzdCB0byBzdGljayB3
aXRoDQo+IElPTU1VX1JFU1ZfU1dfTVNJLg0KPiA+PiBIb3dldmVyLCBhIG5pY2Ugd2F5IHRvIHVz
ZSBJT01NVV9SRVNWX01TSSB3b3VsZCBiZSBmb3IgdGhlIHZpcnRpby0NCj4gPj4gaW9tbXUgZGV2
aWNlIHRvIGFkdmVydGlzZSBpZGVudGl0eS1tYXBwZWQvcmVzZXJ2ZWQgcmVnaW9ucywgYW5kDQo+
ID4+IGJ5cGFzcyB0cmFuc2xhdGlvbiBvbiB0aGVzZSByZWdpb25zLiBUaGVuIHRoZSBkcml2ZXIg
Y291bGQgcmVzZXJ2ZQ0KPiA+PiB0aG9zZSB3aXRoIElPTU1VX1JFU1ZfTVNJLg0KPiA+DQo+ID4g
Q29ycmVjdCBtZSBpZiBJIGRpZCBub3QgdW5kZXJzdG9vZCB5b3UgY29ycmVjdGx5LCB0b2RheSBp
b21tdS1kcml2ZXINCj4gZGVjaWRlcyBtc2ktcmVzZXJ2ZWQgcmVnaW9uLCB3aGF0IGlmIHdlIGNo
YW5nZSB0aGlzIGFuZCB2aXJ0aW8taW9tbXUgZGV2aWNlDQo+IHdpbGwgcHJvdmlkZSB0aGUgcmVz
ZXJ2ZWQgbXNpIHJlZ2lvbiBhcyBwZXIgdGhlIGVtdWxhdGVkIG1hY2hpbmUgKHZpcnQvaW50ZWwp
Lg0KPiBTbyB2aXJ0aW8taW9tbXUgZHJpdmVyIHdpbGwgdXNlIHRoZSBhZGRyZXNzIGFkdmVydGlz
ZWQgYnkgdmlydGlvLWlvbW11IGRldmljZQ0KPiBhcyBJT01NVV9SRVNWX01TSS4gSW4gdGhpcyBj
YXNlIG1zaS1wYWdlLWxpc3Qgd2lsbCBhbHdheXMgaGF2ZSB0aGUNCj4gcmVzZXJ2ZWQgcmVnaW9u
IGZvciBNU0kuDQo+ID4gT24gcWVtdSBzaWRlLCBmb3IgZW11bGF0ZWQgZGV2aWNlcyB3ZSB3aWxs
IGxldCB2aXJ0aW8taW9tbXUgcmV0dXJuIHNhbWUNCj4gYWRkcmVzcyBhcyB0cmFuc2xhdGVkIGFk
ZHJlc3MgYXMgaXQgZmFsbHMgaW4gTVNJLXJlc2VydmVkIHBhZ2UgYWxyZWFkeSBrbm93bg0KPiB0
byBpdC4NCj4gDQo+IEkgdGhpbmsgd2hhdCB5b3UncmUgcHJvcG9zaW5nIGhlcmUgY29ycmVzcG9u
ZHMgdG8gdGhlIDFzdCBhcHByb2FjaCB0aGF0IHdhcw0KPiBmb2xsb3dlZCBmb3IgUENJZSBwYXNz
dGhyb3VnaC9NU0kgb24gQVJNLCBpZS4gdGhlIHVzZXJzcGFjZSB3YXMgcHJvdmlkaW5nDQo+IHRo
ZSByZXNlcnZlZCByZWdpb24gYmFzZSBhZGRyZXNzICYgc2l6ZS4NCj4gIFRoaXMgd2FzIHJ1bGVk
IG91dCBhbmQgbm93IHRoaXMNCj4gcmVnaW9uIGlzIGFyYml0cmFyaWx5IHNldCBieSB0aGUgc21t
dS1kcml2ZXIuIEF0IHRoZSBtb21lbnQgdGhpcyBtZWFucyB0aGlzDQo+IHJlZ2lvbiBjYW5ub3Qg
Y29udGFpbiBndWVzdCBSQU0uDQoNCkluIHJlamVjdGVkIHByb3Bvc2FsLCB1c2VyLXNwYWNlIHVz
ZWQgdG8gY2hvb3NlIGEgcmVzZXJ2ZSByZWdpb24gYW5kIHByb3ZpZGUgdGhhdCB0byBIb3N0IExp
bnV4LiBIb3N0IExpbnV4IHVzZXMgdGhhdCBNU0kgbWFwcGluZy4gSnVzdCBmb3IgbXkgdW5kZXJz
dGFuZGluZyBpZiB0b21vcnJvdyBRRU1VIGNoYW5nZXMgaXRzIGFkZHJlc3Mgc3BhY2UgdGhlbiBp
dCBtYXkgbm90IHdvcmsgd2l0aG91dCBjaGFuZ2luZyBTTU1VIG1zaS1yZXNlcnZlZC1pb3ZhIGlu
IGhvc3QgZHJpdmVyLCByaWdodD8gRm9yIGV4YW1wbGUgaWYgZW11bGF0ZWQgbWFjaGluZSBoYXZl
IFJBTSBhdCB0aGlzIGFkZHJlc3MgdGhlbiBpdCB3aWxsIG5vdCB3b3JrPw0KDQpJbiB0aGlzIHBy
b3Bvc2FsLCBRRU1VIHJlc2VydmVzIGEgaW92YS1yYW5nZSBmb3IgZ3Vlc3QgKG5vdCBob3N0KSBh
bmQgZ3Vlc3Qga2VybmVsIHdpbGwgdXNlIHRoaXMgYXMgbXNpLWlvdmEgdW50cmFuc2xhdGVkIChJ
T01NVV9SRVNWX01TSSkuIFdoaWxlIHRoaXMgZG9lcyBub3QgY2hhbmdlIGhvc3QgaW50ZXJmYWNl
IGFuZCBpdCB3aWxsIGNvbnRpbnVlIHRvIHVzZSBob3N0IHJlc2VydmVkIG1hcHBpbmcgZm9yIGFj
dHVhbCBpbnRlcnJ1cHQgZ2VuZXJhdGlvbiwgbm8/DQoNClRoYW5rcw0KLUJoYXJhdA0KDQo+IA0K
PiA+DQo+ID4NCj4gPj4gRm9yIHg4NiB3ZSB3aWxsIG5lZWQgc3VjaCBhIHN5c3RlbSwgd2l0aCBh
biBhZGRlZCBJUlEgcmVtYXBwaW5nDQo+ID4+IGZlYXR1cmUuDQo+ID4NCj4gPiBJIGRvIG5vdCB1
bmRlcnN0YW5kIHg4NiBNU0kgaW50ZXJydXB0IGdlbmVyYXRpb24sIGJ1dCBJZiBhYm92ZSB1bmRl
cnN0YW5kDQo+IGlzIGNvcnJlY3QsIHRoZW4gd2h5IHdlIG5lZWQgSVJRIHJlbWFwcGluZyBmb3Ig
eDg2Pw0KPiBUbyBtZSB4ODYgSVIgY29ycmVzcG9uZHMgc2ltcGx5IGNvcnJlc3BvbmRzIHRvIHRo
ZSBJVFMgTVNJIGNvbnRyb2xsZXINCj4gbW9kYWxpdHkgb24gQVJNLiBTbyBhcyB5b3Ugc3RpbGwg
bmVlZCB2SVRTIGFsb25nIHdpdGggdmlydGlvLWlvbW11IG9uIEFSTSwNCj4geW91IG5lZWQgdklS
USBhbG9uZ3Mgd2l0aCB2aXJ0aW8taW9tbXUgb24gSW50ZWwuIERvZXMgdGhhdCBtYWtlIHNlbnNl
Pw0KPiANCj4gU28gaW4gYW55IGNhc2Ugd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGd1ZXN0IHVz
ZXMgYSB2SVRTIG9yIHZJUiB0byBtYWtlDQo+IHN1cmUgTVNJcyBhcmUgY29ycmVjdGx5IGlzb2xh
dGVkLg0KPiANCj4gDQo+ID4gV2lsbCB0aGUgeDg2IG1hY2hpbmUgZW11bGF0ZWQgaW4gUUVNVSBw
cm92aWRlcyBhIGJpZyBhZGRyZXNzIHJhbmdlIGZvcg0KPiBNU0lzIGFuZCB3aGVuIGFjdHVhbGx5
IGdlbmVyYXRpbmcgTVNJIGl0IG5lZWRlZCBzb21lIGV4dHJhIHByb2Nlc3NpbmcNCj4gKElSUS1y
ZW1hcHBpbmcgcHJvY2Vzc2luZykgYmVmb3JlIGFjdHVhbGx5IGdlbmVyYXRpbmcgd3JpdGUgdHJh
bnNhY3Rpb24gZm9yDQo+IE1TSSBpbnRlcnJ1cHQgPw0KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIG9u
IHg4NiwgdGhlIE1TSSB3aW5kb3cgaXMgZml4ZWQgYW5kIG1hdGNoZXMNCj4gW0ZFRTBfMDAwMGgg
4oCTIEZFRjBfMDAwaF0uIE1TSXMgYXJlIGNvbnZleWVkIG9uIGEgc2VwYXJhdGUgYWRkcmVzcyBz
cGFjZQ0KPiB0aGFuIHVzdWFsIERNQSBhY2Nlc3Nlcy4gQW5kIHllcyB0aGV5IGVuZCB1cCBpbiBJ
UiBpZiBzdXBwb3J0ZWQgaW4gdGhlIEhXLg0KPiANCj4gVGhhbmtzDQo+IA0KPiBFcmljDQo+ID4N
Cj4gPiBUaGFua3MNCj4gPiAtQmhhcmF0DQo+ID4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBK
ZWFuDQo=
