Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3630467lfq;
        Mon, 28 Sep 2020 06:17:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/3iE2u8hWxzRI9tBI4KXbKkll/83R2x0yYImVig8EsX1ymDOHTgrHJEtRIdwykCmTKjT6
X-Received: by 2002:a25:d6c4:: with SMTP id n187mr1925607ybg.191.1601299032022;
        Mon, 28 Sep 2020 06:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601299032; cv=none;
        d=google.com; s=arc-20160816;
        b=1GejHWJwkNpObvvGmGeG+li54zvaVs5aHhBMCICU6V3m57WW5Jl2PMFh1WtMdnnliJ
         xO9TcB/KxqjeWKl1D6zbRk676emhw4tPpQUIRL+hnVZFLgEEs39lK70U4m/AI/EWJd8y
         9Q5pxm7Tox7Du5OMGO7V08zu3cs81RHMPfMjoe3Q4B6Lgimj8XMNVXoB0Wc2zoRn04ps
         BYEuD3dyQb0ZwAmXgIv92PUWOHdHW9KFq7Sw9AW/CD0TFwcziUMaeU0vbiXXrukYLxD4
         pXvn/ygfrQULO23ZWcySB58U+cUn+JaVPohZiZJWh5lnQDnOZmmptUy/MfIL6MDmjPCc
         YSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Y/kSum0EA/plO9SVgJExaxOoOw0fBp1exDKCZt+0Evg=;
        b=Qlh4xl8jrTxp12CugLrF1Fb6A2paelUBIub325TWovAkb5B1kySXzjAQnJ7pgIuZ0R
         i37Dvjxfh/FWv/4D7dexEy2sHPpD23cgOV6pugUfaWz5NxgpAWqHZM4YMwYPllx3FwB2
         8d7saL834DF5r27V2r8qZ4X5GMM55prqHPsHO2Fmd5dc4Qp953xeKdasszIvwAn9UJlV
         JBrj/hKexKzL6WHr3z0BReEEqTrqZIRrshR6ICHyQK/NUSoDUguPcgqaquR40utmX0+H
         Y1vvp/Z5G8lNnR1SLZTInx8MLpzZD9MQ/2Xm4rPGLvi17Y5+DYoCwxSUOwrE0UDMkwHo
         AARw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=MqbPYRpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si753027ybo.268.2020.09.28.06.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 06:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=MqbPYRpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMt1j-0004zF-Cj
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 09:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kMpRG-00070b-7R
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:27:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kMpR8-0003qi-HU
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:27:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id mm21so300522pjb.4
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y/kSum0EA/plO9SVgJExaxOoOw0fBp1exDKCZt+0Evg=;
 b=MqbPYRpnKL/tgriF3GXia0hOVS5T5gfE1dnK21eg8v7quEuSKsJrgVTna+1eilRyBy
 Yeg9uULxEq5pd01U0Tcpjh6aed9/PlFtRoJknf2PwrFvJhtwe/qDs31/lFC5Ug4ACmAi
 de5k7S8bVdlgS8hGWLCd4wRbwTJFQkRPstViXlpQm3tK1jJ6Z+Tg+1gFG1zEcQcI2oYj
 eBZANm2Ha2+tywrPJnKILu8gGRRjtkl0SuNcB21wSxeWJt5qcqSTiD23KMoXrCc6FZ7S
 C8o0aiuWSG2iRMzcsDd0fjvvtWMWs1G3iT0xAAxYvhX5sBP7kqZsdUfBJkn4+kgO3Xac
 PNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y/kSum0EA/plO9SVgJExaxOoOw0fBp1exDKCZt+0Evg=;
 b=AxKxbPF7Sxj7JV8c3/r5Zhe25SAbK2UOLYAYQhB7sl903ZVXuHxJ7rsAHgrJfQRkzQ
 ioXOAECifxSm67In7SOxvgle43jR+0QS74gmq1zPM/Lq2kPR9hW53Ou1wyl/cwZs6R7i
 P8xUQzqhFqMU/A7PYmAi+mxuzOSy8PapGMs+s39YRhaBdtLPgXzCq+9fQsidI9w2x2TH
 hWrWwxdlZUXMqb4OOxucy5zBy2C/+GjSSVmvYdFfEqthRDrsDNDgVUnClgojRkeZKkVZ
 jIJUHh53Ko/zyr5oEDQacxzMok0gklmBNrt2wydBe597Adhn7cLWJpcB+yFBlkLe4Rb/
 voeg==
X-Gm-Message-State: AOAM530zW/VxmR4mFY5yiQLkHhqku65ZYMNflScJB/qV5SvB+biRTyGW
 i7Uv5WjjEr6BalUz3kpkslMDEw==
X-Received: by 2002:a17:90a:b00e:: with SMTP id
 x14mr515547pjq.212.1601285228491; 
 Mon, 28 Sep 2020 02:27:08 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id e10sm719178pgb.45.2020.09.28.02.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:27:08 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: yulei.sh@bytedance.com,
	xuxiaohan@bytedance.com
Subject: [PATCH v2] aspeed: Add support for the g220a-bmc board
Date: Mon, 28 Sep 2020 17:27:05 +0800
Message-Id: <20200928092705.3730-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Sep 2020 09:12:06 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D6/9SBLvc0yS

G220A is a 2 socket x86 motherboard supported by OpenBMC.
Strapping configuration was obtained from hardware.

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
---
v2:
  - Add macs_mask
---
 hw/arm/aspeed.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bdb981d2f8..1dcb72b315 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -120,6 +120,20 @@ struct AspeedMachineState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+#define G220A_BMC_HW_STRAP1 (                                      \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_2ND_BOOT_WDT |                                     \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM) |                       \
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
@@ -798,6 +812,24 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Bytedance G220A BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = G220A_BMC_HW_STRAP1;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->i2c_init  = NULL;
+    mc->default_ram_size = 1024 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -835,6 +867,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_tacoma_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("g220a-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_g220a_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.25.1

