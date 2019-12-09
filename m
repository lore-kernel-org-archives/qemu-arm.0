Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4797109lff;
        Mon, 9 Dec 2019 11:10:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6j3b+PIrlZdQKh7Ln4yGZSPn0u929V9Kj8/mxMDyRsXo1dQ1DG+JaMcavkz6tXkT8AT1v
X-Received: by 2002:a17:906:4dd7:: with SMTP id f23mr32704264ejw.7.1575918647462;
        Mon, 09 Dec 2019 11:10:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575918647; cv=pass;
        d=google.com; s=arc-20160816;
        b=rVhl4JnePKsccxL0TJDf1Syc54Amsh+IHEjgT82br295ijfiNkdo+WYCC0aQNrm1NL
         VhBrT/w0L2kMNgqOwdEIE+xzZ+aurjs3YaJBUjHmb1vMIWwscAQ4i8VblLQwyWsokwzK
         z9qum/Ou2pE0uKDsT/Ajt8y6hxoGj2YyMhOFxf23YeaM6NfMkhKFJSdY8E5I7HhnhkA8
         ZlQm2+UDT0m/cRcl9vxdfBo6Gx+HLlsmmsnlu1UXkEmBTjAEN+qIraM/pKZ/tfnNYMeS
         n6ETnN+MN+BV1bS0919yNCUrxRkDD2k7jy6Xflf02ax3Q5QqlmabEpZNAXu2FMma4tUz
         YEng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=iIOuaLF/I9oYzZASZEYPBMDoqvIKP1N/vM5e4K1KxUg=;
        b=sTz5BLPHcGO0AleP4rQ/NBRk4+UHfp1DAzne7qki3G/hgfWiVSdI+WRdmFgIF8/iwl
         f5jCHwAsQgk7ejo4wm+AIDacUya6Ma4oPHQHBsytw7bLGM3RQzluZID78s8kIoBMxFjv
         vr+qnumV2Z4T9gGo8e8pQodsrOI5/2G8NXyGffKU9IYaKe4e5YsPSzFkp3yEQjKUPqSa
         hjV40zY55oh9m0yuYnuJ166qyUmUQm/uYaATkYODnMRhNGBAblCa7msVDL7oxsh2ZUJg
         ShXRZ9F7BJ/upXyL0vIEoe87V5RiDnI1rkxsOnz/gfEC90jy58SNMYx76jl2bI2JLMAX
         fNVA==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com. [136.143.188.50])
        by mx.google.com with ESMTPS id u3si380400eja.201.2019.12.09.11.10.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 11:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) client-ip=136.143.188.50;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1575918640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yq0nHNJSphhJz4HuK/72nhBpOUbsoFm0H7EhhlQ0eoxksrPSsTcoNXr99NOIpXNovxJFkCwVCjqXcIkmlJnZq2h1ZWT7Sw+o55UpTN3fnXog3tMEverMpmRRIwXF6RPbT6ep3hO4x6S3sPlrtwOBY7KbtD80AYANk97sSQHPjEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1575918640; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=iIOuaLF/I9oYzZASZEYPBMDoqvIKP1N/vM5e4K1KxUg=; 
	b=nJXlIoKtNW/XCZdCGNHhGhdUl/viY18b/VErkJ/1F7GMJJkTwbmlu2GiMZ3kTuT9fcSJGri95n457ymVlXJ6iZs7nkS+Xh4L+CuQ1mFXqd5g9djyRmPqJm3CXdRY7q5yXUCf/YfMCpF/tA9RbbRm5yn271v+V/gLhdZbNrh28pc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1575918640209443.61033137444895; Mon, 9 Dec 2019 11:10:40 -0800 (PST)
In-Reply-To: <20191209134552.27733-1-philmd@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
Message-ID: <157591863889.7675.6343373794546461369@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, richard.henderson@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, philmd@redhat.com
Date: Mon, 9 Dec 2019 11:10:40 -0800 (PST)
X-ZohoMailClient: External
X-TUID: LU8Qwr3IA1Hw

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTIwOTEzNDU1Mi4yNzcz
My0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9ja2VyLWlt
YWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1taW5nd0BmZWRv
cmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN1Ym1vZHVsZSAnZHRj
JyAoaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2R0Yy5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGgg
J2R0YycKQ2xvbmluZyBpbnRvICdkdGMnLi4uCnJlbW90ZTogQ291bnRpbmcgb2JqZWN0czogNTI4
MCwgZG9uZS4gICAgICAgIAplcnJvcjogUlBDIGZhaWxlZDsgcmVzdWx0PTE4LCBIVFRQIGNvZGUg
PSAyMDAKZmF0YWw6IFRoZSByZW1vdGUgZW5kIGh1bmcgdXAgdW5leHBlY3RlZGx5CmZhdGFsOiBw
cm90b2NvbCBlcnJvcjogYmFkIHBhY2sgaGVhZGVyCkNsb25lIG9mICdodHRwczovL2dpdC5xZW11
Lm9yZy9naXQvZHRjLmdpdCcgaW50byBzdWJtb2R1bGUgcGF0aCAnZHRjJyBmYWlsZWQKZmFpbGVk
IHRvIHVwZGF0ZSBzdWJtb2R1bGUgZHRjClN1Ym1vZHVsZSAnZHRjJyAoaHR0cHM6Ly9naXQucWVt
dS5vcmcvZ2l0L2R0Yy5naXQpIHVucmVnaXN0ZXJlZCBmb3IgcGF0aCAnZHRjJwptYWtlWzFdOiAq
KiogWy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1fNWRwYnZuYS9zcmMvZG9ja2VyLXNyYy4y
MDE5LTEyLTA5LTE0LjA1LjI3LjE0NTE4XSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0
b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtXzVkcGJ2bmEvc3JjJwptYWtlOiAqKiog
W2RvY2tlci1ydW4tdGVzdC1taW5nd0BmZWRvcmFdIEVycm9yIDIKCnJlYWwgICAgNW0xMi4zMDZz
CnVzZXIgICAgMG0yLjQzOHMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzLzIwMTkxMjA5MTM0NTUyLjI3NzMzLTEtcGhpbG1kQHJlZGhhdC5jb20v
dGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
