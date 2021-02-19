Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9094490lfc;
        Fri, 19 Feb 2021 07:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE+dH2trU2upIw2+fpIy44mYAUpd3sf2oWTCbQpUhzDINrMN4U83iQcKN136n3jru2gcVq
X-Received: by 2002:a05:6902:100a:: with SMTP id w10mr13425186ybt.474.1613747398914;
        Fri, 19 Feb 2021 07:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747398; cv=none;
        d=google.com; s=arc-20160816;
        b=vmLTN3MZ9+aO0S0HzS7j712g7BKaEna027Z5DoJhdNXfXTOobEs59orxs3qOO3I4d3
         TaWvJ3mxiCZYJWfp5fVY+Q0AHWEzml05Ez3GyWnmfztT9R9HpDtT3CE1n+Ki3qDugvY8
         lgOa+ezlhq9u609BUm78ePE3nM276xj0uQDPKe4jNHRy7BaTccqD/xUOurp/Ejo8FofZ
         UziIvNBYzFWGjXTZdGpUBS/RO71efXMwpVlBZXj01mEiii7yMNLtIeWkgaKKtNSxe3FJ
         7TmYLlp2tMMDptLmGYuVTHt49zx8F3TSV9PU+xa7loGNCLKRUL0DBvj78xjNba+eFzMo
         978A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y0IkltMwkMmsntCXmla7YgVCExbHqoOzjdETdOI28dg=;
        b=lzfGNuJoMzZUXWKlENXNhOpLwCi95kIJFxNhNSSe9wECKA2xuCPaXMmjB2qRGpEfC4
         udQr8z9dTMu3W84mjKNQ0Qg0IPiWSGhcyP2+dmf6oX4tKqWA7TyYyw9i70Q6rRtSfzeS
         pfsBa7hAY7iKDkwY3g4TlKWRg+vXDz0gpogq+likGvipKzZjEBldhRNwFTVKOss+TqqP
         KxuTv7UEGsgdt4XpPwy3QIgLfQ5VE4VM1FBUL29akyNJO1TmwTkACJDiZBNn21PYExv/
         PBYfKEcOVnrTPdNlJlh4w56Ho0rKzWqFLQNmbrssrdfTK/JkC8dSR+k5v0HYWpniW38l
         fY6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wseSwm5R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si8937941ybo.226.2021.02.19.07.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wseSwm5R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Pq-0006Hk-6M
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73s-0002lA-E1
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73P-0003dc-JS
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id b3so8887078wrj.5
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y0IkltMwkMmsntCXmla7YgVCExbHqoOzjdETdOI28dg=;
 b=wseSwm5R1EC+ycCHupY24rZDlUnOWnFgK8okczW+Z6g+zgVYmKYu1l2KWd+MK1Lh90
 R9QZTwMAe7pRkQCqCfSPW5TPQV6Q4WqH0oVz3m6z1LaNWvJHqOYENoxCjBP6ZoKpbg5C
 LvCk3ygzlyUDG7ZwnIQcaLbwo3uYkAH6B/pcL4RGlgePf+RLU5few3NPaNLf9Ai3g6Cg
 q8QSCG9+Jzaxv3zbXFFvMASuh0iOjodPFiZbp9qiyF3ZKwXqS/nryvwDmkrIhPCHCfG1
 9jv7K8z55xgOrmrPmldERFhkAXsu2Sc5suiRaAiN8o8W7L+46zSoQ7kkarMVRvSX2zSL
 uImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0IkltMwkMmsntCXmla7YgVCExbHqoOzjdETdOI28dg=;
 b=HAA3hBOPCOeUAhaGqk4bO5mFDVpDEzStwz7Wm4q/GWcY9bTDRCGtS7aCD3kuQtW7tO
 dxywtwRzjXjMvtDNNjUOp5G1sWxL0DCHAw9NMDZYb+KUDyroV/Gpd/5War0Wyjp0xJvR
 e4V4xnwC49O9/ZI0CjHYfWIh0AaezoWnnLFNWaz86W1H8rW328loQs8YTxysKD0SrxLn
 AUPHDgGPhnvUML/diGyN28HZ1avC4nzPhooMBnGhWDwLO6ZFoXIF0nIaCjV7sVOs/Bp5
 mIDN0qr1c3To4kvPMjQ8/kISwSGpODrb3n4Tfkl6T9JHdwdC+rg97i+qgXo/aqpw3kQ9
 yNsA==
X-Gm-Message-State: AOAM530H1IEFpCzlisjMvmrgIT49CFUqhJ/pS64xv03WAq1sj5//iWC3
 cihmTdjGtrQLCiioqU8uoUDGrRYqMYkVUg==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr9486027wry.398.1613746006201; 
 Fri, 19 Feb 2021 06:46:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/44] hw/arm/armsse: Add SSE-300 support
Date: Fri, 19 Feb 2021 14:46:08 +0000
Message-Id: <20210219144617.4782-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hQbvKgw6QOte

Now we have sufficiently parameterised the code, we can add SSE-300
support by adding a new entry to the armsse_variants[] array.

Note that the main watchdog (unlike the s32k watchdog) in the SSE-300
is a different device from the CMSDK watchdog; we don't have a model
of it so we leave it as a TYPE_UNIMPLEMENTED_DEVICE stub.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |   1 +
 hw/arm/armsse.c         | 152 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 21d239c381c..36592be62c5 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -123,6 +123,7 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
  */
 #define TYPE_IOTKIT "iotkit"
 #define TYPE_SSE200 "sse-200"
+#define TYPE_SSE300 "sse-300"
 
 /* We have an IRQ splitter and an OR gate input for each external PPC
  * and the 2 internal PPCs
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2366c49376d..e5aeb9e485f 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -337,6 +337,128 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
     }
 };
 
+static const ARMSSEDeviceInfo sse300_devices[] = {
+    {
+        .name = "timer0",
+        .type = TYPE_SSE_TIMER,
+        .index = 0,
+        .addr = 0x48000000,
+        .ppc = 0,
+        .ppc_port = 0,
+        .irq = 3,
+    },
+    {
+        .name = "timer1",
+        .type = TYPE_SSE_TIMER,
+        .index = 1,
+        .addr = 0x48001000,
+        .ppc = 0,
+        .ppc_port = 1,
+        .irq = 4,
+    },
+    {
+        .name = "timer2",
+        .type = TYPE_SSE_TIMER,
+        .index = 2,
+        .addr = 0x48002000,
+        .ppc = 0,
+        .ppc_port = 2,
+        .irq = 5,
+    },
+    {
+        .name = "timer3",
+        .type = TYPE_SSE_TIMER,
+        .index = 3,
+        .addr = 0x48003000,
+        .ppc = 0,
+        .ppc_port = 5,
+        .irq = 27,
+    },
+    {
+        .name = "s32ktimer",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 0,
+        .addr = 0x4802f000,
+        .ppc = 1,
+        .ppc_port = 0,
+        .irq = 2,
+        .slowclk = true,
+    },
+    {
+        .name = "s32kwatchdog",
+        .type = TYPE_CMSDK_APB_WATCHDOG,
+        .index = 0,
+        .addr = 0x4802e000,
+        .ppc = NO_PPC,
+        .irq = NMI_0,
+        .slowclk = true,
+    },
+    {
+        .name = "watchdog",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 0,
+        .addr = 0x48040000,
+        .size = 0x2000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "armsse-sysinfo",
+        .type = TYPE_IOTKIT_SYSINFO,
+        .index = 0,
+        .addr = 0x48020000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "armsse-sysctl",
+        .type = TYPE_IOTKIT_SYSCTL,
+        .index = 0,
+        .addr = 0x58021000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "SYS_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 1,
+        .addr = 0x58022000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "CPU0CORE_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 2,
+        .addr = 0x50023000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "MGMT_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 3,
+        .addr = 0x50028000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "DEBUG_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 4,
+        .addr = 0x50029000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = NULL,
+    }
+};
+
 /* Is internal IRQ n shared between CPUs in a multi-core SSE ? */
 static const bool sse200_irq_is_common[32] = {
     [0 ... 5] = true,
@@ -352,6 +474,18 @@ static const bool sse200_irq_is_common[32] = {
     /* 30, 31: reserved */
 };
 
+static const bool sse300_irq_is_common[32] = {
+    [0 ... 5] = true,
+    /* 6, 7: per-CPU MHU interrupts */
+    [8 ... 12] = true,
+    /* 13: reserved */
+    [14 ... 16] = true,
+    /* 17-25: reserved */
+    [26 ... 27] = true,
+    /* 28, 29: per-CPU CTI interrupts */
+    /* 30, 31: reserved */
+};
+
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
@@ -389,6 +523,24 @@ static const ARMSSEInfo armsse_variants[] = {
         .devinfo = sse200_devices,
         .irq_is_common = sse200_irq_is_common,
     },
+    {
+        .name = TYPE_SSE300,
+        .sse_version = ARMSSE_SSE300,
+        .sram_banks = 2,
+        .num_cpus = 1,
+        .sys_version = 0x7e00043b,
+        .iidr = 0x74a0043b,
+        .cpuwait_rst = 0,
+        .has_mhus = false,
+        .has_cachectrl = false,
+        .has_cpusecctrl = true,
+        .has_cpuid = true,
+        .has_cpu_pwrctrl = true,
+        .has_sse_counter = true,
+        .props = armsse_properties,
+        .devinfo = sse300_devices,
+        .irq_is_common = sse300_irq_is_common,
+    },
 };
 
 static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
-- 
2.20.1

