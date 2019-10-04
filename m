Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp382760wrm;
        Fri, 4 Oct 2019 05:33:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMQhZA0hn005RVNlJwb9p17q6bkKXsT/dbxjn1n0Ws7LcFgHuL2A6riUQFUCx8yZuMiFTJ
X-Received: by 2002:a05:6402:17a2:: with SMTP id j2mr15022668edy.121.1570192437628;
        Fri, 04 Oct 2019 05:33:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570192437; cv=pass;
        d=google.com; s=arc-20160816;
        b=uG74Qlibay/kDvqd+h8azp0dAqm1wcTtnwRwc9WliXWlot3/uGrkiiC8fSl02lpdLk
         e7vk6qtMTRWx4JNoExOtdAArMa26qYZt8Orkf3DqX1L29ZMsCt3Ku0X69H8hUvsf0U5a
         8XEBpk0p3N4TEK0I02htAiSGag0fMZ/vH3Y08tqFNkwpuh018HY1nKONeXeFHNTAiOpz
         qyAm4S0UyyZ9kpbWO7rYHAqJ1dE86kKr12eYeXYxPoupEykkLw4Pd6tFer/HaLhAYoQf
         +wvl9B+/VTvTaHSV8eqms3CrKUZ+ZUakIR5XUHwGRdkwpJ0FrqI6KiHv8hbMo7fQjY1v
         mfZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:in-reply-to:subject:reply-to;
        bh=hEVN6udGnfCzMkihJamvvJMBpBUVt8mv9YyqAX6lIKU=;
        b=vBb4yGtxjSNGTrzzbwpf1jzY4eWR1KJXWjlVsjKUpHnE6lhNLp3eGz+YvQHWTVCzgA
         tuoViRt9hlkypvb64qAis42Vp6i1wppbgOqdWPZwuTpQ79EJagwqurnE8JDb0f6VAUxw
         uGByx1VLqiusMb/nsppDPDJOL8Xl64QAf0KWB7jGQLNJFDI12eZbQ4TzQawhmdqTNPTk
         IDny7H4bGK8W06ERdDVudT0n40phk4Eh0ggUblSUSVYBApJC1AEQMsX8cZUqbAPKocah
         p7bLLSGO9BcbR7FcR9jImtKWnVNaGiiNM0TclqazOyDMGYIPnfgnU1ffRXvGyVzbMvO6
         wGDQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com. [136.143.188.54])
        by mx.google.com with ESMTPS id e22si3006880ejm.72.2019.10.04.05.33.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 05:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) client-ip=136.143.188.54;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1570192429; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=c9/7zvWpoDEv5S/XtWllt1EZzObjeP/mQs3hr64T6bmDQn8U89yWqyDC7M/ecxfDpem4MFdXC5O5YWLMDrUYqax1R9xSU4AvTG66bSW17HG7r2wUtChDXJiQdrfrxWTYPVSQ0bQKy0mPGfsAXM7F2E4xjV7tA9GCXza6uLJCwEg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1570192429; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=hEVN6udGnfCzMkihJamvvJMBpBUVt8mv9YyqAX6lIKU=; 
	b=i+LY3PbCm2hDyL/p4yBfPg1c4vNQZODB5z3h5RqT578dSM4eB4ogg2ghZHXUU0cvURJEHtcLMZzSuWbl3m5YpdJiDaQIfF0QGl1QUwl57l5skLUTfjCFQKSxlG9Ck0Dnl66m+FHgW/rZbNQkQj71IZtEQt2ZgEiWuEvyuJv/Vvw=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1570192427193158.62611076049393; Fri, 4 Oct 2019 05:33:47 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/arm/arch_dump: Add SVE notes
In-Reply-To: <20191004094609.32714-1-drjones@redhat.com>
Message-ID: <157019242552.28767.8910946686226374673@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: drjones@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org, richard.henderson@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
Date: Fri, 4 Oct 2019 05:33:47 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: o1yQ+Nm+L/bb

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAwNDA5NDYwOS4zMjcx
NC0xLWRyam9uZXNAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMTkxMDA0MDk0NjA5LjMyNzE0
LTEtZHJqb25lc0ByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L2FybS9hcmNoX2R1
bXA6IEFkZCBTVkUgbm90ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gK
Z2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpV
cGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0
cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAg
IHBhdGNoZXcvMjAxOTEwMDQxMjAzMTMuNTM0Ny0xLWRyam9uZXNAcmVkaGF0LmNvbSAtPiBwYXRj
aGV3LzIwMTkxMDA0MTIwMzEzLjUzNDctMS1kcmpvbmVzQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0JwpkMDQxNDk3IHRhcmdldC9hcm0vYXJjaF9kdW1wOiBBZGQgU1ZF
IG5vdGVzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5l
dmVyIHVzZSB0YWJzCiMyMTogRklMRTogaW5jbHVkZS9lbGYuaDoxNjUzOgorI2RlZmluZSBOVF9B
Uk1fU1ZFXkkweDQwNV5JXkkvKiBBUk0gU2NhbGFibGUgVmVjdG9yIEV4dGVuc2lvbiQKCldBUk5J
Tkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIGxlYWRpbmcgLyogb24gYSBzZXBhcmF0ZSBsaW5lCiMy
MTogRklMRTogaW5jbHVkZS9lbGYuaDoxNjUzOgorI2RlZmluZSBOVF9BUk1fU1ZFICAgICAweDQw
NSAgICAgICAgICAgLyogQVJNIFNjYWxhYmxlIFZlY3RvciBFeHRlbnNpb24KCkVSUk9SOiBjb2Rl
IGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzIyOiBGSUxFOiBpbmNsdWRlL2VsZi5oOjE2
NTQ6CiteSV5JXkleSV5JICAgcmVnaXN0ZXJzICovJAoKV0FSTklORzogQmxvY2sgY29tbWVudHMg
dXNlICogb24gc3Vic2VxdWVudCBsaW5lcwojMjI6IEZJTEU6IGluY2x1ZGUvZWxmLmg6MTY1NDoK
KyNkZWZpbmUgTlRfQVJNX1NWRSAgICAgMHg0MDUgICAgICAgICAgIC8qIEFSTSBTY2FsYWJsZSBW
ZWN0b3IgRXh0ZW5zaW9uCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWdpc3RlcnMgKi8KCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRzIHVzZSBhIHRyYWlsaW5nICov
IG9uIGEgc2VwYXJhdGUgbGluZQojMjI6IEZJTEU6IGluY2x1ZGUvZWxmLmg6MTY1NDoKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVycyAqLwoKdG90YWw6
IDIgZXJyb3JzLCAzIHdhcm5pbmdzLCAxODEgbGluZXMgY2hlY2tlZAoKQ29tbWl0IGQwNDE0OTc0
ZGFiNiAodGFyZ2V0L2FybS9hcmNoX2R1bXA6IEFkZCBTVkUgbm90ZXMpIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRo
IGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9y
Zy9sb2dzLzIwMTkxMDA0MDk0NjA5LjMyNzE0LTEtZHJqb25lc0ByZWRoYXQuY29tL3Rlc3Rpbmcu
Y2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
