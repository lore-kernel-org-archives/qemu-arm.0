Received: by 10.25.44.15 with SMTP id s15csp3223592lfs;
        Fri, 7 Jul 2017 04:37:11 -0700 (PDT)
X-Received: by 10.55.40.89 with SMTP id o86mr65864863qkh.116.1499427430981;
        Fri, 07 Jul 2017 04:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499427430; cv=none;
        d=google.com; s=arc-20160816;
        b=edpo/Lkpx/UD3wPIWjMQdd/WBDhFhoLgZ8d9hyICDSHhyBT8mchU70OSWTJY5HTdUV
         jdVD8x74XJ0BrmrKmJ3SVmm8uCnte3vmJpjXHkT3pIPosJXmboxOc71hH/EXBYFqNiUr
         S6QqEd0R2uAyeBCBbDVyLCFAjd7R4MXH7cQZnCmuCwafNIMpCeChDNdp3Zi5ExmuDf6L
         LuCthgKMOcsfRvy7KuchkBpWeO37hjBHLy+tK50QefE40asEe+7LHsLattAdth6mkldQ
         0jD4K9wPqO7iQZfE/bhaej6rJrXJrb8RTbxjXN/ySiNbAgc7UUIi0QWQBf2PFcKQqXPe
         +fSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=G7zIopZA+9SU6rbPGRHmBMYyUUtSwtR7aycjTuoT088=;
        b=ebIfElQKEYnB7DAKE7DNZ3Fapjh+e3cBZKK534SvScHDG9KxC267ljcVb0cDU/amYl
         2H4p5ADdbr9s/u8f7j2Vc79M/O8RQ6yC/+gO3uAUQyHSZhj5U/R5OIW8c2GnmEaDQtBc
         PRbjcaUbCRpkx0ogy5+NrEABKcfJNwYzSd+mx6A9hC32ddIkTTpDDtkvsPpOiomgJOYJ
         IjI9nPrlu3to5AxL1n4dNT6jFHOT3U6txgFsGTTrwM+L41I3eBRUGF8ku1gRkNTXHfOX
         23TGSpVaoV7wjPY7gO1a+jYSLPRg6R3cBPvGVNdXjuEM2Ss2TYOPXH4SNxnQmwGl9TIi
         JVYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=P3qYiRDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k28si2938462qtf.110.2017.07.07.04.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 04:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=P3qYiRDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:55719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTRZM-0003Qb-39
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 07:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dTRZH-0003QO-0r
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 07:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dTRZD-0001x5-OA
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 07:37:03 -0400
Received: from mail-eopbgr10075.outbound.protection.outlook.com
	([40.107.1.75]:19908
	helo=EUR02-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dTRZC-0001tx-S2; Fri, 07 Jul 2017 07:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=G7zIopZA+9SU6rbPGRHmBMYyUUtSwtR7aycjTuoT088=;
	b=P3qYiRDBXk5ElmJ/XIaHc65mFzx5Z4eJb+joCjYBa6aki5Vcpec9Ou5NWPvCcYyRQ9tgDhs5KUi5Oo+/xFR+bIh6CiIFtl4M5TPCyJMwLHPl+46M9RNONInl+3/1t+MwG3BJGly8yWg58mS0/f25qPrRu+9RuZfXqeL2JfGoWEo=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Fri, 7 Jul 2017 11:36:54 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2%17]) with mapi id 15.01.1240.013;
	Fri, 7 Jul 2017 11:36:54 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, Jean-Philippe Brucker
	<jean-philippe.brucker@arm.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuAgAAYhwCAAABHwIABqBOAgAAO8rCAAK1NgIAAlZ9ggAAUmACAAEJWMA==
Date: Fri, 7 Jul 2017 11:36:54 +0000
Message-ID: <AM5PR0401MB2545A78764598CD87827B14F9AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
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
	<AM5PR0401MB2545C23F66D6D0E096DCB0369AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<a67cb139-e1b6-02fc-d451-4001bcbfceb3@redhat.com>
In-Reply-To: <a67cb139-e1b6-02fc-d451-4001bcbfceb3@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	7:L0smhsM3mBOTl26wa4KH0GX04W2hJaEHHOD+Oy0e7rLCIsbRcOBiB9ZkBcAFS7jSoFB11BK1Mbbru5Jw5pqnBJmsWVIU5Hwi6vP+/cce0LGY1H6HbHl6dMvFZcAvYyNxEqQIp055hrpAaxR+57g8Hq07Qr83bRCbxOtDoIvL4gEM5dZ9gOpsBtAGcHOaiqQzEZBHFtxzgbY9vAZhqZ1EIyFhC3bN0mBrtx57pS36+tHzWjg4Eyij6OS91Bkh+Hnu2EfXzoGaVunBvbR6Sq4GHF+djiiJZ2e6VL4bfXujsUwEumU8/fEla1kadn73uL+I79BZPUNFqGrjfctmrpDfnZiu+o/3GUizBDm6jvJHH3oppqEsh2AqXl9m6oEE23y8IbsdHjEa0Xaw4NNjTSwpW7JqAZlb6kGbuMcZ1qglkoxQ6tR0zk5XQSx2thFcmCvK+tjFbRBIT6z00Coj9Z4g8iDDKDpqBdDE6kNP62yzqFt81hEwullzRWfJfnA8GEUW2sm5zKPpJYAEtwZ9tWlCIqO2IoDUzzEL2YP2lhx9irid7FHa3YV8QOeDp6/88Cm4jrPQA9qeGhkx7BAqCPATJFvD2b1mSOBIdxc1fi2d7OBF4FssDZxBBGwvT6xNHv7/zXnZ5+k1FcRDab19mscmwk7l5JXGYT2I6Vm7EbYIFmvNOMSufE34no1jqNYPXYjsviu0Lp3zuRrisI2CfprepQbgbRsJsVmLSBXWDgerGFyK9vmcYREdd4xQUC01XNQ+xUGBVyr+NEA3AKXVblYkBgAQYmwAMOIenvbF0byz5S4=
x-ms-office365-filtering-correlation-id: 562932ea-b806-458c-7ed1-08d4c52c77d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2545; 
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-microsoft-antispam-prvs: <AM5PR0401MB2545EF9566421E11C57BF0909AAA0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(788757137089)(48057245064654)(148574349560750)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(2017060910062)(5005006)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(3002001)(6055026)(6041248)(20161123564025)(20161123562025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39850400002)(39840400002)(39860400002)(39400400002)(39410400002)(377454003)(13464003)(24454002)(2501003)(9686003)(3280700002)(99286003)(4326008)(2900100001)(7416002)(54906002)(93886004)(14454004)(229853002)(2950100002)(53546010)(6506006)(6436002)(53936002)(478600001)(6246003)(55016002)(5660300001)(66066001)(86362001)(7696004)(189998001)(81166006)(76176999)(39060400002)(8676002)(2201001)(33656002)(50986999)(7736002)(102836003)(38730400002)(54356999)(3660700001)(8936002)(6116002)(5250100002)(305945005)(2906002)(561944003)(74316002)(25786009)(3846002)(551934003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2017 11:36:54.4374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.1.75
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
X-TUID: jWp5rATIG2mt

SGkgRXJpYywNCg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJv
bTogSmVhbi1QaGlsaXBwZSBCcnVja2VyIFttYWlsdG86amVhbi1waGlsaXBwZS5icnVja2VyQGFy
bS5jb21dDQo+ID4+Pj4gU2VudDogVGh1cnNkYXksIEp1bHkgMDYsIDIwMTcgMzozMyBQTQ0KPiA+
Pj4+IFRvOiBCaGFyYXQgQmh1c2hhbiA8YmhhcmF0LmJodXNoYW5AbnhwLmNvbT47IEF1Z2VyIEVy
aWMNCj4gPj4+PiA8ZXJpYy5hdWdlckByZWRoYXQuY29tPjsgZXJpYy5hdWdlci5wcm9AZ21haWwu
Y29tOw0KPiA+Pj4+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgYWxleC53aWxsaWFtc29uQHJl
ZGhhdC5jb207DQo+ID4+IG1zdEByZWRoYXQuY29tOw0KPiA+Pj4+IHFlbXUtYXJtQG5vbmdudS5v
cmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiA+Pj4+IENjOiB3ZWlAcmVkaGF0LmNvbTsga2V2
aW4udGlhbkBpbnRlbC5jb207IG1hcmMuenluZ2llckBhcm0uY29tOw0KPiA+Pj4+IHRuQHNlbWlo
YWxmLmNvbTsgd2lsbC5kZWFjb25AYXJtLmNvbTsgZHJqb25lc0ByZWRoYXQuY29tOw0KPiA+Pj4+
IHJvYmluLm11cnBoeUBhcm0uY29tOyBjaHJpc3RvZmZlci5kYWxsQGxpbmFyby5vcmcNCj4gPj4+
PiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtSRkMgdjIgMC84XSBWSVJUSU8tSU9NTVUgZGV2
aWNlDQo+ID4+Pj4NCj4gPj4+PiBPbiAwNS8wNy8xNyAwOTo0OSwgQmhhcmF0IEJodXNoYW4gd3Jv
dGU6Pj4+IEFsc28gd2hlbiBzZXR1cA0KPiA+Pj4+IG1zaS1yb3V0ZQ0KPiA+Pj4+IGt2bV9pcnFj
aGlwX2FkZF9tc2lfcm91dGUoKSB3ZSBuZWVkZWQgdG8NCj4gPj4+Pj4+IHByb3ZpZGUgdGhlIHRy
YW5zbGF0ZWQgYWRkcmVzcy4NCj4gPj4+Pj4+PiBBY2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGlu
ZyB0aGlzIGlzIHJlcXVpcmVkIGJlY2F1c2Uga2VybmVsDQo+ID4+Pj4+Pj4gZG9lcyBubyBnbw0K
PiA+Pj4+Pj4gdGhyb3VnaCB2aW9tbXUgdHJhbnNsYXRpb24gd2hlbiBnZW5lcmF0aW5nIGludGVy
cnVwdCwgbm8/DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4geWVzIHRoaXMgaXMgbmVlZGVkIHdoZW4gS1ZN
IE1TSSByb3V0ZXMgYXJlIHNldCB1cCwgaWUuIGFsb25nIHdpdGgNCj4gPj4+Pj4+IEdJQ1YzDQo+
ID4+Pj4gSVRTLg0KPiA+Pj4+Pj4gV2l0aCBHSUN2Mk0sIHFlbXUgZGlyZWN0IGdzaSBtYXBwaW5n
IGlzIHVzZWQgYW5kIHRoaXMgaXMgbm90DQo+IG5lZWRlZC4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBT
byBJIGRvIG5vdCB1bmRlcnN0YW5kIHlvdXIgcHJldmlvdXMgc2VudGVuY2Ugc2F5aW5nICJNU0kN
Cj4gPj4+Pj4+IGludGVycnVwdHMgd29ya3Mgd2l0aG91dCBhbnkgY2hhbmdlIi4NCj4gPj4+Pj4N
Cj4gPj4+Pj4gSSBoYXZlIGFsbW9zdCBjb21wbGV0ZWQgdmZpbyBpbnRlZ3JhdGlvbiB3aXRoIHZp
cnRpby1pb21tdSBhbmQgbm93DQo+ID4+Pj4+IHRlc3RpbmcgdGhlIGNoYW5nZXMgYnkgYXNzaWdu
aW5nIGUxMDAwIGRldmljZSB0byBWTS4gRm9yIHRoaXMgSQ0KPiA+Pj4+PiBoYXZlIGNoYW5nZWQg
dmlydGlvLWlvbW11IGRyaXZlciB0byB1c2UgSU9NTVVfUkVTVl9NU0kgcmF0aGVyDQo+IHRoYW4N
Cj4gPj4+Pj4gc3ctDQo+ID4+IG1zaQ0KPiA+Pj4+PiBhbmQgdGhpcyBkb2VzIG5vdCBuZWVkIGNo
YW5nZWQgaW4gdmZpb19nZXRfYWRkcigpICBhbmQNCj4gPj4+Pj4ga3ZtX2lycWNoaXBfYWRkX21z
aV9yb3V0ZSgpDQo+ID4+Pj4NCj4gPj4+PiBJIHVuZGVyc3RhbmQgeW91J3JlIHJlc2VydmluZyBy
ZWdpb24gMHgwODAwMDAwMC0weDA4MTAwMDAwIGFzDQo+ID4+Pj4gSU9NTVVfUkVTVl9NU0kgaW5z
dGVhZCBvZiBJT01NVV9SRVNWX1NXX01TST8gSSB0aGluayB0aGlzDQo+IG9ubHkNCj4gPj4gd29y
a3MNCj4gPj4+PiBiZWNhdXNlIFFlbXUgcGxhY2VzIHRoZSB2Z2ljIGluIHRoYXQgYXJlYSBhcyB3
ZWxsIChpbiBody9hcm0vdmlydC5jKS4NCj4gPj4+PiBJdCdzIG5vdCBhIGNvaW5jaWRlbmNlIGlm
IHRoZSBhZGRyZXNzZXMgYXJlIHRoZSBzYW1lLCBiZWNhdXNlIEVyaWMNCj4gPj4+PiBjaG9zZSB0
aGVtIGZvciB0aGUgTGludXggU01NVSBkcml2ZXJzIGFuZCBJIGNvcGllZCB0aGVtLg0KPiA+Pj4+
DQo+ID4+Pj4gV2UgY2FuJ3QgcmVseSBvbiB0aGF0IGJlaGF2aW9yLCB0aG91Z2gsIGl0IHdpbGwg
YnJlYWsgTVNJcyBpbg0KPiA+Pj4+IGVtdWxhdGVkIGRldmljZXMuIEFuZCBpZiBRZW11IGhhcHBl
bnMgdG8gbW92ZSB0aGUgTVNJIGRvb3JiZWxsIGluDQo+ID4+Pj4gZnV0dXJlIG1hY2hpbmUgcmV2
aXNpb25zLCB0aGVuIGl0IHdvdWxkIGFsc28gYnJlYWsgVkZJTy4NCj4gPj4+DQo+ID4+PiBZZXMs
IG1ha2Ugc2Vuc2UgdG8gbWUNCj4gPj4+DQo+ID4+Pj4NCj4gPj4+PiBKdXN0IGZvciBteSBvd24g
dW5kZXJzdGFuZGluZyAtLSB3aGF0IGhhcHBlbnMsIEkgdGhpbmssIGlzIHRoYXQgaW4NCj4gPj4+
PiBMaW51eCBpb3ZhX3Jlc2VydmVfaW9tbXVfcmVnaW9ucyBpbml0aWFsbHkgcmVzZXJ2ZXMgdGhl
DQo+ID4+Pj4gZ3Vlc3QtcGh5c2ljYWwgZG9vcmJlbGwgMHgwODAwMDAwMC0weDA4MTAwMDAwLiBU
aGVuIG11Y2ggbGF0ZXIsDQo+ID4+Pj4gd2hlbiB0aGUgZGV2aWNlIGRyaXZlciByZXF1ZXN0cyBh
biBNU0ksIHRoZSBpcnFjaGlwIGRyaXZlciBjYWxscw0KPiA+Pj4+IGlvbW11X2RtYV9tYXBfbXNp
X21zZyB3aXRoIHRoZSBndWVzdC0gcGh5c2ljYWwgZ2ljdjJtIGFkZHJlc3MNCj4gPj4+PiAweDA4
MDIwMDAwLiBUaGUgZnVuY3Rpb24gZmluZHMgdGhlIHJpZ2h0IHBhZ2UgaW4gbXNpX3BhZ2VfbGlz
dCwNCj4gPj4+PiB3aGljaCB3YXMgYWRkZWQgYnkgY29va2llX2luaXRfaHdfbXNpX3JlZ2lvbiwg
dGhlcmVmb3JlIGJ5cGFzc2luZw0KPiA+Pj4+IHRoZQ0KPiA+PiB2aW9tbXUgYW5kIHRoZSBHUEEg
Z2V0cyB3cml0dGVuIGluIHRoZSBNU0ktWCB0YWJsZS4NCj4gPj4+DQo+ID4+PiBUaGlzIG1lYW5z
IGluIGNhc2UgdG9tb3Jyb3cgd2hlbiBxZW11IGNoYW5nZXMgdmlydCBtYWNoaW5lIGFkZHJlc3MN
Cj4gPj4gbWFwIGFuZCB2Z2ljLWl0cyAoaXRzLXRyYW5zbGF0b3IgcmVnaXN0ZXIgYWRkcmVzcykg
YWRkcmVzcyByYW5nZSBkb2VzDQo+ID4+IG5vdCBmYWxsIGluIHRoZSBtc2lfcGFnZV9saXN0IHRo
ZW4gaXQgd2lsbCBhbGxvY2F0ZSBhIG5ldyBpb3ZhLA0KPiA+PiBjcmVhdGUgbWFwcGluZyBpbiBp
b21tdS4gU28gdGhpcyB3aWxsIG5vIGxvbmdlciBiZSBpZGVudGl0eSBtYXBwZWQNCj4gPj4gYW5k
IGZhaWwgdG8gd29yayB3aXRoIG5ldyBxZW11Pw0KPiA+Pj4NCj4gPj4gWWVzIHRoYXQncyBjb3Jy
ZWN0Lg0KPiA+Pj4+DQo+ID4+Pj4gSWYgYW4gZW11bGF0ZWQgZGV2aWNlIHN1Y2ggYXMgdmlydGlv
LW5ldC1wY2kgd2VyZSB0byBnZW5lcmF0ZSBhbg0KPiA+Pj4+IE1TSSwgdGhlbiBRZW11IHdvdWxk
IGF0dGVtcHQgdG8gYWNjZXNzIHRoZSBkb29yYmVsbCB3cml0dGVuIGJ5DQo+ID4+Pj4gTGludXgg
aW50byB0aGUgTVNJLVggdGFibGUsIDB4MDgwMjAwMDAsIGFuZCBmYXVsdCBiZWNhdXNlIHRoYXQN
Cj4gPj4+PiBhZGRyZXNzIHdhc24ndCBtYXBwZWQgaW4gdGhlIHZpb21tdS4NCj4gPj4+Pg0KPiA+
Pj4+IFNvIGZvciBWRklPLCB5b3UgZWl0aGVyIG5lZWQgdG8gdHJhbnNsYXRlIHRoZSBNU0ktWCBl
bnRyeSB1c2luZyB0aGUNCj4gPj4+PiB2aW9tbXUsIG9yIGp1c3QgYXNzdW1lIHRoYXQgdGhlIHZh
ZGRyIGNvcnJlc3BvbmRzIHRvIHRoZSBvbmx5IE1TSQ0KPiA+Pj4+IGRvb3JiZWxsIGFjY2Vzc2li
bGUgYnkgdGhpcyBkZXZpY2UgKGJlY2F1c2UgaG93IGNhbiB3ZSBiZSBjZXJ0YWluDQo+ID4+Pj4g
dGhhdCB0aGUgZ3Vlc3QgYWxyZWFkeSBtYXBwZWQgdGhlIGRvb3JiZWxsIGJlZm9yZSB3cml0aW5n
IHRoZQ0KPiA+Pj4+IGVudHJ5PykNCj4gPj4+Pg0KPiA+Pj4+IEZvciBBUk0gbWFjaGluZXMgaXQn
cyBwcm9iYWJseSBiZXN0IHRvIHN0aWNrIHdpdGgNCj4gPj4gSU9NTVVfUkVTVl9TV19NU0kuDQo+
ID4+Pj4gSG93ZXZlciwgYSBuaWNlIHdheSB0byB1c2UgSU9NTVVfUkVTVl9NU0kgd291bGQgYmUg
Zm9yIHRoZSB2aXJ0aW8tDQo+ID4+Pj4gaW9tbXUgZGV2aWNlIHRvIGFkdmVydGlzZSBpZGVudGl0
eS1tYXBwZWQvcmVzZXJ2ZWQgcmVnaW9ucywgYW5kDQo+ID4+Pj4gYnlwYXNzIHRyYW5zbGF0aW9u
IG9uIHRoZXNlIHJlZ2lvbnMuIFRoZW4gdGhlIGRyaXZlciBjb3VsZCByZXNlcnZlDQo+ID4+Pj4g
dGhvc2Ugd2l0aCBJT01NVV9SRVNWX01TSS4NCj4gPj4+DQo+ID4+PiBDb3JyZWN0IG1lIGlmIEkg
ZGlkIG5vdCB1bmRlcnN0b29kIHlvdSBjb3JyZWN0bHksIHRvZGF5IGlvbW11LWRyaXZlcg0KPiA+
PiBkZWNpZGVzIG1zaS1yZXNlcnZlZCByZWdpb24sIHdoYXQgaWYgd2UgY2hhbmdlIHRoaXMgYW5k
IHZpcnRpby1pb21tdQ0KPiA+PiBkZXZpY2Ugd2lsbCBwcm92aWRlIHRoZSByZXNlcnZlZCBtc2kg
cmVnaW9uIGFzIHBlciB0aGUgZW11bGF0ZWQgbWFjaGluZQ0KPiAodmlydC9pbnRlbCkuDQo+ID4+
IFNvIHZpcnRpby1pb21tdSBkcml2ZXIgd2lsbCB1c2UgdGhlIGFkZHJlc3MgYWR2ZXJ0aXNlZCBi
eQ0KPiA+PiB2aXJ0aW8taW9tbXUgZGV2aWNlIGFzIElPTU1VX1JFU1ZfTVNJLiBJbiB0aGlzIGNh
c2UgbXNpLXBhZ2UtbGlzdA0KPiA+PiB3aWxsIGFsd2F5cyBoYXZlIHRoZSByZXNlcnZlZCByZWdp
b24gZm9yIE1TSS4NCj4gPj4+IE9uIHFlbXUgc2lkZSwgZm9yIGVtdWxhdGVkIGRldmljZXMgd2Ug
d2lsbCBsZXQgdmlydGlvLWlvbW11IHJldHVybg0KPiA+Pj4gc2FtZQ0KPiA+PiBhZGRyZXNzIGFz
IHRyYW5zbGF0ZWQgYWRkcmVzcyBhcyBpdCBmYWxscyBpbiBNU0ktcmVzZXJ2ZWQgcGFnZQ0KPiA+
PiBhbHJlYWR5IGtub3duIHRvIGl0Lg0KPiA+Pg0KPiA+PiBJIHRoaW5rIHdoYXQgeW91J3JlIHBy
b3Bvc2luZyBoZXJlIGNvcnJlc3BvbmRzIHRvIHRoZSAxc3QgYXBwcm9hY2gNCj4gPj4gdGhhdCB3
YXMgZm9sbG93ZWQgZm9yIFBDSWUgcGFzc3Rocm91Z2gvTVNJIG9uIEFSTSwgaWUuIHRoZSB1c2Vy
c3BhY2UNCj4gPj4gd2FzIHByb3ZpZGluZyB0aGUgcmVzZXJ2ZWQgcmVnaW9uIGJhc2UgYWRkcmVz
cyAmIHNpemUuDQo+ID4+ICBUaGlzIHdhcyBydWxlZCBvdXQgYW5kIG5vdyB0aGlzDQo+ID4+IHJl
Z2lvbiBpcyBhcmJpdHJhcmlseSBzZXQgYnkgdGhlIHNtbXUtZHJpdmVyLiBBdCB0aGUgbW9tZW50
IHRoaXMNCj4gPj4gbWVhbnMgdGhpcyByZWdpb24gY2Fubm90IGNvbnRhaW4gZ3Vlc3QgUkFNLg0K
PiA+DQo+ID4gSW4gcmVqZWN0ZWQgcHJvcG9zYWwsIHVzZXItc3BhY2UgdXNlZCB0byBjaG9vc2Ug
YSByZXNlcnZlIHJlZ2lvbiBhbmQNCj4gcHJvdmlkZSB0aGF0IHRvIEhvc3QgTGludXguIEhvc3Qg
TGludXggdXNlcyB0aGF0IE1TSSBtYXBwaW5nLiBKdXN0IGZvciBteQ0KPiB1bmRlcnN0YW5kaW5n
IGlmIHRvbW9ycm93IFFFTVUgY2hhbmdlcyBpdHMgYWRkcmVzcyBzcGFjZSB0aGVuIGl0IG1heSBu
b3QNCj4gd29yayB3aXRob3V0IGNoYW5naW5nIFNNTVUgbXNpLXJlc2VydmVkLWlvdmEgaW4gaG9z
dCBkcml2ZXIsIHJpZ2h0PyBGb3INCj4gZXhhbXBsZSBpZiBlbXVsYXRlZCBtYWNoaW5lIGhhdmUg
UkFNIGF0IHRoaXMgYWRkcmVzcyB0aGVuIGl0IHdpbGwgbm90IHdvcms/DQo+IFllcyB0aGF0J3Mg
Y29ycmVjdC4gTm90ZSBNU0kgcmVzZXJ2ZWQgcmVnaW9ucyBhcmUgbm93IGV4cG9zZWQgdG8gdXNl
cnNwYWNlDQo+IHRocm91Z2ggL3N5cy9rZXJuZWwvaW9tbXVfZ3JvdXBzLzw+L3Jlc2VydmVkX3Jl
Z2lvbnMNCj4gPg0KPiA+IEluIHRoaXMgcHJvcG9zYWwsIFFFTVUgcmVzZXJ2ZXMgYSBpb3ZhLXJh
bmdlIGZvciBndWVzdCAobm90IGhvc3QpIGFuZCBndWVzdA0KPiBrZXJuZWwgd2lsbCB1c2UgdGhp
cyBhcyBtc2ktaW92YSB1bnRyYW5zbGF0ZWQgKElPTU1VX1JFU1ZfTVNJKS4gV2hpbGUgdGhpcw0K
PiBkb2VzIG5vdCBjaGFuZ2UgaG9zdCBpbnRlcmZhY2UgYW5kIGl0IHdpbGwgY29udGludWUgdG8g
dXNlIGhvc3QgcmVzZXJ2ZWQNCj4gbWFwcGluZyBmb3IgYWN0dWFsIGludGVycnVwdCBnZW5lcmF0
aW9uLCBubz8NCj4gQnV0IHRoZW4gdXNlcnNwYWNlIG5lZWRzIHRvIHByb3ZpZGUgSU9NTVVfUkVT
Vl9NU0kgcmFuZ2UgdG8gZ3Vlc3QNCj4ga2VybmVsLCByaWdodD8gV2hhdCB3b3VsZCBiZSB0aGUg
cHJvcG9zZWQgbWFubmVyPw0KDQpKdXN0IGFuIG9waW5pb24sIHdlIGNhbiBkZWZpbmUgZmVhdHVy
ZSAoVklSVElPX0lPTU1VX0ZfUkVTX01TSV9SQU5HRSkgYW5kIHByb3ZpZGUgdGhpcyBpbmZvIHZp
YSBhIGNvbW1hbmQgKFZJUlRJT19JT01NVV9UX01TSV9SQU5HRSkuIEd1ZXN0IGlvbW11LWRyaXZl
ciB3aWxsIG1ha2UgdGhpcyBjYWxsIGR1cmluZyBpbml0aWFsaXphdGlvbiBhbmQgc3RvcmUgdGhl
IHZhbHVlLiBUaGlzIHZhbHVlIHdpbGwganVzdCByZXBsYWNlIE1TSV9JT1ZBX0JBU0UgYW5kIE1T
SV9JT1ZBX0xFTkdIVCBoYXNoIGRlZmluZS4gUmVzdCB3aWxsIHJlbWFpbiBzYW1lIGluIHZpcnRp
by1pb21tdSBkcml2ZXIuDQoNCj4gTG9va3Mgd2VpcmQgdG8gbWUgdG8NCj4gaGF2ZSBkaWZmZXJl
bnQgTVNJIGhhbmRsaW5nIG9uIGhvc3QgYW5kIGd1ZXN0LiBBbHNvIEkgc3RpbGwgZG9uJ3QgZ2V0
IGhvdyB5b3UNCj4gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIHZpcnRpby1uZXQtcGNpIGVtaXRzIGFj
Y2Vzc2VzIHRvIHRoZSBNU0kgZG9vcmJlbGwNCj4gd2hpbGUgdGhpcyBsYXR0ZXIgaXMgbm90IG1h
cHBlZC4NCg0KSSB0aGluayBJIHdpbGwgbG9vayB0aGUgY29kZSBpbiBkZXRhaWwgZm9yIHZpcnRp
by1uZXQtcGNpIGNvZGUsIEkgd2FzIHRoaW5raW5nIG9mIGlmIHdlIGNhbiBoYW5kbGUgdGhpcyBy
ZWdpb24gZGlmZmVyZW50bHkgb3IgbWFrZSAxOjEgdHJhbnNsYXRpb24gb24gdmlydGlvX2lvbW11
X3RyYW5zbGF0ZSgpIGZvciB0aGlzIHJlZ2lvbi4gQnV0IG15IGtub3dsZWRnZSBpcyBsaW1pdGVk
IGFyb3VuZCB0aGlzIHBpZWNlIG9mIGNvZGUuIElzIHRoaXMgcG9zc2libGUgb3IgdWdseSA/DQoN
ClRoYW5rcw0KLUJoYXJhdA0KDQo+IA0KPiBUaGFua3MNCj4gDQo+IEVyaWMNCj4gPg0KPiA+IFRo
YW5rcw0KPiA+IC1CaGFyYXQNCj4gPg0KPiA+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+Pj4gRm9yIHg4
NiB3ZSB3aWxsIG5lZWQgc3VjaCBhIHN5c3RlbSwgd2l0aCBhbiBhZGRlZCBJUlEgcmVtYXBwaW5n
DQo+ID4+Pj4gZmVhdHVyZS4NCj4gPj4+DQo+ID4+PiBJIGRvIG5vdCB1bmRlcnN0YW5kIHg4NiBN
U0kgaW50ZXJydXB0IGdlbmVyYXRpb24sIGJ1dCBJZiBhYm92ZQ0KPiA+Pj4gdW5kZXJzdGFuZA0K
PiA+PiBpcyBjb3JyZWN0LCB0aGVuIHdoeSB3ZSBuZWVkIElSUSByZW1hcHBpbmcgZm9yIHg4Nj8N
Cj4gPj4gVG8gbWUgeDg2IElSIGNvcnJlc3BvbmRzIHNpbXBseSBjb3JyZXNwb25kcyB0byB0aGUg
SVRTIE1TSSBjb250cm9sbGVyDQo+ID4+IG1vZGFsaXR5IG9uIEFSTS4gU28gYXMgeW91IHN0aWxs
IG5lZWQgdklUUyBhbG9uZyB3aXRoIHZpcnRpby1pb21tdSBvbg0KPiA+PiBBUk0sIHlvdSBuZWVk
IHZJUlEgYWxvbmdzIHdpdGggdmlydGlvLWlvbW11IG9uIEludGVsLiBEb2VzIHRoYXQgbWFrZQ0K
PiBzZW5zZT8NCj4gPj4NCj4gPj4gU28gaW4gYW55IGNhc2Ugd2UgbmVlZCB0byBtYWtlIHN1cmUg
dGhlIGd1ZXN0IHVzZXMgYSB2SVRTIG9yIHZJUiB0bw0KPiA+PiBtYWtlIHN1cmUgTVNJcyBhcmUg
Y29ycmVjdGx5IGlzb2xhdGVkLg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gV2lsbCB0aGUgeDg2IG1hY2hp
bmUgZW11bGF0ZWQgaW4gUUVNVSBwcm92aWRlcyBhIGJpZyBhZGRyZXNzIHJhbmdlDQo+ID4+PiBm
b3INCj4gPj4gTVNJcyBhbmQgd2hlbiBhY3R1YWxseSBnZW5lcmF0aW5nIE1TSSBpdCBuZWVkZWQg
c29tZSBleHRyYSBwcm9jZXNzaW5nDQo+ID4+IChJUlEtcmVtYXBwaW5nIHByb2Nlc3NpbmcpIGJl
Zm9yZSBhY3R1YWxseSBnZW5lcmF0aW5nIHdyaXRlDQo+ID4+IHRyYW5zYWN0aW9uIGZvciBNU0kg
aW50ZXJydXB0ID8NCj4gPj4gTXkgdW5kZXJzdGFuZGluZyBpcyBvbiB4ODYsIHRoZSBNU0kgd2lu
ZG93IGlzIGZpeGVkIGFuZCBtYXRjaGVzDQo+ID4+IFtGRUUwXzAwMDBoIOKAkyBGRUYwXzAwMGhd
LiBNU0lzIGFyZSBjb252ZXllZCBvbiBhIHNlcGFyYXRlIGFkZHJlc3MNCj4gPj4gc3BhY2UgdGhh
biB1c3VhbCBETUEgYWNjZXNzZXMuIEFuZCB5ZXMgdGhleSBlbmQgdXAgaW4gSVIgaWYgc3VwcG9y
dGVkIGluDQo+IHRoZSBIVy4NCj4gPj4NCj4gPj4gVGhhbmtzDQo+ID4+DQo+ID4+IEVyaWMNCj4g
Pj4+DQo+ID4+PiBUaGFua3MNCj4gPj4+IC1CaGFyYXQNCj4gPj4+DQo+ID4+Pj4NCj4gPj4+PiBU
aGFua3MsDQo+ID4+Pj4gSmVhbg0K
