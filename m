Received: by 10.223.172.38 with SMTP id v35csp4449531wrc;
        Wed, 27 Sep 2017 01:32:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCP75xEK+dD1AlYi4P/fuAf6FvZ2PM+L9uHjUsAqduxvYnSuxm7fZ02/lrzr976e1mYo3gB
X-Received: by 10.55.65.139 with SMTP id o133mr1181559qka.349.1506501144454;
        Wed, 27 Sep 2017 01:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506501144; cv=none;
        d=google.com; s=arc-20160816;
        b=BRuDGNmJZjiNurElf+855MUjGaJRZU6NVCOap+7UJPtsVgr51YaxM0gEF3uXEFgxH4
         gKFSLYGjm/LLDGrHx2wUaTKXVnGA8ffbyywA7GB7KlqRKlNiMe4Tel7Dl47D8wWcsB2H
         Tz5ZL65cmlPDB08iRJYeJk50kgN6aezLU+qxJ6ozTXMXDUczS8iG9fCfg+Sie82jCWWv
         v6iiJRlTxNbgg1PglZdonlfvCCqa6LnuiCgxjya8gAU3OLcK+3R0PXFr8oF1R0cC8+pk
         6DUq8BVpwrlvuXB3mKjiMY5QMNCzi6yikg/YH4U88/zbFExcFBuySEY/PPzkmwt4XUIr
         v/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=72BHgMzbdZPJQoj5nJKHq0yzavjxL5vupOF7napKojI=;
        b=EUIvBF+fhqoNy24ypcSDKavZVks4p017AqTUszcx01lGvIktv05vIdIPZ6GGtCojtD
         zJuwparQLXnMwZxzCIE5avquQ35x2vTXxahfz5RJeUcVoBP8U/VW6Z4NwMvCN8XrSAx8
         p4rJvuCfddQMECyH89P7fb+3MgaVB3zInvL+XEGSzR69832v6enrpJUBzD3tv219qZ7p
         piS5hcCx+BYgl0auExhlKr6HeE8zhyV6iZVikppn6tneScmm7AKepyY7CkB7pp9gP8f7
         oXEt9boANaslZ6b+mRolGkn3LhZvW2Trc6zWiw2ODyjsetU0P9ZbsjwZFAYK9bw3ioPR
         3VnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=uNObebqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h59si800136qtd.549.2017.09.27.01.32.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 01:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=uNObebqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:53399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx7lW-0003VP-4L
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 04:32:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dx7lG-0003Ta-PI
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dx7lC-0004aK-Qr
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:32:06 -0400
Received: from mail-eopbgr30057.outbound.protection.outlook.com
	([40.107.3.57]:15232
	helo=EUR03-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dx7lC-0004Zb-Ho; Wed, 27 Sep 2017 04:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=72BHgMzbdZPJQoj5nJKHq0yzavjxL5vupOF7napKojI=;
	b=uNObebqsfsX/DKVOre/Q98bu75eEPiKsVOHRPnIJDqyy7nq8Y8NgohE+wvRdgL7cnqPIxv01/AyOq7/6iti8LtLisLpZehKrQ9eklQFBp3Xx4/DMRvR7sXnaHKXvfPDuBAc42LSGZTqmQrVfHnXIwCm5iNWghht4KshqwT2rObY=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 08:32:00 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.016;
	Wed, 27 Sep 2017 08:32:00 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Peter Xu <peterx@redhat.com>
Thread-Topic: [PATCH v4 0/5] virtio-iommu: VFIO integration
Thread-Index: AQHTN1rqdMCSmFjsv0elJFTnh6rDzqLIR3YggAAGu4CAABj/UA==
Date: Wed, 27 Sep 2017 08:32:00 +0000
Message-ID: <AM5PR0401MB2545CCAEDA61222A171863F49A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<AM5PR0401MB25458FFED2D7D405A71F954C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<20170927070133.GB25011@pxdev.xzpeter.org>
In-Reply-To: <20170927070133.GB25011@pxdev.xzpeter.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	6:7M0J8XQ0S7ix4vJtIjrh9wh3/pw4R6xrEH6QbM/AybvpNmHZCdZUOezvD7cVS6/xuskGNH+KzpR5v6QRefdqgsXQxg7hCpX0jJ+8kbUDdJJj1abu3Cz02xZBoo1lJnodbjDBHORwvbwKOOh2zwa3vL11q++qabn0OEPus7EF0D/RQ9WlvJF2VTnsUoLwk4HO5teHQqe8Mo8elDQ6f659Lfmw3zTv5bJombPoXllobSbzrppUdX5Ezb4zHFmBNMVlc6XaeOv0OgTMX339hqNNmwRt93DhEIt7fnXBdzHYYFQNWzglAokA5Vw/bY3Slyn6fA+g5dMFD8SsPPcHjI20Tw==;
	5:L7TqLluqUUp4bNTMnGJIUw9WNZ0R+K/x7ujCu+Vv5qrJzmCP4tAw1yJg/BIetyDcpOZVfgfsq8TSl12tEMg0Z3QcOfia8718QsUxd/W5p8q2xtTYfYiv2eXqYusQ2qmpc3B61SuGXXQ8IYpzdunK7w==;
	24:zsg9F89yTBM+dbDx7W8t8QUI6Tga/Jz3rjF5ua9p98S4AXUJb+H24Kf8UKihhykNPNI3tI2goJfGcVAqMEm/aReXeOAOAx0OcJ9EjltSoyE=;
	7:ex5h6NhIGn+YRLA5L+41jx/8MUJZpkEREUECM1WhtMQ9OKtE4nwM+2iRjXwZRkaQmERLVs1bZoOoDzMA2IdteI8VuyD2Z998xk5LA6u3RL9a6QVmUpw6k6dHG1wKl+j7g/ANyOpBuZj7rfjU5aahTZnTyrv3stdX9GtMgOm/wkSr52fIw+tdRUwGPM8NWT0zLNnUgE4vchl1KlE4PTEaFm1hA3Tws4TEs+epaGyn1zo=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: db8f812b-f7f8-459d-4a6e-08d50582394b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2548; 
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB254889BF92279479F3C168B99A780@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 04433051BF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(199003)(377454003)(189002)(24454002)(13464003)(76176999)(86362001)(478600001)(6506006)(25786009)(105586002)(106356001)(54906003)(6436002)(101416001)(102836003)(229853002)(6116002)(50986999)(54356999)(3846002)(66066001)(68736007)(2906002)(33656002)(3660700001)(316002)(3280700002)(39060400002)(7736002)(53936002)(6246003)(305945005)(7416002)(5250100002)(53546010)(97736004)(14454004)(2950100002)(4326008)(74316002)(6916009)(5660300001)(7696004)(189998001)(2900100001)(8936002)(8676002)(81156014)(9686003)(81166006)(99286003)(55016002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2017 08:32:00.7291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.3.57
Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
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
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jQJgAdXbjmST

SGkgUGV0ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIg
WHUgW21haWx0bzpwZXRlcnhAcmVkaGF0LmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1i
ZXIgMjcsIDIwMTcgMTI6MzIgUE0NCj4gVG86IEJoYXJhdCBCaHVzaGFuIDxiaGFyYXQuYmh1c2hh
bkBueHAuY29tPg0KPiBDYzogZXJpYy5hdWdlckByZWRoYXQuY29tOyBlcmljLmF1Z2VyLnByb0Bn
bWFpbC5jb207DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgYWxleC53aWxsaWFtc29uQHJl
ZGhhdC5jb207IG1zdEByZWRoYXQuY29tOw0KPiBxZW11LWFybUBub25nbnUub3JnOyBxZW11LWRl
dmVsQG5vbmdudS5vcmc7IHdlaUByZWRoYXQuY29tOw0KPiBrZXZpbi50aWFuQGludGVsLmNvbTsg
bWFyYy56eW5naWVyQGFybS5jb207IHRuQHNlbWloYWxmLmNvbTsNCj4gd2lsbC5kZWFjb25AYXJt
LmNvbTsgZHJqb25lc0ByZWRoYXQuY29tOyByb2Jpbi5tdXJwaHlAYXJtLmNvbTsNCj4gY2hyaXN0
b2ZmZXIuZGFsbEBsaW5hcm8ub3JnOyBiaGFyYXRiLnlhZGF2QGdtYWlsLmNvbQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY0IDAvNV0gdmlydGlvLWlvbW11OiBWRklPIGludGVncmF0aW9uDQo+IA0K
PiBPbiBXZWQsIFNlcCAyNywgMjAxNyBhdCAwNjo0NjoxOEFNICswMDAwLCBCaGFyYXQgQmh1c2hh
biB3cm90ZToNCj4gPiBIaSBQZXRlciwNCj4gDQo+IEhpLCBCaGFyYXQhDQo+IA0KPiA+DQo+ID4g
V2hpbGUgdmZpbyB3aXRoIHZpcnRpby1pb21tdSBJIG9ic2VydmVkIG9uZSBpc3N1ZSwgIFdoZW4g
dmlydGlvLWlvbW11DQo+IGRldmljZSBleGlzdHMgYnV0IGd1ZXN0IGtlcm5lbCBkb2VzIG5vdCBo
YXZlIHZpcnRpby1pb21tdSBkcml2ZXIgKG5vdA0KPiBlbmFibGVkIGluIENvbmZpZykgdGhlbiBJ
T01NVSBmYXVsdHMgYXJlIHJlcG9ydGVkIG9uIGhvc3QuDQo+ID4NCj4gPiBUaGlzIGlzIGJlY2F1
c2Ugbm8gbWFwcGluZyBpcyBjcmVhdGVkIGluIElPTU1VLCBub3QgZXZlbiBkZWZhdWx0DQo+IGd1
ZXN0LXBoeXNpY2FsIHRvIHJlYWwtcGh5c2ljYWwuIFdoaWxlIGxvb2tpbmcgYXQgdmZpb19saXN0
ZW5lcl9yZWdpb25fYWRkKCksIGl0DQo+IGRvZXMgbm90IGNyZWF0ZSBpbml0aWFsIG1hcHBpbmcg
aW4gSU9NTVUgYW5kIHJlbGllcyBvbiBndWVzdCB0byBjcmVhdGUNCj4gbWFwcGluZy4gSXMgdGhp
cyBzb21ldGhpbmcga25vd24gb3IgSSBhbSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gDQo+IEZvciBW
VC1kLCB0aGUgdHJpY2sgaXMgcGxheWVkIHVzaW5nIGR5bmFtaWMgSU9NTVUgbWVtb3J5IHJlZ2lv
bi4NCj4gUGxlYXNlIHJlZmVyIHRvIGNvbW1pdCA1NThlMDAyNGE0MjggKCJpbnRlbF9pb21tdTog
YWxsb3cgZHluYW1pYyBzd2l0Y2ggb2YNCj4gSU9NTVUgcmVnaW9uIikgZm9yIG1vcmUgaW5mb3Jt
YXRpb24uDQo+IA0KPiBUaGUgd2hvbGUgaWRlYSBpcyB0aGF0LCB0aGUgSU9NTVUgcmVnaW9uIHdp
bGwgbm90IGJlIGVuYWJsZWQgb25seSBpZiB0aGUNCj4gZ3Vlc3QgZW5hYmxlcyB0aGF0IGV4cGxp
Y2l0bHkgZm9yIHRoZSBkZXZpY2UuICBPdGhlcndpc2UgKGZvciB5b3VyIGNhc2UsIHdoZW4NCj4g
Z3Vlc3QgZHJpdmVyIGlzIG5vdCBsb2FkZWQgYXQgYWxsKSwgdGhlIElPTU1VIHJlZ2lvbiBpcyBi
eSBkZWZhdWx0IG9mZiwgdGhlbg0KPiB0aGUgZGVmYXVsdCBHUEEgcmVnaW9uIHdpbGwgYmUgdXNl
ZCB0byBidWlsZCB1cCB0aGUgbWFwcGluZyAoanVzdCBsaWtlIHdoZW4NCj4gd2UgZG9uJ3QgaGF2
ZSB2SU9NTVUgYXQgYWxsKS4gIFRoYW5rcywNCg0KVGhhbmtzLCBJIHdpbGwgYW5hbHl6ZSBhbmQg
c2VlIGhvdyB3ZSBjYW4gdXNlIGZvciB2aXJ0aW8taW9tbXUuDQoNClJlZ2FyZHMNCi1CaGFyYXQN
Cg0KPiANCj4gLS0NCj4gUGV0ZXIgWHUNCg==
