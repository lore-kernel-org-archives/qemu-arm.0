Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3447957lft;
        Mon, 4 Jul 2022 12:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tskmGHrGTC2DXWcRlkSd4o271/CLoplTaykIl/AzfsJjICg5BMEr499WnHu+KwIK78NOU4
X-Received: by 2002:a25:3fc5:0:b0:66c:85df:4e3 with SMTP id m188-20020a253fc5000000b0066c85df04e3mr32412819yba.90.1656964316525;
        Mon, 04 Jul 2022 12:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656964316; cv=none;
        d=google.com; s=arc-20160816;
        b=vJTrrH1d7x+qFuDzdMtP6oTmBl0jzKxWNUvyQJKBTQZsnzwaOGFFGaWNRRXdfcvBeg
         u0ONSQiAGyw42OeLMSTZqHwB73drg/5QGAw/WknfY8Owzsx8wyzQZV7/RCxxnEVO3HRW
         2uKi0xMlWlT7hT8ToHCq9X26UUK0PQY/dzHKsxhZAe/1Q6gUkE7Wy4pTx9UIty0JwHMe
         iFGofq4lMs4DgPWNkmKt285taWUnLFTXYnvjjG8NzXvSn+OjMy/1mTI8VRHR3d1hztBp
         SaiehBi7cD8mxF+YlD5SLS9vfOzS0WJSh6i2MDxIcghHCniKxXVxvnEpyXLccTfwd+w4
         YCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=e804EdS9Fd3UldTp+gjGVNGymUmbe++XaN/xWubAwb8=;
        b=FZZf2f4yy97jLQ9oOl9bv8TUdVHlinG/6NUBqkVUScPBL1DTCbN6whozmubMjDOqhB
         lRz5LtMtYEoKZcO/GTHyUsQ40bVAsmAp0Lphe9sJlbn+pTA3h3HaX7UYhml6f3YzKQ45
         LVXI48OTgcCnYPSP1+BhHXh3ugG/vnMLIEVnJThNK0MpH+8bkmeMOkCMIXhAK5scVPwH
         JsYGkK647VArmICbP2tG7SVZMGy+XJHO8RtGVPLdLFCWaVhxS/MnEqW++0W1Wblkq6iT
         jw5SzKB6nMKVyu+Nz+klSY9MOxbdUIx6Uqr4XQuz0/3MuNOiyknyd4AMRB8lp/YUdzhF
         3+eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=mYyGlWIj;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b="OJa0o5/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j131-20020a815589000000b0031cc2ed05cesi14922ywb.465.2022.07.04.12.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 12:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=mYyGlWIj;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b="OJa0o5/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8S6t-0002uR-Ul
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 15:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8S6g-0002sJ-V8; Mon, 04 Jul 2022 15:51:42 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8S6f-0000DR-4W; Mon, 04 Jul 2022 15:51:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 112A55803BB;
 Mon,  4 Jul 2022 15:51:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 04 Jul 2022 15:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656964299; x=1656967899; bh=e8
 04EdS9Fd3UldTp+gjGVNGymUmbe++XaN/xWubAwb8=; b=mYyGlWIjFZp1jGUug4
 qwHJ8PrfNALjQlC30fiesgjKTs+Ae8CCbz4yJLtm+SVIZnq4stV6t6wXe2BCNQ8m
 3mgqLtJWRC5fgbTQ7JjONV1JrvaoSOiZqoKkQu84/II0k6N3Iv3H4o7zra90vmIn
 yqrnU9x+uYuDqpR9Y3AcP5ygCC2HYpSbTde140hcnU1UeifTaXyr1KGyMpzzaXrx
 +vLStADRGvcVy+Cc+Yo34lNiP/elo1kI35Q/R76JwUhyW80zxnK94S0MAcCk6uLZ
 J7AjysEplTZh7zIGyZr6dw5msEAiQYuPi++dEtBljXbOniBBtv+O+9MhmUkrc2LE
 CHQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656964299; x=1656967899; bh=e80
 4EdS9Fd3UldTp+gjGVNGymUmbe++XaN/xWubAwb8=; b=OJa0o5/yb4TvRhttLw6
 BSMQQu4Nr+YwCDtbP3Y+s2n6JBwkOY6mDqTEFIqlfSWNeR2HuWsRfMCN9Y39EtJV
 JexwI7JAhkBybezhmmaBcokKH0oLq/+1FTlDOPtQz5Hfza889OylqY2q0SmsRzux
 PfYqQMfAoaAJ3Yy/jrkAUbHS3zkNQ0ysZYqy+UkSEzhcwk8o5jp1ITK4gmNatsk6
 C18VtFelcYs8RizGdKezFFeREcGLMKIqnUSJxmvTMOKTyVDaPYJayF+zyMTqMMls
 2ax3svF87GAGGvaOTaO18cSSdjX8LHFiRX/bYsI6PGMu8ChGoRYOzw/DZ3neRfCl
 p7g==
X-ME-Sender: <xms:ykTDYnt6Sm8Wa8qBH28K6_ha4PA6ZjE9irJf-jsunIuVRTBLEwNHAA>
 <xme:ykTDYofEGihL03mIuD6gGPc6V5CfXKggz1cIELt8gwTyuSYgUQYvpjO4tmkCs6jXj
 VTSS5b89p9GnUWiWAg>
X-ME-Received: <xmr:ykTDYqxPy1XYFhB70D2BdSAI7Cm5bDGiMzm1r6NNUR6mezwCUROd7cLOIrgb1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehledgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeetlefgueelfeffffefkeeigffhjeeugfdtgfetieegkedvfeffveeikedv
 leetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:ykTDYmPgmBB-BQZnR10ZpNNxakwdZOJJzcy2ZTHhmT4BJMPzkqzwEg>
 <xmx:ykTDYn9AOFyEiT1fMiK_8Tnb2w0eUQ4knnZ0snbCVRc_K9F2vY9aow>
 <xmx:ykTDYmUs4OUXu-tkGRsrfVr4kUVdy0cGFMnKOz56qW13FMdjW93C2g>
 <xmx:ykTDYinU0hpnM6eajNk3QEPL4Z8tRRcpwVsJj-OCdbJ_3UiiPu5Q-A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Jul 2022 15:51:38 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: clg@kaod.org
Cc: Peter Delevoryas <peter@pjd.dev>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/2] fby35: Connect BMC to slot 0 BIC over I2C
Date: Mon,  4 Jul 2022 12:51:35 -0700
Message-Id: <20220704195135.10348-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704195135.10348-1-peter@pjd.dev>
References: <20220704195135.10348-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: vgHfP0kLxnIm

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/fby35.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 1972948318..88923d88eb 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -15,6 +15,7 @@
 #include "hw/arm/aspeed_soc.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/fby35.h"
+#include "hw/i2c/i2c.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 
 #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
@@ -83,7 +84,6 @@ static void fby35_bmc_init(Fby35State *s)
     memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
 
-    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
     object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
                             &error_abort);
     object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
@@ -129,7 +129,6 @@ static void fby35_bic_init(Fby35State *s)
 
     memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
 
-    object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
     qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
     object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
                              &error_abort);
@@ -167,20 +166,27 @@ void fby35_cl_bic_i2c_init(AspeedSoCState *s)
     for (int i = 0; i < 8; i++) {
         i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
     }
-
-    /*
-     * FIXME: This should actually be the BMC, but both the ME and the BMC
-     * are IPMB endpoints, and the current ME implementation is generic
-     * enough to respond normally to some things.
-     */
-    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
 }
 
 static void fby35_init(MachineState *machine)
 {
     Fby35State *s = FBY35(machine);
+    I2CBus *slot_i2c[4];
+
+    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
+    object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
 
     fby35_bmc_init(s);
+
+    for (int i = 0; i < ARRAY_SIZE(slot_i2c); i++) {
+        slot_i2c[i] = aspeed_i2c_get_bus(&s->bmc.i2c, i);
+    }
+
+    /*
+     * There are 4 server board slots in fby35, and the first 4 I2C buses of the
+     * BMC are routed to each server board's BIC.
+     */
+    aspeed_i2c_set_bus(&s->bic.i2c, 6, slot_i2c[0]);
     fby35_bic_init(s);
 }
 
-- 
2.37.0

