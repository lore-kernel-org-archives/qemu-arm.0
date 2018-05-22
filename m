Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1801102wme;
        Tue, 22 May 2018 11:01:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqz52xeJ3iQSrCY3NbSX3J6iE1jnv5fvwx0bN9GVl//I60cV1tAXSzZcXwaczuJTwp/YTkJ
X-Received: by 2002:aed:25b6:: with SMTP id x51-v6mr23610278qtc.51.1527012093674;
        Tue, 22 May 2018 11:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527012093; cv=none;
        d=google.com; s=arc-20160816;
        b=yqy1txOC8ku5wzxNnX+y8rXDmJR5bURFPmHNENVAp1QkFJkYhcvQ8JIzirmIHutTx4
         ID4E92SQLoGPiZs6LQKSaBTjS7/uqts/WkrgXOMHl3KO5FlY+f1MqQmn5X7iJ3l3qVDo
         BEMW60I53rvBacFDVXxpiI9P7dhktpXLXmhyu9Aegd+LhwUu/IAAE7xSeb8Zc3kXLQaF
         APBfodnodnJpP8obUWd2IWIN1vxg7AhgjUQzmesF8rZvMH/nZPlb4H2v9nv0MOW2Tf/e
         devS4xF2E1EhHi+UDX3+8MvNLtK/sZV8VG2/oJD68ZZLGnivgmI/DiUjaFFV6TBEX4Ep
         X5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=bWHOunSjRxEtsUSPPI52gYnHjQXW7p+7eM3aFM+lnKk=;
        b=juqchyYzlDlOMLrmW0RO72SdAlZUFuN40ltfUv0DDWyh9sNuNlg47WjkQCOUQyJBkg
         nIT8KAI743hN5DOVPw2GJ+mme0KwrHfJqZTFrbDuiND1ONch+4eoQh1E37o5/XqH8wYQ
         +NJbn5kAy37yKUjlpzhomIyh4QNC691ovF0YHsV7Fqw+MMwIWuae8NDKaiXCCSjLMQd/
         rWHTOlrEFKZJjRVGFDzKN6CVdQwO9fohzSMwE8V+LiS2LNaTtt3DTmFric2S+6Kh4gRI
         2vv6CDdGyDzykZOPozkBqVn4TxJx4paIeNeAYEOlb/Cy+GDCSre9tarZ2TKoT9MX2vvE
         pfKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5-v6si663127qkj.130.2018.05.22.11.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 11:01:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLBbI-0004ga-Bz
	for alex.bennee@linaro.org; Tue, 22 May 2018 14:01:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fLBb1-0004eW-W5
	for qemu-arm@nongnu.org; Tue, 22 May 2018 14:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fLBax-0006sT-TN
	for qemu-arm@nongnu.org; Tue, 22 May 2018 14:01:16 -0400
Resent-Date: Tue, 22 May 2018 14:01:16 -0400
Resent-Message-Id: <E1fLBax-0006sT-TN@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fLBax-0006rx-M9
	for qemu-arm@nongnu.org; Tue, 22 May 2018 14:01:11 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1527012039840406.4159803220292;
	Tue, 22 May 2018 11:00:39 -0700 (PDT)
In-Reply-To: <20180522175629.24932-1-richard.henderson@linaro.org>
Message-ID: <152701203898.99.15082609298964900346@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Tue, 22 May 2018 11:00:39 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] tcg: Fix helper function vs
 host abi for float16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ofkyPeZ5Vy20

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNTIyMTc1NjI5LjI0OTMyLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZwpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIXSB0Y2c6IEZpeCBoZWxwZXIgZnVuY3Rp
b24gdnMgaG9zdCBhYmkgZm9yIGZsb2F0MTYKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4u
IHwgd2MgLWwpCmZhaWxlZD0wCgpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUgg
LS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNr
aW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgog
ICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAg
ZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZy
b20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiB0IFt0YWcgdXBkYXRl
XSAgICAgICAgICAgIHBhdGNoZXcvMjAxODA1MjExNDA0MDIuMjMzMTgtMS1wZXRlci5tYXlkZWxs
QGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDE4MDUyMTE0MDQwMi4yMzMxOC0xLXBldGVyLm1heWRl
bGxAbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICAgICAgICBwYXRjaGV3LzIwMTgwNTIy
MTc1NjI5LjI0OTMyLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIw
MTgwNTIyMTc1NjI5LjI0OTMyLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTd2l0Y2hl
ZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmI1OTAxMzA2MGEgdGNnOiBGaXggaGVscGVyIGZ1bmN0
aW9uIHZzIGhvc3QgYWJpIGZvciBmbG9hdDE2Cgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2lu
ZyBQQVRDSCAxLzE6IHRjZzogRml4IGhlbHBlciBmdW5jdGlvbiB2cyBob3N0IGFiaSBmb3IgZmxv
YXQxNi4uLgpFUlJPUjogc3BhY2UgcHJvaGliaXRlZCBiZWZvcmUgdGhhdCBjbG9zZSBwYXJlbnRo
ZXNpcyAnKScKIzIzMzogRklMRTogdGFyZ2V0L2FybS9oZWxwZXIuYzoxMTM2NzoKKyAgICBDT05W
X0ZUT0kodmZwX3RvIyNuYW1lIyNwLCBmdHlwZSwgZnN6LCBzaWduLCApICAgICAgICBcCgpFUlJP
Ujogc3BhY2UgcHJvaGliaXRlZCBiZWZvcmUgdGhhdCBjbG9zZSBwYXJlbnRoZXNpcyAnKScKIzI0
MjogRklMRTogdGFyZ2V0L2FybS9oZWxwZXIuYzoxMTM3MDoKK0ZMT0FUX0NPTlZTKHNpLCBoLCB1
aW50MzJfdCwgMTYsICkKCkVSUk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJlZm9yZSB0aGF0IGNsb3Nl
IHBhcmVudGhlc2lzICcpJwojMjQzOiBGSUxFOiB0YXJnZXQvYXJtL2hlbHBlci5jOjExMzcxOgor
RkxPQVRfQ09OVlMoc2ksIHMsIGZsb2F0MzIsIDMyLCApCgpFUlJPUjogc3BhY2UgcHJvaGliaXRl
ZCBiZWZvcmUgdGhhdCBjbG9zZSBwYXJlbnRoZXNpcyAnKScKIzI0NDogRklMRTogdGFyZ2V0L2Fy
bS9oZWxwZXIuYzoxMTM3MjoKK0ZMT0FUX0NPTlZTKHNpLCBkLCBmbG9hdDY0LCA2NCwgKQoKdG90
YWw6IDQgZXJyb3JzLCAwIHdhcm5pbmdzLCAzMTIgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

