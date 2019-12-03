Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1004882lfc;
        Mon, 2 Dec 2019 20:14:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbT+BadZKhHqJJdPqSZzGUaIr0ZE9sF3utEssvjrrQKR+b0Az4srmZBG8UHJ+Rf9YO1M33
X-Received: by 2002:a17:906:f47:: with SMTP id h7mr3834360ejj.254.1575346441083;
        Mon, 02 Dec 2019 20:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575346441; cv=none;
        d=google.com; s=arc-20160816;
        b=I5pcODskRuT5rdedIAqFbHcq0hewT3THS7duTX28WYx9TljTSg1MZchC2+bS76t+6X
         ahM/lZCMwQbWiM011Dd3JZsDrOVcvWKzMKVfq0nI1yQ8M2N+AVEJ4KGmENppjbVXMSXx
         czsyhjMook4zn0+xghpiAzoExz/UHpWZqIepM7qtq2rKCp+xVN72+H3KrKOQUHlRBoyL
         aUP2Kyeg9y5i5eF8dhE92ezk4sM8Gm7pidcBjxh+r1qdHFDWgHecEwJdMh+o5xMzdir/
         BayVFA81DNhLoWMhB7B7QFhcDrZ6+FXt7v1VMhRRKA1qnIot21HptybYVmuXSb3DN001
         fpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=8MgJM3J3IhBnKwFW2SJqSeqOlRczVQkkEIqpATcIvsU=;
        b=ejGHkRoOjrgTU+x+hik3xazdsCDhyVAEpHNNXYpMgI5RbWW49a8y1YONKTc/d2ScRa
         cyaAw5J7oPoh6nEUsa9fxuU3vrLSXBVE8Z4UBwbRr+8CTGyqvE533oTY8nibR25wiCdM
         7/AStjuPw/7t2AzZKIll6y4sS1GM1VAFeurZ6Hj7KLAU7WahdhDoSD8HHB/SubufGHJT
         c+bGzaGG5lfWUEO+3NgeCdnnxiKuc8jLRewe7MJeJ/tD/dq3tzEgmU+utKAlUi3dMYpx
         GAhg9jopxJ47DZ9kt+2fq8NUYd9SS1TpsFZogCnRcKPRsank1J7xf7UET+xCZoYD+syo
         BuwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=R3M6lwnr;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=cyNocwe7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si1270490eji.113.2019.12.02.20.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 20:14:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=R3M6lwnr;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=cyNocwe7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibzZW-0005rF-T2
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 23:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ibzZ9-0005mZ-I6
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 23:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ibzZ6-0001L0-6h
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 23:13:33 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43443)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ibzZ5-0001Hr-T9; Mon, 02 Dec 2019 23:13:32 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1032FC28;
 Mon,  2 Dec 2019 23:13:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 02 Dec 2019 23:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 8MgJM3J3IhBnKwFW2SJqSeqOlRczVQkkEIqpATcIvsU=; b=R3M6lwnrDWJz4HEf
 xRcLyRZFSLtXks4a8rzJLzRGVlwlDWKziNcdMlodCGJarTDja8PE2Jo+zLSdT340
 CybYogFCKMxhS0rU2Qz4oRb3AT7DBH2hfI9ITKJDwHAI46wNsq5J9yCpCoNh4d2y
 jzhoB7u3iIyHTXfNpzQVuWdjm8snGGvl1670zpxgots1GwzJVaI0XqiVFc5fzb8B
 kveXTIREuuAo39e4SKQmVF7BzWUKAOH5isxvMxVzmlMVe5IUF26QjZySKlCVKNi0
 DqqZMSfXAYz/2ievqBSlBfdfnmZyKjjobZsz3qqYWKjps8Ak4JJeoON5XA3yOmLl
 e3okGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=8MgJM3J3IhBnKwFW2SJqSeqOlRczVQkkEIqpATcIv
 sU=; b=cyNocwe7zRRg7qZyoqiApGhSHGuY20krC3YrzXePhcacMw4HwHcWon66Y
 dzF6kUXex/fg0qJNEmkzJaJaCaYTRe2dlgyykFH0uODVkwUV5q3N7w/9orfwNQYj
 tkwJarq4US3RmO99lsgB8coClH4jn2Y+mI/rB2+5svPllMz1pD0a42nkv0lGAAwr
 CeFZZS9HEw+ruTLUQpywWXETsqe+v3OtP9YMBjJz+8FdGgBm2hExYQfkj6VIJHnX
 hFBgObAZABLxXFKDXlUq5Klbg6pLHz6VsIGKaTy3wcJyW3nA6A3ot2BaNuWXtC0a
 sGyPMrTXWkXbge+dbgcLo47U/P9yw==
X-ME-Sender: <xms:6ODlXR3uXAw-tY723_kafn6aw2UlkDFXiZk_nasfsFfzLJse9XdoMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughr
 vgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtd
 dvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:6ODlXaKzD7qUsgVo4RgYuz0anFUnXZ3pAl8mC0t6VfSIltZfp-bTUw>
 <xmx:6ODlXQAOQOJb6m48Sz3RC0aPtGVTF17G2uS_AhfFd5VzBtOb8P3VpA>
 <xmx:6ODlXTxqr3VMmGR-f5TPZEYberkfyOaCeNA_o-m8gVGjOPkvDZQkfg>
 <xmx:6ODlXfYpoV8xwiuv1xGLw1qvv3pEFaiYJt4b81v9YplqZZccagKU5Q>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03FB880060;
 Mon,  2 Dec 2019 23:13:25 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 4/4] ast2600: Configure CNTFRQ at 1125MHz
Date: Tue,  3 Dec 2019 14:44:40 +1030
Message-Id: <20191203041440.6275-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203041440.6275-1-andrew@aj.id.au>
References: <20191203041440.6275-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.24
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yEEKeNjCRmg4

This matches the configuration set by u-boot on the AST2600.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 931887ac681f..5aecc3b3caec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -259,6 +259,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affinity(i),
                                 "mp-affinity", &error_abort);
 
+        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfrq",
+                                &error_abort);
+
         /*
          * TODO: the secondary CPUs are started and a boot helper
          * is needed when using -kernel
-- 
2.20.1

