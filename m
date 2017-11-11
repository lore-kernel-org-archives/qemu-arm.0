Received: by 10.223.150.237 with SMTP id u100csp471406wrb;
        Sat, 11 Nov 2017 02:02:35 -0800 (PST)
X-Google-Smtp-Source: AGs4zMatReYj403aJI1fmVABFlZf1yIgZRREpNAFolDLmDDxt/+UDQwxgPmMT6gf0lh4kukG/30V
X-Received: by 10.37.76.5 with SMTP id z5mr2026249yba.257.1510394555437;
        Sat, 11 Nov 2017 02:02:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510394555; cv=none;
        d=google.com; s=arc-20160816;
        b=Jgucd/97Gti1qmyCVEoBD/88c5V34K9WcYUcfXQ/MCYJhvga2aeqIOSycVs5ZeBfAW
         IlX2HT9pYum0p/08KvaYE2zHjK9Xr+nh1vi5Il7oOljI+GPzxdQ0Ty8psoYNRkoNfvA6
         eOPuyW4DwbPTYCDTJb8XYVy3gYu8L1RLhsYjVKU3UGMfPuBhVEqQzrBV2RzCMlH9+KMG
         Fo10TsRrf0r/Cqdm+la70/KowjeYHRf8cpwGa7nanwnOeCH3Dy3vKfMEgUKrBxP1oqei
         RXPaRSD6CT95fNd9f32uKf2BICPZ0kwkT58I927FTcgEjqKWKimmQ+0hkJUVzsOF9q9n
         NacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=VMngNyThQv6sPu/8St9khWwHfFLUazL591tWx9opQ+Q=;
        b=ZQqyDqQe9bT6IamJVH4u074GCTCm5teFOX+G4zqpOmRi15AEirCFmr4JS+FkvmEx3l
         S0WI6VsC4cQRvgYipLuLfFnXv3Qo2l4HO7cs5kL6ApYK/nv00wait3dnUaH6BJT/gVfW
         REYHlocLR+IaTfhowhc/kZnxXAn58cC2Ocv9AMxnjzjfQjVZWdt06Z2wvHFRrorOQ7m+
         DSpCyvEVJvjq98E/0X5V8XBLAWjQOZzfH6t/mMDQVLBjHRAVeg63Fb7XiVyq0fxHv0AV
         JlQpReTXHtxDrMbAcHXOqHBJ8q6DrB3Y5/v2KfxXtsyn8DCo4iVPHhthpJNisK3Fxs5k
         p5AA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10si2539114ybg.454.2017.11.11.02.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Nov 2017 02:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDScU-00059b-Ek
	for alex.bennee@linaro.org; Sat, 11 Nov 2017 05:02:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eDScJ-00057Y-0I
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 05:02:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1eDScE-00036d-S9
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 05:02:23 -0500
Resent-Date: Sat, 11 Nov 2017 05:02:23 -0500
Resent-Message-Id: <E1eDScE-00036d-S9@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1eDScE-00036V-LJ
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 05:02:18 -0500
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1510388118964884.9537165790506;
	Sat, 11 Nov 2017 00:15:18 -0800 (PST)
Message-ID: <151038811814.390.17991372140651087937@bafd83ae6430>
In-Reply-To: <20171111081111.32724-1-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ppandit@redhat.com
Date: Sat, 11 Nov 2017 00:15:18 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1] highbank: validate register
 offset before access
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
Cc: peter.maydell@linaro.org, famz@redhat.com, pjp@fedoraproject.org,
	robh@kernel.org, f4bug@amsat.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, shawn.guo@linaro.org, moguofang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rv7LmB45Wz/L

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSCB2MV0gaGlnaGJhbms6IHZhbGlkYXRlIHJlZ2lzdGVyIG9mZnNldCBiZWZv
cmUgYWNjZXNzClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDE3MTExMTA4MTExMS4zMjcyNC0x
LXBwYW5kaXRAcmVkaGF0LmNvbQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFz
aAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAt
bCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3Jt
YXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8g
IkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMp
Li4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNo
bwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEz
Mzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiB0IFt0YWcg
dXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMTUxMDM0MzYyNi0yNTg2MS0xLWdpdC1zZW5kLWVt
YWlsLWNvdGFAYnJhYXAub3JnIC0+IHBhdGNoZXcvMTUxMDM0MzYyNi0yNTg2MS0xLWdpdC1zZW5k
LWVtYWlsLWNvdGFAYnJhYXAub3JnCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcv
MjAxNzEwMzAxNjMzMDkuNzU3NzAtMS12c2VtZW50c292QHZpcnR1b3p6by5jb20gLT4gcGF0Y2hl
dy8yMDE3MTAzMDE2MzMwOS43NTc3MC0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbQogdCBbdGFn
IHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTcxMTEwMjIxMzI5LjI0MTc2LTEtbXJlaXR6
QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE3MTExMDIyMTMyOS4yNDE3Ni0xLW1yZWl0ekByZWRo
YXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAgIHBhdGNoZXcvMjAxNzExMTEwODExMTEu
MzI3MjQtMS1wcGFuZGl0QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDE3MTExMTA4MTExMS4zMjcy
NC0xLXBwYW5kaXRAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjIz
ZGY4YWQwNjAgaGlnaGJhbms6IHZhbGlkYXRlIHJlZ2lzdGVyIG9mZnNldCBiZWZvcmUgYWNjZXNz
Cgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzE6IGhpZ2hiYW5rOiB2YWxp
ZGF0ZSByZWdpc3RlciBvZmZzZXQgYmVmb3JlIGFjY2Vzcy4uLgpFUlJPUjogc3BhY2VzIHJlcXVp
cmVkIGFyb3VuZCB0aGF0ICcvJyAoY3R4OlZ4VikKIzUwOiBGSUxFOiBody9hcm0vaGlnaGJhbmsu
YzoxNDA6CisgICAgdmFsdWUgPSByZWdzW29mZnNldC80XTsKICAgICAgICAgICAgICAgICAgICAg
ICAgXgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAzNCBsaW5lcyBjaGVja2VkCgpZb3Vy
IHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

