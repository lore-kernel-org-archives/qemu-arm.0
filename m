Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1435724lft;
        Fri, 1 Jul 2022 11:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+3IE0xjWbEknininKMHeUAq5APLtsg8E1rNxHheN0Dd4iOKqw+hHN4j+VWnnQpLJIXPB6
X-Received: by 2002:a25:4bc1:0:b0:66c:92b4:5956 with SMTP id y184-20020a254bc1000000b0066c92b45956mr17536818yba.155.1656698925906;
        Fri, 01 Jul 2022 11:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656698925; cv=none;
        d=google.com; s=arc-20160816;
        b=sw2bYFZfKavrxwVzib+iVTD9Jw3VhiLMtUM/wCtvGWZphnKjGFylj4dMEi76aBGrtr
         s6r1a6pZWN7p9+6hCjqaB9zZagpwUxxMghk4S8YmqMQnRYozG/qSuG4Zl5YtDYQpzuF1
         ZP0DofYEW8y2tjMqRFOVJQoA8A2R0yBxORVGRSIRkuiSgbpAZ/ZlsfX0xbfmlnsQBGyu
         Ykd9Bvl/rYt8CGNUKtZp/bjT5PnncOtEq6KtcipGxkGLiKpFp1yCa3QHFjIKxUAvS0WF
         X7VIz5FnlvGKYB74+k5az+0yN2y5ECSFJ/4OOeoeq6Wb5ADPXU3qCw1dlmaTHkb+c1va
         ooDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=W5ZNl4wM2dIehxwaUPeYDoPy0jrJNrZAEdcPlIiMOYo=;
        b=Mra7LMfCjiMXf4/BbVzpuhy5iMpN/71MFujaUcaeYuWbPdvdJKPUbdS0qhwekupQ0W
         7zY1J/kSkIBQP6uLEczJ28jIJIM8Q7wKtUcSNi7ST7JIL3LkpAZMVPljJyUtW0spjnkg
         5uScoLWY9TaDjYTDyRrv7wkvFA1nOd8Mqe8VUosLWvuoV44RTzUVSNCeJgAvq09DdT3o
         ir7sNA4Pwama9P3JSZKCrH4shWuoT4y8y4T2yMEtdWIfoAzdSDKg9y4tVmJMACB5T6hE
         PrQq+TRfTikwjK9FDyoyNkdyMtuOBwjBogEJffoNq0Pslr4yjM9Jy+Xfs29266XVzMw9
         Ui0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=vy4axsYP;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=OaJVlzmd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a056902120100b0066db717c6c0si9331559ybu.666.2022.07.01.11.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 11:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=vy4axsYP;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=OaJVlzmd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7L4P-00066m-6w
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 14:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o7L20-00053B-EU; Fri, 01 Jul 2022 14:06:16 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o7L1u-0008KK-Uw; Fri, 01 Jul 2022 14:06:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 68FE12B058F6;
 Fri,  1 Jul 2022 14:06:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 01 Jul 2022 14:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656698766; x=1656702366; bh=W5ZNl4wM2dIehxwaUPeYDoPy0
 jrJNrZAEdcPlIiMOYo=; b=vy4axsYPc8Xb69yYwMRCSnvMtGR5f8wCXgguqZJIS
 FeDlzFHcKO5UveYp9S3AN+kyCPQhhDCMuMlAzBRTA3UFgDLtGJoCC4BqwqrPI+As
 TUxU3p9tEwYiRXztOWHtmDgR0JZs4s1/Ow20isZGpBCjeP3HJoQxeO0TvoxoPjAH
 bWJ4//sNykCnhBv4vdsqpGRPMQN1vo2ykwY6P6S9GfNsc+ThZ3/OVHKLUJH4Gli0
 ryf7vm+OC5GG1zKrAWfVxqT+WptidZtWF24x3G5Pf28s2Z7Wg2UsYpBz7vqwyROs
 HX0nnoPEADhbm+DPF7m23BwgCYAHcau7zeynZlGv9KA5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656698766; x=1656702366; bh=W5ZNl4wM2dIehxwaUPeYDoPy0jrJNrZA
 EdcPlIiMOYo=; b=OaJVlzmdW2ERJZuF1ffUvjHqu+4RP2t3NmhEGRgbu7xv0Mbd
 tAgCzEmN9+ampkkpfcsLrg4mjAmxpPCHoez/t8EYlzDO2uNpGcQGPXYQovTceEgP
 0M+uR8atVxdiY/fZYeMOuhIiflX2J2Cy5H7a3rvKH2Bw66kOj+dTIAZIHSaHrMBJ
 2iv5qwoYq5NODYgquEDaOuM6Y+eVj9NsOCtgopGPIqKfGh4tKD+EjL/jJBpJNhzH
 GHPxJZ/JZ4m7+gClGHLk25agSiX/qWUtxnayBoe16y3KEm+tyngyCQrX+fbvrI+L
 bSGI+HZdeCugh4OEZXwuZcerWK/MapIdOLOK9g==
X-ME-Sender: <xms:jje_Yon_y0jKvXiAfNl9XLlYtUVS9PCzcttJ8cb0qzs3_iGk-dLnng>
 <xme:jje_Yn3_su7UzV3lwna_iM9fpLCIdaF-tlvkMpZQQ0tNUOaSH_gefwtaZzxiQsyVU
 s0L798Sb838PU_huIM>
X-ME-Received: <xmr:jje_YmpuXVjOl92aE8ufkNoGTNa_BWUxAjWrq4VFuV6gp1nVVRT4lSvDBTJp0Y5n83wsQcNVpARDD2PaqG_uHNw6v4w8QENK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvg
 hrnhephefgleehveejffefheefhfefveehvedvieetgeefleffveeljedtvdfgfeehleej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvse
 hpjhgurdguvghv
X-ME-Proxy: <xmx:jje_YkmrlotCM_cHOiKnulQQQ2Wlu0PA5mGTgSYWXQqDcIyzH3zl6g>
 <xmx:jje_Ym1Imj5M6XFT9o3LCpIGMwDAiO3xn1jl4mrz-_vcIU3Tz6yThg>
 <xmx:jje_YrtgJRCBctJI-n1DnPp0jjXxZRpe5DlQ16on-LZt_8Vj86ousQ>
 <xmx:jje_YpSxygKqSOmB82fueU009M3F6KlNh4AY96ne1lJ4IV9WgaQ8HhsyXLk>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 14:06:05 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] aspeed: Create SRAM name from first CPU index
Date: Fri,  1 Jul 2022 11:06:03 -0700
Message-Id: <20220701180603.38408-1-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qfZsjgzqInnP

To support multiple SoC's running simultaneously, we need a unique name for
each RAM region. DRAM is created by the machine, but SRAM is created by the
SoC, since in hardware it is part of the SoC's internals.

We need a way to uniquely identify each SRAM region though, for VM
migration. Since each of the SoC's CPU's has an index which identifies it
uniquely from other CPU's in the machine, we can use the index of any of the
CPU's in the SoC to uniquely identify differentiate the SRAM name from other
SoC SRAM's. In this change, I just elected to use the index of the first CPU
in each SoC.

Signed-off-by: Peter Delevoryas <me@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 5 ++++-
 hw/arm/aspeed_ast2600.c | 5 +++--
 hw/arm/aspeed_soc.c     | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 33ef331771..b6b6f0d053 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     DeviceState *armv7m;
     Error *err = NULL;
     int i;
+    char name[64];
 
     if (!clock_has_source(s->sysclk)) {
         error_setg(errp, "sysclk clock must be wired up by the board code");
@@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
 
     /* Internal SRAM */
-    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
+    snprintf(name, sizeof(name), "aspeed.sram.%d",
+             CPU(s->armv7m.cpu)->cpu_index);
+    memory_region_init_ram(&s->sram, NULL, name, sc->sram_size, &err);
     if (err != NULL) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 3f0611ac11..7efb9f888a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
     qemu_irq irq;
+    char name[64];
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0f675e7fcd..1ddba33d2a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
+    char name[64];
 
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
@@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
-                           sc->sram_size, &err);
+    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.37.0

