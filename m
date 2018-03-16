Received: by 10.28.91.67 with SMTP id p64csp1294673wmb;
        Fri, 16 Mar 2018 13:59:54 -0700 (PDT)
X-Google-Smtp-Source: AG47ELseNNanrSfJAu4MVwLYBRtVzxnIzQB7DS1ULgV0Ruw94liATe6PHUnSOzyHtBJpfVom7zoa
X-Received: by 10.55.145.70 with SMTP id t67mr4831879qkd.114.1521233994191;
        Fri, 16 Mar 2018 13:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521233994; cv=none;
        d=google.com; s=arc-20160816;
        b=BQaurJp3toRqPlGaG+FFccxSF6nzj4iUutgvv/RoI0YWD9Q+IMm4KTUB9S+2duLPku
         V/q+brl3rRAv1QTFVIKVPaFPM93X38lZ2Zqer2APDsHAjiRRZAHlkM1wkFmahnoGWV8x
         whEkC6dLMS+Z+n950XfSgwm+ELJOPfoKzP4Krfn1bJhseFlzJNnXvp/jkvyqdmKKzN92
         m9ohKx++eJq+9mfUUX5k+VjgAvK3vZvK8zlsV9NDFsJIr4Ud6/mZnNXbJeTWxatuO1zK
         KssbMICpWmmkgo2sxhNAhPEXDDziv3Sm0CiBopvpdm/PvlblxuCQxlAOCu5hNDpmVlt3
         XALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=0j8v0mSWscozoJdDsJyIB2TrMX3znl3+1beDJN44IZ8=;
        b=Wc/54WSRvCc2kadpWGEFvh9tgsQBaNk7k53P/l4PJP1RmyJCV7nWF2uBhopd7wTf1Q
         +WEs8mLeaNc2tfor/WomdfLHdcsspz0G3ycetnYTY2uzkUC3hxbHLlT/xhpA2qScjFg5
         RiYsx0FKFMZpzSeXjnxYqcSdkNGFQN8o/7oR4r25ujXTu0H/SzLA6V4SyK9YHvzFbvXo
         i6+n6RQdZ4zhNkwiDsaloz6Za2SirQmW+zwv5sOyiS4I6dLYfCSgQV9LORv6auIED/lV
         DBRpVt4IDG7aJDmmNqd70EFn9Y5FgVt71TwFB6tjlWfqSxp0Ki7IFc9nO51j/D1pw0NF
         8eMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26si323770qtl.157.2018.03.16.13.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwS9-0001kP-Pq
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:59:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ewwRD-0001MN-JT
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1ewwRA-00063t-FQ
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:58:55 -0400
Resent-Date: Fri, 16 Mar 2018 16:58:55 -0400
Resent-Message-Id: <E1ewwRA-00063t-FQ@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1ewwRA-000611-95; Fri, 16 Mar 2018 16:58:52 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1521233903716345.9609167245551;
	Fri, 16 Mar 2018 13:58:23 -0700 (PDT)
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
Message-ID: <152123390250.78.14000079057958081515@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alindsay@codeaurora.org
Date: Fri, 16 Mar 2018 13:58:23 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-devel] [PATCH v3 00/22] More fully implement ARM PMUv3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: wei@redhat.com, peter.maydell@linaro.org, famz@redhat.com,
	digantd@codeaurora.org, crosthwaite.peter@gmail.com,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, mspradli@codeaurora.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jd0eAqkcnk6S

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE1MjEyMzIyODAtMTMwODktMS1naXQtc2VuZC1lbWFpbC1hbGluZHNheUBjb2Rl
YXVyb3JhLm9yZwpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIHYzIDAwLzIyXSBNb3JlIGZ1
bGx5IGltcGxlbWVudCBBUk0gUE1VdjMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4uIHwg
d2MgLWwpCmZhaWxlZD0wCgpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5hbGdvcml0aG0gaGlzdG9ncmFtCgpjb21taXRzPSIkKGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1y
ZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAgIGVjaG8gIkNoZWNraW5n
IFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9JXMgJGMpLi4uIgogICAg
aWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAgICAgZWNobwogICAgZmkK
ICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20g
aHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAg
ICAgICAgICAgIHBhdGNoZXcvMTUyMTIzMjI4MC0xMzA4OS0xLWdpdC1zZW5kLWVtYWlsLWFsaW5k
c2F5QGNvZGVhdXJvcmEub3JnIC0+IHBhdGNoZXcvMTUyMTIzMjI4MC0xMzA4OS0xLWdpdC1zZW5k
LWVtYWlsLWFsaW5kc2F5QGNvZGVhdXJvcmEub3JnClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKZDgxNzkxYjE4NCB0YXJnZXQvYXJtOiBJbXBsZW1lbnQgUE1TV0lOQwo1MTIxMjRkMDE4
IHRhcmdldC9hcm06IFBNVTogU2V0IFBNQ1IuTiB0byA0CmI3NDhlOTczMDYgdGFyZ2V0L2FybTog
UE1VOiBBZGQgaW5zdHJ1Y3Rpb24gYW5kIGN5Y2xlIGV2ZW50cwo3ZTQ2YTc3Zjg5IHRhcmdldC9h
cm06IEZpbmlzaCBpbXBsZW1lbnRhdGlvbiBvZiBQTVtYXUVWQ05UUiBhbmQgUE1bWF1FVlRZUEVS
CjgyY2ZmZWY4NTUgdGFyZ2V0L2FybTogQWRkIGFycmF5IGZvciBzdXBwb3J0ZWQgUE1VIGV2ZW50
cywgZ2VuZXJhdGUgUE1DRUlEWzAxXQpkNjM1MDIxZDBhIHRhcmdldC9hcm06IFNwbGl0IGFybV9j
Y250X2VuYWJsZWQgaW50byBnZW5lcmljIHBtdV9jb3VudGVyX2VuYWJsZWQKM2UxYjQzOGRlYiB0
YXJnZXQvYXJtOiBJbXBsZW1lbnQgUE1PVlNTRVQKYzEzYzgzMjk4OCB0YXJnZXQvYXJtOiBBZGQg
QVJNX0ZFQVRVUkVfVjdWRSBmb3IgdjcgVmlydHVhbGl6YXRpb24gRXh0ZW5zaW9ucwo5YzgwYWY0
ZDgyIHRhcmdldC9hcm06IE1ha2UgUE1PVlNDTFIgNjQgYml0cyB3aWRlCjhmZmJjZDNkZDggdGFy
Z2V0L2FybTogQWxsb3cgQUFyY2gzMiBhY2Nlc3MgZm9yIFBNQ0NGSUxUUgo3ZGM0ZWM5NzE1IHRh
cmdldC9hcm06IEZpbHRlciBjeWNsZSBjb3VudGVyIGJhc2VkIG9uIFBNQ0NGSUxUUl9FTDAKZjFl
NDBmOWZmZiB0YXJnZXQvYXJtOiBGaXggYml0bWFzayBmb3IgUE1DQ0ZJTFRSIHdyaXRlcwplYjE0
MmI0MmI0IHRhcmdldC9hcm06IEFsbG93IEVMIGNoYW5nZSBob29rcyB0byBkbyBJTwpkMzcxODZh
YmRkIHRhcmdldC9hcm06IEFkZCBwcmUtRUwgY2hhbmdlIGhvb2tzCmFlMTJlMTYxZGEgdGFyZ2V0
L2FybTogU3VwcG9ydCBtdWx0aXBsZSBFTCBjaGFuZ2UgaG9va3MKOWJmYTk5ODA1ZCB0YXJnZXQv
YXJtOiBGZXRjaCBHSUN2MyBzdGF0ZSBkaXJlY3RseSBmcm9tIENQVUFSTVN0YXRlCjg4MWJlZTVl
OTYgdGFyZ2V0L2FybTogTWFzayBQTVUgcmVnaXN0ZXIgd3JpdGVzIGJhc2VkIG9uIFBNQ1JfRUww
Lk4KODkwYWQ2NDcyYiB0YXJnZXQvYXJtOiBSZW9yZ2FuaXplIFBNQ0NOVFIgcmVhZCwgd3JpdGUs
IHN5bmMKOTIyZWVjMDIzYiB0YXJnZXQvYXJtOiBUcmVhdCBQTUNDTlRSIGFzIGFsaWFzIG9mIFBN
Q0NOVFJfRUwwCjViMWNlMzNjMGIgdGFyZ2V0L2FybTogQ2hlY2sgUE1DTlRFTiBmb3Igd2hldGhl
ciBQTUNDTlRSIGlzIGVuYWJsZWQKMmVjYjA5YWUwNCB0YXJnZXQvYXJtOiBBMTUgUE1DRUlEMCBp
bml0aWFsaXphdGlvbiBzdHlsZSBuaXQKMGYyNmExNTY4YSB0YXJnZXQvYXJtOiBBNTM6IEluaXRp
YWxpemUgUE1DRUlEWzAxXQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0ggMS8y
MjogdGFyZ2V0L2FybTogQTUzOiBJbml0aWFsaXplIFBNQ0VJRFswMV0uLi4KQ2hlY2tpbmcgUEFU
Q0ggMi8yMjogdGFyZ2V0L2FybTogQTE1IFBNQ0VJRDAgaW5pdGlhbGl6YXRpb24gc3R5bGUgbml0
Li4uCkNoZWNraW5nIFBBVENIIDMvMjI6IHRhcmdldC9hcm06IENoZWNrIFBNQ05URU4gZm9yIHdo
ZXRoZXIgUE1DQ05UUiBpcyBlbmFibGVkLi4uCkNoZWNraW5nIFBBVENIIDQvMjI6IHRhcmdldC9h
cm06IFRyZWF0IFBNQ0NOVFIgYXMgYWxpYXMgb2YgUE1DQ05UUl9FTDAuLi4KQ2hlY2tpbmcgUEFU
Q0ggNS8yMjogdGFyZ2V0L2FybTogUmVvcmdhbml6ZSBQTUNDTlRSIHJlYWQsIHdyaXRlLCBzeW5j
Li4uCkNoZWNraW5nIFBBVENIIDYvMjI6IHRhcmdldC9hcm06IE1hc2sgUE1VIHJlZ2lzdGVyIHdy
aXRlcyBiYXNlZCBvbiBQTUNSX0VMMC5OLi4uCkNoZWNraW5nIFBBVENIIDcvMjI6IHRhcmdldC9h
cm06IEZldGNoIEdJQ3YzIHN0YXRlIGRpcmVjdGx5IGZyb20gQ1BVQVJNU3RhdGUuLi4KQ2hlY2tp
bmcgUEFUQ0ggOC8yMjogdGFyZ2V0L2FybTogU3VwcG9ydCBtdWx0aXBsZSBFTCBjaGFuZ2UgaG9v
a3MuLi4KRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBv
cGVuIHBhcmVudGhlc2lzICcoJwojMjY6IEZJTEU6IHRhcmdldC9hcm0vY3B1LmM6NjI6CisgICAg
ZW50cnkgPSBnX21hbGxvYzAoc2l6ZW9mICgqZW50cnkpKTsKCnRvdGFsOiAxIGVycm9ycywgMCB3
YXJuaW5ncywgODcgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggOS8yMjogdGFyZ2V0L2FybTogQWRkIHByZS1FTCBjaGFu
Z2UgaG9va3MuLi4KRVJST1I6IHNwYWNlIHByb2hpYml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1l
IGFuZCBvcGVuIHBhcmVudGhlc2lzICcoJwojMjY6IEZJTEU6IHRhcmdldC9hcm0vY3B1LmM6NjI6
CisgICAgZW50cnkgPSBnX21hbGxvYzAoc2l6ZW9mICgqZW50cnkpKTsKCnRvdGFsOiAxIGVycm9y
cywgMCB3YXJuaW5ncywgMTEwIGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2ggaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KCkNoZWNraW5nIFBBVENIIDEwLzIyOiB0YXJnZXQvYXJtOiBBbGxvdyBF
TCBjaGFuZ2UgaG9va3MgdG8gZG8gSU8uLi4KQ2hlY2tpbmcgUEFUQ0ggMTEvMjI6IHRhcmdldC9h
cm06IEZpeCBiaXRtYXNrIGZvciBQTUNDRklMVFIgd3JpdGVzLi4uCkNoZWNraW5nIFBBVENIIDEy
LzIyOiB0YXJnZXQvYXJtOiBGaWx0ZXIgY3ljbGUgY291bnRlciBiYXNlZCBvbiBQTUNDRklMVFJf
RUwwLi4uCkNoZWNraW5nIFBBVENIIDEzLzIyOiB0YXJnZXQvYXJtOiBBbGxvdyBBQXJjaDMyIGFj
Y2VzcyBmb3IgUE1DQ0ZJTFRSLi4uCkNoZWNraW5nIFBBVENIIDE0LzIyOiB0YXJnZXQvYXJtOiBN
YWtlIFBNT1ZTQ0xSIDY0IGJpdHMgd2lkZS4uLgpDaGVja2luZyBQQVRDSCAxNS8yMjogdGFyZ2V0
L2FybTogQWRkIEFSTV9GRUFUVVJFX1Y3VkUgZm9yIHY3IFZpcnR1YWxpemF0aW9uIEV4dGVuc2lv
bnMuLi4KQ2hlY2tpbmcgUEFUQ0ggMTYvMjI6IHRhcmdldC9hcm06IEltcGxlbWVudCBQTU9WU1NF
VC4uLgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMzk6IEZJTEU6IHRhcmdldC9h
cm0vaGVscGVyLmM6MTQxNzoKKyAgICAgIC5hY2Nlc3MgPSBQTDBfUlcsIC5maWVsZG9mZnNldCA9
IG9mZnNldG9mbG93MzIoQ1BVQVJNU3RhdGUsIGNwMTUuYzlfcG1vdnNyKSwKCnRvdGFsOiAwIGVy
cm9ycywgMSB3YXJuaW5ncywgNTkgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgpDaGVja2luZyBQQVRDSCAxNy8yMjogdGFyZ2V0L2FybTogU3BsaXQg
YXJtX2NjbnRfZW5hYmxlZCBpbnRvIGdlbmVyaWMgcG11X2NvdW50ZXJfZW5hYmxlZC4uLgpDaGVj
a2luZyBQQVRDSCAxOC8yMjogdGFyZ2V0L2FybTogQWRkIGFycmF5IGZvciBzdXBwb3J0ZWQgUE1V
IGV2ZW50cywgZ2VuZXJhdGUgUE1DRUlEWzAxXS4uLgpDaGVja2luZyBQQVRDSCAxOS8yMjogdGFy
Z2V0L2FybTogRmluaXNoIGltcGxlbWVudGF0aW9uIG9mIFBNW1hdRVZDTlRSIGFuZCBQTVtYXUVW
VFlQRVIuLi4KQ2hlY2tpbmcgUEFUQ0ggMjAvMjI6IHRhcmdldC9hcm06IFBNVTogQWRkIGluc3Ry
dWN0aW9uIGFuZCBjeWNsZSBldmVudHMuLi4KQ2hlY2tpbmcgUEFUQ0ggMjEvMjI6IHRhcmdldC9h
cm06IFBNVTogU2V0IFBNQ1IuTiB0byA0Li4uCkNoZWNraW5nIFBBVENIIDIyLzIyOiB0YXJnZXQv
YXJtOiBJbXBsZW1lbnQgUE1TV0lOQy4uLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFu
ZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5
IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAZnJlZWxpc3RzLm9yZw==

