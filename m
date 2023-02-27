Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4288634ejc;
        Sun, 26 Feb 2023 21:27:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+w0rthXPY/RzSR9KFiJmh8lPNMzXeg6Gejf5KPp3UaonF9HkYNbtlpjM0fMYikq3N/AwcR
X-Received: by 2002:ac8:5e0a:0:b0:3b3:7707:9b92 with SMTP id h10-20020ac85e0a000000b003b377079b92mr24020787qtx.15.1677475674492;
        Sun, 26 Feb 2023 21:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475674; cv=none;
        d=google.com; s=arc-20160816;
        b=tTJ47VT+cESjGXB8fMFRVIMfeCu3W6HERG5vigEy5Uj7NC8U0QI0urAFh4wxppG31u
         WUTZBDJOiKnwmSs5RkBhBDqp9c9C69hu6pVPnfbxvVat3CEqnnyObPhUZ5mAbgfRjMr9
         Klzr1WqTeItId5rScfxc/XWCuKu/KvpXlq37F45vBPJLbGl7L2JHEirT0K0E9q4DasEO
         EiKCX0fi1RGRUwiDMTZ3u7x7n5JUzp5TTv0ZMxG7DC59JEqxK4mEgmAarFRd0Itsv9cE
         aMvFe6axU91fUkag0d26NBWK8kWchc5JUmb4yNAs9h4NRnyBOLPM62UosZGxosUOFpBI
         bNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D7Dr5dVd5BMP8VbVASryumiENZXah1Y2zUeyDZafQVk=;
        b=xFkQTfWIQm3y9MCiWalc9IMsA5Mk4XUaVx8tRabjePzdIEFCseFGVrmSLnfJ8m+Me/
         pKZcgf2+GlMeGtz8O84IokZxttHBr46JfswqDpLKqiODReLVOl50nRTixpyZUmPYrWxl
         TiKu69Ch3ytYDb2RUX9E1CGkEOC9Emgy7BsbdQs/BSviU0p8CC/y++QmCE29g5rPmnXm
         4LDycs/sQoK5ebWxISx92wVfEgmBDPCLhaeTdX52wR0FbMGXaNhxW48dkVXP7zhQY5qp
         I/O8fkuVTPp3d+pCZHALcgr/nN7yJsem4kd8kkAofTV23Qu+4u3kY8Euo8TqdfK3C1IX
         H+fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIwUmVtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020ac85dcb000000b003b63b7d442fsi5730556qtx.137.2023.02.26.21.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:27:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIwUmVtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW1B-0006rT-Go; Mon, 27 Feb 2023 00:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0o-0006eB-Nj
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:25:24 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW0i-00079c-RB
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:25:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so4143831plf.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7Dr5dVd5BMP8VbVASryumiENZXah1Y2zUeyDZafQVk=;
 b=AIwUmVtqm3EQWqE0nuArRl98xM3APLghad3m8L3hE5rrtJYNzonJWtFFfNEnAuTvII
 SiyuAV6LWAhVizYX3oMLoYAbskNCs89x5af4UVaHqUwak0O82e4trCLH3DjPiEN5PvRX
 AK0uk9b6l8dqnTruUVm+ZXYCDxNxq+xpSMzghVDCndGXp/lTV6KQe+aVkNHrMBl1eOS9
 3T578Xi0b1XjaM2gRLrCUkv7B3cvQ1ooC7XhazzyLKzVh1u+0PGq5XafZ/uiiFOaDOe2
 kGy7jDAhVloSh6Wi9pwjbpU6D/XDAb/dHzlU1A7kz+b178ZeMAxSq22Aox9oaYbKa41w
 GFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D7Dr5dVd5BMP8VbVASryumiENZXah1Y2zUeyDZafQVk=;
 b=mfpXlbZKFQMSTA1+/+0ReMH0vQe1PqRCCT/Q6H/YAt/Wp/rYqPdzsyy92uFuJqqG2I
 ZQiLlnFeJZUngcu1drhI/8CvyxRA/tgYz4BWHfVyG5Y9aRhiOSuC24xKHwq+QLZklplt
 PoaqQeimF0tuLkxEC77Bsx1obW1HUiiX1gqrBjZk4kw5zKeehCNfPVU/VSnhw+3BpTRl
 5D0UboWcOiipga0au3ff+wO/W4KcOLtsvJU456XDGQ+FaB0xithHFEKKFPvDqjEDfvLN
 MNvp2uCRGuBEyPDml2OEZLkK9IhuJbCgVil0uDvU9DgLw5U98n0Azwu9mm18GNy2p+MT
 GVGg==
X-Gm-Message-State: AO0yUKWh4O5jsqQ2CkJWCR+iBH8Q7RvSsdVhskem/JapVq5s4YYnMoRe
 C5PDJBFJIKumnL4ENe8XnLXJVE18tyCVonfRZjQ=
X-Received: by 2002:a17:902:f693:b0:19d:1e33:a60d with SMTP id
 l19-20020a170902f69300b0019d1e33a60dmr1212656plg.25.1677475512964; 
 Sun, 26 Feb 2023 21:25:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 01/76] tcg: Remove tcg_check_temp_count,
 tcg_clear_temp_count
Date: Sun, 26 Feb 2023 19:23:50 -1000
Message-Id: <20230227052505.352889-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yvSyAuP5SPkn

Since all temps allocated by guest front-ends are now TEMP_TB,
and we don't recycle TEMP_TB, there's no point in requiring
that the front-ends free the temps at all.  Begin by dropping
the inner-most checks that all temps have been freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h      | 14 -----------
 accel/tcg/translator.c | 12 ----------
 tcg/tcg.c              | 54 +++++++-----------------------------------
 3 files changed, 8 insertions(+), 72 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7e2b954dbc..e8f73115ec 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -567,7 +567,6 @@ struct TCGContext {
 #endif
 
 #ifdef CONFIG_DEBUG_TCG
-    int temps_in_use;
     int goto_tb_issue_mask;
     const TCGOpcode *vecop_list;
 #endif
@@ -958,19 +957,6 @@ static inline TCGv_ptr tcg_temp_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
-#if defined(CONFIG_DEBUG_TCG)
-/* If you call tcg_clear_temp_count() at the start of a section of
- * code which is not supposed to leak any TCG temporaries, then
- * calling tcg_check_temp_count() at the end of the section will
- * return 1 if the section did in fact leak a temporary.
- */
-void tcg_clear_temp_count(void);
-int tcg_check_temp_count(void);
-#else
-#define tcg_clear_temp_count() do { } while (0)
-#define tcg_check_temp_count() 0
-#endif
-
 int64_t tcg_cpu_exec_time(void);
 void tcg_dump_info(GString *buf);
 void tcg_dump_op_count(GString *buf);
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 62e8f28025..88567a88d1 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,17 +18,8 @@
 #include "exec/plugin-gen.h"
 #include "sysemu/replay.h"
 
-/* Pairs with tcg_clear_temp_count.
-   To be called by #TranslatorOps.{translate_insn,tb_stop} if
-   (1) the target is sufficiently clean to support reporting,
-   (2) as and when all temporaries are known to be consumed.
-   For most targets, (2) is at the end of translate_insn.  */
 void translator_loop_temp_check(DisasContextBase *db)
 {
-    if (tcg_check_temp_count()) {
-        qemu_log("warning: TCG temporary leaks before "
-                 TARGET_FMT_lx "\n", db->pc_next);
-    }
 }
 
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
@@ -67,9 +58,6 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     ops->init_disas_context(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    /* Reset the temp count so that we can identify leaks */
-    tcg_clear_temp_count();
-
     /* Start translating.  */
     gen_tb_start(db->tb);
     ops->tb_start(db, cpu);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index b65f2ffdbe..e3c0fa1012 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1272,7 +1272,7 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
             ts->temp_allocated = 1;
             tcg_debug_assert(ts->base_type == type);
             tcg_debug_assert(ts->kind == kind);
-            goto done;
+            return ts;
         }
     } else {
         tcg_debug_assert(kind == TEMP_TB);
@@ -1316,11 +1316,6 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
             ts2->kind = kind;
         }
     }
-
- done:
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use++;
-#endif
     return ts;
 }
 
@@ -1365,30 +1360,18 @@ void tcg_temp_free_internal(TCGTemp *ts)
 
     switch (ts->kind) {
     case TEMP_CONST:
-        /*
-         * In order to simplify users of tcg_constant_*,
-         * silently ignore free.
-         */
-        return;
-    case TEMP_EBB:
     case TEMP_TB:
+        /* Silently ignore free. */
+        break;
+    case TEMP_EBB:
+        tcg_debug_assert(ts->temp_allocated != 0);
+        ts->temp_allocated = 0;
+        set_bit(temp_idx(ts), s->free_temps[ts->base_type].l);
         break;
     default:
+        /* It never made sense to free TEMP_FIXED or TEMP_GLOBAL. */
         g_assert_not_reached();
     }
-
-    tcg_debug_assert(ts->temp_allocated != 0);
-    ts->temp_allocated = 0;
-
-#if defined(CONFIG_DEBUG_TCG)
-    assert(s->temps_in_use > 0);
-    s->temps_in_use--;
-#endif
-
-    if (ts->kind == TEMP_EBB) {
-        int idx = temp_idx(ts);
-        set_bit(idx, s->free_temps[ts->base_type].l);
-    }
 }
 
 TCGTemp *tcg_constant_internal(TCGType type, int64_t val)
@@ -1476,27 +1459,6 @@ TCGv_i64 tcg_const_i64(int64_t val)
     return t0;
 }
 
-#if defined(CONFIG_DEBUG_TCG)
-void tcg_clear_temp_count(void)
-{
-    TCGContext *s = tcg_ctx;
-    s->temps_in_use = 0;
-}
-
-int tcg_check_temp_count(void)
-{
-    TCGContext *s = tcg_ctx;
-    if (s->temps_in_use) {
-        /* Clear the count so that we don't give another
-         * warning immediately next time around.
-         */
-        s->temps_in_use = 0;
-        return 1;
-    }
-    return 0;
-}
-#endif
-
 /* Return true if OP may appear in the opcode stream.
    Test the runtime variable that controls each opcode.  */
 bool tcg_op_supported(TCGOpcode op)
-- 
2.34.1

