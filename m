Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1798512lfa;
        Fri, 16 Oct 2020 12:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKcop+rUDATAeHCUvsAaKhXjxLxCAvJK3r7Yjap49Nu0BtMqNiWgkepKc69hNQemoOSUlW
X-Received: by 2002:a50:fa89:: with SMTP id w9mr5673561edr.235.1602875216121;
        Fri, 16 Oct 2020 12:06:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602875216; cv=pass;
        d=google.com; s=arc-20160816;
        b=xGtx+ospQayTWQhqrXmOCGfNmqWP8zVksrlbZGn2wuXlWN9MfZ2uy8hz5WiqyITg6/
         DmLJFU3c5bFRCr4Ux5xxy4pUCLvBdp9JM6pj8YaBVK2LMJYdN41Ol1noLppP1hAwSC37
         j5NbknSmI9hlNZ3wEdTk+DWme5KlBjLW9sPZMjzfziZljIIOGK8vnhlT644Gta6NocNw
         zde/TS9ODiqE/QLXZTpaJSgHkLloSSl+2HUVZpcXv4Et8B6AsQap1aV1p5/O4gCWtANy
         f0ZExwBIXqOdkIXxh9lGeZMtY9rsmmQrHoKgpadtqnfgMSYhHo2YGly2tPO0hIbPxdyj
         R+zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :in-reply-to:reply-to:message-id:subject;
        bh=GHHn5V6ndqJabY8GedSN6R4YOjU5m4ryD4lVrmTcBiM=;
        b=FxIRj+K3M5YjMrAzzvcm2qfGJsCCQmARa6hougOYH9gKN8Sx8Z9Ke29OjVqidPy63Y
         hd4hEKHEZZC62Ox3vECzmAZ5tLBPvcw77CzsIzSOi7IlH8gHPoUVSb7+rw4L+R2ZnADP
         rpbwcBCIkWm86DgtbCoMVZO/yUGVDBWwiYF0VeY6RXf41MYBrg6wIfXgLpziOmlusijG
         Bw2t3DpIQUbUxhyQ+M3rmj+vrVaypJL5D5j12lvAjGwOfuBu8h3Rw90dv0EkuHf9v/tm
         opR3JoY8+ANqXVmUbAhmAz571QymSJf0yTdL+1DdTI4qGcrjh1hp40M4GFbzEFRDcugH
         RBvA==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.57 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o57.zoho.com (sender4-of-o57.zoho.com. [136.143.188.57])
        by mx.google.com with ESMTPS id dc22si2478291ejb.275.2020.10.16.12.06.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2020 12:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.57 as permitted sender) client-ip=136.143.188.57;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.57 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1602875212; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BxGxbR5CDSwqQhv3+BF05aMM0rnZFtApJP+TwXYiqfoDaqYiNefn7/twMXJnBxMz6T/zuT/d1NoSZWCYGAEQKf+BmIG/1LsK6SRGLbnTI/rmujfosOBKR4k0I6/uTylaHhW5jT3eASObmm4ioZOcrV0eICvftSnFgJNubPyPdYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1602875212; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=GHHn5V6ndqJabY8GedSN6R4YOjU5m4ryD4lVrmTcBiM=; 
	b=jyhfKtZp2Wmu9ak2eqN0uFVhSsnNf7vMBR9jvrVKKUrJSs/z4Zmq+YHuNR2nWs4/BYHqez0joidUszdWo+VLGj5cZ9YINBwkMvpgTyxEveyg+eqMxy/pLowqJIQTeuUgEgBKiSXGduGJxlLRtu4CBkrctS6p3Ktp75cdc67wC6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 160287521010412.796348504163348; Fri, 16 Oct 2020 12:06:50 -0700 (PDT)
Subject: Re: [PATCH v11 00/12] linux-user: User support for AArch64 BTI
Message-ID: <160287520829.1194.14173174275238509522@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Date: Fri, 16 Oct 2020 12:06:50 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: SdKhapbdd0Hl

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAxNjE4NDIwNy43ODY2
OTgtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDEwMTYx
ODQyMDcuNzg2Njk4LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggdjExIDAwLzEyXSBsaW51eC11c2VyOiBVc2VyIHN1cHBvcnQgZm9yIEFBcmNoNjQgQlRJCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+
IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxi
YWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFm
Zjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRj
aGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMDE2MTg0
MjA3Ljc4NjY5OC0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIw
MTAxNjE4NDIwNy43ODY2OTgtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYWRkZGViZCB0ZXN0cy90Y2cvYWFyY2g2NDogQWRkIGJ0
aSBzbW9rZSB0ZXN0cwo2ZGU5ZTEyIGxpbnV4LXVzZXIvZWxmbG9hZDogUGFyc2UgR05VX1BST1BF
UlRZX0FBUkNINjRfRkVBVFVSRV8xX0FORAo5YjA1MDc3IGxpbnV4LXVzZXIvZWxmbG9hZDogUGFy
c2UgTlRfR05VX1BST1BFUlRZX1RZUEVfMCBub3RlcwplMDYzZmRlIGxpbnV4LXVzZXIvZWxmbG9h
ZDogVXNlIEVycm9yIGZvciBsb2FkX2VsZl9pbnRlcnAKNWZhNjMwNSBsaW51eC11c2VyL2VsZmxv
YWQ6IFVzZSBFcnJvciBmb3IgbG9hZF9lbGZfaW1hZ2UKMGJkZjNiOSBsaW51eC11c2VyL2VsZmxv
YWQ6IE1vdmUgUFRfSU5URVJQIGRldGVjdGlvbiB0byBmaXJzdCBsb29wCjMxOTI5NDMgbGludXgt
dXNlci9lbGZsb2FkOiBBZGp1c3QgaXRlcmF0aW9uIG92ZXIgcGhkcgpkMzVhYzBlIGxpbnV4LXVz
ZXIvZWxmbG9hZDogRml4IGNvZGluZyBzdHlsZSBpbiBsb2FkX2VsZl9pbWFnZQpmMTAxOWMwIGxp
bnV4LXVzZXIvZWxmbG9hZDogQXZvaWQgbGVha2luZyBpbnRlcnBfbmFtZSB1c2luZyBHTGliIG1l
bW9yeSBBUEkKNDZiOGUwNCBpbmNsdWRlL2VsZjogQWRkIGRlZmluZXMgcmVsYXRlZCB0byBHTlUg
cHJvcGVydHkgbm90ZXMgZm9yIEFBcmNoNjQKMTUxNjJiNCBsaW51eC11c2VyOiBTZXQgUEFHRV9U
QVJHRVRfMSBmb3IgVEFSR0VUX1BST1RfQlRJCjQ5ZWQ3NGIgbGludXgtdXNlci9hYXJjaDY0OiBS
ZXNldCBidHlwZSBmb3Igc2lnbmFscwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8xMiBDaGVja2lu
ZyBjb21taXQgNDllZDc0YmMxYWVlIChsaW51eC11c2VyL2FhcmNoNjQ6IFJlc2V0IGJ0eXBlIGZv
ciBzaWduYWxzKQoyLzEyIENoZWNraW5nIGNvbW1pdCAxNTE2MmI0ZGNiZWMgKGxpbnV4LXVzZXI6
IFNldCBQQUdFX1RBUkdFVF8xIGZvciBUQVJHRVRfUFJPVF9CVEkpCjMvMTIgQ2hlY2tpbmcgY29t
bWl0IDQ2YjhlMDQ3ODFhMSAoaW5jbHVkZS9lbGY6IEFkZCBkZWZpbmVzIHJlbGF0ZWQgdG8gR05V
IHByb3BlcnR5IG5vdGVzIGZvciBBQXJjaDY0KQo0LzEyIENoZWNraW5nIGNvbW1pdCBmMTAxOWMw
NDE2YzMgKGxpbnV4LXVzZXIvZWxmbG9hZDogQXZvaWQgbGVha2luZyBpbnRlcnBfbmFtZSB1c2lu
ZyBHTGliIG1lbW9yeSBBUEkpCjUvMTIgQ2hlY2tpbmcgY29tbWl0IGQzNWFjMGUxOTMwYiAobGlu
dXgtdXNlci9lbGZsb2FkOiBGaXggY29kaW5nIHN0eWxlIGluIGxvYWRfZWxmX2ltYWdlKQo2LzEy
IENoZWNraW5nIGNvbW1pdCAzMTkyOTQzYjhkNzUgKGxpbnV4LXVzZXIvZWxmbG9hZDogQWRqdXN0
IGl0ZXJhdGlvbiBvdmVyIHBoZHIpCjcvMTIgQ2hlY2tpbmcgY29tbWl0IDBiZGYzYjljMDdmNiAo
bGludXgtdXNlci9lbGZsb2FkOiBNb3ZlIFBUX0lOVEVSUCBkZXRlY3Rpb24gdG8gZmlyc3QgbG9v
cCkKOC8xMiBDaGVja2luZyBjb21taXQgNWZhNjMwNTZlMDg0IChsaW51eC11c2VyL2VsZmxvYWQ6
IFVzZSBFcnJvciBmb3IgbG9hZF9lbGZfaW1hZ2UpCjkvMTIgQ2hlY2tpbmcgY29tbWl0IGUwNjNm
ZGU3ZDRiMSAobGludXgtdXNlci9lbGZsb2FkOiBVc2UgRXJyb3IgZm9yIGxvYWRfZWxmX2ludGVy
cCkKMTAvMTIgQ2hlY2tpbmcgY29tbWl0IDliMDUwNzdmYTJlZCAobGludXgtdXNlci9lbGZsb2Fk
OiBQYXJzZSBOVF9HTlVfUFJPUEVSVFlfVFlQRV8wIG5vdGVzKQoxMS8xMiBDaGVja2luZyBjb21t
aXQgNmRlOWUxMmIyYWRmIChsaW51eC11c2VyL2VsZmxvYWQ6IFBhcnNlIEdOVV9QUk9QRVJUWV9B
QVJDSDY0X0ZFQVRVUkVfMV9BTkQpCjEyLzEyIENoZWNraW5nIGNvbW1pdCBhZGRkZWJkOGE3MDIg
KHRlc3RzL3RjZy9hYXJjaDY0OiBBZGQgYnRpIHNtb2tlIHRlc3RzKQpXQVJOSU5HOiBhZGRlZCwg
bW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/
CiMzNzogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CgpFUlJPUjogZXh0ZXJucyBzaG91bGQgYmUgYXZv
aWRlZCBpbiAuYyBmaWxlcwojMTY1OiBGSUxFOiB0ZXN0cy90Y2cvYWFyY2g2NC9idGktMi5jOjU2
OgorZXh0ZXJuIGNoYXIgdGVzdF9iZWdpbltdLCB0ZXN0X2VuZFtdOwoKRVJST1I6IHVzZSBxZW11
X3JlYWxfaG9zdF9wYWdlX3NpemUgaW5zdGVhZCBvZiBnZXRwYWdlc2l6ZSgpCiMxOTk6IEZJTEU6
IHRlc3RzL3RjZy9hYXJjaDY0L2J0aS0yLmM6OTA6CisgICAgdm9pZCAqcCA9IG1tYXAoMCwgZ2V0
cGFnZXNpemUoKSwKCkVSUk9SOiBleHRlcm5zIHNob3VsZCBiZSBhdm9pZGVkIGluIC5jIGZpbGVz
CiMyMzY6IEZJTEU6IHRlc3RzL3RjZy9hYXJjaDY0L2J0aS1jcnQuaW5jLmM6MTM6CitpbnQgbWFp
bih2b2lkKTsKCnRvdGFsOiAzIGVycm9ycywgMSB3YXJuaW5ncywgMjQ3IGxpbmVzIGNoZWNrZWQK
ClBhdGNoIDEyLzEyIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMTAxNjE4NDIwNy43ODY2OTgt
MS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1t
ZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==
