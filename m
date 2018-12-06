Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10085035wrt;
        Wed, 5 Dec 2018 18:02:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V/TGTQ9KCKnBBWyA3I1rdt40GRz4HvVqdE6rBtWCcfqeVwM/rprh0ABfT9FNLGG5ixxZ7j
X-Received: by 2002:a0c:afd1:: with SMTP id t17mr25796532qvc.93.1544061778839;
        Wed, 05 Dec 2018 18:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544061778; cv=none;
        d=google.com; s=arc-20160816;
        b=ImfY/Ot1btKYB7cfeGQ4bP33bl6q0obhGF0pSWuKOD7zX6rHFtq+HTMunx6r/2TEG+
         D7LBjWL1ZXeaH2TgxS8M0gtJt0o7mdiPnoyH7eGID/Ay9gUpJQnZEl+1EYpcytmte+KY
         IAutMEI8mvB36ghVrtxJn0IiJBWmgIrTzcJRqfK1Ozc8++7aXM4fvGzmUvlTLOx+IyUV
         kRuhI8WQpNf5ox3wu9Ieep7h+LPPkrgvGdEyBmzNrve4zS844F5z413JKnPXqc8ydF08
         o1CljIAHC1ylDZVm4eSDFG0opMNbDPqte7gut+6x1rhRg1oKpO+az9c003dj+sGhtSk2
         aJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=FpIXFVg3/4vKuHulx6CCkhI+76sDFvvLhRoqSYdfFA0=;
        b=sHqUvxmUH/zOvUSpQbaIW2JCqyoj2d/04E4fWUu0FbMwqjpiwVQnwzI1OLu300o2Me
         HxlB8i1Y7RCfGf8NZTov01fxsBhZCPVGBbqSKKTg42fjG/J8gerLNGguTpKcsDrci3/n
         Z8i0ywNVd2GsDKo9Pf5Supt5WajzAcTFsYWmFXStSKa1/ClbILnYWER8YKnFY3lLg2+n
         uuhrqf/IsoktQgxixowuPL7pSgnztLFaPLTIfcN9cIOLQlsGqrWuXL1wc/xtQEc4nzC6
         29XGNWM+uNxNrahJGD5qiXr54ict4L2MZoHtkN3RD0bFvwRb3itiPn4idaZwudcHYrqs
         OVzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t23si8638360qtp.212.2018.12.05.18.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 18:02:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUj0E-0001PA-Be
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 21:02:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUj01-0001AJ-NU
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 21:02:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUizx-0002aB-EX
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 21:02:45 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:56640)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUizw-0002Ra-Vg; Wed, 05 Dec 2018 21:02:41 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 0A646CAFD767F487121D;
	Thu,  6 Dec 2018 10:02:32 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
	by mse02.zte.com.cn with SMTP id wB622Olu032913;
	Thu, 6 Dec 2018 10:02:24 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Thu, 6 Dec 2018 10:02:31 +0800 (CST)
Date: Thu, 6 Dec 2018 10:02:31 +0800 (CST)
X-Zmail-TransId: 2b035c08833754bd99e5
X-Mailer: Zmail v1.0
Message-ID: <201812061002316241763@zte.com.cn>
In-Reply-To: <CAFEAcA8s87tB4LGaVvJNpS0RN1gQ-ZjtzOBO0mWWQamBFiTzYw@mail.gmail.com>
References: CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com,
	CAFEAcA8s87tB4LGaVvJNpS0RN1gQ-ZjtzOBO0mWWQamBFiTzYw@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wB622Olu032913
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
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
X-TUID: /mzvmDF1TdSC



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIFdlZCwgNSBEZWMgMjAxOCBhdCAwMDoyOCwgPHBlbmcuaGFvMkB6dGUuY29tLmNuPiB3cm90
ZToKPj4KPj4gPkknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kLiBJZiBpdCdzIGEgUENJIGRl
dmljZSB0aGVuCj4+ID5pdCBkb2VzIG5vdCBuZWVkIHRvIGJlIGxpc3RlZCBpbiB0aGUgZGV2aWNl
IHRyZWUgb3IgdGhlCj4+ID5BQ1BJIHRhYmxlcyBhdCBhbGwsIGJlY2F1c2UgaXQgaXMgcHJvYmVh
YmxlIGJ5IHRoZSBndWVzdC4KPj4gPlRoaXMgYWxzbyBzaWduaWZpY2FudGx5IHNpbXBsaWZpZXMg
dGhlIGNoYW5nZXMgbmVlZGVkIGluIFFFTVUuCj4+ID4KPj4KPj4gSXQgaXMgcHJlY2lzZWx5IGJl
Y2F1c2UgUENJIGRldmljZXMgY2FuIG5vdCBiZSBjb250cm9sbGVkIGJ5IEZEVCBvciBBQ1BJIHRh
YmxlcywKPj4gSSBkbyBub3Qgd2FudCB0byBpbXBsZW1lbnQgaXQgYXMgYSBwY2kgZGV2aWNlLgo+
PiBYODYvcHZwYW5pYyBpcyBpbXBsZW1lbnRlZCBhcyBJU0EgZGV2aWNlIGluIFFFTVUgYW5kIEFD
UEkgZGV2aWNlIGluIGtlcm5lbC4KPj4gTXkgaW1wbGVtZW50YXRpb24gZXh0ZW5kcyB0aGUgaW1w
bGVtZW50YXRpb24gb2YgeDg2L3B2cGFuaWMsIGFuZCBhIGxhcmdlIG9mIHg4Ni9wdnBhbmljCj4+
IGNvZGVzIGFyZSByZXVzZWQuSWYgUENJIGRldmljZXMgYXJlIGltcGxlbWVudGVkIGluIHFlbXUs
IHRoZW4gQUNQSSBkZXZpY2VzIGFuZCBQQ0kKPj4gZGV2aWNlcyBtYXkgYXBwZWFyIHNpbXVsdGFu
ZW91c2x5IGluIHRoZSBrZXJuZWwuIFRoaXMgd291bGQgYWRkIGJvdGggZGV2aWNlcyB0byB0aGUK
Pj4gY3Jhc2ggbm90aWZpZXIgbGlzdCwgd2hpY2ggaXMgb2RkLiBJIHdhbnQgdG8gc2VlIG9ubHkg
b25lIGRldmljZSBhdCBhbnkgdGltZS4KPgo+WWVzLCBjZXJ0YWlubHkgd2Ugb25seSBuZWVkIG9u
ZSBwdnBhbmljIGRldmljZS4gSWYgaXQncyBpbXBsZW1lbnRlZAo+YXMgYSBQQ0kgZGV2aWNlLCB0
aGVuIHRoYXQncyB3aGF0IGFwcGVhcnMuIFdlIGRvbid0IG5lZWQgYW5kCj53b3VsZCBub3QgaW1w
bGVtZW50IHRoZSBNTUlPIHZlcnNpb24uIE9uIHg4NiBhIHVzZXIgY291bGQKPmluIHRoZW9yeSB1
c2UgdGhlIGNvbW1hbmQgbGluZSB0byByZXF1ZXN0IGJvdGggSVNBIGFuZCBQQ0kKPnB2cGFuaWMg
ZGV2aWNlcy4gVGhhdCB3b3VsZCBub3QgYmUgdmVyeSBzZW5zaWJsZSwgYnV0IHRoZXJlCj5hcmUg
bG90cyBvZiBRRU1VIGNvbW1hbmQgbGluZXMgdGhlIHVzZXIgY2FuIHJlcXVlc3QgdGhhdAo+ZG9u
J3QgbWFrZSBzZW5zZS4KPgo+PiBPZiBjb3Vyc2UsIG1hbnkKPj4gYXJjaGl0ZWN0dXJlcyBjYW4g
dXNlIFBDSSBkZXZpY2VzLCBidXQgd2UgYXJlIGN1cnJlbnRseSByZXVzaW5nIHg4Ni9wdnBhbmlj
IGNvZGUgYXMgbXVjaAo+PiBhcyBwb3NzaWJsZSBpbiBxZW11IGFuZCBrZXJuZWwgLCByYXRoZXIg
dGhhbiByZWltcGxlbWVudGluZyBpdC4gQXQgdGhlIHNhbWUgdGltZSwKPj4gYmFja3dhcmQgY29t
cGF0aWJpbGl0eSBhbHNvIG5lZWRzIHRvIGJlIGNvbnNpZGVyZWQuCj4+Cj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwdnBhbmljIGluIGd1ZXN0IGtlcm5lbAo+PiBBUk06
ICAgQUNQSSB0YWJsZSAgICAgICAgIGFjcGkgZGV2aWNlCj4+ICAgICAgICAgICAgIEZEVCAgICAg
ICAgICAgICAgICAgIG1taW8gZGV2aWNlICAoc3RhcnQgZ3Vlc3QgYnlwYXNzaW5nIHVlZmkpCj4+
IHg4NiAgICAgIEFDUEkgdGFibGUgICAgICAgICBhY3BpIGRldmljZQo+Cj5Gb3IgQXJtLCB0aGVy
ZSBpcyBubyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGlzc3VlLCBhcyB3ZSBoYXZlCj5ub3QgeWV0
IGltcGxlbWVudGVkIG9yIHNoaXBwZWQgYW55dGhpbmcuCj4KClNvcnJ5LCB0aGUgZXhwcmVzc2lv
biBpcyBub3QgY2xlYXIgZW5vdWdoLiBJIHdhbnQgdG8gc2F5IHRoYXQgeDg2IG5lZWRzIGJhY2t3
YXJkIApjb21wYXRpYmlsaXR5IGlmIHdlIGludGVuZCB0byByZXVzZSB0aGUgY29kZSBvZiB4ODYv
cHZwYW5pYy4KCj4+ID4+IFNlY29uZGx5LCBJIGRvbid0IHdhbnQgaXQgdG8gYmUgYSBwbHVnZ2Fi
bGUgZGV2aWNlLiBJZiB0aGUgdXNlcgo+PiA+PiBkZWxldGVzIHRoZSBkZXZpY2UgYnkgbWlzdGFr
ZSwgaXQgbWF5IGxlYWQgdG8gdW5wcmVkaWN0YWJsZSByZXN1bHRzLgo+PiA+Cj4+ID5JZiB0aGUg
dXNlciBkZWxldGVzIHRoZSBQQ0kgZGV2aWNlIHRoZXkncmUgdXNpbmcgZm9yIHRoZWlyCj4+ID5k
aXNrIG9yIG5ldHdvcmtpbmcgdGhpcyB3aWxsIGFsc28gbGVhZCB0byB1bnByZWRpY3RhYmxlCj4+
ID5yZXN1bHRzLiBXZSBleHBlY3QgdXNlcnMgbm90IHRvIHJhbmRvbWx5IHVucGx1ZyB0aGluZ3Mg
ZnJvbQo+PiA+dGhlaXIgc3lzdGVtIGlmIHRoZXkgd2FudCBpdCB0byBjb250aW51ZSB0byB3b3Jr
LiBJbiBhbnkKPj4gPmNhc2UgeW91ciBndWVzdCBkcml2ZXIgY2FuIGVhc2lseSBoYW5kbGUgdGhl
IHVucGx1ZzogdGhlCj4+ID5ndWVzdCB3b3VsZCB0aGVuIGp1c3QgbG9zZSB0aGUgYWJpbGl0eSB0
byBub3RpZnkgb24gcGFuaWMsCj4+ID5mYWxsaW5nIGJhY2sgdG8gYXMgaWYgdGhlIHB2cGFuaWMg
ZGV2aWNlIGhhZCBuZXZlciBiZWVuCj4+ID5wcmVzZW50Lgo+Pgo+PiBJZiB0d28gZGV2aWNlcyBj
YW4gZXhpc3Qgc2ltdWx0YW5lb3VzbHkgYnkgbW9kaWZ5aW5nIHRoZSBjb2RlLAo+PiAgdGhlbiBi
ZWNhdXNlIEFDUEkgZGV2aWNlcyByZWx5IG9uIGEgUENJIGRldmljZSwgaWYgUENJIGRldmljZXMg
YXJlIGR5bmFtaWNhbGx5Cj4+ICB1bnBsdWdnZWQsIEFDUEkgZGV2aWNlIHdpbGwgbm90IHdvcmsg
d2hlbiBwYW5pYyBpcyB0cmlnZ2VyZWQuCj4KPklmIHNvbWVib2R5IG1vZGlmaWVzIHRoZSBjb2Rl
IHRvIFFFTVUgb3IgdGhlIGd1ZXN0IGtlcm5lbAo+c3VjaCB0aGF0IHNvbWV0aGluZyBicmVha3Ms
IHRoYXQncyB0aGVpciBpc3N1ZSB0byBkZWFsIHdpdGguCj5NeSBwcm9wb3NhbCBpcyB0aGF0IHdl
IHdvdWxkIHNoaXA6Cj4qIGEgUUVNVSB3aXRoIGEgUENJIHB2cGFuaWMgZGV2aWNlICh3aGljaCB5
b3UgY291bGQgcGx1ZyBpbgo+aWYgeW91IHdhbnRlZCBpdCkKPiogbm8gY2hhbmdlcyB0byB0aGUg
QXJtIHZpcnQgYm9hcmQsIHNvIG5vdGhpbmcgaW4gdGhlIEFDUEkKPm9yIGRldmljZSB0cmVlCj4q
IG5vICJtbWlvIHB2cGFuaWMiIGRldmljZQoKb2ssIEkgd2lsbCB0cnkgaXQuCnRoYW5rcy4KPgo+
dGhhbmtzCj4tLSBQTU0=


--=====_003_next=====--

--=====_001_next=====--

