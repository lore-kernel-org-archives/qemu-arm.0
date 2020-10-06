Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp876413lfq;
        Tue, 6 Oct 2020 10:30:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD/FpGW8UGDLfqh8eGV4KRynUgsc7+Vn7o9qUo6/SEvJVk+j755lJ4Y5tbCPwTtUqxJryt
X-Received: by 2002:aa7:d719:: with SMTP id t25mr6780186edq.11.1602005449402;
        Tue, 06 Oct 2020 10:30:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602005449; cv=pass;
        d=google.com; s=arc-20160816;
        b=gW3u1wX7NlqSoLlrQBwXY7Vy40E6fpqV+L+agTVS5j7udOUZ/gteIYYQh0IFUlhA7I
         8/DjB8dBcKZy87tUhfUhhNMuPkLkfesp0kuKjqXD/xiGn4jgjctdvX+Sp4VqO0xhJIeX
         pGvtYpKt4kOQyrqGJB519CahlbBX47SEj9ag1CQhJgu8YKq61h8JkpeAJ4wsknNqsoOd
         kS/xZk3jxACScz+Xwu6gtAnHq4S5ZRKsKv1sLCDh97iQAjXRNDI3FWsj2/HBpC+hUj4k
         cqd/HgFQK7/ale/FKU/obJ+uGp5/VXVpCH/N1xo2Wb+FBK7km1FK6wCNUR4aY70s8P/T
         Ez4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :in-reply-to:reply-to:message-id:subject;
        bh=Oi1pAqgVx+2bb8XriszpPgAWFE6aVN3KOpO6vZM0ff0=;
        b=y0qPw90ikzP/Fm5iVp7VyHx4SEFYfn99r/1d9u7GPrlvIX3drFNYrS2Ywt02gWl004
         Ee+ENh2MWYWYRAtpm4cosr3Nekq3RajR0APB0dpLutGkAWNsMB6ocifBA4yIaMpu+1iU
         v4mmbpFjpPZV7NXkbZDzU5dXF6ExkCG8wduFdkk3RDfRovj02bb8AqJ7cHkF0T92+w+x
         lIT8R2ifLVoG/rCO6qXBRg46xd2W2bMbYGlOmC+2e2TkAsQnaiD0PEapnH2qZ+iQ1ioA
         /8+FUTjddOl0Zg/7W7TwnAWVQ3Infbgc2DEGKRweMCu8CetW9/6UcdoNSBkXBw1U90Ke
         npwg==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com. [136.143.188.53])
        by mx.google.com with ESMTPS id m1si2740665edj.567.2020.10.06.10.30.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 10:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) client-ip=136.143.188.53;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.53 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1602005446; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CYhc08f7iX6sySjHB/zNbjamVWqnXHt9l8EFCJQJ4w9G+u+OeyJ8jLjLsIQpVHbKnmAaPQyJqcrjLhN5sIOtncP6eNZP+1Vrdv6uvqTXT1eu4ejg2Echx3CPPzi8fW9ZII7sG4t956jgwHgyFYHqXCkh1JeuU6QXDkHks+iWTg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1602005446; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=Oi1pAqgVx+2bb8XriszpPgAWFE6aVN3KOpO6vZM0ff0=; 
	b=Ugt6QGlTk9jQ0l0q6+mb28/q34tHp30KSWHPwxKipTzPQXnDwuEL8XmGsLtoMG6rf7g7VS0o8yHmZMu0mGCom3BRA4PJeWeJCai1DZwUmmZChn/Cujz3OQbDyNio2WLLJXInXKpP08FePi6l+WReNUwy8mURTyb6kGU2ui+BMcs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1602005444161680.0338005994042; Tue, 6 Oct 2020 10:30:44 -0700 (PDT)
Subject: Re: [PATCH v10.5 0/1] tests/tcg/aarch64: Add bti mmap smoke test
Message-ID: <160200544274.31697.252440278996982882@66eaa9a8a123>
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20201006172359.2998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Date: Tue, 6 Oct 2020 10:30:44 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: 9lDWbWKvz5hw

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAwNjE3MjM1OS4yOTk4
LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVt
cyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZv
cgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMDA2MTcy
MzU5LjI5OTgtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtQQVRDSCB2
MTAuNSAwLzFdIHRlc3RzL3RjZy9hYXJjaDY0OiBBZGQgYnRpIG1tYXAgc21va2UgdGVzdAoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hl
dy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMTAwNTE2NTE0
Ny41MjY0MjYtMS1jbGdAa2FvZC5vcmcgLT4gcGF0Y2hldy8yMDIwMTAwNTE2NTE0Ny41MjY0MjYt
MS1jbGdAa2FvZC5vcmcKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMTAwNTIwNTIy
OC42OTc0NjMtMS1laGFia29zdEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDEwMDUyMDUyMjgu
Njk3NDYzLTEtZWhhYmtvc3RAcmVkaGF0LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3
LzIwMjAxMDA2MTU0MjU2LjE3MzkyLTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZyAtPiBwYXRjaGV3
LzIwMjAxMDA2MTU0MjU2LjE3MzkyLTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjAxMDA2MTcyMzU5LjI5OTgtMS1yaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMDEwMDYxNzIzNTkuMjk5OC0xLXJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpiZWY5NGY3
IHRlc3RzL3RjZy9hYXJjaDY0OiBBZGQgYnRpIG1tYXAgc21va2UgdGVzdAoKPT09IE9VVFBVVCBC
RUdJTiA9PT0KV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBN
QUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMzY6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKRVJS
T1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzk2OiBGSUxFOiB0ZXN0
cy90Y2cvYWFyY2g2NC9idGktMi5jOjU2OgorZXh0ZXJuIGNoYXIgdGVzdF9iZWdpbltdLCB0ZXN0
X2VuZFtdOwoKRVJST1I6IHVzZSBxZW11X3JlYWxfaG9zdF9wYWdlX3NpemUgaW5zdGVhZCBvZiBn
ZXRwYWdlc2l6ZSgpCiMxMzA6IEZJTEU6IHRlc3RzL3RjZy9hYXJjaDY0L2J0aS0yLmM6OTA6Cisg
ICAgdm9pZCAqcCA9IG1tYXAoMCwgZ2V0cGFnZXNpemUoKSwKCnRvdGFsOiAyIGVycm9ycywgMSB3
YXJuaW5ncywgMTI0IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBiZWY5NGY3MzNhN2YgKHRlc3RzL3Rj
Zy9hYXJjaDY0OiBBZGQgYnRpIG1tYXAgc21va2UgdGVzdCkgaGFzIHN0eWxlIHByb2JsZW1zLCBw
bGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVz
IHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJ
TkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMDEwMDYxNzIzNTkuMjk5OC0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
