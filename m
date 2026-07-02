Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF03CC43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:40:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMKu-00072I-4L; Thu, 02 Jul 2026 14:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMKp-00070a-K2
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:28 -0400
Received: from mail-wm2-x02.google.com ([2a00:1450:4864:31::2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMKn-0005LE-KN
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:27 -0400
Received: by mail-wm2-x02.google.com with SMTP id
 5b1f17b1804b1-493b7dd83e8so3748105e9.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017624; x=1783622424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/smHpawLC6pjs6R1RHEYZB+tbgVHOzf/9JVxHNkNUWQ=;
 b=cjjsJ6rG+DzpIB0mMDRWcq6lyICZzpKMtyf/UdaWODcFOUSjzY4BV4lfuI78Rpv6LJ
 kZ/vM3oyYevgf9T1GhJJql2GSIM8mTmcMK7OpTvKPPqwQI1PZL13Fz1YFVqUb/mi0UW7
 /GC1/G+NmA4ye9lbGFf1I5KkhnMw/AU7H7iWJbTaq0oNSIfbc0/ruLYtlvQecuIMCabx
 972VpeMw7zUQ5tx8WsUGadkK7rrR3yCMXbxYkJHKcGFlG3j3VRpUV7JtqYxS95ZkShIO
 IRnsuD2kUFMmYcuwJufaNDZ076RvegeWJqIEgvgWepNTdXbOLBYQbeeAiRwbKmRUwIle
 NIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017624; x=1783622424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/smHpawLC6pjs6R1RHEYZB+tbgVHOzf/9JVxHNkNUWQ=;
 b=WBKn/musL77H5EpYfKJNv+3wHj8+2TIPmzqzV8OmERr2JYF4IxvQHln0cSQnFqOZql
 zhXUxJFVexg/IFGiJFUOg8sr9tXtnAqh0/v97+klXgn9A7Q9y1U1E4NGa54c2rv5mVWJ
 JaPsajquqL5FGtXgcAc1HSfoNslN88gWfvSNgrwDNXLo1lVut6XbrAJP0QSkiOpylqAC
 1A6BJP5ieUvhSKRKLXtLr6BNv1sCWmalkh94krcAcuy4LJOs9JPnRhLTC+Nl8Re99pMW
 4i5AqEMQvpV3+eZkNPdLK0vzYREfInidy6039XeEDhMruf3PpnMExGa0Ve130e/0E+T/
 bo2w==
X-Gm-Message-State: AOJu0YyxJFUZ+91kikCqnJBgEx8JOPZCRkgc+FO+jXnzc7Zq4RUg2J8/
 pFg6Ven0oBdNEWLcTJaKvCEYbNIObpePQHRLATW70KY4BlbT6dwXoq1PRhvkx+fB6eHMh7mm7s8
 YHr6F/jHAdNFe
X-Gm-Gg: AfdE7ck++VlzCUtLTh5EZleHBVEgZl901kqi7rz9Q4+wslneU/7yRBAjdwCGOnMztXd
 oA3iDOe+o/T8i3FFCz+A2OE/RpKGsMh7gpdDkCCuA6wgWJ+bRncsQ/f2CjogEDhufAY6dcGk/KQ
 PVbjxbAXXypzHaHtXeS9/Gh020TxA+JprlK7B88IjBAWMQBtUw4E11U9dhv9fqTOZGWTg3/xCa9
 pDBreOX6IVEzs1o7qTE1VUY2/t8Vli4J9PTU/nG1ym5RXq5TtQKMQA7DtrsK1pDzXA3JV2UEf/m
 fZN+9aq6SZly8VRzx6ezuL5avh1mZ/vq/XdsaqJ+IfYyDgBsf+/hkvC4ZaCfL1+feIt1+v1OIB7
 IPIgjeqseV+lTzVor7Wp8bwGvzKpgk+lxSlXrGS7vFN/0g61MFerofvOtL7TRGJxXt2GacsSCj+
 ohDB5Is5Qg3Ro1PJdF8YaOEk2pwJuDtwj2ZxuVM+Uzbq8KFNFPKbXlJQo43WxVeVLvLMaW33eR4
 6xOFYj0H8q6LRMdlMc/Wg==
X-Received: by 2002:a05:600c:5292:b0:492:3754:15f2 with SMTP id
 5b1f17b1804b1-493c3cfbc7amr97187185e9.32.1783017623783; 
 Thu, 02 Jul 2026 11:40:23 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/11] target/arm: Report correct syndrome to AArch32 EL2 for
 trapped Neon/VFP insns
Date: Thu,  2 Jul 2026 19:40:11 +0100
Message-ID: <20260702184019.3431139-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::2;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm2-x02.google.com
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

When an AArch32 Neon or VFP insn is trapped to AArch64 EL2, bits
[19:0] of the syndrome in ESR_EL2 are RES0.  However, when it is
trapped to AArch32 EL2, the HSR syndrome information defines some
extra fields:
 [5] : TA
 [3:0] : coproc

where the TA bit is 1 for a trapped Neon insn and 0 for a trapped
VFP insn, and the coproc field is 0b1010 when TA is 0, and 0 when
TA is 1.

We attempted to address this in commit fa33eead ("target/arm: Add
coproc parameter to syn_fp_access_trap"), but got it wrong: we
thought the RES0 condition was "is v8A" rather than "is EL2 AArch32",
and we made all insns be TA=0 coproc = 0b1010 rather than only the
VFP ones.  Correct the condition we use to decide the coproc and TA
fields.  We set these fields unconditionally; later on in
arm_cpu_do_interrupt_aarch64() we will squash them to zero if we are
taking the exception to AArch64.

NB: there is some disagreement between different revisions of the
Arm ARM about the exact handling of 'coproc':
 * the v8A Arm ARM text says coproc is 0b1010 when TA is 1
 * the v8A Arm ARM pseudocode in AArch32_CheckFPAdvSIMDTrap()
   sets coproc to 0b1010 when TA is 0
 * the v7A Arm ARM text says coproc is 0b1010 when TA is 0
 * the v7A Arm ARM pseudocode sets coproc to 0b1010 when TA is 0

The v7A Arm ARM pseudocode also disagrees with the v7A text, v8A text
and v8A pseudocode in only setting TA to 1 for traps caused by
HCPTR.TASE; the others set Ta for all trapped AdvSIMD insns
(i.e. including traps caused by HCPTR.TCP10).

We assume that the v8A pseudocode is incorrect about coproc (as it is
the odd one out) and that the v7A pseudocode is incorrect about when
TA is set (again, as it is the odd one out).

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1153
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-vfp.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 7474973952..6e944a0322 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -216,19 +216,20 @@ static void gen_update_fp_context(DisasContext *s)
  * whether VFP is enabled via FPEXC.EN: this should be true for FMXR/FMRX
  * accesses to FPSID, FPEXC, MVFR0, MVFR1, MVFR2, and false for all other insns.
  */
-static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
+static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled,
+                               bool is_neon)
 {
     if (s->fp_excp_el) {
         /*
-         * The full syndrome is only used for HSR when HCPTR traps:
-         * For v8, when TA==0, coproc is RES0.
-         * For v7, any use of a Floating-point instruction or access
-         * to a Floating-point Extension register that is trapped to
-         * Hyp mode because of a trap configured in the HCPTR sets
-         * this field to 0xA.
+         * The full syndrome is only used for HSR when HCPTR traps.
+         * When trapping to AArch64, the TA and coproc fields are RES0
+         * (we will squash them in arm_cpu_do_interrupt_aarch64()).
+         * When trapping to AArch32:
+         *  - for VFP insns, TA=0 and coproc = 0b1010
+         *  - for Neon insns, TA=1 and coproc = 0
          */
-        int coproc = arm_dc_feature(s, ARM_FEATURE_V8) ? 0 : 0xa;
-        uint32_t syn = syn_a32_fp_access_trap(1, 0xe, 0, coproc);
+        int coproc = is_neon ? 0 : 0xa;
+        uint32_t syn = syn_a32_fp_access_trap(1, 0xe, is_neon, coproc);
 
         gen_exception_insn_el(s, 0, EXCP_UDEF, syn, s->fp_excp_el);
         return false;
@@ -299,7 +300,7 @@ bool vfp_access_check(DisasContext *s)
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
         return vfp_access_check_m(s, false);
     } else {
-        return vfp_access_check_a(s, false);
+        return vfp_access_check_a(s, false, false);
     }
 }
 
@@ -311,7 +312,11 @@ bool vfp_access_check(DisasContext *s)
  */
 bool neon_access_check(DisasContext *s)
 {
-    return vfp_access_check(s);
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return vfp_access_check_m(s, false);
+    } else {
+        return vfp_access_check_a(s, false, true);
+    }
 }
 
 static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
@@ -822,7 +827,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
      * Call vfp_access_check_a() directly, because we need to tell
      * it to ignore FPEXC.EN for some register accesses.
      */
-    if (!vfp_access_check_a(s, ignore_vfp_enabled)) {
+    if (!vfp_access_check_a(s, ignore_vfp_enabled, false)) {
         return true;
     }
 
-- 
2.43.0


