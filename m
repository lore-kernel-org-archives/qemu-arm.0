Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp452676lfk;
        Tue, 8 Feb 2022 15:38:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXiEAoa5qo3IzUeb+z1WkJeA0c+1LHKXvk0rvzcd2msPhBnAGZK2mQZ8nf3p00nsANF0sk
X-Received: by 2002:a81:387:: with SMTP id 129mr7243525ywd.252.1644363499530;
        Tue, 08 Feb 2022 15:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644363499; cv=none;
        d=google.com; s=arc-20160816;
        b=Fx1GBPpcw+0vBgfIEnuZAWeqNt9Qqxyg+llL/mh7fRqgcj990C48jrZynfoanAtsTA
         7+fdQ2sX+OsV4gngAXeDx+Jvd93JV2b4TCK1witZNaRqeNzYG4AVkmnaB8TUJaIk3+Hv
         C/AiHoo7YRB/VHfcJh799nmf4p2j6Sxj4LZB58gIv28klw7EJu8gWcabA1CD+7idquun
         C8q5jB34Xh73L31Ifgpi3328NhZU4DsVSC1Vl69AZxZNwiLJdyJwpJCxDN/LTNWmsjkI
         TDzQlgy2aIBiaxSvqp/nbgE1OfWBBka9nGSiV9fpB4fNuU+oJpqR8HKRkq0Ee3l1ZoBG
         pptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=rK/X0bkQ4s37Ql0JYzqatnON1TQgvTtbmnB4wZFOFxU=;
        b=yVGKa5rdg88zhn7/dAALIedz/+J5dIW/vjxlLdYQfg/HvVfcD+PiMKy7bK5J3sDj0f
         odHRkxOWEF400NIq5XQXGu4+XAHhtQJHitCGdbwdWUugM0o46PB4DJ4d/g7jInqbQsgv
         zP0G43muVAUd74ujqqXmCISAXzJWMK0dP1WgBG5B/wU7TO2iwJO3a/U8ukfj0nSw/wsm
         yTdM7JF/YrOqfVfs9m0n8GUJfoBXhuxobxk+Us/K1cGXZ30Hd5TGZeAOZT3RLTWsqkyV
         7iqZh8QZPD1sVrgpt1DTarpYzONxK45bf0Mb/sMwVGZJP5OXQ8ISp5AfOxjm98/x1vd0
         8iBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Zv/6xB4F";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si8002153ybg.456.2022.02.08.15.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 15:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Zv/6xB4F";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHa3u-0001fO-R2
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 18:38:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PP0CYgcKClkM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com>)
 id 1nHa3a-0001f6-0d
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:37:58 -0500
Received: from [2607:f8b0:4864:20::949] (port=51182
 helo=mail-ua1-x949.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PP0CYgcKClkM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com>)
 id 1nHa3X-00086e-RI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:37:57 -0500
Received: by mail-ua1-x949.google.com with SMTP id
 z38-20020ab04929000000b0030ef21ee1eeso322090uac.17
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=rK/X0bkQ4s37Ql0JYzqatnON1TQgvTtbmnB4wZFOFxU=;
 b=Zv/6xB4F4yX075B1Kcmj8dj0JPG1WGiYb/s7O1CU0Tk3QovhsdEXI5sIw+5gplClx0
 8745uWkQ8RqdMxBJjz2uma9h3bh/iHwLBA4qJZkbeNmNKHiAWTgFN0RPTGHrz9hpYGy5
 pVdr61ToZbPLH6mhuC7rP81fHvhOlltcrO6h3q2lz9athtu+X7igPoYzhD/ZvYrBYFky
 r9NI0tK8h/X7Kp1ZyEW9sOKDE4gWdcUsUKRm4oLXb78O7bfwNxfd4xcauIGs696ngQAZ
 o3w/ozuoVaawQjoJIxJXcHqfQdk9A6f8412M5OcZqHm25PxoZJdAshNAok7a6Im+tosc
 DglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=rK/X0bkQ4s37Ql0JYzqatnON1TQgvTtbmnB4wZFOFxU=;
 b=bZ2wv6c+PjmMXMB8qfBYXkhXm9/N6kjnk+qG0h7vtc4ojJbYjo03By7LW4Xqw8b9LW
 shRBo4QBX8yBywQdOc9kxuBpZBHU95SqlfOJOTEk7+O6FZx3kb3QeohfLDCQI5JGrvGm
 6eKSGQwAwYabKJ77mJNTSOS3GfI6MXQCEDoBH/IljJjt+GogLKPaoEYSW4x1PKq2CKxj
 KoSJJQIpTY6CQY0+aPVbCznLEaiywa6ggKU2t5jIQ7AHxkQ+KFkN2dFH6Lg0YdC621/v
 VVMPvSEWlrFxNEI4jvyv9o29syK+dTGf8+N7QqJQOzolFsHg9woWkOmxTejs8I3Ad/rT
 0T5g==
X-Gm-Message-State: AOAM533geVz15RIBzwbWaJBbHIjHRmCIwefuGgwJS+URTrsa9uhhcJ8I
 k4g3Jkjo2hDoYRjboPHtuAClYZWBceES
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:d062:ceeb:6333:edcf])
 (user=venture job=sendgmr) by 2002:a5b:84a:: with SMTP id
 v10mr7315301ybq.718.1644363068894; 
 Tue, 08 Feb 2022 15:31:08 -0800 (PST)
Date: Tue,  8 Feb 2022 15:31:04 -0800
Message-Id: <20220208233104.284425-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH] hw/arm: add initial mori-bmc board
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Chris Rauer <crauer@google.com>,
 Ilkyun Choi <ikchoi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::949
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3PP0CYgcKClkM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com;
 helo=mail-ua1-x949.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: xzRftl1w4JgY

This is the BMC attached to the OpenBMC Mori board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Ilkyun Choi <ikchoi@google.com>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx_boards.c     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index adf497e679..ef2792076a 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -21,6 +21,7 @@ Hyperscale applications. The following machines are based on this chip :
 - ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
 - ``kudo-bmc``          Fii USA Kudo server BMC
+- ``mori-bmc``          Fii USA Mori server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d701e5cc55..0678a56156 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -34,6 +34,7 @@
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
 #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
 #define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
+#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -429,6 +430,21 @@ static void kudo_bmc_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void mori_bmc_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, MORI_BMC_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 3, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -501,6 +517,18 @@ static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
 };
 
+static void mori_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Mori BMC (Cortex-A9)";
+    mc->init = mori_bmc_init;
+    mc->default_ram_size = 1 * GiB;
+}
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -525,6 +553,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("kudo-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = kudo_bmc_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("mori-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = mori_bmc_machine_class_init,
     },
 };
 
-- 
2.35.0.263.gb82422642f-goog

