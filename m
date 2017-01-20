Received: by 10.25.77.65 with SMTP id a62csp136908lfb;
        Fri, 20 Jan 2017 11:15:20 -0800 (PST)
X-Received: by 10.55.192.196 with SMTP id v65mr13769434qkv.40.1484939720255;
        Fri, 20 Jan 2017 11:15:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b50si5489492qte.235.2017.01.20.11.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 11:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeeb-0002Ed-IL
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 14:15:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cUeeV-0002ET-J6
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 14:15:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1cUeeM-0001Lk-OO
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 14:15:11 -0500
Resent-Date: Fri, 20 Jan 2017 14:15:11 -0500
Resent-Message-Id: <E1cUeeM-0001Lk-OO@eggs.gnu.org>
Received: from sender163-mail.zoho.com ([74.201.84.163]:21374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1cUeeM-0001L8-Fv; Fri, 20 Jan 2017 14:15:02 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1484939694956908.4765531137635;
	Fri, 20 Jan 2017 11:14:54 -0800 (PST)
Message-ID: <148493969359.28.10118375645387403835@b042e9bf0dd0>
In-Reply-To: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Fri, 20 Jan 2017 11:14:54 -0800 (PST)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.201.84.163
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] ARMv7M: some simple
 bugfixes and cleanups
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
Cc: famz@redhat.com, patches@linaro.org, ilg@livius.net, mdavidsaver@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: svlH8xmfrBpf

SGksCgpZb3VyIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSCAwLzZdIEFSTXY3TTogc29tZSBzaW1wbGUgYnVnZml4ZXMgYW5kIGNsZWFu
dXBzCk1lc3NhZ2UtaWQ6IDE0ODQ5Mzc4ODMtMTA2OC0xLWdpdC1zZW5kLWVtYWlsLXBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZwpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFT
RS4uIHwgd2MgLWwpCmZhaWxlZD0wCgojIFVzZWZ1bCBnaXQgb3B0aW9ucwpnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQoKY29tbWl0cz0iJChnaXQgbG9nIC0tZm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIK
Zm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBlY2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6
ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVzICRjKS4uLiIKICAgIGlmICEgZ2l0IHNob3cgJGMg
LS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIC07IHRo
ZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAgIGVjaG8KICAgIGZpCiAgICBuPSQoKG4rMSkpCmRv
bmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1
YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFu
Y2ggJ3Rlc3QnCjY2MzAyZjcgYXJtdjdtOiBDbGVhciBGQVVMVE1BU0sgb24gcmV0dXJuIGZyb20g
bm9uLU5NSSBleGNlcHRpb25zCjE3MmJjZGYgYXJtdjdtOiBGaXggcmVhZHMgb2YgQ09OVFJPTCBy
ZWdpc3RlciBiaXQgMQo4ZGIyZDZhIGh3L3JlZ2lzdGVyZmllbGRzLmg6IFB1bGwgRklFTEQgZXRj
IG1hY3JvcyBvdXQgb2YgaHcvcmVnaXN0ZXIuaAo2MTVkYzZhIGFybXY3bTogRXhwbGljaXQgZXJy
b3IgZm9yIGJhZCB2ZWN0b3IgdGFibGUKYzIwMzU0ZSBhcm12N206IFJlcGxhY2UgYXJtdjdtLmhh
Y2sgd2l0aCB1bmFzc2lnbmVkX2FjY2VzcyBoYW5kbGVyCjhmNTBmZTIgYXJtdjdtOiBNUlMvTVNS
OiBoYW5kbGUgdW5wcml2aWxlZ2VkIGFjY2VzcwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tp
bmcgUEFUQ0ggMS82OiBhcm12N206IE1SUy9NU1I6IGhhbmRsZSB1bnByaXZpbGVnZWQgYWNjZXNz
Li4uCkNoZWNraW5nIFBBVENIIDIvNjogYXJtdjdtOiBSZXBsYWNlIGFybXY3bS5oYWNrIHdpdGgg
dW5hc3NpZ25lZF9hY2Nlc3MgaGFuZGxlci4uLgpDaGVja2luZyBQQVRDSCAzLzY6IGFybXY3bTog
RXhwbGljaXQgZXJyb3IgZm9yIGJhZCB2ZWN0b3IgdGFibGUuLi4KQ2hlY2tpbmcgUEFUQ0ggNC82
OiBody9yZWdpc3RlcmZpZWxkcy5oOiBQdWxsIEZJRUxEIGV0YyBtYWNyb3Mgb3V0IG9mIGh3L3Jl
Z2lzdGVyLmguLi4KRVJST1I6IE1hY3JvcyB3aXRoIG11bHRpcGxlIHN0YXRlbWVudHMgc2hvdWxk
IGJlIGVuY2xvc2VkIGluIGEgZG8gLSB3aGlsZSBsb29wCiMxMDY6IEZJTEU6IGluY2x1ZGUvaHcv
cmVnaXN0ZXJmaWVsZHMuaDoxOToKKyNkZWZpbmUgUkVHMzIocmVnLCBhZGRyKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgIGVudW0geyBBXyAj
IyByZWcgPSAoYWRkcikgfTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCisgICAgZW51bSB7IFJfICMjIHJlZyA9IChhZGRyKSAvIDQgfTsKCkVSUk9SOiB0cmFpbGlu
ZyB3aGl0ZXNwYWNlCiMxMTI6IEZJTEU6IGluY2x1ZGUvaHcvcmVnaXN0ZXJmaWVsZHMuaDoyNToK
Ky8qIFRoaXMgbWFjcm8gd2lsbCBkZWZpbmUgRk9PX0JBUl9NQVNLLCBGT09fQkFSX1NISUZUIGFu
ZCBGT09fQkFSX0xFTkdUSCAkCgpFUlJPUjogTWFjcm9zIHdpdGggbXVsdGlwbGUgc3RhdGVtZW50
cyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBkbyAtIHdoaWxlIGxvb3AKIzExNTogRklMRTogaW5j
bHVkZS9ody9yZWdpc3RlcmZpZWxkcy5oOjI4OgorI2RlZmluZSBGSUVMRChyZWcsIGZpZWxkLCBz
aGlmdCwgbGVuZ3RoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgZW51
bSB7IFJfICMjIHJlZyAjIyBfICMjIGZpZWxkICMjIF9TSElGVCA9IChzaGlmdCl9OyAgICAgICAg
ICAgICAgICAgIFwKKyAgICBlbnVtIHsgUl8gIyMgcmVnICMjIF8gIyMgZmllbGQgIyMgX0xFTkdU
SCA9IChsZW5ndGgpfTsgICAgICAgICAgICAgICAgXAorICAgIGVudW0geyBSXyAjIyByZWcgIyMg
XyAjIyBmaWVsZCAjIyBfTUFTSyA9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFLRV82NEJJVF9NQVNLKHNoaWZ0
LCBsZW5ndGgpfTsKCnRvdGFsOiAzIGVycm9ycywgMCB3YXJuaW5ncywgMTE3IGxpbmVzIGNoZWNr
ZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENI
IDUvNjogYXJtdjdtOiBGaXggcmVhZHMgb2YgQ09OVFJPTCByZWdpc3RlciBiaXQgMS4uLgpDaGVj
a2luZyBQQVRDSCA2LzY6IGFybXY3bTogQ2xlYXIgRkFVTFRNQVNLIG9uIHJldHVybiBmcm9tIG5v
bi1OTUkgZXhjZXB0aW9ucy4uLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0
ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

