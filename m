Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2507555wrt;
        Thu, 18 Oct 2018 09:07:47 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62yHzJ+DXVGe9V4o4x41OMPU7MyKjw7ANohMRvMKT2TwZ474x0r3gj0JQ902HaYIBY8Edal
X-Received: by 2002:a37:d909:: with SMTP id u9-v6mr29443972qki.140.1539878867041;
        Thu, 18 Oct 2018 09:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539878867; cv=none;
        d=google.com; s=arc-20160816;
        b=S21VZEG67F1S/kq/3LYy/V8hnN51DXxSKMbjqcUNTGrNHKGmqL0Hf/cwf8DFsdNZVN
         SUmrc82Uo9dMME4N1ToIqZm0nLCM7XGqONmQEDMHxDSLdoMNqkf6xp1rbN76Bf1qKJsN
         cgwGbH4JkwureLfU6PnGUmR/+lIED2h0Z99YNY9JfHOEMTv0ZNwy+J/zJLdzhrUBxCcQ
         HBQtD3YBgY0P8SBpl83Y/t87GuquxVwJ54tEyZqKzcrGJoEEkUH1H7ISSGVcmt01tBby
         yY5vSpiuaeFxCBROygTFIx3cE/kq/j/OElQdQDRaWPCMQ5WCfNxImYElgGxcXCTVnBct
         CybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=GGsfT1vXdyHGUfAVQtXJwx1GnZEQytGSU5SK0i3eCGs=;
        b=pfSMuKf9OByPWzUZu21W3TkrA1LY27falA8EhL2BBXiW54O4Qw39sg/S/0wz+5937g
         EXT4pMgfYL1/X/ALXQB/ap0XRDkaIRcRktSzDFlYd4PoBR6Jb4PXiKUVJXCxxmjUcW1d
         5NC7mRJdcWijohTqs8BjQuvU0vmgDaEg5RiorON9D8cGYJiqLKIvK5LZxfroxqI5fQ/h
         CsAqSQLRl3KtdhCaYyNxF71plJfe09zxq7Z4UMob1DwrmV3huVE1nKbjav3f/rEeofJv
         mfBYT96rbxkAXDw6AE9m8rYewn2luEjT/w9A3Ltg2dSEsMvbXDzvd3aWm02k9sy9hG3p
         Rdzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e17-v6si3459949qto.121.2018.10.18.09.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 09:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDApt-0002D4-Oh
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 12:07:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gDApm-00028q-1M
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gDAph-0000PW-Na
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:07:38 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:10326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gDApe-0000Mn-Pv; Thu, 18 Oct 2018 12:07:31 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 8CAA96D0434904756DB7;
	Fri, 19 Oct 2018 00:07:26 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse01.zte.com.cn with SMTP id w9IG7I8t094438;
	Fri, 19 Oct 2018 00:07:18 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 19 Oct 2018 00:07:21 +0800 (CST)
Date: Fri, 19 Oct 2018 00:07:21 +0800 (CST)
X-Zmail-TransId: 2b035bc8afb95a4ad67d
X-Mailer: Zmail v1.0
Message-ID: <201810190007210020709@zte.com.cn>
In-Reply-To: <CAFEAcA-WC1vRmGH0t87hHFtMNTRW16xYy5R4kqickohNhECOPw@mail.gmail.com>
References: 20181018130434.23237-1-philmd@redhat.com,
	20181018130434.23237-5-philmd@redhat.com,
	CAFEAcA-WC1vRmGH0t87hHFtMNTRW16xYy5R4kqickohNhECOPw@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn w9IG7I8t094438
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_v3_4/4=5D_hw/arm/virt=3A_Use_the_p?=
 =?utf-8?q?vpanic_device?=
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
Cc: hutao@cn.fujitsu.com, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org, wency@cn.fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NxqOnvzaCu7B



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIDE4IE9jdG9iZXIgMjAxOCBhdCAxNDowNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPiB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogUGVuZyBIYW8gPHBlbmcu
aGFvMkB6dGUuY29tLmNuPgo+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4+IFtQTUQ6IFVzZSBUWVBFX1BWUEFOSUMgZGVmaW5pdGlv
biwgc3BsaXQgaW4gMiBwYXRjaGVzXQo+PiAtLS0KPj4gIGRlZmF1bHQtY29uZmlncy9hcm0tc29m
dG1tdS5tYWsgfCAgMiArLQo+PiAgaHcvYXJtL3ZpcnQuYyAgICAgICAgICAgICAgICAgICB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKwo+PiAgaW5jbHVkZS9ody9hcm0vdmlydC5oICAgICAgICAg
ICB8ICAxICsKPj4gIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZGVmYXVsdC1jb25maWdzL2FybS1zb2Z0bW11Lm1hayBi
L2RlZmF1bHQtY29uZmlncy9hcm0tc29mdG1tdS5tYWsKPj4gaW5kZXggMjQyMDQ5MWFhYy4uZGVm
MDdmYTA5NSAxMDA2NDQKPj4gLS0tIGEvZGVmYXVsdC1jb25maWdzL2FybS1zb2Z0bW11Lm1hawo+
PiArKysgYi9kZWZhdWx0LWNvbmZpZ3MvYXJtLXNvZnRtbXUubWFrCj4+IEBAIC00Myw3ICs0Myw3
IEBAIENPTkZJR19VU0JfTVVTQj15Cj4+ICBDT05GSUdfVVNCX0VIQ0lfU1lTQlVTPXkKPj4gIENP
TkZJR19QTEFURk9STV9CVVM9eQo+PiAgQ09ORklHX1ZJUlRJT19NTUlPPXkKPj4gLQo+PiArQ09O
RklHX1BWUEFOSUM9eQo+PiAgQ09ORklHX0FSTTExTVBDT1JFPXkKPj4gIENPTkZJR19BOU1QQ09S
RT15Cj4+ICBDT05GSUdfQTE1TVBDT1JFPXkKPj4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LmMg
Yi9ody9hcm0vdmlydC5jCj4+IGluZGV4IDlmNjc3ODI1ZjkuLjQwNDY5ZTY3ODUgMTAwNjQ0Cj4+
IC0tLSBhL2h3L2FybS92aXJ0LmMKPj4gKysrIGIvaHcvYXJtL3ZpcnQuYwo+PiBAQCAtNTksNiAr
NTksNyBAQAo+PiAgI2luY2x1ZGUgInFhcGkvdmlzaXRvci5oIgo+PiAgI2luY2x1ZGUgInN0YW5k
YXJkLWhlYWRlcnMvbGludXgvaW5wdXQuaCIKPj4gICNpbmNsdWRlICJody9hcm0vc21tdXYzLmgi
Cj4+ICsjaW5jbHVkZSAiaHcvbWlzYy9wdnBhbmljLmgiCj4+Cj4+ICAjZGVmaW5lIERFRklORV9W
SVJUX01BQ0hJTkVfTEFURVNUKG1ham9yLCBtaW5vciwgbGF0ZXN0KSBcCj4+ICAgICAgc3RhdGlj
IHZvaWQgdmlydF8jI21ham9yIyNfIyNtaW5vciMjX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9j
LCBcCj4+IEBAIC0xNDAsNiArMTQxLDcgQEAgc3RhdGljIGNvbnN0IE1lbU1hcEVudHJ5IGExNW1l
bW1hcFtdID0gewo+PiAgICAgIFtWSVJUX1VBUlRdID0gICAgICAgICAgICAgICB7IDB4MDkwMDAw
MDAsIDB4MDAwMDEwMDAgfSwKPj4gICAgICBbVklSVF9SVENdID0gICAgICAgICAgICAgICAgeyAw
eDA5MDEwMDAwLCAweDAwMDAxMDAwIH0sCj4+ICAgICAgW1ZJUlRfRldfQ0ZHXSA9ICAgICAgICAg
ICAgIHsgMHgwOTAyMDAwMCwgMHgwMDAwMDAxOCB9LAo+PiArICAgIFtWSVJUX1BWUEFOSUNfTU1J
T10gPSAgICAgICB7IDB4MDkwMjAwMTgsIDB4MDAwMDAwMDIgfSwKPgo+VGhpcyBzaG91bGRuJ3Qg
YmUgaW4gdGhlIHNhbWUgcGh5c2ljYWwgNjRLIHBhZ2UgYXMgdGhlIHByZWNlZGluZyBkZXZpY2U6
Cj53ZSBjYXJlZnVsbHkga2VlcCB0aGVtIGFsbCBzZXBhcmF0ZSBzbyB0aGF0IHRoZSBndWVzdCBj
YW4gZ2l2ZSB0aGVtCj5zZXBhcmF0ZSBNTVUgcGVybWlzc2lvbnMgaWYgaXQgd2FudHMuCj4KSSBu
ZXZlciBub3RpY2UgdGhhdC4gVGhhbmtzLgoKPj4gICAgICBbVklSVF9HUElPXSA9ICAgICAgICAg
ICAgICAgeyAweDA5MDMwMDAwLCAweDAwMDAxMDAwIH0sCj4+ICAgICAgW1ZJUlRfU0VDVVJFX1VB
UlRdID0gICAgICAgIHsgMHgwOTA0MDAwMCwgMHgwMDAwMTAwMCB9LAo+PiAgICAgIFtWSVJUX1NN
TVVdID0gICAgICAgICAgICAgICB7IDB4MDkwNTAwMDAsIDB4MDAwMjAwMDAgfSwKPj4gQEAgLTgw
Miw2ICs4MDQsMjMgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2dwaW8oY29uc3QgVmlydE1hY2hpbmVT
dGF0ZSAqdm1zLCBxZW11X2lycSAqcGljKQo+PiAgICAgIGdfZnJlZShub2RlbmFtZSk7Cj4+ICB9
Cj4+Cj4+ICtzdGF0aWMgdm9pZCBjcmVhdGVfcHZwYW5pY19kZXZpY2UoY29uc3QgVmlydE1hY2hp
bmVTdGF0ZSAqdm1zKQo+PiArewo+PiArICAgIGNoYXIgKm5vZGVuYW1lOwo+PiArICAgIGh3YWRk
ciBiYXNlID0gdm1zLT5tZW1tYXBbVklSVF9QVlBBTklDX01NSU9dLmJhc2U7Cj4+ICsgICAgaHdh
ZGRyIHNpemUgPSB2bXMtPm1lbW1hcFtWSVJUX1BWUEFOSUNfTU1JT10uc2l6ZTsKPj4gKwo+PiAr
ICAgIHN5c2J1c19jcmVhdGVfc2ltcGxlKFRZUEVfUFZQQU5JQywgYmFzZSwgTlVMTCk7Cj4+ICsK
Pj4gKyAgICBub2RlbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiL3B2cGFuaWMtbW1pb0AlIiBQUkl4
NjQsIGJhc2UpOwo+PiArICAgIHFlbXVfZmR0X2FkZF9zdWJub2RlKHZtcy0+ZmR0LCBub2RlbmFt
ZSk7Cj4+ICsgICAgcWVtdV9mZHRfc2V0cHJvcF9zdHJpbmcodm1zLT5mZHQsIG5vZGVuYW1lLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb21wYXRpYmxlIiwgInB2cGFuaWMsbW1p
byIpOwo+PiArICAgIHFlbXVfZmR0X3NldHByb3Bfc2l6ZWRfY2VsbHModm1zLT5mZHQsIG5vZGVu
YW1lLCAicmVnIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIsIGJhc2Us
IDIsIHNpemUpOwo+Cj5UaGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSBhbiBvZmZpY2lhbCBEVCBiaW5k
aW5nLiBJdCB3b3VsZCBuZWVkIHRvIGJlCj5hY2NlcHRlZCB1cHN0cmVhbSAoaWUgaW4gdGhlIGtl
cm5lbCdzIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy8pCj5iZWZvcmUgd2UgY291
bGQgYWRkIHRoZSBkZXZpY2UgaW4gUUVNVS4KVGhlIHBhdGNoIEkgc3VibWl0dGVkIHRvIHRoZSBr
ZXJuZWwgYWJvdXQgcHZwYW5pYy1tbWlvIGRyaXZlciBpcyBhbHNvIHBvaW50aW5nIG91dCB0aGUg
c2FtZSBwcm9ibGVtLgpJIGNhbiB1c2UgInFlbXUscHZwYW5pYy1tbWlvIiA/Cj4KPldoYXQgYWJv
dXQgYW4gQUNQSSB0YWJsZSBlbnRyeT8KSSBtdXN0IGFkZCBhbiBBQ1BJIHRhYmxlIGVudHJ5IGZv
ciBwdnBhbmljLW1taW8/IApJIHRlc3RlZCB3aGV0aGVyIGFkZGluZyBhIEFDUEkgZW50cnkgZG9l
cyBub3Qgc2VlbSB0byBhZmZlY3QgdGhlIGZ1bmN0aW9uIG9mIHB2cGFuaWMuCm5vdyBJIGVtdWxh
dGUgdGhlIHB2cGFuaWMtbW1pbyBkZXZpY2UgYXMgYSBzeXNidXMgZGV2aWNlIGFuZCB1c2UgZmR0
IHRvIHNlbmQgCm1taW8gYWRkcmVzcyBpbmZvLgo+RG9lcyB0aGlzIHJlYWxseSBuZWVkIHRvIGJl
IGFuIE1NSU8gZGV2aWNlLCByYXRoZXIgdGhhbiBhIFBDSSBkZXZpY2U/Cj5CZWluZyBhIFBDSSBk
ZXZpY2Ugd291bGQgYXZvaWQgYWxsIG9mIHRoZXNlIGlzc3VlczoKPiogaGF2aW5nIHRvIHNwZWNp
ZnkgYSBkdCBiaW5kaW5nCj4qIGhhdmluZyB0byBzcGVjaWZ5IGFuIEFDUEkgYmluZGluZwo+KiBo
YXZpbmcgdG8gZWl0aGVyIGhhdmUgdGhlIHRoaW5nIGFsd2F5cyBwcmVzZW50LCBvciBzb21lIGN1
c3RvbQo+d2F5IGZvciB0aGUgdXNlciB0byBlbmFibGUvZGlzYWJsZSBpdAo+cGx1cyBpdCBtZWFu
cyBpdCdzIGF2YWlsYWJsZSBmb3Igb3RoZXIgYm9hcmRzIGFuZCBhcmNoaXRlY3R1cmVzIHRoYW4K
Pmp1c3QgdGhlIEFybSB2aXJ0IGJvYXJkLgo+CkkgdGhvdWdodCBhYm91dCAgcGNpIGRldmljZSAs
IElmIHNvLCBpdCBzZWVtcyB0aGF0IEkgY2FuIG9ubHkgdXNlIEFDUEkgdG8gcGFzcyBNTUlPIGlu
Zm9ybWF0aW9uLCBqdXN0IGxpa2UgCnB2cGFuaWMgaXNhIGRldmljZSAgZGlkLiBJIGRvbid0IHdh
bnQgdG8gcmVseSBvbiBBQ1BJIGxpa2UgcHZwYW5pYyBpc2EgZGV2aWNlIC4gSSBjYW4gdXNlIGZk
dCB0byB0cmFuc21pdCBtbWlvIGluZm8gdG8ga2VybmVsIGZvciBwY2kgZGV2aWNlID8KYW5vdGhl
ciByZWFzb24sIHRoZSBmdW5jdGlvbiBvZiBwdnBhbmljIGlzIHNpbXBsZS4KClRoYW5rcy4KPkkn
ZCBhbHNvIGxpa2Ugc29tZSBjb25maXJtYXRpb24gZnJvbSBmb2xrcyBtb3JlIGZhbWlsaWFyIHdp
dGggdGhlCj5jdXJyZW50IHN0YXRlIG9mIHRoZSBhcnQgaW4gZ3Vlc3QtdG8tbWFuYWdlbWVudC1s
YXllciBjb21tdW5pY2F0aW9uCj50aGF0IHB2cGFuaWMgaXMgc3RpbGwgdGhlIHJlY29tbWVuZGVk
IHdheSB0byBhY2hpZXZlIHRoaXMgZ29hbCwKPmFuZCBoYXNuJ3QgYmVlbiBvYnNvbGV0ZWQgYnkg
c29tZXRoaW5nIGVsc2UuCj4KPnRoYW5rcwo+LS0gUE1N


--=====_003_next=====--

--=====_001_next=====--

