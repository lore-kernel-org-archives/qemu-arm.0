Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp899737wrq;
        Wed, 20 Jun 2018 08:29:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLfzcL9h1MvkEvDdxsVeZlUjYkkde7qy2xa6VJ5/0002r5wyok0LxqtJ8b0NobaCwBePOS3
X-Received: by 2002:aca:520c:: with SMTP id g12-v6mr9338846oib.66.1529508547938;
        Wed, 20 Jun 2018 08:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529508547; cv=none;
        d=google.com; s=arc-20160816;
        b=N28yGumstLINmoHvpdV53Pxt/a9iolmSXmV7TS0qbmYQCkmPxtrKXi2aAkKeNE0BYP
         qGsbJzYdTG/tVtEncp3c8rvUKNf4QXg9GM7SPaIwBW3OB/HBa93mWVPhKbH+Y8WwCrD2
         RtanNvt53FiDEhMd39QCffyRJlWebKtd6JnjZ9EHrQPcOfcF4ALnaVWWEdeXZ9GBFNAo
         AhhPQ7bEKkaAfEv3PeVvDvLCUue+xN6vywbvEepTAzsLMHb8wTVGnR98pxUnGf88DwXP
         6F+DCQfuCm8zRsky0kW2i1FsvUak3jmO+wiZAVP+Gwb7lwWP6DPl9y9Ywy6qzB7xM0FI
         iOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to:arc-authentication-results;
        bh=Vgi1d5f8TYdj9b5t1oaYyGYf268F5yPlTOftbSZNAu8=;
        b=G1LqP0O6lOdILvrG/gX3TeyWBcXKONeYDlVnQmx7vSc5RWqreC24PNXQBAcpkTaJBa
         1LTVDhMWRCKSqUnIiCTVHmocpZ3RXZlKvkIB98OYg4bT0Y5TACFa5Mcl86TjKpy/Kluc
         mlWVPH5xaMJ71uDRWwEyh1V4JudcDyMwDHmDu+UDndEA8bEdW21XTVOPhiO1cZIJKSJu
         Fhn9aMqfTd5dM69s7GUTGyy5tQhjYfluqqasnLI24rIe/vMcxi7c4Y4wrWmUzTpoQQ0K
         qMufqTG9Lxohoucn4UzIqkmVIHLSPFdNBR1MIfkjfjeTu8OkwJ93fAxPxaeItceGr6xP
         Qd1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.216 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com. [135.84.80.216])
        by mx.google.com with ESMTPS id h37-v6si958072otc.293.2018.06.20.08.29.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 08:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 135.84.80.216 as permitted sender) client-ip=135.84.80.216;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of no-reply@patchew.org designates 135.84.80.216 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1529508543303332.55804671113333; Wed, 20 Jun 2018 08:29:03 -0700 (PDT)
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v3 0/8] arm: implement TZ MPC
Message-ID: <152950854265.807.2921422904366195000@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Cc: famz@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, alex.bennee@linaro.org, patches@linaro.org
Date: Wed, 20 Jun 2018 08:29:03 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: AfC4QKoezZAa

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNjIwMTMyMDMyLjI4ODY1LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
ClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjMgMC84XSBhcm06IGltcGxlbWVudCBUWiBN
UEMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEK
dG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4uIHwgd2MgLWwpCmZhaWxlZD0wCgpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Cgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3Ig
YyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChn
aXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZv
cm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgog
ICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoK
ZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMy
MWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKZmYxZDNkZTJiZCBody9hcm0vbXBzMi10ei5jOiBJbnN0YW50aWF0ZSBNUENzCjVlOGVm
N2U3MGUgaHcvYXJtL2lvdGtpdDogV2lyZSB1cCBNUEMgaW50ZXJydXB0IGxpbmVzCmU2MjhkNmEy
ZmQgaHcvYXJtL2lvdGtpdDogSW5zdGFudGlhdGUgTVBDCjk3ZmQ4ODI0MTMgaHcvbWlzYy9pb3Rr
aXQtc2VjY3RsLmM6IEltcGxlbWVudCBTRUNNUENJTlRTVEFUVVMKYjg5MDQ5OWU2NyBody9taXNj
L3R6X21wYy5jOiBIb25vdXIgdGhlIEJMS19MVVQgc2V0dGluZ3MgaW4gdHJhbnNsYXRlCjRhOTAw
NjY0YmUgaHcvbWlzYy90ei1tcGMuYzogSW1wbGVtZW50IGNvcnJlY3QgYmxvY2tlZC1hY2Nlc3Mg
YmVoYXZpb3VyCmRiNzFlZWUxYjAgaHcvbWlzYy90ei1tcGMuYzogSW1wbGVtZW50IHJlZ2lzdGVy
cwpmNzAyZWY2ZjhlIGh3L21pc2MvdHotbXBjLmM6IEltcGxlbWVudCB0aGUgQXJtIFRydXN0Wm9u
ZSBNZW1vcnkgUHJvdGVjdGlvbiBDb250cm9sbGVyCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVj
a2luZyBQQVRDSCAxLzg6IGh3L21pc2MvdHotbXBjLmM6IEltcGxlbWVudCB0aGUgQXJtIFRydXN0
Wm9uZSBNZW1vcnkgUHJvdGVjdGlvbiBDb250cm9sbGVyLi4uCldBUk5JTkc6IGFkZGVkLCBtb3Zl
ZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzg1
OiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNTA0
IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KQ2hl
Y2tpbmcgUEFUQ0ggMi84OiBody9taXNjL3R6LW1wYy5jOiBJbXBsZW1lbnQgcmVnaXN0ZXJzLi4u
CkNoZWNraW5nIFBBVENIIDMvODogaHcvbWlzYy90ei1tcGMuYzogSW1wbGVtZW50IGNvcnJlY3Qg
YmxvY2tlZC1hY2Nlc3MgYmVoYXZpb3VyLi4uCkNoZWNraW5nIFBBVENIIDQvODogaHcvbWlzYy90
el9tcGMuYzogSG9ub3VyIHRoZSBCTEtfTFVUIHNldHRpbmdzIGluIHRyYW5zbGF0ZS4uLgpDaGVj
a2luZyBQQVRDSCA1Lzg6IGh3L21pc2MvaW90a2l0LXNlY2N0bC5jOiBJbXBsZW1lbnQgU0VDTVBD
SU5UU1RBVFVTLi4uCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJyonIChjdHg6
VnhWKQojOTE6IEZJTEU6IGh3L21pc2MvaW90a2l0LXNlY2N0bC5jOjcxMToKKyAgICAuc3Vic2Vj
dGlvbnMgPSAoY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uKltdKSB7CiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5n
cywgMTAwIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KCkNoZWNraW5nIFBBVENIIDYvODogaHcvYXJtL2lvdGtpdDogSW5zdGFudGlhdGUgTVBDLi4u
CkNoZWNraW5nIFBBVENIIDcvODogaHcvYXJtL2lvdGtpdDogV2lyZSB1cCBNUEMgaW50ZXJydXB0
IGxpbmVzLi4uCkNoZWNraW5nIFBBVENIIDgvODogaHcvYXJtL21wczItdHouYzogSW5zdGFudGlh
dGUgTVBDcy4uLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBj
b2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQ==
