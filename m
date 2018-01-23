Received: by 10.28.71.27 with SMTP id u27csp23953wma;
        Tue, 23 Jan 2018 15:06:06 -0800 (PST)
X-Google-Smtp-Source: AH8x225TCXSqZ05x4iZ1KI6etOB6Gr+wPabcRnQkjIRXKlKus0I+xMlS6/5zSmDS0bxcY5M4EaGo
X-Received: by 10.129.116.8 with SMTP id p8mr4113267ywc.386.1516748766167;
        Tue, 23 Jan 2018 15:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516748766; cv=none;
        d=google.com; s=arc-20160816;
        b=twiUnb+VvZ0+zJIPczUTYTkqkLq/pFqM3+HX8xOzB7fzfalh+lFkPoQZfHCHYEEjXE
         WTNlRYouNPqdEYmLAfRAgMGegvQqYTWoBOwKpJU2y9ijuXklQeslDtZFyaEAkYrdYsrG
         +In0l6fHQGKoahGFP3DAoqd7jCPc50XzbUv1FxMmIM93hjIY0fVqji31wyFICGxUwnJM
         E7uame3ZYykYbrHZT8Ub0Tfxng13m+IiibrfNj32HV0Mgh2vRdsSCuzPnhgUNw3QYKVh
         XbiXs1P+QMEpU0B2edGD4YmeDZjLCHAIb5eJ48wB7m7W4GpGLVr2hTmRMi573Alezrat
         tpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=7Q4MmaXPjk/3lFYBrk6jgs70lS7qiODn9zv8wKJnZQI=;
        b=lmiuLFWBJ+8XdAJaBQmuViEMsaSxeYfS5VHsk6wmBP9yOcHVTl1ROYbM24B3MvEabc
         hpZ3G/b1J0eyOkWLs7ks1NgAv2bpa8J/x/mXsqitExNh/O/sObyC5aQKWhnISsQ0Uvfn
         C7KP1LoaYxUWa9AjOUxr2+fxDqADopb+exd6BaGiw3ITWkSh9iPR3OXhoCBnpdNPF2XK
         EduKRXBWhAyxJprVwoyq2GQt3Rzr/bRPHEMRZxFj0d0qvTwj5M4LJNrRPzLLjgXrcrPO
         vLR+KWwhpcZsMPjoH8X5o1+gs5VsEey9uLakkn4TH+OPACguSN2aF3sdNnEAjUJatF0a
         x2+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a186si2576052ybb.577.2018.01.23.15.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 15:06:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7dl-0006nr-9h
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 18:06:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ee7dU-0006lf-QT
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 18:05:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ee7dT-0002TW-Lp
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 18:05:48 -0500
Resent-Date: Tue, 23 Jan 2018 18:05:48 -0500
Resent-Message-Id: <E1ee7dT-0002TW-Lp@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ee7dO-0002Cm-2r; Tue, 23 Jan 2018 18:05:42 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1516748718529564.4647970299404;
	Tue, 23 Jan 2018 15:05:18 -0800 (PST)
In-Reply-To: <20180123225654.5764-1-linus.walleij@linaro.org>
Message-ID: <151674871785.674.276197486276915619@5adcb62bf0d6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: linus.walleij@linaro.org
Date: Tue, 23 Jan 2018 15:05:18 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] pl110: Implement vertical
 compare/next base interrupts
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, linus.walleij@linaro.org, qemu-arm@nongnu.org,
	famz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y+lHWARQQlfV

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMTIzMjI1NjU0LjU3NjQtMS1saW51cy53YWxsZWlqQGxpbmFyby5vcmcK
U3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSF0gcGwxMTA6IEltcGxlbWVudCB2ZXJ0aWNhbCBj
b21wYXJlL25leHQgYmFzZSBpbnRlcnJ1cHRzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
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
ICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy8yMDE4MDEyMzIyNTY1NC41NzY0LTEt
bGludXMud2FsbGVpakBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAxODAxMjMyMjU2NTQuNTc2NC0x
LWxpbnVzLndhbGxlaWpAbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3Qn
CjI1MTJiMTUxYjYgcGwxMTA6IEltcGxlbWVudCB2ZXJ0aWNhbCBjb21wYXJlL25leHQgYmFzZSBp
bnRlcnJ1cHRzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzE6IHBsMTEw
OiBJbXBsZW1lbnQgdmVydGljYWwgY29tcGFyZS9uZXh0IGJhc2UgaW50ZXJydXB0cy4uLgpXQVJO
SU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNzY6IEZJTEU6IGh3L2Rpc3BsYXkvcGwxMTAu
YzozNDI6CisgICAgICAgICAgICAgIHFlbXVfY2xvY2tfZ2V0X25zKFFFTVVfQ0xPQ0tfVklSVFVB
TCkgKyBOQU5PU0VDT05EU19QRVJfU0VDT05EIC8gNjApOwoKRVJST1I6IGxpbmUgb3ZlciA5MCBj
aGFyYWN0ZXJzCiM4NjogRklMRTogaHcvZGlzcGxheS9wbDExMC5jOjQ1MzoKKyAgICAgICAgICAg
ICAgICAgICAgICBxZW11X2Nsb2NrX2dldF9ucyhRRU1VX0NMT0NLX1ZJUlRVQUwpICsgTkFOT1NF
Q09ORFNfUEVSX1NFQ09ORCAvIDYwKTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJz
CiM5NjogRklMRTogaHcvZGlzcGxheS9wbDExMC5jOjUwMToKKyAgICBzLT52YmxhbmtfdGltZXIg
PSB0aW1lcl9uZXdfbnMoUUVNVV9DTE9DS19WSVJUVUFMLCBwbDExMF92YmxhbmtfaW50ZXJydXB0
LCBzKTsKCnRvdGFsOiAxIGVycm9ycywgMiB3YXJuaW5ncywgNjMgbGluZXMgY2hlY2tlZAoKWW91
ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=

