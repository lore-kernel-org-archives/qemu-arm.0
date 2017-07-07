Received: by 10.25.44.15 with SMTP id s15csp608428lfs;
        Fri, 7 Jul 2017 15:11:39 -0700 (PDT)
X-Received: by 10.237.57.163 with SMTP id m32mr69190767qte.117.1499465499880;
        Fri, 07 Jul 2017 15:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499465499; cv=none;
        d=google.com; s=arc-20160816;
        b=kslBvtWXGfP3TJ5VMUo/oKxANZIhbV0aN8GMT506ACOINBd97Vkv0919dPpj5ciuT/
         uOvIeaBOOwEW55HTrU7NzOYHKTOyCyl1eZsqgy6Yxbdu8SAhyqDbIcK5trX+XyTvjSiS
         cqzxh7SCwemTyc+9VnfhC1icNyhmrbfh7TBkAHmGfubSA8Aop3V69b+pidkvsjLR14VM
         2J9b8zKLxxqYJ0mwUnSEWS0ukGmXehxd47xFpFHAYnEoaFrcssoOOpnnoQZKuQj88A8h
         2YCwoxytwQgEr+9GmPx/oHjRbqofnJYNqgNZnHMAalGH9wdwGZSCHdZ7AAYkn8kGoHAh
         r+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=cMPneROX2kjvw5QJyJHr+ek1D2R5clZqNLn+CI/ZsAs=;
        b=whwZMHjFV75KmSE80ZScIhpXNYuFg7p2qIg7Hbe3qreRjTt7SE2PTl/Qi9a2fhCOnR
         AR3+NBK06ImSZraH/0fOmnf+AgCA9sCLWP5m5xKmqZ+dzp8lURq+wxEEkFEArvmg7Xpx
         2ROvMbMagedq3b++6IehTkWC1XjS15RATt5Qgf2ig3GVlbAcGTKIwpQIHdrv7tmrKqJ8
         i5hKhHKdCH2MN+UzXx/r5VoaZUe1tnWpTg9r8AFQ0m7RF0kxcE+JG2K7DGpQpMDkkNv/
         ystJSxHxtuejjfMbHbNy8qW9Lq1vvYbgFNL76K+vBIkXzn9o2CosukZVs7bNTG16MYOZ
         T2dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=jfjE2HS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p37si4431004qtp.188.2017.07.07.15.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 15:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.b=jfjE2HS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTbTN-00067Q-4H
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 18:11:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Ashish.Kalra@cavium.com>) id 1dTbTI-00067E-DO
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 18:11:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Ashish.Kalra@cavium.com>) id 1dTbTF-00031x-8w
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 18:11:32 -0400
Received: from mail-bn3nam01on0054.outbound.protection.outlook.com
	([104.47.33.54]:19300
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Ashish.Kalra@cavium.com>)
	id 1dTbTE-00031V-VL; Fri, 07 Jul 2017 18:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cMPneROX2kjvw5QJyJHr+ek1D2R5clZqNLn+CI/ZsAs=;
	b=jfjE2HS9Gkwp/ufrzr9cbb2czMg48TVamOtKd7Uqgbbrir/CuAed/Q4IWh50QuAxw/TgFNKm+v+MLvtKt2uDjninL5LlhoVLdGLcxABvbjJkzdgOj6rRBZ1C099mkpYGF0BBHM3gIJnvv39btGqmniBEheYIKmYriJUtFblHfpw=
Received: from BN4PR07MB2161.namprd07.prod.outlook.com (10.164.63.19) by
	BN4PR07MB2162.namprd07.prod.outlook.com (10.164.63.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.13; Fri, 7 Jul 2017 22:11:25 +0000
Received: from BN4PR07MB2161.namprd07.prod.outlook.com ([10.164.63.19]) by
	BN4PR07MB2161.namprd07.prod.outlook.com ([10.164.63.19]) with mapi id
	15.01.1240.013; Fri, 7 Jul 2017 22:11:25 +0000
From: "Kalra, Ashish" <Ashish.Kalra@cavium.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, Auger Eric <eric.auger@redhat.com>, Bharat Bhushan
	<bharat.bhushan@nxp.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS9kpnllgG3hXvJ0aw38iXyZSHIaJHTb2AgAAgLXCAAAXygIABBwuAgABxe1A=
Date: Fri, 7 Jul 2017 22:11:25 +0000
Message-ID: <BN4PR07MB21615F830FCA5445EF4B7974E3AA0@BN4PR07MB2161.namprd07.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
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
	<BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190D28807@SHSMSX101.ccr.corp.intel.com>
	<67cb3a84-9aa7-2b4f-43b6-be6dea15b66f@arm.com>
In-Reply-To: <67cb3a84-9aa7-2b4f-43b6-be6dea15b66f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
	header.d=none;arm.com; dmarc=none action=none header.from=cavium.com;
x-originating-ip: [122.161.121.246]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN4PR07MB2162;
	7:SlsIH9rWgmnjtlgBn2CBsyNDAE18pn57qopJzxSvM+tf1VdJ71RJzP8CfRxJ/zopqdYhRyz/W75zE01eLAso4BKzZLq9AQoJ7D68fXbB5uGpv8G+Mgot7UwgVavEH7NEh+eJMZ4rnC2R9MoTDxgsuDLSN1XynG74HgIcLkl5A+WlP26HYS8ZYWlypghaPleN2RUomjARSAc25MNC/MqNuWvrs8ZGDGfgT9u6d2l5U9HZnWEg/nfJGYlgQxRZuDm3EffE2ejMwZmLWbAFeZE2iqGURu5/uxSuKjwaqGRgsGFYpX/dYx8IKTzVmiYyBe4DkWdFSR0dCwWVdKaBdDehAcajgSLXmia+7KRKp8vgB0ixfcl96wLPAJfJCrvEdZ7VE/piWx/EZROLzU+Vxhctz/kU26BQtDrcJe1JmNpVfe0w5udOa0HAL2gbN/wUcOU5WcAkwgQvve1K1scqu8B7n9PaVZXlB6zZ0TezPMcZGqZ72iXH5eGM8XGZynL7lPwiQ5Q81Z5ueRD+MFDnz8Fwrhw9hm53keIpsU/fDfNTVV0dZ0nXWVyWPuOr3eqhru+24bLLMYzNx78Bx4oZfBF8yRN/3NhQ2OBRywXwu/SMusCBqzxx1AVM8jbbZ1c7RIPeC0YQ9zQqPDQtBaMcjyjAeyVx9KTqFc35xPnSjo2YCp7ZSafm6EPTvKM5/LNeblE08Unm5hzqcCn+MKwzvzgLbNsx5Fc7jasHiRTZqdq2IhBhDCTdF58QeuVviMTH4rDFjH0B9cI/oENF+AeHnHYt8k7LdnzXPw0rsljT9sTQueo=
x-ms-office365-filtering-correlation-id: d290823b-828e-46e5-2cbe-08d4c5851bd1
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN4PR07MB2162; 
x-ms-traffictypediagnostic: BN4PR07MB2162:
x-microsoft-antispam-prvs: <BN4PR07MB2162112BFE6D19D1D76DC1D8E3AA0@BN4PR07MB2162.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(133145235818549)(236129657087228); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(2017060910069)(5005006)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN4PR07MB2162; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN4PR07MB2162; 
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39450400003)(39850400002)(39400400002)(39840400002)(39410400002)(51914003)(377454003)(24454002)(13464003)(4326008)(3660700001)(14454004)(561944003)(33656002)(3280700002)(39060400002)(2906002)(77096006)(93886004)(229853002)(66066001)(478600001)(38730400002)(25786009)(966005)(54906002)(7696004)(72206003)(6246003)(86362001)(8656002)(99286003)(74316002)(305945005)(9686003)(6306002)(8936002)(53936002)(2501003)(81166006)(8676002)(7736002)(2900100001)(53546010)(7416002)(2201001)(5660300001)(54356999)(50986999)(76176999)(189998001)(6116002)(6506006)(2950100002)(3846002)(6436002)(55016002)(102836003)(921003)(1121003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN4PR07MB2162;
	H:BN4PR07MB2161.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2017 22:11:25.3473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4PR07MB2162
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.54
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
Cc: "drjones@redhat.com" <drjones@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cg9t/awtgh8I

SGVsbG8gSmVhbiwNCg0KVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uDQoNCklzIHNvbWVvbmUg
YWxyZWFkeSB3b3JraW5nIG9uIGltcGxlbWVudGluZyB0aGlzLCBvciBpcyB0aGlzIHNvbWV0aGlu
ZyBJIGNhbiBsb29rIGludG8gYW5kIGltcGxlbWVudGluZyA/DQoNCkFsc28sIGFzIE1pY2hhZWwg
bWVudGlvbmVkIGFuZCBJIGxvb2tlZCBpbiB0aGUgdmZpbyBpb21tdSAodHlwZTEpIGRyaXZlciBp
bXBsZW1lbnRhdGlvbiB0aGF0IGl0IHN1cHBvcnRzIG1haW5seQ0Kc3RhdGljIG1hcHBpbmdzIG9m
IHVzZXItc3BhY2UgcHJvY2Vzc2VzIHdpdGggIHVzZXItc3BhY2UgcGFnZXMgcGlubmVkL2xvY2tl
ZCBpbiBtZW1vcnksIHNvIGEgZ2VuZXJpYyBzdXBwb3J0DQpmb3IgQVRTL1BSSSBleHRlbnNpb25z
IG5lZWRzIHRvIGJlIGFkZGVkIGluIFZGSU8gdG9vLg0KDQpUaGFua3MsDQpBc2hpc2gNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEplYW4tUGhpbGlwcGUgQnJ1Y2tlciBbbWFp
bHRvOmplYW4tcGhpbGlwcGUuYnJ1Y2tlckBhcm0uY29tXSANClNlbnQ6IEZyaWRheSwgSnVseSAw
NywgMjAxNyA4OjQ1IFBNDQpUbzogVGlhbiwgS2V2aW47IEthbHJhLCBBc2hpc2g7IEF1Z2VyIEVy
aWM7IEJoYXJhdCBCaHVzaGFuOyBlcmljLmF1Z2VyLnByb0BnbWFpbC5jb207IHBldGVyLm1heWRl
bGxAbGluYXJvLm9yZzsgYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29t
OyBxZW11LWFybUBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCkNjOiBtYXJjLnp5
bmdpZXJAYXJtLmNvbTsgdG5Ac2VtaWhhbGYuY29tOyB3aWxsLmRlYWNvbkBhcm0uY29tOyBkcmpv
bmVzQHJlZGhhdC5jb207IHJvYmluLm11cnBoeUBhcm0uY29tOyBjaHJpc3RvZmZlci5kYWxsQGxp
bmFyby5vcmcNClN1YmplY3Q6IFJlOiBbUWVtdS1hcm1dIFtRZW11LWRldmVsXSBbUkZDIHYyIDAv
OF0gVklSVElPLUlPTU1VIGRldmljZQ0KDQpIaSBBc2hpc2gsDQoNCk9uIDA3LzA3LzE3IDAwOjMz
LCBUaWFuLCBLZXZpbiB3cm90ZToNCj4+IEZyb206IEthbHJhLCBBc2hpc2ggW21haWx0bzpBc2hp
c2guS2FscmFAY2F2aXVtLmNvbV0NCj4+IFNlbnQ6IEZyaWRheSwgSnVseSA3LCAyMDE3IDc6MjQg
QU0NCj4+DQo+PiBJIGhhdmUgYSBnZW5lcmljIHF1ZXN0aW9uIG9uIHZJT01NVSBzdXBwb3J0LCBp
cyB0aGVyZSBhbnkgDQo+PiBwcm9wb3NhbC9wbGFuIHRvIGFkZCBBVFMvUFJJIGV4dGVuc2lvbiBz
dXBwb3J0IHRvIHZJT01NVXMgYW5kIGFsbG93IA0KPj4gaGFuZGxpbmcgZm9yIGVuZCB0byBlbmQg
KHYpSU9NTVUgUGFnZSBmYXVsdHMgKHcvdCB0aGUgZGV2aWNlIHNpZGUgDQo+PiBpbXBsZW1lbnRh
dGlvbiBvbiBWaG9zdCkgPw0KPj4NCj4+IEFnYWluLCB0aGUgbW90aXZhdGlvbiB3aWxsIGJlIHRv
IGRvIERNQSBvbiBwYWdlZCBndWVzdCBtZW1vcnkgYW5kIA0KPj4gcG90ZW50aWFsbHkgYXZvaWRp
bmcgdGhlIHJlcXVpcmVtZW50IG9mIHBpbm5lZC9sb2NrZWQgZ3Vlc3QgcGh5c2ljYWwgDQo+PiBt
ZW1vcnkgZm9yIERNQS4NCj4gDQo+IHllcywgdGhhdCdzIGEgbmVjZXNzYXJ5IHBhcnQgdG8gc3Vw
cG9ydCBTVk0gaW4gYm90aCB2aXJ0aW8taW9tbXUgDQo+IGFwcHJvYWNoIGFuZCBmdWxseSBlbXVs
YXRlZCBhcHByb2FjaCAoZS5nLiBmb3IgSW50ZWwgVlRkKS4gVGhlcmUgYXJlIA0KPiBhbHJlYWR5
IHBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGluIG90aGVyIHRocmVhZCBhYm91dCBob3cgdG8gcHJv
cGFnYXRlIA0KPiBJT01NVSBwYWdlIGZhdWx0IHRvIHZJT01NVS4gVGhlbiBhZnRlciBpdCBpcyBk
b25lIHZJT01NVSBwYWdlIGZhdWx0IA0KPiBlbXVsYXRpb24gd2lsbCBiZSBmdXJ0aGVyIGFkZGVk
Lg0KPiANCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTcvNi8yNy85NjQNCg0KRm9yIHZpcnRp
by1pb21tdSwgSSdkIGxpa2UgdG8gYWRkIGFuIGV2ZW50IHZpcnRxdWV1ZSBmb3IgdGhlIGRldmlj
ZSB0byBzZW5kIHBhZ2UgZmF1bHRzIHRvIHRoZSBkcml2ZXIsIGluIGEgZm9ybWF0IHNpbWlsYXIg
dG8gYSBQUkkgUGFnZSBSZXF1ZXN0Lg0KVGhlIGRyaXZlciB3b3VsZCB0aGVuIHNlbmQgYSByZXBs
eSB2aWEgdGhlIHJlcXVlc3QgdmlydHF1ZXVlIGluIGEgZm9ybWF0IHNpbWlsYXIgdG8gYSBQUkcg
UmVzcG9uc2UuDQoNCkluIFFlbXUgdGhlIGRldmljZSBpbXBsZW1lbnRhdGlvbiB3b3VsZCBob3Bl
ZnVsbHkgYmUgYmFzZWQgb24gdGhlIHNhbWUgbWVjaGFuaXNtIGFzIFZUZC4gVGhlIHZob3N0IGlt
cGxlbWVudGF0aW9uIHdvdWxkIHJlY2VpdmUgSU8gUGFnZSBGYXVsdHMgZnJvbSBWRklPIGFuZCBm
b3J3YXJkIHRoZW0gb24gdGhlIGV2ZW50IHZpcnRxdWV1ZSBzaW1pbGFybHkgdG8gdGhlIHVzZXJz
cGFjZSBpbXBsZW1lbnRhdGlvbi4NCg0KVGhhbmtzLA0KSmVhbg0K
