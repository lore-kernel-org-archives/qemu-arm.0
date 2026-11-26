Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DDB606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/l8JGAt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nq92V4o3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWi8X-0007At-Pg; Thu, 26 Nov 2026 17:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWi8V-00078H-E1
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 17:40:17 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWi8S-00010A-Fn
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 17:40:14 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwg9g782914
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 22:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vD0NUMsk2aoRNd+L9uNY2rv/alqR39ql27MARaMawbg=; b=h/l8JGAt4eXAVrkN
 +uivnE9xQVOkHG18XvB1Tc+m+9vz/dFDiwL0ZwEixjbWY5b+ZxvCAk1pmYw5xOr5
 tRs0plEFt7HU9TwBGoFbRxCtlz4LJDxf8HXJFuD4LqW9w7+Daet6ePQMUxbdXbay
 CG2eR+W2GDGlCbG1yykTWtCRY05ZR8nPfZVQvlmlVFMXqRBiINX3e6Mcv4B2qfjV
 TWwUcPa5ehNmW26YjqOC/e+ThemDZH3d4j9J6bNYrA7T+Du/iPcJ8EEN+wEsbSGH
 YZbtmWg7QnR9s8gUNJDyDEURsHU36DQPOkTLoi1A3tICskrkohy5WMCdi41JLPaA
 mgH2qA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm82hcq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 22:40:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f2005ce21so1153822385a.3
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 14:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795732810; x=1796337610; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vD0NUMsk2aoRNd+L9uNY2rv/alqR39ql27MARaMawbg=;
 b=Nq92V4o3uwyAo/x144gdU0Q/pq4bzT/mHEScYZy6xnfO+vPEAXCse6+berPJ/sBSo/
 VmPcVjv6JAX80tfG/AxdYxrxFSJLaCg6+pz61LtpwAiIa4vanJg4b6guSuMYNs+8Um0Q
 33XKCG8aaWYdN/W8ODPb8DOTIkGcm6QJcKZjh6aKgkOsDJQEPCo1K0GNbbVlD74YPmfL
 LTqkzGvcOmMIr2dAP0pIf8YCrPputS4LlGP1Lkpn4utACgq2dGTW8NSnjlEIQhoTglGa
 /RdCC6CyLWX2VraGxo/e/WMqxn1FLGhpeqVr0779SvdveQV0+S/uGXvCtFW/bnMa6GC7
 zTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795732810; x=1796337610;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vD0NUMsk2aoRNd+L9uNY2rv/alqR39ql27MARaMawbg=;
 b=sR2eE0qDaVLKtsjkIF2hEYYnH23t0EaW26AL3rE3XvqpRGG0mdMHrQAae3mMID6LBc
 WpiRSWH3dVJyW7//sOuxMY6pCsKNEi5Sd5T7ctmgiNAb/CWDBczTUArGuwxH7d1JjTJ7
 7jcxqIkwmZ7AviPCW0weAMo4ge3BYy6whwJcVzQYpvRE52quzwZ9yO5amww1SHjpI9zA
 Bt3d99+W1nJBeEK908kFUj3mZZS+97aonl5Oq+6AzB0lnszBpOzhd4Uib10a/b30JQgr
 E79D+YaRX2UGrmwR+lO6tuJtX0WMHLFlvhDMBczk3EE/sXgpqLcpmfTnCWy2orn2CLBS
 ESkg==
X-Forwarded-Encrypted: i=1;
 AL+hErGpfal3+GV9Bl1LhrlCQc2+Td9YKF/m+YKIrTcAgWNTYo8gToImeHXBKVBQDJsNGqw3YXVposbYgg==@nongnu.org
X-Gm-Message-State: APuU4Z8MIMy1v93lakp7t6liH8v28ZgeSfLMVEz+8IR35iv0TTt7Dr/y
 m1PAlqhTWjZhI+odkvrlUVlQvBlwxwwoOP9wXwBvmYGVLCYyU+AYJCpGSKDSAJQR1+DqWthJcMS
 SeE8vt/vp5eJ2i3iQWWawn24n3Qi2wiTdjbWe5W7YIi9i1YS5UX1wBvA=
X-Gm-Gg: AZFdTZclM5WXYB5HdoA0E8jDy+gyDOreiRV7LS2uqhbWvTldZcG9Yf+KgXK2iZM0EJ7
 EmU3Hw8zKhNY5APCqQKtVQPO54PaB6NmjJbmkPPVT4WVea94MfA7ydkEslyPeIP0sG4vVy+ccVB
 qed5iDQ9X56CuT9PXkC4RLBsA3jpqpZmRRIsJSNLddrdNkzKXH/IVmKKJKEgvMtiYHtPCh8dNIs
 tljk2Nx0oEeik76cmsKDFDtYxzmOkpnn8OlzCMSqgKfxV4N/W67X2cbfa7PcvxwUPkcCI4UrwFK
 M7LJW77VokUdYedyh4hYAqPJsEjFB3JL3oQWOV9pGcUJ4PmX/q/zFCjBUvmLLo14XZ/VeupEJD9
 RjtSG/SB4v0BC4g0OVDiNxme/A4C/r9pb86Sa2lKrReNCaXk8O1cW4VQdVWSQtuZK5VOm1/TNdQ
 JAUgerSGW6y6yx3Q==
X-Received: by 2002:a05:620a:6910:b0:944:12d5:fd45 with SMTP id
 af79cd13be357-949bab2a96bmr4058597685a.70.1795732810182; 
 Thu, 26 Nov 2026 14:40:10 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:944:12d5:fd45 with SMTP id
 af79cd13be357-949bab2a96bmr4058592885a.70.1795732809662; 
 Thu, 26 Nov 2026 14:40:09 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm575771775e9.1.2026.11.26.14.40.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 14:40:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 1/2] target/arm: Split ARM_CP_IO as ARM_CP_IO_ENDTB +
 ARM_CP_IO_BQL
Date: Thu, 26 Nov 2026 23:39:58 +0100
Message-ID: <20261126223959.62899-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126223959.62899-1-philmd@oss.qualcomm.com>
References: <20261126223959.62899-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Si9ZVMfvxb5cEgIolO5XLJQI2cNwMRUI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4OSBTYWx0ZWRfX/QLqPZhFbpEE
 58T3eqR7S6Pl8xvhDH4c/q5Un63OfgPLcRpIPOq7oqoJdZVKVnkY5JQvQXaaJ+4n8DPqYlLdQlU
 vqZ3ig2RvSP3POfaoQUATYtrfmnb2Ss=
X-Proofpoint-GUID: Si9ZVMfvxb5cEgIolO5XLJQI2cNwMRUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4OSBTYWx0ZWRfX56u1uNHcLqZk
 xCp6+0yVTlpDAKaIm3n/C2exLAoVBziA+j96mLjrey477PbPzY3V3OGgCSXnroyLSi/9fy9fAKJ
 HKSDm2sZDUFnmthK6ApuD20mjOS97z0Zpc7UFE83H8dTe4E+/K8AYG9dPmLmwnFtctHDZ4M1Ixf
 X+zypsEn01l5WPYdIiw1DD5fTTO3xeHpUo8C5CE11nWNoOoLrp/kEKiil2ukiskQOXRYbMR7A+w
 iRYXrdSCLsfXdJyPy515TzvkMQJxpQqoITkHhz2YAl5wVV+7EGvkyH6JE9l2MCZ0uiQQzbKjKlo
 FSkzat3du+0VvDpHitvu9yGBmXSMyv4NGiA9nZxmP1L42A1SHt3J3yry/KDE2BoCowryDvrxvhv
 ltERoO7bK09Vy6ysJsvCfHNqUECB2RL6f7ih9KDFKU0LPAsgFYtSqv8rfpisvsPUzy10vPVdflO
 6J4If0w73+T3kRRszew==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08b54a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eMEwkG4JCehlSojaR3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260089
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ARM_CP_IO both ends the TB at translation and takes the BQL
around the read/write hooks. Split it into two flags so a
register can end the TB without taking the BQL. ARM_CP_IO is
now their union, so existing users are unchanged. Update
multi-thread-tcg.rst document. No functional change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 docs/devel/multi-thread-tcg.rst |  8 +++++---
 target/arm/cpregs.h             | 11 ++++++++++-
 target/arm/helper.c             |  4 ++--
 target/arm/tcg/op_helper.c      |  8 ++++----
 target/arm/tcg/translate-a64.c  |  2 +-
 target/arm/tcg/translate.c      |  2 +-
 6 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index da9a1530c9fa..22d760ce3729 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -240,9 +240,11 @@ minimise contention.
 (Current solution)
 
 MMIO access automatically serialises hardware emulation by way of the
-BQL. Currently Arm targets serialise all ARM_CP_IO register accesses
-and also defer the reset/startup of vCPUs to the vCPU context by way
-of async_run_on_cpu().
+BQL. Currently Arm targets serialise all ARM_CP_IO_BQL register
+accesses (included in ARM_CP_IO) and also defer the reset/startup of
+vCPUs to the vCPU context by way of async_run_on_cpu(). Registers only
+marked ARM_CP_IO_ENDTB, such as the generic timer counters, end the TB
+but run their accessors without the BQL, so these must be thread-safe.
 
 Updates to interrupt state are also protected by the BQL as they can
 often be cross vCPU.
diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ce651a4faa60..d9efb9fd6b75 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -82,8 +82,10 @@ enum {
      * Flag: Register does I/O and therefore its accesses need to be marked
      * with translator_io_start() and also end the TB. In particular,
      * registers which implement clocks or timers require this.
+     * Without ARM_CP_IO_BQL, the read and write hooks run without the BQL
+     * and must be thread-safe.
      */
-    ARM_CP_IO                    = 1 << 9,
+    ARM_CP_IO_ENDTB              = 1 << 9,
     /*
      * Flag: Register has no underlying state and does not support raw access
      * for state saving/loading; it will not be used for either migration or
@@ -154,6 +156,13 @@ enum {
      * ARM pseudocode function CheckFPMREnabled().
      */
     ARM_CP_FPMR                  = 1 << 23,
+    /*
+     * Flag: The read and write hooks are called with the BQL held, e.g.
+     * because they touch timers, interrupt lines or other cross-vCPU state.
+     */
+    ARM_CP_IO_BQL                = 1 << 24,
+    /* Flags: Register does I/O and its hooks need the BQL */
+    ARM_CP_IO                    = ARM_CP_IO_ENDTB | ARM_CP_IO_BQL,
 };
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f413b15eb747..198ffc69aeac 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3976,7 +3976,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
      * virtual interrupts, which are the logical OR of these bits
      * and the state of the input lines from the GIC. (This requires
      * that we have the BQL, which is done by marking the
-     * reginfo structs as ARM_CP_IO.)
+     * reginfo structs as ARM_CP_IO_BQL.)
      * Note that if a write to HCR pends a VIRQ or VFIQ or VINMI or
      * VFNMI, it is never possible for it to be taken immediately
      * because VIRQ, VFIQ, VINMI and VFNMI are masked unless running
@@ -4179,7 +4179,7 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * virtual NMI, which are the logical OR of these bits
      * and the state of the input lines from the GIC. (This requires
      * that we have the BQL, which is done by marking the
-     * reginfo structs as ARM_CP_IO.)
+     * reginfo structs as ARM_CP_IO_BQL.)
      * Note that if a write to HCRX pends a VINMI or VFNMI it is never
      * possible for it to be taken immediately, because VINMI and
      * VFNMI are masked unless running at EL0 or EL1, and HCRX
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index c2fdad7411db..c070aeee0f32 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1244,7 +1244,7 @@ void HELPER(set_cp_reg)(CPUARMState *env, const void *rip, uint32_t value)
 {
     const ARMCPRegInfo *ri = rip;
 
-    if (ri->type & ARM_CP_IO) {
+    if (ri->type & ARM_CP_IO_BQL) {
         bql_lock();
         ri->writefn(env, ri, value);
         bql_unlock();
@@ -1258,7 +1258,7 @@ uint32_t HELPER(get_cp_reg)(CPUARMState *env, const void *rip)
     const ARMCPRegInfo *ri = rip;
     uint32_t res;
 
-    if (ri->type & ARM_CP_IO) {
+    if (ri->type & ARM_CP_IO_BQL) {
         bql_lock();
         res = ri->readfn(env, ri);
         bql_unlock();
@@ -1273,7 +1273,7 @@ void HELPER(set_cp_reg64)(CPUARMState *env, const void *rip, uint64_t value)
 {
     const ARMCPRegInfo *ri = rip;
 
-    if (ri->type & ARM_CP_IO) {
+    if (ri->type & ARM_CP_IO_BQL) {
         bql_lock();
         ri->writefn(env, ri, value);
         bql_unlock();
@@ -1287,7 +1287,7 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, const void *rip)
     const ARMCPRegInfo *ri = rip;
     uint64_t res;
 
-    if (ri->type & ARM_CP_IO) {
+    if (ri->type & ARM_CP_IO_BQL) {
         bql_lock();
         res = ri->readfn(env, ri);
         bql_unlock();
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 14888202bada..7006f2c8ae8c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3236,7 +3236,7 @@ static void handle_sys(DisasContext *s, bool isread,
         g_assert_not_reached();
     }
 
-    if (ri->type & ARM_CP_IO) {
+    if (ri->type & ARM_CP_IO_ENDTB) {
         /* I/O operations must end the TB here (whether read or write) */
         need_exit_tb = translator_io_start(&s->base);
     }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 9d80294c9bb2..92762a813b5f 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1893,7 +1893,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         g_assert_not_reached();
     }
 
-    if (ri->type & ARM_CP_IO) {
+    if (ri->type & ARM_CP_IO_ENDTB) {
         /* I/O operations must end the TB here (whether read or write) */
         need_exit_tb = translator_io_start(&s->base);
     }
-- 
2.55.0


