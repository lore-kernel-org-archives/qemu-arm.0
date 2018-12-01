Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4581495wrt;
        Sat, 1 Dec 2018 01:29:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vj+yKaSQkZjim/mQTxHwrP0Jn3w6IzJwWPnkvyuNTmJgKkjY9qtfKSPEeJLZ5a52kSQ4Y/
X-Received: by 2002:a81:29d5:: with SMTP id p204mr8934466ywp.285.1543656550286;
        Sat, 01 Dec 2018 01:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543656550; cv=none;
        d=google.com; s=arc-20160816;
        b=iLbim4TcqKdm2+uH55gnyBJVk1Szh2Y4neh/zwU9romFnPtG48stGhc9lwgyUI0vxm
         ZANK/1eYMyKpkP/7DpKUfpYEziX8clDDtXyOHNAnqjdiMrXSROugcN6rGcyU381nytT1
         BLbmvXexiuZvxvwybltobSq/DNrKTKnPq96XLfaVpIAcEG+WlS+7MCyM3jD7wOalyBPc
         S0p3a87CfX/KESxfIsQAgo9ivYE4KSI3x6OjQH6cuzCWphjE1VXB9SEjd0qnv6FVOjuP
         optpeawjcgfULztn/eiOfUhTBv3R1qQeKVnSo6Wf8GgH+w5BghLt/zl7cwvyeWxkRdxV
         kAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=cTsToknbdKp8y5HIUIiExF97PMXm4qgqz4bDwIZGBic=;
        b=iShEwZVnXrOaEuzlXYXeY43V+pXr0c1xvi0tK8vUN2Aq9JYaZP1L5wRvFxL2MJbTbG
         l2pxVFfaSUzqiXnImoYyf8OhUKLkm7UJb3zeFyJJquv5hf3adOFEA8Hmlx8ZRxkf/+HM
         2spFtMwNak8UQwQfoVZRGu3z5wJMee7/a+zhVgSvMDINS5qZH2f+4H3ZlCoLPrCA9NyJ
         8/RrCs9UjdnHGY7PNmdkfyD8kgoD0LaWQcsOhQODMEOfKgNGFhQHMXBI735n8hgkp/KB
         DDcoAPdUgugXT+7YuQayYEDJoyky6ve4A9ya5j1Kdis0fpvTQhgUY4lVYN2yVWI0YKR7
         o/xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63-v6si4682184ywe.319.2018.12.01.01.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Dec 2018 01:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gT1aH-0000OX-PA
	for alex.bennee@linaro.org; Sat, 01 Dec 2018 04:29:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gT1a5-0000O5-IE
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 04:28:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gT1a2-0005Iq-D6
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 04:28:57 -0500
Received: from mx7.zte.com.cn ([202.103.147.169]:35518 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gT1a2-0005Hz-2W; Sat, 01 Dec 2018 04:28:54 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id D08E6403367323524677;
	Sat,  1 Dec 2018 17:28:48 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
	by mse02.zte.com.cn with SMTP id wB19Sgav037074;
	Sat, 1 Dec 2018 17:28:42 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Sat, 1 Dec 2018 17:28:49 +0800 (CST)
Date: Sat, 1 Dec 2018 17:28:49 +0800 (CST)
X-Zmail-TransId: 2b035c0254511e8b328e
X-Mailer: Zmail v1.0
Message-ID: <201812011728499706543@zte.com.cn>
In-Reply-To: <CAFEAcA9Od4vjo2EeEXhP1iE_XONaK8H22L9eq1qw3w6C2nR_cQ@mail.gmail.com>
References: 1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn,
	CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com,
	20181130161449.dg2yxiac5lnk7mbb@kamzik.brq.redhat.com,
	CAFEAcA9Od4vjo2EeEXhP1iE_XONaK8H22L9eq1qw3w6C2nR_cQ@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wB19Sgav037074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.169
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_V10_7/9=5D_hw/mis?=
 =?utf-8?q?c/pvpanic=3A_preparing_foradding_configure_interface?=
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
X-TUID: mF0dsaBLEYsz



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIEZyaSwgMzAgTm92IDIwMTggYXQgMTY6MTQsIEFuZHJldyBKb25lcyA8ZHJqb25lc0ByZWRo
YXQuY29tPiB3cm90ZToKPj4KPj4gT24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMDM6NTc6MTNQTSAr
MDAwMCwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPj4gPiBPbiBGcmksIDMwIE5vdiAyMDE4IGF0IDE1
OjU2LCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOgo+PiA+
ID4gSSBzdXNwZWN0IHRoZSByZWFzb24geW91J3ZlIGRvbmUgdGhpcyBpcyB0aGF0IHlvdSdyZQo+
PiA+ID4gdHJ5aW5nIHRvIGdldCAiLWRldmljZSBwdnBhbmljIiB0byB3b3JrIG9uIHRoZSBjb21t
YW5kCj4+ID4gPiBsaW5lLiBJIHJlY29tbWVuZCBub3QgdHJ5aW5nIHRvIGdldCB0aGF0IHRvIHdv
cmsuCj4+ID4gPiBNTUlPIGRldmljZXMgYXJlIG5vdCBwbHVnZ2FibGUgZGV2aWNlcywgYW5kIC1k
ZXZpY2UKPj4gPiA+IGlzIG5vdCBleHBlY3RlZCB0byB3b3JrIHdpdGggdGhlbS4KPj4gPgo+PiA+
IElmIHlvdSBkbyB3YW50IGEgcGx1Z2dhYmxlIHB2cGFuaWMgZGV2aWNlIGZvciB0aGUgdmlydAo+
PiA+IGJvYXJkIHRoZW4geW91IHNob3VsZCBpbXBsZW1lbnQgaXQgYXMgYSBQQ0kgZGV2aWNlLAo+
PiA+IGluY2lkZW50YWxseS4KPj4gPgo+Pgo+PiBXZSdkIGhhdmUgdG8gYWxsb2NhdGUgaXQgYSBQ
Q0kgZGV2aWNlIElELCBidXQgSSBndWVzcyB0aGF0J3MgT0sgYXMKPj4gdGhlcmUgYXJlIHBsZW50
eSBvZiBJRHMgbGVmdCBmb3IgMWIzNi4gSSdtIG5vdCBzdXJlIGl0J3Mgd29ydGggaXQKPj4gdGhv
dWdoLiBQaGlsIGFza2VkIHRoYXQgdGhpcyBkZXZpY2UgYnkgdXNlciBjcmVhdGFibGUsIGJ1dCBt
YXliZQo+PiB0aGF0J3Mgbm90IG5lY2Vzc2FyeS4gTWF5YmUgd2UganVzdCBuZWVkIGEgbWFjaC12
aXJ0IGNvbXBhdCBib29sZWFuCj4+IGFuZCB0aGVuIHRvIGFsd2F5cyBwcm92aWRlIHRoaXMgZGV2
aWNlIGZvciA0LjAgYW5kIGxhdGVyIG1hY2hpbmVzPwo+Cj5ZZXMsIGlmIGl0J3MganVzdCBhbiBt
bWlvIGRldmljZSB0aGVuIHdlIHNob3VsZCBlaXRoZXI6Cj4qIGRlZmF1bHQgdG8gcHJvdmlkaW5n
IGl0LCB3aXRoIHRoZSB1c3VhbCBmbGFnIHRvIHNheSAiZG9uJ3QgY3JlYXRlCj5pbiBvbGRlciB2
aXJ0IGJvYXJkIHZlcnNpb25zIiwgYW5kIGFsc28gYSBtYWNoaW5lIHByb3BlcnR5IHRvCj5kaXNh
YmxlIGl0IG1hbnVhbGx5IChsaWtlIHdlIGRvIHdpdGggdGhlIElUUykKPiogZGVmYXVsdCB0byBu
b3QgcHJvdmlkaW5nIGl0IGF0IGFsbCwgYW5kIGhhdmUgYSBtYWNoaW5lCj5wcm9wZXJ0eSB0byBl
bmFibGUgaXQgKGxpa2Ugd2UgZG8gd2l0aCB0aGUgSU9NTVUpCj5XaGljaCBpcyBhbGwgZG9hYmxl
LCBidXQgZXZlcnkgdGltZSB3ZSBkbyB0aGF0IGl0IG1ha2VzIHRoZQo+dmlydCBib2FyZCBjb2Rl
IHRoYXQgZXh0cmEgYml0IG1vcmUgY29tcGxpY2F0ZWQgKHdlIGhhdmUKPmhhbGYgYSBkb3plbiBt
YWNoaW5lIHByb3BlcnRpZXMgb24gaXQgYWxyZWFkeSkuCj4KPlRoaXMga2luZCBvZiB0aGluZyBp
cyB3aHkgYSBQQ0kgZGV2aWNlIGlzIGNsZWFuZXIgLS0gaXQganVzdAo+d29ya3Mgb24gYW55IG1h
Y2hpbmUgd2l0aCBhIFBDSSBjb250cm9sbGVyLCBpdCBieSBkZWZhdWx0IGlzCj5zb21ldGhpbmcg
dGhhdCB0aGUgdXNlciBjYW4gcHJvdmlkZSBpZiB0aGV5IHdhbnQgdG8gYW5kIG5vdCBpZgo+dGhl
eSBkb24ndCwgYW5kIGl0J3Mgbm90IGEgY3VzdG9tIFVJIHRoYXQgbWFuYWdlbWVudCBsYXllcnMK
Pm1pZ2h0IG5lZWQgdG8gc3BlY2lhbC1jYXNlLiBUaGUgZ3Vlc3QgZG9lcyBuZWVkIHRvIGRvIGEg
Yml0Cj5vZiBQQ0kgcHJvYmluZyBhbmQgc2V0dXAgaW5pdGlhbGx5LCBidXQgdGhlbiBpdCBjYW4g
anVzdCBsZWF2ZQo+dGhlIE1NSU8gQkFSIHBlcm1hbmVudGx5IG1hcHBlZCBhbmQgd3JpdGUgdG8g
dGhhdCBhZGRyZXNzCj53aGVuIHRoZSBndWVzdCBwYW5pY3MuCj4KVXN1YWxseSwgaXQgZG9lc24n
dCBtYXR0ZXIgaWYgdGhlcmUgaXMgdGhpcyBwdnBhbmljIGRldmljZSBvciBub3QsIHNvIEkgCmhh
dmVuJ3QgY29uc2lkZXJlZCBjb25maWd1cmFiaWxpdHkgZnJvbSB0aGUgYmVnaW5uaW5nLgogSSBk
aWRuJ3QgZXhwZWN0IHlvdSB0byBzdHJvbmdseSByZWNvbW1lbmQgdGhlIHVzZSBvZiBQQ0kgZGV2
aWNlcy4gCkRvaW5nIHNvIGlzIG5vdCBqdXN0IGdvaW5nIHRvIHJvbGwgYmFjayBzb21lIG9mIHRo
ZSBjb2RlIGluIHRoZSBrZXJuZWwuLi4gCkknbGwgdGhpbmsgYWJvdXQgeW91ciBzdWdnZXN0aW9u
cy4KdGhhbmtzLgo+dGhhbmtzCi0tIFBNTQ==


--=====_003_next=====--

--=====_001_next=====--

