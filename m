Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ABBF433CD
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 21:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD8Dr-0002YV-46; Wed, 15 Apr 2026 17:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8Dp-0002Wr-5f
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wD8Dn-0002px-8T
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 17:56:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so68195185e9.0
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776290190; x=1776894990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3cMxdZZE+yzFr7Fv4iBfref+oMD0q3gkn6aoHsy4iQ=;
 b=FCby5oxxYAvBW6aaOFdzp+GkYpF5Co8SfEZlq3D3y3XRGcqZce2pyfbx7jlTIhl3iu
 ckU0j4rdq4VdB0tGB3KI+2GBZh6yoVs0kWsF9pkFZ/LQ25GRugQid1Y/VXOMGvBWwSEJ
 NBmGIjeJELizQc1EOB5BZ0281ibKRZXS5HdQXNeD3v8rzMclMgBBTooTOW0Of/sQRPZe
 Ar0/6dgbyhhg9LJUetpDNwltRlUZk6LEyow7DelTrdDQUN10GDZAPKbeslrD0k3T3KoP
 aEhQJtkA+6d/3Vz412juo4TljdIz2zgtiJDYQBr52v3iwk4Xzu6/n5T8d3OlcRrY0wga
 3hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776290190; x=1776894990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r3cMxdZZE+yzFr7Fv4iBfref+oMD0q3gkn6aoHsy4iQ=;
 b=BZUQiaf0i3wSeTROyuGCsW/EnpC99YBAEiMI7331lfIqmm6o6018qHi7qmFgN042zB
 GKmb//it22QVkE9t/1pwIHwXl82SHYhPcBiEUknJt3WKprfOz92oadl1f9Yjvmy2d5G8
 6IrwFvS7mmvDRCoGxqpW9qBOHYK/DAKJLsmGYTmZN7WyyfycIFi4MZe/6ctiJ9i0wN6Q
 fHfuGa9AD3kCorpDuDI6GDg4HonY4LuaNiNdVGbGquJhfX6dLAqoje+3GLY2STjzGayG
 BdcJZlCK41dp1rP/GXSP5GIOtaaJySuRwZH5TJUXOKaJMCUa00OnDji40H3K9BxBth0g
 TXHw==
X-Gm-Message-State: AOJu0Yy0DtOCjgzoSNT/tkbzhsf18W+olNBjWcP+x3VGFZPk87mRlFdk
 t7hsnYjlb/r64z0s6i4+V8mpxQKMbynikq7sCwARCF6/RfMmDbVMwE1zULaCEX399xE=
X-Gm-Gg: AeBDieuy06eQYaayBBe1UkPNv6pi7TWwzbLM4MY/qyg9GbGjeveHLWJ+Zsn3HZ2qRv1
 J4wdaFiy+R4WOYw86OdUWSddqUzCx4eYzv9zFG7KaHhcSOJR+ktHLgVlcQtMvLC8x3jIupq0JT4
 nChq6AFyLSj7pBA+oh1Nfq1iYtRoOzAL/CpxAF8WtLWVQ682sCSNQrtPrY9raB36rr7QWt1l2es
 XnsqUENezd3zDKAh6ZXUjc3VCqD7PD9SxteXh7YTCbirlu/SBaJNSoo/OEow8XC5wLod9+6gdiA
 mnIggHoOg0eYpH8FeV69kktGoVCWcRmL9YmOWbXVYIoHOTzVbK89DX94AEAHUsj7tqxz+MFCbu7
 saPnFvglPlff1cluMJI0o22nLoqSvNLHrI/Ct7P3ju/yKl7O0m5t+1xP9cEzhHfazcQ5XH8jEU5
 PIoezLiwUoHH/xOtg8aK0XYS7G+NxQ0xL6atobez7JGu7qJY5AVZ6UF9dcC3J1BHacHKYb80tl
X-Received: by 2002:a5d:64e4:0:b0:43e:a638:250f with SMTP id
 ffacd0b85a97d-43ea638264cmr12924286f8f.1.1776290189684; 
 Wed, 15 Apr 2026 14:56:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3566c4sm7805821f8f.12.2026.04.15.14.56.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Apr 2026 14:56:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH 7/8] target/mips: Reduce CPUState scope when used with
 CPU_FOREACH()
Date: Wed, 15 Apr 2026 23:55:38 +0200
Message-ID: <20260415215539.92629-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415215539.92629-1-philmd@linaro.org>
References: <20260415215539.92629-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

When possible, reduce CPUState variable scope.
Prefer cpu_env(cpu) over &cpu->env.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/internal.h              | 11 ++++++-----
 target/mips/tcg/system/cp0_helper.c | 28 ++++++++++++++++------------
 target/mips/tcg/system/tlb_helper.c |  7 +++----
 3 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index c6cf69dfb6a..cc031662ef9 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -279,7 +279,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
 
 static inline int mips_vp_active(CPUMIPSState *env)
 {
-    CPUState *other_cs;
+    CPUState *cs;
 
     /* Check if the VP disabled other VPs (which means the VP is enabled) */
     if ((env->CP0_VPControl >> CP0VPCtl_DIS) & 1) {
@@ -287,10 +287,11 @@ static inline int mips_vp_active(CPUMIPSState *env)
     }
 
     /* Check if the virtual processor is disabled due to a DVP */
-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
-        if ((&other_cpu->env != env) &&
-            ((other_cpu->env.CP0_VPControl >> CP0VPCtl_DIS) & 1)) {
+    CPU_FOREACH(cs) {
+        CPUMIPSState *other_env = cpu_env(cs);
+
+        if ((other_env != env) &&
+            ((other_env->CP0_VPControl >> CP0VPCtl_DIS) & 1)) {
             return 0;
         }
     }
diff --git a/target/mips/tcg/system/cp0_helper.c b/target/mips/tcg/system/cp0_helper.c
index 99f43ad9e11..4ec1312f016 100644
--- a/target/mips/tcg/system/cp0_helper.c
+++ b/target/mips/tcg/system/cp0_helper.c
@@ -1559,12 +1559,13 @@ target_ulong helper_emt(void)
 
 target_ulong helper_dvpe(CPUMIPSState *env)
 {
-    CPUState *other_cs;
     target_ulong prev = env->mvp->CP0_MVPControl;
 
     if (env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) {
-        CPU_FOREACH(other_cs) {
-            MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+        CPUState *cpu;
+
+        CPU_FOREACH(cpu) {
+            MIPSCPU *other_cpu = MIPS_CPU(cpu);
             /* Turn off all VPEs except the one executing the dvpe.  */
             if (&other_cpu->env != env) {
                 other_cpu->env.mvp->CP0_MVPControl &= ~(1 << CP0MVPCo_EVP);
@@ -1577,12 +1578,13 @@ target_ulong helper_dvpe(CPUMIPSState *env)
 
 target_ulong helper_evpe(CPUMIPSState *env)
 {
-    CPUState *other_cs;
     target_ulong prev = env->mvp->CP0_MVPControl;
 
     if (env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) {
-        CPU_FOREACH(other_cs) {
-            MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+        CPUState *cpu;
+
+        CPU_FOREACH(cpu) {
+            MIPSCPU *other_cpu = MIPS_CPU(cpu);
 
             if (&other_cpu->env != env
                 /* If the VPE is WFI, don't disturb its sleep.  */
@@ -1599,12 +1601,13 @@ target_ulong helper_evpe(CPUMIPSState *env)
 /* R6 Multi-threading */
 target_ulong helper_dvp(CPUMIPSState *env)
 {
-    CPUState *other_cs;
     target_ulong prev = env->CP0_VPControl;
 
     if (!((env->CP0_VPControl >> CP0VPCtl_DIS) & 1)) {
-        CPU_FOREACH(other_cs) {
-            MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+        CPUState *cpu;
+
+        CPU_FOREACH(cpu) {
+            MIPSCPU *other_cpu = MIPS_CPU(cpu);
             /* Turn off all VPs except the one executing the dvp. */
             if (&other_cpu->env != env) {
                 mips_vpe_sleep(other_cpu);
@@ -1617,12 +1620,13 @@ target_ulong helper_dvp(CPUMIPSState *env)
 
 target_ulong helper_evp(CPUMIPSState *env)
 {
-    CPUState *other_cs;
     target_ulong prev = env->CP0_VPControl;
 
     if ((env->CP0_VPControl >> CP0VPCtl_DIS) & 1) {
-        CPU_FOREACH(other_cs) {
-            MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+        CPUState *cpu;
+
+        CPU_FOREACH(cpu) {
+            MIPSCPU *other_cpu = MIPS_CPU(cpu);
             if ((&other_cpu->env != env) && !mips_vp_is_wfi(other_cpu)) {
                 /*
                  * If the VP is WFI, don't disturb its sleep.
diff --git a/target/mips/tcg/system/tlb_helper.c b/target/mips/tcg/system/tlb_helper.c
index 680b4da29fa..8537798a53f 100644
--- a/target/mips/tcg/system/tlb_helper.c
+++ b/target/mips/tcg/system/tlb_helper.c
@@ -346,15 +346,14 @@ void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
     uint32_t invMsgVPN2 = arg & (TARGET_PAGE_MASK << 1);
     uint8_t invMsgR = 0;
     uint32_t invMsgMMid = env->CP0_MemoryMapID;
-    CPUState *other_cs;
+    CPUState *cpu;
 
 #ifdef TARGET_MIPS64
     invMsgR = extract64(arg, 62, 2);
 #endif
 
-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
-        global_invalidate_tlb(&other_cpu->env, invMsgVPN2, invMsgR, invMsgMMid,
+    CPU_FOREACH(cpu) {
+        global_invalidate_tlb(cpu_env(cpu), invMsgVPN2, invMsgR, invMsgMMid,
                               invAll, invVAMMid, invMMid, invVA);
     }
 }
-- 
2.53.0


