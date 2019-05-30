Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp1025987pjq;
        Thu, 30 May 2019 09:12:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxyUNtzXmmBG0XxveVNXKS4XCWyYCQdoHi0WwHOidFd54HfNhToBC02lzPbjBNZPIyjfcx
X-Received: by 2002:a17:906:4752:: with SMTP id j18mr3329443ejs.170.1559232761750;
        Thu, 30 May 2019 09:12:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559232761; cv=pass;
        d=google.com; s=arc-20160816;
        b=e/0P0rVF8PeF4XfiQ4hnvDhrOAmcs0yT9nj34ASjRxucK7nJKnUuoVplb4KGBlxgsw
         LvLyuT6X/sNKKFZBqVfBVpaXH5XhdKGwUTWCOvDBnN2XZhmbAYK9Sx93VPQP+XqFA5NH
         VrUUWpyftGpBQyMUheK6KVJmw3tOpg9OAaHEUoWSvzxV3cWDVHFjmKeireHUsUWe6dfH
         2dkv8UHVNK+5oPPAtBVJ0zJ+bPDeJuBZawOo4bwRjCFF2GmgzXOXECnWPfJPaFeokejR
         qSv3acqerb7gMHS0aXcM+uHFcZgHVHVkRUFOkGha8cgIN/BvFrft/unlfrWFAEHwdrlo
         4ZJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:reply-to:subject:in-reply-to;
        bh=Is/Pk0UOYSbTZ52qMrZyfTmWrJCiCZntRlIOIMqRi0o=;
        b=wgj7HWToFVe/UicLF/RiO8zwsSns53FGuFpktiLgksIK7MOVzMPF7i/zFGkAp5SHaI
         DKqm1PybrfZUqflLYW42/6FkVT0fb60lU+iWh0KSGSdXnIl8zkv986dRQfkscMHdPotd
         5/frCHx5FgZlDvgYWIvxY6wmC1PLsCxs2nCUQXwEctkWpak49ICr6MIzh4FQeySS7ebv
         LXkoc2P5sq3PZ7bxkLEbdmNbfgHqrmeNjXFExlDD08p+7DaFgLxZqh8JA6SAFOPXHxjp
         /BSiioQ715diiaapu6UyAp2qL5oZpEJGEXn7eLRuhHNOsQc1OkFGalZWg/G/UseYRhZK
         ejqQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.55 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com. [136.143.188.55])
        by mx.google.com with ESMTPS id y23si1931476eju.228.2019.05.30.09.12.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 09:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.55 as permitted sender) client-ip=136.143.188.55;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.55 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1559232746; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=k2z2KPrqmp1Srq50mesPhiTJq4yKfwImeLHWgBDeSV2eneeEWje1DQ5h0NhX+zzrZgbDlcUZw2TO0UXXuCHJ70nulBYIRAt51eowwrenYK/AMl2pHm8TxDgcCW3q2594v9CAUeBS623Z0R7F7JgTG3yXgKqCwmXzlPhbZtpVPjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1559232746; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=Is/Pk0UOYSbTZ52qMrZyfTmWrJCiCZntRlIOIMqRi0o=; 
	b=SBkK6LizNQdOw2HnEZqpfiF1cGKxWPlE4H+1iJphsmfEbiGBNEoemWJdhmPByMwAkhf819wk+LpFQE0GYmFxE0ilG1BTea6idlHWX3Hf+AjtzsKSXInDtjBToLMIb4YadWTMfXoupsce5R0sMCXfh8wAWEwPfql6YHjdojYMOlM=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 15592327443171022.8248793888841; Thu, 30 May 2019 09:12:24 -0700 (PDT)
In-Reply-To: <20190530143916.20255-1-alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [RFC PATCH] semihosting: split console_out intro string and char versions
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <155923274262.9187.6714348083557874693@ce79690b2cb9>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, riku.voipio@iki.fi, qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Date: Thu, 30 May 2019 09:12:24 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: tfk3bTCYis/r

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUzMDE0MzkxNi4yMDI1
NS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUkZDIFBBVENIXSBzZW1paG9z
dGluZzogc3BsaXQgY29uc29sZV9vdXQgaW50cm8gc3RyaW5nIGFuZCBjaGFyIHZlcnNpb25zClR5
cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDE5MDUzMDE0MzkxNi4yMDI1NS0xLWFsZXguYmVubmVl
QGxpbmFyby5vcmcKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJl
di1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpGcm9tIGh0
dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAg
ICAgICAgICBwYXRjaGV3LzIwMTkwNTMwMTQzOTE2LjIwMjU1LTEtYWxleC5iZW5uZWVAbGluYXJv
Lm9yZyAtPiBwYXRjaGV3LzIwMTkwNTMwMTQzOTE2LjIwMjU1LTEtYWxleC5iZW5uZWVAbGluYXJv
Lm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjk4YzU1N2IzNTcgc2VtaWhvc3Rp
bmc6IHNwbGl0IGNvbnNvbGVfb3V0IGludHJvIHN0cmluZyBhbmQgY2hhciB2ZXJzaW9ucwoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnIT0n
IChjdHg6VnhWKQojNDc6IEZJTEU6IGh3L3NlbWlob3N0aW5nL2NvbnNvbGUuYzo1NjoKKyAgICB9
IHdoaWxlIChjIT0wKTsKICAgICAgICAgICAgICAgXgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5p
bmdzLCAxNDcgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDk4YzU1N2IzNTcwOCAoc2VtaWhvc3Rpbmc6
IHNwbGl0IGNvbnNvbGVfb3V0IGludHJvIHN0cmluZyBhbmQgY2hhciB2ZXJzaW9ucykgaGFzIHN0
eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUg
ZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQ
QVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhp
dGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMjAxOTA1MzAxNDM5MTYuMjAyNTUtMS1hbGV4LmJlbm5lZUBsaW5hcm8u
b3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
