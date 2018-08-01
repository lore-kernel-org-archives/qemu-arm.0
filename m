Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1169997wru;
        Wed, 1 Aug 2018 13:11:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcaN8+A8hQH8frFoPC2tNwkiolpZ/0vlIGU71lwtf0vsAGmSXpEYBrAJhx8wqV802P2Hnve
X-Received: by 2002:ac8:1a46:: with SMTP id q6-v6mr27784474qtk.5.1533154316935;
        Wed, 01 Aug 2018 13:11:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v10-v6si3522938qvn.266.2018.08.01.13.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 13:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkxTQ-00075d-Ce
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 16:11:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fkxTF-00073z-3E
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 16:11:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fkxTD-0007SQ-O8
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 16:11:45 -0400
Resent-Date: Wed, 01 Aug 2018 16:11:45 -0400
Resent-Message-Id: <E1fkxTD-0007SQ-O8@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fkxT8-0007Nn-KB; Wed, 01 Aug 2018 16:11:38 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1533154278; cv=none; d=zoho.com; s=zohoarc; 
	b=bhUTLG2uuiknrJQh6GUapQel+08tiC7YOn/6Mqg0F/fp+hnk9Hk4sbarCaUgFOK1UaJncamHk7Hh5R/gOcVj5Fw+DBztFL/xCnjQ34eGBLA66I41wdZFWjRhLQziqMLoLKsQacuBUdJ+bHQl0vmFBaLeQERUotddJJbc7qNKaL8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1533154278;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=eQnmbXCrbCOZ7tdKAlqZg+aSfIoPdgvaIcsdRelaZrk=; 
	b=IOFNY3iDWldorzLIDxADWIiwrzQmvVTTPOVl3fRbDI/3IVj6+brO4IkgCALeDBsQm1445xfVs2ZG2v4vNaLJf1BEWyVZHXyDpJG96C6gDmKyzK2oqEhQetkNMUzQySO/bzKamiQF4e4skAL88YDOGH4pua+BPQDCSOI/YcdVAYI=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
ARC-Seal: i=1; a=rsa-sha256; t=1533154278; cv=none; d=zoho.com; s=zohoarc; 
	b=S8L24adn/Y072rLilZS/q5a0/yLXK03+k6v8CKD7NuySJ/MnegPImv8BLjfgrutSGAH9lxE+Nxyu0XgcC78SsvWHaVcvJxc0ZlxOK+mlDqO4FlBOIVzyT6Pkp0CcBUYHkL0k90GaddWh+iGINqVybmKzyvvGkT09jQET8xv3bQc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1533154278;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=eQnmbXCrbCOZ7tdKAlqZg+aSfIoPdgvaIcsdRelaZrk=; 
	b=IOFNY3iDWldorzLIDxADWIiwrzQmvVTTPOVl3fRbDI/3IVj6+brO4IkgCALeDBsQm1445xfVs2ZG2v4vNaLJf1BEWyVZHXyDpJG96C6gDmKyzK2oqEhQetkNMUzQySO/bzKamiQF4e4skAL88YDOGH4pua+BPQDCSOI/YcdVAYI=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1533154277654247.9892904995927;
	Wed, 1 Aug 2018 13:11:17 -0700 (PDT)
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
Message-ID: <153315427649.11707.15463004332556766783@502c9da6d61e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Wed, 1 Aug 2018 13:11:17 -0700 (PDT)
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
X-TUID: BN2/FQ0KcfLO

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
ZXN0JwozMTZlZWZkYmM4IHRhcmdldC9hcm06IEZpeCB0eXBvIGluIGhlbHBlcl9zdmVfbW92el9k
CjRiMTE1YzBjMGQgdGFyZ2V0L2FybTogUmVvcmdhbml6ZSBTVkUgV0hJTEUKYjVmNDk2ZjVlNyB0
YXJnZXQvYXJtOiBGaXggdHlwbyBpbiBkb19zYXRfYWRkc3ViXzY0Cjc5NWM3YmVlOGQgdGFyZ2V0
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

