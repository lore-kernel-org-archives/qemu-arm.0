Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp6212476lfy;
        Mon, 3 Aug 2020 09:54:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDcfH2TeoAMyitbRYNA30q8qGaJ+Xc/zo/5JJHA16aPy/Xquw9F6BWfL9eVRwfkQuL9Tj0
X-Received: by 2002:a25:3a81:: with SMTP id h123mr24722804yba.427.1596473666517;
        Mon, 03 Aug 2020 09:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596473666; cv=none;
        d=google.com; s=arc-20160816;
        b=TRJH6duutafCwDKPqemqAy/vMzKDU3+LHVgXwTlsigRGwqFWGu+7y6Q3IwEIlk8DFi
         tmec01vXBLLmiQjh9+1wXovjdRtI/UQwbrTG4BD5lf8mUlg7orLdWpA8Tc8MQliPKd+3
         ZtPDuXm1BADrDnMAMrX94nVb7YUso1yXZn2m4O29jBuF/wsxk7L45UAMnIR1kCXfanyc
         IF4/AF6Kb2wMlon4TWo7liBZ9sjJrVwpRh8avDgCht648AhYaDKtbyUiqJLvSnOJX15J
         8kWlbtsrvCkNg84X9k1zbLFiZKlXnSkt9nhEL7ZT2DiY3L0Z2lvN/99gYeoS10C9nWlL
         Tq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ffmPWDKlcsY1Gus8c/E/7lJXRNv40LcZuh9AmRMWtMw=;
        b=cfpm4gj4NHiGmmkyg+5zlseuYcYDxw73AyesLEeLwOModSnP1wYdPsv3wolvCKrcSV
         eNxmSy9gQmG7qAYcEU+SVh6IfU2H5aiUhrsk8T5Y7mXSDTL/VmGEKpDeQmyV9qWDpwTF
         xhmLPKnSgDdcjKXMk850KTR+uh79eZnTfu+wWPxdezglMiQRzM+8uJiyc3Q9wvv77n2z
         UTcQiY+InED835jIaiNvGBdZ3HTOlHX/YyhxfNcPX+ZLX6taEK3piHBV0HSKk4HM2mAu
         2ox/X6OLCc7UjYfid9uzCWIWbWs0nRKFTqsbFDev5hAOcVcczl7TPG33ZueUWVVIwdt3
         Wncw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ieY3a3v7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si2088231ybf.25.2020.08.03.09.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 09:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ieY3a3v7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2djF-0006vO-T3
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2dj7-0006tX-Fl
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 12:54:17 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2dj4-0000ND-D0
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 12:54:17 -0400
Received: by mail-wr1-x441.google.com with SMTP id 88so34838962wrh.3
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffmPWDKlcsY1Gus8c/E/7lJXRNv40LcZuh9AmRMWtMw=;
 b=ieY3a3v7tNOp2BgqXXcqOCuL9mCEctUpdzvQ68kwPsvGz/Gc6kUu1JvaaUf0tGbs0G
 rpxh/AHGoK/RsyPHVwBmlb6ueo1nXra4EBc4yp0d0h646EWQfH66g3YPWy0+F9lYsXw4
 YK2j/8ivFmho9b07LltpnS4sBa1qal0RAGoQcVChl3VDatenD2WgEeFBGNUrHdai7a6T
 Lu6FuyKiDTRWLVvX+p/+Joo29rquYx+Xwc1W422oBfkhu+vOVBKNrFPX/aropHXXR+89
 BTMdFza4YIxOPxx+rl+qAeVzg7dvo96nsQytjW9Ncjuqap4ZSoCjrhXoSEuV2pbGhJtD
 W3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffmPWDKlcsY1Gus8c/E/7lJXRNv40LcZuh9AmRMWtMw=;
 b=Bui6uIXUtEYL06g+T/jr7UnnMAgkJj76f/Jj5cjiqUGgG694xYTQGdwKehJtDq4uEN
 rWwPbvmUZIKxAAWBUvwbsxJ8x+86qqm5P9eeWZ91+V1hMJo82cvG+3COaDjfEzg8p1Ms
 Jk39l+gXVHBoyjj9oSHcfv+yo5TZe6rT0ZYMEJVjtJotgdyPT5vDN0s7xbxYGHEF/uFu
 deb76zo5y4xjEYMXyjv2nByTGQBZmUT14bmqn9ZJpEQoWh7ptaHkjyMFZYM+mIoeq9fm
 P+7+o3OvIDA+ZV3XyawouwfiHiaZp01WkikQOmO63bEM9OBtvYobVH8g9eLRryNfOryn
 v8FQ==
X-Gm-Message-State: AOAM532NK0p3d8Ob04c1eIiM+e78RAUt289947Y36vyKWavDtkhjMivE
 QubU1nyvJCMGyTuzPVw5ymw9LZlLLoFShg==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr15777292wrx.245.1596473652060; 
 Mon, 03 Aug 2020 09:54:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i14sm31560564wrc.19.2020.08.03.09.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 09:54:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix Rt/Rt2 in ESR_ELx for copro traps from
 AArch32 to 64
Date: Mon,  3 Aug 2020 17:54:09 +0100
Message-Id: <20200803165409.15099-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPVMJl6+XmuT

When a coprocessor instruction in an  AArch32 guest traps to AArch32
Hyp mode, the syndrome register (HSR) includes Rt and Rt2 fields
which are simply copies of the Rt and Rt2 fields from the trapped
instruction.  However, if the instruction is trapped from AArch32 to
an AArch64 higher exception level, the Rt and Rt2 fields in the
syndrome register (ESR_ELx) must be the AArch64 view of the register.
This makes a difference if the AArch32 guest was in a mode other than
User or System and it was using r13 or r14, or if it was in FIQ mode
and using r8-r14.

We don't know at translate time which AArch32 CPU mode we are in, so
we leave the values we generate in our prototype syndrome register
value at translate time as the raw Rt/Rt2 from the instruction, and
instead correct them to the AArch64 view when we find we need to take
an exception from AArch32 to AArch64 with one of these syndrome
values.

Fixes: https://bugs.launchpad.net/qemu/+bug/1879587
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: I don't have a test case for this so am hoping the bug
submitter will test it for me :-)
---
 target/arm/helper.c | 93 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ef0fb478f4..60b80228fd7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9581,6 +9581,67 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
     take_aarch32_exception(env, new_mode, mask, offset, addr);
 }
 
+static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
+{
+    /*
+     * Return the register number of the AArch64 view of the AArch32
+     * register @aarch32_reg. The CPUARMState CPSR is assumed to still
+     * be that of the AArch32 mode the exception came from.
+     */
+    int mode = env->uncached_cpsr & CPSR_M;
+
+    switch (aarch32_reg) {
+    case 0 ... 7:
+        return aarch32_reg;
+    case 8 ... 12:
+        return mode == ARM_CPU_MODE_FIQ ? aarch32_reg + 16 : aarch32_reg;
+    case 13:
+        switch (mode) {
+        case ARM_CPU_MODE_USR:
+        case ARM_CPU_MODE_SYS:
+            return 13;
+        case ARM_CPU_MODE_HYP:
+            return 15;
+        case ARM_CPU_MODE_IRQ:
+            return 17;
+        case ARM_CPU_MODE_SVC:
+            return 19;
+        case ARM_CPU_MODE_ABT:
+            return 21;
+        case ARM_CPU_MODE_UND:
+            return 23;
+        case ARM_CPU_MODE_FIQ:
+            return 29;
+        default:
+            g_assert_not_reached();
+        }
+    case 14:
+        switch (mode) {
+        case ARM_CPU_MODE_USR:
+        case ARM_CPU_MODE_SYS:
+            return 14;
+        case ARM_CPU_MODE_HYP:
+            return 16;
+        case ARM_CPU_MODE_IRQ:
+            return 18;
+        case ARM_CPU_MODE_SVC:
+            return 20;
+        case ARM_CPU_MODE_ABT:
+            return 22;
+        case ARM_CPU_MODE_UND:
+            return 24;
+        case ARM_CPU_MODE_FIQ:
+            return 30;
+        default:
+            g_assert_not_reached();
+        }
+    case 15:
+        return 31;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Handle exception entry to a target EL which is using AArch64 */
 static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
@@ -9591,6 +9652,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int old_mode;
     unsigned int cur_el = arm_current_el(env);
+    int rt;
 
     /*
      * Note that new_el can never be 0.  If cur_el is 0, then
@@ -9645,7 +9707,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_HVC:
     case EXCP_HYP_TRAP:
     case EXCP_SMC:
-        if (syn_get_ec(env->exception.syndrome) == EC_ADVSIMDFPACCESSTRAP) {
+        switch (syn_get_ec(env->exception.syndrome)) {
+        case EC_ADVSIMDFPACCESSTRAP:
             /*
              * QEMU internal FP/SIMD syndromes from AArch32 include the
              * TA and coproc fields which are only exposed if the exception
@@ -9653,6 +9716,34 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
              * AArch64 format syndrome.
              */
             env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
+            break;
+        case EC_CP14RTTRAP:
+        case EC_CP15RTTRAP:
+        case EC_CP14DTTRAP:
+            /*
+             * For a trap on AArch32 MRC/MCR/LDC/STC the Rt field is currently
+             * the raw register field from the insn; when taking this to
+             * AArch64 we must convert it to the AArch64 view of the register
+             * number. Notice that we read a 4-bit AArch32 register number and
+             * write back a 5-bit AArch64 one.
+             */
+            rt = extract32(env->exception.syndrome, 5, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                5, 5, rt);
+            break;
+        case EC_CP15RRTTRAP:
+        case EC_CP14RRTTRAP:
+            /* Similarly for MRRC/MCRR traps for Rt and Rt2 fields */
+            rt = extract32(env->exception.syndrome, 5, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                5, 5, rt);
+            rt = extract32(env->exception.syndrome, 10, 4);
+            rt = aarch64_regnum(env, rt);
+            env->exception.syndrome = deposit32(env->exception.syndrome,
+                                                10, 5, rt);
+            break;
         }
         env->cp15.esr_el[new_el] = env->exception.syndrome;
         break;
-- 
2.20.1

