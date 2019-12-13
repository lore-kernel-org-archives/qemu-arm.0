Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp370174lff;
        Thu, 12 Dec 2019 21:48:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQnTXzmRHu8LkhjtsKZzVfTVYaCJ44TPWeRSwlvmB7sqU4rmp8hKrsDc5s+Pez8/W6hOOp
X-Received: by 2002:ac8:7b9b:: with SMTP id p27mr11217523qtu.2.1576216139648;
        Thu, 12 Dec 2019 21:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576216139; cv=none;
        d=google.com; s=arc-20160816;
        b=ehne8jAPESHlfvXRWuBdsoQ4R8LhU3kEhIXkoOazBVjMBCNCvMs/0XrYW0z6+OLV+T
         LEvO95uL5PgGjPVA8T18WiO0/hPFgY9vsNL3Ml8lNZ/O/tem7DWInZEPL0mkZxCAoGy8
         XjTx0qkBwJ4owEq8FxB5VxVLH8K2yfhQLqDwdNHkp/kgwcUTFnfbtsmJuH/dgNhcRcvC
         XAyqRDij9lZ/N71QlMxnhvvWcB1msd8aO8lJsc7s+h9YYTtm5roB4yohhqIhcKYp4lzc
         KXGwlgKxTU89/8T7bXp/U7YBADQYichxIh3MU3L063oqLR5I5cxBhkJCeyXUFMBdNCRr
         1ImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=N9bCwlClnlHDFDNFqpp3fD4D/m1EZqVMm4Nk97EMVP4=;
        b=CsSDPSAOCufDfi9oXASPN+Tf5cRVbW986aaBlmx9iZ10hZhM66xyQrpBJHvi9u2yF/
         T9Zv+b/E59dBANthskJMmcLZi95/zj7tDiB3gok9yDdubkbAi0ewozTQAfdpIfUIU3AR
         PJq/MyBeHOyaNI3VAwuHuRjf2ZD7ifzamifK7WOFgPBDksdF6d2mmZe+YcgEKupZKuJF
         FotvU97c1FAn+F8rAXyb45tHp0d7QqMdBM2oXwYFpsKfx+tCU1jRUBDu25P+XDyhFsBW
         3vOD1b3o24vn2N9hBliC4NDUguwry0wLHgFoTYYVFEvPHRH5Ct1/K83f4sm4Z/MIcA1n
         PPzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=e9RikxxK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=OJnLt6TY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si4194183qkg.15.2019.12.12.21.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 21:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=e9RikxxK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=OJnLt6TY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifdow-0002yr-Aq
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 00:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifdoj-0002yZ-KS
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 00:48:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifdoi-0004bU-AH
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 00:48:45 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33035)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifdoh-0004YM-Md; Fri, 13 Dec 2019 00:48:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ED206909;
 Fri, 13 Dec 2019 00:48:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 13 Dec 2019 00:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=N9bCwlClnlHDFDNFqpp3fD4D/m
 1EZqVMm4Nk97EMVP4=; b=e9RikxxK9qaigA7SxEUg3gR9YbtXk+fnRLeeB9h1Oq
 0b8GfuOZC9ELD1gmpwFC5fYEdgbEi8J7oNp7Si0xZLVQC6NlE6x+5tomuaggvjT9
 zu9UB6GyeQg9Zk9YVRRTCqXKOLJnQAO8vgy+0v0pvEFtCkV1AsDBB232zWGwUM1p
 U62oW4qFCWu6cTi9rB97ft1VP0wVs+fDlNLj91rZCN1Y7jyHG1afQ8DeahlFk5eB
 uNNwXRGMBAt2LDRU+2CIaHh3gEaaFSJD57QLovvA+og+EDwJh8ElcKXI4Jt2U2VR
 nncERydcGxaLeFfIVN42YTBGdgM5pRNSm8U9O4NRS0/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N9bCwlClnlHDFDNFq
 pp3fD4D/m1EZqVMm4Nk97EMVP4=; b=OJnLt6TY6kCam8LNEYFbR/T7mvZzu4wK7
 1sWRZe/Fr4QRm2eA/WvuHdpBBUnBK7Rn3ne0Tsl/QS6CBIihHDOpynFyCHWaj5iZ
 LdtE9blBI4Jj/IC28ftdRkv8Ee2NhyUgjL79RGBlePeeMnai//T+o1p8qdtkI1nK
 4ollp69wj/eP1GGDGFDMaI9QSkBZiYO35UZJB44OOZjloDJPenXW9HkXW0+BOuf7
 UrxSj515tTkVYTntY07ax6N/rrQ6Wg78ajMHuanadlsHmTQRQKyf57EdA5qjC8VY
 /Ogz9fqZ+cI43zbGpIOqjHKJUUOg9YmMhhlb1ZYh2y2UWLmFxp1vA==
X-ME-Sender: <xms:OCbzXc72U_t_HP8zgA010MdlMcrN5yb79zyh1LvcM3g54GtOyiOfSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:OCbzXXchM_kfHTJ5Stqe832G1lV_NHWdbOlsrIjY_UflTkYho9V7SQ>
 <xmx:OCbzXW4MF_QnmgpbnAZD8ORQy78NFNKDVrdaHA7_Lq52sMDI86cSzw>
 <xmx:OCbzXf1fxHvr7jxeXUEfrEApRRBz17PpCttQvJe1zexmJu0m7CqSKg>
 <xmx:OSbzXUvcO83-tFO_hbOGDsZ6JdiP1T0i_4TOdkwV-j9kxdce7QLXMA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1561E80063;
 Fri, 13 Dec 2019 00:48:37 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/4] Expose GT CNTFRQ as a CPU property to support AST2600
Date: Fri, 13 Dec 2019 16:19:47 +1030
Message-Id: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.19
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@redhat.com,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iz7GdvB5C0iq

Hello,

This is a v3 of the belated follow-up from a few of my earlier attempts to fix
up the ARM generic timer for correct behaviour on the ASPEED AST2600 SoC. The
AST2600 clocks the generic timer at the rate of HPLL, which is configured to
1125MHz.  This is significantly quicker than the currently hard-coded generic
timer rate of 62.5MHz and so we see "sticky" behaviour in the guest.

v2 can be found here:

https://patchwork.ozlabs.org/cover/1203474/

Changes since v2:

* Address some minor review comments from Philippe and add tags

Changes since v1:

* Fix a user mode build failure from partial renaming of gt_cntfrq_period_ns()
* Add tags from Cedric and Richard

Please review.

Andrew

Andrew Jeffery (4):
  target/arm: Remove redundant scaling of nexttick
  target/arm: Abstract the generic timer frequency
  target/arm: Prepare generic timer for per-platform CNTFRQ
  ast2600: Configure CNTFRQ at 1125MHz

 hw/arm/aspeed_ast2600.c |  3 ++-
 target/arm/cpu.c        | 65 ++++++++++++++++++++++++++++++++++++------
 target/arm/cpu.h        |  5 +++-
 target/arm/helper.c     | 24 ++++++++++++----
 4 files changed, 83 insertions(+), 14 deletions(-)

base-commit: 04c9c81b8fa2ee33f59a26265700fae6fc646062
-- 
git-series 0.9.1
