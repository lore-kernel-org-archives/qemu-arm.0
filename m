Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0922D34093
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 15:48:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vklIy-0006aA-Mu; Tue, 27 Jan 2026 10:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vklIi-0006WC-FA
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 10:48:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vklIg-0004Df-Lp
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 10:48:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-432d256c2e6so5614666f8f.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769528897; x=1770133697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPYP5U+UfNkavTiIH/9PNOqdVOh5XQtwthn7JFvkCcc=;
 b=mXSywZnyVsOCdJWljSv0xWeVI2z9cayUxw1DQyXy3vIJjhMjal8mDfyPCEXlYOYTs3
 Mseys2LCEHERIwfKs3bupyEV/xCpwPZCsYkYRjR4+XhNAKRT4peZdEW73a0pc0R4vCuE
 PaKdpvOppgZpdO4K4wL15x0w483NxrwhXyFsbV4FhvTdf0XnlWrgdUH96RNrWgv1iLqC
 etlX9Ji3Y8rtfeSF1U5Sg3epq3//Jhe+3FQKRMAwAasTtF39lqiA7qfKL4BAMpTSBWPK
 gY7IQNWkVotDBB5+RS/tct0eHh66BkqwaiXvP735BcxZJe4aNpU93edf9o7CW3MsRCf6
 UcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769528897; x=1770133697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QPYP5U+UfNkavTiIH/9PNOqdVOh5XQtwthn7JFvkCcc=;
 b=xOyzB2MtKUcunBIr/c5958CJJatOwdzyJv3gaPn36v9Q48YQxKLmk+AHFHudsJj23V
 gLCeqeLeUJE/Wksd03HWqVmH6HS7j0hHEZEREYNEXMsE436eLa0dzjx2fmRBAHHRREAL
 yuZEBj/hSmYvUgQygopaoLqOsk3roaLPEfZ/POaKWHyR+z49r362xQhHl2D06adCenUp
 FfxTKMtvGB6BPnCmyMrIskl5o/iByxzSwIWBVNjRVWsaCQsR6s3JY5NL49ETBBizlY1R
 1mP1zuCoFNU3q/l+DJGQAtyzY5y0C4vPFx8i7Qjr0YUnVHm6RrUV6F7GTdIxysYNMRKG
 lY3Q==
X-Gm-Message-State: AOJu0YxXMRAt/gI+J8Zbfs/XQsLeFX9p2Y5F7S1VUWof4APKIn+POYSA
 kPlyIyrS2HjuK19lvbHRsSaWTGGvfWAT0jX6gSwiIlKUeytLZ+YbJFhuaXr1pw/JWgKPMjb4zLE
 XSY22FuE=
X-Gm-Gg: AZuq6aJE53RqOEp2jpQGXtibIxHzsPM45F7/thu/Qxkdrwl2v3XxNLHx3Lsg639B3fY
 jD2Rciq42G3efsD61A7GszTtKnniXxHKMUQ8+zi9rNKvEgyLCXcX+QHD5i6DZZ1VHO00wEQ5U8i
 uEjX0ZyfMD5EA4lcS0SnRTLWQVilH7PlEzZIbXe81p78LEfaUGKfXfuwy4gWQuj3PyShU8xkDgF
 9hQwZplppFRMFiSRvp3s0cRtnHDhTDpNT4P2fuxx3ZZ8DJgUDNQ0CGVlHCAH24/ttIeZHSSMfAA
 PA82NPmy0zPcA+MryB4HjlrtyijQauFzwmMECtm4l2+nYWNU5Y2JLcztFRxMV1ioXcBM5ERsj4F
 lipdaZriQxauOhYxJPoZjf6phKcbSSjfWrvHJH2zSI5+hhC9ZFo50JelQrBM9gRPHE6TQ+mhvU1
 MODMUrcusOLppRDqSVTMkzhV/D3Gczbg==
X-Received: by 2002:a05:6000:248a:b0:435:a363:f2a4 with SMTP id
 ffacd0b85a97d-435dd1c0c98mr3090459f8f.34.1769528896814; 
 Tue, 27 Jan 2026 07:48:16 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71503sm43080090f8f.25.2026.01.27.07.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 07:48:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH 1/3] target/arm: Make smcr_write() handle SME-without-SVE
Date: Tue, 27 Jan 2026 15:48:11 +0000
Message-ID: <20260127154813.591744-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127154813.591744-1-peter.maydell@linaro.org>
References: <20260127154813.591744-1-peter.maydell@linaro.org>
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

Currently smcr_write() implicitly assumes that SME implies SVE,
because it will call sve_vqm1_sve_for_el() when SMCR.SM is 0, and
sve_vqm1_sve_for_el() will assert in that situation.

This is the only place where we call that function without
it being guarded by a check on whether SVE is implemented.
Adjust smcr_write() so that it also avoids asking for the
SVE vector length when SVE is not implemented.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I did think about making sve_vqm1_sve_for_el() return some
value rather than asserting, but (a) what would be the right
value? and (b) this was the only place that needed fixing.
---
 target/arm/helper.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dce648b482..a3dd84a2d6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4936,12 +4936,12 @@ static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_vqm1_for_el(env, cur_el);
+    ARMCPU *cpu = env_archcpu(env);
+    int old_len = cpu_isar_feature(aa64_sve, cpu) ? sve_vqm1_for_el(env, cur_el) : 0;
     uint64_t valid_mask = R_SMCR_LEN_MASK | R_SMCR_FA64_MASK;
-    int new_len;
 
     QEMU_BUILD_BUG_ON(ARM_MAX_VQ > R_SMCR_LEN_MASK + 1);
-    if (cpu_isar_feature(aa64_sme2, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_sme2, cpu)) {
         valid_mask |= R_SMCR_EZT0_MASK;
     }
     value &= valid_mask;
@@ -4953,10 +4953,17 @@ static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * current values for simplicity.  But for QEMU internals, we must still
      * apply the narrower SVL to the Zregs and Pregs -- see the comment
      * above aarch64_sve_narrow_vq.
+     *
+     * If the CPU has only SME and not SVE, then turning streaming mode
+     * on and off can't ever change the SVL; we must avoid calling
+     * sve_vqm1_for_el() to ask for the SVE vector length when SM is 0
+     * because it will assert.
      */
-    new_len = sve_vqm1_for_el(env, cur_el);
-    if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        int new_len = sve_vqm1_for_el(env, cur_el);
+        if (new_len < old_len) {
+            aarch64_sve_narrow_vq(env, new_len + 1);
+        }
     }
 }
 
-- 
2.43.0


