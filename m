Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7738566wrw;
        Thu, 15 Nov 2018 17:52:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5dSp8ab19BHfnIrpFL9IH0NIPImS+h1hQjNqwuz0tNGUL9FC0fsmN0jpZVQ0LVBPNRVde9E
X-Received: by 2002:a37:5107:: with SMTP id f7mr8686438qkb.124.1542333179691;
        Thu, 15 Nov 2018 17:52:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542333179; cv=none;
        d=google.com; s=arc-20160816;
        b=m2JinNRI0uOvTeL0JoDM5x5Fa7AhoUS24taULo5UQEyFde70dUcMMzsyhajP5a5zcW
         Zu/K9qUIAl4JrVRW+NjRsp1kRmU9pwKSYLNWCEwxDDlJC4a8kN9iQKscPxutXciwIelo
         0PjjHYl/Tc8S0Ru7+jUTRBscrA5ZmRbCVzQa+gajVQYELM2DXDIEu7adPBOE2Cgvi/Vc
         7SxblSGLgl2cpKVjxX3te/Z9iaAOr2uwrjUCQIH63fIZlNLoZUuDXtgvNAaT4boIjWFQ
         Rx7rbS2LiNXP4k9IVzvrd29ItBHGKdSp/L3qDl70SZVuaU7jDs9FeUX7Y4U/GQEgyIum
         ifCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=QGveqr0YLJcdslbgtsRde0f0LGcpbMpDgDXhWFq6wVk=;
        b=BGYZOlmMD0gbQQO1N+7FqOttNo66YjuOFceD3iuRXauRQl8lWyyx5e13vBIGsoOZTn
         QTIu495uSpnV7qWzgkE5Vi+RyXPvNV0SmiVHmcBzAvs1/ixP/VRDjTf5Yt5Naa62+3Ag
         uceEpOmjqsZPBY0/7tsfJm8r3uT4CFYU3AazRrSEJhrsAJTsjdVIr0Lpqki2UIz9sV1n
         mzId/+SjGJi8U36sAUVrhF4MQFYqfS/XJCoVZOyv07YNPD0IxZMwJHLiZhp8+32afkE2
         jzCysMizgnVSdCkutjljWNFqJcOcuVieQ8X8Mc2UedLbAd52ojHbmo4rFF+qQ3LlQrEq
         ZcUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si4872053qvc.73.2018.11.15.17.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 17:52:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNTJb-0003GK-9o
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 20:52:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTJS-0003G0-Pw
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 20:52:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTJJ-0001yg-Tk
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 20:52:47 -0500
Received: from mx7.zte.com.cn ([202.103.147.169]:59000 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNTJI-0001vo-CJ; Thu, 15 Nov 2018 20:52:41 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id AD374AADFE76D3BE8DA8;
	Fri, 16 Nov 2018 09:52:33 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse02.zte.com.cn with SMTP id wAG1qO5d068888;
	Fri, 16 Nov 2018 09:52:24 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 16 Nov 2018 09:52:25 +0800 (CST)
Date: Fri, 16 Nov 2018 09:52:25 +0800 (CST)
X-Zmail-TransId: 2b055bee22d901825c32
X-Mailer: Zmail v1.0
Message-ID: <201811160952253214674@zte.com.cn>
In-Reply-To: <20181115142532.ppvacfmw753dfq26@kamzik.brq.redhat.com>
References: 1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn,
	20181115142532.ppvacfmw753dfq26@kamzik.brq.redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <drjones@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wAG1qO5d068888
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.169
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_V6_6/6=5D__pvpani?=
 =?utf-8?q?c_=3A_update_pvpanic_document?=
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cvki0ZHW9+A4



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiBBZGQgbW1pbyBzdXBwb3J0IGluZm8gaW4gZG9jcy9zcGVjcy9wdnBhbmljLnR4dC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUGVuZyBIYW8gPHBlbmcuaGFvMkB6dGUuY29tLmNuPgo+PiAtLS0KPj4g
IGRvY3Mvc3BlY3MvcHZwYW5pYy50eHQgfCAxMyArKysrKysrKysrKystCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZG9jcy9zcGVjcy9wdnBhbmljLnR4dCBiL2RvY3Mvc3BlY3MvcHZwYW5pYy50eHQKPj4gaW5kZXgg
YzdiYmFjYy4uNWQ4ZTlkYyAxMDA2NDQKPj4gLS0tIGEvZG9jcy9zcGVjcy9wdnBhbmljLnR4dAo+
PiArKysgYi9kb2NzL3NwZWNzL3B2cGFuaWMudHh0Cj4+IEBAIC0xLDcgKzEsNyBAQAo+PiAgUFZQ
QU5JQyBERVZJQ0UKPj4gID09PT09PT09PT09PT09Cj4+Cj4+IC1wdnBhbmljIGRldmljZSBpcyBh
IHNpbXVsYXRlZCBJU0EgZGV2aWNlLCB0aHJvdWdoIHdoaWNoIGEgZ3Vlc3QgcGFuaWMKPj4gK3B2
cGFuaWMgZGV2aWNlIGlzIGEgc2ltdWxhdGVkIGRldmljZSwgdGhyb3VnaCB3aGljaCBhIGd1ZXN0
IHBhbmljCj4+ICBldmVudCBpcyBzZW50IHRvIHFlbXUsIGFuZCBhIFFNUCBldmVudCBpcyBnZW5l
cmF0ZWQuIFRoaXMgYWxsb3dzCj4+ICBtYW5hZ2VtZW50IGFwcHMgKGUuZy4gbGlidmlydCkgdG8g
YmUgbm90aWZpZWQgYW5kIHJlc3BvbmQgdG8gdGhlIGV2ZW50Lgo+Pgo+PiBAQCAtOSw2ICs5LDEw
IEBAIFRoZSBtYW5hZ2VtZW50IGFwcCBoYXMgdGhlIG9wdGlvbiBvZiB3YWl0aW5nIGZvciBHVUVT
VF9QQU5JQ0tFRCBldmVudHMsCj4+ICBhbmQvb3IgcG9sbGluZyBmb3IgZ3Vlc3QtcGFuaWNrZWQg
UnVuU3RhdGUsIHRvIGxlYXJuIHdoZW4gdGhlIHB2cGFuaWMKPj4gIGRldmljZSBoYXMgZmlyZWQg
YSBwYW5pYyBldmVudC4KPj4KPj4gK1doZW4gcHZwYW5pYyBkZXZpY2UgaXMgaW1wbGVtZW50ZWQg
YXMgYSBJU0EgZGV2aWNlLCBpdCBzdXBwb3J0cyBJT1BPUlQKPl50aGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeYW4KPj4gK21vZGUuIElmIHB2cGFuaWMgZGV2aWNlIHN1cHBvcnRzIE1N
SU8gbW9kZSwgaXQgd2lsbCBiZSBpbXBsZW1lbnRlZCBhcwo+Cj5XaGVuIHRoZSBwdnBhbmljIGRl
dmljZSBuZWVkcyB0byB1c2UgTU1JTyBtb2RlLCAuLi4KPgpJIHdpbGwgYWRkICJTb21lIGFyY2hp
dGVjdHVyZXMgZG8gbm90IHN1cHBvcnQgaW9wb3J0LCBqdXN0IGxpa2UgYXJtLiIKPj4gK2EgU1lT
QlVTIGRldmljZS4KPj4gKwo+PiAgSVNBIEludGVyZmFjZQo+PiAgLS0tLS0tLS0tLS0tLQo+Pgo+
PiBAQCAtMTksNiArMjMsMTMgQEAgU29mdHdhcmUgc2hvdWxkIHNldCBvbmx5IGJpdHMgYm90aCBp
dHNlbGYgYW5kIHRoZSBkZXZpY2UgcmVjb2duaXplLgo+PiAgQ3VycmVudGx5LCBvbmx5IGJpdCAw
IGlzIHJlY29nbml6ZWQsIHNldHRpbmcgaXQgaW5kaWNhdGVzIGEgZ3Vlc3QgcGFuaWMKPj4gIGhh
cyBoYXBwZW5lZC4KPj4KPj4gK1NZU0JVUyBJbnRlcmZhY2UKPj4gKy0tLS0tLS0tLS0tLS0tCj4+
ICsKPj4gK0l0IGlzIGJhc2ljYWxseSB0aGUgc2FtZSBhcyBJU0EgaW50ZXJmYWNlIGV4Y2VwdCB0
aGF0IGl0IHVzZXMgTU1JTy4KPgo+VGhlIFNZU0JVUyBpbnRlcmZhY2UgaXMgc2ltaWxhciB0byB0
aGUgSVNBIGludGVyZmFjZS4uLgo+Ckkgd2lsbCBjaGFuZ2UgaXQuCj4+IFB2cGFuaWMgZXhwb3Nl
cwo+PiArYSBhZGRyZXNzIHNwYWNlIHJlZ2lvbiAweDA5MDYwMDAwLS0weDA5MDYwMDAxIGluIGFy
bSB2aXJ0IG1hY2hpbmUuCj4+ICtDdXJyZW50bHkgb25seSB0aGUgZmlyc3QgYnl0ZSBpcyB1c2Vk
Lgo+PiArCj4KPkkgd291bGQgZHJvcCB0aGUgYWJvdmUgbGluZXMuIFRoZXkncmUgbm90IGNvcnJl
Y3QgYW55d2F5LiBUaGUgcmVnaW9uIGlzCj45MDcwMDAwLTkwNzAwMDEgKGluY2x1c2l2ZSkuCnNv
cnJ5LEkgd3JvdGUgYSAgd3JvbmcgYWRkcmVzcyBzcGFuLgo+Cj4+ICBBQ1BJIEludGVyZmFjZQo+
PiAgLS0tLS0tLS0tLS0tLS0KPj4KPj4gLS0KPj4gMS44LjMuMQo+Pgo+Pgo+Cj5UaGFua3MsCj5k
cmV3


--=====_003_next=====--

--=====_001_next=====--

