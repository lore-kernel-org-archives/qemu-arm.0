Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1153531lfa;
        Mon, 12 Oct 2020 08:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoHa+CD/VdCbIFaH009JFZvgIjbMO1TW2v0kZlJqF+Ad4kJuHORn4qIFtGmczz05ALh47f
X-Received: by 2002:a25:b84c:: with SMTP id b12mr3037838ybm.16.1602517349226;
        Mon, 12 Oct 2020 08:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517349; cv=none;
        d=google.com; s=arc-20160816;
        b=yK9j7L670UjC+JQgzhTbN370yFBr4PIjBl0SDCxfCeVMvYx1xql4qhd53unlei4xAm
         RSqQxdSn6KJoZg1qGKGijCM+hk6+geHDBPUowhjDHJM7rkbPDO9wbMx9lOV2gFkrPvcC
         dNZOV2/JwtghJIVqyKu7QWwwLcfC5uTmRT7ubts2t9W0KQ2wLwCkdFUkCFJ3Dk+cayeb
         ehvaxPwFNeVIkAmLtCux1ck6m0M/JWAEEpOcyLgMCLv8o7aGAriE+XUgHFfhWFUdLnNM
         BFWv5Sw4NvgB8QFK1mjTaHN7TsjQxQLJiGPBnb0TV7Bk4JMvYeVp7OzKJ01YkaIrWAj4
         RxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Rr+JVKyDamSf0xBTUVSv5bImqBYLa2yDIIfkheqLG6Y=;
        b=vmp3RZVCTnFmNtcrzOj1qt91yYmQHBoR/RJ9g/TjXLo1tlpxTkWRZdrKipuYEs0u90
         X/Cp+nESBycrCXEyQO6xKy+eOj/+tNi1h+lYy/e3iwfhriubWgknRc7nSYZHX5aTiIh1
         ZPHPBx09ClNV4JWVDxn4ykPK9inoWAsdhSorP2k1zw/KbdgpriSBVsWQPD4zwEOA11cv
         cV4SmtmLTiwyeAT1sQlBXjUe6Q1EYwLFRdKPIsZEgDgjC2bUbF32YySnEU5NH2B8T8h+
         pmbdXTQ1CoOI05P4P6iVADK/KWrqPibGJMx9g6YJGEPodd6OTl8zhfA3VYGmLC58kTYQ
         4Lpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSdGchXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si17567122ybc.102.2020.10.12.08.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSdGchXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzy0-0007oH-J7
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqH-0006tM-OT
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:29 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqC-0007Ha-NG
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:29 -0400
Received: by mail-wr1-x441.google.com with SMTP id y12so14319875wrp.6
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rr+JVKyDamSf0xBTUVSv5bImqBYLa2yDIIfkheqLG6Y=;
 b=NSdGchXobLRvobB1cyetRRAvSm9hlhgg/38eE/ovGE8IFh5XCOQ9xlqpkKyEoa7omY
 zQsoAjBTSRQqpwyqI+awAvrbM1OFAiOzg6cG2KkCBGvLMbJWeIQ9bsHpoldfWUgSpve5
 6WY3s9keximJhZ2tWZO0fxygF64LdXfzFy8iRdjKslyBChTU+RtbWJ35GH4KoJ6P6kAy
 9vtE9Jn1wnky3wzp3o7SOl0MptJNsFI4CdkGAguuDv/tsXIVLwQSEhO46ej5ZMtLKa/l
 24VC5Hy1O3vkGnt+ZAlnTmCU2gIbBAnA74TeLtxPSra76N7wh5pUtIlTdhoUTXE9ixAW
 lW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rr+JVKyDamSf0xBTUVSv5bImqBYLa2yDIIfkheqLG6Y=;
 b=SwT/nrFRlt71BUOG9bbzDqT1qciGvzBBqzbUNDlDvW0K/9WtkEApff/tIbR1kfzChY
 hzbLL8QOpNHySFOJAAiD0EOporvSUqEPHqIV6Tdpy7rVb4LAgUlrD35YinvWIeZmDY1m
 Dx3vTR3RXV6FUFQ8hs/OBbF2hfwj5ZCHTv61MqUDfDpAH73/oQAUoMvTpc57DHLS1Wni
 k6BfS1xjQwqWsIJMLCCXpv4rNeqwzey7GN55LyX8bSLDVV+I8x5yfZvYIoAjTidtKxPz
 dY+ELTz14EBVOCHQzcxBh3LZSYrB8HcKlRlmOhtYl72sFJfSFhdcM6WZHHnGnjkCe3f0
 kQgw==
X-Gm-Message-State: AOAM532W2JitS7t9r2/8aUPa+0Dy26fGI86LHzBISMrye+yZOFaID4gM
 P+XmUvTv4Q5wul3iD4K6CfdYxrLTqtP/kpEP
X-Received: by 2002:a5d:5482:: with SMTP id h2mr21046891wrv.165.1602516863094; 
 Mon, 12 Oct 2020 08:34:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/mps2: New board model mps2-386
Date: Mon, 12 Oct 2020 16:33:34 +0100
Message-Id: <20201012153408.9747-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htZcPShVakoi

Implement a model of the MPS2 with the AN386 firmware. This is
essentially identical to the AN385 firmware, but it has a
Cortex-M4 rather than a Cortex-M3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

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

