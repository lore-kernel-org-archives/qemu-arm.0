Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2217170wru;
        Thu, 2 Aug 2018 09:33:14 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfHHZM+i83U1rrPEQbfSVmqE8BYopBSfKBEkYrkxdmgFunqROiKeu0x75cPCYcuu8KddVBP
X-Received: by 2002:ac8:2798:: with SMTP id w24-v6mr202119qtw.51.1533227594302;
        Thu, 02 Aug 2018 09:33:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6-v6si2176607qkd.354.2018.08.02.09.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 09:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flGXJ-0002WJ-OM
	for alex.bennee@linaro.org; Thu, 02 Aug 2018 12:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1flGXA-0002WA-1S
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 12:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1flGX8-0004sf-1X
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 12:33:04 -0400
Resent-Date: Thu, 02 Aug 2018 12:33:04 -0400
Resent-Message-Id: <E1flGX8-0004sf-1X@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1flGX7-0004sW-Nw
	for qemu-arm@nongnu.org; Thu, 02 Aug 2018 12:33:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1533227553; cv=none; d=zoho.com; s=zohoarc; 
	b=jLdpZymhbJzXVMfv8gfVT5Nvw73uRTCWZzSUF1LzEgaP7kVaXLn8mXy2vi9VTyfxwbxS3RHI6Ex9Eb0zOIPLNlSWyH8YHsJWW/2x3qOyHhEl62ShHvTPJafbVHOSR3Nncs6XC2jhE1ugVKlBfTzYzKO+0T7j/OlZfBqLSQvA04o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1533227553;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=ednxk6SS+4xCP3ynHxWgUA44X1nd2uoXSb1CCfGsG+U=; 
	b=DW7bhoBh2M+xuPLh0kfbiZOXXxx0FM1/B5p8BFx6OmWDpyg6XaRnx9uQONf0FhsLxWjYK+pLl8BfcuemRCA60iM+PdeY9MUd6ZbJiaN7hWVZkHJtGDoAbjdtDmEapb7q+d0cpRDN8AXhIiS2/srnosavqHV7MQqeKyYoitdxRqs=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
ARC-Seal: i=1; a=rsa-sha256; t=1533227551; cv=none; d=zoho.com; s=zohoarc; 
	b=W2/HFaPApelasStXui6VHTywJsElrGtEnjUw64U0pfj3yns2bMBEi8gocfZSbK5YUw+MIihvnd+YlYBBZiCwxFVX7CJzb5P9oRbUoGSafsvtpJ8dmN89bNQpeKwwQvtK3OWRr19Rv1NnJV2nvRapRm7os47i3oUKwzxrDBPKMs4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1533227551;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=ednxk6SS+4xCP3ynHxWgUA44X1nd2uoXSb1CCfGsG+U=; 
	b=hYYzvSk0OZlscaGT2W6LOxxH+utjaTWBDauY6vN3In7PwdbFB/sxTGuK+5aCu679O5AnsynZ2hchZ3dev8ObS35hj6zgFGpL8wrhr3IEBsqkfEzxepnIxwZ9THJR5Vi88oyS2OJmzbzB52iZEYkUqEtHBVDrV92McAYEOZr5t8g=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1533227551542213.39177687980384;
	Thu, 2 Aug 2018 09:32:31 -0700 (PDT)
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
Message-ID: <153322755030.17698.15162402362626066674@502c9da6d61e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Thu, 2 Aug 2018 09:32:31 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] target/arm sve fixes
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	famz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gB8vi+V8/lP

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwODAxMTIzMTExLjM1OTUtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggMC80XSB0YXJnZXQvYXJtIHN2ZSBmaXhl
cwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0
b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
CmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBj
IGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdp
dCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9y
bWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAg
ICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpl
eGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIx
ZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0
ZXN0JwplNGM1ZWU5MjYwIHRhcmdldC9hcm06IEZpeCB0eXBvIGluIGhlbHBlcl9zdmVfbW92el9k
CjlhMzdhYzU5MDggdGFyZ2V0L2FybTogUmVvcmdhbml6ZSBTVkUgV0hJTEUKYzUyOWI3NWZlYyB0
YXJnZXQvYXJtOiBGaXggdHlwbyBpbiBkb19zYXRfYWRkc3ViXzY0CmZiNzI3NTVmYWEgdGFyZ2V0
L2FybTogRml4IHNpZ24gb2Ygc3ZlX2NtcGVxX3Bwencvc3ZlX2NtcG5lX3BwencKCj09PSBPVVRQ
VVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvNDogdGFyZ2V0L2FybTogRml4IHNpZ24gb2Yg
c3ZlX2NtcGVxX3Bwencvc3ZlX2NtcG5lX3BwencuLi4KRVJST1I6IHNwYWNlcyByZXF1aXJlZCBh
cm91bmQgdGhhdCAnPT0nIChjdHg6V3hCKQojMzE6IEZJTEU6IHRhcmdldC9hcm0vc3ZlX2hlbHBl
ci5jOjI0Mzk6CitET19DTVBfUFBaV19CKHN2ZV9jbXBlcV9wcHp3X2IsIGludDhfdCwgIHVpbnQ2
NF90LCA9PSkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF4KCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJz09JyAoY3R4Old4QikK
IzMyOiBGSUxFOiB0YXJnZXQvYXJtL3N2ZV9oZWxwZXIuYzoyNDQwOgorRE9fQ01QX1BQWldfSChz
dmVfY21wZXFfcHB6d19oLCBpbnQxNl90LCB1aW50NjRfdCwgPT0pCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpFUlJPUjogc3BhY2VzIHJlcXVp
cmVkIGFyb3VuZCB0aGF0ICc9PScgKGN0eDpXeEIpCiMzMzogRklMRTogdGFyZ2V0L2FybS9zdmVf
aGVscGVyLmM6MjQ0MToKK0RPX0NNUF9QUFpXX1Moc3ZlX2NtcGVxX3BwendfcywgaW50MzJfdCwg
dWludDY0X3QsID09KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnIT0nIChjdHg6
V3hCKQojMzg6IEZJTEU6IHRhcmdldC9hcm0vc3ZlX2hlbHBlci5jOjI0NDM6CitET19DTVBfUFBa
V19CKHN2ZV9jbXBuZV9wcHp3X2IsIGludDhfdCwgIHVpbnQ2NF90LCAhPSkKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCkVSUk9SOiBzcGFjZXMg
cmVxdWlyZWQgYXJvdW5kIHRoYXQgJyE9JyAoY3R4Old4QikKIzM5OiBGSUxFOiB0YXJnZXQvYXJt
L3N2ZV9oZWxwZXIuYzoyNDQ0OgorRE9fQ01QX1BQWldfSChzdmVfY21wbmVfcHB6d19oLCBpbnQx
Nl90LCB1aW50NjRfdCwgIT0pCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCgpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICchPScg
KGN0eDpXeEIpCiM0MDogRklMRTogdGFyZ2V0L2FybS9zdmVfaGVscGVyLmM6MjQ0NToKK0RPX0NN
UF9QUFpXX1Moc3ZlX2NtcG5lX3BwendfcywgaW50MzJfdCwgdWludDY0X3QsICE9KQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDYg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAxOSBsaW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCgpDaGVja2luZyBQQVRDSCAyLzQ6IHRhcmdldC9hcm06IEZpeCB0
eXBvIGluIGRvX3NhdF9hZGRzdWJfNjQuLi4KQ2hlY2tpbmcgUEFUQ0ggMy80OiB0YXJnZXQvYXJt
OiBSZW9yZ2FuaXplIFNWRSBXSElMRS4uLgpDaGVja2luZyBQQVRDSCA0LzQ6IHRhcmdldC9hcm06
IEZpeCB0eXBvIGluIGhlbHBlcl9zdmVfbW92el9kLi4uCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

