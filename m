Received: by 10.12.150.144 with SMTP id a16csp475515qvd;
        Thu, 13 Jul 2017 23:40:54 -0700 (PDT)
X-Received: by 10.237.59.59 with SMTP id p56mr10084411qte.95.1500014451131;
        Thu, 13 Jul 2017 23:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500014451; cv=none;
        d=google.com; s=arc-20160816;
        b=wyHsqQ//3Nh9HQF1C8JPiaMj8SoGldhHjcTTnhwjBcsg8FXcMlhERN5QKyAfQugFca
         BpA6aFT6XG00Ee7tNSu0An3LCrt5jzi1cqX3UE2S9B4FHGL+U0RJrD8VT0tNqH96pP0H
         SlL+x3N5Zazin+PMkfIWCzGRkgbE6ZvMZDYeXRj7X02CMArY6wPXGWCgD+rqV1C0VEvZ
         rADGZOemu6+2n5MEA6rYQlT0tIkAGpiML97K3uKJNVnE7AwsQJkLIJYWknzxbVIoLGyB
         8ebqtMf+u3+ieSdYFRRup9CXoXBwrI2iVWJEzF3HJcqxXdRoHrEKgabOID3XOWJ9D77U
         hNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=X4zdEiSmGQmRlldNv4iqkTSlAd5nnFIRDtPetBQTivo=;
        b=opel8YNnOvZvErz5e9NyuEyFyDzWj6O+pL8dWSy4oSt7SyQYdvwNnykNlVNHXgopax
         hJZ9tP3/meXa02HCnsAXdsoqe6xTVylPJbFxYnCIRtGZe/3dXhudQ4oYOIvd8a71RTEj
         uyUf6bp774P1pIUr9hnPG2AXU75PeTyMPjSVzOCzU58EJM+aBZLQCxZu0Vvxer5snUAg
         QxVBI03o6gyjmFuEd3KfP4AJYFXxGwJ6CZMXsX3Pd7/x3w5paawjPU80yB8pYBK4j0Rb
         dZFplTYgqO/ylyv/1Nyjneq4vZyHyw0TEKTzB1Vgf259+VbApCUZHlkr2NdTT0u3UMQg
         8rkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=cshcGSwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o52si7187847qto.230.2017.07.13.23.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 23:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=cshcGSwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:35813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVuHQ-0002Pp-Jl
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 02:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dVuHM-0002Pj-OZ
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 02:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dVuHI-0004Pf-B5
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 02:40:44 -0400
Received: from mail-eopbgr00064.outbound.protection.outlook.com
	([40.107.0.64]:18041
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dVuHH-0004Na-Il; Fri, 14 Jul 2017 02:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=X4zdEiSmGQmRlldNv4iqkTSlAd5nnFIRDtPetBQTivo=;
	b=cshcGSwk1NH5QQV8R5uw7YDEKTIM0w/dF8Rtom35T+Azbr/b79WiFq98/5KeSCeXGebaJD4XwhsaR0RaY8v11hDg1vf3PLJBCvsc7kIoBJoZzyV8wFyBanMzWm+oOlNMnY4aEDpG7Th1Mp+Wiui1WZB7unCVrgJ9UjCqI0NkW1s=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2547.eurprd04.prod.outlook.com (10.169.245.10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Fri, 14 Jul 2017 06:40:35 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::dc43:4720:e703:7cfa]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::dc43:4720:e703:7cfa%18]) with mapi id 15.01.1261.015;
	Fri, 14 Jul 2017 06:40:35 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement the
	translation and commands
Thread-Index: AQHS36dzyqTTC2TPF0WQrxpllPATmKJSz2WAgABIinA=
Date: Fri, 14 Jul 2017 06:40:34 +0000
Message-ID: <AM5PR0401MB2545B52A31CCA827DB3EE5A79AAD0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<20170714021733.GA27284@pxdev.xzpeter.org>
In-Reply-To: <20170714021733.GA27284@pxdev.xzpeter.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2547;
	7:STEz50cErLIr8oC+jG7yb+OP5DknXm8UHwU+T0cj94kYW+asdztO1RDrVGAkGHMXx+5X1iD9u9/cLBLFq8paOo6FboWaFsU75tw++mkAB312ga8EJSZv4znuFXwzdJ5n3GPJ9p62Y7tNtrjDI8X/c27deg3R9SOebyUItXL64C8YmVjTjHSs4cvgCmxE0C8Mkxk9ucxZuZQjD1z4tdmZ0Y0PiCkOK/4tm0vCVmYTCg9XFNBoGkduNlQb3QFNEDbLkU0gL0hyUO+N/1Fc+ixubILt6UxeOo8VsMJoLmRgTconAI3WbWa8cygReMPcstxsfdZESUU3Os/GWPbEeREHCi6vbUSORPWdfwhOtPT70Qw7PgR6okl2Jml32zI7MhrYp4zGbk6b4iu8U8qaUf+8Br3AcZpOetUjg6AbwKpUaUzElnITkGt4PDnrhbGq8+KKYnCoJJyzBNFgjwKLoipvcBD3K1iOYIG5Xe5N2lxjNkZ5x6RLFB94wb0ZUciDLemVJW93X//zNVVqRlMxKj9CVlOB+ZynFq71NJdoSzfU9H4qqIwSWU0LiYd89RC+SdPgusK2+nvkGdpu2IzlaJ1Sm1u8VzVVT3E8q90IgU3Z8jdZrBHvH35Jr1hGTWvhuKaZrgfbmHiD1oF60sgVVzCiJ7vcOgssNRRKg0hjfNLutVC8bj8eVAQ0nENgoO+Ny4zeJPWIIYnLDmRHGdCGfgKrdvGmdwBH5jU3Di52YWEJma715UYxNCRHexFaPqHwKMGdv7zSsDouA05OXINJQCeZ2qArswuieiGOytZENCiNm3k=
x-ms-office365-filtering-correlation-id: 3bf8f4c3-bd58-4004-5480-08d4ca833b46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2547; 
x-ms-traffictypediagnostic: AM5PR0401MB2547:
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(228905959029699)(247924648384137)(17755550239193);
x-microsoft-antispam-prvs: <AM5PR0401MB2547364E75521016DBEDF96C9AAD0@AM5PR0401MB2547.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6055026)(6041248)(20161123555025)(20161123564025)(20161123560025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2547; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2547; 
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39400400002)(39850400002)(39860400002)(39450400003)(39840400002)(377454003)(13464003)(24454002)(57704003)(102836003)(4326008)(6506006)(66066001)(5890100001)(189998001)(5250100002)(2900100001)(53936002)(478600001)(6436002)(3846002)(74316002)(6116002)(33656002)(14454004)(55016002)(9686003)(54906002)(99286003)(3660700001)(38730400002)(7416002)(3280700002)(86362001)(25786009)(76176999)(50986999)(305945005)(53546010)(7736002)(229853002)(5660300001)(54356999)(39060400002)(8676002)(2950100002)(2906002)(68736007)(8936002)(81166006)(7696004)(6246003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2547;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2017 06:40:34.9136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2547
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.0.64
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement
 the translation and commands
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8WdzvolPcMzD

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
WHUgW21haWx0bzpwZXRlcnhAcmVkaGF0LmNvbV0NCj4gU2VudDogRnJpZGF5LCBKdWx5IDE0LCAy
MDE3IDc6NDggQU0NCj4gVG86IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4g
Q2M6IGVyaWMuYXVnZXIucHJvQGdtYWlsLmNvbTsgcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOw0K
PiBhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207IHFlbXUtYXJtQG5v
bmdudS5vcmc7DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgamVhbi1waGlsaXBwZS5icnVja2Vy
QGFybS5jb207DQo+IHdlaUByZWRoYXQuY29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgQmhhcmF0
IEJodXNoYW4NCj4gPGJoYXJhdC5iaHVzaGFuQG54cC5jb20+OyBtYXJjLnp5bmdpZXJAYXJtLmNv
bTsgdG5Ac2VtaWhhbGYuY29tOw0KPiB3aWxsLmRlYWNvbkBhcm0uY29tOyBkcmpvbmVzQHJlZGhh
dC5jb207IHJvYmluLm11cnBoeUBhcm0uY29tOw0KPiBjaHJpc3RvZmZlci5kYWxsQGxpbmFyby5v
cmcNCj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUkZDIHYyIDYvOF0gdmlydGlvLWlvbW11
OiBJbXBsZW1lbnQgdGhlDQo+IHRyYW5zbGF0aW9uIGFuZCBjb21tYW5kcw0KPiANCj4gT24gV2Vk
LCBKdW4gMDcsIDIwMTcgYXQgMDY6MDE6MjVQTSArMDIwMCwgRXJpYyBBdWdlciB3cm90ZToNCj4g
PiBUaGlzIHBhdGNoIGFkZHMgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBmb3IgdGhlIHRyYW5z
bGF0aW9uIHJvdXRpbmUNCj4gPiBhbmQgdGhlIHZpcnRpby1pb21tdSBjb21tYW5kcy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4g
DQo+IFsuLi5dDQo+IA0KPiA+ICBzdGF0aWMgaW50IHZpcnRpb19pb21tdV9hdHRhY2goVmlydElP
SU9NTVUgKnMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdmly
dGlvX2lvbW11X3JlcV9hdHRhY2ggKnJlcSkNCj4gPiBAQCAtOTUsMTAgKzEzNSwzNCBAQCBzdGF0
aWMgaW50IHZpcnRpb19pb21tdV9hdHRhY2goVmlydElPSU9NTVUgKnMsDQo+ID4gICAgICB1aW50
MzJfdCBhc2lkID0gbGUzMl90b19jcHUocmVxLT5hZGRyZXNzX3NwYWNlKTsNCj4gPiAgICAgIHVp
bnQzMl90IGRldmlkID0gbGUzMl90b19jcHUocmVxLT5kZXZpY2UpOw0KPiA+ICAgICAgdWludDMy
X3QgcmVzZXJ2ZWQgPSBsZTMyX3RvX2NwdShyZXEtPnJlc2VydmVkKTsNCj4gPiArICAgIHZpb21t
dV9hcyAqYXM7DQo+ID4gKyAgICB2aW9tbXVfZGV2ICpkZXY7DQo+ID4NCj4gPiAgICAgIHRyYWNl
X3ZpcnRpb19pb21tdV9hdHRhY2goYXNpZCwgZGV2aWQsIHJlc2VydmVkKTsNCj4gPg0KPiA+IC0g
ICAgcmV0dXJuIFZJUlRJT19JT01NVV9TX1VOU1VQUDsNCj4gPiArICAgIGRldiA9IGdfdHJlZV9s
b29rdXAocy0+ZGV2aWNlcywgR1VJTlRfVE9fUE9JTlRFUihkZXZpZCkpOw0KPiA+ICsgICAgaWYg
KGRldikgew0KPiA+ICsgICAgICAgIHJldHVybiAtMTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4g
KyAgICBhcyA9IGdfdHJlZV9sb29rdXAocy0+YWRkcmVzc19zcGFjZXMsIEdVSU5UX1RPX1BPSU5U
RVIoYXNpZCkpOw0KPiA+ICsgICAgaWYgKCFhcykgew0KPiA+ICsgICAgICAgIGFzID0gZ19tYWxs
b2MwKHNpemVvZigqYXMpKTsNCj4gPiArICAgICAgICBhcy0+aWQgPSBhc2lkOw0KPiA+ICsgICAg
ICAgIGFzLT5tYXBwaW5ncyA9IGdfdHJlZV9uZXdfZnVsbCgoR0NvbXBhcmVEYXRhRnVuYylpbnRl
cnZhbF9jbXAsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TlVMTCwgTlVMTCwgKEdEZXN0cm95Tm90aWZ5KWdfZnJlZSk7DQo+ID4gKyAgICAgICAgZ190cmVl
X2luc2VydChzLT5hZGRyZXNzX3NwYWNlcywgR1VJTlRfVE9fUE9JTlRFUihhc2lkKSwgYXMpOw0K
PiA+ICsgICAgICAgIHRyYWNlX3ZpcnRpb19pb21tdV9uZXdfYXNpZChhc2lkKTsNCj4gPiArICAg
IH0NCj4gPiArDQo+ID4gKyAgICBkZXYgPSBnX21hbGxvYzAoc2l6ZW9mKCpkZXYpKTsNCj4gPiAr
ICAgIGRldi0+YXMgPSBhczsNCj4gPiArICAgIGRldi0+aWQgPSBkZXZpZDsNCj4gPiArICAgIGFz
LT5ucl9kZXZpY2VzKys7DQo+ID4gKyAgICB0cmFjZV92aXJ0aW9faW9tbXVfbmV3X2RldmlkKGRl
dmlkKTsNCj4gPiArICAgIGdfdHJlZV9pbnNlcnQocy0+ZGV2aWNlcywgR1VJTlRfVE9fUE9JTlRF
UihkZXZpZCksIGRldik7DQo+IA0KPiBIZXJlIGRvIHdlIG5lZWQgdG8gcmVjb3JkIHNvbWV0aGlu
ZyBsaWtlIGEgcmVmY291bnQgZm9yIGFkZHJlc3Mgc3BhY2U/DQo+IFNpbmNlLi4uDQoNCldlIGFy
ZSB1c2luZyAibnJfZGV2aWNlcyIgYXMgbnVtYmVyIG9mIGRldmljZXMgYXR0YWNoZWQgdG8gYW4g
YWRkcmVzcy1zcGFjZQ0KDQo+IA0KPiA+ICsNCj4gPiArICAgIHJldHVybiBWSVJUSU9fSU9NTVVf
U19PSzsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgdmlydGlvX2lvbW11X2RldGFjaChW
aXJ0SU9JT01NVSAqcywgQEAgLTEwNiwxMCArMTcwLDEzIEBADQo+ID4gc3RhdGljIGludCB2aXJ0
aW9faW9tbXVfZGV0YWNoKFZpcnRJT0lPTU1VICpzLCAgew0KPiA+ICAgICAgdWludDMyX3QgZGV2
aWQgPSBsZTMyX3RvX2NwdShyZXEtPmRldmljZSk7DQo+ID4gICAgICB1aW50MzJfdCByZXNlcnZl
ZCA9IGxlMzJfdG9fY3B1KHJlcS0+cmVzZXJ2ZWQpOw0KPiA+ICsgICAgaW50IHJldDsNCj4gPg0K
PiA+ICAgICAgdHJhY2VfdmlydGlvX2lvbW11X2RldGFjaChkZXZpZCwgcmVzZXJ2ZWQpOw0KPiA+
DQo+ID4gLSAgICByZXR1cm4gVklSVElPX0lPTU1VX1NfVU5TVVBQOw0KPiA+ICsgICAgcmV0ID0g
Z190cmVlX3JlbW92ZShzLT5kZXZpY2VzLCBHVUlOVF9UT19QT0lOVEVSKGRldmlkKSk7DQo+IA0K
PiAuLi4gaGVyZSB3aGVuIGRldGFjaCwgaW1obyB3ZSBzaG91bGQgY2hlY2sgdGhlIHJlZmNvdW50
OiBpZiB0aGVyZSBpcyBubw0KPiBkZXZpY2UgdXNpbmcgc3BlY2lmaWMgYWRkcmVzcyBzcGFjZSwg
d2Ugc2hvdWxkIHJlbGVhc2UgdGhlIGFkZHJlc3Mgc3BhY2UgYXMNCj4gd2VsbC4NCj4gDQo+IE90
aGVyd2lzZSB0aGVyZSB3b3VsZCBoYXZlIG5vIHdheSB0byBkZXN0cm95IGFuIGFkZHJlc3Mgc3Bh
Y2U/DQoNCg0KSGVyZSBpZiBucl9kZXZpY2VzID09IDAgdGhlbiByZWxlYXNlIHRoZSBhZGRyZXNz
IHNwYWNlLCBpcyB0aGF0IG9rPyANCg0KVGhpcyBpcyBob3cgSSBpbXBsZW1lbnRlZCBhcyBwYXJ0
IG9mIFZGSU8gaW50ZWdyYXRpb24gb3ZlciB0aGlzIHBhdGNoIHNlcmllcy4NCgkiW1JGQyBQQVRD
SCAyLzJdIHZpcnRpby1pb21tdTogdmZpbyBpbnRlZ3JhdGlvbiB3aXRoIHZpcnRpby1pb21tdSIN
Cg0KVGhhbmtzDQotQmhhcmF0DQo+IA0KPiA+ICsNCj4gPiArICAgIHJldHVybiByZXQgPyBWSVJU
SU9fSU9NTVVfU19PSyA6IFZJUlRJT19JT01NVV9TX0lOVkFMOw0KPiA+ICB9DQo+IA0KPiBbLi4u
XQ0KPiANCj4gPiAgc3RhdGljIGludCB2aXJ0aW9faW9tbXVfdW5tYXAoVmlydElPSU9NTVUgKnMs
IEBAIC0xMzMsMTAgKzIyNyw2NCBAQA0KPiA+IHN0YXRpYyBpbnQgdmlydGlvX2lvbW11X3VubWFw
KFZpcnRJT0lPTU1VICpzLA0KPiA+ICAgICAgdWludDY0X3QgdmlydF9hZGRyID0gbGU2NF90b19j
cHUocmVxLT52aXJ0X2FkZHIpOw0KPiA+ICAgICAgdWludDY0X3Qgc2l6ZSA9IGxlNjRfdG9fY3B1
KHJlcS0+c2l6ZSk7DQo+ID4gICAgICB1aW50MzJfdCBmbGFncyA9IGxlMzJfdG9fY3B1KHJlcS0+
ZmxhZ3MpOw0KPiA+ICsgICAgdmlvbW11X21hcHBpbmcgKm1hcHBpbmc7DQo+ID4gKyAgICB2aW9t
bXVfaW50ZXJ2YWwgaW50ZXJ2YWw7DQo+ID4gKyAgICB2aW9tbXVfYXMgKmFzOw0KPiA+DQo+ID4g
ICAgICB0cmFjZV92aXJ0aW9faW9tbXVfdW5tYXAoYXNpZCwgdmlydF9hZGRyLCBzaXplLCBmbGFn
cyk7DQo+ID4NCj4gPiAtICAgIHJldHVybiBWSVJUSU9fSU9NTVVfU19VTlNVUFA7DQo+ID4gKyAg
ICBhcyA9IGdfdHJlZV9sb29rdXAocy0+YWRkcmVzc19zcGFjZXMsIEdVSU5UX1RPX1BPSU5URVIo
YXNpZCkpOw0KPiA+ICsgICAgaWYgKCFhcykgew0KPiA+ICsgICAgICAgIGVycm9yX3JlcG9ydCgi
JXM6IG5vIGFzIiwgX19mdW5jX18pOw0KPiA+ICsgICAgICAgIHJldHVybiBWSVJUSU9fSU9NTVVf
U19JTlZBTDsNCj4gPiArICAgIH0NCj4gPiArICAgIGludGVydmFsLmxvdyA9IHZpcnRfYWRkcjsN
Cj4gPiArICAgIGludGVydmFsLmhpZ2ggPSB2aXJ0X2FkZHIgKyBzaXplIC0gMTsNCj4gPiArDQo+
ID4gKyAgICBtYXBwaW5nID0gZ190cmVlX2xvb2t1cChhcy0+bWFwcGluZ3MsIChncG9pbnRlcikm
aW50ZXJ2YWwpOw0KPiA+ICsNCj4gPiArICAgIHdoaWxlIChtYXBwaW5nKSB7DQo+ID4gKyAgICAg
ICAgdmlvbW11X2ludGVydmFsIGN1cnJlbnQ7DQo+ID4gKyAgICAgICAgdWludDY0X3QgbG93ICA9
IG1hcHBpbmctPnZpcnRfYWRkcjsNCj4gPiArICAgICAgICB1aW50NjRfdCBoaWdoID0gbWFwcGlu
Zy0+dmlydF9hZGRyICsgbWFwcGluZy0+c2l6ZSAtIDE7DQo+ID4gKw0KPiA+ICsgICAgICAgIGN1
cnJlbnQubG93ID0gbG93Ow0KPiA+ICsgICAgICAgIGN1cnJlbnQuaGlnaCA9IGhpZ2g7DQo+ID4g
Kw0KPiA+ICsgICAgICAgIGlmIChsb3cgPT0gaW50ZXJ2YWwubG93ICYmIHNpemUgPj0gbWFwcGlu
Zy0+c2l6ZSkgew0KPiA+ICsgICAgICAgICAgICBnX3RyZWVfcmVtb3ZlKGFzLT5tYXBwaW5ncywg
KGdwb2ludGVyKSZjdXJyZW50KTsNCj4gPiArICAgICAgICAgICAgaW50ZXJ2YWwubG93ID0gaGln
aCArIDE7DQo+ID4gKyAgICAgICAgICAgIHRyYWNlX3ZpcnRpb19pb21tdV91bm1hcF9sZWZ0X2lu
dGVydmFsKGN1cnJlbnQubG93LA0KPiBjdXJyZW50LmhpZ2gsDQo+ID4gKyAgICAgICAgICAgICAg
ICBpbnRlcnZhbC5sb3csIGludGVydmFsLmhpZ2gpOw0KPiA+ICsgICAgICAgIH0gZWxzZSBpZiAo
aGlnaCA9PSBpbnRlcnZhbC5oaWdoICYmIHNpemUgPj0gbWFwcGluZy0+c2l6ZSkgew0KPiA+ICsg
ICAgICAgICAgICB0cmFjZV92aXJ0aW9faW9tbXVfdW5tYXBfcmlnaHRfaW50ZXJ2YWwoY3VycmVu
dC5sb3csDQo+IGN1cnJlbnQuaGlnaCwNCj4gPiArICAgICAgICAgICAgICAgIGludGVydmFsLmxv
dywgaW50ZXJ2YWwuaGlnaCk7DQo+ID4gKyAgICAgICAgICAgIGdfdHJlZV9yZW1vdmUoYXMtPm1h
cHBpbmdzLCAoZ3BvaW50ZXIpJmN1cnJlbnQpOw0KPiA+ICsgICAgICAgICAgICBpbnRlcnZhbC5o
aWdoID0gbG93IC0gMTsNCj4gPiArICAgICAgICB9IGVsc2UgaWYgKGxvdyA+IGludGVydmFsLmxv
dyAmJiBoaWdoIDwgaW50ZXJ2YWwuaGlnaCkgew0KPiA+ICsgICAgICAgICAgICB0cmFjZV92aXJ0
aW9faW9tbXVfdW5tYXBfaW5jX2ludGVydmFsKGN1cnJlbnQubG93LA0KPiBjdXJyZW50LmhpZ2gp
Ow0KPiA+ICsgICAgICAgICAgICBnX3RyZWVfcmVtb3ZlKGFzLT5tYXBwaW5ncywgKGdwb2ludGVy
KSZjdXJyZW50KTsNCj4gPiArICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICBicmVh
azsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgaWYgKGludGVydmFsLmxvdyA+PSBpbnRl
cnZhbC5oaWdoKSB7DQo+ID4gKyAgICAgICAgICAgIHJldHVybiBWSVJUSU9fSU9NTVVfU19PSzsN
Cj4gPiArICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICBtYXBwaW5nID0gZ190cmVl
X2xvb2t1cChhcy0+bWFwcGluZ3MsIChncG9pbnRlcikmaW50ZXJ2YWwpOw0KPiA+ICsgICAgICAg
IH0NCj4gPiArICAgIH0NCj4gDQo+IElJVUMgZm9yIHVubWFwIGhlcmUgd2UgYXJlIHZlcnkgc3Ry
aWN0IC0gYSBleHRyZW1lIGNhc2UgaXMgdGhhdCB3aGVuIGFuDQo+IGFkZHJlc3Mgc3BhY2UgaXMg
anVzdCBjcmVhdGVkIChzbyBubyBtYXBwaW5nIGluc2lkZSksIGlmIHdlIHNlbmQgb25lIFVOTUFQ
DQo+IHRvIGEgcmFuZ2UsIGl0J2xsIGZhaWwgY3VycmVudGx5LCByaWdodD8gU2hvdWxkIHdlIGxv
b3NlbiBpdD8NCj4gDQo+IElNSE8gYXMgbG9uZyBhcyB3ZSBtYWtlIHN1cmUgYWxsIHRoZSBtYXBw
aW5ncyBpbiB0aGUgcmFuZ2Ugb2YgYW4gVU5NQVANCj4gcmVxdWVzdCBhcmUgZGVzdHJveWVkLCB0
aGVuIHdlIGFyZSBnb29kLiBJIHRoaW5rIGF0IGxlYXN0IGJvdGggdmZpbyBhcGkgYW5kIHZ0LQ0K
PiBkIGVtdWF0aW9uIGhhdmUgdGhpcyBhc3N1bXB0aW9uLiBCdXQgbWF5YmUgSSBhbSB3cm9uZy4N
Cj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgc28uDQo+IA0KPiA+ICsNCj4gPiArICAgIGlmIChtYXBw
aW5nKSB7DQo+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCIqKioqKiogJXM6IFVubWFwIDB4JSJQ
Ukl4NjQiIHNpemU9MHglIlBSSXg2NA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAiIGZyb20g
MHglIlBSSXg2NCIgc2l6ZT0weCUiUFJJeDY0IiBpcyBub3Qgc3VwcG9ydGVkIiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGludGVydmFsLmxvdywgc2l6ZSwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgbWFwcGluZy0+dmlydF9hZGRyLCBtYXBwaW5nLT5zaXplKTsNCj4g
PiArICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCIqKioqKiogJXM6IG5v
IG1hcHBpbmcgZm9yDQo+IFsweCUiUFJJeDY0IiwweCUiUFJJeDY0Il0iLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBfX2Z1bmNfXywgaW50ZXJ2YWwubG93LCBpbnRlcnZhbC5oaWdoKTsNCj4g
PiArICAgIH0NCj4gPiArDQo+ID4gKyAgICByZXR1cm4gVklSVElPX0lPTU1VX1NfSU5WQUw7DQo+
ID4gIH0NCj4gDQo+IFRoYW5rcywNCj4gDQo+IC0tDQo+IFBldGVyIFh1DQo=
