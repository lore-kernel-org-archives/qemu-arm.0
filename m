Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8650933wrv;
        Thu, 8 Aug 2019 20:13:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydNaAzVXpGEQyHHQ5d4Tch1Cmle1R1euY6eqN6DjqHD9MDt2EEjQOQI979zflUINIJC0I2
X-Received: by 2002:ad4:45b2:: with SMTP id y18mr15594240qvu.224.1565320419782;
        Thu, 08 Aug 2019 20:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565320419; cv=none;
        d=google.com; s=arc-20160816;
        b=e+YIATcgLcnZs+fknp6Sesj7UccjQpeKoED2lIi40umyF/gu9VkX2v7CjiRQQh5mB2
         MAEtNnoY1uKzYNOpVPboZcOiCdVY4vrTE1BltIaYwCXG39z7vjfGFH1/Qg8jL9TyBmW6
         ZzAl84xvQOnxpDbewnmDc4EzZ/qF7bzM+kYs1mshDNgC6D/+JunG2PlY0PgJkI6492fz
         ya3J9gI5k7ABgnRH0IwztJ3jxR52uXl5Fqa9cK1y4AOqV/C90slFoxwoyh8yH6Q1J9av
         O5Y/AGn2ZDf2VlhAzUAGDJeBstFh2yh4GgcH4CBZFmgwgHHSWBFspzBJfq+nq+FMghBn
         KtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature;
        bh=5jDcdVJtC3Bs8Q1gfY1251EHfBSuEf9RM0AOodVchiI=;
        b=WpUEJuLOlqfY2X95YsdHpoIT4bfWLT2icXO2Q6AbxcMG/Y78a5ZNhvNAobixGhylLt
         X4zNqFrDnWTp65/mHpQqMUOT28ojkDzKQQMSkJbvHfCY6OUUog9kfM0hag53lIAQpliQ
         Eh0RO2zR2TShSn4gchTgLIGnGwHMZ79ylmCFSyglMD/Kx4HWc+iFJDKsq6zKJIjxvfoZ
         wK+9ghsF7m/Z/9FG3vwgTJ0mQH8maVAHwU6kIG4JV5RxIynukhAzpesmW7Cynn7s/cCs
         uZNhYkxPp4e4fGYn+oqC1x5hE0NfOew8czr7XtyBWIsLZEs0jdNiZBI69GFXyb7oPfnm
         DooA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=owQw3w3j;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=FEbMN5nJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27si56117795qtc.68.2019.08.08.20.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 20:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=owQw3w3j;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=FEbMN5nJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvvLX-0000bW-C0
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 23:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrew@aj.id.au>) id 1hvvLS-0000bQ-Ch
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 23:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1hvvLR-00043l-50
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 23:13:34 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1hvvLQ-00042E-Kp; Thu, 08 Aug 2019 23:13:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A140B218BB;
 Thu,  8 Aug 2019 23:13:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 08 Aug 2019 23:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=5jDcdVJtC3Bs8Q1gfY1251EHfB
 SuEf9RM0AOodVchiI=; b=owQw3w3j5KkXsZFQvwhxdK5cJaO9AWky3CZKNPsPfU
 uJHCDEH4DZsgHJ2csrrBKhrAUq1ElBYr36iX4uoUiM2Co8XBMwQyrRxwo21KM52i
 yfQgowMIH6usRqaZidaT8nfHqZ7IWSO238hwRFzSVeivliNmGCMk9zl+DE3wJgq8
 s3SF8vyfn0NIcy573wceWxJ2oVDaRh6wUlXsFb1rzgjla213GnzHUs8XB2rPK9qE
 YipcRtPLd5yOz+jctEYjFNm/s12P7Wv1SwAN0biPNmj/xNFCOOpuQShwBXcxKzZk
 MeJ7YD6QW9DM1E5uZUxqpLlvIVooMKX0aLNKLELFqJUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5jDcdVJtC3Bs8Q1gf
 Y1251EHfBSuEf9RM0AOodVchiI=; b=FEbMN5nJ/ew4qnQaEVaRlKu7l0LNJGcGi
 XdLtBie4QIA7ci9qDhPmZgoYTT+C9AAJdS2x+XgRQmhhfqF4/PpStlI+Xonle2Fu
 hQpJAxVIHZumJuHne/ocr06LtWHYEyLsIiXOVMj2dmc+pELfGEY2vB9/gRjEjUER
 jS1j/O75WRg9BJl3543xryPldVDwEVh2PyXe+UsELlV2V7nO2hB9iZVTqy1lAcli
 l96I3FmbCRajO88Dhb4VU6QIJ4JQhZPpnvh4L1E9Cm/A5SkW+fgDMf9n8D23B0iS
 idmjDXWhlv+xZJAHRWYAgx0TA5ZAD9r6J18luQIdO5CIUSAZTrV3g==
X-ME-Sender: <xms:2eRMXXI9w6tOwz5_nQB6RgesKwhezapBmFaYeNNRFRaUOAJheEMHeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpegtohhrrhgvtghtlhihrdhtrghrghgvthenucfkph
 epuddukedrvddutddrudegfedruddvheenucfrrghrrghmpehmrghilhhfrhhomheprghn
 ughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:2eRMXSMsycwIrGH_v5YRaFL12tdO3zk_fIJ7Vc6LBHsubwVmL-2wKw>
 <xmx:2eRMXXZeXQOXHxSHLv_mRXn4BjeRWCwNRu44jVnCE5S_bW-W_9O9ug>
 <xmx:2eRMXWzwdYQLG0sbcC6_fFQqVdBPeynM3Lup72bUMPqosSN9vTrIvw>
 <xmx:2uRMXVXSwxdTaCKESAZ39OE9MYoZFqSSUQfgX0jD0gtYqKY7lAJ_QQ>
Received: from localhost.localdomain
 (ppp118-210-143-125.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.143.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EBE48005A;
 Thu,  8 Aug 2019 23:13:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Fri,  9 Aug 2019 12:43:21 +0930
Message-Id: <20190809031321.14760-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH] target-arm: Make the counter tick relative to
 cntfrq
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
Cc: Andrew Jeffery <andrew@aj.id.au>, peter.maydell@linaro.org, clg@kaod.org,
 qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKssSoBYRS0W

The use of GTIMER_SCALE assumes the clock feeding the generic timer is
62.5MHz for all platforms. This is untrue in general, for example the
ASPEED AST2600 feeds the counter with either an 800 or 1200MHz clock,
and CNTFRQ is configured appropriately by u-boot.

To cope with these values we need to take care of the quantization
caused by the clock scaling in terms of nanoseconds per clock by
calculating an effective frequency such that NANOSECONDS_PER_SECOND is
an integer multiple of the effective frequency. Failing to account for
the quantisation leads to sticky behaviour in the VM as the guest timer
subsystems account for the difference between delay time and the counter
value.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
The timer rate assumptions seemed unusual, so I'm not sure if this patch is way
off-base or not. However it does make the AST2600 u-boot and kernel behave
correctly.

 target/arm/helper.c | 51 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b74c23a9bc08..35d14c183630 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2277,6 +2277,34 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 
+static void gt_recalc_timer(ARMCPU *cpu, int timeridx);
+static void gt_cntfrq_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    uint64_t scale;
+    ARMCPU *cpu;
+    int i;
+
+    raw_write(env, ri, value);
+
+    /* Fix up the timer scaling */
+    cpu = env_archcpu(env);
+    scale = MAX(1, NANOSECONDS_PER_SECOND / value);
+    for (i = 0; i < NUM_GTIMERS; i++) {
+        if (!cpu->gt_timer[i]) {
+            continue;
+        }
+
+        cpu->gt_timer[i]->scale = scale;
+        gt_recalc_timer(cpu, i);
+    }
+}
+
+static void gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
+{
+    gt_cntfrq_write(env, opaque, opaque->resetvalue);
+}
+
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
@@ -2405,9 +2433,21 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
     }
 }
 
+static uint64_t gt_calc_tick(CPUARMState *env, uint64_t ns)
+{
+    /*
+     * Deal with quantized clock scaling by calculating the effective frequency
+     * in terms of the timer scale.
+     */
+    uint32_t scale = MAX(1, NANOSECONDS_PER_SECOND / env->cp15.c14_cntfrq);
+    uint64_t effective = NANOSECONDS_PER_SECOND / scale;
+
+    return muldiv64(ns, effective, NANOSECONDS_PER_SECOND);
+}
+
 static uint64_t gt_get_countervalue(CPUARMState *env)
 {
-    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / GTIMER_SCALE;
+    return gt_calc_tick(env, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
 }
 
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
@@ -2443,8 +2483,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
          * set the timer for as far in the future as possible. When the
          * timer expires we will reset the timer for any remaining period.
          */
-        if (nexttick > INT64_MAX / GTIMER_SCALE) {
-            nexttick = INT64_MAX / GTIMER_SCALE;
+        if (nexttick > INT64_MAX / cpu->gt_timer[timeridx]->scale) {
+            nexttick = INT64_MAX / cpu->gt_timer[timeridx]->scale;
         }
         timer_mod(cpu->gt_timer[timeridx], nexttick);
         trace_arm_gt_recalc(timeridx, irqstate, nexttick);
@@ -2686,13 +2726,16 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     { .name = "CNTFRQ", .cp = 15, .crn = 14, .crm = 0, .opc1 = 0, .opc2 = 0,
       .type = ARM_CP_ALIAS,
       .access = PL1_RW | PL0_R, .accessfn = gt_cntfrq_access,
+      .writefn = gt_cntfrq_write,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c14_cntfrq),
     },
     { .name = "CNTFRQ_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 0,
       .access = PL1_RW | PL0_R, .accessfn = gt_cntfrq_access,
+      .writefn = gt_cntfrq_write,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_cntfrq),
       .resetvalue = (1000 * 1000 * 1000) / GTIMER_SCALE,
+      .resetfn = gt_cntfrq_reset,
     },
     /* overall control: mostly access permissions */
     { .name = "CNTKCTL", .state = ARM_CP_STATE_BOTH,
@@ -2875,7 +2918,7 @@ static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
      * can't call gt_get_countervalue(env), instead we directly
      * call the lower level functions.
      */
-    return cpu_get_clock() / GTIMER_SCALE;
+    return gt_calc_tick(env, cpu_get_clock());
 }
 
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
-- 
2.20.1

