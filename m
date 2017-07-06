Received: by 10.25.44.15 with SMTP id s15csp1913155lfs;
        Thu, 6 Jul 2017 04:24:15 -0700 (PDT)
X-Received: by 10.55.54.196 with SMTP id d187mr62435929qka.96.1499340255461;
        Thu, 06 Jul 2017 04:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499340255; cv=none;
        d=google.com; s=arc-20160816;
        b=mAAydP/fpAQp12hZIz4FoqzNF30+jI7zHi0W2pR0wo/o5of8Ozd1D6KO13Lte9w74f
         YnAEt8eeyWCcZqH6yndZpgjelXtZZc/nebsvrYFPdVnW/boOxEz3NxzKHoCuw02tbO4X
         tRfEoPY5G89WgfBZhmDIqq6JUijDs0gJX043eNduX+bKr5mHMYLSsl5TJ40z1tAd5oS+
         8EtQ1OnMAah9xfFqXgH2GyLAydfEqLiEnllBt4GiCU9c2rLq7q7o2WwUg6CLYaWFYC3Y
         fj27TBIry67UBbePgIoTzNNEM+9faymjXAQa1l352/ucxO1YO/E/IgUJFpAiK+SIHD/Q
         MY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=5esFDYlLlLdRhcG4Q/VbS0YN1BStVaSPrfg/3MRlW2A=;
        b=OJR0sK7zW/Xa132rxNvY9C6feExztrSQgxwEMWud/sdDRDtAw5XLvyehaSgIdn2FSr
         fIpIwI5K9zNz/fQv/EB+Tzay5Cksj7//0wgfXf9C/z9igdsqt+EcrBptybk4miwCy7hI
         1kFbRbJ1luTtc+bgBchocYCvZB3FwuqwQHgvjPgW3WWG0Qb0oZN6mwj1fEcCfF4h/PKT
         7vtZLnWqMtDc1POhtKQNxZT3Kg/sOKDMLFp4ZK7iUp18q5Tf5cPprfw7woLdAmMxX5zv
         B/OisfufXQ0wy7ZkkOHVibnxtF1oun2EOGWw1ju8a3XaSvCv7X2B8VCPHcvtaUNUZ0Nz
         3SRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=fv5FlnqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i69si40385qke.182.2017.07.06.04.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 04:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=fv5FlnqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:50722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dT4tI-0006Gs-Dy
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 07:24:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dT4tE-0006Gl-Gp
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 07:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dT4tB-0006Cp-Bq
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 07:24:08 -0400
Received: from mail-eopbgr50044.outbound.protection.outlook.com
	([40.107.5.44]:37024
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dT4tA-0006CF-Sx; Thu, 06 Jul 2017 07:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=5esFDYlLlLdRhcG4Q/VbS0YN1BStVaSPrfg/3MRlW2A=;
	b=fv5FlnqITuyN3sPX7Y6ykpVU40EO6Q2hBLzrjAHBouha7a6Ksdyd0vZ31OIuL5Z2zbu07NOUGJO7dEX6x5FCK+8sDJ+5iGa88/3yzhrxWMg7WFhqq/kklc2N7EavgkGcG8j5P/p9WfyxVDO4m1z8PBysheDFuK/JWU1xMY8Cq8U=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2546.eurprd04.prod.outlook.com (10.169.245.9) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Thu, 6 Jul 2017 11:24:01 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2%17]) with mapi id 15.01.1240.013;
	Thu, 6 Jul 2017 11:24:01 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, Auger Eric
	<eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuAgAAYhwCAAABHwIABqBOAgAAO8rA=
Date: Thu, 6 Jul 2017 11:24:01 +0000
Message-ID: <AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
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
In-Reply-To: <e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
	header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2546;
	7:/AyYbFL0v08+sR5Xs0Xsr6/9fheNrkPRSSLi8JzK7+yLlZZDvXta4YgXGMsZhHJEL6zfXtluiBRRfC7j0ou42Tm1AP4EoYMmQmbz7mYw7++SQfHjCAcuZsziZH6cXyT/rsw18RyiX/suoFjmHwgNQZfpo1VPiNwdae+KFmNmU8tfGfymWoLKMZB4yN+DvAAgWKSxR/xN3Al/U6qH1dvE7JmAndIXdW3lhz6n/SR5ADxk1BfcNX9lLD/ktEO9HxN3XOe0Spxyp3+sXg2GrQPEezeleFWd/cS4pSZsckbiPrb5WG6VmAazJou1GduQz3IqIZ2wY/qtm0rw/7ocLgvQfNqNbn4O2wuLZHCpHZmKyX30Rb7M0+6129Ou8ZjR0OwPNfiThUyYzeW+RV8dPSYWyTUNdd8hdEZOxRA/gw4nZeomCcFyTVzVGcLEH2FOAUG4SEvMubTBlO6PsSMJvQscWc3O0SaHvKOufUWcp31Vg4DKG5j1YJTaeopWbqn5bX81RFABuVx30mfQmfbBjYIQCystlucBBq7Y5dffKBVDLn4w4RYI3bADtJ3UD24cw+AZeppco52aLLbWYP1tt/5kUxt6tjel4lyywvWAECf96Mlw2WjvG2cGKgZa2FN93i2w81OOncMxrzwDdKXLbYUvwRd2OoqH0Z76Doc7XPe6VlR9k18sI9DikXadxfmJ0Q93sDsd+Rjp1+mSDNHvhs34X1HqV4p+RXmNQOFC5dlx/vBWsrMEipMHDLELqrE4DsHdVNK/7pzy0iCALRvRrPWBr5uRRTDb1tTUOZCMA7KRI6k=
x-ms-office365-filtering-correlation-id: dd9228db-01bc-4ec3-7b31-08d4c461808e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2546; 
x-ms-traffictypediagnostic: AM5PR0401MB2546:
x-microsoft-antispam-prvs: <AM5PR0401MB2546A4D82B1DD4A03E05CA249AD50@AM5PR0401MB2546.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(48057245064654)(148574349560750)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2546; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2546; 
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(39860400002)(39450400003)(39410400002)(39850400002)(39400400002)(39840400002)(24454002)(377454003)(13464003)(66066001)(7416002)(6436002)(5660300001)(25786009)(3660700001)(81166006)(4326008)(6506006)(8676002)(8936002)(53546010)(2950100002)(2900100001)(14454004)(478600001)(86362001)(229853002)(2906002)(7696004)(50986999)(5250100002)(54356999)(305945005)(76176999)(33656002)(2501003)(54906002)(55016002)(93886004)(99286003)(7736002)(74316002)(2201001)(3846002)(551934003)(189998001)(53936002)(102836003)(6116002)(3280700002)(39060400002)(9686003)(6246003)(38730400002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2546;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2017 11:24:01.2404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.44
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
X-TUID: 0ZgQB/2hOdPJ

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmVhbi1QaGlsaXBwZSBC
cnVja2VyIFttYWlsdG86amVhbi1waGlsaXBwZS5icnVja2VyQGFybS5jb21dDQo+IFNlbnQ6IFRo
dXJzZGF5LCBKdWx5IDA2LCAyMDE3IDM6MzMgUE0NCj4gVG86IEJoYXJhdCBCaHVzaGFuIDxiaGFy
YXQuYmh1c2hhbkBueHAuY29tPjsgQXVnZXIgRXJpYw0KPiA8ZXJpYy5hdWdlckByZWRoYXQuY29t
PjsgZXJpYy5hdWdlci5wcm9AZ21haWwuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7
IGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsNCj4gcWVtdS1hcm1A
bm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiB3ZWlAcmVkaGF0LmNvbTsg
a2V2aW4udGlhbkBpbnRlbC5jb207IG1hcmMuenluZ2llckBhcm0uY29tOw0KPiB0bkBzZW1paGFs
Zi5jb207IHdpbGwuZGVhY29uQGFybS5jb207IGRyam9uZXNAcmVkaGF0LmNvbTsNCj4gcm9iaW4u
bXVycGh5QGFybS5jb207IGNocmlzdG9mZmVyLmRhbGxAbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1FlbXUtZGV2ZWxdIFtSRkMgdjIgMC84XSBWSVJUSU8tSU9NTVUgZGV2aWNlDQo+IA0KPiBP
biAwNS8wNy8xNyAwOTo0OSwgQmhhcmF0IEJodXNoYW4gd3JvdGU6Pj4+IEFsc28gd2hlbiBzZXR1
cCBtc2ktcm91dGUNCj4ga3ZtX2lycWNoaXBfYWRkX21zaV9yb3V0ZSgpIHdlIG5lZWRlZCB0bw0K
PiA+PiBwcm92aWRlIHRoZSB0cmFuc2xhdGVkIGFkZHJlc3MuDQo+ID4+PiBBY2NvcmRpbmcgdG8g
bXkgdW5kZXJzdGFuZGluZyB0aGlzIGlzIHJlcXVpcmVkIGJlY2F1c2Uga2VybmVsIGRvZXMNCj4g
Pj4+IG5vIGdvDQo+ID4+IHRocm91Z2ggdmlvbW11IHRyYW5zbGF0aW9uIHdoZW4gZ2VuZXJhdGlu
ZyBpbnRlcnJ1cHQsIG5vPw0KPiA+Pg0KPiA+PiB5ZXMgdGhpcyBpcyBuZWVkZWQgd2hlbiBLVk0g
TVNJIHJvdXRlcyBhcmUgc2V0IHVwLCBpZS4gYWxvbmcgd2l0aCBHSUNWMw0KPiBJVFMuDQo+ID4+
IFdpdGggR0lDdjJNLCBxZW11IGRpcmVjdCBnc2kgbWFwcGluZyBpcyB1c2VkIGFuZCB0aGlzIGlz
IG5vdCBuZWVkZWQuDQo+ID4+DQo+ID4+IFNvIEkgZG8gbm90IHVuZGVyc3RhbmQgeW91ciBwcmV2
aW91cyBzZW50ZW5jZSBzYXlpbmcgIk1TSSBpbnRlcnJ1cHRzDQo+ID4+IHdvcmtzIHdpdGhvdXQg
YW55IGNoYW5nZSIuDQo+ID4NCj4gPiBJIGhhdmUgYWxtb3N0IGNvbXBsZXRlZCB2ZmlvIGludGVn
cmF0aW9uIHdpdGggdmlydGlvLWlvbW11IGFuZCBub3cNCj4gPiB0ZXN0aW5nIHRoZSBjaGFuZ2Vz
IGJ5IGFzc2lnbmluZyBlMTAwMCBkZXZpY2UgdG8gVk0uIEZvciB0aGlzIEkgaGF2ZQ0KPiA+IGNo
YW5nZWQgdmlydGlvLWlvbW11IGRyaXZlciB0byB1c2UgSU9NTVVfUkVTVl9NU0kgcmF0aGVyIHRo
YW4gc3ctbXNpDQo+ID4gYW5kIHRoaXMgZG9lcyBub3QgbmVlZCBjaGFuZ2VkIGluIHZmaW9fZ2V0
X2FkZHIoKSAgYW5kDQo+ID4ga3ZtX2lycWNoaXBfYWRkX21zaV9yb3V0ZSgpDQo+IA0KPiBJIHVu
ZGVyc3RhbmQgeW91J3JlIHJlc2VydmluZyByZWdpb24gMHgwODAwMDAwMC0weDA4MTAwMDAwIGFz
DQo+IElPTU1VX1JFU1ZfTVNJIGluc3RlYWQgb2YgSU9NTVVfUkVTVl9TV19NU0k/IEkgdGhpbmsg
dGhpcyBvbmx5DQo+IHdvcmtzIGJlY2F1c2UgUWVtdSBwbGFjZXMgdGhlIHZnaWMgaW4gdGhhdCBh
cmVhIGFzIHdlbGwgKGluIGh3L2FybS92aXJ0LmMpLg0KPiBJdCdzIG5vdCBhIGNvaW5jaWRlbmNl
IGlmIHRoZSBhZGRyZXNzZXMgYXJlIHRoZSBzYW1lLCBiZWNhdXNlIEVyaWMgY2hvc2UgdGhlbQ0K
PiBmb3IgdGhlIExpbnV4IFNNTVUgZHJpdmVycyBhbmQgSSBjb3BpZWQgdGhlbS4NCj4gDQo+IFdl
IGNhbid0IHJlbHkgb24gdGhhdCBiZWhhdmlvciwgdGhvdWdoLCBpdCB3aWxsIGJyZWFrIE1TSXMg
aW4gZW11bGF0ZWQNCj4gZGV2aWNlcy4gQW5kIGlmIFFlbXUgaGFwcGVucyB0byBtb3ZlIHRoZSBN
U0kgZG9vcmJlbGwgaW4gZnV0dXJlIG1hY2hpbmUNCj4gcmV2aXNpb25zLCB0aGVuIGl0IHdvdWxk
IGFsc28gYnJlYWsgVkZJTy4NCg0KWWVzLCBtYWtlIHNlbnNlIHRvIG1lDQoNCj4gDQo+IEp1c3Qg
Zm9yIG15IG93biB1bmRlcnN0YW5kaW5nIC0tIHdoYXQgaGFwcGVucywgSSB0aGluaywgaXMgdGhh
dCBpbiBMaW51eA0KPiBpb3ZhX3Jlc2VydmVfaW9tbXVfcmVnaW9ucyBpbml0aWFsbHkgcmVzZXJ2
ZXMgdGhlIGd1ZXN0LXBoeXNpY2FsIGRvb3JiZWxsDQo+IDB4MDgwMDAwMDAtMHgwODEwMDAwMC4g
VGhlbiBtdWNoIGxhdGVyLCB3aGVuIHRoZSBkZXZpY2UgZHJpdmVyIHJlcXVlc3RzDQo+IGFuIE1T
SSwgdGhlIGlycWNoaXAgZHJpdmVyIGNhbGxzIGlvbW11X2RtYV9tYXBfbXNpX21zZyB3aXRoIHRo
ZSBndWVzdC0NCj4gcGh5c2ljYWwgZ2ljdjJtIGFkZHJlc3MgMHgwODAyMDAwMC4gVGhlIGZ1bmN0
aW9uIGZpbmRzIHRoZSByaWdodCBwYWdlIGluDQo+IG1zaV9wYWdlX2xpc3QsIHdoaWNoIHdhcyBh
ZGRlZCBieSBjb29raWVfaW5pdF9od19tc2lfcmVnaW9uLCB0aGVyZWZvcmUNCj4gYnlwYXNzaW5n
IHRoZSB2aW9tbXUgYW5kIHRoZSBHUEEgZ2V0cyB3cml0dGVuIGluIHRoZSBNU0ktWCB0YWJsZS4N
Cg0KVGhpcyBtZWFucyBpbiBjYXNlIHRvbW9ycm93IHdoZW4gcWVtdSBjaGFuZ2VzIHZpcnQgbWFj
aGluZSBhZGRyZXNzIG1hcCBhbmQgdmdpYy1pdHMgKGl0cy10cmFuc2xhdG9yIHJlZ2lzdGVyIGFk
ZHJlc3MpIGFkZHJlc3MgcmFuZ2UgZG9lcyBub3QgZmFsbCBpbiB0aGUgbXNpX3BhZ2VfbGlzdCB0
aGVuIGl0IHdpbGwgYWxsb2NhdGUgYSBuZXcgaW92YSwgY3JlYXRlIG1hcHBpbmcgaW4gaW9tbXUu
IFNvIHRoaXMgd2lsbCBubyBsb25nZXIgYmUgaWRlbnRpdHkgbWFwcGVkIGFuZCBmYWlsIHRvIHdv
cmsgd2l0aCBuZXcgcWVtdT8NCg0KPiANCj4gSWYgYW4gZW11bGF0ZWQgZGV2aWNlIHN1Y2ggYXMg
dmlydGlvLW5ldC1wY2kgd2VyZSB0byBnZW5lcmF0ZSBhbiBNU0ksIHRoZW4NCj4gUWVtdSB3b3Vs
ZCBhdHRlbXB0IHRvIGFjY2VzcyB0aGUgZG9vcmJlbGwgd3JpdHRlbiBieSBMaW51eCBpbnRvIHRo
ZSBNU0ktWA0KPiB0YWJsZSwgMHgwODAyMDAwMCwgYW5kIGZhdWx0IGJlY2F1c2UgdGhhdCBhZGRy
ZXNzIHdhc24ndCBtYXBwZWQgaW4gdGhlDQo+IHZpb21tdS4NCj4gDQo+IFNvIGZvciBWRklPLCB5
b3UgZWl0aGVyIG5lZWQgdG8gdHJhbnNsYXRlIHRoZSBNU0ktWCBlbnRyeSB1c2luZyB0aGUgdmlv
bW11LA0KPiBvciBqdXN0IGFzc3VtZSB0aGF0IHRoZSB2YWRkciBjb3JyZXNwb25kcyB0byB0aGUg
b25seSBNU0kgZG9vcmJlbGwNCj4gYWNjZXNzaWJsZSBieSB0aGlzIGRldmljZSAoYmVjYXVzZSBo
b3cgY2FuIHdlIGJlIGNlcnRhaW4gdGhhdCB0aGUgZ3Vlc3QNCj4gYWxyZWFkeSBtYXBwZWQgdGhl
IGRvb3JiZWxsIGJlZm9yZSB3cml0aW5nIHRoZSBlbnRyeT8pDQo+IA0KPiBGb3IgQVJNIG1hY2hp
bmVzIGl0J3MgcHJvYmFibHkgYmVzdCB0byBzdGljayB3aXRoIElPTU1VX1JFU1ZfU1dfTVNJLg0K
PiBIb3dldmVyLCBhIG5pY2Ugd2F5IHRvIHVzZSBJT01NVV9SRVNWX01TSSB3b3VsZCBiZSBmb3Ig
dGhlIHZpcnRpby0NCj4gaW9tbXUgZGV2aWNlIHRvIGFkdmVydGlzZSBpZGVudGl0eS1tYXBwZWQv
cmVzZXJ2ZWQgcmVnaW9ucywgYW5kIGJ5cGFzcw0KPiB0cmFuc2xhdGlvbiBvbiB0aGVzZSByZWdp
b25zLiBUaGVuIHRoZSBkcml2ZXIgY291bGQgcmVzZXJ2ZSB0aG9zZSB3aXRoDQo+IElPTU1VX1JF
U1ZfTVNJLg0KDQpDb3JyZWN0IG1lIGlmIEkgZGlkIG5vdCB1bmRlcnN0b29kIHlvdSBjb3JyZWN0
bHksIHRvZGF5IGlvbW11LWRyaXZlciBkZWNpZGVzIG1zaS1yZXNlcnZlZCByZWdpb24sIHdoYXQg
aWYgd2UgY2hhbmdlIHRoaXMgYW5kIHZpcnRpby1pb21tdSBkZXZpY2Ugd2lsbCBwcm92aWRlIHRo
ZSByZXNlcnZlZCBtc2kgcmVnaW9uIGFzIHBlciB0aGUgZW11bGF0ZWQgbWFjaGluZSAodmlydC9p
bnRlbCkuIFNvIHZpcnRpby1pb21tdSBkcml2ZXIgd2lsbCB1c2UgdGhlIGFkZHJlc3MgYWR2ZXJ0
aXNlZCBieSB2aXJ0aW8taW9tbXUgZGV2aWNlIGFzIElPTU1VX1JFU1ZfTVNJLiBJbiB0aGlzIGNh
c2UgbXNpLXBhZ2UtbGlzdCB3aWxsIGFsd2F5cyBoYXZlIHRoZSByZXNlcnZlZCByZWdpb24gZm9y
IE1TSS4NCk9uIHFlbXUgc2lkZSwgZm9yIGVtdWxhdGVkIGRldmljZXMgd2Ugd2lsbCBsZXQgdmly
dGlvLWlvbW11IHJldHVybiBzYW1lIGFkZHJlc3MgYXMgdHJhbnNsYXRlZCBhZGRyZXNzIGFzIGl0
IGZhbGxzIGluIE1TSS1yZXNlcnZlZCBwYWdlIGFscmVhZHkga25vd24gdG8gaXQuDQoNCg0KPiBG
b3IgeDg2IHdlIHdpbGwgbmVlZCBzdWNoIGEgc3lzdGVtLCB3aXRoIGFuIGFkZGVkIElSUQ0KPiBy
ZW1hcHBpbmcgZmVhdHVyZS4NCg0KSSBkbyBub3QgdW5kZXJzdGFuZCB4ODYgTVNJIGludGVycnVw
dCBnZW5lcmF0aW9uLCBidXQgSWYgYWJvdmUgdW5kZXJzdGFuZCBpcyBjb3JyZWN0LCB0aGVuIHdo
eSB3ZSBuZWVkIElSUSByZW1hcHBpbmcgZm9yIHg4Nj8NCldpbGwgdGhlIHg4NiBtYWNoaW5lIGVt
dWxhdGVkIGluIFFFTVUgcHJvdmlkZXMgYSBiaWcgYWRkcmVzcyByYW5nZSBmb3IgTVNJcyBhbmQg
d2hlbiBhY3R1YWxseSBnZW5lcmF0aW5nIE1TSSBpdCBuZWVkZWQgc29tZSBleHRyYSBwcm9jZXNz
aW5nIChJUlEtcmVtYXBwaW5nIHByb2Nlc3NpbmcpIGJlZm9yZSBhY3R1YWxseSBnZW5lcmF0aW5n
IHdyaXRlIHRyYW5zYWN0aW9uIGZvciBNU0kgaW50ZXJydXB0ID8gDQoNClRoYW5rcw0KLUJoYXJh
dA0KDQo+IA0KPiBUaGFua3MsDQo+IEplYW4NCg==
