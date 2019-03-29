Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1776131wrx;
        Fri, 29 Mar 2019 05:04:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVqoQZUAAJ1+TefqUG5HmnCxC+AlfBwehcGZdUq6m+iTM2uKShSln/foKXsdS6PkWCqNQN
X-Received: by 2002:a02:5541:: with SMTP id e62mr12832647jab.88.1553861067145;
        Fri, 29 Mar 2019 05:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553861067; cv=none;
        d=google.com; s=arc-20160816;
        b=DtyAmBnA5bCpDdBQjaB2Iuccw8Ak2yfy9LadR7eXC86yYcoj5RWXexVVG11gTM4rDG
         u2/1imF/4gtuXrEndRuwVB/O9ebPpdRuwYSPLA2ZMzpUi4VNjUvZmNZj3NxUo9D92gwm
         fhPmuY9f8vmD2GlQSlF1ePEadk4ZHBk+RBtthMLrz7hVm3jvos+L2FM3eLDiPUxOZ+Fj
         CBoWUrjXgtBO16F2DCaaQcSXnd+seBX2wqrhPN/OESKVF2HQ8nBnJW1p2Vr8lcRlOzv1
         7anjp78rb7WZ2mHuRWC6RgEQ0SwX3Uc6Yp45JFzBz4VCZbG2asV93FYUgZuV7mHHnyjO
         tgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=ClHztDPW31Ax5kI2kCU1odmMb+NrSqRbCUrd5ptbq80=;
        b=c8GWK8aFdbo/g05kHqr4iM4x2HIhX71fNtiI3wo2k5rM+x9p4IRgXrK8sHC6zt2oVm
         wPkQpMLQLTWvwFAK22AXt+ot+erJPrKyMb6f9KCXI/xSid+dE+sbA25RHSj7hRQMEOH7
         9lRwSFX+XBH3EZGzwwAhHvKMkmY7AJfATG4G6/fcCGFPLH4WQtHrVFZ+kOkaQHlKos0L
         dUmP7RcDerZS/LkDpdGulDYZ0o7DJ+M2iHtfmkCxzGa/OtQjxqKpgiq94WaXatjW71N3
         X8XhBvmqBtr25nlRhTvGyuLD8QN72zf2wHYPbd5JLFntBVGhYDwuaMPUOxJnsLYJxq+O
         3+vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si959842itk.25.2019.03.29.05.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 05:04:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:51975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9qFG-0008Oz-EK
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 08:04:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9qEg-0008As-6a
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 08:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9qEa-0006rr-SW
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 08:03:48 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45379 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9qEY-0006oq-4A; Fri, 29 Mar 2019 08:03:42 -0400
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 6B4072E082FD972A48D8;
	Fri, 29 Mar 2019 12:03:34 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.165]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Fri, 29 Mar 2019 12:03:25 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v3 04/10] hw/arm/virt: Add memory hotplug framework
Thread-Index: AQHU39O3Mq/+Q2sgSkunbfXy+12bbqYhOMWAgAFV+sA=
Date: Fri, 29 Mar 2019 12:03:25 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839338587@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-5-shameerali.kolothum.thodi@huawei.com>
	<dd71b47f-bb96-ce64-85f7-94b782a0f64e@redhat.com>
In-Reply-To: <dd71b47f-bb96-ce64-85f7-94b782a0f64e@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v3 04/10] hw/arm/virt: Add memory hotplug
 framework
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
Cc: Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JTpm5pAAT/gX

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMjggTWFyY2ggMjAxOSAxNTozOA0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUu
b3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNo
YW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc2FtZW9AbGludXguaW50ZWwuY29tOyBzZWJhc3Rp
ZW4uYm9ldWZAaW50ZWwuY29tDQo+IENjOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47
IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
MDQvMTBdIGh3L2FybS92aXJ0OiBBZGQgbWVtb3J5IGhvdHBsdWcgZnJhbWV3b3JrDQo+IA0KPiBI
aSBTaGFtZWVyLA0KPiANCj4gT24gMy8yMS8xOSAxMTo0NyBBTSwgU2hhbWVlciBLb2xvdGh1bSB3
cm90ZToNCj4gPiBGcm9tOiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+ID4N
Cj4gPiBUaGlzIHBhdGNoIGFkZHMgdGhlIHRoZSBtZW1vcnkgaG90LXBsdWcvaG90LXVucGx1ZyBp
bmZyYXN0cnVjdHVyZQ0KPiBzL3RoZSB0aGUvdGhlIChzb3JyeSBteSBmYXVsdCkNCj4gPiBpbiBt
YWNodmlydC4gSXQgaXMgc3RpbGwgbm90IGVuYWJsZWQgYXMgZGV2aWNlIG1lbW9yeSBpcyBub3Qg
eWV0DQo+ID4gcmVwb3J0ZWQgdG8gZ3Vlc3QuDQo+IHMvIHJlcG9ydGVkIHRvIGd1ZXN0IC8gZXhw
b3NlZCB0byB0aGUgZ3Vlc3QgZWl0aGVyIHRocm91Z2ggRFQgb3IgQUNQSS4NCj4gTm90ZSBldmVu
IGNvbGQtcGx1ZyB3b3VsZCBub3Qgd29yayB5ZXQuDQoNCk9rLiANCg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEt3YW5nd29vIExlZSA8a3dhbmd3b28ubGVlQHNrLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTaGFtZWVyIEtvbG90aHVtIDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5j
b20+DQo+ID4gLS0tDQo+ID4gIGRlZmF1bHQtY29uZmlncy9hcm0tc29mdG1tdS5tYWsgfCAgMyAr
KysNCj4gPiAgaHcvYXJtL3ZpcnQuYyAgICAgICAgICAgICAgICAgICB8IDUzDQo+ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Rl
ZmF1bHQtY29uZmlncy9hcm0tc29mdG1tdS5tYWsNCj4gYi9kZWZhdWx0LWNvbmZpZ3MvYXJtLXNv
ZnRtbXUubWFrDQo+ID4gaW5kZXggMmE3ZWZjMS4uNzk1Y2I4OSAxMDA2NDQNCj4gPiAtLS0gYS9k
ZWZhdWx0LWNvbmZpZ3MvYXJtLXNvZnRtbXUubWFrDQo+ID4gKysrIGIvZGVmYXVsdC1jb25maWdz
L2FybS1zb2Z0bW11Lm1haw0KPiA+IEBAIC0xNTksMyArMTU5LDYgQEAgQ09ORklHX01VU0lDUEFM
PXkNCj4gPg0KPiA+ICAjIGZvciByZWFsdmlldyBhbmQgdmVyc2F0aWxlcGINCj4gPiAgQ09ORklH
X0xTSV9TQ1NJX1BDST15DQo+ID4gKw0KPiA+ICtDT05GSUdfTUVNX0RFVklDRT15DQo+ID4gK0NP
TkZJR19ESU1NPXkNCj4gPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0
LmMNCj4gPiBpbmRleCBjZTI2NjRhLi5kMGZmMjBkIDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92
aXJ0LmMNCj4gPiArKysgYi9ody9hcm0vdmlydC5jDQo+ID4gQEAgLTYxLDYgKzYxLDggQEANCj4g
PiAgI2luY2x1ZGUgImh3L2FybS9zbW11djMuaCINCj4gPiAgI2luY2x1ZGUgImh3L2FjcGkvYWNw
aS5oIg0KPiA+ICAjaW5jbHVkZSAidGFyZ2V0L2FybS9pbnRlcm5hbHMuaCINCj4gPiArI2luY2x1
ZGUgImh3L21lbS9wYy1kaW1tLmgiDQo+ID4gKyNpbmNsdWRlICJody9tZW0vbnZkaW1tLmgiDQo+
ID4NCj4gPiAgI2RlZmluZSBERUZJTkVfVklSVF9NQUNISU5FX0xBVEVTVChtYWpvciwgbWlub3Is
IGxhdGVzdCkgXA0KPiA+ICAgICAgc3RhdGljIHZvaWQgdmlydF8jI21ham9yIyNfIyNtaW5vciMj
X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCBcDQo+ID4gQEAgLTE4MDYsNiArMTgwOCw0MiBA
QCBzdGF0aWMgY29uc3QgQ1BVQXJjaElkTGlzdA0KPiAqdmlydF9wb3NzaWJsZV9jcHVfYXJjaF9p
ZHMoTWFjaGluZVN0YXRlICptcykNCj4gPiAgICAgIHJldHVybiBtcy0+cG9zc2libGVfY3B1czsN
Cj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHZpcnRfbWVtb3J5X3ByZV9wbHVnKEhvdHBs
dWdIYW5kbGVyICpob3RwbHVnX2RldiwNCj4gRGV2aWNlU3RhdGUgKmRldiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3IgKiplcnJwKQ0KPiA+ICt7DQo+ID4gKyAg
ICBjb25zdCBib29sIGlzX252ZGltbSA9IG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiks
DQo+IFRZUEVfTlZESU1NKTsNCj4gPiArDQo+ID4gKyAgICBpZiAoZGV2LT5ob3RwbHVnZ2VkKSB7
DQo+ID4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAibWVtb3J5IGhvdHBsdWcgaXMgbm90IHN1
cHBvcnRlZCIpOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmIChpc19udmRpbW0pIHsN
Cj4gPiArICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJudmRpbW0gaXMgbm90IHlldCBzdXBwb3J0
ZWQiKTsNCj4gPiArICAgICAgICByZXR1cm47DQo+ID4gKyAgICB9DQo+IE1heWJlIHRoaXMgcGF0
Y2ggc2hvdWxkIGJlIG1vdmVkIGF0IHRoZSBlbmQgc2luY2UgZnJvbSB0aGlzIHBhdGNoDQo+IG9u
d2FyZHMsIGl0IGJlY29tZXMgcG9zc2libGUgdG8gaW5zdGFudGlhdGUgYSBESU1NIHNsb3QgKHdp
dGggY29sZC1wbHVnDQo+IHFlbXUgY29tbWFuZCBsaW5lKSB0aGF0IHdvbid0IHdvcmsgcHJvcGVy
bHkuIE9mIHdlIHNpbXBseSBkaXNhYmxlDQo+IGNvbGQtcGx1ZyBmb3IgUENESU1NIGFzIHdlbGwg
YXQgdGhlIG1vbWVudD8NCg0KT2suIEkgd2lsbCBjaGVjayB0aGlzIGFuZCBjaGFuZ2UgYWNjb3Jk
aW5nbHkuDQoNClRoYW5rcywNClNoYW1lZXINCg0KPiBUaGFua3MNCj4gDQo+IEVyaWMNCj4gPiAr
DQo+ID4gKyAgICBwY19kaW1tX3ByZV9wbHVnKFBDX0RJTU0oZGV2KSwgTUFDSElORShob3RwbHVn
X2RldiksIE5VTEwsDQo+IGVycnApOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB2
aXJ0X21lbW9yeV9wbHVnKEhvdHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+
ID4gK3sNCj4gPiArICAgIFZpcnRNYWNoaW5lU3RhdGUgKnZtcyA9IFZJUlRfTUFDSElORShob3Rw
bHVnX2Rldik7DQo+ID4gKyAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsNCj4gPiArDQo+ID4g
KyAgICBwY19kaW1tX3BsdWcoUENfRElNTShkZXYpLCBNQUNISU5FKHZtcyksICZsb2NhbF9lcnIp
Ow0KPiA+ICsNCj4gPiArICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfZGV2aWNlX3ByZV9wbHVn
X2NiKEhvdHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VTdGF0ZSAqZGV2LA0KPiBFcnJvciAqKmVy
cnApDQo+ID4gK3sNCj4gPiArICAgIGlmIChvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkZXYp
LCBUWVBFX1BDX0RJTU0pKSB7DQo+ID4gKyAgICAgICAgdmlydF9tZW1vcnlfcHJlX3BsdWcoaG90
cGx1Z19kZXYsIGRldiwgZXJycCk7DQo+ID4gKyAgICB9DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0
YXRpYyB2b2lkIHZpcnRfbWFjaGluZV9kZXZpY2VfcGx1Z19jYihIb3RwbHVnSGFuZGxlciAqaG90
cGx1Z19kZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBE
ZXZpY2VTdGF0ZSAqZGV2LCBFcnJvcg0KPiAqKmVycnApDQo+ID4gIHsNCj4gPiBAQCAtMTgxNywx
MiArMTg1NSwyMyBAQCBzdGF0aWMgdm9pZA0KPiB2aXJ0X21hY2hpbmVfZGV2aWNlX3BsdWdfY2Io
SG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgU1lTX0JVU19ERVZJQ0UoZGV2KSk7DQo+ID4gICAgICAgICAgfQ0KPiA+
ICAgICAgfQ0KPiA+ICsgICAgaWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZ
UEVfUENfRElNTSkpIHsNCj4gPiArICAgICAgICB2aXJ0X21lbW9yeV9wbHVnKGhvdHBsdWdfZGV2
LCBkZXYsIGVycnApOw0KPiA+ICsgICAgfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9p
ZCB2aXJ0X21hY2hpbmVfZGV2aWNlX3VucGx1Z19yZXF1ZXN0X2NiKEhvdHBsdWdIYW5kbGVyDQo+
ICpob3RwbHVnX2RldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRGV2aWNlU3RhdGUgKmRldiwgRXJyb3INCj4gKiplcnJwKQ0KPiA+ICt7DQo+ID4gKyAg
ICBlcnJvcl9zZXRnKGVycnAsICJkZXZpY2UgdW5wbHVnIHJlcXVlc3QgZm9yIHVuc3VwcG9ydGVk
IGRldmljZSINCj4gPiArICAgICAgICAgICAgICAgIiB0eXBlOiAlcyIsIG9iamVjdF9nZXRfdHlw
ZW5hbWUoT0JKRUNUKGRldikpKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBIb3RwbHVnSGFu
ZGxlciAqdmlydF9tYWNoaW5lX2dldF9ob3RwbHVnX2hhbmRsZXIoTWFjaGluZVN0YXRlDQo+ICpt
YWNoaW5lLA0KPiA+DQo+IERldmljZVN0YXRlICpkZXYpDQo+ID4gIHsNCj4gPiAtICAgIGlmIChv
YmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX1NZU19CVVNfREVWSUNFKSkgew0K
PiA+ICsgICAgaWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZUEVfU1lTX0JV
U19ERVZJQ0UpIHx8DQo+ID4gKyAgICAgICAob2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1QoZGV2
KSwgVFlQRV9QQ19ESU1NKSkpIHsNCj4gPiAgICAgICAgICByZXR1cm4gSE9UUExVR19IQU5ETEVS
KG1hY2hpbmUpOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gQEAgLTE4ODYsNyArMTkzNSw5IEBAIHN0
YXRpYyB2b2lkIHZpcnRfbWFjaGluZV9jbGFzc19pbml0KE9iamVjdENsYXNzDQo+ICpvYywgdm9p
ZCAqZGF0YSkNCj4gPiAgICAgIG1jLT5rdm1fdHlwZSA9IHZpcnRfa3ZtX3R5cGU7DQo+ID4gICAg
ICBhc3NlcnQoIW1jLT5nZXRfaG90cGx1Z19oYW5kbGVyKTsNCj4gPiAgICAgIG1jLT5nZXRfaG90
cGx1Z19oYW5kbGVyID0gdmlydF9tYWNoaW5lX2dldF9ob3RwbHVnX2hhbmRsZXI7DQo+ID4gKyAg
ICBoYy0+cHJlX3BsdWcgPSB2aXJ0X21hY2hpbmVfZGV2aWNlX3ByZV9wbHVnX2NiOw0KPiA+ICAg
ICAgaGMtPnBsdWcgPSB2aXJ0X21hY2hpbmVfZGV2aWNlX3BsdWdfY2I7DQo+ID4gKyAgICBoYy0+
dW5wbHVnX3JlcXVlc3QgPSB2aXJ0X21hY2hpbmVfZGV2aWNlX3VucGx1Z19yZXF1ZXN0X2NiOw0K
PiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgdmlydF9pbnN0YW5jZV9pbml0KE9iamVjdCAq
b2JqKQ0KPiA+DQo=
