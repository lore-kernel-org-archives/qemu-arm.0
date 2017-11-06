Received: by 10.223.150.237 with SMTP id u100csp3380927wrb;
        Thu, 9 Nov 2017 22:13:27 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SZT3CUb19EuQNImMjt8OpN+nHYZf1LtpU3eNnaSCFAGBO2RWxYt8F+A0C1K9jEcSruxMk5
X-Received: by 10.129.201.6 with SMTP id o6mr1945558ywi.443.1510294407695;
        Thu, 09 Nov 2017 22:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510294407; cv=none;
        d=google.com; s=arc-20160816;
        b=HRpfw74qHr224JQmGJ8SW8YxVdWmZeKUEKi2e5wHQJDhvyNBiJASV8goa0eIvZN5Ix
         py0DmGIqZ8XSXCTV4lixy6m0WmUYY7wzp1/8u90L0dYFhfL0g6YTLz1BCMTalk4bHvxw
         n+PeFquZzSMpE7w5cYuG/VYx6/GqDY8krZPmKYq5o3Z7X9KeT5fYUnzuDk/lEC4IuMpg
         L+yIFpQx5vwdhpIRkPY2em3MUwxYwXNrELRI30Xwo9Ev/V4yMKufGn3Cc7OlHsakyATK
         gLmT82hq2etM+eS6ZNHAGnwoCafIiOIY0m2+EItUBhV95lQalBsaADE3Z4X3lwCdKQF9
         7AvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=nXD+vbXhCHrzvsPme54B/laOdC48cY9c+d/9IRKljn8=;
        b=E2NfF6Un8JWMnsQupjFeHRS4mZ3+LVopsXDfKG8Eo3P17SjxXVMyiwDGyN83C/6SlN
         nT3GHgzf+0VhT2sS+LqZTI6MqZdXk9xx1qBqpps7cj2mvw6W1NQqsS/U8+cSrQlqcmTu
         sZ1EZQVsN4n73c8dujjsnLaz+0AOPjPacaYF7vFbzKaMEs3iIplR97aYE1jj7HcwXIx5
         j+KytJAhxkC3oUDhNkzX+D42Vn1DgDUCIP2NQZquu21SCHQo+0TxhmnHuS8MHjXVBsNp
         cX0SQY/LhdVJhyOqkCLiNR1j7XiqH6tW4u37G/zOOrlYwJ+O2Ywiy+HsPD2XVCy+jQ17
         qiEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128si2006585ybo.24.2017.11.09.22.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 22:13:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eD2ZD-0001Dv-3o
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 01:13:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eD2Z3-0001Cr-Ab
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 01:13:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eD2Z0-0003Zw-4A
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 01:13:17 -0500
Resent-Date: Fri, 10 Nov 2017 01:13:17 -0500
Resent-Message-Id: <E1eD2Z0-0003Zw-4A@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1eD2Yz-0003ZZ-SJ
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 01:13:14 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1510006841061240.76367161608482;
	Mon, 6 Nov 2017 14:20:41 -0800 (PST)
Message-ID: <151000683988.336.12701448268483176497@bafd83ae6430>
In-Reply-To: <alpine.DEB.2.10.1711061412330.30448@sstabellini-ThinkPad-X260>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: sstabellini@kernel.org
Date: Mon, 6 Nov 2017 14:20:41 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] aarch64: advertise the GIC
 system register interface
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
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, famz@redhat.com,
	qemu-devel@nongnu.org, xen-devel@lists.xen.org,
	julien.grall@arm.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ETXy45urQRy/

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSCB2Ml0gYWFyY2g2NDogYWR2ZXJ0aXNlIHRoZSBHSUMgc3lzdGVtIHJlZ2lz
dGVyIGludGVyZmFjZQpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogYWxwaW5lLkRFQi4yLjEwLjE3
MTEwNjE0MTIzMzAuMzA0NDhAc3N0YWJlbGxpbmktVGhpbmtQYWQtWDI2MAoKPT09IFRFU1QgU0NS
SVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cg
LS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpj
b21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBp
biAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQg
bG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1h
dD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAg
ICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhp
dCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZm
ODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNo
ZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAgIHBhdGNoZXcvYWxwaW5l
LkRFQi4yLjEwLjE3MTEwNjE0MTIzMzAuMzA0NDhAc3N0YWJlbGxpbmktVGhpbmtQYWQtWDI2MCAt
PiBwYXRjaGV3L2FscGluZS5ERUIuMi4xMC4xNzExMDYxNDEyMzMwLjMwNDQ4QHNzdGFiZWxsaW5p
LVRoaW5rUGFkLVgyNjAKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkM2UxY2VjNTQ5
IGFhcmNoNjQ6IGFkdmVydGlzZSB0aGUgR0lDIHN5c3RlbSByZWdpc3RlciBpbnRlcmZhY2UKCj09
PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogYWFyY2g2NDogYWR2ZXJ0aXNl
IHRoZSBHSUMgc3lzdGVtIHJlZ2lzdGVyIGludGVyZmFjZS4uLgpFUlJPUjogc3BhY2VzIHJlcXVp
cmVkIGFyb3VuZCB0aGF0ICd8JyAoY3R4OlZ4VikKIzY3OiBGSUxFOiB0YXJnZXQvYXJtL2hlbHBl
ci5jOjQ2OTA6CisgICAgICAgICAgICAgIC5yZXNldHZhbHVlID0gY3B1LT5naWN2M19zeXNyZWdz
ID8gKGNwdS0+aWRfYWE2NHBmcjB8MHgwMTAwMDAwMCkgOgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgoKdG90YWw6IDEg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAzNCBsaW5lcyBjaGVja2VkCgpZb3VyIHBhdGNoIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZh
bHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFU
Q0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0
ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRv
IHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

