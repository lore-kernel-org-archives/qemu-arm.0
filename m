Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4569967wrt;
        Sat, 1 Dec 2018 01:12:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VuGe+gfqRdwYtf53Z3qZZPiBX3CzPX4m3aiWaErdbu668QYBT8iDKWGQA6QjiirawovIlD
X-Received: by 2002:a81:b147:: with SMTP id p68mr9242528ywh.352.1543655536629;
        Sat, 01 Dec 2018 01:12:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543655536; cv=none;
        d=google.com; s=arc-20160816;
        b=dM2hgNjs7ERcO87uPtnz37YANVBqqysDtYxMCjJI9I58JpdC36P2MPO0Vo67FoBth8
         1JllLOeB9WqYyF4do/Fq4oY1Bi027YV/d4YkCO5nO2df/FLxxAVJXwsVlW7qmuXrZ+Ir
         nnplSwPi34+gEArHFbZiK+KGOuuB1RD9db1KsGxLCvA0dy2k4BwwAXWaDWa4KzG/NTFT
         Q6RlEq6mLsQwgTv8FRgfdX8/dCNaikPqH3aAm1/ksE4soVfklO+qexQulAZJkZ/tLTnx
         yebBEqeUImeBCqDq8Isy/LMSZO++ey7OabUWndi038kZtn/Er163mzUUP9XiPO7iOgZ9
         ldRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=Evs5URAltvu5pLzpfP0udj/wo23eDdKs2kS38vCZtxM=;
        b=TrMlSAAPm8qz1bv9AkdVrCB3GJDdPmUR37mSRPwGvHoD1ly/ydLzTul9gJDTR39Tsm
         zDHzNp+qCx0apf9Ef8McYDx8ttESkKb2I63nd2z2riyH0/SJcM7dZZ7hwPCS+K02OXDQ
         vQJNZEFLSM7JuAco0h9qZd+9xUa5nyyFQR7ijFUFUvVDRw4kbMzOOajq7Jq7bNYh8bFX
         Yb22gFsdoCEcV/AEmlXPHOYDNRdJkJ+Ec1ZjNJt+uHBP+Pc7EVy4vpm0eLci3jRdNp6s
         aRirLpQUYBFCGec0/d1HLMvAeStzM/16gMrzSATCIyAiDKYSFNbdN8ZiatZuucz8IJ/2
         ftSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b201si4689077ywa.162.2018.12.01.01.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Dec 2018 01:12:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gT1Jw-0000PI-2l
	for alex.bennee@linaro.org; Sat, 01 Dec 2018 04:12:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gT1Jm-0000P5-KP
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 04:12:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gT1Jj-0002iz-Hq
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 04:12:06 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:20118)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gT1Jj-0002ce-6y; Sat, 01 Dec 2018 04:12:03 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 9A35EDF8C1FAB07B27DF;
	Sat,  1 Dec 2018 17:11:54 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
	by mse02.zte.com.cn with SMTP id wB19BlFV032911;
	Sat, 1 Dec 2018 17:11:47 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp01[null]) by mapi (Zmail) with MAPI id mid14;
	Sat, 1 Dec 2018 17:11:55 +0800 (CST)
Date: Sat, 1 Dec 2018 17:11:55 +0800 (CST)
X-Zmail-TransId: 2b035c02505bab6a6b69
X-Mailer: Zmail v1.0
Message-ID: <201812011711555606300@zte.com.cn>
In-Reply-To: <CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com>
References: 1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn,
	1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn,
	CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wB19BlFV032911
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_V10_7/9=5D_hw/misc/pvpanic=3A_prep?=
 =?utf-8?q?aring_for_adding_configure_interface?=
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
X-TUID: keS3xe9C5r9Q



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pk9uIFdlZCwgMjggTm92IDIwMTggYXQgMDM6NTAsIFBlbmcgSGFvIDxwZW5nLmhhbzJAenRlLmNv
bS5jbj4gd3JvdGU6Cj4+Cj4+IFByZXBhcmUgZm9yIHB2cGFuaWMtbW1pbyBjb25maWd1cmUgaW50
ZXJmYWNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEhhbyA8cGVuZy5oYW8yQHp0ZS5jb20u
Y24+Cj4+IC0tLQo+PiAgaHcvYXJtL3N5c2J1cy1mZHQuYyB8ICAyICsrCj4+ICBody9hcm0vdmly
dC5jICAgICAgIHwgIDIgKysKPj4gIGh3L21pc2MvcHZwYW5pYy5jICAgfCAxMSArKysrKysrKyst
LQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj5UaGlzIGxvb2tzIHJhdGhlciBvZGQuIFRoZSBzeXNidXMtZmR0LmMgY29kZSBpcyBmb3IKPmhh
bmRsaW5nIGRldmljZXMgdGhhdCB3ZSBtdXN0IHBhc3MgdGhyb3VnaCBmcm9tIHRoZQo+aG9zdCBz
eXN0ZW0gKGluY2x1ZGluZyBwdWxsaW5nIGluIGRldmljZSB0cmVlIGZyYWdtZW50cwo+ZnJvbSB0
aGUgaG9zdCkuIFRoZSBwdnBhbmljIGRldmljZSBpc24ndCBhIGhvc3QgcGFzcwo+dGhyb3VnaCBk
ZXZpY2Ugc28gSSBkb24ndCB0aGluayBpdCBzaG91bGQgYmUgdG91Y2hpbmcKPnRoYXQgY29kZSBh
dCBhbGwuIEl0J3MganVzdCBhIHNpbXBsZSBNTUlPIGRldmljZS4KPgo+SSBzdXNwZWN0IHRoZSBy
ZWFzb24geW91J3ZlIGRvbmUgdGhpcyBpcyB0aGF0IHlvdSdyZQo+dHJ5aW5nIHRvIGdldCAiLWRl
dmljZSBwdnBhbmljIiB0byB3b3JrIG9uIHRoZSBjb21tYW5kCj5saW5lLiBJIHJlY29tbWVuZCBu
b3QgdHJ5aW5nIHRvIGdldCB0aGF0IHRvIHdvcmsuCj5NTUlPIGRldmljZXMgYXJlIG5vdCBwbHVn
Z2FibGUgZGV2aWNlcywgYW5kIC1kZXZpY2UKPmlzIG5vdCBleHBlY3RlZCB0byB3b3JrIHdpdGgg
dGhlbS4KPgp5ZXMsIEkgdXNlIC1kZXZpY2UgcHZwYW5pYy1tbWlvLiBUaGFuayB5b3UgZm9yIHBv
aW50aW5nIHRoaXMgb3V0LgogSSBhbHNvIGZlbHQgYSBsaXR0bGUgb2RkIHdoZW4gSSByZWFsaXpl
ZCBpdC4gQnV0IEkgZGlkbid0IHRoaW5rIGFib3V0IHRoZSByZWFzb24uCkkgdGhpbmsgSSBjYW4g
dXNlIGEgd2F5IGxpa2UgaW9tbXUsIGFuZCBJJ3ZlIHRob3VnaHQgYWJvdXQgaXQgaW4gZG9pbmcg
bXkgCmN1cnJlbnQgd2F5Lgp0aGFua3MuCj50aGFua3MKPi0tIFBNTQ==


--=====_003_next=====--

--=====_001_next=====--

