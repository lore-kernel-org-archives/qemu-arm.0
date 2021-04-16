Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp536334lfr;
        Fri, 16 Apr 2021 09:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOjnOVbLJKLZSmAW56HbVOVUSt8wVYtiom5xpjnE7Oj87OiKf6Hnz+O5+h8HvpIudH8wQz
X-Received: by 2002:a92:cd8a:: with SMTP id r10mr7764117ilb.282.1618590293302;
        Fri, 16 Apr 2021 09:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618590293; cv=none;
        d=google.com; s=arc-20160816;
        b=l2tlipU3ztP05eqOGYobC/VA0n4snoBT9c6mh15yo1rKm6t/w0j4TUBzCvy9NoeeJm
         CdRsTugudpFAvg3DYkRmEPzovNndmb7O4JCaEZNIbzKoc1LRZ44scGeiszmVz/mfqo4B
         EUxUVMiN+2+jQvIdRReV2j+5yJYx4OxreZHeNS8Jr9tInlbMNA1EcY1Wqpgp4VTyddkw
         Jp2ITn98vsXD8PvYtVCxd5HsB8Bn9HYlcWVsC81Vu+EzjyHpj3tpvQm77lQ6EXMdHoOr
         nyvKbx+nCm1AXtgr79CETzYE2drH7rUP4W50B0nTKBj1h6YrbkSOwcg3xvWU5S18XJYA
         WFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=G5qTrKtWflOMOAHzpRZ3MGKi+kEZJpERJ2RBhE2G/zY=;
        b=r9X5fVyx046+D69D4l1H8ZeRl3lSmSscJYoyqR5NucWj+n9jgU/ZBFDumyvc2z2CEn
         x115l5L5b5CsxvmNmfpjBL9Wl+4dUVm0XZQjwm0mARPni+Fp4SqPMxlDdWDO70GKuT3u
         COQJ3ELi6mB/PeGGR/8cY2idLqv1NyPPKMVD+Yjz02D5kSYHizFchevEjE155uaarUoS
         1xfQYWM+yIJAHz1x5ACtjt7pKWaewVCBodH4YpqVR/rBHyYAlFIRa5WORfcGSIET1VQ6
         ulqkZs7+9Hxa9ks9YzzMee6E2BHc06QWOsfZKT7AKgDOIKB5VUxe+R6SpI231RGpxQZf
         Sgww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YXo0IROM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si6781402ilg.18.2021.04.16.09.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 09:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YXo0IROM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXRH2-0006zx-Gf
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 12:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Qrp5YAcKCKccLUabYLNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1lXRGr-0006yY-9r
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 12:24:41 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:41036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Qrp5YAcKCKccLUabYLNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1lXRGn-0007rq-6b
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 12:24:40 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id p75so6734037ybc.8
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=G5qTrKtWflOMOAHzpRZ3MGKi+kEZJpERJ2RBhE2G/zY=;
 b=YXo0IROMRBoAQ18/O86PVaGAZueeOEALr/AvRltdYYJWvZjjG7z4/2sYDlkqafWsxK
 +KxnhgJtJH7P5h5wN4j8N7Z7BI8A340Hsh5ek3hhsVppSpvwKnmk8M79PqxIAMwgcZB2
 8HOiG6WrcNod+Q2rzhd50Hz937KWhVPAAP0c1PEJ/gPioCqPXHvU0efdwDxC7rmH6jo8
 LjlZGgwJ/HbPtNED8K5O3sMkyyuPFZ126hbTbNVprBqrNC64vmnjh06tihmJnM2HkXv3
 SkOBts7QO9ZVpWO9GEJTAbAROA1LB6uSATff+r+cbOzJ5nMSVJwzveRxd8O3/IgUMoOj
 P/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=G5qTrKtWflOMOAHzpRZ3MGKi+kEZJpERJ2RBhE2G/zY=;
 b=EA1wDufXh40iMfarzwfuO9cDLmkyfeK0NEtUSxOgCyOlU6WnFelUqzCJvewL/tMEyj
 mnZZFuMpj5BiooqyfyvnfLr4+RgGwtudbm6udOyjrZumMtZO/nUOXD1ZDSEhDbk0hPwQ
 NARTmppQ3pt3y6+Vj+XNIy5993BqdF4yYSAAlEi8/eqpgR6d7fuVXth1PQ2WOc060yTE
 he/hr/abv7SIwS0xSFSwROWvfgkoWs2L78BPobUrzUsK111SUTakWDc8K0coHtYOVWHE
 160he/mSHpIIjpWRkl00iFwBC0N13NNWAtdTw/a9p7QGQtI5612BZ2wzT7Gj0/Eo5Ace
 CBiA==
X-Gm-Message-State: AOAM531cUshHTvN3W1c5pHkO0ma3yyaK/vBrcjLM9ADYuxj5OunjhWSE
 cb0XOlrIj/U4PTMoBveANvwtSDW/zbtO
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:87b7:e98a:2eda:186])
 (user=venture job=sendgmr) by 2002:a25:cf08:: with SMTP id
 f8mr12960591ybg.88.1618590274476; Fri, 16 Apr 2021 09:24:34 -0700 (PDT)
Date: Fri, 16 Apr 2021 09:24:25 -0700
Message-Id: <20210416162426.3217033-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [PATCH] aspeed: Add support for the quanta-q7l1-bmc board
From: Patrick Venture <venture@google.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3Qrp5YAcKCKccLUabYLNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dWGK9+HMTbot

The Quanta-Q71l BMC board is a board supported by OpenBMC.

Tested: Booted quanta-q71l firmware.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/aspeed.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a17b75f494..4611996d21 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -138,6 +138,19 @@ struct AspeedMachineState {
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
+/* Quanta-Q71l hardware value */
+#define QUANTA_Q71L_BMC_HW_STRAP1 (                                     \
+        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_128MB) |               \
+        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2/* DDR3 with CL=6, CWL=5 */) | \
+        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 \
+        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_24M_IN) |       \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_PASS_THROUGH) |          \
+        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1) | \
+        SCU_HW_STRAP_SPI_WIDTH |                                        \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_8M_DRAM) |                        \
+        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
+
 /* AST2600 evb hardware value */
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
@@ -433,6 +446,34 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
     object_property_set_int(OBJECT(dev), "temperature3", 110000, &error_abort);
 }
 
+static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /*
+     * The quanta-q71l platform expects tmp75s which are compatible with
+     * tmp105s.
+     */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4c);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4e);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4f);
+
+    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */
+    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
+    /* TODO: Add Memory Riser i2c mux and eeproms. */
+
+    /* TODO: i2c-2: pca9546@74 */
+    /* TODO: i2c-2: pca9548@77 */
+    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
+    /* TODO: i2c-7: Add pca9546@70 */
+    /*        - i2c@0: pmbus@59 */
+    /*        - i2c@1: pmbus@58 */
+    /*        - i2c@2: pmbus@58 */
+    /*        - i2c@3: pmbus@59 */
+    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
+    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
+}
+
 static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -728,6 +769,23 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Quanta-Q71l BMC (ARM926EJ-S)";
+    amc->soc_name  = "ast2400-a1";
+    amc->hw_strap1 = QUANTA_Q71L_BMC_HW_STRAP1;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 1;
+    amc->i2c_init  = quanta_q71l_bmc_i2c_init;
+    mc->default_ram_size       = 128 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
                                                         void *data)
 {
@@ -927,6 +985,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_g220a_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("quanta-q71l-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_quanta_q71l_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.31.1.368.gbe11c130af-goog

