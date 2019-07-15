Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp66657wrv;
        Mon, 15 Jul 2019 14:10:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXP90Esvt0ZahHG3rn+Z5qpEPDeV/Y6N8n0Q+WQcBlic0DLnyGQzbFYd8ely/F1HzAF3m8
X-Received: by 2002:a0d:cb42:: with SMTP id n63mr17841725ywd.205.1563225002764;
        Mon, 15 Jul 2019 14:10:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563225002; cv=pass;
        d=google.com; s=arc-20160816;
        b=fr3+PmArzLSsEons+MJrsUYeT//QkWGqbZ4BuH6QhLc/JjlLzl3cVyU9ICtiqW83+P
         XSMNzQiqs5G2TZuOr1srunF6MW8hfho1hRHO4UzXaBEEo/wRhGYXV0w9uszmbIZmHk/E
         bY8OBIrqeukP1UbLLad+WxBxYli3UnWHGU7sTXXvr0WpPqs5JHEV56FpG+HL0zQ97jNY
         YVYBbqOzeMN3hsagVGujVmEBJ2fUcvyUPJ8gYWgJJAtAny9IZI7WZywDVCHcd5u5AArj
         erVrovSIn27vlnvjSzspsdILVhbfegCOxIQ5Yh0nKDmSS8u3AysUKNTJSi8hz4MoiTql
         Oc3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:in-reply-to:subject:message-id;
        bh=igLBMnQuI4Z5mcfK+JcH12L0YWDut4w7fTe0Yz5BP0c=;
        b=HuYKxSZDqWCukSqetsg763wlNHe/Q8mSiIc0N3ChDUmtAZY9s/JgzsylY6xQAOfKSn
         ndrpFcMa+BGl12KTYsFtLt4mQrKS5kyUqaSFteaeAXZAb8QuRuQfkvNX5oDfFMWtrGJb
         cEMtgt2DIaPAEybnHftz0nQjpjyzAvUs+Zk09wjowEzAsvgbBQ4q1KZmO99ajRKAIHkX
         jZ+ywnkA/XCkAEfqRix2EeP3RFOMLFkIqXRmKa822XPUBYj4USE+61m4ADRAZ8lb7MCf
         0iO03era7dZ+FtZfyqqZYRuc+CwHUZy5ceAtvKw5DMhZ4Z0reYDfxMusRjgNIK9GCtRa
         GryQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.218 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender-of-o53.zoho.com (sender-of-o53.zoho.com. [135.84.80.218])
        by mx.google.com with ESMTPS id r196si6262653ywg.375.2019.07.15.14.10.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 14:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 135.84.80.218 as permitted sender) client-ip=135.84.80.218;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.218 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1563224967; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=PckfYrJYhoZ4k65p4oBliGOui2KK4A9gV+bMFYdfj0J1aeUXToHnL4ck4vDEAPCFZ/PRA8A3xUe7OpDpqkqdCHDr3+/1wkMJ+dz4qNTRdp61m930RWdpwOUsztzeIAOsqoGF/M1sC5+fhRSTOK/UAwRnS53QnWYPgQxXlZpQ4SM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1563224967; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=igLBMnQuI4Z5mcfK+JcH12L0YWDut4w7fTe0Yz5BP0c=; 
	b=kdtZu15nqb9cMatZtJU7m8IxVSIVBO7UDhk4eg+styEaz8CNKT3VMS5FGRIvUPHydqkU+jmYx/PBXFbwSXzXhLOgIugIR/4FpxeLjKsSlSnOWSRqU8acPr84G9/kX+A+rGVPjUZBBwvgtoiMQxMuzLWmiSi33Dt3+wzOri1YFWE=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1563224965846976.4433392779716; Mon, 15 Jul 2019 14:09:25 -0700 (PDT)
Message-ID: <156322496393.3080.18323027869659884783@c4a48874b076>
Subject: Re: [Qemu-devel] [RFC PATCH-for-4.1? v2 0/5] semihosting: Build with CONFIG_SEMIHOSTING disabled
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com, arikalo@wavecomp.com, jhogan@kernel.org, riku.voipio@iki.fi, laurent@vivier.eu, philmd@redhat.com, qemu-arm@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com, james.hogan@mips.com, alex.bennee@linaro.org, aurelien@aurel32.net
Date: Mon, 15 Jul 2019 14:09:25 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: Ft6zDyx4gFx8

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxNTE1MjIyNS4yNjEz
NS0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0
ZXN0IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAojIFRlc3Rpbmcgc2NyaXB0IHdpbGwgYmUg
aW52b2tlZCB1bmRlciB0aGUgZ2l0IGNoZWNrb3V0IHdpdGgKIyBIRUFEIHBvaW50aW5nIHRvIGEg
Y29tbWl0IHRoYXQgaGFzIHRoZSBwYXRjaGVzIGFwcGxpZWQgb24gdG9wIG9mICJiYXNlIgojIGJy
YW5jaApzZXQgLWUKCmVjaG8KZWNobyAiPT09IEVOViA9PT0iCmVudgoKZWNobwplY2hvICI9PT0g
UEFDS0FHRVMgPT09IgpycG0gLXFhCgplY2hvCmVjaG8gIj09PSBVTkFNRSA9PT0iCnVuYW1lIC1h
CgpDQz0kSE9NRS9iaW4vY2MKSU5TVEFMTD0kUFdEL2luc3RhbGwKQlVJTEQ9JFBXRC9idWlsZApt
a2RpciAtcCAkQlVJTEQgJElOU1RBTEwKU1JDPSRQV0QKY2QgJEJVSUxECiRTUkMvY29uZmlndXJl
IC0tY2M9JENDIC0tcHJlZml4PSRJTlNUQUxMCm1ha2UgLWo0CiMgWFhYOiB3ZSBuZWVkIHJlbGlh
YmxlIGNsZWFuIHVwCiMgbWFrZSBjaGVjayAtajQgVj0xCm1ha2UgaW5zdGFsbAo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKICBDQyAgICAgIG1pcHM2NC1saW51eC11c2VyL2xpbnV4LXVzZXIvZmQt
dHJhbnMubwogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvdHJhbnNsYXRl
Lm8KICBDQyAgICAgIG1pcHM2NGVsLWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvbWlwcy1zZW1pLXN0
dWJzLm8KL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW4wbXJzX3p3L3NyYy90YXJnZXQvbWlw
cy9taXBzLXNlbWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhoZWxwZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVz
XQogICAxOSB8IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0ZSAqZW52KQog
ICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCi0tLQogIENDICAgICAgbWlwc2VsLWxpbnV4LXVzZXIvdGFyZ2V0
L21pcHMvdHJhbnNsYXRlLm8KICBDQyAgICAgIG1pcHM2NC1saW51eC11c2VyL3RhcmdldC9taXBz
L21zYV9oZWxwZXIubwogIENDICAgICAgbWlwczY0LWxpbnV4LXVzZXIvdGFyZ2V0L21pcHMvbWlw
cy1zZW1pLXN0dWJzLm8KL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW4wbXJzX3p3L3NyYy90
YXJnZXQvbWlwcy9taXBzLXNlbWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJv
dG90eXBlIGZvciDigJhoZWxwZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1w
cm90b3R5cGVzXQogICAxOSB8IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0
ZSAqZW52KQogICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCi0tLQogIENDICAgICAgbWlwc2VsLWxpbnV4LXVz
ZXIvdGFyZ2V0L21pcHMvbWlwcy1zZW1pLXN0dWJzLm8KICBHRU4gICAgIHRyYWNlL2dlbmVyYXRl
ZC1oZWxwZXJzLmMKICBDQyAgICAgIG1pcHNlbC1saW51eC11c2VyL3RyYWNlL2NvbnRyb2wtdGFy
Z2V0Lm8KL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLW4wbXJzX3p3L3NyYy90YXJnZXQvbWlw
cy9taXBzLXNlbWktc3R1YnMuYzoxOTo2OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZv
ciDigJhoZWxwZXJfZG9fc2VtaWhvc3RpbmfigJkgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVz
XQogICAxOSB8IHZvaWQgaGVscGVyX2RvX3NlbWlob3N0aW5nKENQVU1JUFNTdGF0ZSAqZW52KQog
ICAgICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDE5MDcxNTE1MjIyNS4yNjEzNS0xLXBoaWxtZEByZWRoYXQuY29t
L3Rlc3RpbmcuczM5MHgvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91
ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=
