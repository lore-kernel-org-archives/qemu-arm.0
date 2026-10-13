Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CF2CC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9X-0001ks-QF; Tue, 13 Oct 2026 04:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4L-0000nr-UD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4J-0008Ck-3L
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48afe75f055so2463132f8f.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880865; x=1792485665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=p5jmczQ7jRF4VI3U5WvjTrENUuNA4/rc3UHOagWDDVM=;
 b=Xnl8JXqTb1tRsFCkarcGm9O0QWSIqPFpZH5sj7sku/Wyp3MQ4lCRHlbSk3UQA7yNgH
 Z17JwIiEZXpY5kQh4mQtVlKfLyeYriAQ111TQ2VbdWIrLGijLwj9dvPbSGSqa/T1wDck
 xYNTcyeDFetGHYsP2FZ69dEHNBZ84Z9Vq88IyE3AnmX10KClVw5Jpi+gNxUma2HvhEYX
 m5RWhR4C+UbqAY+kNi5tHiXgzgT5PgVaH8nA5HOmXW0iylO/5+jR5SQ+0sgacKibF7b8
 FjYCv78m4G/0x0JVlx4Jit71Lnt3ATC4EOqWn5fSrCWwRJYOs2AVtn1/oB090NOrI1z5
 2pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880865; x=1792485665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=p5jmczQ7jRF4VI3U5WvjTrENUuNA4/rc3UHOagWDDVM=;
 b=YIEB5N2bI47s8tplIA+k+SMpcXkqNEZNcfF5AAKnwnDnapeCQSHgZyvQn5EHhaxk/N
 M9MOQ62tWfcVHrQyp9FzmadgEqOL/L3Q4zxtt1wRgvCUq7SKC09KD24kViMtT+KMyxPJ
 fjHjeJBBAbEjOZA1Pl9q/U4GC2rWk000TVTc5HQ1X0MDY9Nx+gOP34EQSjukaZcRM4OR
 l081RyfIGgjjCZCoigM8Lkz7+1m+NWPBsbPKMRIeRE9Ir4SJHpq87P6N1Cd4A3BtrbMy
 ww8DVPVV6gOQKQVkiCT//eSpE7A+8BW062wEKS82rZkgg21bOJPMQja7bTg40qptT7g+
 fzzA==
X-Gm-Message-State: AFq9FYKbYSsdGfRF8MRx6oYtTbHeneUe45DrjYunLGThCpM0OmkiIsSZ
 n90ajmDeDwSAcUKRq1sQ9btq8AYGw30oQf1w7jktk2UrnzmMLzmoksCefXbzgQe/eF6ysFk05Jj
 ckIUbk8A=
X-Gm-Gg: AYBFou0fnrbErLAMTe8LrFZaTBStkFEmBa6cvLkkqxBxIfpEA8ef3Z1l7nBxi4Tuj5o
 aMcRY/b8A8VwKO6v0IRvRxU1GZTEqD3+YSNoWmNlPn2y2yWZauNoUDsTXBh5i0T1ytbEJPFuQBB
 rW+GOjZzHwR1r2tk0xBJnMVS+vNysFPO+bYS6pXNABhShJ6Wgp/M3ju+DMn03tJYWUNZSACyzQf
 LQ0+RCq6MUE2BLX+hvxBkJNBsEXpjo4hTv4zT4o6xazlL9DYWAEjKCGvwO/m1Ywg6Zb7gzoLjdV
 M7T74Atf/F15MpA9iZgRDx3Ppqi64epZBwbsatOJZDb8MgIeNKXQjZxP0jkN4aGbkQAOj+1daZU
 gysXttQ+DG0E2KwSYgUXe9plq9SZiSKt9XKzakW/Pi4lfuOW5Fq3YjnoiHkDxMSp/dkw3pWVvpb
 j9qd8PgX9YnntT4PypAmJkjULY5bKUnqGosjltrUNpEHPBvNR1V0vS4zIT8rqI7xNHun7PP/NWp
 PO8K1xBdPiBc04AkxfW69WgLpN6NwnqG6wsH2w9+94nR9rmNFWBCG5VekSltrMhAJf9BMlKFlrk
 Y0c=
X-Received: by 2002:a05:600c:a016:b0:4a1:a44d:1d5 with SMTP id
 5b1f17b1804b1-4a1a44d0221mr73304665e9.9.1791880865106; 
 Tue, 13 Oct 2026 01:41:05 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 69/86] hw/intc/arm_gicv5: Take cpuidx for stream commands on
 virtual interrupts
Date: Tue, 13 Oct 2026 09:39:16 +0100
Message-ID: <20261013083933.1024405-70-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In hardware, the GICv5 stream protocol is a set of 1:1 links between
the IRS and the attached CPU interfaces, which means the IRS always
implicitly knows which CPU it has received a command from.  For QEMU,
these are all function calls, and so the IRS doesn't know unless we
pass the cpuidx.  For most of the stream protocol commands, the IRS
so far hasn't needed to know, because operations on physical
interrupts are the same whichever CPU requests them.  But for virtual
interrupts the operation will be on the interrupts of whichever VM
owns the VPE currently resident on the requesting CPU, so we do need
to know which one that is.

Add a cpuidx argument to every function corresponding to a stream
protocol command that can operate on a virtual interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 18 ++++++++++--------
 include/hw/intc/arm_gicv5_stream.h | 25 +++++++++++++++++--------
 target/arm/tcg/gicv5-cpuif.c       | 21 ++++++++++++---------
 3 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 01ee303d393..fc1f09f51e8 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -568,7 +568,8 @@ static hwaddr l1_vmte_addr(GICv5Common *cs, const GICv5VMTConfig *cfg,
 }
 
 void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
-                        GICv5Domain domain, GICv5IntType type, bool virtual)
+                        GICv5Domain domain, GICv5IntType type, bool virtual,
+                        uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint32_t iaffid;
@@ -623,7 +624,8 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id, uint8_t priority,
 }
 
 void gicv5_set_enabled(GICv5Common *cs, uint32_t id, bool enabled,
-                       GICv5Domain domain, GICv5IntType type, bool virtual)
+                       GICv5Domain domain, GICv5IntType type, bool virtual,
+                       uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint32_t iaffid;
@@ -676,7 +678,7 @@ void gicv5_set_enabled(GICv5Common *cs, uint32_t id, bool enabled,
 
 void gicv5_set_pending(GICv5Common *cs, uint32_t id, bool pending,
                        GICv5Domain domain, GICv5IntType type, bool virtual,
-                       uint32_t vm)
+                       uint32_t vm, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint32_t iaffid;
@@ -729,7 +731,7 @@ void gicv5_set_pending(GICv5Common *cs, uint32_t id, bool pending,
 
 void gicv5_set_handling(GICv5Common *cs, uint32_t id,
                         GICv5HandlingMode handling, GICv5Domain domain,
-                        GICv5IntType type, bool virtual)
+                        GICv5IntType type, bool virtual, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
 
@@ -777,7 +779,7 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
 
 void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
                       GICv5RoutingMode irm, GICv5Domain domain,
-                      GICv5IntType type, bool virtual)
+                      GICv5IntType type, bool virtual, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint32_t old_iaffid;
@@ -889,7 +891,7 @@ static uint64_t spi_state_to_icsr(GICv5SPIState *spi)
 }
 
 uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
-                              GICv5IntType type, bool virtual)
+                              GICv5IntType type, bool virtual, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint64_t icsr;
@@ -933,7 +935,7 @@ uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
 }
 
 void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
-                    GICv5IntType type, bool virtual)
+                    GICv5IntType type, bool virtual, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint32_t iaffid;
@@ -991,7 +993,7 @@ void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
 }
 
 void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
-                      GICv5IntType type, bool virtual)
+                      GICv5IntType type, bool virtual, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
     uint32_t iaffid;
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index ea27d6aec0f..0d62f86820d 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -59,6 +59,7 @@ GICv5CPUIFStatus gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs,
  * @domain: interrupt Domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Set priority of an interrupt; matches stream interface SetPriority
  * command from CPUIF to IRS. There is no report back of
@@ -66,7 +67,7 @@ GICv5CPUIFStatus gicv5_set_gicv5state(ARMCPU *cpu, GICv5Common *cs,
  */
 void gicv5_set_priority(GICv5Common *cs, uint32_t id,
                         uint8_t priority, GICv5Domain domain,
-                        GICv5IntType type, bool virtual);
+                        GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_set_enabled
@@ -76,6 +77,7 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id,
  * @domain: interrupt Domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Set enabled state of an interrupt; matches stream interface
  * SetEnabled command from CPUIF to IRS. There is no report back of
@@ -83,7 +85,7 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id,
  */
 void gicv5_set_enabled(GICv5Common *cs, uint32_t id,
                        bool enabled, GICv5Domain domain,
-                       GICv5IntType type, bool virtual);
+                       GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_set_pending
@@ -94,6 +96,7 @@ void gicv5_set_enabled(GICv5Common *cs, uint32_t id,
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
  * @vm: VM ID (for virtual interrupts)
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Set pending state of an interrupt; matches stream interface
  * SetPending command from CPUIF to IRS. There is no report back of
@@ -101,7 +104,8 @@ void gicv5_set_enabled(GICv5Common *cs, uint32_t id,
  */
 void gicv5_set_pending(GICv5Common *cs, uint32_t id,
                        bool pending, GICv5Domain domain,
-                       GICv5IntType type, bool virtual, uint32_t vm);
+                       GICv5IntType type, bool virtual, uint32_t vm,
+                       uint32_t cpuidx);
 
 /**
  * gicv5_set_handling
@@ -111,6 +115,7 @@ void gicv5_set_pending(GICv5Common *cs, uint32_t id,
  * @domain: interrupt Domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Set handling mode of an interrupt (edge/level); matches stream
  * interface SetHandling command from CPUIF to IRS. There is no report
@@ -118,7 +123,7 @@ void gicv5_set_pending(GICv5Common *cs, uint32_t id,
  */
 void gicv5_set_handling(GICv5Common *cs, uint32_t id,
                         GICv5HandlingMode handling, GICv5Domain domain,
-                        GICv5IntType type, bool virtual);
+                        GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_set_target
@@ -129,6 +134,7 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
  * @domain: interrupt Domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Set handling mode of an interrupt (edge/level); matches stream
  * interface SetHandling command from CPUIF to IRS. There is no report
@@ -136,7 +142,7 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
  */
 void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
                       GICv5RoutingMode irm, GICv5Domain domain,
-                      GICv5IntType type, bool virtual);
+                      GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_request_config
@@ -145,6 +151,7 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
  * @domain: interrupt domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Query the current configuration of an interrupt; matches stream
  * interface RequestConfig command from CPUIF to IRS and the
@@ -159,7 +166,7 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
  * ICC_ICSR_EL1.
  */
 uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
-                              GICv5IntType type, bool virtual);
+                              GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_activate
@@ -168,6 +175,7 @@ uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
  * @domain: interrupt domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Activate the IRS's highest priority pending interrupt; matches the
  * stream interface's Activate command.
@@ -182,7 +190,7 @@ uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
  * its hppi[][] array.
  */
 void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
-                    GICv5IntType type, bool virtual);
+                    GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_forward_interrupt
@@ -230,12 +238,13 @@ GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
  * @domain: interrupt Domain to act on
  * @type: interrupt type (LPI or SPI)
  * @virtual: true if this is a virtual interrupt
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Deactivate the specified interrupt. There is no report back of
  * success/failure to the CPUIF in the protocol.
  */
 void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
-                      GICv5IntType type, bool virtual);
+                      GICv5IntType type, bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_set_resident
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 406c980af5e..ed34196d7ce 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -680,7 +680,7 @@ static void gic_cddis_write(CPUARMState *env, const ARMCPRegInfo *ri,
     bool virtual;
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
 
-    gicv5_set_enabled(gic, id, false, domain, type, virtual);
+    gicv5_set_enabled(gic, id, false, domain, type, virtual, env->gicv5.cpuidx);
 }
 
 static void gic_cden_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -692,7 +692,7 @@ static void gic_cden_write(CPUARMState *env, const ARMCPRegInfo *ri,
     bool virtual;
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
 
-    gicv5_set_enabled(gic, id, true, domain, type, virtual);
+    gicv5_set_enabled(gic, id, true, domain, type, virtual, env->gicv5.cpuidx);
 }
 
 static void gic_cdpri_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -705,7 +705,8 @@ static void gic_cdpri_write(CPUARMState *env, const ARMCPRegInfo *ri,
     bool virtual;
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
 
-    gicv5_set_priority(gic, id, priority, domain, type, virtual);
+    gicv5_set_priority(gic, id, priority, domain, type, virtual,
+                       env->gicv5.cpuidx);
 }
 
 static void gic_cdaff_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -719,7 +720,8 @@ static void gic_cdaff_write(CPUARMState *env, const ARMCPRegInfo *ri,
     bool virtual;
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
 
-    gicv5_set_target(gic, id, iaffid, irm, domain, type, virtual);
+    gicv5_set_target(gic, id, iaffid, irm, domain, type, virtual,
+                     env->gicv5.cpuidx);
 }
 
 static void gic_cdpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -759,7 +761,8 @@ static void gic_cdpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    gicv5_set_pending(gic, id, pending, domain, type, virtual, vm);
+    gicv5_set_pending(gic, id, pending, domain, type, virtual, vm,
+                      env->gicv5.cpuidx);
 }
 
 static void gic_cdrcfg_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -772,7 +775,7 @@ static void gic_cdrcfg_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
 
     env->gicv5_cpuif.icc_icsr_el1 =
-        gicv5_request_config(gic, id, domain, type, virtual);
+        gicv5_request_config(gic, id, domain, type, virtual, env->gicv5.cpuidx);
 }
 
 static void gic_cdhm_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -785,7 +788,7 @@ static void gic_cdhm_write(CPUARMState *env, const ARMCPRegInfo *ri,
     bool virtual;
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
 
-    gicv5_set_handling(gic, id, hm, domain, type, virtual);
+    gicv5_set_handling(gic, id, hm, domain, type, virtual, env->gicv5.cpuidx);
 }
 
 static uint64_t gic_ppi_hmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -1466,7 +1469,7 @@ static uint64_t gicr_cdia_read(CPUARMState *env, const ARMCPRegInfo *ri)
          * name of the stream command, does both "set Active" and
          * "maybe set not Pending" as a single atomic action.
          */
-        gicv5_activate(gic, id, domain, type, virtual);
+        gicv5_activate(gic, id, domain, type, virtual, env->gicv5.cpuidx);
         break;
     default:
         g_assert_not_reached();
@@ -1543,7 +1546,7 @@ static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     case GICV5_LPI:
     case GICV5_SPI:
         /* Tell the IRS to deactivate this interrupt */
-        gicv5_deactivate(gic, id, domain, type, virtual);
+        gicv5_deactivate(gic, id, domain, type, virtual, env->gicv5.cpuidx);
         break;
     default:
         break;
-- 
2.43.0


