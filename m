Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7130100lfc;
        Wed, 27 Nov 2019 21:44:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCvuvSPjtGy+3ZphmiWcxROAokyolBc2AUTBgrqa2MtyN4vk1wsrM1ts3G7zY6htMFauOu
X-Received: by 2002:a50:ed11:: with SMTP id j17mr13745964eds.38.1574919866142;
        Wed, 27 Nov 2019 21:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574919866; cv=none;
        d=google.com; s=arc-20160816;
        b=UwGF3CEuyjNwHXMblU0YoOBnrpUYWN3cAIuJS//VezXDxd4+vPpJArYZIx0vGE9yV5
         wQh/DVwl6EYG5Yh2nY6vpaQojpUJvBXZWQ5jYpy/fpY7yksN8HQSqHCjMIsN5uZq/MWE
         18K4Jr8IkOhMcbTff3N5DpqVJ+f7IIw5aN6lH1Tk43QPzX7X/HaBSvTypcPY2d9JgTMu
         /9lgNwkTF3PxTq7aTIBD0FsOCPu+XGanBEl7UCPL0xqufDHOJ5mSjQ5bKIZNUbkOjgcc
         Ddk+ipP8JVG1u8FaKCTmCXCAJGfw6UuSYs7Qj1Z9WJSMlkCX3LLjPsZIRmxfuAomZNX6
         aQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=tpwcyHnQIJvLrT57pGFzeHHaxD3LecagW2N1Jk6TFbU=;
        b=V7Kf7o6eDbfpZJbVxNHjSFP96i5KKzsDeafBn9YAFzp+wxUW5WNks5kQq8Pi1Q016h
         exphQe0eymv/Yej21gUWy40fYGs6bW3Owgbu0/jIRZpxFkMzzrJdEdX7TDMj4eg5MNM5
         2fI4Bd9xNMzhYo0mtTt0ZBjoesi//6QjQkzoinz7KwrT0ptd0UkRjipVC9okCl6fPZz4
         hWVtNj1YEgrYTxgyCH5NcLgwxt9k9ul9D7lij1Y60Hhlnj6SHqwq0sMQBFmhI58QSUHk
         hmd6dZ7sAeiNr7hAjnLldVP2jId59UoDyVaGVDfj4P02jF/Ws9egtWqMKRzBd0+n48ID
         ONvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=lLUBC5ke;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=meTqPbZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si5442044eds.278.2019.11.27.21.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 21:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=lLUBC5ke;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=meTqPbZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaCbI-0006hV-OK
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 00:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iaCb3-0006h9-HL
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 00:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iaCb2-0001gm-8A
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 00:44:09 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58349)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iaCb1-0001dI-IH; Thu, 28 Nov 2019 00:44:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B2A322763;
 Thu, 28 Nov 2019 00:44:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 Nov 2019 00:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=tpwcyHnQIJvLrT57pGFzeHHaxD
 3LecagW2N1Jk6TFbU=; b=lLUBC5kebFnop+JV4z9WHjM4WBqUfPzHGlAH8vK3x/
 3bx+cgQV8f5clssFQx1NditEMlDUT3yQz00rVFBmIBvGnC12ZhoyH/q8QpDzXssq
 nwns0YxqdHvO6L40+HcAncJu6u0zTQ0ZJrMzaz4ead4bVjvBIxLl+pSVFKM4gkQS
 7rAXFh5Bad5+q2g5Z8zohHKqhPSGhf7+9uhNORoslRRiyStUSWS3qs48DZhi5JlL
 CyLZjM6ABS1b+GSSGOoIOJr8gchpPMddEQxsfKd3CmBjJF9OwZE7ul3qqGii3aD9
 KOms/NCVcgDmSHMeEcMrr146fXmCeCNSgH/b6bTvYv6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tpwcyHnQIJvLrT57p
 GFzeHHaxD3LecagW2N1Jk6TFbU=; b=meTqPbZLpjAyMD3GKapEmKS93oTdd3LEu
 SX/HJ4a+Ok7EyyNkB8jc+qQvAl2yWcqP60INnUXQ4Es0Q7fhnVpjIEEwdRHkTkoq
 IZcczFd0AY/W/wmLOsEYEncnJBPpsutLyHU/y0cbMjl9Nn0tshlW7TgkTby6wqNl
 5bD0QjJEcEMPHetZD1gq4UuAVMEpbseo7+qlEZ0lDNCsZjpKPsbfJTW2mIdBxZfR
 H75OgGbj+440r1n1Y1YNd+KYGsuByQHhdv9YDlxIBo0cOsn333m5rzb7igHVTdsY
 9IQiTyTQjQP/VNc9bFCdcza0YM31aV4Ix3OpildpcJCw6Yaiygr4w==
X-ME-Sender: <xms:pF7fXWki8ke301TsUy9Fmke7F5nm7d5G_KRD2TTNFxWEolTF8sj4Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilh
 hfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:pF7fXZ6tzfA4iM_LPVJXuOSYCl2Pk7xAX5eYtighUxG0uWWRpeVqJA>
 <xmx:pF7fXf_VpbzBLCNoJ5DvoHdHBHGHy_t_s4dMwi2BcOmFBDwuZdZbKQ>
 <xmx:pF7fXZiUX75fqMXCfXFGFMB9bF5nj0ao8D9GCjaDjg3z5XTwWNNhKQ>
 <xmx:pV7fXXL6zXQ3WMsXrwGrq5ZGdZvszzBBvmN3sY2xr8-MVdZdM4jIag>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 73E1A80062;
 Thu, 28 Nov 2019 00:44:02 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/4] Expose GT CNTFRQ as a CPU property to support AST2600
Date: Thu, 28 Nov 2019 16:15:23 +1030
Message-Id: <20191128054527.25450-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.26
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2B1X+Wb7R0PN

Hello,

This is a belated follow-up from a few of my earlier attempts to fix up the
ARM generic timer for correct behaviour on the ASPEED AST2600 SoC. The AST2600
clocks the generic timer at the rate of HPLL, which is configured to 1125MHz.
This is significantly quicker than the currently hard-coded generic timer rate
of 62.5MHz and so we see "sticky" behaviour in the guest.

Please review.

Andrew

Andrew Jeffery (4):
  target/arm: Remove redundant scaling of nexttick
  target/arm: Abstract the generic timer frequency
  target/arm: Prepare generic timer for per-platform CNTFRQ
  ast2600: Configure CNTFRQ at 1125MHz

 hw/arm/aspeed_ast2600.c |  3 +++
 target/arm/cpu.c        | 41 +++++++++++++++++++++++++++++++++--------
 target/arm/cpu.h        | 28 ++++++++++++++++++++++++++++
 target/arm/helper.c     | 24 ++++++++++++++++++------
 4 files changed, 82 insertions(+), 14 deletions(-)

-- 
2.20.1

