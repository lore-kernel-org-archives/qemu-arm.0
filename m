Received: by 10.25.87.130 with SMTP id l124csp147885lfb;
        Mon, 5 Sep 2016 07:25:55 -0700 (PDT)
X-Received: by 10.98.65.139 with SMTP id g11mr22153949pfd.145.1473085555690;
        Mon, 05 Sep 2016 07:25:55 -0700 (PDT)
Return-Path: <no-reply@patchew.org>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com. [74.201.84.163])
        by mx.google.com with ESMTPS id zi9si29480614pac.192.2016.09.05.07.25.55
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 07:25:55 -0700 (PDT)
Received-SPF: neutral (google.com: 74.201.84.163 is neither permitted nor denied by best guess record for domain of no-reply@patchew.org) client-ip=74.201.84.163;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 74.201.84.163 is neither permitted nor denied by best guess record for domain of no-reply@patchew.org) smtp.mailfrom=no-reply@patchew.org
Received: from ex-std-node742.prod.rhcloud.com (ec2-52-6-146-230.compute-1.amazonaws.com [52.6.146.230]) by mx.zohomail.com
	with SMTPS id 1473085551713114.78191502269408; Mon, 5 Sep 2016 07:25:51 -0700 (PDT)
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20160905140944.5379-1-alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [RFC PATCH] hw/intc/arm_gic: handle Set-Active/Clear-Active registers
Message-ID: <20160905142548.373179.4923@ex-std-node742.prod.rhcloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Cc: famz@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Date: Mon, 5 Sep 2016 07:25:51 -0700 (PDT)
X-TUID: +S61SQ5MUqqM

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtSRkMgUEFUQ0hdIGh3L2ludGMvYXJtX2dpYzogaGFuZGxlIFNldC1BY3RpdmUvQ2xl
YXItQWN0aXZlIHJlZ2lzdGVycwpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxNjA5MDUxNDA5
NDQuNTM3OS0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAk
QkFTRS4uIHwgd2MgLWwpCmZhaWxlZD0wCgojIFVzZWZ1bCBnaXQgb3B0aW9ucwpnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZXMgVHJ1ZQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4u
KSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90
YWw6ICQoZ2l0IHNob3cgLS1uby1wYXRjaCAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdp
dCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWls
YmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0k
KChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0JwpjNDI0NzI1IGh3L2ludGMvYXJtX2dpYzogaGFuZGxlIFNldC1B
Y3RpdmUvQ2xlYXItQWN0aXZlIHJlZ2lzdGVycwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tp
bmcgUEFUQ0ggMS8xOiBody9pbnRjL2FybV9naWM6IGhhbmRsZSBTZXQtQWN0aXZlL0NsZWFyLUFj
dGl2ZSByZWdpc3RlcnMuLi4KRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwg
YXJtcyBvZiB0aGlzIHN0YXRlbWVudAojMjk6IEZJTEU6IGh3L2ludGMvYXJtX2dpYy5jOjk3ODoK
KyAgICAgICAgaWYgKGlycSA+PSBzLT5udW1faXJxIHx8IHMtPnJldmlzaW9uIDwgMikKWy4uLl0K
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzQ3OiBGSUxFOiBody9pbnRjL2FybV9naWMuYzo5OTQ6CisgICAgICAgIGlmIChpcnEg
Pj0gcy0+bnVtX2lycSkKWy4uLl0KCnRvdGFsOiAyIGVycm9ycywgMCB3YXJuaW5ncywgNDAgbGlu
ZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9V
VFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFp
bCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcv
XS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5v
cmc=
