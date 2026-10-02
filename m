Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBF2CA5FE2
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 17:59:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChX4-0005C8-95; Fri, 02 Oct 2026 13:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRh-0005W0-UY
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:27 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRe-0007kS-C9
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:21 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3510f6f130bso275335eec.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963596; x=1791568396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oqWBynXG48ziNIxkSUIKa6qk7Q6YVsPFUYwmt+pO3lo=;
 b=AKzboN9sK8xAD4cqOy/bCmZdw5epqdQ9+dN47Sxkf+wllNolxRp1KpOn1X3xhQo48p
 Q+Eb+zS1ssg4vuyHs+7+ELJzicWaMg1p2JBKMn31xYyC1pmGpORN1I4E2eVFrvzrkfRW
 gVCgVMVHFnauLgBhqHw6c5mLkhbBy1W9cabfHyiX78Z+1+Vv1kNzwM0Vw02JnmEiDRPx
 TPa6XlOV+3Nt/Q1tVP6XLcdG538F1wsMnVzfCdLmHxEOGWBH26P2bSGs0GUBhngggxoE
 HnXn/Ol5WnnqMxW1qzXPZD6liViAcGNqklRmrb90cSf0kihuvMP8WgAstMqaGCzvDI24
 PbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963596; x=1791568396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oqWBynXG48ziNIxkSUIKa6qk7Q6YVsPFUYwmt+pO3lo=;
 b=I+TuuhOKvd1KDmNYg9mirUQ55c/fBzU8LJcRMTfjO1EV8oPiiCIjOpeWwLpJrgJSeB
 FEV8RsH9LrWxrzaVi2t/BiXLAhEjzb3IF4h1jy0o30wlkZTrlCHWs2XIMQOwFvBxvIqy
 /1jBUVsOSpiP7BAp1DOUWImUWoz/7CB6UOn1UAlpAmWxgqi90Nyqd7ziaV/g25p2+5VL
 iWwb/D0j3ArrVbqVwgEltk7QHte1Lmq9AZKj8WqzksGCJ7az+vCig3k8w+rKPZb45ywG
 07XqaCXBoZJdXv96UUN/6vFVlwVhGp1sfswgUs0q5K9mes3KwjPO9ami7u25QIvJhy5X
 jprQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkAZcN8Dvylx0OkkwvxFuMTN3eBzNMRRcxbH9m/tWCcu7KQNHzoFA1fuRMVZGsBG/Dh5ohfMzJeQ==@nongnu.org
X-Gm-Message-State: AFq9FYJmCqv2wNXA+DhNQzK4LE4mXiutlnsu3YGvvPv/6CDuFVm0XaaY
 SH2ASKhxXa9/BR7dG8zxT2t3H0pvRemwZEEKPl2r2iIcoSTB00APqkws
X-Gm-Gg: AYBFou3QgjhtTzn8EnsAUYsTWiMBG1Y43LjxvKXTRPPL55zJrnxDKrCJ/GYrsQMBt3N
 CIXsAMgnGhJhA9SReRm3Uh9iXQfMSKUVRCaMzqGiYZ93HIzeHCZMnxouU/q/Gxgk5EPz8LCg3FO
 kfEppFsGeWzXQ8Wgr0erKWijtTwB+VZvYwgh1EqIXn8Sh3Sntk98SlNp2pDUmDf2Y2hOHGeAHZl
 s32gw7Ek8N2YBKhIrTh3aw+EtypmM0x3aMokBhiHRbyWpMRfwtHp0vtmJvtRYQDUlCaQqUvGGrl
 +dYq8RkqvRl8nBzLqTJR/rnrhIDsX/VLAF1cMXsJtphm8MKHl6t/6omxqLbV6Bkgv/z88Frst6z
 fQ15yG66RTc1+ff3QybIRSWBA78G1XzcBaD+UCcIZNAJ0GJ7gnDf9h5KeYBCAiLWXllx5ocRnNT
 0xci60M7usPKQxZNcsvzLm/rfayaTb+HSQeJ7z8G/7RbPw49MpEVuZWLdr9Pv9xHDxO8m4UQJ21
 XMsxJDBSI7ChH1Bt3u95JRFZYEtzZ4zHJyyjpetmQ==
X-Received: by 2002:a05:7301:fd82:b0:350:1d30:6c0f with SMTP id
 5a478bee46e88-3501d3072admr2819520eec.9.1790963595669; 
 Fri, 02 Oct 2026 10:53:15 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:53:15 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 19/27] target/xtensa: reset yield state in the icount path
Date: Sat,  3 Oct 2026 01:50:27 +0800
Message-ID: <20261002175037.1747-20-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Emit the yield_needed reset from gen_yield() before calling
gen_helper_exception() for EXCP_YIELD. This keeps the state change at
the Xtensa icount-yield call site instead of adding EXCP_YIELD-specific
behavior to the generic exception helper.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/xtensa/cpu.h        | 2 +-
 target/xtensa/exc_helper.c | 3 ---
 target/xtensa/translate.c  | 8 +++++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 49d6ad9083d..cab2df43709 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -541,7 +541,7 @@ struct CPUArchState {
     uint32_t ccount_base;
 #endif
 
-    int yield_needed;
+    int32_t yield_needed;
     unsigned static_vectors;
 
     /* Watchpoints for DBREAK registers */
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 7cb67d179a8..793761a698f 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -40,9 +40,6 @@ void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
     CPUState *cs = env_cpu(env);
 
     cs->exception_index = excp;
-    if (excp == EXCP_YIELD) {
-        env->yield_needed = 0;
-    }
     cpu_loop_exit(cs);
 }
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 175fd4b5cfc..db48f0c562a 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -303,9 +303,11 @@ static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
     dc->sar_m32_5bit = true;
 }
 
-static void gen_exception(DisasContext *dc, int excp)
+static void gen_yield(DisasContext *dc)
 {
-    gen_helper_exception(tcg_env, tcg_constant_i32(excp));
+    tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
+                   offsetof(CPUXtensaState, yield_needed));
+    gen_helper_exception(tcg_env, tcg_constant_i32(EXCP_YIELD));
 }
 
 static void gen_exception_cause(DisasContext *dc, uint32_t cause)
@@ -1167,7 +1169,7 @@ static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
        but this is the first TranslateOps hook that allows exiting.  */
     if ((tb_cflags(dc->base.tb) & CF_USE_ICOUNT)
         && (dc->base.tb->flags & XTENSA_TBFLAG_YIELD)) {
-        gen_exception(dc, EXCP_YIELD);
+        gen_yield(dc);
         dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
-- 
2.52.0.windows.1


