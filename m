Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp848359lfc;
        Thu, 3 Sep 2020 13:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/EWZ4DzRlUgPAH0edgN5c4ElDrj6ql9INMKWKLDKUq2DBNG4alVfp99mHqg8NtMgdGj98
X-Received: by 2002:a25:c7cd:: with SMTP id w196mr4841957ybe.351.1599164488866;
        Thu, 03 Sep 2020 13:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599164488; cv=none;
        d=google.com; s=arc-20160816;
        b=bD0XV3W0nV2ljNhgS8fVUA810e6fEH3CjgLJNu/7N/8RZ/OahTDkf9IQRQvUmvBOVi
         waqbJjce/mKixF2qMYCBBftWxqo6xud74Uy5F6c/0latDSV6tow4JnSmNBxuDmXdRVBF
         lKjtwQkwUAoMtyDlayh1f+Dv5I45Vp1U0lO9aDT49B8eWXq+haGxp4FjV3lnqmm9KHSB
         FDQDIa7CbVhOGAPYiOZ3+kVx30aRpkHGdZDSuJR2NJSUGUD1B0uosj4+NV+zoiweKnfN
         AaxmF0YrKJazgvpWmGqYsWK0pVyCh5qdiwKBL5m1wHjSfohC9i8cA4HzGfJy2ZGWZGI1
         SLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hOtqBYNVN0odFdezyYG5pn2QHUjOmA1+K/WZY0tpkq0=;
        b=ccfFiv8OSRnlDTkXwO5sjagCaDk2L81sKe8x8lL++WdjyNuwMRm1cHnEFVQH8yXAkV
         KwThO0hrXvouAos+wOsuZ6GZNGfSo8ZDhYjAibYBCWFRyL9hKy74XOqEHeGuuuwyxPov
         1RrYsC7DNl78ktTndBS5B569nnA6/dhsV0ejRNr+eghTKclSvlwhDrrxx15SbUyEEEi4
         1T5y137Mx88qkPbt+UsQaNcwTPop6x94dPLbYf4TMsEUqHoxSTR4f3p5FZeLMFTJkwC6
         hdTGDQXKFX6Yy0Ke9+cN268LeZAwq7D3Bd5pHgGCoo1cL3v2DHqUJ5NZAPkdmFjwC+jA
         BRgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TpfXSgm2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p198si3580627yba.131.2020.09.03.13.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 13:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TpfXSgm2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDvjc-0006Be-5i
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 16:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvj6-0006AN-3S
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 16:20:56 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvj4-00084p-8T
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 16:20:55 -0400
Received: by mail-wm1-x342.google.com with SMTP id z9so4126293wmk.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 13:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOtqBYNVN0odFdezyYG5pn2QHUjOmA1+K/WZY0tpkq0=;
 b=TpfXSgm2WUu6IzjPY75GkWOL2vzKGMJmWRX43OVD7HGwwccWmAYhVPQl061kqcaWYP
 jglUYwgrFbxrY7nyEK+0rdysMQZJQFwTmD0AA/h0Idq3WJl3btgcrOmSh2aQsF0m73ok
 32PUKsP1QE5Uh6fyPIC1YxO+oQJOA3ppyLBVGyj1R9wAgBc2c7xkb/BQcO1Jqf9oJce5
 GzJYSqkn+0u8OuWLpJMhJLKzT9DFj5+vcCj0ngEcvRIYZkHu6uiOaMtOTFFgzQFbbEP9
 3RRER364g1wzWs3ZiuA+2oqobPVxmPYrAOwDaKxHM2cm2NJNcthE3lMPR6GqaSQN085d
 aTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOtqBYNVN0odFdezyYG5pn2QHUjOmA1+K/WZY0tpkq0=;
 b=BJrLvFbXnKqJEwH0dzfQIUtbir87zaGehuaYo8HDEQssh6RI8yullTjJiIgK4lgQ1K
 tlnY1ehpB8IKncSCDDk7t0f3jlOQzKRRdQZIQJzlXL0214d4dx1zxq0Rfs7kpPkoWQ7j
 IIwqm9mtrXfRKc7WYZZoCHOmys1c3YL1XiNQznDqL2HyqvaX4PlpRco1k6mp+EES6mWX
 gWgt3GaAosW5ML6mGTZiEiJvpSOfqtPBOKEWvGj9BkSLgxYJXw/sqHDN5nz5s2aCJK9q
 +HVANbr71K/Mmm9/a8MfYQSbppdOQsWVGP29Bw96NNuLTceN+yb4/R/ak3n87ZS8PxZq
 zjQQ==
X-Gm-Message-State: AOAM5319FXUOw0PuR+ubdaaxP3hDAuhv4HUZ891B2IxLuYuNcVq5lKjR
 ukQlzF4A+GHpvj+6gs3vuUjnRD3OZZCMAF0P
X-Received: by 2002:a1c:408a:: with SMTP id n132mr3977627wma.45.1599164452304; 
 Thu, 03 Sep 2020 13:20:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm7285023wrg.96.2020.09.03.13.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:20:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/arm/mps2: New board model mps2-an386
Date: Thu,  3 Sep 2020 21:20:46 +0100
Message-Id: <20200903202048.15370-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903202048.15370-1-peter.maydell@linaro.org>
References: <20200903202048.15370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwTLdwiGrZdL

Implement a model of the MPS2 with the AN386 firmware. This is
essentially identical to the AN385 firmware, but it has a
Cortex-M4 rather than a Cortex-M3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
The docs update is new since v1, but I've kept the Reviewed-bys
as there is no code change.
---
 docs/system/arm/mps2.rst |  8 +++++---
 hw/arm/mps2.c            | 30 +++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 3a98cb59b0d..e680a4ceb71 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,5 +1,5 @@
-Arm MPS2 boards (``mps2-an385``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``)
-================================================================================
+Arm MPS2 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``)
+================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
@@ -12,6 +12,8 @@ QEMU models the following FPGA images:
 
 ``mps2-an385``
   Cortex-M3 as documented in ARM Application Note AN385
+``mps2-an386``
+  Cortex-M4 as documented in ARM Application Note AN386
 ``mps2-an511``
   Cortex-M3 'DesignStart' as documented in AN511
 ``mps2-an505``
@@ -21,7 +23,7 @@ QEMU models the following FPGA images:
 
 Differences between QEMU and real hardware:
 
-- AN385 remapping of low 16K of memory to either ZBT SSRAM1 or to
+- AN385/AN386 remapping of low 16K of memory to either ZBT SSRAM1 or to
   block RAM is unimplemented (QEMU always maps this to ZBT SSRAM1, as
   if zbt_boot_ctrl is always zero)
 - QEMU provides a LAN9118 ethernet rather than LAN9220; the only guest
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 9f12934ca8f..559b297e788 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -15,6 +15,7 @@
  * as seen by the guest depend significantly on the FPGA image.
  * We model the following FPGA images:
  *  "mps2-an385" -- Cortex-M3 as documented in ARM Application Note AN385
+ *  "mps2-an386" -- Cortex-M4 as documented in ARM Application Note AN386
  *  "mps2-an511" -- Cortex-M3 'DesignStart' as documented in AN511
  *
  * Links to the TRM for the board itself and to the various Application
@@ -47,6 +48,7 @@
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
+    FPGA_AN386,
     FPGA_AN511,
 } MPS2FPGAType;
 
@@ -79,6 +81,7 @@ typedef struct {
 
 #define TYPE_MPS2_MACHINE "mps2"
 #define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
+#define TYPE_MPS2_AN386_MACHINE MACHINE_TYPE_NAME("mps2-an386")
 #define TYPE_MPS2_AN511_MACHINE MACHINE_TYPE_NAME("mps2-an511")
 
 #define MPS2_MACHINE(obj)                                       \
@@ -142,7 +145,7 @@ static void mps2_common_init(MachineState *machine)
      *
      * Common to both boards:
      *  0x21000000..0x21ffffff : PSRAM (16MB)
-     * AN385 only:
+     * AN385/AN386 only:
      *  0x00000000 .. 0x003fffff : ZBT SSRAM1
      *  0x00400000 .. 0x007fffff : mirror of ZBT SSRAM1
      *  0x20000000 .. 0x203fffff : ZBT SSRAM 2&3
@@ -157,7 +160,7 @@ static void mps2_common_init(MachineState *machine)
      *  0x20000000 .. 0x2001ffff : SRAM
      *  0x20400000 .. 0x207fffff : ZBT SSRAM 2&3
      *
-     * The AN385 has a feature where the lowest 16K can be mapped
+     * The AN385/AN386 has a feature where the lowest 16K can be mapped
      * either to the bottom of the ZBT SSRAM1 or to the block RAM.
      * This is of no use for QEMU so we don't implement it (as if
      * zbt_boot_ctrl is always zero).
@@ -166,6 +169,7 @@ static void mps2_common_init(MachineState *machine)
 
     switch (mmc->fpga_type) {
     case FPGA_AN385:
+    case FPGA_AN386:
         make_ram(&mms->ssram1, "mps.ssram1", 0x0, 0x400000);
         make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", &mms->ssram1, 0x400000);
         make_ram(&mms->ssram23, "mps.ssram23", 0x20000000, 0x400000);
@@ -193,6 +197,7 @@ static void mps2_common_init(MachineState *machine)
     armv7m = DEVICE(&mms->armv7m);
     switch (mmc->fpga_type) {
     case FPGA_AN385:
+    case FPGA_AN386:
         qdev_prop_set_uint32(armv7m, "num-irq", 32);
         break;
     case FPGA_AN511:
@@ -229,6 +234,7 @@ static void mps2_common_init(MachineState *machine)
 
     switch (mmc->fpga_type) {
     case FPGA_AN385:
+    case FPGA_AN386:
     {
         /* The overflow IRQs for UARTs 0, 1 and 2 are ORed together.
          * Overflow for UARTs 4 and 5 doesn't trigger any interrupt.
@@ -380,7 +386,7 @@ static void mps2_common_init(MachineState *machine)
      */
     lan9118_init(&nd_table[0], 0x40200000,
                  qdev_get_gpio_in(armv7m,
-                                  mmc->fpga_type == FPGA_AN385 ? 13 : 47));
+                                  mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
@@ -409,6 +415,17 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
     mmc->scc_id = 0x41043850;
 }
 
+static void mps2_an386_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS2 with AN386 FPGA image for Cortex-M4";
+    mmc->fpga_type = FPGA_AN386;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mmc->scc_id = 0x41043860;
+}
+
 static void mps2_an511_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -435,6 +452,12 @@ static const TypeInfo mps2_an385_info = {
     .class_init = mps2_an385_class_init,
 };
 
+static const TypeInfo mps2_an386_info = {
+    .name = TYPE_MPS2_AN386_MACHINE,
+    .parent = TYPE_MPS2_MACHINE,
+    .class_init = mps2_an386_class_init,
+};
+
 static const TypeInfo mps2_an511_info = {
     .name = TYPE_MPS2_AN511_MACHINE,
     .parent = TYPE_MPS2_MACHINE,
@@ -445,6 +468,7 @@ static void mps2_machine_init(void)
 {
     type_register_static(&mps2_info);
     type_register_static(&mps2_an385_info);
+    type_register_static(&mps2_an386_info);
     type_register_static(&mps2_an511_info);
 }
 
-- 
2.20.1

