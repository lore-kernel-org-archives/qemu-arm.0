Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1607836lfg;
        Sun, 20 Jun 2021 18:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL10t0qcWKS/zSrWlVn1/asBL4pDXvGR+Os9kjYl5UrItUxAIBZMlRjEfggB/wYHlHwP21
X-Received: by 2002:a05:6e02:1ca5:: with SMTP id x5mr15252610ill.139.1624239719030;
        Sun, 20 Jun 2021 18:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624239719; cv=none;
        d=google.com; s=arc-20160816;
        b=KrFiGBa+n6AHGRHl74XCcdIsCWsLBr68cbnd75ltAOj1NC2fF/KQu1uYik4ly2SYUu
         cZjKvu8RLKGG4MQoQtRcAeYcuSg0oVS7JCh7oHwBJqij/D3ErgyESnW/1Hi4lwrDnsnj
         gn7GeA1dDd4/SOJoISfUEbVo31ZmfTFvmWOp//z1Xn/b/yOeHy5vvPlKR2kTsN/fPXXb
         KZzIy0w2dOQx9JdLrxrSxPzKFzLcEgJgeAIWy3TBp4fHgVaw6chCj24v/1wQ9rkpwgaC
         aBKmBeZyUgQ4QOk4DFppv6NtalqGdiJnc8VS23zFwe3FE5GxHTTGSvxyucPiprq3da/a
         nNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Fo35LiJLxzJ5QjaCRAy6ykdp6FMMYOby7BAD/sQfZQU=;
        b=MbA1yLUikyoq1spFfl4pGDf62Oa4+9mTrxzSWhqK8IBp1GkDj32MsbviyWHci32j81
         aKwU8lD6PbF87zkt/DeMyk+bjQ7syjTuMb6PJh37c2FkU3nsp1+OVMOMZOMMOgqjFww0
         k3l9bxzpKTOoLCvC1YufL8/q1895twivEYvyH3V7+6hyqCckiKw/D5husmBkjagTyjqE
         MQFy6RKQ+3ZOrmDMwKnQvHBOQe0LcDNdrm3ufsSRunPDcR7NI1d+f8gATD+HDcKNdwBw
         ps8DYo09/SpmeAIz9zbmCuXm28bwbzOz013LEzRp1h3tKfoBidamYg4D+mzuNbyWrIdR
         sS3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="urnw/uyc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si10901029ilt.38.2021.06.20.18.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Jun 2021 18:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="urnw/uyc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lv8wo-0001Gk-Bv
	for alex.bennee@linaro.org; Sun, 20 Jun 2021 21:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8ps-0003gy-MG
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:48 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pp-0005A1-AK
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:48 -0400
Received: by mail-pg1-x536.google.com with SMTP id e20so12863002pgg.0
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fo35LiJLxzJ5QjaCRAy6ykdp6FMMYOby7BAD/sQfZQU=;
 b=urnw/uyckTRcrz9lokvO8z/9sBLJsRPCjrU24bmLZUFCS3m7znSJ98SdgkIG/ejhf4
 80oavddRacwR+GaMFsmErSxQ5NPIRzrJ7bbe7aa6OYkHbmrzZmL5bT/wHaC0STfGeFP8
 K1IyB1ZWQONoHW8bJhUKsfafJMXVqn7tJuYTToa4Fe06PRp8AbmnHAr8lboOxfXjqkAk
 C0lqbYsrD+LRkOpR5a44U4selX4L+rR3ffBZR0PQXQJIFSkX7EBSpUzU4EwA1ostvGfw
 RaR2MRSGHiNhzuCKuHYu8Cdl1PJp/cz3HJr4C7nc+NHd5VjriqpZ3v74KLMmbYQkD3nX
 kxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fo35LiJLxzJ5QjaCRAy6ykdp6FMMYOby7BAD/sQfZQU=;
 b=aCluqmxNPIISgK+xfgOfnNSDpk4xiVnWBENngOkyvOQQl9IBwz8E82f8ihn+/SIcAM
 FOL+34hAhqt4TLIJp6HR85kZRAwpJVtJ52E1wCNbqM0yPlcFrIEQlJTOvORSrQKBRSFz
 HM7mE+EIM5OsnT0u/PR8c8AHVgBf+Lu5fFlhRityxPtlFHGeWiEiD7xNbnkOUdDPpSp3
 oMkO2Ub82mXFjH8x4DmDPUtoIl7PYTNg1GIQ1b2PYP4956XBELoOdF2PbSapQPRQWXxh
 As65+V+nU8l+4TtsOlnLwurCj5DSv47zLHDNpE4HJsbjnw5UCk5afveTFdtWe+Q5TrGD
 UKiw==
X-Gm-Message-State: AOAM533T2n62YLM0ZcLiw+aZ73AYVSa9Qu7oE94c4fTMOtf7U4fHoJin
 fwrcyCczXQq2qwrJMxIHILpCpuuuH+RIBQ==
X-Received: by 2002:aa7:9729:0:b029:2ff:1e52:e284 with SMTP id
 k9-20020aa797290000b02902ff1e52e284mr16669103pfg.71.1624239283986; 
 Sun, 20 Jun 2021 18:34:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] target/arm: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:18 -0700
Message-Id: <20210621013439.1791385-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HUYpiH3ORx7g

Put a wrapper in translate.h, which also checks for ss_active.
The ss_active test was incorrectly missing from the a32 version.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 13 +++++++++++++
 target/arm/translate-a64.c | 22 +---------------------
 target/arm/translate.c     | 10 ----------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 2821b325e3..3a62f50faf 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -116,6 +116,19 @@ typedef struct DisasContext {
     TCGv_i64 tmp_a64[TMP_A64_MAX];
 } DisasContext;
 
+static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
+{
+    /*
+     * No direct tb linking with singlestep.
+     * This handles the ARM debug architecture kind; the QEMU kind
+     * is handled inside translator_use_goto_tb.
+     */
+    if (s->ss_active) {
+        return false;
+    }
+    return translator_use_goto_tb(&s->base, dest);
+}
+
 typedef struct DisasCompare {
     TCGCond cond;
     TCGv_i32 value;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7f74d0e81a..ac58a86e59 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -386,32 +386,12 @@ static void gen_step_complete_exception(DisasContext *s)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
-{
-    /* No direct tb linking with singlestep (either QEMU's or the ARM
-     * debug architecture kind) or deterministic io
-     */
-    if (s->base.singlestep_enabled || s->ss_active ||
-        (tb_cflags(s->base.tb) & CF_LAST_IO)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    /* Only link tbs from inside the same guest page */
-    if ((s->base.tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
-        return false;
-    }
-#endif
-
-    return true;
-}
-
 static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 {
     const TranslationBlock *tb;
 
     tb = s->base.tb;
-    if (use_goto_tb(s, n, dest)) {
+    if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
         tcg_gen_exit_tb(tb, n);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9e2cca7707..3ac7943d86 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2511,16 +2511,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           ((s->base.pc_next - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_ptr(void)
 {
     tcg_gen_lookup_and_goto_ptr();
-- 
2.25.1

