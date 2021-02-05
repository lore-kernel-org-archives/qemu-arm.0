Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2223391lfo;
        Fri, 5 Feb 2021 09:59:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzV7v8AX9Ak6U69fqBjm6sMyam7hdN9X7sVe+DB8pNTxHmUNnXU4pT3N6vhnvAqMC230LB
X-Received: by 2002:a25:9902:: with SMTP id z2mr7565790ybn.339.1612547965875;
        Fri, 05 Feb 2021 09:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547965; cv=none;
        d=google.com; s=arc-20160816;
        b=n+YmZgs45ucHyMBuuXmJERIDWGiog30hTYJB6iMP+ElFEYDnDORZJMMn3snYs+Lo89
         g9Flk83h31feeWRwOdq9JDdZ3zPbOV8eoR+tItScXREEMRJ6aCh0Ha564uccmtiM76Q4
         7T/9bll48rK5d5M4Gi5AvsNMu11Klu5RIO3515Lb08jHfiZSgOgHlBd4aAz8ZHt9tdZk
         sP9ioRspAE8ELKv9Lx5sTRfGElCOYxSV565I/+Y2OmasczZOmrfaeEjcvOGLiq+72Nv6
         V21v4MyNAN7g99tfVmdP1lg8MMRIb9S1Qpaj8XLEIIMavW4mqOxhLgstTJOe23is30Gf
         syOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FHr6FuqE0B2b9d2HJA4DI+zb7En8n9XfTjpsu+vmnps=;
        b=CzbeJMdh8/7Yy4543c89eNSIuTjrL4PnsAO4NHKsVZ5eUEljKeXbD83bSulYOCfLjq
         EndwWM3mT9WQ59c27YQCeQ+CCOxs8/0HAZ6jlWRSB/5y2TvVnpoXZpgmU2pkjhB0Uw6a
         CVHuHiT1yKGL0T0dIr2nO9R2YvWOC9Lo1kj2cQjMj0nEPSYF3hWlyTnq0Sh0iTnY2Xjo
         7IUnaLYjAPeZ/gh//499iVnEBIbghj7qZptPkN00Omv5eogfGSS9biPMmRko1M3Jox4S
         7AydjcS66qWfmku47zm4Usu3BUhkpZSvIyH+oNgWWAI+nf9UlGX6d09x5mrb3K/NSkc0
         ncQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwtlGJvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si10634227ybp.221.2021.02.05.09.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwtlGJvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85O8-0006SO-6O
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TS-0006i9-2l
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:54 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T7-00041Z-3F
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:48 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so6563683wmi.4
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 09:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FHr6FuqE0B2b9d2HJA4DI+zb7En8n9XfTjpsu+vmnps=;
 b=VwtlGJvqc9vzrrtxKLU+wWrLnXTjlDfg0aroLhg4kM1G3UF0A8Z4NgDMZ9mYx/1fBg
 RCj8pWT1J6SogJaBttzVilfetr05xULGMdAfbCenKz8G92aSaQmaPViZhO2ZxtpT+tUp
 l9YcYGvE7uKWs27P4csHIGkWs3vCdfXY52/ZNd17YGHY69p/gb4ASNOHtmanPAMACbb+
 ytBqkBAbse4qGtcxToac1I0l4SbIqjw9gomjNWbwVWkObH34A6L1piRGLYeoZGr43P/w
 TScjOuZ75Xnetq9YJxCBX/n3OX9qXHfTNH8jswv7EsBN1zte7D0bVWcGz3uXFe67ahbs
 kkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHr6FuqE0B2b9d2HJA4DI+zb7En8n9XfTjpsu+vmnps=;
 b=e7bq233dZehQ1YTyPps1qJ6VP+E+svPuftLcx81JhEI1ArQMufrbQDcVHRNetPCw1b
 XU2hBZTXN91tYUBiwMoiPyQ4Vm4tOkwqZH4N+m3/7TUsYD6iQrWTM45nCMq8tGKUC3Nx
 h7ijeY5IZsZOvUG5mjwzOQ2CHseX9UP37p0/3RmLL5NAzL2S7f1sP1/cM4pO+BSvWFOx
 7LwB3HMhI0a9zFQ21NkFydTAZr1bMHSRCpUvxypbLNC6gpdwyb9Zx17Gyq2xMkdiTZ3V
 TSkfOY6ftSl95GhY/rTlYf81szy56hvXXqPMBAw4k225SKg3OpOj/UfxocaeFXOkdeBk
 s5Cg==
X-Gm-Message-State: AOAM530hKARJRPUl63A7SGFj7k0Dx/h1/3efeow5UJV5/em6iQqJn39z
 rhgWjRk4KHAChyrdhyiTeu0N//evelsvFA==
X-Received: by 2002:a05:600c:3504:: with SMTP id
 h4mr4444267wmq.168.1612544425124; 
 Fri, 05 Feb 2021 09:00:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/24] hw/arm/mps2-tz: Make the OSCCLK settings be
 configurable per-board
Date: Fri,  5 Feb 2021 16:59:59 +0000
Message-Id: <20210205170019.25319-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: oJQjh4AGfbPT

The AN505 and AN511 happen to share the same OSCCLK values, but the
AN524 will have a different set (and more of them), so split the
settings out to be per-board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 976f5f5c682..9add1453cc2 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -77,6 +77,8 @@ struct MPS2TZMachineClass {
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
     uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
+    uint32_t len_oscclk;
+    const uint32_t *oscclk;
     const char *armsse_type;
 };
 
@@ -115,6 +117,12 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 /* Slow 32Khz S32KCLK frequency in Hz */
 #define S32KCLK_FRQ (32 * 1000)
 
+static const uint32_t an505_oscclk[] = {
+    40000000,
+    24580000,
+    25000000,
+};
+
 /* Create an alias of an entire original MemoryRegion @orig
  * located at @base in the memory map.
  */
@@ -213,17 +221,18 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     MPS2SCC *scc = opaque;
     DeviceState *sccdev;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+    int i;
 
     object_initialize_child(OBJECT(mms), "scc", scc, TYPE_MPS2_SCC);
     sccdev = DEVICE(scc);
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
-    /* This will need to be per-FPGA image eventually */
-    qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
-    qdev_prop_set_uint32(sccdev, "oscclk[0]", 40000000);
-    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24580000);
-    qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
+    qdev_prop_set_uint32(sccdev, "len-oscclk", mmc->len_oscclk);
+    for (i = 0; i < mmc->len_oscclk; i++) {
+        g_autofree char *propname = g_strdup_printf("oscclk[%d]", i);
+        qdev_prop_set_uint32(sccdev, propname, mmc->oscclk[i]);
+    }
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
 }
@@ -676,6 +685,8 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->oscclk = an505_oscclk;
+    mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -692,6 +703,8 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045210;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
+    mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1

