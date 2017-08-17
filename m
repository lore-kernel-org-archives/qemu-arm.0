Received: by 10.223.183.22 with SMTP id l22csp2506509wre;
        Thu, 17 Aug 2017 11:32:44 -0700 (PDT)
X-Received: by 10.202.76.148 with SMTP id z142mr9050947oia.271.1502994764843;
        Thu, 17 Aug 2017 11:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502994764; cv=none;
        d=google.com; s=arc-20160816;
        b=S1q6eUB7BXHEyfHJKy501rHcfu560wZWRPuJ01ivwqespBBe7jIic+o0dxJh0dWmFA
         ebWXEvWcsZRJBg2GEC4j5/FX/e9fwTAyTfwpRAL/V3CKr5F78gfQlOetXwd2FK2D90oT
         qahEMrE8kqdwwQeJOU8a156KBdOmRUcHstpvHOG1Q8TIduAnA+GIkWdjDeJm5Dntem2w
         24W4m9k+9CfD/+uUTLi5oOOAW/MxFc919TvoVDEv2Z4IyceNLNjZ5N7y7zSgTpVplz10
         NRI27eq21bF/SzwoCUK0QJH001FF+u6JEbhNevunucXotZau6W8SSPqS6KgBi77io4Fz
         cklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :in-reply-to:subject:reply-to:message-id:arc-authentication-results;
        bh=AyG/vzFnl4CnxX5W1v/B1fPBNxkW+MKFmdET/QQS7U8=;
        b=GuSyLwpn8K6+teNVD2GT2fVi6YX05qMPPahpsbaDqL1yYoP3BwXJI4Fx7N9I5MmzCE
         666fHivyeLrkNzUbhsaKfR2Z0yLDiA5/ds4foRK+9wq4Ew8NH1JXhN9essnEgbqWWGfa
         hnilLcYceOBfsB2C5eHpJbRmobAo2XEyUUQrtBJgjX6sYI9lc2gw71wR7lmtdZg913Zy
         rTKzkzpMPjabsq4py2/jA4H0a+XyjtQL5k/XKGeXSwMV6Ba8hFiV949PcJJp2IEk2jtu
         IDjGFocvgbcT0aOeYk09eo99CZ8sVvwRGpmsCNEhMZa+px3EPIuDkbzMIuEw+k4wLDfM
         GC+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 135.84.80.217 is neither permitted nor denied by best guess record for domain of no-reply@patchew.org) smtp.mailfrom=no-reply@patchew.org
Return-Path: <no-reply@patchew.org>
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com. [135.84.80.217])
        by mx.google.com with ESMTPS id j62si2852037oif.268.2017.08.17.11.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 11:32:44 -0700 (PDT)
Received-SPF: neutral (google.com: 135.84.80.217 is neither permitted nor denied by best guess record for domain of no-reply@patchew.org) client-ip=135.84.80.217;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 135.84.80.217 is neither permitted nor denied by best guess record for domain of no-reply@patchew.org) smtp.mailfrom=no-reply@patchew.org
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1502994760334461.6627004021169; Thu, 17 Aug 2017 11:32:40 -0700 (PDT)
Message-ID: <150299475927.27.5716239824585872477@205a2245145f>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [RFC PATCH 0/9] TCG Vector types and example conversion
In-Reply-To: <20170817180404.29334-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: famz@redhat.com, rth@twiddle.net, cota@braap.org, batuzovk@ispras.ru, qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Date: Thu, 17 Aug 2017 11:32:40 -0700 (PDT)
X-ZohoMailClient: External
X-TUID: cxZNud/1xSXe

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTcwODE3MTgwNDA0LjI5MzM0LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwpT
dWJqZWN0OiBbUWVtdS1kZXZlbF0gW1JGQyBQQVRDSCAwLzldIFRDRyBWZWN0b3IgdHlwZXMgYW5k
IGV4YW1wbGUgY29udmVyc2lvbgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFz
aAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAt
bCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3Jt
YXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8g
IkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMp
Li4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNo
bwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYmFiNjExOTJhNCB0YXJnZXQvYXJt
L3RyYW5zbGF0ZS1hNjQ6IHZlY3RvcmlzZSBzbXVsbCB2RC40cywgdk4uWzQ4XXMsIHZNLmhbXQpj
NWM3MzNhMWY5IHRhcmdldC9hcm0vaGVscGVyczogaW50cm9kdWNlIEFEVlNJTUQgZmxhZ3MKZTI3
NjkxZjA3YSB0YXJnZXQvYXJtL3RyYW5zbGF0ZS1hNjQ6IHJlZ2lzdGVyIGdsb2JhbCB2ZWN0b3Jz
CjZhNTVlNjA0NTQgdGFyZ2V0L2FybS90cmFuc2xhdGUtYTY0OiByZWduYW1lcyAtPiB4X3JlZ25h
bWVzCmU3YTBlMjQ2NmIgYXJtL2NwdS5oOiBhbGlnbiBWRlAgcmVnaXN0ZXJzCmVmYTk0YzA0Y2Ug
aGVscGVyLWhlYWQ6IGFkZCBzdXBwb3J0IGZvciB2ZWMgdHlwZQpkOGM5NmViZGQyIHRjZzogZ2Vu
ZXJhdGUgcHRycyB0byB2ZWN0b3IgcmVnaXN0ZXJzCjI2ZWMwN2MzZDcgdGNnOiBpbnRyb2R1Y2Ug
dGhlIGNvbmNlcHRzIG9mIGEgVENHdl92ZWMgcmVnaXN0ZXIgdHlwZQo5ZWMzYjQ3NTRkIHRjZy9S
RUFETUU6IGxpc3RpZnkgdGhlIFRDRyB0eXBlcy4KCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNr
aW5nIFBBVENIIDEvOTogdGNnL1JFQURNRTogbGlzdGlmeSB0aGUgVENHIHR5cGVzLi4uLgpDaGVj
a2luZyBQQVRDSCAyLzk6IHRjZzogaW50cm9kdWNlIHRoZSBjb25jZXB0cyBvZiBhIFRDR3ZfdmVj
IHJlZ2lzdGVyIHR5cGUuLi4KQ2hlY2tpbmcgUEFUQ0ggMy85OiB0Y2c6IGdlbmVyYXRlIHB0cnMg
dG8gdmVjdG9yIHJlZ2lzdGVycy4uLgpDaGVja2luZyBQQVRDSCA0Lzk6IGhlbHBlci1oZWFkOiBh
ZGQgc3VwcG9ydCBmb3IgdmVjIHR5cGUuLi4KQ2hlY2tpbmcgUEFUQ0ggNS85OiBhcm0vY3B1Lmg6
IGFsaWduIFZGUCByZWdpc3RlcnMuLi4KQ2hlY2tpbmcgUEFUQ0ggNi85OiB0YXJnZXQvYXJtL3Ry
YW5zbGF0ZS1hNjQ6IHJlZ25hbWVzIC0+IHhfcmVnbmFtZXMuLi4KQ2hlY2tpbmcgUEFUQ0ggNy85
OiB0YXJnZXQvYXJtL3RyYW5zbGF0ZS1hNjQ6IHJlZ2lzdGVyIGdsb2JhbCB2ZWN0b3JzLi4uCkNo
ZWNraW5nIFBBVENIIDgvOTogdGFyZ2V0L2FybS9oZWxwZXJzOiBpbnRyb2R1Y2UgQURWU0lNRCBm
bGFncy4uLgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNTA6IEZJTEU6IHRhcmdl
dC9hcm0vYWR2c2ltZF9oZWxwZXJfZmxhZ3MuaDozMDoKKyAqICAgQURWU0lNRF9BTExfRUxUICAt
IHRoZSB0b3RhbCBjb3VudCBvZiBlbGVtZW50cyAoZS5nLiBjbGVhciBhbGwtb3ByIGVsZW1lbnRz
KQoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCA2NSBsaW5lcyBjaGVja2VkCgpZb3VyIHBh
dGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBl
cnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwg
c2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCkNoZWNraW5nIFBBVENIIDkvOTogdGFyZ2V0
L2FybS90cmFuc2xhdGUtYTY0OiB2ZWN0b3Jpc2Ugc211bGwgdkQuNHMsIHZOLls0OF1zLCB2TS5o
W10uLi4KV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzY1OiBGSUxFOiB0YXJnZXQv
YXJtL3RyYW5zbGF0ZS1hNjQuYzoxMDQ2OToKK3R5cGVkZWYgdm9pZCBBZHZTSU1ER2VuVHdvUGx1
c09uZVZlY3RvckZuKFRDR3ZfdmVjLCBUQ0d2X3ZlYywgVENHdl9pMzIsIFRDR3ZfaTMyKTsKCkVS
Uk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNzE6IEZJTEU6IHRhcmdldC9hcm0vdHJhbnNs
YXRlLWE2NC5jOjEwNDc1Ogorc3RhdGljIGJvb2wgaGFuZGxlX3ZlY19zaW1kX211bF9hZGRzdWIo
RGlzYXNDb250ZXh0ICpzLCB1aW50MzJfdCBpbnNuLCBpbnQgb3Bjb2RlLCBpbnQgc2l6ZSwgYm9v
bCBpc19xLCBib29sIHUsIGludCBybiwgaW50IHJtLCBpbnQgcmQpCgpFUlJPUjogdGhhdCBvcGVu
IGJyYWNlIHsgc2hvdWxkIGJlIG9uIHRoZSBwcmV2aW91cyBsaW5lCiM4NjogRklMRTogdGFyZ2V0
L2FybS90cmFuc2xhdGUtYTY0LmM6MTA0OTA6CisgICAgICAgICAgICBpZiAoIXUpCisgICAgICAg
ICAgICB7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojOTU6IEZJTEU6IHRhcmdl
dC9hcm0vdHJhbnNsYXRlLWE2NC5jOjEwNDk5OgorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBBRFZTSU1EX09QUl9FTFRfU0hJRlQsIEFEVlNJTURfT1BSX0VMVF9CSVRTLCA0
KTsKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojOTk6IEZJTEU6IHRhcmdldC9hcm0v
dHJhbnNsYXRlLWE2NC5jOjEwNTAzOgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQURWU0lNRF9ET0ZGX0VMVF9TSElGVCwgQURWU0lNRF9ET0ZGX0VMVF9CSVRTLCA0
KTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMxNDE6IEZJTEU6IHRhcmdldC9h
cm0vdHJhbnNsYXRlLWE2NC5jOjEwNTkwOgorICAgICAgICBpZiAoaGFuZGxlX3ZlY19zaW1kX211
bF9hZGRzdWIocywgaW5zbiwgb3Bjb2RlLCBzaXplLCBpc19xLCB1LCBybiwgcm0sIHJkKSkgewoK
dG90YWw6IDMgZXJyb3JzLCAzIHdhcm5pbmdzLCAxMDkgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRj
aCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJy
b3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNl
ZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNv
bW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=
