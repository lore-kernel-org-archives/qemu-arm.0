Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1463655ejb;
        Fri, 3 Feb 2023 06:58:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9e1dFTaxx5j/MSyGO8ruhukoGQEOHsksX2GHdh6HNgyCGVFtA92kvHkbFwLOCFrNnNBmI8
X-Received: by 2002:a05:622a:489:b0:3b9:b60d:d7a9 with SMTP id p9-20020a05622a048900b003b9b60dd7a9mr8249367qtx.10.1675436291280;
        Fri, 03 Feb 2023 06:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436291; cv=none;
        d=google.com; s=arc-20160816;
        b=DqSNO9e2Le28512bQpz1v8VIe5r6sOWK+x7pTaWXy8q1w6mV/dBQ9mAqC2GHDMOoz6
         s7nzwqyJi4UnfWTOZZTtADuJj9cVruzKfkKzfRNCxsNfYu5JbR8TRW0L6y4FdP9aJX50
         8+J55xGS8aB/HZNnqc571R0Qi59/mOjkZguF3Oyj0Ogq5Lfu9818G8T54Byrvt9ItbyO
         FFtUA6cVOrFVG59dhlCU4XoqYVm1JG+mPsPq4Tesd+/kY5gQMCIWSFepgIjvEeQlinrr
         i6bQlfnemw/dlhGtmFPA32uKk8FQ+qvfeL1a3OzW6590oGFGuWNvaOLD//tblHFmaS2P
         xKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EJd5TtZ9CjeRkTkoWKdyn/Q2ehPN6hId4MKx9NKONbE=;
        b=ffxylz6NTV5mpx6+Bg/xotVd8LyteIjBm9uJMg+LzVgoc2CJnp3LOSeXjofnUTVFRT
         Dhamkufr8vrQhcrdn+YBl/94aWb5Mw5qXIpdPcIWTg3kAuxy2VXNlQyAxbZ525YbVZ5p
         z/TAp2E10k7hUzyYc2M8rdX+Mv0bhPSS+8NJOV0YlwLMZXQH2kxThUWYbBVxQ6Y0BHyJ
         qd58pRJXjlZkJrl8dMDhK5QLeMC9+OagY+7zFGRtkdRuUEgubTpm0IOU9QlOqKeBGxFP
         egVCaY1qiKT+/GoDQeyBUwPK/PrtYA2PbDxixPjttYnhgJqTvWXEV8SZQKQPKew2LYUa
         H64Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQBhaAZo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ac85fcd000000b003b6472c386asi1974052qta.39.2023.02.03.06.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQBhaAZo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNxUl-0004C3-5p; Fri, 03 Feb 2023 09:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUj-00045q-QL
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUh-00066U-OV
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 09:56:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n13so4060643wmr.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 06:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJd5TtZ9CjeRkTkoWKdyn/Q2ehPN6hId4MKx9NKONbE=;
 b=iQBhaAZoehQdMMYmFx3NhanpaFj5eVp2VwvNaim3lBwb8+vEq/n+tL/75AIkmYIo3T
 wvvSJt2N0KQtcCNSmvQDQyH/NJMF1S0gkx/iKpnaiYeHiqTHcp+kx70ySjYv/u67sqhC
 j8aRZKVSzIZF7R6bT+At7AdyFdUUwbOObtrnZ/GNk4PoBZuAZ85G98LzCT+4jKJ6GWJc
 7hEOVUeJrJwyTDlTrzlIsoKtiOsZFSvIgMqASnsHTxS9nERlUi9NkfZ5vf1bfbu6WEMB
 MlbhIXKY49/BzjRnCqGQTq10TWcx4UomliBb6O6w/rAQlq1uEmhDm2wj/StL+EtoBBsk
 mxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJd5TtZ9CjeRkTkoWKdyn/Q2ehPN6hId4MKx9NKONbE=;
 b=BuMafsssCj3ZA7Jog3ZllxOfzC+tm7Qk39LYcaFjN1GOXa29f9KcWParHQmx63NfZT
 1N4nQFfBaqkiXMDNwzTf1CfMHf3xwyc9lWsKOCQ6vl/i4tOPHTM9kF5f/O1ZVU4GI7LZ
 DsVPK/ZAChQPIjWL7GTRMTP7bR+vXOKkaKxnaweyMcowZmnYmqoDZW4V9DnL63HR6qb1
 cSYNTVgClPu2L7pKjuRQA/VCZ9bW3RTv5MKDQILhE2qTtuuPkrcrUX05xjWXe+2gxWSW
 YabpyzCjJ1NwVwJf3f6XBQ7G1mYqdA8D4sWZW9d5RDMOQBEE272bOjiSHtsqX2ZYb4wE
 BtmQ==
X-Gm-Message-State: AO0yUKXoU1DHIyFhijpl04Y1jFn7YhYQOmAPs7dtLDtBDkrrtBy1dzSh
 bmUjuuj2kGa1wtJ3IzWHuIHwwUW+OT1ttDyT
X-Received: by 2002:a05:600c:3d98:b0:3df:50eb:7cd9 with SMTP id
 bi24-20020a05600c3d9800b003df50eb7cd9mr8290403wmb.14.1675436210520; 
 Fri, 03 Feb 2023 06:56:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a7bcb85000000b003de8a1b06c0sm8138324wmi.7.2023.02.03.06.56.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 14/15] hw/mips: Declare all length properties as unsigned
Date: Fri,  3 Feb 2023 15:55:35 +0100
Message-Id: <20230203145536.17585-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ymGw+g72EL9w

Some length properties are signed, other unsigned:

  hw/mips/cps.c:183:    DEFINE_PROP_UINT32("num-vp", MIPSCPSState, num_vp, 1),
  hw/mips/cps.c:184:    DEFINE_PROP_UINT32("num-irq", MIPSCPSState, num_irq, 256),
  hw/misc/mips_cmgcr.c:215:    DEFINE_PROP_INT32("num-vp", MIPSGCRState, num_vps, 1),
  hw/misc/mips_cpc.c:167:    DEFINE_PROP_UINT32("num-vp", MIPSCPCState, num_vp, 0x1),
  hw/misc/mips_itu.c:552:    DEFINE_PROP_INT32("num-fifo", MIPSITUState, num_fifo,
  hw/misc/mips_itu.c:554:    DEFINE_PROP_INT32("num-semaphores", MIPSITUState,

Since negative values are not used (the minimum is '0'),
unify by declaring all properties as unsigned.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/mips_gic.c           |  4 ++--
 hw/mips/boston.c             |  2 +-
 hw/mips/cps.c                | 12 ++++++------
 hw/mips/malta.c              |  2 +-
 hw/misc/mips_cmgcr.c         |  2 +-
 hw/misc/mips_itu.c           |  4 ++--
 include/hw/intc/mips_gic.h   |  4 ++--
 include/hw/misc/mips_cmgcr.h |  2 +-
 include/hw/misc/mips_itu.h   |  4 ++--
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
index bda4549925..4bdc3b1bd1 100644
--- a/hw/intc/mips_gic.c
+++ b/hw/intc/mips_gic.c
@@ -439,8 +439,8 @@ static void mips_gic_realize(DeviceState *dev, Error **errp)
 }
 
 static Property mips_gic_properties[] = {
-    DEFINE_PROP_INT32("num-vp", MIPSGICState, num_vps, 1),
-    DEFINE_PROP_INT32("num-irq", MIPSGICState, num_irq, 256),
+    DEFINE_PROP_UINT32("num-vp", MIPSGICState, num_vps, 1),
+    DEFINE_PROP_UINT32("num-irq", MIPSGICState, num_irq, 256),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index a9d87f3437..21ad844519 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -702,7 +702,7 @@ static void boston_mach_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
                             &error_fatal);
-    object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
+    object_property_set_uint(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
                             &error_fatal);
     qdev_connect_clock_in(DEVICE(&s->cps), "clk-in",
                           qdev_get_clock_out(dev, "cpu-refclk"));
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 2b436700ce..38acc57468 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -114,9 +114,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     /* Inter-Thread Communication Unit */
     if (itu_present) {
         object_initialize_child(OBJECT(dev), "itu", &s->itu, TYPE_MIPS_ITU);
-        object_property_set_int(OBJECT(&s->itu), "num-fifo", 16,
+        object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
                                 &error_abort);
-        object_property_set_int(OBJECT(&s->itu), "num-semaphores", 16,
+        object_property_set_uint(OBJECT(&s->itu), "num-semaphores", 16,
                                 &error_abort);
         object_property_set_bool(OBJECT(&s->itu), "saar-present", saar_present,
                                  &error_abort);
@@ -133,7 +133,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
 
     /* Cluster Power Controller */
     object_initialize_child(OBJECT(dev), "cpc", &s->cpc, TYPE_MIPS_CPC);
-    object_property_set_int(OBJECT(&s->cpc), "num-vp", s->num_vp,
+    object_property_set_uint(OBJECT(&s->cpc), "num-vp", s->num_vp,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpc), "vp-start-running", 1,
                             &error_abort);
@@ -146,9 +146,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
 
     /* Global Interrupt Controller */
     object_initialize_child(OBJECT(dev), "gic", &s->gic, TYPE_MIPS_GIC);
-    object_property_set_int(OBJECT(&s->gic), "num-vp", s->num_vp,
+    object_property_set_uint(OBJECT(&s->gic), "num-vp", s->num_vp,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->gic), "num-irq", 128,
+    object_property_set_uint(OBJECT(&s->gic), "num-irq", 128,
                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
         return;
@@ -161,7 +161,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     gcr_base = env->CP0_CMGCRBase << 4;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
-    object_property_set_int(OBJECT(&s->gcr), "num-vp", s->num_vp,
+    object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
                             &error_abort);
     object_property_set_int(OBJECT(&s->gcr), "gcr-rev", 0x800,
                             &error_abort);
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ec172b111a..af9021316d 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1066,7 +1066,7 @@ static void create_cps(MachineState *ms, MaltaState *s,
     object_initialize_child(OBJECT(s), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", ms->cpu_type,
                             &error_fatal);
-    object_property_set_int(OBJECT(&s->cps), "num-vp", ms->smp.cpus,
+    object_property_set_uint(OBJECT(&s->cps), "num-vp", ms->smp.cpus,
                             &error_fatal);
     qdev_connect_clock_in(DEVICE(&s->cps), "clk-in", s->cpuclk);
     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
diff --git a/hw/misc/mips_cmgcr.c b/hw/misc/mips_cmgcr.c
index 3c8b37f700..66eb11662c 100644
--- a/hw/misc/mips_cmgcr.c
+++ b/hw/misc/mips_cmgcr.c
@@ -212,7 +212,7 @@ static const VMStateDescription vmstate_mips_gcr = {
 };
 
 static Property mips_gcr_properties[] = {
-    DEFINE_PROP_INT32("num-vp", MIPSGCRState, num_vps, 1),
+    DEFINE_PROP_UINT32("num-vp", MIPSGCRState, num_vps, 1),
     DEFINE_PROP_INT32("gcr-rev", MIPSGCRState, gcr_rev, 0x800),
     DEFINE_PROP_UINT64("gcr-base", MIPSGCRState, gcr_base, GCR_BASE_ADDR),
     DEFINE_PROP_LINK("gic", MIPSGCRState, gic_mr, TYPE_MEMORY_REGION,
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index badef5c214..a06cdd10ea 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -549,9 +549,9 @@ static void mips_itu_reset(DeviceState *dev)
 }
 
 static Property mips_itu_properties[] = {
-    DEFINE_PROP_INT32("num-fifo", MIPSITUState, num_fifo,
+    DEFINE_PROP_UINT32("num-fifo", MIPSITUState, num_fifo,
                       ITC_FIFO_NUM_MAX),
-    DEFINE_PROP_INT32("num-semaphores", MIPSITUState, num_semaphores,
+    DEFINE_PROP_UINT32("num-semaphores", MIPSITUState, num_semaphores,
                       ITC_SEMAPH_NUM_MAX),
     DEFINE_PROP_BOOL("saar-present", MIPSITUState, saar_present, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/include/hw/intc/mips_gic.h b/include/hw/intc/mips_gic.h
index eeb136e261..5e4c71edd4 100644
--- a/include/hw/intc/mips_gic.h
+++ b/include/hw/intc/mips_gic.h
@@ -211,8 +211,8 @@ struct MIPSGICState {
     /* GIC VP Timer */
     MIPSGICTimerState *gic_timer;
 
-    int32_t num_vps;
-    int32_t num_irq;
+    uint32_t num_vps;
+    uint32_t num_irq;
 };
 
 #endif /* MIPS_GIC_H */
diff --git a/include/hw/misc/mips_cmgcr.h b/include/hw/misc/mips_cmgcr.h
index 9fa58942d7..db4bf5f449 100644
--- a/include/hw/misc/mips_cmgcr.h
+++ b/include/hw/misc/mips_cmgcr.h
@@ -75,7 +75,7 @@ struct MIPSGCRState {
     SysBusDevice parent_obj;
 
     int32_t gcr_rev;
-    int32_t num_vps;
+    uint32_t num_vps;
     hwaddr gcr_base;
     MemoryRegion iomem;
     MemoryRegion *cpc_mr;
diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index 50d961106d..ab6d286c38 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -57,8 +57,8 @@ struct MIPSITUState {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    int32_t num_fifo;
-    int32_t num_semaphores;
+    uint32_t num_fifo;
+    uint32_t num_semaphores;
 
     /* ITC Storage */
     ITCStorageCell *cell;
-- 
2.38.1

