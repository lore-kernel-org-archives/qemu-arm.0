Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1356732ejb;
        Mon, 20 May 2024 03:48:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWO0Lua3XvhQJsF6T/rnZXIWHmT3pp/EvZDZdZhE9mr4q7NImeVlPAstJumJPIGGy5vn9BYKOv2/fS37oZkav2gTZm/KxrY
X-Google-Smtp-Source: AGHT+IHflj/SLgh65w8f7E9hNI8LLtLtndJqYRRDmqjx98XTg2F7es7xG0Nhn68eHkLDLNeSXuzk
X-Received: by 2002:adf:cf09:0:b0:34c:a9e:97ed with SMTP id ffacd0b85a97d-3504a737783mr26584463f8f.35.1716202106128;
        Mon, 20 May 2024 03:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716202106; cv=none;
        d=google.com; s=arc-20160816;
        b=Jl3/6mh+1CCVrUyyWpIAyXBjUISXQupDwKEj0xTm9ZArWA53sPHqwjwbI6vr5/hLCi
         7HwsazaCeCf2CXOI25fen0Y3AS2+GmH826vQDyq2oEPEE5RBPb49nxasXIeSvbfMRE4H
         3xLvexpMF2Pqu419Wkftth/VkQL7TYmvVDsDDL+Jwqo5Hw8+me4cW5vE+c+zMCvFDjCo
         2+bxDlsvw1hiVSjSm6J+iMjAd+P7AMkezfy0q37c5tF2WsyplPfVgeikisrAKeHqY5uF
         LoJEB6/2qEgy4hOLWO53bL3neRnVyeoQlV+5ms+y/TgSlwPAr3CPO/0r0aao8bAyRSTK
         DbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Ul7mWqQbxiIygh2IlQHnTPclu8y6xx9y93u+3Dnny+8=;
        fh=oA8Sg+ZUpvRlZGMzEQydWETcyLsuqDK5ZfZPUqVv4kM=;
        b=G0i866PcxfqPEe/7fab0/OHzjgVA7mZDi62icLehEXIcUg5OCcetC1i3GNpKwVtzCW
         aJxaQbmFszo/trkjnrwnC98pbtmKtBxFH6OOMSRsAiDiN4iXLcer4N5ulCSkjbzoIwEp
         aBi36MXjJHnpo2jfpmDpIqa/WGzQVRtKJ+hrH15LM2aahBI7KGp+s/PTw7j163FSovnf
         IJA/aPvq8LuMA8A065dXIUUOZyLOuwHy2ExmHsx+IUne6iT7KufPc0aerqkTCE72hed+
         2ciXA7DuawDxab8nrdti7k+fBxYFwcpOS9LRgTI/WWDW3D7JyM5M6sYq6NuPuAG8bu/z
         nqXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-351a17e1840si12355903f8f.622.2024.05.20.03.48.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 03:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjZ2W3cj5z6J9xb;
	Mon, 20 May 2024 18:44:51 +0800 (CST)
Received: from lhrpeml100006.china.huawei.com (unknown [7.191.160.224])
	by mail.maildlp.com (Postfix) with ESMTPS id CC4EE140CB9;
	Mon, 20 May 2024 18:48:24 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:48:24 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 20 May 2024 11:48:24 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Nicholas Piggin <npiggin@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, Linuxarm
	<linuxarm@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	Shaoqin Huang <shahuang@redhat.com>
Subject: RE: [PATCH V9 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V9 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHaqjCk+Krm+sEOpEGrtSE0xbsEKbGfs2mAgAA2vKA=
Date: Mon, 20 May 2024 10:48:24 +0000
Message-ID: <68a66945081c444789c0381da0920b6d@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
 <20240519210620.228342-2-salil.mehta@huawei.com>
 <D1EBDKJQ19G2.7K7FS8Z9BA5D@gmail.com>
In-Reply-To: <D1EBDKJQ19G2.7K7FS8Z9BA5D@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.235]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: 9AKq7tarnBwW

SGkgTmljaywNCg0KPiAgRnJvbTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4N
Cj4gIFNlbnQ6IE1vbmRheSwgTWF5IDIwLCAyMDI0IDk6MDQgQU0NCj4gIFRvOiBTYWxpbCBNZWh0
YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gIHFl
bXUtYXJtQG5vbmdudS5vcmcNCj4gIA0KPiAgT24gTW9uIE1heSAyMCwgMjAyNCBhdCA3OjA2IEFN
IEFFU1QsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPiBLVk0gdkNQVSBjcmVhdGlvbiBpcyBkb25l
IG9uY2UgZHVyaW5nIHRoZSB2Q1BVIHJlYWxpemF0aW9uIHdoZW4gUWVtdQ0KPiAgPiB2Q1BVIHRo
cmVhZCBpcyBzcGF3bmVkLiBUaGlzIGlzIGNvbW1vbiB0byBhbGwgdGhlIGFyY2hpdGVjdHVyZXMg
YXMgb2Ygbm93Lg0KPiAgPg0KPiAgPiBIb3QtdW5wbHVnIG9mIHZDUFUgcmVzdWx0cyBpbiBkZXN0
cnVjdGlvbiBvZiB0aGUgdkNQVSBvYmplY3QgaW4gUU9NDQo+ICA+IGJ1dCB0aGUgY29ycmVzcG9u
ZGluZyBLVk0gdkNQVSBvYmplY3QgaW4gdGhlIEhvc3QgS1ZNIGlzIG5vdCBkZXN0cm95ZWQNCj4g
ID4gYXMgS1ZNIGRvZXNuJ3Qgc3VwcG9ydCB2Q1BVIHJlbW92YWwuIFRoZXJlZm9yZSwgaXRzIHJl
cHJlc2VudGF0aXZlIEtWTQ0KPiAgPiB2Q1BVIG9iamVjdC9jb250ZXh0IGluIFFlbXUgaXMgcGFy
a2VkLg0KPiAgPg0KPiAgPiBSZWZhY3RvciBhcmNoaXRlY3R1cmUgY29tbW9uIGxvZ2ljIHNvIHRo
YXQgc29tZSBBUElzIGNvdWxkIGJlIHJldXNlZA0KPiAgPiBieSB2Q1BVIEhvdHBsdWcgY29kZSBv
ZiBzb21lIGFyY2hpdGVjdHVyZXMgbGlrZXMgQVJNLCBMb29uZ3NvbiBldGMuDQo+ICA+IFVwZGF0
ZSBuZXcvb2xkIEFQSXMgd2l0aCB0cmFjZSBldmVudHMgaW5zdGVhZCBvZiBEUFJJTlRGLiBObyBm
dW5jdGlvbmFsDQo+ICBjaGFuZ2UgaXMgaW50ZW5kZWQgaGVyZS4NCj4gIA0KPiAgVGhpcyBpcyBh
IG5pY2UgY2xlYW51cCBhbmQgaGVscHMgd2l0aCBwcGMgaG90cGx1ZyBhcyB3ZWxsLg0KDQoNClRo
YW5rcyBhbmQgZ2xhZCB0aGF0IGl0IGlzIG9mIGhlbHAuDQoNCg0KPiAgDQo+ICBIYXMgdGhlcmUg
YmVlbiBhbnkgYXJjaGl0ZWN0dXJlIGNvZGUgcG9zdGVkIHlldD8NCg0KDQpZZXMsIEkgY3JlYXRl
ZCBvbmUgaW4gIEFwcmlsL2Vhcmx5IE1heS4gIEl0IGNvbnRhaW5zIGFyY2ggc3BlY2lmaWMgcGF0
Y2gtc2V0IHN0YWNrZWQgdXANCm9uIHRoZSBhcmNoIGFnbm9zdGljIHBhdGNoLXNldCBWOC4gQXJj
aCBzcGVjaWZpYyBwYXRjaC1zZXQgY29udGFpbnMgcGF0Y2hlcyBmcm9tIHRoZQ0KUkZDIFYyIEkg
ZmxvYXRlZCBsYXN0IHllYXIuIA0KDQpodHRwczovL2dpdGh1Yi5jb20vc2FsaWwtbWVodGEvcWVt
dS9jb21taXRzL3ZpcnQtY3B1aHAtYXJtdjgvcmZjLXYzLXJjMS8NCg0KDQpBcyBzdWNoLCBhIGNv
bXBsZXRlIGNvZGUgb2YgUkZDIFYyIHdhcyBwb3N0ZWQgbGFzdCB5ZWFyLiBUaGVyZSBpcyBubyBj
bGVhciBzZXBhcmF0aW9uIG9mDQphcmNoaXRlY3R1cmUgYWdub3N0aWMgYW5kIHNwZWNpZmljIHBh
dGNoLXNldCBpbiB0aGlzIHZlcnNpb24uIGFuZCBjYW4gYmUgZm91bmQgYXQgYmVsb3cNCnJlcG9z
aXRvcnkuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzA5MjYxMDA0
MzYuMjgyODQtMS1zYWxpbC5tZWh0YUBodWF3ZWkuY29tLw0KDQoNCkkgc2hhbGwgYmUgZmxvYXRp
bmcgUkZDIFYzIHNvb24gd2hpY2ggd2lsbCBoYXZlIG9ubHkgQVJNIGFyY2hpdGVjdHVyZSBzcGVj
aWZpYyBwYXJ0IGFuZA0KeWVzIHdpbGwgYWxzbyBoYXZlIFRDRyBjb2RlIGJ1dCB0aGVyZSBhcmUg
c29tZSBpc3N1ZXMgdG8gYmUgZml4ZWQgZm9yIFRDRyBhbmQgd2UgYXJlDQp3b3JraW5nIHRvd2Fy
ZHMgaXQuIEhlbmNlLCB3ZSBoYXZlIGRpc2FibGVkIFRDRyBieSBkZWZhdWx0IGZvciBub3cuDQoN
Cg0KVGhhbmtzDQpTYWxpbC4NCg0KDQoNCg0KDQoNCg0KDQoNCg0KDQoNCg0KPiAgDQo+ICBKdXN0
IGEgZmV3IG1pbm9yIHRoaW5nOg0KPiAgDQo+ICA+DQo+ICA+IFNpZ25lZC1vZmYtYnk6IFNhbGls
IE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiAgPiBSZXZpZXdlZC1ieTogR2F2aW4g
U2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gID4gVGVzdGVkLWJ5OiBWaXNobnUgUGFqanVyaSA8
dmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+DQo+ICA+IFJldmlld2VkLWJ5OiBKb25hdGhh
biBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+DQo+ICA+IFRlc3RlZC1ieTog
WGlhbmdsYWkgTGkgPGxpeGlhbmdsYWlAbG9vbmdzb24uY24+DQo+ICA+IFRlc3RlZC1ieTogTWln
dWVsIEx1aXMgPG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+DQo+ICA+IFJldmlld2VkLWJ5OiBTaGFv
cWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPg0KPiAgPiBSZXZpZXdlZC1ieTogVmlzaG51
IFBhamp1cmkgPHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiAgPiAtLS0NCj4gID4g
IGFjY2VsL2t2bS9rdm0tYWxsLmMgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLQ0KPiAgLS0tLQ0KPiAgPiAgYWNjZWwva3ZtL2t2bS1jcHVzLmggICB8IDE0ICsr
KysrKysrKw0KPiAgPiAgYWNjZWwva3ZtL3RyYWNlLWV2ZW50cyB8ICA1ICsrKy0NCj4gID4gIDMg
ZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+ICA+DQo+
ICA+IGRpZmYgLS1naXQgYS9hY2NlbC9rdm0va3ZtLWFsbC5jIGIvYWNjZWwva3ZtL2t2bS1hbGwu
YyBpbmRleA0KPiAgPiBjMGJlOWY1ZWVkLi45Y2Q3ZDY5YmRlIDEwMDY0NA0KPiAgPiAtLS0gYS9h
Y2NlbC9rdm0va3ZtLWFsbC5jDQo+ICA+ICsrKyBiL2FjY2VsL2t2bS9rdm0tYWxsLmMNCj4gID4g
QEAgLTEyOCw2ICsxMjgsNyBAQCBzdGF0aWMgUWVtdU11dGV4IGttbF9zbG90c19sb2NrOyAgI2Rl
ZmluZQ0KPiAgPiBrdm1fc2xvdHNfdW5sb2NrKCkgIHFlbXVfbXV0ZXhfdW5sb2NrKCZrbWxfc2xv
dHNfbG9jaykNCj4gID4NCj4gID4gIHN0YXRpYyB2b2lkIGt2bV9zbG90X2luaXRfZGlydHlfYml0
bWFwKEtWTVNsb3QgKm1lbSk7DQo+ICA+ICtzdGF0aWMgaW50IGt2bV9nZXRfdmNwdShLVk1TdGF0
ZSAqcywgdW5zaWduZWQgbG9uZyB2Y3B1X2lkKTsNCj4gID4NCj4gID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBrdm1fcmVzYW1wbGVfZmRfcmVtb3ZlKGludCBnc2kpICB7IEBAIC0zNDAsMTQNCj4gID4g
KzM0MSw1MyBAQCBlcnI6DQo+ICA+ICAgICAgcmV0dXJuIHJldDsNCj4gID4gIH0NCj4gID4NCj4g
ID4gK3ZvaWQga3ZtX3BhcmtfdmNwdShDUFVTdGF0ZSAqY3B1KQ0KPiAgPiArew0KPiAgPiArICAg
IHN0cnVjdCBLVk1QYXJrZWRWY3B1ICp2Y3B1Ow0KPiAgPiArDQo+ICA+ICsgICAgdHJhY2Vfa3Zt
X3BhcmtfdmNwdShjcHUtPmNwdV9pbmRleCwga3ZtX2FyY2hfdmNwdV9pZChjcHUpKTsNCj4gID4g
Kw0KPiAgPiArICAgIHZjcHUgPSBnX21hbGxvYzAoc2l6ZW9mKCp2Y3B1KSk7DQo+ICA+ICsgICAg
dmNwdS0+dmNwdV9pZCA9IGt2bV9hcmNoX3ZjcHVfaWQoY3B1KTsNCj4gID4gKyAgICB2Y3B1LT5r
dm1fZmQgPSBjcHUtPmt2bV9mZDsNCj4gID4gKyAgICBRTElTVF9JTlNFUlRfSEVBRCgma3ZtX3N0
YXRlLT5rdm1fcGFya2VkX3ZjcHVzLCB2Y3B1LCBub2RlKTsgfQ0KPiAgDQo+ICBDb3VsZCB5b3Ug
bW92ZSBrdm1fZ2V0X3ZjcHUgdXAgaGVyZSBzbyBpdCdzIG5leHQgdG8ga3ZtX3BhcmtfdmNwdSwg
YW5kDQo+ICB0aGVuIHlvdSBkb24ndCBuZWVkIHRvIGZvcndhcmQgZGVjbGFyZSBpdC4gQ2FsbCBp
dCBrdm1fdW5wYXJrX3ZjcHUoKSBmb3INCj4gIHN5bW1ldHJ5IHdpdGggcGFyay4NCj4gIA0KPiAg
VGhhbmtzLA0KPiAgTmljaw0K
