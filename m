Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp516929wru;
        Wed, 15 Aug 2018 03:15:40 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwdWbTkRFhquzCz56hYW4IEMB78Hmra7zJdoCergNetlDtMEaTSjG7A/pOoGqgAkgmWadE7
X-Received: by 2002:aca:ceca:: with SMTP id e193-v6mr24821064oig.37.1534328140466;
        Wed, 15 Aug 2018 03:15:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1534328140; cv=pass;
        d=google.com; s=arc-20160816;
        b=H8fMM20DSsidqMbOfslLkGBviR/TjdaO7v/vlzYwumLd6GqP+JyYvoAWcQRLkFV/Is
         HF13U/kOAr0crCKQa0y9EkS88GpoOM+ObvCEzg7VDR3V7muEOMJNgyH9b+jgZBH3zdMk
         1dpSJscupqnFj1t/1as86Q9nm/wVdnAICcklL1njqq9z8HCRAcywMNuPhv+g8i+bcVj3
         kL3vw4ZC1ANVVP0Ns9p6NoBLOWQdTxD0qk5zyUkDPcoRCVKQbI+cladjYjfLCkmUATGD
         xHy0qmH9JVtGpaEYFOJupeeu4x1fkQ0YUXdZeuGBA2/x2q9BwF7Fm/hekJlEjoC8U3FI
         /DqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:reply-to:subject:in-reply-to:arc-authentication-results
         :arc-message-signature:arc-authentication-results;
        bh=qQYJTBJS0GctDWo/vd4Yx2qHFc8PFD8+HS+uE9csC1w=;
        b=xOBbkr/MPCLoK9PuHNjY2oIsiDDLx75g5zqh2/HlGqhJR0dVy4nJLsZuoa9Vx2G5Fy
         a8Rvzmv0IRSkSvZavmwkeMXBE6lH8IEWSpjh4H8wkF+M72BPlODgQwwLXGvwCfb9tPx3
         eMnrsJWKD+VtFJCXhQZUxU8r4B+/fdB7N9fMAkE9av77RoQEhd86ctdXsBD8k0kvlxRf
         SO9yZLs0ll6c41OGDX0jv7zNKuq/twtnoCSPtMRlJfuOqL6b4RKhizgQHjYSvQAWv4Q9
         Pv9CUeGEbKk9EuOt9nZ5fJvN51WuhPSddc+qOfyazExVLPQDqM3u4aWyM4DWaN9HqZ+p
         g9lw==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.216 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com. [135.84.80.216])
        by mx.google.com with ESMTPS id 128-v6si12522711oig.361.2018.08.15.03.15.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Aug 2018 03:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 135.84.80.216 as permitted sender) client-ip=135.84.80.216;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.216 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1534328137; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=mFj93IA1OtpT+8iAYyyYVB7fX70xOgMbD6cqRcMtjhEhDlNYmeP7d1NnYF/dp8V5jWJns0VvdWO4MnZ/M46uSnnkdm97O5er3qXLTD4Bol1xHHF2Y9sGqXFP/EJHEO5lC9cf43K75xkfChdvACLWKiX33YaAvYZOPCsYd9pg2O4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1534328137; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=qQYJTBJS0GctDWo/vd4Yx2qHFc8PFD8+HS+uE9csC1w=; 
	b=UTtnBm55VOmwECkeHMANIIeOvAF7NkH0zyPWrDTgD89GshzF8J/2PEYPq0LgmSXY+ZCMetL8fX5h/IJ/SAXzUoW1XpwJ2ljCaAu3/UZ8Iy0c2HPtOr2F5rkiYT1ej21W/5KzRgwvICss9DkblQ95jJamBEnAdblnq6HOg+ar6dw=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1534328136310719.2960177647767; Wed, 15 Aug 2018 03:15:36 -0700 (PDT)
In-Reply-To: <20180808123934.17450-1-alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [RFC PATCH 0/4] add hand-rolled fallback when capstone fails
Reply-To: <qemu-devel@nongnu.org>
Message-ID: <153432813498.11690.14972227439194314970@502c9da6d61e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: famz@redhat.com, qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Date: Wed, 15 Aug 2018 03:15:36 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: 8R8qDeEUeNjw

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwODA4MTIzOTM0LjE3NDUwLTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwpT
dWJqZWN0OiBbUWVtdS1kZXZlbF0gW1JGQyBQQVRDSCAwLzRdIGFkZCBoYW5kLXJvbGxlZCBmYWxs
YmFjayB3aGVuIGNhcHN0b25lIGZhaWxzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8
IHdjIC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0t
cmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2lu
ZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAg
IGlmICEgZ2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLW1haWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZp
CiAgICBuPSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0
Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmRlZjBmMWVjNDYgZGlzYXM6IGFsbG93IGNhcHN0
b25lIHRvIGRlZmVyIHRvIGEgZmFsbGJhY2sgZnVuY3Rpb24gb24gZmFpbHVyZQowOGYyNTBiNTcx
IHRhcmdldC9hcm06IGFkZCBhIGZhbGxiYWNrIGRpc2Fzc2VtYmxlIGZ1bmN0aW9uCjQ4OTFhOGZi
YjcgdGFyZ2V0L2FybTogbW92ZSBkZWNvZGVyIGhlbHBlcnMgaW50byBoZWFkZXIKYjFlNDE2NTZl
ZiBzY3JpcHRzL2RlY29kZXRyZWUucHk6IGFkZCBhIGRpc2Fzc2VtYmx5IGdlbmVyYXRvciAoSEFD
SyEpCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzQ6IHNjcmlwdHMvZGVj
b2RldHJlZS5weTogYWRkIGEgZGlzYXNzZW1ibHkgZ2VuZXJhdG9yIChIQUNLISkuLi4KRVJST1I6
IHVubmVjZXNzYXJ5IHdoaXRlc3BhY2UgYmVmb3JlIGEgcXVvdGVkIG5ld2xpbmUKIzY4OiBGSUxF
OiBzY3JpcHRzL2RlY29kZXRyZWUucHk6NTAzOgorICAgICAgICBvdXRwdXQoJyIpOyBcbicpCgpX
QVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojODU6IEZJTEU6IHNjcmlwdHMvZGVjb2Rl
dHJlZS5weToxMDA5OgorICAgIGxvbmdfb3B0cyA9IFsnZGVjb2RlPScsICd0cmFuc2xhdGU9Jywg
J291dHB1dD0nLCAnaW5zbndpZHRoPScsICdkaXNhc3NlbWJsZSddCgp0b3RhbDogMSBlcnJvcnMs
IDEgd2FybmluZ3MsIDk4IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2Js
ZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9z
aXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBN
QUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDIvNDogdGFyZ2V0L2FybTogbW92ZSBkZWNvZGVy
IGhlbHBlcnMgaW50byBoZWFkZXIuLi4KV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQg
ZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMTU6IApuZXcgZmlsZSBt
b2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxMTIgbGluZXMgY2hlY2tl
ZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkg
b2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgpDaGVja2luZyBQQVRDSCAz
LzQ6IHRhcmdldC9hcm06IGFkZCBhIGZhbGxiYWNrIGRpc2Fzc2VtYmxlIGZ1bmN0aW9uLi4uCldB
Uk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMg
bmVlZCB1cGRhdGluZz8KIzM1OiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCldBUk5JTkc6IGxpbmUg
b3ZlciA4MCBjaGFyYWN0ZXJzCiM1MDogRklMRTogdGFyZ2V0L2FybS9kaXNhc3NlbWJsZS5jOjEx
Ogorc2l6ZV90IGRvX2FhcmNoNjRfZmFsbGJhY2tfZGlzYXNzZW1ibHkoY29uc3QgdWludDhfdCAq
aW5zbnAsIGNoYXIgKnB0ciwgc2l6ZV90IG4pCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFj
dGVycwojNzA6IEZJTEU6IHRhcmdldC9hcm0vaW50ZXJuYWxzLmg6Nzk5Ogorc2l6ZV90IGRvX2Fh
cmNoNjRfZmFsbGJhY2tfZGlzYXNzZW1ibHkoY29uc3QgdWludDhfdCAqaW5zbiwgY2hhciAqcHRy
LCBzaXplX3Qgbik7Cgp0b3RhbDogMCBlcnJvcnMsIDMgd2FybmluZ3MsIDM5IGxpbmVzIGNoZWNr
ZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KQ2hlY2tpbmcgUEFUQ0gg
NC80OiBkaXNhczogYWxsb3cgY2Fwc3RvbmUgdG8gZGVmZXIgdG8gYSBmYWxsYmFjayBmdW5jdGlv
biBvbiBmYWlsdXJlLi4uCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3
aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t
