Received: by 10.103.124.15 with SMTP id x15csp1616290vsc;
        Mon, 22 May 2017 17:57:10 -0700 (PDT)
X-Received: by 10.31.138.84 with SMTP id m81mr10298262vkd.37.1495501030924;
        Mon, 22 May 2017 17:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495501030; cv=none;
        d=google.com; s=arc-20160816;
        b=SZLy/aGSZb7ueVg9zx984aVTATF8TdSPn08SCwa9fQxQOxVsFUzax4yRd9aSO10yJl
         rIqiGuG9W8W1Jz/U7g+BYb1ZhAYUGBbIquBmdAggT8slT9nWCX5LCVnH7E+6uux8gc4W
         p5hcJSIwPFWBwQm57uEyuTtJyIrLDvZUL2UvXSGZXlqzlG7/DE7I0AdB9w0dSVgrMhgu
         MHP2WcqsmaGwyhrD1TYzhaG5Ck9hOALh8KsCI684xmiTGr9rNkZO08AvCFCcZFCltEUn
         zGOR1wGnwBZX9YJk8zAvzCpccbqlkjkV5MoymruL9/R9GO13QqP6El/0lqqCqJSOwSiG
         Sjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=3IiWJhHfbhW+/16cggXByjzt7e+tcFTZtUuSuQa231w=;
        b=si5cgbY11vF/Aeq9qGx548sgEfkGkgaxTlQEeSh8zuhKjlNjKAYaVUL48iSaJ2gk+P
         NfUNbuYqZ1T8w1HfseYiQzRZkuTbJ7+YQMRO7TNum9kxRuGkmEh/pP2TRyTTZKcQhvbb
         7R7jBAuVh2bD10cdHUjBy4bzu6Kn3HDYFvBXOaP/8MUQukJA8nlCuKJBo8idi7knT72R
         eJSgEaDI/MKREZd+vFoUtdm1qmuvn7+vdZltTc6B7KELdDezQjFWqmQHRbKVYTsWrqDG
         aujv80ql5bSQUyPrxytvcrQEtG04DPvKj4qoDMwK3qifraLVE9Ix0fghy9SnwaP/AsAN
         J+xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n1si8222391vka.222.2017.05.22.17.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 17:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCy8M-0004uy-Gd
	for alex.bennee@linaro.org; Mon, 22 May 2017 20:57:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dCy8C-0004su-7F
	for qemu-arm@nongnu.org; Mon, 22 May 2017 20:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dCy8B-0001Sh-7z
	for qemu-arm@nongnu.org; Mon, 22 May 2017 20:57:00 -0400
Resent-Date: Mon, 22 May 2017 20:57:00 -0400
Resent-Message-Id: <E1dCy8B-0001Sh-7z@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1dCy85-0001NT-M5; Mon, 22 May 2017 20:56:53 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 149550100554689.77321959574283;
	Mon, 22 May 2017 17:56:45 -0700 (PDT)
In-Reply-To: <1da30c06-46bd-47fa-b0ef-886ea9ab84e5@ONE.local>
Message-ID: <149550100498.1035.202486928967568753@c05f1edc8ed1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Mon, 22 May 2017 17:56:45 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Add code to connect to external
 panel, for ARM
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
Cc: flypie@rocketmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	famz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZNncEFAHrLwm

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzClN1
YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIEFkZCBjb2RlIHRvIGNvbm5lY3QgdG8gZXh0ZXJu
YWwgcGFuZWwsIGZvciBBUk0KTWVzc2FnZS1pZDogMWRhMzBjMDYtNDZiZC00N2ZhLWIwZWYtODg2
ZWE5YWI4NGU1QE9ORS5sb2NhbAoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFz
aAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAt
bCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3Jt
YXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8g
IkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMp
Li4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNo
bwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZDllN2U2YiBBZGQgY29kZSB0byBj
b25uZWN0IHRvIGV4dGVybmFsIHBhbmVsLCBmb3IgQVJNCgo9PT0gT1VUUFVUIEJFR0lOID09PQpD
aGVja2luZyBQQVRDSCAxLzE6IEFkZCBjb2RlIHRvIGNvbm5lY3QgdG8gZXh0ZXJuYWwgcGFuZWws
IGZvciBBUk0uLi4KV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzE2OTogRklMRTog
aHcvYXJtL2JjbTI4MzVfcGVyaXBoZXJhbHMuYzozMDc6CisgICAgbWVtb3J5X3JlZ2lvbl9hZGRf
c3VicmVnaW9uKCZzLT5tYm94X21yLCBNQk9YX0NIQU5fUE9XRVIgPDwgTUJPWF9BU19DSEFOX1NI
SUZULAoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnPScgKGN0eDpWeFYpCiMx
ODI6IEZJTEU6IGh3L2FybS9iY20yODM1X3BlcmlwaGVyYWxzLmM6NDQ0OgorICAgIGRjLT51c2Vy
X2NyZWF0YWJsZT1mYWxzZTsKICAgICAgICAgICAgICAgICAgICAgICBeCgpXQVJOSU5HOiBsaW5l
IG92ZXIgODAgY2hhcmFjdGVycwojNDUwOiBGSUxFOiBody9ncGlvL2JjbTI4MzVfZ3Bpby5jOjM5
NzoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuaW5zdGFuY2Vf
c2l6ZSA9IHNpemVvZihCQ00yODM1R3Bpb1N0YXRlKSwKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBj
aGFyYWN0ZXJzCiM0NTI6IEZJTEU6IGh3L2dwaW8vYmNtMjgzNV9ncGlvLmM6Mzk5OgorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5jbGFzc19pbml0ID0gYmNtMjgz
NV9ncGlvX2NsYXNzX2luaXQsCgpXQVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5l
cyBzaG91bGQgYmUgYXZvaWRlZAojNTAwOiBGSUxFOiBpbmNsdWRlL3FlbXUvUGFuZWxFbXUuaDox
NzoKKyNpZmRlZiBfX2NwbHVzcGx1cwoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1
c2UgdGFicwojNTE3OiBGSUxFOiBpbmNsdWRlL3FlbXUvUGFuZWxFbXUuaDozNDoKK15JICAgICAg
ICAgICAgICAgICAgICAgICB1bmxlc3Mgc29tZXRoaW5nIGNoYW5nZWQgKi8kCgpXQVJOSU5HOiBh
cmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojNTMxOiBGSUxF
OiBpbmNsdWRlL3FlbXUvUGFuZWxFbXUuaDo0ODoKKyNpZmRlZiBfX2NwbHVzcGx1cwoKV0FSTklO
RzogYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzU1NTog
RklMRTogdXRpbC9QYW5lbEVtdS5jOjEzOgorI2lmZGVmIF9fTUlOR1czMl9fCgpXQVJOSU5HOiBh
cmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojNjg2OiBGSUxF
OiB1dGlsL1BhbmVsRW11LmM6MTQ0OgorI2lmZGVmIF9fTUlOR1czMl9fCgpFUlJPUjogc3BhY2Ug
cmVxdWlyZWQgYWZ0ZXIgdGhhdCAnLCcgKGN0eDpWeFYpCiM3MTA6IEZJTEU6IHV0aWwvUGFuZWxF
bXUuYzoxNjg6CisgICAgaW50IGksajsKICAgICAgICAgIF4KCldBUk5JTkc6IGFyY2hpdGVjdHVy
ZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM3ODA6IEZJTEU6IHV0aWwvUGFu
ZWxFbXUuYzoyMzg6CisjaWZkZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBz
cGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM4MDA6IEZJTEU6IHV0aWwvUGFuZWxF
bXUuYzoyNTg6CisjaWZkZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVj
aWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM4MDg6IEZJTEU6IHV0aWwvUGFuZWxFbXUu
YzoyNjY6CisjaWZkZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZp
YyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM4MTc6IEZJTEU6IHV0aWwvUGFuZWxFbXUuYzoy
NzU6CisjaWZkZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBk
ZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM4MjU6IEZJTEU6IHV0aWwvUGFuZWxFbXUuYzoyODM6
CisjaWZkZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZp
bmVzIHNob3VsZCBiZSBhdm9pZGVkCiM4Mzk6IEZJTEU6IHV0aWwvUGFuZWxFbXUuYzoyOTc6Cisj
aWZkZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVz
IHNob3VsZCBiZSBhdm9pZGVkCiM4NTY6IEZJTEU6IHV0aWwvUGFuZWxFbXUuYzozMTQ6CisjaWZk
ZWYgX19NSU5HVzMyX18KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNo
b3VsZCBiZSBhdm9pZGVkCiM4NjQ6IEZJTEU6IHV0aWwvUGFuZWxFbXUuYzozMjI6CisjaWZkZWYg
X19NSU5HVzMyX18KCnRvdGFsOiAzIGVycm9ycywgMTUgd2FybmluZ3MsIDc5NCBsaW5lcyBjaGVj
a2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVy
YXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

