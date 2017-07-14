Received: by 10.25.44.15 with SMTP id s15csp868929lfs;
        Fri, 14 Jul 2017 05:30:42 -0700 (PDT)
X-Received: by 10.237.34.109 with SMTP id o42mr11801477qtc.217.1500035442775;
        Fri, 14 Jul 2017 05:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500035442; cv=none;
        d=google.com; s=arc-20160816;
        b=FYU/cC5qXJFFPhmxjTj9EUgvq+VkfQ8CIAhqm6zQcSHUV2+lEUdUs5MKy8GVdeQdmr
         /EBshR/SNeK6vAzJv4wybg1HL5UuQoSQrgol34gS5eSq2hb4pnd/4ePS0qebEB8lqGji
         tvZOpHPO1QbzwVnH8AodpnhxR9JXG8rwOqw6xiQstnLDHukMwTBeVu3U/zrkSrSKJxsz
         2ZmiuBU8+ukGBvd0rwmJ8bcU3oGXdUJdqV62YAtAzkXXtCBFxxF/bFrK2Y4hMJaL7+v4
         vbPEdQXXr3z1CVDbyrI1nrkh7bN1GnQWVjfAJ09Pnrc0Mx3aCQkFZNAsVo/7HCCjboNs
         ZWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=B0ZzfTknFhxNK4XJVnOOp0iUZmgqK91ZIAbEq8ggZ3s=;
        b=T/Vc/HKMAtFoJXlTC352Wiqms/1ObYUJMDBVDhFUTPU+snLRQN7Z2y8gu/ivt0odGJ
         RuKRMOMaJs6IcD7mtIcAdscgipB4mIZRnvAduKXNb3O+b+nKWi9bpZs4N5xVQxeq6EUs
         EDrJUbGAnHpVMbvnf98PnlI5zW1QpmzZY9wpgAbvpijgWGtHkQZllualo7tlmavPxwZ6
         5KkbrXeHwTb4Ucp2xSQQbQ7yhy+cdvCOku15/0HJmP6o5gORclWpuI3SJMPbBBlralZx
         4csPg5QpBmWACRYwfQLs7aS9SqqPpgWxJweYuJuGhCyQlzUgz0pw+QEyIArYDUQmQ5Ve
         21/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si7678573qkl.241.2017.07.14.05.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 05:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVzk0-0002tb-2J
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 08:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dVzWZ-0005Fj-57
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 08:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dVzWX-0004xE-Mb
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 08:16:47 -0400
Resent-Date: Fri, 14 Jul 2017 08:16:47 -0400
Resent-Message-Id: <E1dVzWX-0004xE-Mb@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1dVzWR-0004rT-UC; Fri, 14 Jul 2017 08:16:40 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1500034587649300.78739727616846;
	Fri, 14 Jul 2017 05:16:27 -0700 (PDT)
Message-ID: <150003458708.75.17469343830014450222@5d477a5b5989>
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Fri, 14 Jul 2017 05:16:27 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/9] ARM: implement MPS2
 board (with 2 FPGA flavours)
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
Cc: famz@redhat.com, patches@linaro.org, f4bug@amsat.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jX5jai8xF+JW

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE1MDAwMjk0ODctMTQ4MjItMS1naXQtc2VuZC1lbWFpbC1wZXRlci5tYXlkZWxs
QGxpbmFyby5vcmcKU3ViamVjdDogW1FlbXUtZGV2ZWxdIFtQQVRDSCB2MiAwLzldIEFSTTogaW1w
bGVtZW50IE1QUzIgYm9hcmQgKHdpdGggMiBGUEdBIGZsYXZvdXJzKQoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1v
bmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21t
aXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAk
Y29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9n
IC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1l
bWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAg
IGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAk
ZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4
MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcK
ZjNiNzUxMSBNQUlOVEFJTkVSUzogQWRkIGVudHJpZXMgZm9yIE1QUzIgYm9hcmQKN2IyNjU4ZiBo
dy9hcm0vbXBzMjogQWRkIGV0aGVybmV0CjYyYzIyOTAgaHcvYXJtL21wczI6IEFkZCBTQ0MKZWY1
MzFmZSBody9taXNjL21wczJfc2NjOiBJbXBsZW1lbnQgTVBTMiBTZXJpYWwgQ29tbXVuaWNhdGlv
biBDb250cm9sbGVyCjE0MTBjMjUgaHcvYXJtL21wczI6IEFkZCB0aW1lcnMKYmU3MzM4NSBody9j
aGFyL2Ntc2RrLWFwYi10aW1lcjogSW1wbGVtZW50IENNU0RLIEFQQiB0aW1lciBkZXZpY2UKZmU3
ZDVhZiBody9hcm0vbXBzMjogQWRkIFVBUlRzCmQ5ZjYyMmEgaHcvY2hhci9jbXNkay1hcGItdWFy
dC5jOiBJbXBsZW1lbnQgQ01TREsgQVBCIFVBUlQKMWQ2ZjNjNiBody9hcm0vbXBzMjogSW1wbGVt
ZW50IHNrZWxldG9uIG1wczItYW4zODUgYW5kIG1wczItYW41MTEgYm9hcmQgbW9kZWxzCgo9PT0g
T1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzk6IGh3L2FybS9tcHMyOiBJbXBsZW1l
bnQgc2tlbGV0b24gbXBzMi1hbjM4NSBhbmQgbXBzMi1hbjUxMSBib2FyZCBtb2RlbHMuLi4KRVJS
T1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiM3MjogRklMRTogaHcvYXJtL21wczIuYzoyMjoK
KyAqICAgaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9wcm9kdWN0cy9zeXN0ZW0tZGVzaWduL2Rl
dmVsb3BtZW50LWJvYXJkcy9jb3J0ZXgtbS1wcm90b3R5cGluZy1zeXN0ZW0KCnRvdGFsOiAxIGVy
cm9ycywgMCB3YXJuaW5ncywgMjgyIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxl
IHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFs
c2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRD
SCBpbiBNQUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDIvOTogaHcvY2hhci9jbXNkay1hcGIt
dWFydC5jOiBJbXBsZW1lbnQgQ01TREsgQVBCIFVBUlQuLi4KRVJST1I6IGxpbmUgb3ZlciA5MCBj
aGFyYWN0ZXJzCiM1NzogRklMRTogaHcvY2hhci9jbXNkay1hcGItdWFydC5jOjE1OgorICogaHR0
cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9wcm9kdWN0cy9zeXN0ZW0tZGVzaWduL3N5c3RlbS1kZXNp
Z24ta2l0cy9jb3J0ZXgtbS1zeXN0ZW0tZGVzaWduLWtpdAoKdG90YWw6IDEgZXJyb3JzLCAwIHdh
cm5pbmdzLCA1MDcgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggMy85OiBody9hcm0vbXBzMjogQWRkIFVBUlRzLi4uCkNo
ZWNraW5nIFBBVENIIDQvOTogaHcvY2hhci9jbXNkay1hcGItdGltZXI6IEltcGxlbWVudCBDTVNE
SyBBUEIgdGltZXIgZGV2aWNlLi4uCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNTY6
IEZJTEU6IGh3L3RpbWVyL2Ntc2RrLWFwYi10aW1lci5jOjE1OgorICogaHR0cHM6Ly9kZXZlbG9w
ZXIuYXJtLmNvbS9wcm9kdWN0cy9zeXN0ZW0tZGVzaWduL3N5c3RlbS1kZXNpZ24ta2l0cy9jb3J0
ZXgtbS1zeXN0ZW0tZGVzaWduLWtpdAoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAzMzEg
bGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hl
Y2tpbmcgUEFUQ0ggNS85OiBody9hcm0vbXBzMjogQWRkIHRpbWVycy4uLgpDaGVja2luZyBQQVRD
SCA2Lzk6IGh3L21pc2MvbXBzMl9zY2M6IEltcGxlbWVudCBNUFMyIFNlcmlhbCBDb21tdW5pY2F0
aW9uIENvbnRyb2xsZXIuLi4KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiM2OTogRklM
RTogaHcvbWlzYy9tcHMyLXNjYy5jOjE2OgorICogaHR0cDovL2luZm9jZW50ZXIuYXJtLmNvbS9o
ZWxwL2luZGV4LmpzcD90b3BpYz0vY29tLmFybS5kb2MuMTAwMTEyXzAxMDBfMDNfZW4vaW5kZXgu
aHRtbAoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnKicgKGN0eDpXeFYpCiMx
MDQ6IEZJTEU6IGh3L21pc2MvbXBzMi1zY2MuYzo1MToKK3N0YXRpYyBib29sIHNjY19jZmdfd3Jp
dGUoTVBTMlNDQyAqcywgdW5zaWduZWQgZnVuY3Rpb24sCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXgoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCAzNzkgbGluZXMgY2hl
Y2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBh
bnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhl
IG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFU
Q0ggNy85OiBody9hcm0vbXBzMjogQWRkIFNDQy4uLgpDaGVja2luZyBQQVRDSCA4Lzk6IGh3L2Fy
bS9tcHMyOiBBZGQgZXRoZXJuZXQuLi4KQ2hlY2tpbmcgUEFUQ0ggOS85OiBNQUlOVEFJTkVSUzog
QWRkIGVudHJpZXMgZm9yIE1QUzIgYm9hcmQuLi4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNv
bW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=

