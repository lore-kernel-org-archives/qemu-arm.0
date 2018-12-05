Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8722263wrt;
        Tue, 4 Dec 2018 16:28:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VEqZ7bgXXCDJmzlk/YfXnOLOrRV9NbxO8m2Y3ICsIru+L5JR0iMvwMJxlxQ/1TrlHgujgU
X-Received: by 2002:a37:7003:: with SMTP id l3mr21347929qkc.80.1543969701539;
        Tue, 04 Dec 2018 16:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543969701; cv=none;
        d=google.com; s=arc-20160816;
        b=oOSZSwiIRFfrd2SHN4q58AJQyivi7Dhy16aMn4V9CjgsRd1I4YghzUbJpQ+e8sE/mb
         QPvuzHxTrzryjqbOl0UMDVIo6Sruz6aXniwDhVKWOHUMOcHaGUlHmp+AQ51EDqb9kbOq
         gezTwNjHebSPUKdEUSMFs8o1JPDIU23bpUBPtjs3zZS/oPPcuRvek63kDuXBgdnno28D
         KTRdkCm+jzxT6kGzfwYMC/LPiUaHSrRxslyqZEoyGy8nC8W+mrgilXOlZUOYPGrBpCI5
         WwLjurnkRnrhmGGQI1imM2CZDCiRlOgYSZjPEjRrSma/IIuHernA/3HxQuwdWdpYT8Db
         oq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=u5tMtxN0aQUDIm9C3RHPdAxqvIFS7KyYSUQRUeeL9rk=;
        b=O6/D5smDmzmz4nxT4aySjUReLbDIHRAt+MUUS+f7XZE28RKL/M5zNxYSR8FpFHTSZg
         +kaAlNL15sCIeKDeDiTTylTJz7mnu7n8iJxGqHkQQcYmFmtyntzY+6teCAtB2ulQG/qN
         P5GrMSrKH/OslBbyEkb0HXh6YZcUsW5Gl0Wvf7GGSuFmXww8/GffcK0c7uF4k8FxYbM0
         XJSNuAXlLu7ky0XKuVARAdFc3+r68xuTndIMf4UQX/Pw0Wp1piQdg7tXB2U1IwzVeBGU
         mbNrizjgr93dWk7FSbQuM0LBD84AwqhtH3QcLSbvLkEfR8SK0WuN122Rpz2lwVg3hHei
         9ZQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y13si6444714qti.151.2018.12.04.16.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 16:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUL37-0002Iy-2Z
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 19:28:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUL2v-0002Ik-SJ
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 19:28:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUL2o-0007vO-CA
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 19:28:06 -0500
Received: from mx7.zte.com.cn ([202.103.147.169]:34576 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUL2n-0007jS-D2; Tue, 04 Dec 2018 19:28:02 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 312D95303B61D72C8745;
	Wed,  5 Dec 2018 08:27:44 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse02.zte.com.cn with SMTP id wB50RdCv046432;
	Wed, 5 Dec 2018 08:27:39 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Wed, 5 Dec 2018 08:27:45 +0800 (CST)
Date: Wed, 5 Dec 2018 08:27:45 +0800 (CST)
X-Zmail-TransId: 2b035c071b81a845c794
X-Mailer: Zmail v1.0
Message-ID: <201812050827458661131@zte.com.cn>
In-Reply-To: <CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com>
References: CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com,
	CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wB50RdCv046432
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.169
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_V11_0/8=5D_add_pvpanic_mmio_suppor?=
 =?utf-8?q?t?=
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LGl9kBlNFTTh



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIFR1ZSwgNCBEZWMgMjAxOCBhdCAwMDo0MSwgPHBlbmcuaGFvMkB6dGUuY29tLmNuPiB3cm90
ZToKPj4KPj4gPkkgd291bGQgc3RpbGwgcHJlZmVyIHRvIHNlZSBhIG1vcmUgZGV0YWlsZWQgZXhh
bWluYXRpb24gb2Ygd2hldGhlcgo+PiA+d2UgY2FuIGRvIHRoaXMgd2l0aCBhIFBDSSBkZXZpY2Ug
YmVmb3JlIHdlIGNvbW1pdCB0byB0YWtpbmcgdGhlCj4+ID5NTUlPIHZlcnNpb24gaW50byB0aGUg
dmlydCBib2FyZC4KPj4KPj4gSSdtIHNvcnJ5IEkgdGhvdWdodCBJIGhhZCBzZW50IGFuIGVtYWls
LiB5ZXN0ZXJkYXkgd2hlbiBJIHdyb3RlIGFuIGVtYWlsIHRvCj4+IGV4cGxhaW4gdGhlIHJlYXNv
biwgSSB3YXMgaW50ZXJydXB0ZWQgYW5kIGZvcmdvdCB0byBzZW5kIGl0IG91dC4KPj4KPj4gTm93
IHRoZSBwdnBhbmljIGRldmljZSBpcyBpbXBsZW1lbnRlZCBhcyBhIG1taW8gZGV2aWNlIG9yIGFu
IEFDUEkgZGV2aWNlIGluIHRoZSBrZXJuZWwsCj4+IGFuZCBvbmx5IG9uZSBkZXZpY2UgY2FuIGJl
IHNlZW4gYXQgdGhlIHNhbWUgdGltZS4gSWYgdGhlIGtlcm5lbCBwYXJzZXMgRkRUIGZpcnN0LCB0
aGVuIHB2cGFuaWMKPj4gaXMgYSBtbWlvIGRldmljZS4gVGhlIGtlcm5lbCBwYXJzZXMgQUNQSSB0
YWJsZSBmaXJzdChhbmQgdmlydHVhbCBtYWNoaW5lIGlzIGNvbmZpZ3VyZWQgd2l0aCBBQ1BJKSwK
Pj4gYW5kIHB2cGFuaWMgIGlzIGFuIEFDUEkgZGV2aWNlLgo+PiBJZiBwdnBhbmljIGlzIGltcGxl
bWVudGVkIGFzIGEgUENJIGRldmljZSwgdGhlbiB0aGUgUENJIGRldmljZSBtdXN0IHN0aWxsIGJl
IHNlZW4gd2hlbiB0aGUgQUNQSSB0YWJsZQo+PiBpcyBmaXJzdCBwYXJzZWQgYnkgdGhlIGtlcm5l
bCwgYmVjYXVzZSBBQ1BJIGRldmljZSByZWxpZXMgb24gdGhlIG1taW8gc3BhY2Ugb2YgdGhlIFBD
SSBkZXZpY2UuCj4+IE1taW8gZGV2aWNlcyBjYW4gYmUgdGhvdWdodCBvZiBhcyBqdXN0IGFuIGFk
ZHJlc3Mgc3BhY2UgcmF0aGVyIHRoYW4gYSBkZXZpY2UgaW4gdGhlIHN0cmljdCBzZW5zZS4KPgo+
SSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQuIElmIGl0J3MgYSBQQ0kgZGV2aWNlIHRoZW4K
Pml0IGRvZXMgbm90IG5lZWQgdG8gYmUgbGlzdGVkIGluIHRoZSBkZXZpY2UgdHJlZSBvciB0aGUK
PkFDUEkgdGFibGVzIGF0IGFsbCwgYmVjYXVzZSBpdCBpcyBwcm9iZWFibGUgYnkgdGhlIGd1ZXN0
Lgo+VGhpcyBhbHNvIHNpZ25pZmljYW50bHkgc2ltcGxpZmllcyB0aGUgY2hhbmdlcyBuZWVkZWQg
aW4gUUVNVS4KPgoKSXQgaXMgcHJlY2lzZWx5IGJlY2F1c2UgUENJIGRldmljZXMgY2FuIG5vdCBi
ZSBjb250cm9sbGVkIGJ5IEZEVCBvciBBQ1BJIHRhYmxlcywgCkkgZG8gbm90IHdhbnQgdG8gaW1w
bGVtZW50IGl0IGFzIGEgcGNpIGRldmljZS4KWDg2L3B2cGFuaWMgaXMgaW1wbGVtZW50ZWQgYXMg
SVNBIGRldmljZSBpbiBRRU1VIGFuZCBBQ1BJIGRldmljZSBpbiBrZXJuZWwuIApNeSBpbXBsZW1l
bnRhdGlvbiBleHRlbmRzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB4ODYvcHZwYW5pYywgYW5kIGEg
bGFyZ2Ugb2YgeDg2L3B2cGFuaWMgCmNvZGVzIGFyZSByZXVzZWQuSWYgUENJIGRldmljZXMgYXJl
IGltcGxlbWVudGVkIGluIHFlbXUsIHRoZW4gQUNQSSBkZXZpY2VzIGFuZCBQQ0kgCmRldmljZXMg
bWF5IGFwcGVhciBzaW11bHRhbmVvdXNseSBpbiB0aGUga2VybmVsLiBUaGlzIHdvdWxkIGFkZCBi
b3RoIGRldmljZXMgdG8gdGhlIApjcmFzaCBub3RpZmllciBsaXN0LCB3aGljaCBpcyBvZGQuIEkg
d2FudCB0byBzZWUgb25seSBvbmUgZGV2aWNlIGF0IGFueSB0aW1lLiBPZiBjb3Vyc2UsIG1hbnkK
YXJjaGl0ZWN0dXJlcyBjYW4gdXNlIFBDSSBkZXZpY2VzLCBidXQgd2UgYXJlIGN1cnJlbnRseSBy
ZXVzaW5nIHg4Ni9wdnBhbmljIGNvZGUgYXMgbXVjaCAKYXMgcG9zc2libGUgaW4gcWVtdSBhbmQg
a2VybmVsICwgcmF0aGVyIHRoYW4gcmVpbXBsZW1lbnRpbmcgaXQuIEF0IHRoZSBzYW1lIHRpbWUs
IApiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGFsc28gbmVlZHMgdG8gYmUgY29uc2lkZXJlZC4KCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdnBhbmljIGluIGd1ZXN0IGtlcm5l
bApBUk06ICAgQUNQSSB0YWJsZSAgICAgICAgIGFjcGkgZGV2aWNlCiAgICAgICAgICAgIEZEVCAg
ICAgICAgICAgICAgICAgIG1taW8gZGV2aWNlICAoc3RhcnQgZ3Vlc3QgYnlwYXNzaW5nIHVlZmkp
Cng4NiAgICAgIEFDUEkgdGFibGUgICAgICAgICBhY3BpIGRldmljZQoKPj4gU2Vjb25kbHksIEkg
ZG9uJ3Qgd2FudCBpdCB0byBiZSBhIHBsdWdnYWJsZSBkZXZpY2UuIElmIHRoZSB1c2VyCj4+IGRl
bGV0ZXMgdGhlIGRldmljZSBieSBtaXN0YWtlLCBpdCBtYXkgbGVhZCB0byB1bnByZWRpY3RhYmxl
IHJlc3VsdHMuCj4KPklmIHRoZSB1c2VyIGRlbGV0ZXMgdGhlIFBDSSBkZXZpY2UgdGhleSdyZSB1
c2luZyBmb3IgdGhlaXIKPmRpc2sgb3IgbmV0d29ya2luZyB0aGlzIHdpbGwgYWxzbyBsZWFkIHRv
IHVucHJlZGljdGFibGUKPnJlc3VsdHMuIFdlIGV4cGVjdCB1c2VycyBub3QgdG8gcmFuZG9tbHkg
dW5wbHVnIHRoaW5ncyBmcm9tCj50aGVpciBzeXN0ZW0gaWYgdGhleSB3YW50IGl0IHRvIGNvbnRp
bnVlIHRvIHdvcmsuIEluIGFueQo+Y2FzZSB5b3VyIGd1ZXN0IGRyaXZlciBjYW4gZWFzaWx5IGhh
bmRsZSB0aGUgdW5wbHVnOiB0aGUKPmd1ZXN0IHdvdWxkIHRoZW4ganVzdCBsb3NlIHRoZSBhYmls
aXR5IHRvIG5vdGlmeSBvbiBwYW5pYywKPmZhbGxpbmcgYmFjayB0byBhcyBpZiB0aGUgcHZwYW5p
YyBkZXZpY2UgaGFkIG5ldmVyIGJlZW4KPnByZXNlbnQuCgpJZiB0d28gZGV2aWNlcyBjYW4gZXhp
c3Qgc2ltdWx0YW5lb3VzbHkgYnkgbW9kaWZ5aW5nIHRoZSBjb2RlLAogdGhlbiBiZWNhdXNlIEFD
UEkgZGV2aWNlcyByZWx5IG9uIGEgUENJIGRldmljZSwgaWYgUENJIGRldmljZXMgYXJlIGR5bmFt
aWNhbGx5CiB1bnBsdWdnZWQsIEFDUEkgZGV2aWNlIHdpbGwgbm90IHdvcmsgd2hlbiBwYW5pYyBp
cyB0cmlnZ2VyZWQuCgp0aGFua3MuCj4KPnRoYW5rcwo+LS0gUE1N


--=====_003_next=====--

--=====_001_next=====--

