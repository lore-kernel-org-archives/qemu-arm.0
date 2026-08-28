Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BDBC61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:27:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x052I-0002r9-UC; Fri, 28 Aug 2026 18:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052I-0002q0-4t
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:58 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052F-0002KO-2b
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:57 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2caced6038eso16090055ad.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956009; x=1788560809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c3prOMqPHLIQmXgwFNllZn8rehgch0RbINfq/i5tMyY=;
 b=KvQLtlO5usCcGXAas8GbRqL776w9litSjoSPeCXf9scYI03MOSPgbkIuSgcuMizx3r
 Df99Qq0/75nt6XKmR/xirGYfptnlBNYIWa8zt838ZccK8IvS+/V4K0WbkYuJVozbSMEl
 ucvsIsOARcdpmBp9vZ7oLrUDzDRMnnvEE1NJwaQjNlyLcBq7ozqXchWyaJ/Q/1bIiTrU
 CsxAz6+05mZyDg1WpBkEJ1x8KU5MuypdnO+hbv3kBDQJzzp0JJvPzxjaQxPDXOry6za6
 +tOghy7ltluZ7DUibDIKNgjKPSJ70ZCKakHqB3tCyoUvMn2ohCAulTRc6m9+BZn2CXJI
 MenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956009; x=1788560809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=c3prOMqPHLIQmXgwFNllZn8rehgch0RbINfq/i5tMyY=;
 b=Y5QMKDc/DCN9xxD4fDInuQpSDkhbiVnnzzvj43v17HxsB7fmjShdRo4qtAGleidKbj
 IyJg3xJaleRMKVs93yAeIIsilU4zP3WnpOAOvlehlQSLxhr+VCWUwbMoy9wtCjuMquiJ
 b+LdLCDNplTVeDZjV/j4SUpfNFARCAvHcj/DM34pkPqJPAHYBuuk4k/uQFfSgGZDG9PF
 FTeDn0968kjx6wheQtDSFHHQh8o9rSR5hY4QHF+KI4BzkJGlbLJdYmo4JacQXxMaD0+b
 QP9H3Zn7oI3DYZqnh2XGTfhNSWqFxGaF/+02FFl2dDYS6sqnRh5xfYQ/Wr/Dp2jEYMQm
 Y/MA==
X-Gm-Message-State: AFuF++nteywLaHQd8w0i7XYIBpHGfYhqe+Guf3wCk7/bCsgmujSOp8W9
 h37DmYTCCzlaB5nOyS2tAIu19E/B+ox8CI0aQ2V7x3rGG9G+0GWIa4NgX72l7oIdjws=
X-Gm-Gg: AYBFou1B0AukUUL500Vuf5jg5nqPy89+QRCBDVzi8VoibNotlzW/RiQF4c9ZGld0POL
 dO8Sir/sMNHqw8JxJlOwMk/HDzRNzemcsq/sohN4m0jJ/g0N3yk1UOYkBPQbfDP3cN99FhpMCfv
 DLv4C2hYuGfLL+OezkpnSZwNdo51keyNRBrn9qJ93L8IfyuhktL8QnbWgDi3sjd+oHLV2yAa3lp
 kB6IcrT/13vd/FyQTcRDRWZUu45umQCALdYTrP1donrMlIuDoqGcldWulYxHqBBo0ydY0r0ISXo
 T4kUwoD/ZKEv1zoYTEwtfy5dLvMVMVMFEAXxgNuQW2GEWXBh0LiI06YHr2+dj6jt55i4mk3TuWW
 hz2DdQsVNETJ5Qe1u1ZqK0JobC15o9+gbN2nKXmnyGiYFRnx6Hpw771nb1PpiBfA3DrLblRA4to
 abGcQjPp+/a9ETftOGuScbWGLqNcCMCyF0EiWaqmABcK4I7KNeRdSQdJ9/tSPEdpma1PNUq91mO
 7zalh29xqmT3dyarE+P
X-Received: by 2002:a17:903:3504:b0:2cf:8aa7:7810 with SMTP id
 d9443c01a7336-2d8d4a0176fmr27776185ad.2.1787956008963; 
 Fri, 28 Aug 2026 15:26:48 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/13] target/arm: Read and write PSTATE.UINJ
Date: Fri, 28 Aug 2026 15:26:36 -0700
Message-ID: <20260828222639.1432046-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

With FEAT_UINJ, allow PSTATE.UINJ to be set from aa64 and aa32 modes.
Read the value back for SPSR_ELx from aa32 mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  3 +++
 target/arm/helper.c    | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 69c9256984a..eac1f7f379d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1392,6 +1392,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_nmi(id)) {
         valid |= PSTATE_ALLINT;
     }
+    if (isar_feature_aa64_uinj(id)) {
+        valid |= PSTATE_UINJ;
+    }
 
     return valid;
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e6b16eade76..a4a7fa69ff1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9362,8 +9362,9 @@ uint64_t cpsr_read_for_spsr_elx(CPUARMState *env)
         ret &= ~CPSR_DIT;
         ret |= PSTATE_DIT;
     }
-    /* Merge PSTATE.SS into SPSR_ELx */
-    ret |= env->pstate & PSTATE_SS;
+
+    /* Merge PSTATE.{SS,UINJ} into SPSR_ELx */
+    ret |= env->pstate & (PSTATE_SS | PSTATE_UINJ);
 
     return ret;
 }
@@ -9372,6 +9373,14 @@ void cpsr_write_from_spsr_elx(CPUARMState *env, uint64_t val)
 {
     uint32_t mask;
 
+    /* Save SPSR_ELx.UINJ into PSTATE. */
+    if (unlikely(val & PSTATE_UINJ)
+        && arm_feature(env, ARM_FEATURE_AARCH64)
+        && cpu_isar_feature(aa64_uinj, env_archcpu(env))) {
+        env->pstate |= PSTATE_UINJ;
+        val &= ~PSTATE_UINJ;
+    }
+
     /* Save SPSR_ELx.SS into PSTATE. */
     env->pstate = (env->pstate & ~PSTATE_SS) | (val & PSTATE_SS);
     val &= ~PSTATE_SS;
-- 
2.53.0


