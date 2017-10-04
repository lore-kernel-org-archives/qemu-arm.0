Received: by 10.223.197.9 with SMTP id q9csp5943276wrf;
        Wed, 4 Oct 2017 11:59:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAWbpnCKaUr3D1wTGR3G1y8Oqd4xB3DzA+Y//rDXNz/mAhZwZNAiN6i4TpjQEQIVeyF3j7e
X-Received: by 10.55.187.133 with SMTP id l127mr24920943qkf.94.1507143570655;
        Wed, 04 Oct 2017 11:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507143570; cv=none;
        d=google.com; s=arc-20160816;
        b=WgzmT3OR8DixdePMO92y7fBLUKOnVVIAZTeLHZdLragspWM1gtBvxlMLUrpYh9x4zj
         hLI5DZ9piy/wTJbSKWprCfUopY5SJdwgq2oIPAX/dFy1iJbe7oO1nQVZ4mRveBrhdZZO
         oxgM93eltVQP0keYQ4rxArVVkTNcVi0vThNhQIIOqRBNYq6FyohNwr3FdNeQhXyzLm6B
         X5vqumOmmSBF5H0FG6jeVnQV6hI5Kv0tqMeT8nvPthgHMoqnV+BtN+pmH2TZo3ev7+YR
         /w1ZZs5LiDYzLzFwKT6S4u/MTbt4dYKr5YVIQ2QfjAvlRJyYK+RNbtimHXxogtuh93tx
         G75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:in-reply-to
         :message-id:resent-message-id:resent-date:arc-authentication-results;
        bh=Xgop4BfRXAMZuu8CC02rMnNwv/3y/6DP0WeVIgtseic=;
        b=DYd9gSw0EcZDon4NINw/FvDX2V6oPybU/WylqGQgHO9npxlSB+phg+pQtLoOAYHeRA
         dIxFm9TrCyOKg50sHCgIalbVwmDDj3udwWmlelajXYAXscrYgHAApqSRZMHfQDXCl/uk
         R0tUwW9o0pHHF/Gc9WPwXUkXICqKaYsKnTvVQwc6N4anVg/+a6z6mjobvfkNLspwYoY2
         LdE7n1VPa+HvhYq9bwVejKwJnMgnyaAeeiiqGyM830hW6ofyhkzyuMMZXuhkhhRUoWcU
         8xDyK74IZbqqOKPSJ06O+HNp1H1gZHmdE2eq+32vtg+okh69SwlzehxaYaUsgbzBw9QY
         epkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o45si2818201qtb.303.2017.10.04.11.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzotG-0001qq-4v
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:59:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dzot6-0001qE-E9
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dzot5-00071Y-DZ
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:59:20 -0400
Resent-Date: Wed, 04 Oct 2017 14:59:20 -0400
Resent-Message-Id: <E1dzot5-00071Y-DZ@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1dzot5-00070x-7S
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:59:19 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1507143537381527.6874323758586;
	Wed, 4 Oct 2017 11:58:57 -0700 (PDT)
Message-ID: <150714353690.153.9472664192067296350@b58463cdfd5f>
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Wed, 4 Oct 2017 11:58:57 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 00/12] ARM v8.1 simd + v8.3
 complex insns
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
Cc: qemu-arm@nongnu.org, famz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gp5EijiScCZk

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTcxMDA0MTg0MzI1LjI0MTU3LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZwpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIHYxIDAwLzEyXSBBUk0gdjguMSBzaW1k
ICsgdjguMyBjb21wbGV4IGluc25zCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdj
IC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZv
cm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNo
byAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAk
YykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBl
Y2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3
MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkMmMxOWVjOTk3IHRhcmdldC9h
cm06IERlY29kZSBhYTMyIGFybXY4LjMgMi1yZWctaW5kZXgKYTM0NzAyNTQyNCB0YXJnZXQvYXJt
OiBEZWNvZGUgYWEzMiBhcm12OC4zIDMtc2FtZQoyY2QzNmNmOTcxIHRhcmdldC9hcm06IERlY29k
ZSBhYTY0IGFybXY4LjMgZmNtbGEKOWNmYjAzZjRjZSB0YXJnZXQvYXJtOiBEZWNvZGUgYWE2NCBh
cm12OC4zIGZjYWRkCjI4ZDFiZTJlY2QgdGFyZ2V0L2FybTogQWRkIEFSTV9GRUFUVVJFX1Y4X0ZD
TUEKYzcwMWNhZDhiZSB0YXJnZXQvYXJtOiBEZWNvZGUgYWEzMiBhcm12OC4xIHR3byByZWcgYW5k
IGEgc2NhbGFyCmE0NjFmYWI5MDcgdGFyZ2V0L2FybTogRGVjb2RlIGFhMzIgYXJtdjguMSB0aHJl
ZSBzYW1lCmM2ZTNmNjBlYjcgdGFyZ2V0L2FybTogRGVjb2RlIGFhNjQgYXJtdjguMSBzY2FsYXIv
dmVjdG9yIHggaW5kZXhlZCBlbGVtZW50CjYyYWFlNTMwMDMgdGFyZ2V0L2FybTogRGVjb2RlIGFh
NjQgYXJtdjguMSB0aHJlZSBzYW1lIGV4dHJhCjBjZWQ4MmExODMgdGFyZ2V0L2FybTogRGVjb2Rl
IGFhNjQgYXJtdjguMSBzY2FsYXIgdGhyZWUgc2FtZSBleHRyYQplMWExZDg2ZDUwIHRhcmdldC9h
cm06IEFkZCBBUk1fRkVBVFVSRV9WOF8xX1NJTUQKNTA2Yjg5NTcwNSBIQUNLOiB1c2Ugb2JqZHVt
cCBkaXNhcwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0ggMS8xMjogSEFDSzog
dXNlIG9iamR1bXAgZGlzYXMuLi4KQ2hlY2tpbmcgUEFUQ0ggMi8xMjogdGFyZ2V0L2FybTogQWRk
IEFSTV9GRUFUVVJFX1Y4XzFfU0lNRC4uLgpDaGVja2luZyBQQVRDSCAzLzEyOiB0YXJnZXQvYXJt
OiBEZWNvZGUgYWE2NCBhcm12OC4xIHNjYWxhciB0aHJlZSBzYW1lIGV4dHJhLi4uCkVSUk9SOiBN
YWNyb3Mgd2l0aCBjb21wbGV4IHZhbHVlcyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gcGFyZW50aGVz
aXMKIzU0OiBGSUxFOiB0YXJnZXQvYXJtL2FkdnNpbWRfaGVscGVyLmM6Mjc6CisjZGVmaW5lIFNF
VF9RQygpIGVudi0+dmZwLnhyZWdzW0FSTV9WRlBfRlBTQ1JdIHw9IENQU1JfUQoKdG90YWw6IDEg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAyMjcgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5
bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBm
YWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BB
VENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggNC8xMjogdGFyZ2V0L2FybTogRGVj
b2RlIGFhNjQgYXJtdjguMSB0aHJlZSBzYW1lIGV4dHJhLi4uCkNoZWNraW5nIFBBVENIIDUvMTI6
IHRhcmdldC9hcm06IERlY29kZSBhYTY0IGFybXY4LjEgc2NhbGFyL3ZlY3RvciB4IGluZGV4ZWQg
ZWxlbWVudC4uLgpDaGVja2luZyBQQVRDSCA2LzEyOiB0YXJnZXQvYXJtOiBEZWNvZGUgYWEzMiBh
cm12OC4xIHRocmVlIHNhbWUuLi4KQ2hlY2tpbmcgUEFUQ0ggNy8xMjogdGFyZ2V0L2FybTogRGVj
b2RlIGFhMzIgYXJtdjguMSB0d28gcmVnIGFuZCBhIHNjYWxhci4uLgpDaGVja2luZyBQQVRDSCA4
LzEyOiB0YXJnZXQvYXJtOiBBZGQgQVJNX0ZFQVRVUkVfVjhfRkNNQS4uLgpDaGVja2luZyBQQVRD
SCA5LzEyOiB0YXJnZXQvYXJtOiBEZWNvZGUgYWE2NCBhcm12OC4zIGZjYWRkLi4uCkNoZWNraW5n
IFBBVENIIDEwLzEyOiB0YXJnZXQvYXJtOiBEZWNvZGUgYWE2NCBhcm12OC4zIGZjbWxhLi4uCkNo
ZWNraW5nIFBBVENIIDExLzEyOiB0YXJnZXQvYXJtOiBEZWNvZGUgYWEzMiBhcm12OC4zIDMtc2Ft
ZS4uLgpDaGVja2luZyBQQVRDSCAxMi8xMjogdGFyZ2V0L2FybTogRGVjb2RlIGFhMzIgYXJtdjgu
MyAyLXJlZy1pbmRleC4uLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNo
ZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

