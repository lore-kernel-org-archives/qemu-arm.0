Received: by 10.28.71.27 with SMTP id u27csp1004519wma;
        Fri, 26 Jan 2018 10:15:47 -0800 (PST)
X-Google-Smtp-Source: AH8x226IHG3C8CrGniIt5m9RypWyKJnVOfuhrokTtsOVndAeoYIaHBSEKSWeaeEyLU05Eq4hvk08
X-Received: by 10.129.105.8 with SMTP id e8mr11747679ywc.505.1516990547020;
        Fri, 26 Jan 2018 10:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516990547; cv=none;
        d=google.com; s=arc-20160816;
        b=EBiO7eZhFDLbCxz2kZRwEU7xq60/RHTrJHDxJ2mVO64RegXpd4OiHcFeuwyPhglUtk
         GDck3qDWGgrh6uw1UcVWZ++Tr5PwjsnxmRhjSGpliM9Wnd+ct9Tk925DIdWsywtNmsPD
         cPDljekq2VwO8wGdDZFc8npDfNoqKrw1gypW6861dD9Bb3HSE7ouJDFd78kwAlwi0lkp
         MyeuaI10QkwXVwaikVW3kDCGVy9qQmgKGV+dt3Z9KCz5CwBmuRRuaAav08Xa3VmtCO8t
         +HgMcgy0hNhFzPtKAFRWqvvEYHd3VLJJfLn2nSadMqOUt9zzcMkLtQEdYC9awGWuBc9U
         gkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=P15fqmAZBsEUMOr7AJ5iW9iAZV+n6joVs0U+BRavOoU=;
        b=a0rMYOnj74uxYrwSNeVIN8VxMQFySJhnldLCloallv1QogcBXdIFwZLYv8vDSe1Cxk
         ScmSv4LWaxEiz058U6tvpfcHOlG1oF2Gm3uqwWp6UUvHgCNzA2Nk2suBu5V1n8tXSDdP
         7G67k6fyyZqCccb7zoeDVjnQekv3xofP15jOoicL6drn2gsNoOcRmcdHbmLUTUKM44Tx
         fDpPVw7xfEDd7DxRpZR4t1b/wzxPsIqKEFr06omXn8SAtomwXapguY/aUi22RSL1RZwm
         af6uE0v96jv6oOIkyIztwanm571m4jDjY6svxs72OMD7SlPbfjcwR+WxM+svMSCJ9aH5
         uYlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3si983756ywb.764.2018.01.26.10.15.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 10:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef8XS-0006Yj-EC
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 13:15:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ef8X2-0006Sm-MU
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 13:15:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ef8Wy-0005zx-7Q
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 13:15:20 -0500
Resent-Date: Fri, 26 Jan 2018 13:15:20 -0500
Resent-Message-Id: <E1ef8Wy-0005zx-7Q@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ef8Wx-0005zT-Q7; Fri, 26 Jan 2018 13:15:16 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1516990482033112.66580381232905;
	Fri, 26 Jan 2018 10:14:42 -0800 (PST)
In-Reply-To: <5A6B5091.8030601@hisilicon.com>
Message-ID: <151699048045.761.10000799444971174423@5adcb62bf0d6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: xuwei5@hisilicon.com
Date: Fri, 26 Jan 2018 10:14:42 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] pl011: do not put into fifo
 before enabled the interruption
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, famz@redhat.com, rob.herring@linaro.org,
	charles.chenxin@huawei.com, Jonathan.Cameron@huawei.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, z.liuxinliang@hisilicon.com,
	qemu-arm@nongnu.org, huangdaode@hisilicon.com,
	tiantao6@huawei.com, pbonzini@redhat.com, liguozhu@hisilicon.com,
	zhangyi.ac@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpSQg7KebbNE

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDVBNkI1MDkxLjgwMzA2MDFAaGlzaWxpY29uLmNvbQpTdWJqZWN0OiBbUWVtdS1k
ZXZlbF0gW1FlbXUtYXJtXSBbUEFUQ0hdIHBsMDExOiBkbyBub3QgcHV0IGludG8gZmlmbyBiZWZv
cmUgZW5hYmxlZCB0aGUgaW50ZXJydXB0aW9uCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0Uu
LiB8IHdjIC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxv
ZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwog
ICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1h
dD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3Jp
cHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAg
ICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy81QTZCNTA5MS44MDMwNjAxQGhpc2ls
aWNvbi5jb20gLT4gcGF0Y2hldy81QTZCNTA5MS44MDMwNjAxQGhpc2lsaWNvbi5jb20KU3dpdGNo
ZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphYWM0MDQwNzBiIHBsMDExOiBkbyBub3QgcHV0IGlu
dG8gZmlmbyBiZWZvcmUgZW5hYmxlZCB0aGUgaW50ZXJydXB0aW9uCgo9PT0gT1VUUFVUIEJFR0lO
ID09PQpDaGVja2luZyBQQVRDSCAxLzE6IHBsMDExOiBkbyBub3QgcHV0IGludG8gZmlmbyBiZWZv
cmUgZW5hYmxlZCB0aGUgaW50ZXJydXB0aW9uLi4uCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vz
c2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzI3OiBGSUxFOiBody9jaGFyL3Bs
MDExLmM6MjMyOgorICAgIGlmICghcy0+aW50X2VuYWJsZWQpClsuLi5dCgpFUlJPUjogY29kZSBp
bmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMyODogRklMRTogaHcvY2hhci9wbDAxMS5jOjIz
MzoKK15JcmV0dXJuIDA7JAoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCA4IGxpbmVzIGNo
ZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVlbGlzdHMub3Jn

