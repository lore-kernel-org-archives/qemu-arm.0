Received: by 10.25.0.6 with SMTP id 6csp1934421lfa;
        Tue, 30 May 2017 11:08:37 -0700 (PDT)
X-Received: by 10.233.216.194 with SMTP id u185mr22892998qkf.105.1496167717749;
        Tue, 30 May 2017 11:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496167717; cv=none;
        d=google.com; s=arc-20160816;
        b=jGJu/RhCVCuqmVsnvMeeaoPzb0HdrM1Ri8I8y754XOE/guCf+zIPfkAvRt+rRoe5dI
         6u1lMobRsZdOrRQOuSLyVdY+zhW55W7ho2pfVQ5GtqX/FAVNveZusULnS1nwj/aw8eeC
         2sdBPHQrBWGT/B7vI+1nWoz4orF7aTkGthDUqzPDY7R/G9Els0xm6Rmkwheq+Ch8JZP4
         1Vjv8uG5/7Y6O2lUGRd9I5sSi+TYpJpBSCt9ccO8zlmQP2IRGHmnmYXX/7aP3d5A3Duk
         MrheZP6ITxbBg7InpPr2vXrBOflHYZluQyIDZTtapE4NhBbrMhs+tB7KCHz6ZKOWC6Kn
         w27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=JDATYc2RTf4/5f4xDJN6cRm4KtASGe0YjWlSmXeSam8=;
        b=XwZtkjOcb+R7tWf9aMwNZh/O10wkxPcX9eMqAPIqRbRWldeU1YaIRATuQLIBRPOSJ8
         jtVMqLoOL7kZdE24nWPZ+IT8TRgzMpViuCZ3OSxSD8TyBoVtGmr7XoLGauptb6yQd8FV
         oX/QQWgbsy6UFf0cWy9oECWWDq6AiU0JdxQHNWSUuereNqqYyg3Eec+wxtz9fNkjRwNH
         LwTPJXp6ceHQu2c6xtOquFNn1Z4mB8qcgUxgnt3C5fGCanqq3hIHKOdUGY2pVBaVTadF
         7TmgwbAbl26b2eMdmRL3+8lSxBPRd8q2HQ2ZrQlWHQnf3UBriKNzMN7P4DzxVMhjvWPB
         XbEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si1942566qkb.21.2017.05.30.11.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 11:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFlZN-0003cv-4q
	for alex.bennee@linaro.org; Tue, 30 May 2017 14:08:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dFlZE-0003ao-OF
	for qemu-arm@nongnu.org; Tue, 30 May 2017 14:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dFlZ9-0001In-P3
	for qemu-arm@nongnu.org; Tue, 30 May 2017 14:08:28 -0400
Resent-Date: Tue, 30 May 2017 14:08:28 -0400
Resent-Message-Id: <E1dFlZ9-0001In-P3@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1dFlYy-0001F4-Es; Tue, 30 May 2017 14:08:12 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1496167677377728.1187151008601;
	Tue, 30 May 2017 11:07:57 -0700 (PDT)
In-Reply-To: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
Message-ID: <149616767669.206.10154808044371479020@f98a8425f76e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: imammedo@redhat.com
Date: Tue, 30 May 2017 11:07:57 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/7] numa: code consolidation
 and fixes
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
Cc: drjones@redhat.com, famz@redhat.com, ehabkost@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4D+tGjSvjv/D

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKTWVzc2FnZS1pZDogMTQ5
NjE2MTQ0Mi05NjY2NS0xLWdpdC1zZW5kLWVtYWlsLWltYW1tZWRvQHJlZGhhdC5jb20KU3ViamVj
dDogW1FlbXUtZGV2ZWxdIFtQQVRDSCB2MyAwLzddIG51bWE6IGNvZGUgY29uc29saWRhdGlvbiBh
bmQgZml4ZXMKVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCgpCQVNFPWJhc2UKbj0xCnRvdGFsPSQoZ2l0IGxvZyAtLW9uZWxpbmUgJEJBU0UuLiB8IHdj
IC1sKQpmYWlsZWQ9MAoKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZv
cm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNo
byAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAk
YykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBl
Y2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3
MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo5MTM2YTk3IG51bWE6IGNwdTog
Y2FsY3VsYXRlL3NldCBkZWZhdWx0IG5vZGUtaWRzIGFmdGVyIGFsbCAtbnVtYSBDTEkgb3B0aW9u
cyBhcmUgcGFyc2VkCjRkNzU1NzQgc3BhcHI6IGNsZWFudXAgc3BhcHJfZml4dXBfY3B1X251bWFf
ZHQoKSB1c2FnZQpiOTQ2ODQ1IG51bWE6IG1vdmUgbnVtYV9ub2RlIGZyb20gQ1BVU3RhdGUgaW50
byB0YXJnZXQgc3BlY2lmaWMgY2xhc3Nlcwo2MDkzNDdlIG51bWE6IG1ha2UgaG1wICdpbmZvIG51
bWEnIGZldGNoIG51bWEgbm9kZXMgZnJvbSBxbXBfcXVlcnlfY3B1cygpIHJlc3VsdAo5ZDJiNTk3
IG51bWE6IG1ha2Ugc3VyZSB0aGF0IGFsbCBjcHVzIGhhdmUgaGFzX25vZGVfaWQgc2V0IGlmIG51
bWEgaXMgZW5hYmxlZApjMGQxYWFkIG51bWE6IG1vdmUgZGVmYXVsdCBtYXBwaW5nIGluaXQgdG8g
bWFjaGluZQo2YzZhZmJmIG51bWE6IGNvbnNvbGlkYXRlIGNwdV9wcmVwbHVnIGZpeHVwcy9jaGVj
a3MgZm9yIHBjL2FybS9zcGFwcgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KQ2hlY2tpbmcgUEFUQ0gg
MS83OiBudW1hOiBjb25zb2xpZGF0ZSBjcHVfcHJlcGx1ZyBmaXh1cHMvY2hlY2tzIGZvciBwYy9h
cm0vc3BhcHIuLi4KRVJST1I6IHN1c3BlY3QgY29kZSBpbmRlbnQgZm9yIGNvbmRpdGlvbmFsIHN0
YXRlbWVudHMgKDQsIDkpCiMxNDQ6IEZJTEU6IG51bWEuYzo1NDY6CisgICAgaWYgKCFzbG90LT5w
cm9wcy5oYXNfbm9kZV9pZCkgeworICAgICAgICAgbWFwcGVkX25vZGVfaWQgPSAwOwoKdG90YWw6
IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMjMgbGluZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgoKQ2hlY2tpbmcgUEFUQ0ggMi83OiBudW1hOiBtb3ZlIGRl
ZmF1bHQgbWFwcGluZyBpbml0IHRvIG1hY2hpbmUuLi4KQ2hlY2tpbmcgUEFUQ0ggMy83OiBudW1h
OiBtYWtlIHN1cmUgdGhhdCBhbGwgY3B1cyBoYXZlIGhhc19ub2RlX2lkIHNldCBpZiBudW1hIGlz
IGVuYWJsZWQuLi4KQ2hlY2tpbmcgUEFUQ0ggNC83OiBudW1hOiBtYWtlIGhtcCAnaW5mbyBudW1h
JyBmZXRjaCBudW1hIG5vZGVzIGZyb20gcW1wX3F1ZXJ5X2NwdXMoKSByZXN1bHQuLi4KQ2hlY2tp
bmcgUEFUQ0ggNS83OiBudW1hOiBtb3ZlIG51bWFfbm9kZSBmcm9tIENQVVN0YXRlIGludG8gdGFy
Z2V0IHNwZWNpZmljIGNsYXNzZXMuLi4KQ2hlY2tpbmcgUEFUQ0ggNi83OiBzcGFwcjogY2xlYW51
cCBzcGFwcl9maXh1cF9jcHVfbnVtYV9kdCgpIHVzYWdlLi4uCkNoZWNraW5nIFBBVENIIDcvNzog
bnVtYTogY3B1OiBjYWxjdWxhdGUvc2V0IGRlZmF1bHQgbm9kZS1pZHMgYWZ0ZXIgYWxsIC1udW1h
IENMSSBvcHRpb25zIGFyZSBwYXJzZWQuLi4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1h
bmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQGZyZWVsaXN0cy5vcmc=

