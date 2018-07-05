Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1598958wrq;
        Thu, 5 Jul 2018 06:20:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd+p5g/xr+ISYdu+ag4e+DrCBYwRlGcFajrRnfNbWyEPnjfSt8WY5wrb58DI6y0yb6T8Pa6
X-Received: by 2002:ac8:166c:: with SMTP id x41-v6mr5140802qtk.245.1530796808737;
        Thu, 05 Jul 2018 06:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530796808; cv=none;
        d=google.com; s=arc-20160816;
        b=dncoEysAsUU5kMsZzlDpti+GyJM0sNAYcRdFc0lIppPl6Ld58MvAWDe5blYA/5XKty
         hjoYxgo0VvBVoViATGqv/9Qga3Hitj6lkeniDF9HVu6z3Hp2LCSRFQgjwGVIuLFC7Q4l
         6O0aVn2O3C6bl6GnaZkvCc9VmuU+4J0w/xXsKAyLkBan2Bng9hnE5+DAIxJM1IQiskJo
         FhGhC0DPJhEbanUebogMo5LNhku7nJMQ1Hc2ET3kaH4Ds1TwhLSL+ClS5XEgPOrHlRiC
         ZVFkzEK9AZVt3eEeKAGub76YyBvtrNEPxMDwgZCH9CN94rVCGsOYFwZBRXa0RnZNOuNE
         Qgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=dJ3xf6WUiyBAcwNA1U2WoUfuf+/FszbpSSI52IYarBk=;
        b=vM1pZjYg92ssOcPnDpl2ca5Omom3INNusvOQR0BgpRjaVbzdV632Q6sEti3rFwJTYg
         cW7gzBnvMOKxfTII2L8cjdzTSCmngpB6CPHGsqXZile5o/+mOqt2Kmz8VVd4478OckuE
         FVPfLpVB3Std1mjCIW3sh7G44k4TzW2liP2B0sTet9L1oPoTKEXK/6iG7T9FQulbATPs
         ayQrRfJNsVDQPlg5dscDX1zJzl30Dgfn6yX8deRB9SL/MTwYYr20lVAKHQd16rEoXWsO
         F+IIebIImYxV19G0CvCt/719SNCL3bzYJxBB0qCtMkDX03Eehb65UWzvwykuk0VHMXHJ
         vnNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27-v6si1439291qvh.18.2018.07.05.06.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 06:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb4B6-0006Wy-87
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 09:20:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fb4At-0006Wd-Il
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 09:19:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fb4Ap-0005nJ-SS
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 09:19:55 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4264 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fb4Ap-0005YD-HR; Thu, 05 Jul 2018 09:19:51 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 79AF68BBDBCAA;
	Thu,  5 Jul 2018 14:19:44 +0100 (IST)
Received: from FRAEML702-CAH.china.huawei.com (10.206.14.33) by
	lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Thu, 5 Jul 2018 14:19:46 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	fraeml702-cah.china.huawei.com ([10.206.14.33]) with mapi id
	14.03.0382.000; Thu, 5 Jul 2018 15:19:45 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, David Hildenbrand <david@redhat.com>, 
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
	"imammedo@redhat.com" <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate device_memory
Thread-Index: AQHUEp5cIDTKNH/WDUOGaBO5H22mNqR9r4uAgAAReYCAARbmAIABi7oAgAADWYCAAAHkgIAAAm0AgAACWoCAACyYUA==
Date: Thu, 5 Jul 2018 13:19:44 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA838712003@FRAEML521-MBX.china.huawei.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-7-git-send-email-eric.auger@redhat.com>
	<a856ba3a-c211-5f35-4023-97ef73eb5c31@redhat.com>
	<df091f31-6f85-64d8-0c3b-7fd463d31c63@redhat.com>
	<43c1349e-1ca6-4890-07c0-7bfa35ab914d@redhat.com>
	<5311fed5-7f13-a177-b967-db6e3ed028b9@redhat.com>
	<405e3f2b-3044-d7fc-8df4-b07a8487470f@redhat.com>
	<f2d61062-21df-4478-bc61-c32e92329cf8@redhat.com>
	<57030c9f-c3d1-49a8-090e-d6b316e7a818@redhat.com>
	<fc6a29d4-1094-8d29-d415-fc30d5e30c31@redhat.com>
In-Reply-To: <fc6a29d4-1094-8d29-d415-fc30d5e30c31@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 06/15] hw/arm/virt: Allocate
 device_memory
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
Cc: "agraf@suse.de" <agraf@suse.de>, "drjones@redhat.com" <drjones@redhat.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dOU8sgHcyk0W

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEF1Z2VyIEVyaWMgW21haWx0
bzplcmljLmF1Z2VyQHJlZGhhdC5jb21dDQo+IFNlbnQ6IDA1IEp1bHkgMjAxOCAxMzoxOA0KPiBU
bzogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+OyBlcmljLmF1Z2VyLnByb0Bn
bWFpbC5jb207DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsg
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOw0KPiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxz
aGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBpbWFtbWVkb0ByZWRoYXQu
Y29tDQo+IENjOiB3ZWlAcmVkaGF0LmNvbTsgZHJqb25lc0ByZWRoYXQuY29tOyBkYXZpZEBnaWJz
b24uZHJvcGJlYXIuaWQuYXU7DQo+IGRnaWxiZXJ0QHJlZGhhdC5jb207IGFncmFmQHN1c2UuZGUN
Cj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUkZDIHYzIDA2LzE1XSBody9hcm0vdmlydDog
QWxsb2NhdGUNCj4gZGV2aWNlX21lbW9yeQ0KPiANCj4gSGkgRGF2aWQsDQo+IA0KPiBPbiAwNy8w
NS8yMDE4IDAyOjA5IFBNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4gPiBPbiAwNS4wNy4y
MDE4IDE0OjAwLCBBdWdlciBFcmljIHdyb3RlOg0KPiA+PiBIaSBEYXZpZCwNCj4gPj4NCj4gPj4g
T24gMDcvMDUvMjAxOCAwMTo1NCBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+ID4+PiBP
biAwNS4wNy4yMDE4IDEzOjQyLCBBdWdlciBFcmljIHdyb3RlOg0KPiA+Pj4+IEhpIERhdmlkLA0K
PiA+Pj4+DQo+ID4+Pj4gT24gMDcvMDQvMjAxOCAwMjowNSBQTSwgRGF2aWQgSGlsZGVuYnJhbmQg
d3JvdGU6DQo+ID4+Pj4+IE9uIDAzLjA3LjIwMTggMjE6MjcsIEF1Z2VyIEVyaWMgd3JvdGU6DQo+
ID4+Pj4+PiBIaSBEYXZpZCwNCj4gPj4+Pj4+IE9uIDA3LzAzLzIwMTggMDg6MjUgUE0sIERhdmlk
IEhpbGRlbmJyYW5kIHdyb3RlOg0KPiA+Pj4+Pj4+IE9uIDAzLjA3LjIwMTggMDk6MTksIEVyaWMg
QXVnZXIgd3JvdGU6DQo+ID4+Pj4+Pj4+IFdlIGRlZmluZSBhIG5ldyBob3RwbHVnZ2FibGUgUkFN
IHJlZ2lvbiAoYWthLiBkZXZpY2UgbWVtb3J5KS4NCj4gPj4+Pj4+Pj4gSXRzIGJhc2UgaXMgMlRC
IEdQQS4gVGhpcyBvYnZpb3VzbHkgcmVxdWlyZXMgNDJiIElQQSBzdXBwb3J0DQo+ID4+Pj4+Pj4+
IGluIEtWTS9BUk0sIEZXIGFuZCBndWVzdCBrZXJuZWwuIEF0IHRoZSBtb21lbnQgdGhlIGRldmlj
ZQ0KPiA+Pj4+Pj4+PiBtZW1vcnkgcmVnaW9uIGlzIG1heCAyVEIuDQo+ID4+Pj4+Pj4NCj4gPj4+
Pj4+PiBNYXliZSBhIHN0dXBpZCBxdWVzdGlvbiwgYnV0IHdoeSBleGFjdGx5IGRvZXMgaXQgaGF2
ZSB0byBzdGFydCBhdCAyVEINCj4gPj4+Pj4+PiAoYW5kIG5vdCBlLmcuIGF0IDFUQik/DQo+ID4+
Pj4+PiBub3QgYSBzdHVwaWQgcXVlc3Rpb24uIFNlZSB0ZW50YXRpdmUgYW5zd2VyIGJlbG93Lg0K
PiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFRoaXMgaXMgbGFyZ2VseSBpbnNwaXJl
ZCBvZiBkZXZpY2UgbWVtb3J5IGluaXRpYWxpemF0aW9uIGluDQo+ID4+Pj4+Pj4+IHBjIG1hY2hp
bmUgY29kZS4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBBdWdl
ciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBLd2Fu
Z3dvbyBMZWUgPGt3YW5nd29vLmxlZUBzay5jb20+DQo+ID4+Pj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4+
PiAgaHcvYXJtL3ZpcnQuYyAgICAgICAgIHwgMTA0DQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ID4+Pj4+Pj4+ICBpbmNsdWRlL2h3L2FybS9h
cm0uaCAgfCAgIDIgKw0KPiA+Pj4+Pj4+PiAgaW5jbHVkZS9ody9hcm0vdmlydC5oIHwgICAxICsN
Cj4gPj4+Pj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRp
b25zKC0pDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9ody9hcm0vdmlydC5j
IGIvaHcvYXJtL3ZpcnQuYw0KPiA+Pj4+Pj4+PiBpbmRleCA1YTRkMGJmLi42ZmVmYjc4IDEwMDY0
NA0KPiA+Pj4+Pj4+PiAtLS0gYS9ody9hcm0vdmlydC5jDQo+ID4+Pj4+Pj4+ICsrKyBiL2h3L2Fy
bS92aXJ0LmMNCj4gPj4+Pj4+Pj4gQEAgLTU5LDYgKzU5LDcgQEANCj4gPj4+Pj4+Pj4gICNpbmNs
dWRlICJxYXBpL3Zpc2l0b3IuaCINCj4gPj4+Pj4+Pj4gICNpbmNsdWRlICJzdGFuZGFyZC1oZWFk
ZXJzL2xpbnV4L2lucHV0LmgiDQo+ID4+Pj4+Pj4+ICAjaW5jbHVkZSAiaHcvYXJtL3NtbXV2My5o
Ig0KPiA+Pj4+Pj4+PiArI2luY2x1ZGUgImh3L2FjcGkvYWNwaS5oIg0KPiA+Pj4+Pj4+Pg0KPiA+
Pj4+Pj4+PiAgI2RlZmluZSBERUZJTkVfVklSVF9NQUNISU5FX0xBVEVTVChtYWpvciwgbWlub3Is
IGxhdGVzdCkgXA0KPiA+Pj4+Pj4+PiAgICAgIHN0YXRpYyB2b2lkIHZpcnRfIyNtYWpvciMjXyMj
bWlub3IjI19jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywNCj4gXA0KPiA+Pj4+Pj4+PiBAQCAt
OTQsMzQgKzk1LDI1IEBADQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+ICAjZGVmaW5lIFBMQVRGT1JN
X0JVU19OVU1fSVJRUyA2NA0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiAtLyogUkFNIGxpbWl0IGlu
IEdCLiBTaW5jZSBWSVJUX01FTSBzdGFydHMgYXQgdGhlIDFHQiBtYXJrLCB0aGlzDQo+IG1lYW5z
DQo+ID4+Pj4+Pj4+IC0gKiBSQU0gY2FuIGdvIHVwIHRvIHRoZSAyNTZHQiBtYXJrLCBsZWF2aW5n
IDI1NkdCIG9mIHRoZSBwaHlzaWNhbA0KPiA+Pj4+Pj4+PiAtICogYWRkcmVzcyBzcGFjZSB1bmFs
bG9jYXRlZCBhbmQgZnJlZSBmb3IgZnV0dXJlIHVzZSBiZXR3ZWVuIDI1NkcNCj4gYW5kIDUxMkcu
DQo+ID4+Pj4+Pj4+IC0gKiBJZiB3ZSBuZWVkIHRvIHByb3ZpZGUgbW9yZSBSQU0gdG8gVk1zIGlu
IHRoZSBmdXR1cmUgdGhlbiB3ZQ0KPiBuZWVkIHRvOg0KPiA+Pj4+Pj4+PiAtICogICogYWxsb2Nh
dGUgYSBzZWNvbmQgYmFuayBvZiBSQU0gc3RhcnRpbmcgYXQgMlRCIGFuZCB3b3JraW5nIHVwDQo+
ID4+Pj4+PiBJIGFja25vd2xlZGdlIHRoaXMgY29tbWVudCB3YXMgdGhlIG1haW4ganVzdGlmaWNh
dGlvbi4gTm93IGlmIHlvdSBsb29rDQo+IGF0DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gUHJpbmNpcGxl
cyBvZiBBUk0gTWVtb3J5IE1hcHMNCj4gPj4+Pj4+DQo+IGh0dHA6Ly9pbmZvY2VudGVyLmFybS5j
b20vaGVscC90b3BpYy9jb20uYXJtLmRvYy5kZW4wMDAxYy9ERU4wMDAxQ19wcmluYw0KPiBpcGxl
c19vZl9hcm1fbWVtb3J5X21hcHMucGRmDQo+ID4+Pj4+PiBjaGFwdGVyIDIuMyB5b3Ugd2lsbCBm
aW5kIHRoYXQgd2hlbiBhZGRpbmcgUEEgYml0cywgeW91IGFsd2F5cyBsZWF2ZQ0KPiA+Pj4+Pj4g
c3BhY2UgZm9yIHJlc2VydmVkIHNwYWNlIGFuZCBtYXBwZWQgSU8uDQo+ID4+Pj4+DQo+ID4+Pj4+
IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXIhDQo+ID4+Pj4+DQo+ID4+Pj4+IFNvIC4uLiB3ZSBjYW4g
Zml0DQo+ID4+Pj4+DQo+ID4+Pj4+IGEpIDJHQiBhdCAyR0INCj4gPj4+Pj4gYikgMzJHQiBhdCAz
MkdCDQo+ID4+Pj4+IGMpIDUxMkdCIGF0IDUxMkdCDQo+ID4+Pj4+IGQpIDhUQiBhdCA4VEINCj4g
Pj4+Pj4gZSkgMTI4VEIgYXQgMTI4VEINCj4gPj4+Pj4NCj4gPj4+Pj4gKHRoaXMgaXMgYSBuaWNl
IHJ1bGUgb2YgdGh1bWIgaWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3RseSA6KSApDQo+ID4+Pj4+
DQo+ID4+Pj4+IFdlIHNob3VsZCBzdHJpdmUgZm9yIGRldmljZSBtZW1vcnkgKG1heHJhbV9zaXpl
IC0gcmFtX3NpemUpIHRvIGZpdA0KPiA+Pj4+PiBleGFjdGx5IGludG8gb25lIG9mIHRoZXNlIHNs
b3RzIChvdGhlcndpc2UgdGhpbmdzIGdldCBuYXN0eSkuDQo+ID4+Pj4+DQo+ID4+Pj4+IERlcGVu
ZGluZyBvbiB0aGUgcmFtX3NpemUsIHdlIG1pZ2h0IGhhdmUgc2ltcGxlciBzZXR1cHMgYW5kIGNh
bg0KPiBzdXBwb3J0DQo+ID4+Pj4+IG1vcmUgY29uZmlndXJhdGlvbnMsIG5vPw0KPiA+Pj4+Pg0K
PiA+Pj4+PiBFLmcuIHJhbV9zaXplIDw9IDM0R0IsIGRldmljZV9tZW1vcnkgPD0gNTEyR0INCj4g
Pj4+Pj4gLT4gbW92ZSByYW0gaW50byBhKSBhbmQgYikNCj4gPj4+Pj4gLT4gbW92ZSBkZXZpY2Ug
bWVtb3J5IGludG8gYykNCj4gPj4+Pg0KPiA+Pj4+IFRoZSBpc3N1ZSBpcyBtYWNodmlydCBkb2Vz
bid0IGNvbXBseSB3aXRoIHRoYXQgZG9jdW1lbnQuDQo+ID4+Pj4gQXQgdGhlIG1vbWVudCB3ZSBo
YXZlDQo+ID4+Pj4gMCAtPiAxR0IgTU1JTw0KPiA+Pj4+IDFHQiAtPiAyNTZHQiBSQU0NCj4gPj4+
PiAyNTZHQiAtPiA1MTJHQiBpcyB0aGVvcmV0aWNhbGx5IHJlc2VydmVkIGZvciBJTyBidXQgbW9z
dCBpcyBmcmVlLg0KPiA+Pj4+IDUxMkdCIC0+IDFUIGlzIHJlc2VydmVkIGZvciBFQ0FNIE1NSU8g
cmFuZ2UuIFRoaXMgaXMgdGhlIHRvcCBvZiBvdXINCj4gPj4+PiBleGlzdGluZyA0MGIgR1BBIHNw
YWNlLg0KPiA+Pj4+DQo+ID4+Pj4gV2UgZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhpcyBhZGRyZXNz
IG1hcCBkdWUgdG8gbGVnYWN5IHJlYXNvbnMuDQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBUaGFua3Ms
IGdvb2QgdG8ga25vdyENCj4gPj4+DQo+ID4+Pj4gQW5vdGhlciBxdWVzdGlvbiEgZG8geW91IGtu
b3cgaWYgaXQgd291bGQgYmUgcG9zc2libGUgdG8gaGF2ZQ0KPiA+Pj4+IGRldmljZV9tZW1vcnkg
cmVnaW9uIHNwbGl0IGludG8gc2V2ZXJhbCBkaXNjb250aW51b3VzIHNlZ21lbnRzPw0KPiA+Pj4N
Cj4gPj4+IEl0IGNhbiBiZSBpbXBsZW1lbnRlZCBmb3Igc3VyZSwgYnV0IEkgd291bGQgdHJ5IHRv
IGF2b2lkIHRoYXQsIGFzIGl0DQo+ID4+PiBtYWtlcyBjZXJ0YWluIGNvbmZpZ3VyYXRpb25zIGlt
cG9zc2libGUgKGFuZCB2ZXJ5IGVuZCB1c2VyIHVuZnJpZW5kbHkpLg0KPiA+Pj4NCj4gPj4+IEUu
Zy4gKG51bWJlcnMgY29tcGxldGVseSBtYWRlIHVwLCBidXQgaXQgc2hvdWxkIHNob3cgd2hhdCBJ
IG1lYW4pDQo+ID4+Pg0KPiA+Pj4gLW0gMjBHLG1heG1lbT0xMjBHOg0KPiA+Pj4gLT4gVHJ5IHRv
IGFkZCBhIERJTU0gd2l0aCAxMDBHIC0+IGVycm9yLg0KPiA+Pj4gLT4gQnV0IHdlIGNhbiBhZGQg
ZS5nLiB0d28gRElNTXMgd2l0aCA0MEcgYW5kIDYwRy4NCj4gPj4+DQo+ID4+PiBUaGlzIGV4cG9z
ZXMgaW50ZXJuYWwgZGV0YWlscyB0byB0aGUgZW5kIHVzZXIuIEFuZCB0aGUgZW5kIHVzZXIgaGFz
IG5vDQo+ID4+PiBpZGVhIHdoYXQgaXMgZ29pbmcgb24uDQo+ID4+Pg0KPiA+Pj4gU28gSSB0aGlu
ayB3ZSBzaG91bGQgdHJ5IG91ciBiZXN0IHRvIGtlZXAgdGhhdCBhcmVhIGNvbnNlY3V0aXZlLg0K
PiA+Pg0KPiA+PiBBY3R1YWxseSBJIGRpZG4ndCBzdWZmaWNpZW50bHkgZGV0YWlsIHRoZSBjb250
ZXh0LiBJIHdvdWxkIGxpa2UNCj4gPj4gMSkgMSBzZWdtZW50IHRvIGJlIGV4cG9zZWQgdG8gdGhl
IGVuZC11c2VyIHRocm91Z2ggc2xvdHxtYXhtZW0gc3R1ZmYNCj4gPj4gKHdoYXQgdGhpcyBzZXJp
ZXMgdGFyZ2V0cykgYW5kDQo+ID4+IDIpIGFub3RoZXIgc2VnbWVudCB1c2VkIHRvIGluc3RhbnRp
YXRlIFBDLURJTU0gZm9yIGludGVybmFsIG5lZWRzIGFzDQo+ID4+IHJlcGxhY2VtZW50IG9mIHBh
cnQgb2YgdGhlIDFHQiAtPiAyNTZHQiBzdGF0aWMgUkFNLiBUaGlzIHdhcyB0aGUgcHVycG9zZQ0K
PiA+PiBvZiBTaGFtZWVyJ3Mgb3JpZ2luYWwgc2VyaWVzDQo+ID4NCj4gPiBJIGFtIG5vdCBzdXJl
IGlmIFBDLURJTU1zIGFyZSBleGFjdGx5IHdoYXQgeW91IHdhbnQgZm9yIGludGVybmFsIHB1cnBv
c2VzLg0KPiA+DQo+ID4+DQo+ID4+IFsxXSBbUkZDIHYyIDAvNl0gaHcvYXJtOiBBZGQgc3VwcG9y
dCBmb3Igbm9uLWNvbnRpZ3VvdXMgaW92YSByZWdpb25zDQo+ID4+IGh0dHA6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9jb3Zlci85MTQ2OTQvDQo+ID4+IFRoaXMgYXBwcm9hY2ggaXMgbm90IHlldCB2
YWxpZGF0ZWQgdGhvdWdoLg0KPiA+Pg0KPiA+PiBUaGUgcmF0aW9uYWxlIGlzIHNvbWV0aW1lcyB5
b3UgbXVzdCBoYXZlICJob2xlcyIgaW4gUkFNIGFzIHNvbWUgR1BBcw0KPiA+PiBtYXRjaCByZXNl
cnZlZCBJT1ZBcyBmb3IgYXNzaWduZWQgZGV2aWNlcy4NCj4gPg0KPiA+IFNvIGlmIEkgdW5kZXJz
dGFuZCBpdCBjb3JyZWN0bHksIGFsbCB5b3Ugd2FudCBpcyBzb21lIG1lbW9yeSByZWdpb24gdGhh
dA0KPiA+IGEpIGNvbnRhaW5zIG9ubHkgaW5pdGlhbGx5IGRlZmluZWQgbWVtb3J5DQo+ID4gYikg
Y2FuIGhhdmUgc29tZSBob2xlcyBpbiBpdA0KPiA+DQo+ID4gVGhpcyBpcyBleGFjdGx5IHdoYXQg
eDg2IGFscmVhZHkgZG9lcyAocGNfbWVtb3J5X2luaXQpOiBTaW1wbHkgY29uc3RydWN0DQo+ID4g
eW91ciBvd24gbWVtb3J5IHJlZ2lvbiBsZWF2aW5nIGhvbGVzIGluIGl0Lg0KPiA+DQo+ID4NCj4g
PiBtZW1vcnlfcmVnaW9uX2luaXRfYWxpYXMocmFtX2JlbG93XzRnLCBOVUxMLCAicmFtLWJlbG93
LTRnIiwgcmFtLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBwY21zLT5iZWxvd180
Z19tZW1fc2l6ZSk7DQo+ID4gbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uKHN5c3RlbV9tZW1v
cnksIDAsIHJhbV9iZWxvd180Zyk7DQo+ID4gLi4uDQo+ID4gaWYgKHBjbXMtPmFib3ZlXzRnX21l
bV9zaXplID4gMCkNCj4gPiAgICAgbWVtb3J5X3JlZ2lvbl9pbml0X2FsaWFzKHJhbV9hYm92ZV80
ZywgTlVMTCwgInJhbS1hYm92ZS00ZyIsIHJhbSwNCj4gPiAgICAgLi4uDQo+ID4gICAgIG1lbW9y
eV9yZWdpb25fYWRkX3N1YnJlZ2lvbihzeXN0ZW1fbWVtb3J5LCAweDEwMDAwMDAwMFVMTCwNCj4g
PiAgICAgLi4uDQo+ID4NCj4gPiBUaGV5ICJpbmRpY2F0ZSIgdGhlc2UgZGlmZmVyZW50IEdQQSBh
cmVhcyB1c2luZyB0aGUgZTgyMCBtYXAgdG8gdGhlIGd1ZXN0Lg0KPiA+DQo+ID4gV291bGQgdGhh
dCBhbHNvIHdvcmsgZm9yIHlvdT8NCj4gDQo+IEkgd291bGQgdGVudGF0aXZlbHkgc2F5IHllcy4g
RWZmZWN0aXZlbHkgSSBhbSBub3Qgc3VyZSB0aGF0IGlmIHdlIHdlcmUNCj4gdG8gYWN0dWFsbHkg
cHV0IGhvbGVzIGluIHRoZSAxRy0yNTZHQiBSQU0gc2VnbWVudCwgUEMtRElNTSB3b3VsZCBiZSB0
aGUNCj4gbmF0dXJhbCBjaG9pY2UuIEFsc28gdGhlIHJlc2VydmVkIElPVkEgaXNzdWUgaW1wYWN0
cyB0aGUgZGV2aWNlX21lbW9yeQ0KPiByZWdpb24gYXJlYSBJIHRoaW5rLiBJIGFtIHNrZXB0aWNh
bCBhYm91dCB0aGUgZmFjdCB3ZSBjYW4gcHV0IGhvbGVzIGluDQo+IHN0YXRpYyBSQU0gYW5kIGRl
dmljZV9tZW1vcnkgcmVnaW9ucyBsaWtlIHRoYXQuDQoNClRoZSBmaXJzdCBhcHByb2FjaFsxXSB3
ZSBoYWQgdG8gYWRkcmVzcyB0aGUgaG9sZXMgaW4gbWVtb3J5IHdhcyB1c2luZw0KdGhlIG1lbW9y
eSBhbGlhcyB3YXkgbWVudGlvbmVkIGFib3ZlLiAgQW5kIGJhc2VkIG9uIERyZXcncyByZXZpZXcs
IHRoZQ0KcGMtZGltbSB3YXkgb2YgaGFuZGxpbmcgd2FzIGludHJvZHVjZWQuIEkgdGhpbmsgdGhl
IG1haW4gYXJndW1lbnQgd2FzIHRoYXQNCml0IHdpbGwgYmUgdXNlZnVsIHdoZW4gd2UgZXZlbnR1
YWxseSBzdXBwb3J0IGhvdHBsdWcuIEJ1dCBzaW5jZSB0aGF0IGlzIGFkZGVkDQphbnl3YXkgYXMg
cGFydCBvZiB0aGlzIHNlcmllcywgSSBhbSBub3Qgc3VyZSB3ZSBoYXZlIGFueSBvdGhlciBiZW5l
Zml0IGluDQptb2RlbGluZyBpdCBhcyBwYy1kaW1tLiBNYXkgYmUgSSBhbSBtaXNzaW5nIHNvbWV0
aGluZyBoZXJlLg0KDQpUaGFua3MsDQpTaGFtZWVyDQoNClsxXS4gaHR0cHM6Ly9saXN0cy5nbnUu
b3JnL2FyY2hpdmUvaHRtbC9xZW11LWFybS8yMDE4LTA0L21zZzAwMjQzLmh0bWwNCg0KDQo+IFRo
YW5rcyENCj4gDQo+IEVyaWMNCj4gPg0KPiA+Pg0KPiA+PiBUaGFua3MNCj4gPj4NCj4gPj4gRXJp
Yw0KPiA+Pg0KPiA+Pj4NCj4gPj4+Pg0KPiA+Pj4+IFRoYW5rcw0KPiA+Pj4+DQo+ID4+Pj4gRXJp
Yw0KPiA+Pj4NCj4gPj4+DQo+ID4NCj4gPg0K
