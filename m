Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4790280lff;
        Mon, 9 Dec 2019 11:05:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqw17rPuxqE65dkNGYjpPlTSkjttujtMUXdB84MfMqGQKC8Nahw4Bsf0ZguAVvQyBc4cNV/E
X-Received: by 2002:a17:906:8595:: with SMTP id v21mr32268366ejx.28.1575918310989;
        Mon, 09 Dec 2019 11:05:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575918310; cv=pass;
        d=google.com; s=arc-20160816;
        b=g8a41YpuJKGZff9CP5deNCiirrTYDk9iZcvnC//dxdUyWnHVVWWIIuK7/5F+UiINfd
         jX+d0Np92URUKOLF7ZzRhz/wCUPVBLS631I5u5aC7JaLT/SAOyPY+OgKaZInFcwgbFGP
         sTLs2jKLqw1Jd858pA1xVD7exdOvHJ7YwUWuRk6d50bP4QW697vFXbj6IMvdpETHMofE
         eAh4jOpeF2KXlMmKfz7uWVNRNrB8t90EnC8zoEG7R451MYdOiglUT9LeUj/SVg+0vZb1
         NgMiJgiJlqkjslECBzlEc6Cfq+/fQks9pADqe7G0yyX3OxyYrzLCzQz6R6i7wYmJg+Mu
         BkhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=qV/ZNsvSehoJcpGig09EHNs5t8+ibqZPP3nOjCdEFx8=;
        b=ZyFKcD6sxAaZk2js/z86MIC3oxPkBDUxFse+aolnCSzta3f8RcLUOSdISEUuKihL+6
         CLrgzXv2dG2szAmqeOTVRfvj5BSXFBH1pO0KjFCH/NsiB8pYzn6V8Al8bIUVfmdBgpoc
         RXcCxhoYtZUL/nbchjjIzJ+pQsaHg+5oXKcnhfE74zootZFfrq9YwD/up7wF4dIWw0qm
         iKJKpSquJOePIa/xSP3Fdi4SlPXpLPHgbCsVuD0fpdGMEUhUO7OpaGm6KobV7wHucZHJ
         W+G4SWxR/SmdjoDcfMqcoCWj0W4/IwgCNp0pKUO7BQnPk9eiSXjlq5edt+RllndWOy5t
         Qycg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com. [136.143.188.50])
        by mx.google.com with ESMTPS id c16si290116edv.27.2019.12.09.11.05.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 11:05:10 -0800 (PST)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) client-ip=136.143.188.50;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.50 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1575918304; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zrs5/z+bL28bxOjr3S9lJTRuKGqZPpno3swAyNWhcEw9FVO6gJcNVJGjtLUBzMeR4SONcmUFAdG5lLzP9ulRvHssFCWT/K0e5M7912NJGqtxghUJ0Pq3PSfxmIBUXOHo5E31EQeoY4w//ENZ9W8mkaLtmujHQy0sNJ+NcUfpD5k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1575918304; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=qV/ZNsvSehoJcpGig09EHNs5t8+ibqZPP3nOjCdEFx8=; 
	b=jANMCFT5qm10iQZiaXXbPEso2m2OY32WnD3pT2U1eoxpfOnB/krLgo1APChpJ68+X81GyFkZ+Hp+sFqia+MH2fIlicEesqc2WOHaZ63YAOAvnYamLMAusXmARmC4xMuQTK2+S6zdQuaItxq+CrGNtqMjPdh3/194W3aaZn3nXuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1575918302692420.4334829360199; Mon, 9 Dec 2019 11:05:02 -0800 (PST)
In-Reply-To: <20191209134552.27733-1-philmd@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
Message-ID: <157591830140.7675.6810793168650121872@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, richard.henderson@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, philmd@redhat.com
Date: Mon, 9 Dec 2019 11:05:02 -0800 (PST)
X-ZohoMailClient: External
X-TUID: A2SOPBMNryhq

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTIwOTEzNDU1Mi4yNzcz
My0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN1Ym1vZHVsZSAnZHRjJyAoaHR0
cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2R0Yy5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ2R0YycK
Q2xvbmluZyBpbnRvICdkdGMnLi4uCnJlbW90ZTogQ291bnRpbmcgb2JqZWN0czogNTI4MCwgZG9u
ZS4gICAgICAgIAplcnJvcjogUlBDIGZhaWxlZDsgcmVzdWx0PTE4LCBIVFRQIGNvZGUgPSAyMDAK
ZmF0YWw6IFRoZSByZW1vdGUgZW5kIGh1bmcgdXAgdW5leHBlY3RlZGx5CmZhdGFsOiBwcm90b2Nv
bCBlcnJvcjogYmFkIHBhY2sgaGVhZGVyCkNsb25lIG9mICdodHRwczovL2dpdC5xZW11Lm9yZy9n
aXQvZHRjLmdpdCcgaW50byBzdWJtb2R1bGUgcGF0aCAnZHRjJyBmYWlsZWQKZmFpbGVkIHRvIHVw
ZGF0ZSBzdWJtb2R1bGUgZHRjClN1Ym1vZHVsZSAnZHRjJyAoaHR0cHM6Ly9naXQucWVtdS5vcmcv
Z2l0L2R0Yy5naXQpIHVucmVnaXN0ZXJlZCBmb3IgcGF0aCAnZHRjJwptYWtlWzFdOiAqKiogWy92
YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC04dmtpM2dkYS9zcmMvZG9ja2VyLXNyYy4yMDE5LTEy
LTA5LTE0LjAwLjA5LjEzNTM2XSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAv
dmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtOHZraTNnZGEvc3JjJwptYWtlOiAqKiogW2RvY2tl
ci1ydW4tdGVzdC1xdWlja0BjZW50b3M3XSBFcnJvciAyCgpyZWFsICAgIDRtNTIuNjA0cwp1c2Vy
ICAgIDBtMi41OTRzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDE5MTIwOTEzNDU1Mi4yNzczMy0xLXBoaWxtZEByZWRoYXQuY29tL3Rlc3Rp
bmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
