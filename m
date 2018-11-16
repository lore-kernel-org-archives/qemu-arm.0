Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7733897wrw;
        Thu, 15 Nov 2018 17:46:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5fSN7TcY4Qr9r5WmoJ8SFLYCBBhSC46/JEjw0XN3b2rgFmydcCefogjcfhQGafZo7+3VBjQ
X-Received: by 2002:a0c:b407:: with SMTP id u7mr8202705qve.179.1542332785087;
        Thu, 15 Nov 2018 17:46:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542332785; cv=none;
        d=google.com; s=arc-20160816;
        b=mxF/UNI1Ei5H78L8nECq2TSmrh5dMi79J4socGnFOTSpb60oq8kpG8IfhqqU6sLVGZ
         xkZMvbnfs0q2pkDyVeypLckahP9uCN1hQLJd9nkBSdzBbd+pBHqCnBtwXLw1TiN5TGUD
         8STgSq0bOZ9dyHGeO1+O5XMjLAukMtF3AMad8Kj3Ua4LD4wt7VYok1dpDL9kfdbfzBZQ
         dHX6sRlyhYcOEu8a0qtHWm5uNI+e9rXVjZT6g6mAM59QtM5/dsujizXsR1/SQi5Fs21X
         resbGpbVIHJkyDBN0HE4TKUmo4ohuWJZOz69tVP1vbufm4ujyJ3KAgFFgUar7ryK9Zej
         Isrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=wWMEd0evpzkIX/xWSW0AfbFgKPesmEED+RqK2M8TpHo=;
        b=Gfx+a3P6fA+wUs2QYAzvoWwr/r8NsLhRF+aiEs3PoCxXwefY/wSnCY1uW7hudLWKXE
         yINFNPymxvjX7HK8yhQRhlbG/Jaa4Bl/c+jlY15DvwcRfw4b8mABiWvNHWAa8dNQlr5Y
         YsdvJZefLIdjhlgR3ArOZuf/gD0L6+9QO165Y7dy3WdcPUD5IAkkbpBfZrSUkPn6ySka
         r2v+TsLH7ySPKfnW0CDsyIM7E3bl8zsqEFYoa+JYU5nSo0EoDbEDjcb2Hi7CbifvErpw
         GzxZFLRlYudMXYbO0K81gCYlKgBoGHaZ9iOTTg5nt76IWTbVwm2qtWcWFalP0NsfduCt
         4UDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j131si2076103qke.243.2018.11.15.17.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 17:46:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNTDE-0000zF-Eg
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 20:46:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTCx-0000z7-Fl
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 20:46:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTCs-0007dk-0t
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 20:46:07 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:43330 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNTCr-0007Zl-Lu; Thu, 15 Nov 2018 20:46:01 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 1F56637125DDA050C8D1;
	Fri, 16 Nov 2018 09:45:52 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
	by mse01.zte.com.cn with SMTP id wAG1jhDq063167;
	Fri, 16 Nov 2018 09:45:43 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 16 Nov 2018 09:45:42 +0800 (CST)
Date: Fri, 16 Nov 2018 09:45:42 +0800 (CST)
X-Zmail-TransId: 2b055bee2146596161c0
X-Mailer: Zmail v1.0
Message-ID: <201811160945428164241@zte.com.cn>
In-Reply-To: <20181115141003.r6imovu25ymatm4w@kamzik.brq.redhat.com>
References: 1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn,
	20181115141003.r6imovu25ymatm4w@kamzik.brq.redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <drjones@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wAG1jhDq063167
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_V6_5/6=5D_hw/arm/?=
 =?utf-8?q?virt=3A_add_pvpanic_device_invirt_acpi_table?=
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
X-TUID: MMx+tvyo+Hqh



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pj4gYWRkIHB2cGFuaWMgZGV2aWNlIGluIHZpcnQgYWNwaSB0YWJsZSwgc28gd2hlbiBrZW5yZWwg
Y29tbWFuZCBsaW5lIHVzZXMKPj4gYWNwaT1mb3JjZSwga2VybmVsIGNhbiBnZXQgaW5mbyBmcm9t
IGFjcGkgdGFibGUgaW4gYWFyY2g2NC4KClsuLi5dCgo+Pgo+PiArc3RhdGljIHZvaWQgYWNwaV9k
c2R0X2FkZF9wdnBhbmljKEFtbCAqc2NvcGUsIGNvbnN0IE1lbU1hcEVudHJ5ICpwdnBhbmljX21l
bW1hcCkKPj4gK3sKPj4gKyAgICBBbWwgKmRldiA9IGFtbF9kZXZpY2UoIlBBTkMiKTsKPgo+U2hv
dWxkbid0IHRoaXMgYmUgIlBFVlQiICgicGFuaWMgZXZlbnQiKSwgbGlrZSBpdCBpcyBmb3IgeDg2
Pwo+CnllYWgsIEkgd2lsbCBjaGFuZ2UgaXQuCj4+ICsgICAgYW1sX2FwcGVuZChkZXYsIGFtbF9u
YW1lX2RlY2woIl9ISUQiLCBhbWxfc3RyaW5nKCJRRU1VMDAwMSIpKSk7Cj4+ICsgICAgYW1sX2Fw
cGVuZChkZXYsIGFtbF9uYW1lX2RlY2woIl9VSUQiLCBhbWxfaW50KDApKSk7Cj4KPldoeSBhZGQg
X1VJRD8gQWxzbywgSSBzZWUgeDg2IGhhZCBzb21lIGlzc3VlcyB3aXRoIG5vdCBoYXZpbmcgX1NU
QSBhbmQKPnRoZW4gaGF2aW5nIGEgX1NUQSB3aXRob3V0IHRoZSBVSSBmbGFnLiBJdCBub3cgaGFz
IF9TVEE9MHhmCj4oUFJFU0VOVHxFTkFCTEVEfFVJfEZVTkNUSU9OSU5HKS4gSSdtIG5vdCBzYXlp
bmcgd2UgbmVlZCB0byBkbyB0aGF0IHRvLAo+YnV0IEknZCBsaWtlIHRvIGtub3cgaWYgaXQgd2Fz
IGNvbnNpZGVyZWQgYW5kIGRlY2lkZWQgd2UgZG9uJ3QgbmVlZCB0by4KPgpUaGUgd2F5IHRoZSBr
ZXJuZWwgY29kZSBwcm9jZXNzZXMgX1NUQSBpcyB0aGF0IGlmIF9TVEEgaXMgbm90IGZvdW5kLCB0
aGUgZGVmYXVsdCAKc2V0dGluZyBpcyAoUFJFU0VOVHxFTkFCTEVEfFVJfEZVTkNUSU9OSU5HKS4g
U28gSSB0aGluayBpdCBpcyBub3QgbmVjZXNzYXJ5CiB0byBhZGQgaXQuIEl0IGlzIG9ubHkgcGFy
c2VkIGluIHRoZSBwdnBhbmljIGRyaXZlci4gCmZvciBfVUlELCBJIHRoaW5rIGl0IGlzIHVzZWQg
Zm9yIGRldmljZSBpbmRleC4gSSBqdXN0IGZpbGwgaXQgd2l0aCAwIGJlY2F1c2UgdGhlcmUgaXMg
Cm9ubHkgb25lIHB2cGFuaWMgZGV2aWNlLgoKYnkgdGhlIHdheSwgSG93IHRvIGdldCB0aGUgdmFs
dWUgb2YgQUNQSSBjb252ZW5pZW50bHk/IGhvdyBkb3UgeW91IGdldCB0aGUgCnZhbHVlIG9mIF9T
VEE/CgpUaGFua3MuCj4+ICsKPj4gKyAgICBBbWwgKmNycyA9IGFtbF9yZXNvdXJjZV90ZW1wbGF0
ZSgpOwo+PiArICAgIGFtbF9hcHBlbmQoY3JzLCBhbWxfbWVtb3J5MzJfZml4ZWQocHZwYW5pY19t
ZW1tYXAtPmJhc2UsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
dnBhbmljX21lbW1hcC0+c2l6ZSwgQU1MX1JFQURfV1JJVEUpKTsKPj4gKwo+PiArICAgIGFtbF9h
cHBlbmQoZGV2LCBhbWxfbmFtZV9kZWNsKCJfQ1JTIiwgY3JzKSk7Cj4+ICsKPj4gKyAgICBhbWxf
YXBwZW5kKHNjb3BlLCBkZXYpOwo+PiArfQo+PiArCj4+ICBzdGF0aWMgdm9pZCBhY3BpX2RzZHRf
YWRkX3VhcnQoQW1sICpzY29wZSwgY29uc3QgTWVtTWFwRW50cnkgKnVhcnRfbWVtbWFwLAo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHVhcnRf
aXJxKQo+PiAgewo+PiBAQCAtNzcwLDYgKzc4NSw3IEBAIGJ1aWxkX2RzZHQoR0FycmF5ICp0YWJs
ZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsIFZpcnRNYWNoaW5lU3RhdGUgKnZtcykKPj4gICAg
ICBhY3BpX2RzZHRfYWRkX2NwdXMoc2NvcGUsIHZtcy0+c21wX2NwdXMpOwo+PiAgICAgIGFjcGlf
ZHNkdF9hZGRfdWFydChzY29wZSwgJm1lbW1hcFtWSVJUX1VBUlRdLAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAoaXJxbWFwW1ZJUlRfVUFSVF0gKyBBUk1fU1BJX0JBU0UpKTsKPj4gKyAgICBh
Y3BpX2RzZHRfYWRkX3B2cGFuaWMoc2NvcGUsICZtZW1tYXBbVklSVF9QVlBBTklDXSk7Cj4+ICAg
ICAgYWNwaV9kc2R0X2FkZF9mbGFzaChzY29wZSwgJm1lbW1hcFtWSVJUX0ZMQVNIXSk7Cj4+ICAg
ICAgYWNwaV9kc2R0X2FkZF9md19jZmcoc2NvcGUsICZtZW1tYXBbVklSVF9GV19DRkddKTsKPj4g
ICAgICBhY3BpX2RzZHRfYWRkX3ZpcnRpbyhzY29wZSwgJm1lbW1hcFtWSVJUX01NSU9dLAo+PiAt
LQo+PiAxLjguMy4xCj4+Cj4+Cj4KPlRoYW5rcywKPmRyZXc=


--=====_003_next=====--

--=====_001_next=====--

