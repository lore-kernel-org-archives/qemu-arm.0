Received: by 10.28.91.67 with SMTP id p64csp3305166wmb;
        Mon, 19 Mar 2018 19:37:11 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt8e3zIstsdk9/OYGS3UfY1OBWzcxAdDfPpag/XtzFmGDMOCCU7zO9oECHQXNAxlPMU6PY1
X-Received: by 10.237.60.204 with SMTP id e12mr20645612qtf.243.1521513431824;
        Mon, 19 Mar 2018 19:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521513431; cv=none;
        d=google.com; s=arc-20160816;
        b=Jld8tptNK2RTfAUzJE6w5owzhxvb/U+H/PcJJ1j6sHs/oaBzv+ck1+SRsiKTR321Px
         7swnrFOMAfx33Sx3qK5CRt+dLXKM1fOaxsvOdurHFo0n2xSr0brBbTL6CT8qVCc4kBy6
         RKFNM0iIfMeKAdWUb5FWNjcc35enXK+sbX9pnok4J3/nSB6ch+Pxrbfl2RqB7xmsVbII
         LFb02PsfJATZ0reKCYzGQF+UI2Lt7m82tn5qKuYmkJci6dud1ehgTOSMYzMsDkzgdkL1
         ERz5rJkteOLyJjHm7GCYuMnSreZ6j6ZCoFt4pxgLGK1fcZEFFRSkr1TnmICKIKshqP/O
         b8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=+2sg6uccCE2uwZLcY7DquTTICrbmY8fKuHgU/1i+TzU=;
        b=hjh3wymh5sMtdhPm3W46MxsmJYw1H3+7aXPBcnk0tCU9varJ4CK2gzqVLusEI0vdiH
         zgeQgm1FtI/DGMTN94JUtoXx3Ee2bfg6buUwURTmmEXpE7ziM4xBriw0sE6Z3J1hw7JJ
         I3n0Oaj2BgfJ6fye2Ik1pl5o+Hzo+G7IdizGO7fwXL68ptS+VGu7vyiLyW6BeS0FPhp5
         +GiqRv78g+2Und4FvsA+W/xaWbnyKFr+ntOeYFsJ1F3r2TtivIKTFfqLTkQh/QiLMrMo
         2/3XMI49nlr58wCGB7QIXXF+pSs3+4M1G6LlqKe7jmtggsR4aPihEDe2c1kPXsH5g7Cf
         ztdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si845548qta.36.2018.03.19.19.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 19:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey79A-0002mo-UO
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 22:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ey78x-0002l7-T4
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 22:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ey78t-0005L7-OO
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 22:36:55 -0400
Resent-Date: Mon, 19 Mar 2018 22:36:55 -0400
Resent-Message-Id: <E1ey78t-0005L7-OO@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ey78t-0005KV-IM
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 22:36:51 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1521510656193174.918786163915;
	Mon, 19 Mar 2018 18:50:56 -0700 (PDT)
In-Reply-To: <20180320013657.25038-1-tpiepho@impinj.com>
Message-ID: <152151065509.147.16885257657383185128@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: tpiepho@impinj.com
Date: Mon, 19 Mar 2018 18:50:56 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] i.MX: Support serial RS-232
 break properly
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
Cc: famz@redhat.com, andrew.smirnov@gmail.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
	pbonzini@redhat.com, tpiepho@impinj.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tp7GMSwv0JTG

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwMzIwMDEzNjU3LjI1MDM4LTEtdHBpZXBob0BpbXBpbmouY29tClN1Ympl
Y3Q6IFtRZW11LWRldmVsXSBbUEFUQ0hdIGkuTVg6IFN1cHBvcnQgc2VyaWFsIFJTLTIzMiBicmVh
ayBwcm9wZXJseQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1i
YXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVk
PTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0Uu
LikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRv
dGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93
ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAt
OyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEp
KQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNj
OGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0
Y2hldy8xNTIxNDY4MDQ2LTEwNDAwLTEtZ2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNvbSAt
PiBwYXRjaGV3LzE1MjE0NjgwNDYtMTA0MDAtMS1naXQtc2VuZC1lbWFpbC10aHV0aEByZWRoYXQu
Y29tCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBhdGNoZXcvMjAxODAzMTkwMzE1NDUuMjkz
NTktMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAxODAzMTkwMzE1
NDUuMjkzNTktMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnCiB0IFt0YWcgdXBkYXRlXSAg
ICAgICAgICAgIHBhdGNoZXcvMjAxODAzMTkxMTAyMTUuMTY3NTUtMS1wZXRlci5tYXlkZWxsQGxp
bmFyby5vcmcgLT4gcGF0Y2hldy8yMDE4MDMxOTExMDIxNS4xNjc1NS0xLXBldGVyLm1heWRlbGxA
bGluYXJvLm9yZwogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTgwMzE5MTEz
NTQ0LjcwNC0xLWxhdXJlbnRAdml2aWVyLmV1IC0+IHBhdGNoZXcvMjAxODAzMTkxMTM1NDQuNzA0
LTEtbGF1cmVudEB2aXZpZXIuZXUKIHQgW3RhZyB1cGRhdGVdICAgICAgICAgICAgcGF0Y2hldy8y
MDE4MDMxOTExNTg0Ni45NjYyLTEta2Jhc3RpYW5AbWFpbC51bmktcGFkZXJib3JuLmRlIC0+IHBh
dGNoZXcvMjAxODAzMTkxMTU4NDYuOTY2Mi0xLWtiYXN0aWFuQG1haWwudW5pLXBhZGVyYm9ybi5k
ZQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTgwMzE5MTMxNzQzLjM4ODUt
MS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDE4MDMxOTEzMTc0My4zODg1
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnCiB0IFt0YWcgdXBkYXRlXSAgICAgICAgICAgIHBh
dGNoZXcvMjAxODAzMTkyMTMxMDEuNjEwMC0xLXdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcu
Y29tIC0+IHBhdGNoZXcvMjAxODAzMTkyMTMxMDEuNjEwMC0xLXdzYStyZW5lc2FzQHNhbmctZW5n
aW5lZXJpbmcuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgICAgICAgIHBhdGNoZXcvMjAxODAzMjAw
MTM2NTcuMjUwMzgtMS10cGllcGhvQGltcGluai5jb20gLT4gcGF0Y2hldy8yMDE4MDMyMDAxMzY1
Ny4yNTAzOC0xLXRwaWVwaG9AaW1waW5qLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCjEwMjI0MTE1YTcgaS5NWDogU3VwcG9ydCBzZXJpYWwgUlMtMjMyIGJyZWFrIHByb3Blcmx5
Cgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzE6IGkuTVg6IFN1cHBvcnQg
c2VyaWFsIFJTLTIzMiBicmVhayBwcm9wZXJseS4uLgpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFy
b3VuZCB0aGF0ICc8PCcgKGN0eDpWeFYpCiM1MzogRklMRTogaW5jbHVkZS9ody9jaGFyL2lteF9z
ZXJpYWwuaDoyOToKKyNkZWZpbmUgVVJYRF9GUk1FUlIgICAgICgxPDwxMikgICAvKiBDaGFyYWN0
ZXIgaGFzIGZyYW1lIGVycm9yICovCiAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFs
OiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjQgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQg
ZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFj
ayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=

