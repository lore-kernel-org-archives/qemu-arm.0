Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7447798wrt;
        Mon, 3 Dec 2018 16:42:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/ULFGdn8pJPDh1kulkhFqiYYxPqg1UGyH0k+OaaJ1L48E49p0EhrMr0PlqEYf+i4xCcPMy7
X-Received: by 2002:a37:af85:: with SMTP id y127mr16007926qke.352.1543884133529;
        Mon, 03 Dec 2018 16:42:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543884133; cv=none;
        d=google.com; s=arc-20160816;
        b=w03ycie+nsvSkprQAvNl5R7ItBTPioTcKwYakENfwBHepyHtGq238Luw2sw0cU/NJE
         sN/Qh9OfG6sPuOk6l8NzSR0M2ljiZbH5co82K3gA20RpdkUbeY5l9SaGh9U/MQA8RkQh
         ZGn3hXvaLBn1UlY4dI8iWhDw/bLjgGAUPMezYRHnoTVPYiCKQ4oU295oLZpz+OMJbemr
         JLOynmLCCSRfm9bNn1VHIJzItfRKWDopP9OgDXE50Nn4CrP2sisAw2JuTRs1BWMo8N9y
         2DeuxbAQyiNCgBzEA0sOyojSBJxJhYYm+ej971jtyWgG8Bo3J+ymU+llvokxGtEeMUJ5
         /sBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=QSuD7GwAVKHGjwDvQHIxJHiC15iFXvzt7McU2VKrQ6I=;
        b=XyQYtgo0WIKAAxvM2IYjsy9DZytEANty0zvpsP3xwds4fMGbpWzg4kkB5Jli0byv0M
         4vsTYFdkyczBCzcx1Ur979dicPPGDYaPnklPzxNri7z4+L4bBGNNTsd5JsMEBEwLovQ4
         SZQqDuNcTgAKopxktHkNrhisORLbxiTHn3ba+pzrZKNnELSxsywgMBmNv+ycgnlyR6Yp
         MZDhZpv8U8FGjep5Mhug8jciu1oYAeo6pfInuNYo2De6DlINn0TgTsKg979016JFCz52
         5zJ1zltkh0tsfj7MffArH93kfOZUk5tg/1fc7mluCS5PLzBdnS1wyBqYNNkSR0qZj3LU
         ix5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b48si1522400qtk.45.2018.12.03.16.42.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 16:42:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTymz-0005IX-1s
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 19:42:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTymo-0005IG-OO
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 19:42:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTymi-0003TR-V7
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 19:42:02 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:31712)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTymh-0003KR-Tk; Mon, 03 Dec 2018 19:41:56 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 100146CB5525D88C5F89;
	Tue,  4 Dec 2018 08:41:49 +0800 (CST)
Received: from kjyxapp02.zte.com.cn ([10.30.12.201])
	by mse02.zte.com.cn with SMTP id wB40filw015927;
	Tue, 4 Dec 2018 08:41:44 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Tue, 4 Dec 2018 08:41:51 +0800 (CST)
Date: Tue, 4 Dec 2018 08:41:51 +0800 (CST)
X-Zmail-TransId: 2b035c05cd4f64bd3adc
X-Mailer: Zmail v1.0
Message-ID: <201812040841510784684@zte.com.cn>
In-Reply-To: <CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
References: 1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn,
	CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wB40filw015927
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
X-TUID: ig2GgyhZDjtD



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIE1vbiwgMyBEZWMgMjAxOCBhdCAxMTowNCwgUGVuZyBIYW8gPHBlbmcuaGFvMkB6dGUuY29t
LmNuPiB3cm90ZToKPj4KPj4gVGhlIGZpcnN0IHBhdGNoZXMgYXJlIHNpbXBsZSBjbGVhbnVwczoK
Pj4gICAgICAtIHBhdGNoIDEgbW92ZSB0aGUgcHZwYW5pYyBkZXZpY2Ugd2l0aCB0aGUgJ29jbW1v
biBvYmplY3RzJyBzbyB3ZSBjb21waWxlCj4+ICAgICAgICAgICAgICAgIGl0IG9uY2UgZm9yIHRo
ZSB4ODYvYXJtL2FhcmNoNjQgYXJjaHMsCj4+ICAgICAgLSBwYXRjaCAyIHNpbXBseSByZW5hbWVz
IElTQSBmaWVsZHMvZGVmaW5pdGlvbnMgdG8gZ2VuZXJpYyBvbmVzLgo+Pgo+PiAgICAgIFRoZW4g
aW5zdGVhZCBvZiBhZGQvdXNlIHRoZSBNTUlPIHB2cGFuaWMgZGV2aWNlIGluIHRoZSB2aXJ0IG1h
Y2hpbmUgaW4gYW4KPj4gICAgICB1bmlxdWUgcGF0Y2gsIEkgc3BsaXQgaXQgaW4gdHdvIGRpc3Rp
bmN0IHBhdGNoZXM6Cj4+ICAgICAgLSBwYXRjaCAzIHVzZXMgUGVuZyBIYW8ncyB3b3JrLCBidXQg
YWRkIHRoZSBNTUlPIGludGVyZmFjZSB0byB0aGUgZXhpc3RpbmcKPj4gICAgICAgICBkZXZpY2Ug
KG5vIGxvZ2ljYWwgY2hhbmdlKS4KPj4gICAgICAtIHBhdGNoIDQgaXMgUGVuZyBIYW8ncyB3b3Jr
IGluIHRoZSB2aXJ0IG1hY2hpbmUgKG5vIGxvZ2ljYWwgY2hhbmdlKS4KPj4gICAgICAtIHBhdGNo
IDUgYWRkIHB2cGFuaWMgZGV2aWNlIGluIGFjcGkgdGFibGUgaW4gdmlydCBtYWNoaW5lCj4+ICAg
ICAgdjIgZnJvbSBQZW5nIEhhbyBpczoKPj4gICAgICBodHRwczovL2xpc3RzLmdudS5vcmcvYXJj
aGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAxOC0xMC9tc2cwMzQzMy5odG1sCj4KPkkgd291bGQgc3Rp
bGwgcHJlZmVyIHRvIHNlZSBhIG1vcmUgZGV0YWlsZWQgZXhhbWluYXRpb24gb2Ygd2hldGhlcgo+
d2UgY2FuIGRvIHRoaXMgd2l0aCBhIFBDSSBkZXZpY2UgYmVmb3JlIHdlIGNvbW1pdCB0byB0YWtp
bmcgdGhlCj5NTUlPIHZlcnNpb24gaW50byB0aGUgdmlydCBib2FyZC4KCkknbSBzb3JyeSBJIHRo
b3VnaHQgSSBoYWQgc2VudCBhbiBlbWFpbC4geWVzdGVyZGF5IHdoZW4gSSB3cm90ZSBhbiBlbWFp
bCB0byAKZXhwbGFpbiB0aGUgcmVhc29uLCBJIHdhcyBpbnRlcnJ1cHRlZCBhbmQgZm9yZ290IHRv
IHNlbmQgaXQgb3V0LgoKTm93IHRoZSBwdnBhbmljIGRldmljZSBpcyBpbXBsZW1lbnRlZCBhcyBh
IG1taW8gZGV2aWNlIG9yIGFuIEFDUEkgZGV2aWNlIGluIHRoZSBrZXJuZWwsIAphbmQgb25seSBv
bmUgZGV2aWNlIGNhbiBiZSBzZWVuIGF0IHRoZSBzYW1lIHRpbWUuIElmIHRoZSBrZXJuZWwgcGFy
c2VzIEZEVCBmaXJzdCwgdGhlbiBwdnBhbmljICAKaXMgYSBtbWlvIGRldmljZS4gVGhlIGtlcm5l
bCBwYXJzZXMgQUNQSSB0YWJsZSBmaXJzdChhbmQgdmlydHVhbCBtYWNoaW5lIGlzIGNvbmZpZ3Vy
ZWQgd2l0aCBBQ1BJKSwgCmFuZCBwdnBhbmljICBpcyBhbiBBQ1BJIGRldmljZS4KSWYgcHZwYW5p
YyBpcyBpbXBsZW1lbnRlZCBhcyBhIFBDSSBkZXZpY2UsIHRoZW4gdGhlIFBDSSBkZXZpY2UgbXVz
dCBzdGlsbCBiZSBzZWVuIHdoZW4gdGhlIEFDUEkgdGFibGUgCmlzIGZpcnN0IHBhcnNlZCBieSB0
aGUga2VybmVsLCBiZWNhdXNlIEFDUEkgZGV2aWNlIHJlbGllcyBvbiB0aGUgbW1pbyBzcGFjZSBv
ZiB0aGUgUENJIGRldmljZS4KTW1pbyBkZXZpY2VzIGNhbiBiZSB0aG91Z2h0IG9mIGFzIGp1c3Qg
YW4gYWRkcmVzcyBzcGFjZSByYXRoZXIgdGhhbiBhIGRldmljZSBpbiB0aGUgc3RyaWN0IHNlbnNl
LgoKU2Vjb25kbHksIEkgZG9uJ3Qgd2FudCBpdCB0byBiZSBhIHBsdWdnYWJsZSBkZXZpY2UuIElm
IHRoZSB1c2VyIGRlbGV0ZXMgdGhlIGRldmljZSBieSBtaXN0YWtlLCBpdCBtYXkgbGVhZCB0byB1
bnByZWRpY3RhYmxlIHJlc3VsdHMuCgp0aGFua3MuCj50aGFua3MKPi0tIFBNTQ==


--=====_003_next=====--

--=====_001_next=====--

