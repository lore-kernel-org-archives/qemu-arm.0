Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C2DC56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:32:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1wL-0004oE-Tl; Thu, 06 Aug 2026 13:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wK-0004mJ-6k
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:32 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1wH-0001g5-W5
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:31:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-384930ca5e2so2726442a91.3
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037488; x=1786642288; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=K4N8HT3l2MMFg8Dw0/FAdhE00eZq2YWh3+0qZEwprOM=;
 b=yAJnFZFnBiUXeDT2XtCloXPLs7yofan7Rq2104nffTkOhJ4fpTG1TsV2W7RTwk1FUd
 hO1HZDrxtB0dpLCHCheOqo+beKi1ITu19bf8y25J//xQHawpr4qIv/W3ppfqbXfaDFWx
 LsMIEmQ2WPARS/Bg14xkZ/yFsJ8XMxTaJGuUHrKrvD4n/Sicv53Q5Nnf8xCSQh2TbX4E
 bCUU9Cka77TevtNbEQBZWPKep8KcoVot7NGj756G2AcYplZAIklnUEcVxXos4t9RA2k6
 bEwxlkEMvpIWLE4BLc/nVV1b2hnm5dKI0LBoSdYD4Lwz5T52VFlH8JHLAFsd89+gIKKq
 dR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037488; x=1786642288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K4N8HT3l2MMFg8Dw0/FAdhE00eZq2YWh3+0qZEwprOM=;
 b=hpmHYG1hV1+EFBAifPpGBSZkIJkGGfeSMb75kWOYKf37mS0WqVE1dXma4YNbsYQXsa
 N4QNJG1Puok7LUVbXGU6mmX85T4Hbh9tHpKcTP8NhsS9M14D9b81hLC6W68XGUi3qDcr
 OgsPljdIDNqwhw84KDgiyE7v9ZX8V386YS9L+F158XdRNIJRVH6Y5OP59bRnTewbzdUU
 XzCuGAIDfFrJ3M1z+7v3xpC0eo1EBopdkjKz3Qge3Cju6gVN7OMeeeI5UdS0wAi21nt/
 ZwdPix4TFGi/T/EdtRi6qXctyGOl5yaLn9Hz0HeYMHaM8dmOPOZ9nHRYPr73BKm/Poq6
 muNQ==
X-Gm-Message-State: AOJu0YyR5w5GwDrTRirxS1uddBf3bYsg/LlD0ZwQZzQ/nyuySSc9So1F
 XkA4QbYXOBf0FTw7/xjplWxc22Tq8mBwhm5sysp2kivdJ5HUkeJ0rH2SvTcNtgRpno8=
X-Gm-Gg: AR+sD12woXrAk50H98ZyUoLkQEZFWOIe78X7VZxPzO54Gk0EwMD13cpyfuYhnsPuAEe
 W7mBgakSq55kUsP1Sgj6Da+lrmRcBHM8+BMIVT2jpoeF091vZScH53KKCqsyCN0H35dQo3okna9
 FtC4Cz42B9qlHsSOU4QJtIDnt2TCW2XhJo34GYrp76IVAaNSQbnL7bIBR3/JGzvRpCLfsoj+shO
 2jUhG7jQ5wsjml955BZMrxuUwB9POEjms1CB2/P+dsmT2Se4HnzdI8KmUuryLeCU2LkGbU7Wz3z
 1l47C3p4hb/3YkTvkdc21iJRKKDiWWdeOnAUjGbz2yLBZ1aav1V9nrOy/BWOiVZDTErKczhAkxc
 03WW4l58bUNptSLjevhF2IMWzhkzbT8g/eZiVQuA0bDg7J32m5B77l88j/PVuPy/GO5Oqs9LoDd
 GZFgFScV8C1YAkQ2VZ2bJexuxMtCia3lDP2sfIlS8ydqd/yvMsWZK4TJKfYiKQbuIBGXPHlSkca
 kwPpR/IdvKMw77oqF5bsKniiKLP+j8=
X-Received: by 2002:a17:90b:1843:b0:37f:bfa2:1887 with SMTP id
 98e67ed59e1d1-3903c53639amr18041847a91.8.1786037488273; 
 Thu, 06 Aug 2026 10:31:28 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085e4a2a5sm1983711a91.14.2026.08.06.10.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:31:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 4/6] target/arm: Implement SCR_EL3.TID3
Date: Thu,  6 Aug 2026 10:31:21 -0700
Message-ID: <20260806173123.333423-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806173123.333423-1-richard.henderson@linaro.org>
References: <20260806173123.333423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c        | 17 +++++++++++++++--
 target/arm/tcg/op_helper.c |  4 +++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ab0075628..854c8902b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5894,8 +5894,21 @@ static CPAccessResult access_v7a_tid3(CPUARMState *env, const ARMCPRegInfo *ri,
      * Any other registers in the TID3 trap space should use access_tid3(),
      * so that they trap on v8 and above, but not on v7.
      */
-    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID3)) {
-        return CP_ACCESS_TRAP_EL2;
+    switch (arm_current_el(env)) {
+    case 1:
+        if (arm_hcr_el2_eff(env) & HCR_TID3) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        /* fall through */
+    case 2:
+        if (env->cp15.scr_el3 & SCR_TID3) {
+            return CP_ACCESS_TRAP_EL3;
+        }
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
     }
 
     return CP_ACCESS_OK;
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 6d1feb5b33..a3486e87d5 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1201,7 +1201,9 @@ void HELPER(tid3_udef_el1)(CPUARMState *env, uint32_t syndrome)
         target_el = 2;
         excp = EXCP_HYP_TRAP;
     } else if (is_a64(env)) {
-        if (!cpu_isar_feature(aa64_idst, env_archcpu(env))) {
+        if (env->cp15.scr_el3 & SCR_TID3) {
+            target_el = 3;
+        } else if (!cpu_isar_feature(aa64_idst, env_archcpu(env))) {
             syndrome = syn_uncategorized();
         }
     } else {
-- 
2.43.0


