Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9750134wrx;
        Mon, 25 Feb 2019 01:48:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYeB7bhsZ/14Cdeokx1spyz/GrFbO3bncsRfQTQoCA1VhRvokuNN66NZnplzTuSMl+BAu+T
X-Received: by 2002:a0d:e781:: with SMTP id q123mr13397260ywe.378.1551088099371;
        Mon, 25 Feb 2019 01:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551088099; cv=none;
        d=google.com; s=arc-20160816;
        b=l+hbXyTAZ5z2SaIlsOQhUqzBE1Qxyq52vouerf1x1jr48XECPJ5TvbCLV0dyI/nLlV
         ouT60NsTdO2INplJoeNHshKZujcNKZ6TJXov8VWpHgQr8d5F9mvJBg1HdZ4A9KFtK5om
         6cIvf8I/0gYw2eR9js2GeIho0vXejp26gJku07UsyTjWTRU6HFjkxBJTnL2RRnXNQSKc
         zYiktCFJBDjQ6bdaKJCerPN5WhtosiQN3tJodG9Ffxk4IxrPUxjAezM0yGbVTEHuoZZl
         SIkw6d/hc+tOq/ZzEPZXN4ROKkn1ntyF+KQcxgcO3OQxf84/eRL1DqAKhfkkoT2IABs4
         7IVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=uC+WpyaiWOalGZ9uCfo617p4a18a0WP0fPbgrGjfd9s=;
        b=MdXEjBRAR/gCmHupz738jCqi0aiRs7jguMXn/vkrmxQIu21EzRl6Mu+o/4lCL2+m/N
         +mK5aPDUBPlWHsJrtmc+r0gpHZcr95UR4adbJL3oOcUxhKz2xF3CzGOt3DuwwUkj3wjh
         TdPp70ynvdSrvFmhIFfTqGhYCHzH4MuF2PK/I0nIhKFrvqfAfk7CG+65FrbHSGt7wKmj
         +chLYCPMXHml2eSUO0yxj9mbmB8Qaiy4TiaSo9AoEpcdL2jLcQrzMgsrshz/47WibMNJ
         U2042G1YXCzySJHBuLRmZSQNrQnlxWet13VQLIDUUYTvhGGeUkvqnFwnzOOfOm12/lNF
         1Ckg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r129si4775899ywb.164.2019.02.25.01.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 01:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyCry-0003Dv-PW
	for alex.bennee@linaro.org; Mon, 25 Feb 2019 04:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gyCrk-0003D0-2v
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 04:48:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gyCrh-00031j-JU
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 04:48:04 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45344 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gyCrX-0002rl-Qs; Mon, 25 Feb 2019 04:47:55 -0500
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id A27BA9B72B31F8F5CCF1;
	Mon, 25 Feb 2019 09:47:39 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.86]) by
	lhreml702-cah.china.huawei.com ([10.201.108.43]) with mapi id
	14.03.0415.000; Mon, 25 Feb 2019 09:47:33 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>
Thread-Topic: [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
Thread-Index: AQHUtvmpFsitltmfREOfc6NLrhEY6qXsIlgAgARL+vA=
Date: Mon, 25 Feb 2019 09:47:32 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392D48A6@lhreml524-mbs.china.huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
In-Reply-To: <3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
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
Cc: "Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	Laszlo Ersek <lersek@redhat.com>, Linuxarm <linuxarm@huawei.com>,
	"xuwei \(O\)" <xuwei5@huawei.com>, Ard
	Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GmG4nft4f3uv

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAyMiBGZWJydWFyeSAy
MDE5IDE2OjAzDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtv
bG90aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBzaGFubm9uLnpoYW9zbEBnbWFpbC5jb207IHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgcWVtdS1kZXZl
bEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUub3JnDQo+IENjOiB4dXdlaSAoTykgPHh1d2Vp
NUBodWF3ZWkuY29tPjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBBcmQNCj4gQmll
c2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz47IExlaWYgTGluZGhvbG0gKExpbmFy
byBhZGRyZXNzKQ0KPiA8bGVpZi5saW5kaG9sbUBsaW5hcm8ub3JnPjsgTGFzemxvIEVyc2VrIDxs
ZXJzZWtAcmVkaGF0LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMC80XSBBUk0gdmly
dDogQUNQSSBtZW1vcnkgaG90cGx1ZyBzdXBwb3J0DQo+IA0KPiBIaSBTaGFtZWVyLA0KPiANCj4g
T24gMS8yOC8xOSAxMjowNSBQTSwgU2hhbWVlciBLb2xvdGh1bSB3cm90ZToNCj4gPiBUaGlzIHNl
cmllcyBpcyBhbiBhdHRlbXB0IHRvIHByb3ZpZGUgaG90cGx1ZyBzdXBwb3J0IHRvIGJvdGgNCj4g
PiBwYy1kaW1tIGFuZCBudmRpbW0gZGV2aWNlIG1lbW9yeSBvbiBBUk0gdmlydCBwbGF0Zm9ybS4g
VGhpcyBpcw0KPiA+IGJhc2VkIG9uIEVyaWMncyByZWNlbnQgd29ya3MgdG8gc3VwcG9ydCBQQ0RJ
TU0vTlZESU1NIGRldmljZQ0KPiBtZW1vcnlbMV0uDQo+ID4gVGhlIGtlcm5lbCBzdXBwb3J0IGZv
ciBhcm02NCBtZW1vcnkgaG90IGFkZCB3YXMgYWRkZWQgb25seQ0KPiA+IHJlY2VudGx5IGJ5IFJv
YmluWzJdIGFuZCBoZW5jZSB0aGUgZ3Vlc3Qga2VybmVsIHNob3VsZCBiZSA9PiA1LjAtcmMxLg0K
PiA+DQo+ID4gVGhpcyBtYWtlcyB1c2Ugb2YgUEwwNjEgR1BJTyBjb250cm9sbGVyIHRvIHNlbnQg
cmVsYXRlZCBBQ1BJIGV2ZW50cw0KPiBzL3NlbnQvc2VuZA0KPiA+IHRvIHRoZSBHdWVzdC4gVGhl
IG9ubHkgcmVmZXJlbmNlIEkgY291bGQgZmluZCB3aXRoIHJlc3BlY3QgdG8gdGhlIEdQSU8NCj4g
PiBwaW5zIHVzYWdlIGlzIGhlcmVbM10gd2hpY2ggc2F5cywgInVzZSBQSU4gMyBmb3Igc3lzdGVt
X3Bvd2VyZG93biwNCj4gPiByZXNlcnZpbmcgUElOIDAsIDEsIDIgZm9yIFBDSSBob3RwbHVnLCBD
UFUgaG90cGx1ZyBhbmQgbWVtb3J5IGhvdHBsdWciLg0KPiA+IEhlbmNlIFBpbiAyIGlzIHVzZWQg
Zm9yIFBDRElNTSBhbmQgcGluIDQgZm9yIE5WRElNTS4NCj4gPg0KPiA+IFRoaXMgaXMgc2FuaXR5
IHRlc3RlZCBvbiBhIEhpU2lsaWNvbiBBUk02NCBwbGF0Zm9ybSBhbmQgYXBwcmVjaWF0ZQ0KPiA+
IGFueSBmdXJ0aGVyIHRlc3RpbmcuDQo+IA0KPiBJIGRpZCBzb21lIHRlc3Rpbmcgb24gYW5vdGhl
ciBwbGF0Zm9ybSBhbmQgSSBnb3QgdGhlIGV4YWN0bHkgdGhlIHNhbWUNCj4gcmVzdWx0cyBhcyB5
b3VyczogUENESU1NIGhvdCBwbHVnIHdvcmtzIGZpbmUuIEFsc28gYWZ0ZXIgc3lzdGVtX3Jlc2V0
IEkNCj4gc3RpbGwgY2FuIHNlZSB0aGUgc2xvdHMuDQo+IEhvdC11bnBsdWcgaXMgbm90IHN1cHBv
cnRlZCB0aG91Z2guDQoNClRoYW5rcyBmb3IgZ2l2aW5nIGl0IGEgc3Bpbi4gSG90IHVucGx1ZyBp
cyBkaXNhYmxlZCBmb3Igbm93IGFzIGtlcm5lbCBkb2VzbuKAmXQNCmhhdmUgc3VwcG9ydCBmb3Ig
aXQgeWV0Lg0KDQo+IEZvciBOVkRJTU0sIGhvdC1hZGQgd29ya3MgZmluZSBhbmQgYW5kIEkgY2Fu
IHNlZSB0aGUgc2xvdHMgdXNpbmcgbmRjdGwNCj4gb24gZ3Vlc3QuIEJ1dCBhZnRlciBzeXN0ZW1f
cmVzZXQsIHRoZSBndWVzdCBkb2VzIG5vdCBib290IHByb3Blcmx5Lg0KDQpSaWdodC4gQW5kIEkg
YXNzdW1lIHlvdSBhcmUgc2VlaW5nIHRoZSBzYW1lIGVycm9yIG1lc3NhZ2UgYXMgYmVsb3cuDQpU
aGFua3MgZm9yIGFkZGluZyByZWxldmFudCBwZW9wbGUgdG8gdGhlIGRpc2N1c3Npb24uDQoNCkNo
ZWVycywNClNoYW1lZXINCg0KPiA+DQo+ID4gVGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgb24g
dG9wIG9mIEVyaWMncyBicmFuY2ggaGVyZVs0XQ0KPiA+DQo+ID4gVGVzdDoNCj4gPiAtLS0tLS0N
Cj4gPiBQbGVhc2UgdXNlIGEgR3Vlc3Qga2VybmVsIGltYWdlID41LjAtcmMxIHdpdGggYWxsIHRo
ZSBtZW0vbnZkaW1tDQo+ID4gaG90cGx1ZyByZWxhdGVkIENPTkZJR3MgZW5hYmxlZC4NCj4gPg0K
PiA+IC4vcWVtdS1zeXN0ZW0tYWFyY2g2NCBcDQo+ID4gLW1hY2hpbmUgdmlydCxnaWMtdmVyc2lv
bj0zLG52ZGltbSBcDQo+ID4gLW0gMUcsbWF4bWVtPTRHLHNsb3RzPTQgXA0KPiA+IC1jcHUgaG9z
dCBcDQo+ID4gLWtlcm5lbCBJbWFnZSBcDQo+ID4gLWluaXRyZCByb290ZnMtaXBlcmYuY3BpbyBc
DQo+ID4gLWJpb3MgUUVNVV9FRkkuZmQgXA0KPiA+IC1udW1hIG5vZGUsbm9kZWlkPTAgXA0KPiA+
IC1uZXQgbm9uZSBcDQo+ID4gLW5vZ3JhcGhpYyAtZW5hYmxlLWt2bSBcDQo+ID4gLWFwcGVuZCAi
Y29uc29sZT10dHlBTUEwIGFjcGk9Zm9yY2UgZWFybHljb249cGwwMTEsMHg5MDAwMDAwIg0KPiA+
DQo+ID4gRW50ZXIgUWVtdSBtb25pdG9yLA0KPiA+IEFkZCBwYy1kaW1tOg0KPiA+IG9iamVjdF9h
ZGQgbWVtb3J5LWJhY2tlbmQtcmFtLGlkPW1lbTEsc2l6ZT0xRw0KPiA+IGRldmljZV9hZGQgcGMt
ZGltbSxpZD1kaW1tMSxtZW1kZXY9bWVtMQ0KPiA+DQo+ID4gQWRkIG52ZGltbToNCj4gPiBvYmpl
Y3RfYWRkIG1lbW9yeS1iYWNrZW5kLXJhbSxpZD1tZW0yLHNpemU9MUcNCj4gPiBkZXZpY2VfYWRk
IG52ZGltbSxpZD1kaW1tMixtZW1kZXY9bWVtMg0KPiA+DQo+ID4gS25vd24gSXNzdWU6DQo+ID4N
Cj4gPiBJdCBpcyBvYnNlcnZlZCB0aGF0IGhvdCBhZGRpbmcgbnZkaW1tIHdpbGwgcmVzdWx0cyBp
biBndWVzdCByZWJvb3QNCj4gPiBmYWlsdXJlLiBFREsyIGZhaWxzIHRvIGJ1aWxkIHRoZSBBQ1BJ
IHRhYmxlcyBvbiByZWJvb3QuIFBsZWFzZSBmaW5kDQo+ID4gYmVsb3cgRURLMiBsb2cgb24gR3Vl
c3QgcmVib290IGFmdGVyIG52ZGltbSBob3QtYWRkLA0KPiA+DQo+ID4gUHJvY2Vzc0NtZEFkZENo
ZWNrc3VtOiBpbnZhbGlkIGNoZWNrc3VtIHJhbmdlIGluICJldGMvYWNwaS90YWJsZXMiDQo+ID4g
T25Sb290QnJpZGdlc0Nvbm5lY3RlZDogSW5zdGFsbEFjcGlUYWJsZXM6IFByb3RvY29sIEVycm9y
DQo+ID4NCj4gPiBUaGUgcm9vdCBjYXVzZSBzZWVtcyB0byBiZSBFREsyIEFDUEkgdGFibGUgY2hl
Y2tzdW0gZmFpbHVyZQ0KPiA+IGFzIE5GSVQgdGFibGUgaXMgZ2V0dGluZyB1cGRhdGVkIG9uIGhv
dC1hZGQuIFRoaXMgbmVlZHMgZnVydGhlcg0KPiA+IGludmVzdGlnYXRpb24uDQo+ICsgQXJkLCBM
ZWlmLCBMYXN6bG8gaWYgdGhleSBoYXZlIGFueSBpZGVhIG9mIHdoYXQgaXMgbWlzc2luZy93cm9u
Zy4NCj4gDQo+IFRoYW5rcw0KPiANCj4gRXJpYw0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFNoYW1l
ZXINCj4gPg0KPiA+IFsxXWh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1k
ZXZlbC8yMDE5LTAxL21zZzA1NzQwLmh0bWwNCj4gPiBbMl1odHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzEwNzI0NDU1Lw0KPiA+IFszXWh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNo
aXZlL2h0bWwvcWVtdS1hcm0vMjAxNS0xMi9tc2cwMDA5NS5odG1sDQo+ID4gWzRdaHR0cHM6Ly9n
aXRodWIuY29tL2VhdWdlci9xZW11L3RyZWUvdjMuMS4wLWRpbW0tdjUNCj4gPg0KPiA+IFNoYW1l
ZXIgS29sb3RodW0gKDQpOg0KPiA+ICAgaHc6YWNwaTogTWFrZSBBQ1BJIElPIGFkZHJlc3Mgc3Bh
Y2UgY29uZmlndXJhYmxlDQo+ID4gICBody9hcm0vdmlydDogQWRkIEdQSU8gYmFzZWQgcGNkaW1t
IGhvdHBsdWcgQUNQSSBldmVudCBzdXBwb3J0DQo+ID4gICBody9hcm0vdmlydDogRW5hYmxlIHBj
LWRpbW0gaG90cGx1ZyBzdXBwb3J0DQo+ID4gICBody9hcm0vdmlydDogQWRkIG52ZGltbSBob3Rw
bHVnIHN1cHBvcnQNCj4gPg0KPiA+ICBkZWZhdWx0LWNvbmZpZ3MvYXJtLXNvZnRtbXUubWFrICB8
ICAgMSArDQo+ID4gIGh3L2FjcGkvbWVtb3J5X2hvdHBsdWcuYyAgICAgICAgIHwgIDEzICsrKy0t
DQo+ID4gIGh3L2FybS92aXJ0LWFjcGktYnVpbGQuYyAgICAgICAgIHwgIDQ1ICsrKysrKysrKysr
KysrKy0tDQo+ID4gIGh3L2FybS92aXJ0LmMgICAgICAgICAgICAgICAgICAgIHwgMTA1DQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+ICBody9pMzg2L2FjcGkt
YnVpbGQuYyAgICAgICAgICAgICB8ICAgMyArLQ0KPiA+ICBpbmNsdWRlL2h3L2FjcGkvbWVtb3J5
X2hvdHBsdWcuaCB8ICAgNiArKy0NCj4gPiAgaW5jbHVkZS9ody9hcm0vdmlydC5oICAgICAgICAg
ICAgfCAgMTUgKysrKysrDQo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQ0KPiA+DQo=
