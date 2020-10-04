Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2858784lfq;
        Sat, 3 Oct 2020 18:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaA/hvLe7NDQCN476Aasw28NCZYoynIRH3LmKRGhf1iIKgDh92IJ9kv5p7zQX8AMT9DzQ2
X-Received: by 2002:a17:906:bce5:: with SMTP id op5mr9333515ejb.500.1601775259080;
        Sat, 03 Oct 2020 18:34:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601775259; cv=pass;
        d=google.com; s=arc-20160816;
        b=0nFZ0oCvXUVklB8XciD3srlDR+7xsidZKZPTJJJwvKidnyJ6MYS/5vmaTTfe5wTZMy
         M08P+RSaf479LucmUiyuxFhZYCqurpUjWLW06xiFUxz2Uy9pnKyiA0LLXn+rLvXxjpYh
         bfZfcyXn0fMHfROVQxgTPWyHcf9EHTTKEh6cn/EwAizIDVoz2qgqzj6xXlxPStouY5B1
         I2EndH40aIXqiaB1vMh8jBk5gzwxshWtKuj34l5fMcYbrDLR2gJuBb6+96xQrTftCkOF
         3g+n3Xs+dgRAIjUy4q6tUQMNEUqh4190csfvPmUUD4NKxx78nadPSpDU7zRLgNvX/aUX
         zhfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :in-reply-to:reply-to:message-id:subject;
        bh=qP6eFw5QB3XpjDG2uZHfNvhpVsh0ZqBaXOGEW6To/ho=;
        b=gNwVYGNkh3p1DQ+ZIHMsRLNO5yDc3T35x85Ehv6BmXcKI16GILZ1k6kywlnNUBfXJL
         eXsPuIYnunGpeWKYmIQqXAGfO5ubSmVfUD+Dr8xMtpc375JxScWbQJONIHebWzS5PjGz
         cQdZJ5G0Fh5LWJx4KYqT3gZDL3jb43/FdWt6xj8NKsp5jpEu45Mo57V2CGay2D4gF8hG
         RrfW/perV7d1p36ciuNjgnzJHo5Xt5DMzQpd33iP2FQe1ewtBfcZ071JiWAb3SJvkOJI
         XeZYS31PGbpBXJVl5AcyDg/07gVSUzfqDGi7meFYaOROWscO9zE9r1gayA+yPexPFtsI
         +QmQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.57 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o57.zoho.com (sender4-of-o57.zoho.com. [136.143.188.57])
        by mx.google.com with ESMTPS id z24si3864808edq.365.2020.10.03.18.34.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Oct 2020 18:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.57 as permitted sender) client-ip=136.143.188.57;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.57 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1601775254; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GbP3OjEwioBMUkQQgZzSXSmcPB4vrrNJh/t/wmixtlWxt1AWWOwQ0z8rnArX08uDEjyslucWkqqsoEBhYuiOOOuh1dGcs/KgtQP+w25jD4RKbNCCh5kQC1tBgKQ5yKrJ9HYSaEuIYNTBgt1yf8K9mCzJOLLIjVgVtTUpP2j364Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1601775254; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=qP6eFw5QB3XpjDG2uZHfNvhpVsh0ZqBaXOGEW6To/ho=; 
	b=FEyWY1+PdRZr9gfx9hYHpHBwgxHRVrN1i/SJXjr4yQMqh5mFMrM1yoWAMs2gesnMfluduOhvJkVfDT6b2l19dkfkbe7iKKeqJ93C63lQH2mYxZKTaj193Gl5klDy+79uSe8S2rho87pqNNBA0AHyN6onGuGINK6IpvCTQY2xFmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 16017752529961010.0460134216532; Sat, 3 Oct 2020 18:34:12 -0700 (PDT)
Subject: Re: [PATCH v10 0/8] linux-user: User support for AArch64 BTI
Message-ID: <160177525160.12501.2417388489163376608@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Date: Sat, 3 Oct 2020 18:34:12 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: aHMW/NJMXdw8

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAwMjIxNTk1NS4yNTQ4
NjYtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEwMDIy
MTU5NTUuMjU0ODY2LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggdjEwIDAvOF0gbGludXgtdXNlcjogVXNlciBzdXBwb3J0IGZvciBBQXJjaDY0IEJUSQoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0
JwplYWY1ZWRiIHRlc3RzL3RjZy9hYXJjaDY0OiBBZGQgYnRpIHNtb2tlIHRlc3QKYzc0ZTIwMiBs
aW51eC11c2VyL2VsZmxvYWQ6IFBhcnNlIE5UX0dOVV9QUk9QRVJUWV9UWVBFXzAgbm90ZXMKN2U3
YzUzNCBsaW51eC11c2VyL2VsZmxvYWQ6IE1vdmUgUFRfSU5URVJQIGRldGVjdGlvbiB0byBmaXJz
dCBsb29wCjFkZWQyY2QgbGludXgtdXNlci9lbGZsb2FkOiBBZGp1c3QgaXRlcmF0aW9uIG92ZXIg
cGhkcgo5YTMxM2IzIGxpbnV4LXVzZXIvZWxmbG9hZDogRml4IGNvZGluZyBzdHlsZSBpbiBsb2Fk
X2VsZl9pbWFnZQpkZGMyN2I3IGluY2x1ZGUvZWxmOiBBZGQgZGVmaW5lcyByZWxhdGVkIHRvIEdO
VSBwcm9wZXJ0eSBub3RlcyBmb3IgQUFyY2g2NAplY2E0MjQwIGxpbnV4LXVzZXI6IFNldCBQQUdF
X1RBUkdFVF8xIGZvciBUQVJHRVRfUFJPVF9CVEkKNmIzZThlMyBsaW51eC11c2VyL2FhcmNoNjQ6
IFJlc2V0IGJ0eXBlIGZvciBzaWduYWxzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzggQ2hlY2tp
bmcgY29tbWl0IDZiM2U4ZTM2OTYxMyAobGludXgtdXNlci9hYXJjaDY0OiBSZXNldCBidHlwZSBm
b3Igc2lnbmFscykKMi84IENoZWNraW5nIGNvbW1pdCBlY2E0MjQwNjc0NTkgKGxpbnV4LXVzZXI6
IFNldCBQQUdFX1RBUkdFVF8xIGZvciBUQVJHRVRfUFJPVF9CVEkpCjMvOCBDaGVja2luZyBjb21t
aXQgZGRjMjdiNzU1NDlkIChpbmNsdWRlL2VsZjogQWRkIGRlZmluZXMgcmVsYXRlZCB0byBHTlUg
cHJvcGVydHkgbm90ZXMgZm9yIEFBcmNoNjQpCjQvOCBDaGVja2luZyBjb21taXQgOWEzMTNiMzAy
NjVjIChsaW51eC11c2VyL2VsZmxvYWQ6IEZpeCBjb2Rpbmcgc3R5bGUgaW4gbG9hZF9lbGZfaW1h
Z2UpCjUvOCBDaGVja2luZyBjb21taXQgMWRlZDJjZGNkOGVkIChsaW51eC11c2VyL2VsZmxvYWQ6
IEFkanVzdCBpdGVyYXRpb24gb3ZlciBwaGRyKQo2LzggQ2hlY2tpbmcgY29tbWl0IDdlN2M1MzQz
ZGRlNSAobGludXgtdXNlci9lbGZsb2FkOiBNb3ZlIFBUX0lOVEVSUCBkZXRlY3Rpb24gdG8gZmly
c3QgbG9vcCkKNy84IENoZWNraW5nIGNvbW1pdCBjNzRlMjAyMzYxYTkgKGxpbnV4LXVzZXIvZWxm
bG9hZDogUGFyc2UgTlRfR05VX1BST1BFUlRZX1RZUEVfMCBub3RlcykKOC84IENoZWNraW5nIGNv
bW1pdCBlYWY1ZWRiNTBkZTYgKHRlc3RzL3RjZy9hYXJjaDY0OiBBZGQgYnRpIHNtb2tlIHRlc3Qp
CldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5F
UlMgbmVlZCB1cGRhdGluZz8KIzMyOiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCkVSUk9SOiBleHRl
cm5zIHNob3VsZCBiZSBhdm9pZGVkIGluIC5jIGZpbGVzCiMxMTc6IEZJTEU6IHRlc3RzL3RjZy9h
YXJjaDY0L2J0aS1jcnQuaW5jLmM6MTM6CitpbnQgbWFpbih2b2lkKTsKCnRvdGFsOiAxIGVycm9y
cywgMSB3YXJuaW5ncywgMTM2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDgvOCBoYXMgc3R5bGUgcHJv
YmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBw
b3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAyMDEwMDIyMTU5NTUuMjU0ODY2LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
