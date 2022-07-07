Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5283732lft;
        Thu, 7 Jul 2022 00:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubHRlMlFmH41vdMoxrrxz2yAogrfk4JNs+h6+8qyE5F4t5q9+KTNqjDpyleV0n+rnThC1k
X-Received: by 2002:a25:5457:0:b0:66e:b1af:94c5 with SMTP id i84-20020a255457000000b0066eb1af94c5mr3081343ybb.101.1657178567957;
        Thu, 07 Jul 2022 00:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657178567; cv=none;
        d=google.com; s=arc-20160816;
        b=K5eV1D3ljVQQp4GpEtFUTgGuBwBV3IC9xikdkMaVNJGRXZbUM54VHUHWQSwl4d5XpO
         X/2/wgnD9B9dLiFmBI/o5Xo1LdcVQzBV8KK3aJzKqgp6WSffvmeOks+oDT+H2NLvRgxS
         Z5AvqFy7+Jro0+E7k8vAsEa3LMaw4TsG6Y0WvYWU1uTkOhThxeKGAuNI2z03fN6vkyu/
         BNAigA87cZuqXg7tP/zx28TJQt9NZFYCnvQZxqlKBl3kYsoihT7zQbM4kq/HSuy8kapN
         fKTkz6TF65ExxNjT+TAvLpipopVmn88Zh0ngTwNY6gS8D53Y5jZjNBdzMQ83Ibk9eIy6
         wlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=o/d4I9s4uyJ2wz9XQaSPt7mRNCiwaRBPAINIRm7Je6w=;
        b=U+YsXgcYwAschFQrErmAEw0B2JDVHaHCodWAnI+c2pol/aLk39v4PmSM3baRDgHj2o
         Hd8zviPrrAS55OCAzSI1HOUUtuLebsmb+YabUmgelr0I6MDIW6xXjbRqv6mkA0KHYXCV
         G6yKmvCCDXJCoS0s/iS4cHCfM+rMH060aFP7AAKveRruS/sCKA/bZYMOzri3hnnu8/vv
         lKydGhzvtHl9cRJmD1oZSJ9m0pAGYFmxFCugBHKkBzBYsDnGJGJP833r4zUtiqni9Ifx
         bDyDUUhObVHJbgZ88Y/A7cJ1nPsDAhF3q45uEZD54iFDNPLrMUqkHABF5vaGB+ou7Vr8
         I3FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=eQB9tv42;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=DXrRNg4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k125-20020a255683000000b0066e6ac2ab26si8606215ybb.511.2022.07.07.00.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 00:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=eQB9tv42;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=DXrRNg4X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9LqT-0007H3-Fk
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 03:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lod-00073C-Nz; Thu, 07 Jul 2022 03:20:59 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:49733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lo9-0008BF-Lm; Thu, 07 Jul 2022 03:20:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BCF222B05961;
 Thu,  7 Jul 2022 03:20:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Jul 2022 03:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1657178413; x=1657182013; bh=o/d4I9s4uyJ2wz9XQaSPt7mRN
 CiwaRBPAINIRm7Je6w=; b=eQB9tv42oMpFqX145wpWTT55M0mqSqS0NrFSvP8IY
 opA9A8/43MzOkV068UM+jv0UeLuOmJs4aaRi7cXK3Gh8F6opYtF/un/owAf6e/IE
 5qr+OWf0YV2EvZgC1D2ZcOABD4Ar3jBXeNPRFbXhbqTsHk7fwI4Wg8TmcKlBvCtR
 HHo3rePIN93nso4jI6BT04wWbKgjOR8/q9FdyR7o5eIoSrvqdRbrBcavRxgzvvNZ
 S/XFRD3+b6oB7gNgBY35xWF0tL+4s92NJ5g+m5PfEDEvcyn0Ld5XGj0T8uak4gmF
 +2uwMbcY+djO0wU8ZLB0S5fwP8sSbXMviWVGtrDh4FhDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1657178413; x=1657182013; bh=o/d4I9s4uyJ2wz9XQaSPt7mRNCiwaRBPAIN
 IRm7Je6w=; b=DXrRNg4XttiHZODyKRjLPmY6fTnNPMjF1KyCUtGIwPyBP9cuOuD
 AyJMRhgq0W5mFc8mrtP9VDUGxjr1uqbW9l00k7fRDqP3WT7n+mrPTMRO7q7G2BZI
 8CBYtMxDCSE/ttEpJhj/ASOUEvzLUz74rXFoj7SoA/6olXO9YNyz2twFt5vfYP1K
 0Qh0zlfeBEuzhjkFrS7A0WowkOsGP3Il+yoMmVBOyHbcpRkj6l16104k4fcmA4b6
 0gnSJaQ2A4S58ll3SL0n4idtupY6klTKGdbMbBJILf4iwa9+p9X0ZhLeLyB687x6
 Gvb8O1mFeGEvTJfXgvQb1dXb/OAbHpS2zSA==
X-ME-Sender: <xms:LInGYtqkWzFNZE6lbHlpp4KLbdzWi4CZo6KCjDrdiSf5TWLw14z9XQ>
 <xme:LInGYvooD6ctTWdo022GsAdg3JgJtPQpKMhJv5LzRRx8uUGTqVgs7Hiq1C6NPdbai
 s592gpT2gPoNFTr6aM>
X-ME-Received: <xmr:LInGYqNmHUrGEWNWMA0ElK006dKeA5OanskqmNs3aYg5M7vU197l0ls9ElFQSHqpuNym2N0pqmEfLZBbAZcVVhXqQkGsyVYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeer
 tdertddtnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrse
 hpjhgurdguvghvqeenucggtffrrghtthgvrhhnpedvjeeghfekjeejiedtuddtvdeugeeh
 heefleetffeugeejuddttefgvdegveeigeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:LYnGYo6R4jWGG4IlpfW8uDze71qnivTuQk9-Bfrpw32l3svjpP6I-A>
 <xmx:LYnGYs5RaQ-M8XXYXqeLRMaXoMYauVyBvjHIx9dwuRF_srVlY5zd-Q>
 <xmx:LYnGYgiFJb7zWqF-W1xfRt20qJOojtv0asyyI6YH9hAc9nxYIq3wow>
 <xmx:LYnGYn2ErwZA1PxvydEx_UYeoY5EgmPq4ALIDjMNgnh0sXJQbWBLyZlPsjQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 03:20:12 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/gpio/aspeed: Don't let guests modify input pins
Date: Thu,  7 Jul 2022 00:20:11 -0700
Message-Id: <20220707072011.34582-1-peter@pjd.dev>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/KLWHTNqv+D

The fby35 OpenBMC sysvinit scripts check various GPIO pins at start and
decide where to start IPMB daemons for each slot in the sled (4 slots max).
It only starts an IPMB daemon if the slot GPIO pins indicate that it's
present and powered on.

I've been simulating some input pins by setting their value in the machine
reset function. I think a proper solution would be to add input pins to the
Aspeed GPIO code and create devices that force the pins high or low
appropriately, but for now setting the QOM property seemed fine.

But, I noticed that while the values were set initially, something in the
boot process resets all the values I set to "low". I imagine something in
userspace or the driver is blanket writing zero to the data registers. I
think the Aspeed GPIO controller probably shouldn't be changing the value of
input pins in this case.

To fix this, we could just make sure that aspeed_gpio_update() never sets
the value of an input pin. However, that would also prevent my code in
fby35_reset from initializing the input pins to some special value. So, to
support the QOM property setup use-case, I added a "force" parameter. Kinda
hacky, but it was the simplest thing I could think of.

Thanks,
Peter

Peter Delevoryas (2):
  hw/gpio/aspeed: Don't let guests modify input pins
  aspeed: Add fby35-bmc slot GPIO's

 hw/arm/aspeed.c       | 14 +++++++++++++-
 hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
 2 files changed, 25 insertions(+), 11 deletions(-)

-- 
2.36.1

