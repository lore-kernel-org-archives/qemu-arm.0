Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp10520102pjq;
        Thu, 11 Jul 2019 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEXyaES+KbBPO656MYIGmtGEAhgOC96quoLW8z9Qhucfc0CVawDjwvwjsgrDxLyTntW+v8
X-Received: by 2002:a81:4801:: with SMTP id v1mr2601300ywa.105.1562862326131;
        Thu, 11 Jul 2019 09:25:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562862326; cv=pass;
        d=google.com; s=arc-20160816;
        b=aI8p5D42WmNX0X65gWFd5XcezvbPdPRHqj1PJwHN/DQSb1T7XpR3EA5LsUYWDqVCAd
         UjYG2vHn1BfKa9EABHhVMpvGJbEhpL8pn1ZZK6hlWnU0U6J+mlc87mnauFzGgNlmSAJx
         jQ2wzJOwWbnF1NJ+m7anHtuz9GGor/9xl3bw/6ejfjcWQtBZxKT0oWbtKusPkyjQvD2J
         6YLLdSvp429BvdEMcM9ByHj6mCXz5DNYD1XSzAk+TdfxmWqO8nb5Q7mO3/2k5ZUDBkpu
         5FNffh4ip3gxgFBsSFoAWvjmpgIBk8y1Xz1OXk9u+KCSiQWrtTq/5g9mBSwJz+E7Thtz
         d8kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :reply-to:in-reply-to:subject:message-id;
        bh=8RmIBQYuIurmdHixcjrqO2OiaaXzomWbszRKiFQY0rY=;
        b=fgyfMRUssdXTcVIB/RImeq5rF1geVgoTFbJLTFCnZdrRMJIRpLMicxPRpZhaDR61BR
         gwqKLblY5Zo58KDPu+8qPeja/KeUDWcDQUTkfFplMARATE/5JeWJqK1/3IOM0nJxer4t
         QP5h8VfrpXa541DxSUeo1Lx2igrkW2hO0OposyVqUFfiF+NlOVZXSzQldQVKZ/IJAWCD
         nzycuJjtctgqWe6R+ambhbGdyvFI756ERhfB/Fkj+dMqUDhUF9qUabEkzZ/DNszrGJdU
         1fgh5ToBZlkHKlDy5bzRkhVB+I/ckvWeF8AOIbgPFQZ1j9bBSwRYf3hkN6mSapGP3Bu4
         npoQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.217 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com. [135.84.80.217])
        by mx.google.com with ESMTPS id d12si2519546ybj.115.2019.07.11.09.25.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 09:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 135.84.80.217 as permitted sender) client-ip=135.84.80.217;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.217 as permitted sender) smtp.mailfrom=no-reply@patchew.org
ARC-Seal: i=1; a=rsa-sha256; t=1562862323; cv=none; 
	d=zoho.com; s=zohoarc; 
	b=E9+97wRinc7j1/xs1w9wA6FBNPfFwigbG+x8Drpb5pvm03khPeHiAxTmavpcx6quctaLs/CaJP/G2OR5Mf7aowFMOGDQwGmDX9eQwpoBp9RLEd3tzZu7ILYzrHzqBtkBSuuWIaMmyOfyIPwJTy6ahV6CmLY0DxHPKivBUPlW1sI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
	t=1562862323; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results; 
	bh=8RmIBQYuIurmdHixcjrqO2OiaaXzomWbszRKiFQY0rY=; 
	b=YYYf60rlLk7HclEJ4eYZR9fog9HH9/iuDhG97i92n12wTXHJgn/MmaGMq3o27QhO5LKc7r4zkzcO77xubJLs3yTbEYnAt+nN9yxdhWnFVuW1cL0lPwgeM4bwbkQoLnTXn3/qcTYKrVVUMVUlbvsDxiTsE8/qAstM7PYdlx2lNlg=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1562862322044667.748582608529; Thu, 11 Jul 2019 09:25:22 -0700 (PDT)
Message-ID: <156286232095.12463.12241951202734755758@c4a48874b076>
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for arm926 and arm1026
In-Reply-To: <20190711121231.3601-1-peter.maydell@linaro.org>
Reply-To: <qemu-devel@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org, christophe.lyon@linaro.org, richard.henderson@linaro.org
Date: Thu, 11 Jul 2019 09:25:22 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: vmjKh1+4tFY5

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxMTEyMTIzMS4zNjAx
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBi
dWlsZCB0ZXN0IG9uIEZyZWVCU0QgaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cu
Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBzY3JpcHQg
d2lsbCBiZSBpbnZva2VkIHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQgcG9pbnRp
bmcgdG8gYSBjb21taXQgdGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Agb2YgImJh
c2UiCiMgYnJhbmNoCmlmIHFlbXUtc3lzdGVtLXg4Nl82NCAtLWhlbHAgPi9kZXYvbnVsbCAyPiYx
OyB0aGVuCiAgUUVNVT1xZW11LXN5c3RlbS14ODZfNjQKZWxpZiAvdXNyL2xpYmV4ZWMvcWVtdS1r
dm0gLS1oZWxwID4vZGV2L251bGwgMj4mMTsgdGhlbgogIFFFTVU9L3Vzci9saWJleGVjL3FlbXUt
a3ZtCmVsc2UKICBleGl0IDEKZmkKbWFrZSB2bS1idWlsZC1mcmVlYnNkIEo9MjEgUUVNVT0kUUVN
VQpleGl0IDAKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA3MTExMjEyMzEuMzYwMS0xLXBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0aW5nLkZyZWVCU0QvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=
