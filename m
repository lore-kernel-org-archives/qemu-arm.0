Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296959ejc;
        Thu, 19 Jan 2023 04:37:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtd4MpYp8mYGCGqnVfJ6LwpnNzzDtwGCL5rI8Soa06A6pBy5NcMB5wY7eKQHXsyG/PExbHT
X-Received: by 2002:a05:622a:4015:b0:3b0:7755:ab80 with SMTP id cf21-20020a05622a401500b003b07755ab80mr17645901qtb.67.1674131834140;
        Thu, 19 Jan 2023 04:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131834; cv=none;
        d=google.com; s=arc-20160816;
        b=UrlwY/nor1Lw3LTEyLyOaeWeudFJP9IiwXMgAXdJIDXETAQPuA72qxGy8M+CNapYot
         wCkJdaKlEyi53ixhqzGXrcIyFzyRgbzgNJyjikCHKjxANo7tMQok7IKDmUfRewA1wPA2
         gZD5DagLiPRtzoQN4DRN40dESYbpL515zP+i1UQPC26Y2RNWqz56frMLCAK8qcO9GmLB
         NZ1JkuWDwXe+ni9hTxau320v5IFSmLP66agZF1YB81xez5DzysXRBWCMs0hhApX8u2nB
         V0Vwk3+nmDtJaon76qgK8JWoSwq2deEhde0ufMxKQc9g3hc2F0N1zDdzXfpg2JonniMF
         yvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=rx2QUstwYPiKmWpu03Q5SwvMoUsiykdSCCNff94Mnxg=;
        b=WDn0W6eYxn/vVkdXJmCKJAzuWtHw10KESri8tSjjxnEXzdmj6jv8FSTbmBgWPuKMH/
         Fo1BwxFcZdcGzbBrHc9BO8IfSwiI+6dD6HSPx37xbTaue7ZIBqvviZkhrDQWwvyevvqp
         8sEQwgpR0fq79LBWgWVXfYmT1TvHT48z0mRS24MHpKeED03e9M5fpEvUscNQ77LKs4Jf
         qh60ztmY0gwTNNn1YrFsUCABTo3GQwyee+fplmA/Hlm5BnOLwMfn8YQy0H9Pcyacek/E
         ERzcHK3Mol+Ga/BzzUfENiec7dScCeWs1nMqJhju7yzXLIGvo/u5kBpBRdVuQtonPkqb
         py7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020ac86747000000b003a6905f8495si21495107qtp.32.2023.01.19.04.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU9M-0007aR-UG; Thu, 19 Jan 2023 07:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9G-0007PT-NG; Thu, 19 Jan 2023 07:36:07 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9E-0007fS-BB; Thu, 19 Jan 2023 07:36:06 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYb1Y7Qz4xyV;
 Thu, 19 Jan 2023 23:36:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYY1HPGz4xyK;
 Thu, 19 Jan 2023 23:36:00 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 22/25] hw/arm/aspeed_ast10x0: Map the secure SRAM
Date: Thu, 19 Jan 2023 13:34:46 +0100
Message-Id: <20230119123449.531826-23-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ImRUP/yn4xQo

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Some SRAM appears to be used by the Secure Boot unit and
crypto accelerators. Name it 'secure sram'.

Note, the SRAM base address was already present but unused
(the 'SBC' index is used for the MMIO peripheral).

Interestingly using CFLAGS=-Winitializer-overrides reports:

  ../hw/arm/aspeed_ast10x0.c:32:30: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    [ASPEED_DEV_SBC]       = 0x7E6F2000,
                             ^~~~~~~~~~
  ../hw/arm/aspeed_ast10x0.c:24:30: note: previous initialization is here
    [ASPEED_DEV_SBC]       = 0x79000000,
                             ^~~~~~~~~~
This fixes with Zephyr:

  uart:~$ rsa test
  rsa test vector[0]:
  [00:00:26.156,000] <err> os: ***** BUS FAULT *****
  [00:00:26.157,000] <err> os:   Precise data bus error
  [00:00:26.157,000] <err> os:   BFAR Address: 0x79000000
  [00:00:26.158,000] <err> os: r0/a1:  0x79000000  r1/a2:  0x00000000  r2/a3:  0x00001800
  [00:00:26.158,000] <err> os: r3/a4:  0x79001800 r12/ip:  0x00000800 r14/lr:  0x0001098d
  [00:00:26.158,000] <err> os:  xpsr:  0x81000000
  [00:00:26.158,000] <err> os: Faulting instruction address (r15/pc): 0x0001e1bc
  [00:00:26.158,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
  [00:00:26.158,000] <err> os: Current thread: 0x38248 (shell_uart)
  [00:00:26.165,000] <err> os: Halting system

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
[ clg: Fixed size of Secure Boot Controller Memory ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast10x0.c     | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9a5e3c0bac..bd1e03e78a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -71,6 +71,7 @@ struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
     AspeedSBCState sbc;
+    MemoryRegion secsram;
     UnimplementedDeviceState sbc_unimplemented;
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
@@ -105,6 +106,7 @@ struct AspeedSoCClass {
     const char *cpu_type;
     uint32_t silicon_rev;
     uint64_t sram_size;
+    uint64_t secsram_size;
     int spis_num;
     int ehcis_num;
     int wdts_num;
@@ -143,6 +145,7 @@ enum {
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
     ASPEED_DEV_SBC,
+    ASPEED_DEV_SECSRAM,
     ASPEED_DEV_EMMC_BC,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 1a06269cb1..592a19d988 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -21,7 +21,7 @@
 
 static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_SRAM]      = 0x00000000,
-    [ASPEED_DEV_SBC]       = 0x79000000,
+    [ASPEED_DEV_SECSRAM]   = 0x79000000,
     [ASPEED_DEV_IOMEM]     = 0x7E600000,
     [ASPEED_DEV_PWM]       = 0x7E610000,
     [ASPEED_DEV_FMC]       = 0x7E620000,
@@ -221,6 +221,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM],
                                 &s->sram);
+    memory_region_init_ram(&s->secsram, OBJECT(s), "sec.sram",
+                           sc->secsram_size, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SECSRAM],
+                                &s->secsram);
 
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
@@ -400,6 +408,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 0xc0000;
+    sc->secsram_size = 0x40000; /* 256 * KiB */
     sc->spis_num = 2;
     sc->ehcis_num = 0;
     sc->wdts_num = 4;
-- 
2.39.0

