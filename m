Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4177386lft;
        Tue, 5 Jul 2022 12:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIENuOGRIWA1b2U0AJ3vHFrYqpmw8Bh9zHYfSCTgmwtv/KypgMiFzOAGrBVA55Vd4gb87v
X-Received: by 2002:ae9:e402:0:b0:6a7:86a3:752e with SMTP id q2-20020ae9e402000000b006a786a3752emr24580142qkc.300.1657048472527;
        Tue, 05 Jul 2022 12:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657048472; cv=none;
        d=google.com; s=arc-20160816;
        b=FIBQkxwPfCZ71sdJWLCjXjmTugCPQ4mpiIYcYanXXAzTa1hzml+SYX9m50GvscEHT0
         eV0KSsi4F8/Plrrd3Dwa2u7LEE+FXf1Obc5IpuSdJ85D5EIZX89DtMxw7HeW+8ynP/8g
         5E+h+E2cxAYf+VeEb5VcpAk6mroezBItUwSuI6dSDxsTGhXD2E+IfPhRPSxb9MF9FpUb
         u6g8HuXOdc4xcsB4n2+Z+YRaL5wFZh9Nm65EMPgUjYjY5aDx7zwMEBeVZiVrS5RWOnaC
         Cn5SjiF0Dq5Lq/8oCHUXxYFJL/7M9DUooqHmYFXNwlbOYz+lEJTJez5JBiRUz3N1aBNF
         7yUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=SDbWD8l4JEHfDcDBn/AoqsCvTO1am6yDlmfK+59RfvY=;
        b=0TX17KAkVkHHVY4w6LTEHyL3Dln8dXfopMb3HirhK60zuuyVZqmhX23eRrxGdPUG2C
         df9w9DHXcgyJkE2fLe2kLANPxsTsVtjwV3udUGvLa56Lg3S0SnmLsyjJ4nAQHBpxRcRb
         Sb9xZm7VNDYDX2y5iYpIX2gUVpU33HrsEctP/P5V+vw78oKHT10Hz/S7xwuxl3PjWHyR
         JIFvm58Cy5Ey2PtbKRfLAYvocAVP84DBy0geBPDIH1LRY8K4h5ySzCUK6baI4/r4ZPys
         Hr7zQfNcwepeFy+3zpgmG80eBMYR0nuLmVlAkGdlWqJxxPN5Plp56ij4fQ/SZT13AoPG
         7lsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=gRAswKE+;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=I6+xAJfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020ac857cb000000b00304fb73527dsi20113553qta.124.2022.07.05.12.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 12:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=gRAswKE+;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=I6+xAJfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8o0G-000173-1q
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 15:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzv-00016C-26; Tue, 05 Jul 2022 15:14:11 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o8nzt-00015f-2M; Tue, 05 Jul 2022 15:14:10 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5286C580309;
 Tue,  5 Jul 2022 15:14:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 05 Jul 2022 15:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657048448; x=1657052048; bh=SD
 bWD8l4JEHfDcDBn/AoqsCvTO1am6yDlmfK+59RfvY=; b=gRAswKE+ayEqQVeIYJ
 2uV/3tq4h43lAhaFBCfH9H29teLk77b5ZhpyJCXhHrSE+q6K76+6dQ6r8HYe633H
 +pYbqZdYQrFhJIJeOcPNNDZ1y0BoEFwpb43tfPm7+9y8YArtdPAAEgRcBwIrh614
 WFbzZFNe6nHB5IASsMEWfzRsD5vicfApZ1BptuWeXJXcwrzCY+AzwDz+GkTw/0yZ
 UUYDLqz9yZQMBlk5E8bjEFVS4To5Sln1YOySXHET/EOBcBZE9DMH8b/JVdCtywb6
 FkqS6g7imKqWrvnK5J7/Jdq7wC+yviETgzNZxjL5epX24/LUO4XXIr/433x0oymW
 seKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1657048448; x=1657052048; bh=SDb
 WD8l4JEHfDcDBn/AoqsCvTO1am6yDlmfK+59RfvY=; b=I6+xAJfUx6a93vDz241
 NyN6YaR3CUkUprFiNXsUSSr6uqLGadyuawCF8EMoR5iGrrUYy/bcaRUCJirILs15
 geIQxKotOy95iNkskmQs8zu8z8XMryS0e3iLmGcGWxEmYeBOu8/hbMECnB8vEm7M
 P3b+SwdSJtpYg3u9ix92mgXzn15fnO9PGCb38utGjudtZQlbGO+5PxZrjVVpYYtm
 gy1r2qfloloQx+lZUmCeoVKNb/GIhyGTqRAkyssNUvIxrRHtm3a8wNOJ54E6wUi8
 mmS6j6tFrpVa6DsN0JTEZVyFFWq0MpPOc6I6ypQ4AnETZ24LWKmjV0UbR6P+2rze
 l1A==
X-ME-Sender: <xms:f43EYliWe8yvsEjZ6ORoejnnTa-5I1jcUUX_yNkw55of5MPNm7m0Ew>
 <xme:f43EYqAvyErMeiWW30oAMr7l7cvB8GjLgGgSy0w037rFyGVqkuyoZBvYNMvNlfPcC
 tGwyScHcfe11TOJeV4>
X-ME-Received: <xmr:f43EYlFf5lDYXUOesMt4fG8R1Ay2YWJq1xILs5bmNBeiZIwl7mNknBQcaHwDXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpeetlefgueelfeffffefkeeigffhjeeugfdtgfetieegkedvfeffveeike
 dvleetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:f43EYqTHSM2XoH9i4wfdfcPu2kZtzBIwM4Ug2DQTFuiabQuDU-cwKw>
 <xmx:f43EYiwdzkqAWDTsE4g-PedVVp3yXdZFqxYHmw7syAFSkDYOpZmY5g>
 <xmx:f43EYg6QbpVYXeSpIIBBY4CEsgv3aiZJdhT8KlVbDcHCzUXhB6yaKw>
 <xmx:gI3EYprnmvJ9_wRkBJyjk30YqMgdV0SZc3vrZLJWqzyXEoXO0XK1nQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 15:14:07 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] aspeed: Create SRAM name from first CPU index
Date: Tue,  5 Jul 2022 12:13:53 -0700
Message-Id: <20220705191400.41632-3-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705191400.41632-1-peter@pjd.dev>
References: <20220705191400.41632-1-peter@pjd.dev>
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
X-TUID: w2WNrYmXIJMd

To support multiple SoC's running simultaneously, we need a unique name for
each RAM region. DRAM is created by the machine, but SRAM is created by the
SoC, since in hardware it is part of the SoC's internals.

We need a way to uniquely identify each SRAM region though, for VM
migration. Since each of the SoC's CPU's has an index which identifies it
uniquely from other CPU's in the machine, we can use the index of any of the
CPU's in the SoC to uniquely identify differentiate the SRAM name from other
SoC SRAM's. In this change, I just elected to use the index of the first CPU
in each SoC.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 5 ++++-
 hw/arm/aspeed_ast2600.c | 5 +++--
 hw/arm/aspeed_soc.c     | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 33ef331771..677699e54c 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     DeviceState *armv7m;
     Error *err = NULL;
     int i;
+    g_autofree char *sram_name = NULL;
 
     if (!clock_has_source(s->sysclk)) {
         error_setg(errp, "sysclk clock must be wired up by the board code");
@@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
 
     /* Internal SRAM */
-    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d",
+                                CPU(s->armv7m.cpu)->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3f0611ac11..64eb5a7b26 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
     qemu_irq irq;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0f675e7fcd..0bb6a2f092 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
+    g_autofree char *sram_name = NULL;
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.37.0

