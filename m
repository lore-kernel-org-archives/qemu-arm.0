Received: by 10.25.0.147 with SMTP id 141csp922681lfa;
        Wed, 22 Feb 2017 03:32:26 -0800 (PST)
X-Received: by 10.237.43.167 with SMTP id e36mr9590385qtd.245.1487763146785;
        Wed, 22 Feb 2017 03:32:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w54si197255qtw.90.2017.02.22.03.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Feb 2017 03:32:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgV9k-0007mr-9f
	for alex.bennee@linaro.org; Wed, 22 Feb 2017 06:32:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cgV9c-0007lb-PD
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 06:32:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cgV9Y-0008RM-L1
	for qemu-arm@nongnu.org; Wed, 22 Feb 2017 06:32:16 -0500
Resent-Date: Wed, 22 Feb 2017 06:32:16 -0500
Resent-Message-Id: <E1cgV9Y-0008RM-L1@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cgV9T-0008Pf-Ok; Wed, 22 Feb 2017 06:32:07 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1487763085616643.0378715341328;
	Wed, 22 Feb 2017 03:31:25 -0800 (PST)
In-Reply-To: <20170222112338.25492-1-clement.deschamps@antfield.fr>
Message-ID: <148776308488.129.17265389250289731388@0e2666bad730>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: clement.deschamps@antfield.fr
Date: Wed, 22 Feb 2017 03:31:25 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: Error: Can't connect to API
	socket.
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/3] add sdhost and gpio
 controllers to the bcm2835 platform
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, famz@redhat.com, qemu-devel@nongnu.org,
	andrew.baumann@microsoft.com, qemu-arm@nongnu.org,
	clement.deschamps@antfield.fr
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZQ5ztNGlVasW

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzClN1
YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjIgMC8zXSBhZGQgc2Rob3N0IGFuZCBncGlvIGNv
bnRyb2xsZXJzIHRvIHRoZSBiY20yODM1IHBsYXRmb3JtCk1lc3NhZ2UtaWQ6IDIwMTcwMjIyMTEy
MzM4LjI1NDkyLTEtY2xlbWVudC5kZXNjaGFtcHNAYW50ZmllbGQuZnIKCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0t
b25lbGluZSAkQkFTRS4uIHwgd2MgLWwpCmZhaWxlZD0wCgojIFVzZWZ1bCBnaXQgb3B0aW9ucwpn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJz
ZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRD
SCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAgIGlmICEg
Z2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1h
aWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZpCiAgICBu
PSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBk
YXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBw
YXRjaGV3LzIwMTcwMjIxMTg1OTAxLjMyNTYtMS1zdGVmYW5oYUByZWRoYXQuY29tIC0+IHBhdGNo
ZXcvMjAxNzAyMjExODU5MDEuMzI1Ni0xLXN0ZWZhbmhhQHJlZGhhdC5jb20KICogW25ldyB0YWdd
ICAgICAgICAgcGF0Y2hldy8yMDE3MDIyMjExMjMzOC4yNTQ5Mi0xLWNsZW1lbnQuZGVzY2hhbXBz
QGFudGZpZWxkLmZyIC0+IHBhdGNoZXcvMjAxNzAyMjIxMTIzMzguMjU0OTItMS1jbGVtZW50LmRl
c2NoYW1wc0BhbnRmaWVsZC5mcgpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmE0ODEx
YzIgYmNtMjgzNTogYWRkIHNkaG9zdCBhbmQgZ3BpbyBjb250cm9sbGVycwo3ZTM4MzM0IGJjbTI4
MzVfZ3BpbzogYWRkIGJjbTI4MzUgZ3BpbyBjb250cm9sbGVyCmFmODI0YzMgYmNtMjgzNV9zZGhv
c3Q6IGFkZCBiY20yODM1IHNkaG9zdCBjb250cm9sbGVyCgo9PT0gT1VUUFVUIEJFR0lOID09PQpD
aGVja2luZyBQQVRDSCAxLzM6IGJjbTI4MzVfc2Rob3N0OiBhZGQgYmNtMjgzNSBzZGhvc3QgY29u
dHJvbGxlci4uLgpDaGVja2luZyBQQVRDSCAyLzM6IGJjbTI4MzVfZ3BpbzogYWRkIGJjbTI4MzUg
Z3BpbyBjb250cm9sbGVyLi4uCkVSUk9SOiBzcGFjZSByZXF1aXJlZCBiZWZvcmUgdGhlIG9wZW4g
cGFyZW50aGVzaXMgJygnCiM5NzogRklMRTogaHcvZ3Bpby9iY20yODM1X2dwaW8uYzo2ODoKKyAg
ICBpZihraWQgPT0gTlVMTCkgewoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA0MDMgbGlu
ZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tp
bmcgUEFUQ0ggMy8zOiBiY20yODM1OiBhZGQgc2Rob3N0IGFuZCBncGlvIGNvbnRyb2xsZXJzLi4u
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgot
LS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBmcmVl
bGlzdHMub3Jn

