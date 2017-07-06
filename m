Received: by 10.25.44.15 with SMTP id s15csp2663614lfs;
        Thu, 6 Jul 2017 16:52:47 -0700 (PDT)
X-Received: by 10.237.59.78 with SMTP id q14mr29472162qte.143.1499385167472;
        Thu, 06 Jul 2017 16:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499385167; cv=none;
        d=google.com; s=arc-20160816;
        b=FRlYQBZE2HhoG+4K3PF/fesmKCn03zR4Jrq5OE/w0TcDLap/iCEmW4L1iIdwwbaK+W
         goWXeq73lccYSxhyIuv7lI3iQmfkwRlDvEkDZ07/1lCXAU6eYWfgp9GINL5x14x92G0t
         E7c4YW5ls96SuEsZG77xX9WBUB5XEi8gG+QLKlHblRrvsRHSB3a1GWjM2ILVbkuQgG9d
         L4pXhF9F7BzsPf0U9bS8SC2NHikRUBP12gD2sTmQFTYrC6C8TWTX+IbS59tsIxzNR4IC
         KrcAT/2uiXrKQP8yVnTcQqNuuyqPmraJiBvJDd+uu7n901GojVs4bb4X0shR4NxvrMyx
         p9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=qo1SiVKenIf6niJRyAbCCKeUfnq/Q+wozgoyQ38+/lk=;
        b=TlIC90ZKHuwJ6UAOwGNsYL7eUWp5USd0HwU5g26tLafV4LQrFvmbafBRS85p2tKme8
         kjRkJeWisKoh1Y/jiayR0UuoT5DhmgeLJXS8HzeQxrLGR9nhfpUZaHy/Ya0kFbUVYFlI
         PGQ6/Rf8aJIR9zoYSgvA4x3wWu9HfwxqIShEaZTfA26vQK7uiHSPIiM89r3TorMn+Mla
         CHTfzrc6XXecfVvj/dOGc7wl5CMbndNg7M3Zf0MC5xqLnJSrHYNO6KUBz+NBQsCA2hyU
         H2TY3j6IgcQA8U1DXvSyxkzfYBxVWIz1HjTV3s6Ci0jPz0a4VPjRk1Ir0eb/9B4gwM/O
         6tnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m18si1571268qkh.52.2017.07.06.16.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 16:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTGZg-0004Rl-Qi
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 19:52:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dTGXG-0002Z0-S9
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1dTGXF-00084W-S2
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:50:14 -0400
Resent-Date: Thu, 06 Jul 2017 19:50:14 -0400
Resent-Message-Id: <E1dTGXF-00084W-S2@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1dTGXD-00082g-D5; Thu, 06 Jul 2017 19:50:11 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1499385002034625.565418352056;
	Thu, 6 Jul 2017 16:50:02 -0700 (PDT)
In-Reply-To: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
Message-ID: <149938500132.27.16593111081087749477@7a482c8a7db2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: imammedo@redhat.com
Date: Thu, 6 Jul 2017 16:50:02 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom: enforce readonly nature of
 link's check callback
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
Cc: famz@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZAv+SEx1fZ7u

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSF0gcW9tOiBlbmZvcmNlIHJlYWRvbmx5IG5hdHVyZSBvZiBsaW5rJ3MgY2hl
Y2sgY2FsbGJhY2sKTWVzc2FnZS1pZDogMTQ5ODczNDg2My0xNjQzMzgtMS1naXQtc2VuZC1lbWFp
bC1pbWFtbWVkb0ByZWRoYXQuY29tClR5cGU6IHNlcmllcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5l
ICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCgpjb21taXRzPSIk
KGdpdCBsb2cgLS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0
czsgZG8KICAgIGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEg
LS1mb3JtYXQ9JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8
IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxl
ZD0xCiAgICAgICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVk
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CmZhdGFsOiBDYW5ub3QgdXBkYXRlIHBhdGhzIGFuZCBzd2l0Y2gg
dG8gYnJhbmNoICd0ZXN0JyBhdCB0aGUgc2FtZSB0aW1lLgpEaWQgeW91IGludGVuZCB0byBjaGVj
a291dCAnb3JpZ2luL3BhdGNoZXcvMTQ5ODczNDg2My0xNjQzMzgtMS1naXQtc2VuZC1lbWFpbC1p
bWFtbWVkb0ByZWRoYXQuY29tJyB3aGljaCBjYW4gbm90IGJlIHJlc29sdmVkIGFzIGNvbW1pdD8K
VHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgogIEZpbGUgIi9ob21lL2ZhbS9iaW4v
cGF0Y2hldyIsIGxpbmUgNDQwLCBpbiB0ZXN0X29uZQogICAgZ2l0X2Nsb25lX3JlcG8oY2xvbmUs
IHJbInJlcG8iXSwgclsiaGVhZCJdLCBsb2dmKQogIEZpbGUgIi9ob21lL2ZhbS9iaW4vcGF0Y2hl
dyIsIGxpbmUgNTMsIGluIGdpdF9jbG9uZV9yZXBvCiAgICBjd2Q9Y2xvbmUpCiAgRmlsZSAiL3Vz
ci9saWI2NC9weXRob24zLjUvc3VicHJvY2Vzcy5weSIsIGxpbmUgMjcxLCBpbiBjaGVja19jYWxs
CiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJwcm9jZXNzLkNh
bGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydnaXQnLCAnY2hlY2tvdXQnLCAnb3JpZ2luL3Bh
dGNoZXcvMTQ5ODczNDg2My0xNjQzMzgtMS1naXQtc2VuZC1lbWFpbC1pbWFtbWVkb0ByZWRoYXQu
Y29tJywgJy1iJywgJ3Rlc3QnXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMTI4CgoK
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZy
ZWVsaXN0cy5vcmc=

