Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1EACC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:54:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY4j-00021M-LY; Tue, 13 Oct 2026 04:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3l-0007xv-R5
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3j-0007xZ-SH
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so2414254f8f.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880830; x=1792485630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=EDSv94O3ngBElAdZ3d0QnS2OnkdxbvDnsDEH1rGBv50=;
 b=FuOvJdGW3PQc4jbQPheRxAPZZ5ucWIKDtBqUwf3GhlPULbtu+MxSJci/YuQur545nz
 OMG3WX8Pg72/LvjQrmyvlNnXjbG+GxbauWjuWg0s6JbiM5M4/D6trYsxuckWobnMsH04
 RlqN+q5XW6j89IhpzYw2fE3hbRLy4iq+LeoP5l9iPcISgGqM3ovVenRjrF7/BEkCBvJ5
 fOM7gjCTsTWeDzw7m9FAjRlvHaPcJpP880uGEVpSLusTRNWcJ4r1UhPcqjJjg0IFiVJr
 t6vfwijYbnceYNIpVJVnLzhR2FKO4XDoClQDE1Ni0TPwQe7+QleuPHzLE+aI0HUbyg7/
 3tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880830; x=1792485630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=EDSv94O3ngBElAdZ3d0QnS2OnkdxbvDnsDEH1rGBv50=;
 b=Dm5ACZCe26ZlTpcFcj/xubVfnuwOB50jPwlmMO2Gi/V4uO1ky4iPWHJ8wKjaVJf3HQ
 sOEDcpXXuHLS6K21g4nezUmnX0pQGEDr7VT+ZOmsfoPcMefM89SFBXcM3n5gSOXlXqyE
 sednbJ2s7MPA89JknCli+ez9d9VXUVXRUcAxaQbAOnDjihhlicxvUU5T3Z/J04qV4egb
 IAeUbsq0R4fezOLFkVGYsKUyc02o456aZijmneekFc8wO6jZjsezMR/6wjvvwL/N8zZm
 NCvxGNiYW3cYGfwr3rNtfWEBVUgWZX/v7flUEUyDGR+O0XokEZVoR0DlqbLfb7DQPxyz
 c8Aw==
X-Gm-Message-State: AFq9FYKILxCRqwxgog9MDaSaQI1HS5LZG9ne2tNI66N+uWkXQS0c0ghm
 pxbEw0Lj1ntih9O3nmi0Vl6tCCSrUUtghpXwjmhZIQ5q4WXe5KFRZ5tp/0YfHYprOjCLQHYwe/U
 lH8t9tek=
X-Gm-Gg: AYBFou14QiwsnUwW3gvXGdHvZSIyL/ZQ3I2zNbrUy7Fu2EpHWAkinSW5QIUMvOp77Fg
 xrKB4qFaXz38R26CvLlvmtCUYwTq8HZYZJPeClZ8ah7XflUYv3wM7Ojn3tTzFxeSDh+iAF9S7j+
 Cpny9R1ebnSD3Z/5pIjkjVb8LZOFsK5oqHVTSThMLO9xq28K0bknABGyRdIofI/5Zs98yMi0B31
 UCxgSfyVCkMhSbLDNWwp6tgxY9KVstotc1t8Cy86F0ogPUrF/7hHGAxQGkg5yjDEKXTR7319bpL
 qTR6xwXWXJe9KwtHkllk0y2PQ9mntj3igETUMUYvQzd/DXQmXQnbGibjUKxZLQy2EkFoWlW3BrY
 vPyD3XV7GN77kRElN7zDkOX8WnBkvvz+xvWygoVAnw5aUYAJ1Bjd477BnB2cIeMyWPmdKHpaPZp
 X0MXocveVZ1BqGDJCu2ZanhnUgCpKURKjsVbdCa8XAAwZhPoxtEZw85KR6iaQ9gMVAtV+MKnEBz
 1QA2cmhA4lSmaubpLzHq66ldDVF2x4MuiRNxrA8Paamaq6KgtXeY7u44Ecysisac40siC6oOTJ9
 6W8x3dtHwu9v0A==
X-Received: by 2002:a05:600c:1e0f:b0:4a1:7b87:8d34 with SMTP id
 5b1f17b1804b1-4a18e4b46e1mr212171255e9.21.1791880830101; 
 Tue, 13 Oct 2026 01:40:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 39/86] target/arm: GICv5 cpuif: Handle virtual interrupts for
 GIC CDDI
Date: Tue, 13 Oct 2026 09:38:46 +0100
Message-ID: <20261013083933.1024405-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Handle the virtual interrupt domain in our GIC CDDI implementation:
for LPIs and SPIs we just pass through the "virtual" parameter, but
for PPIs we must look at the virtual PPI state rather than the
physical PPI state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 11 ++++++++---
 target/arm/tcg/trace-events  |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index aeacc812fe0..c85d72b05d0 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -1254,7 +1254,7 @@ static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv5IntType type = FIELD_EX64(value, GIC_CDDI, TYPE);
     uint32_t id = FIELD_EX64(value, GIC_CDDI, ID);
 
-    trace_gicv5_cddi(domain, value);
+    trace_gicv5_cddi(domain, virtual, value);
 
     switch (type) {
     case GICV5_PPI:
@@ -1268,8 +1268,13 @@ static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
         ppireg = id / 64;
         ppibit = 1ULL << (id % 64);
 
-        env->gicv5_cpuif.ppi_active[ppireg] &= ~ppibit;
-        gic_recalc_ppi_hppi(env);
+        if (virtual) {
+            env->gicv5_cpuif.ich_ppi_active[ppireg] &= ~ppibit;
+            gic_recalc_virt_ppi_hppi(env);
+        } else {
+            env->gicv5_cpuif.ppi_active[ppireg] &= ~ppibit;
+            gic_recalc_ppi_hppi(env);
+        }
         break;
     }
     case GICV5_LPI:
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index 8e7e4c119db..31c6eafd8ed 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -8,7 +8,7 @@ gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt fai
 gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
 gicv5_cdeoi(int domain) "domain %d CDEOI performing priority drop"
 gicv5_vcdeoi(void) "virtual interrupt domain CDEOI performing priority drop"
-gicv5_cddi(int domain, uint32_t id) "domain %d CDDI deactivating interrupt ID 0x%x"
+gicv5_cddi(int domain, bool virtual, uint32_t id) "domain %d virtual %d CDDI deactivating interrupt ID 0x%x"
 gicv5_update_irq_fiq(bool irq, bool fiq, bool nmi) "now IRQ %d FIQ %d NMI %d"
 gicv5_update_virq_vfiq(bool virq, bool vinmi) "now VIRQ %d VINMI %d"
 gicv5_update_ppi_state(int ppi, bool level) "PPI %d source level now %d"
-- 
2.43.0


