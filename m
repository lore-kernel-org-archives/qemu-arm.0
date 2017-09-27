Received: by 10.223.172.38 with SMTP id v35csp4564473wrc;
        Wed, 27 Sep 2017 04:01:15 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDlnQQgfpd5/z7O4jWnu/uQ+7MCkZMEVRgN77XOHNXYl26DJU5va7jH6t1aSvSNfkvetzq9
X-Received: by 10.237.60.50 with SMTP id t47mr1241753qte.49.1506510075420;
        Wed, 27 Sep 2017 04:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506510075; cv=none;
        d=google.com; s=arc-20160816;
        b=V3ZR18gUhIiK8NYZuyFp5g/IeoGhbf76R/Kos+i0C7CN0ONnk5e+wn0ntLuzsekk1O
         jeVShdOXT2BZCQtJlbIQSZXPsYTZSMm8rH2K5/6g1bTqoH7AsvtntZqCSlczVqTHM7Bg
         HXFugov154tsGKT2xq6UtWHscb1qXU7mf6DAFQpSLYVJYyzvVJsds1pWOvwY9Au8YrQr
         vadmi0/Y01cF90f8/FRqVg9AlsbwlnZ7wzLANYaoWcauBzpUU4+VWlS/z5wGRV74mLGB
         GxVbKsuQzbDmfukqY6PDqaPoxEeObJ7ujuR31asqXetH46In+fTgG3mrTqjeaqDDBmox
         POjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=jC8jsn3aSnkjxMyyUFZk5GDpG0IEd1b+n5EMsN93wh0=;
        b=eln7kk7/6X8Nxac0xtwVWGACHcfFviN4UpQcSTBx9mTCXgVvYaQCdS5cvbmYFsKekj
         oXSG1Lmmp01aCyoDBQ4VKSNyKVjUV848BDuSoqAPVPurroMdn8W8MOCXKuPTLYJ/ETCh
         kACd9q1YfgtTCumulmAdneEML7ub9E3d6k56ZUy0hMp4YYoeFRBzuIQY/iGKlAc97p7G
         Fnq//3t2USxk3xtdmmV9P0RRbONwqpoU4DIusCbuos71syPSmBroleC8TQQNac5tu3k9
         aX0psliKdKDA4ZO+P4NRDOFXkrKCXJlnTkkmP8NoofYp1zTaQ58P5uE6O6319vOoowPT
         9Lhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=oIKjx+tJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si4743283qkf.148.2017.09.27.04.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 04:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=oIKjx+tJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:54005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxA5Z-0004EG-6J
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 07:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dxA5M-0004Bx-GG
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 07:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dxA5I-0004M7-Hh
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 07:01:00 -0400
Received: from mail-ve1eur01on0046.outbound.protection.outlook.com
	([104.47.1.46]:37472
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dxA5I-0004K5-2O; Wed, 27 Sep 2017 07:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=jC8jsn3aSnkjxMyyUFZk5GDpG0IEd1b+n5EMsN93wh0=;
	b=oIKjx+tJjNRMouvAypDdEOv5ApIR9d6QnfHIqsIBUCO2mld13rmIXjEE0GEyJpyiCcV0m2P7pm5ahIW6bG90l8o/uQL6yABrgH7EKU92q3aeTT0TpnonhhAu6KbKBADe3DpsBopnTAfeiDlnZP/vwjiWaMWAV8sQbJpUgoV6LUo=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2547.eurprd04.prod.outlook.com (10.169.245.10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 11:00:53 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.016;
	Wed, 27 Sep 2017 11:00:53 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Tomasz Nowicki <tnowicki@caviumnetworks.com>, Eric Auger
	<eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v4 10/16] virtio-iommu: Implement probe request
Thread-Index: AQHTMRvNOeroUJJiM0qIZ1hkf5XCpKLIm3YAgAABheA=
Date: Wed, 27 Sep 2017 11:00:52 +0000
Message-ID: <AM5PR0401MB254589AAAAC0DAC45861D05C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<1505807208-9063-11-git-send-email-eric.auger@redhat.com>
	<4cecfa75-c97a-586b-aadf-9b0bfd168960@caviumnetworks.com>
In-Reply-To: <4cecfa75-c97a-586b-aadf-9b0bfd168960@caviumnetworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2547;
	6:ZBskTmZjP9tIvKJIQaLbsQKaWOUwXGY/PiPZ5tVo3npy7U7+XYIoZe0kPLwGtQHI3Jo28OAQv3eYVzg72Hx4a3hjTWbIqMwY6arycM9yUtn0xWljHTwIhc5bla0pYzLSjObZlPHrbaFn95K1rNrZaJDhdHRrGYUD112KeDCZLaI4XuSMYSQGIEv4jRx7zdEtPyu2ZDCc570n4Za5YW9sR9wI28KIryRfbNgNe07CHaOpdkus/aiZ+7m+V6KAh1TJZF8ZhWMSS6AB/Wo+cQh0lPqN8SoU1ApbbFjO4/k2w7NPZmLmCCfIHPzp+JFwQhYLR13TVB0tMGdceYwuHZlZhg==;
	5:IsSJoMtAnKfNp8OmvtJwtZYH0JdhxFIL0dseaQg+oOF9VxnhpiamX9BMwTJMkmtwzL9TG46+t3jvv7WDwu3Zj/bOGVQIw1+SpvViAbraBJWPpNnMioQpCZmW+x54sUs0P6xb6wcI1etfOsw5naRM+A==;
	24:sI1/s7R4it8B6jZGnnTsScbz/QRp5N9bKV94ELvvrIBd0DV0PiQ0c2oPD+wCUKBidcA+FsHK0ITW1o4MwHoLhc0DoeJmafiMtbohLTp39II=;
	7:+MClfixmgkzooWSVP7z6L1GOtVBql1WXkEUkgcLJzdQsGhI0MTq+McazA3OxzTHha7Uv3LPepT81l690N8cujDYy4YAoH76tUGunaGf10mRroTGUYAdv8EvBE0oYQX0PB6Kr2fA05L40pKhZ5uDw//wlzbxGEFpc3Jt8Cock+JQNod6LkG42g6fHUf5S3q1ud0YxdSVP4FzB33Oj64zsWgISdUbZVQatixOIDCDvVEs=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 92f952f8-acb4-4297-9ad1-08d50597054e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2547; 
x-ms-traffictypediagnostic: AM5PR0401MB2547:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB2547BE77812BBAD636FD46819A780@AM5PR0401MB2547.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123564025)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2547; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2547; 
x-forefront-prvs: 04433051BF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(189002)(24454002)(13464003)(199003)(377454003)(68736007)(105586002)(106356001)(2900100001)(39060400002)(97736004)(99286003)(55016002)(9686003)(6246003)(86362001)(53546010)(5250100002)(33656002)(53936002)(101416001)(14454004)(6116002)(3846002)(25786009)(2501003)(50986999)(54356999)(76176999)(102836003)(229853002)(7696004)(66066001)(5660300001)(54906003)(7736002)(2906002)(6506006)(3660700001)(6436002)(7416002)(316002)(110136005)(81166006)(81156014)(8676002)(2950100002)(305945005)(189998001)(74316002)(2201001)(8936002)(3280700002)(4326008)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2547;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2017 11:00:52.9250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2547
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.46
Subject: Re: [Qemu-arm] [RFC v4 10/16] virtio-iommu: Implement probe request
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
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"peterx@redhat.com" <peterx@redhat.com>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 83SFHwQllYcP

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9tYXN6IE5vd2lja2kg
W21haWx0bzp0bm93aWNraUBjYXZpdW1uZXR3b3Jrcy5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwg
U2VwdGVtYmVyIDI3LCAyMDE3IDQ6MjMgUE0NCj4gVG86IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJA
cmVkaGF0LmNvbT47IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNvbTsNCj4gcGV0ZXIubWF5ZGVsbEBs
aW5hcm8ub3JnOyBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207DQo+
IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgamVhbi0NCj4gcGhp
bGlwcGUuYnJ1Y2tlckBhcm0uY29tDQo+IENjOiB3aWxsLmRlYWNvbkBhcm0uY29tOyBrZXZpbi50
aWFuQGludGVsLmNvbTsgbWFyYy56eW5naWVyQGFybS5jb207DQo+IGNocmlzdG9mZmVyLmRhbGxA
bGluYXJvLm9yZzsgZHJqb25lc0ByZWRoYXQuY29tOyB3ZWlAcmVkaGF0LmNvbTsgQmhhcmF0DQo+
IEJodXNoYW4gPGJoYXJhdC5iaHVzaGFuQG54cC5jb20+OyBwZXRlcnhAcmVkaGF0LmNvbTsNCj4g
bGludWMuZGVjb2RlQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1JGQyB2NCAxMC8xNl0gdmly
dGlvLWlvbW11OiBJbXBsZW1lbnQgcHJvYmUgcmVxdWVzdA0KPiANCj4gSGkgRXJpYywNCj4gDQo+
IE9uIDE5LjA5LjIwMTcgMDk6NDYsIEVyaWMgQXVnZXIgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBp
bXBsZW1lbnRzIHRoZSBQUk9CRSByZXF1ZXN0LiBBdCB0aGUgbW9tZW50LCBubyByZXNlcnZlZA0K
PiA+IHJlZ2lvbnMgYXJlIHJldHVybmVkLg0KPiA+DQo+ID4gQXQgdGhlIG1vbWVudCByZXNlcnZl
ZCByZWdpb25zIGFyZSBzdG9yZWQgcGVyIGRldmljZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+DQo+
IA0KPiBbLi4uXQ0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgdmlydGlvX2lvbW11X2ZpbGxf
cHJvcGVydHkoaW50IGRldmlkLCBpbnQgdHlwZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2aW9tbXVfcHJvcGVydHlfYnVmZmVyDQo+ID4gKypidWZzdGF0ZSkg
ew0KPiA+ICsgICAgaW50IHJldCA9IC1FTk9TUEM7DQo+ID4gKw0KPiA+ICsgICAgaWYgKGJ1ZnN0
YXRlLT5maWxsZWQgKyA0ID49IFZJT01NVV9QUk9CRV9TSVpFKSB7DQo+ID4gKyAgICAgICAgYnVm
c3RhdGUtPmVycm9yID0gdHJ1ZTsNCj4gPiArICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgIH0N
Cj4gPiArDQo+ID4gKyAgICBzd2l0Y2ggKHR5cGUpIHsNCj4gPiArICAgIGNhc2UgVklSVElPX0lP
TU1VX1BST0JFX1RfTk9ORToNCj4gPiArICAgICAgICByZXQgPSB2aXJ0aW9faW9tbXVfZmlsbF9u
b25lX3Byb3AoYnVmc3RhdGUpOw0KPiA+ICsgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgY2FzZSBW
SVJUSU9fSU9NTVVfUFJPQkVfVF9SRVNWX01FTToNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB2
aW9tbXVfZGV2ICpkZXYgPSBidWZzdGF0ZS0+ZGV2Ow0KPiA+ICsNCj4gPiArICAgICAgICBnX3Ry
ZWVfZm9yZWFjaChkZXYtPnJlc2VydmVkX3JlZ2lvbnMsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgdmlydGlvX2lvbW11X2ZpbGxfcmVzdl9tZW1fcHJvcCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBidWZzdGF0ZSk7DQo+ID4gKyAgICAgICAgaWYgKCFidWZzdGF0ZS0+ZXJyb3Ip
IHsNCj4gPiArICAgICAgICAgICAgcmV0ID0gMDsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAg
ICAgYnJlYWs7DQo+ID4gKyAgICB9DQo+ID4gKyAgICBkZWZhdWx0Og0KPiA+ICsgICAgICAgIHJl
dCA9IC1FTk9FTlQ7DQo+ID4gKyAgICAgICAgYnJlYWs7DQo+ID4gKyAgICB9DQo+ID4gK291dDoN
Cj4gPiArICAgIGlmIChyZXQpIHsNCj4gPiArICAgICAgICBlcnJvcl9yZXBvcnQoIiVzIHByb3Bl
cnR5IG9mIHR5cGU9JWQgY291bGQgbm90IGJlIGZpbGxlZCAoJWQpLCINCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgIiByZW1haW5pbmcgc2l6ZSA9IDB4JWx4IiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgX19mdW5jX18sIHR5cGUsIHJldCwgYnVmc3RhdGUtPmZpbGxlZCk7DQo+ID4gKyAg
ICB9DQo+ID4gKyAgICByZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IHZpcnRpb19pb21tdV9wcm9iZShWaXJ0SU9JT01NVSAqcywNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHZpcnRpb19pb21tdV9yZXFfcHJvYmUgKnJlcSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCAqYnVmKSB7DQo+ID4gKyAgICB1
aW50MzJfdCBkZXZpZCA9IGxlMzJfdG9fY3B1KHJlcS0+ZGV2aWNlKTsNCj4gPiArICAgIGludDE2
X3QgcHJvcF90eXBlcyA9IFNVUFBPUlRFRF9QUk9CRV9QUk9QRVJUSUVTLCB0eXBlOw0KPiA+ICsg
ICAgdmlvbW11X3Byb3BlcnR5X2J1ZmZlciBidWZzdGF0ZTsNCj4gPiArICAgIHZpb21tdV9kZXYg
KmRldjsNCj4gPiArICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgZGV2ID0gZ190cmVlX2xv
b2t1cChzLT5kZXZpY2VzLCBHVUlOVF9UT19QT0lOVEVSKGRldmlkKSk7DQo+ID4gKyAgICBpZiAo
IWRldikgew0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+ICsN
Cj4gPiArICAgIGJ1ZnN0YXRlLnN0YXJ0ID0gYnVmOw0KPiA+ICsgICAgYnVmc3RhdGUuZmlsbGVk
ID0gMDsNCj4gPiArICAgIGJ1ZnN0YXRlLmRldiA9IGRldjsNCj4gDQo+IGJ1ZnN0YXRlLmVycm9y
IGlzIG5vdCBpbml0aWFsaXplZCB3aGljaCBtYXkgY2F1c2UgZmFsc2UgYWxhcm0gaW4NCj4gdmly
dGlvX2lvbW11X2ZpbGxfcHJvcGVydHkoKQ0KDQpJIG9ic2VydmVkIGJlbG93IHByaW50cyANCgkg
InFlbXUtc3lzdGVtLWFhcmNoNjQ6IHZpcnRpb19pb21tdV9maWxsX3Byb3BlcnR5IHByb3BlcnR5
IG9mIHR5cGU9MiBjb3VsZCBub3QgYmUgZmlsbGVkICgtMjgpLCByZW1haW5pbmcgc2l6ZSA9IDB4
MCAiDQoNCldoZW4gSSBpbml0aWFsaXplZCB0aGUgYnVmc3RhdGUuZXJyb3IgPSAwLGl0IGdvZXMu
DQoNClRoYW5rcw0KLUJoYXJhdA0KDQo+IA0KPiA+ICsNCj4gPiArICAgIHdoaWxlICgodHlwZSA9
IGN0ejMyKHByb3BfdHlwZXMpKSAhPSAzMikgew0KPiA+ICsgICAgICAgIHJldCA9IHZpcnRpb19p
b21tdV9maWxsX3Byb3BlcnR5KGRldmlkLCAxIDw8IHR5cGUsICZidWZzdGF0ZSk7DQo+ID4gKyAg
ICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICB9
DQo+ID4gKyAgICAgICAgcHJvcF90eXBlcyAmPSB+KDEgPDwgdHlwZSk7DQo+ID4gKyAgICB9DQo+
ID4gKyAgICB2aXJ0aW9faW9tbXVfZmlsbF9wcm9wZXJ0eShkZXZpZCwgVklSVElPX0lPTU1VX1BS
T0JFX1RfTk9ORSwNCj4gPiArICZidWZzdGF0ZSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIFZJ
UlRJT19JT01NVV9TX09LOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgI2RlZmluZSBnZXRfcGF5bG9h
ZF9zaXplKHJlcSkgKFwNCj4gPiAgIHNpemVvZigocmVxKSkgLSBzaXplb2Yoc3RydWN0IHZpcnRp
b19pb21tdV9yZXFfdGFpbCkpDQo+ID4NCj4gPiBAQCAtNDMzLDYgKzU2NywyNCBAQCBzdGF0aWMg
aW50DQo+IHZpcnRpb19pb21tdV9oYW5kbGVfdW5tYXAoVmlydElPSU9NTVUgKnMsDQo+ID4gICAg
ICAgcmV0dXJuIHZpcnRpb19pb21tdV91bm1hcChzLCAmcmVxKTsNCj4gPiAgIH0NCj4gDQo+IFRo
YW5rcywNCj4gVG9tYXN6DQo=
