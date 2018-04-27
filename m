Received: by 10.28.4.212 with SMTP id 203csp183890wme;
        Thu, 26 Apr 2018 17:54:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrWdG9Jnv0KFj0IgEPtEn0iZuYLBCt0ER2l1M49L6WxRwXvsF5lYamkk1Y5Ibknk9Pf618b
X-Received: by 2002:aed:36e3:: with SMTP id f90-v6mr230433qtb.115.1524790483331;
        Thu, 26 Apr 2018 17:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524790483; cv=none;
        d=google.com; s=arc-20160816;
        b=VogtKEpViOMhuU9TkBHaIejRimc0t1/KXzyh8JWxZL/i2TZ7smBOQq2vGJmnn9ptxr
         y3z0xDB2lukiqpg+QnJzun8KUdO2uj/wJ9vfrtsD6uaNn7EIDYzrN+VjMAvdBndwRMT+
         j0g8c815y1f9/uCUATjfumIw1OGErUY5f1Gb24Obc54BcVssbNuXSn5cJTG6GsT+0ypd
         ytPK8CAUjXQzN4MV9Lm/f++yG22D/r1Mbel1QsuyTuNlfWhkn51djD/khN46criK3tbt
         8thjza0Dl1j4F5bJqT0QCIMLyFR96fzt5RyS5fOQMUk+rVZBhwUIYtFPED+KSw6aVX+m
         +YUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=SFViO/ZRsQZagV+mGZkDtxVsu8GSoGMdvh20Z34A4MI=;
        b=CJ2UMqtcrUDodhYjweyPknNi8ntizFymG2dczKCRr2ntwSpeCTBtdq2BbjIYqvWjlE
         XjP4AJbaA9Fn6zOBwjHUwdrX508cwxffoXlVOnpee8c5G+YgzQmhUuhcfNpUvbLUa+C+
         I+glQxgp62SIqRKMyQjkeYvfI/77FB2CInV2+oYSWIzz89oYXwYPfrChOIrIeshwKThS
         jZW1cX6z4y4YGz7tZOMHY8HZGnZoXk3f6oFf+L+uy4IdAd9P1fSMrED8Q6cCu22Xmo8t
         84X0r7qoTsIwid8mrzeKPfXuKTmtak3HYw6DSco6GWOQX8a3bh7pT74VFDfH0gOxVpQF
         s7cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t33-v6si150626qtc.216.2018.04.26.17.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBres-0004uE-T8
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:54:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fBrei-0004sv-QQ
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fBreg-0000yL-QU
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:54:32 -0400
Resent-Date: Thu, 26 Apr 2018 20:54:32 -0400
Resent-Message-Id: <E1fBreg-0000yL-QU@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fBreg-0000xs-HE
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:54:30 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1524790438635490.15891277496326;
	Thu, 26 Apr 2018 17:53:58 -0700 (PDT)
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
Message-ID: <152479043774.2352.17360615748073470290@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Thu, 26 Apr 2018 17:53:58 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/9] target/arm: Implement
 v8.1-Atomics
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
X-TUID: SWZwFIM28Rwd

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNDI3MDAyNjUxLjI4MzU2LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZwpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIDAvOV0gdGFyZ2V0L2FybTogSW1wbGVt
ZW50IHY4LjEtQXRvbWljcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoK
QkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkK
ZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29y
aXRobSBoaXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2Ug
JEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0gg
JG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdp
dCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWls
YmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0k
KChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIHQgW3RhZyB1cGRhdGVdICAgICAgICAg
ICAgcGF0Y2hldy8xNTI0NzYwMDA5LTI0NzEwLTEtZ2l0LXNlbmQtZW1haWwtYmFidS5tb2dlckBh
bWQuY29tIC0+IHBhdGNoZXcvMTUyNDc2MDAwOS0yNDcxMC0xLWdpdC1zZW5kLWVtYWlsLWJhYnUu
bW9nZXJAYW1kLmNvbQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTgwNDI2
MTUyODA1Ljg0NjktMS1hcm1icnVAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMTgwNDI2MTUyODA1
Ljg0NjktMS1hcm1icnVAcmVkaGF0LmNvbQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRj
aGV3LzIwMTgwNDI2MTgzNDA0LjM3NTYtMS1sZXJzZWtAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIw
MTgwNDI2MTgzNDA0LjM3NTYtMS1sZXJzZWtAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAg
ICAgICAgICBwYXRjaGV3LzIwMTgwNDI3MDAyNjUxLjI4MzU2LTEtcmljaGFyZC5oZW5kZXJzb25A
bGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMTgwNDI3MDAyNjUxLjI4MzU2LTEtcmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmYxYzBlYjFl
MjYgdGFyZ2V0L2FybTogRW5hYmxlIEFSTV9GRUFUVVJFX1Y4X0FUT01JQ1MgZm9yIHVzZXItb25s
eQpkODk3OGEzNzYxIHRhcmdldC9hcm06IEltcGxlbWVudCBDQVMgYW5kIENBU1AKMjIyOWRkNDNh
YiB0YXJnZXQvYXJtOiBGaWxsIGluIGRpc2FzX2xkc3RfYXRvbWljCjBjYzdjNGEyYmQgdGFyZ2V0
L2FybTogSW50cm9kdWNlIEFSTV9GRUFUVVJFX1Y4X0FUT01JQ1MgYW5kIGluaXRpYWwgZGVjb2Rl
CjNkZjk0MDMxZmQgdGFyZ2V0L3Jpc2N2OiBVc2UgbmV3IGF0b21pYyBtaW4vbWF4IGV4cGFuZGVy
cwo5ZTFjYjY3ODJlIHRjZzogSW50cm9kdWNlIGF0b21pYyBoZWxwZXJzIGZvciBpbnRlZ2VyIG1p
bi9tYXgKYjJmOWU2ODNjOCB0YXJnZXQveHRlbnNhOiBVc2UgbmV3IG1pbi9tYXggZXhwYW5kZXJz
CjdjNTUyY2EyZTcgdGFyZ2V0L2FybTogVXNlIG5ldyBtaW4vbWF4IGV4cGFuZGVycwpmYTk5MDE1
ZjdhIHRjZzogSW50cm9kdWNlIGhlbHBlcnMgZm9yIGludGVnZXIgbWluL21heAoKPT09IE9VVFBV
VCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0ggMS85OiB0Y2c6IEludHJvZHVjZSBoZWxwZXJzIGZv
ciBpbnRlZ2VyIG1pbi9tYXguLi4KQ2hlY2tpbmcgUEFUQ0ggMi85OiB0YXJnZXQvYXJtOiBVc2Ug
bmV3IG1pbi9tYXggZXhwYW5kZXJzLi4uCkNoZWNraW5nIFBBVENIIDMvOTogdGFyZ2V0L3h0ZW5z
YTogVXNlIG5ldyBtaW4vbWF4IGV4cGFuZGVycy4uLgpDaGVja2luZyBQQVRDSCA0Lzk6IHRjZzog
SW50cm9kdWNlIGF0b21pYyBoZWxwZXJzIGZvciBpbnRlZ2VyIG1pbi9tYXguLi4KRVJST1I6IG1l
bW9yeSBiYXJyaWVyIHdpdGhvdXQgY29tbWVudAojNTU6IEZJTEU6IGFjY2VsL3RjZy9hdG9taWNf
dGVtcGxhdGUuaDoxMzc6CisgICAgc21wX21iKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKCkVSUk9SOiBtZW1vcnkgYmFycmllciB3aXRo
b3V0IGNvbW1lbnQKIzk1OiBGSUxFOiBhY2NlbC90Y2cvYXRvbWljX3RlbXBsYXRlLmg6Mjg1Ogor
ICAgIHNtcF9tYigpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDIzNiBsaW5lcyBjaGVj
a2VkCgpZb3VyIHBhdGNoIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgpDaGVja2luZyBQQVRD
SCA1Lzk6IHRhcmdldC9yaXNjdjogVXNlIG5ldyBhdG9taWMgbWluL21heCBleHBhbmRlcnMuLi4K
Q2hlY2tpbmcgUEFUQ0ggNi85OiB0YXJnZXQvYXJtOiBJbnRyb2R1Y2UgQVJNX0ZFQVRVUkVfVjhf
QVRPTUlDUyBhbmQgaW5pdGlhbCBkZWNvZGUuLi4KQ2hlY2tpbmcgUEFUQ0ggNy85OiB0YXJnZXQv
YXJtOiBGaWxsIGluIGRpc2FzX2xkc3RfYXRvbWljLi4uCkNoZWNraW5nIFBBVENIIDgvOTogdGFy
Z2V0L2FybTogSW1wbGVtZW50IENBUyBhbmQgQ0FTUC4uLgpDaGVja2luZyBQQVRDSCA5Lzk6IHRh
cmdldC9hcm06IEVuYWJsZSBBUk1fRkVBVFVSRV9WOF9BVE9NSUNTIGZvciB1c2VyLW9ubHkuLi4K
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

