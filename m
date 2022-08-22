Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1186448ejc;
        Mon, 22 Aug 2022 16:35:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Qz4PESCk1RLz4ndjZjV0DHrM5GJ5nfS+dO78GUynWppYHny3ytLWcg+wav0oH5NjfbeJk
X-Received: by 2002:a05:620a:d95:b0:6b8:619a:67e1 with SMTP id q21-20020a05620a0d9500b006b8619a67e1mr14648609qkl.630.1661211326986;
        Mon, 22 Aug 2022 16:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661211326; cv=none;
        d=google.com; s=arc-20160816;
        b=L6e4m1X+Vpsq1WP60ZO95LW25MfRw+SK2LYyXkqNiIJisqUsWyNGajK26q3OzX4eOP
         gag24UarcGqhf70hth0rGKRK/MQ/rusdXL/wiHveQ9PRp0NGXy+7ofb92sJes8JC56d0
         6fTUX7l+D0/KRPw8+wT7r2ichs4r9jF2lwTMVQkgS2OxzvKyY6oOCRKwjKW+KfqlyigY
         ruhSRJFZjtRgS6aghd/98BV9ayMyo0nLm2EIdxKuuilewImFFG4DwhfUiWpS+UlfnoFx
         LDTW/J6LUGkcaptGTb1YyXlXxXnFjzLDBpW/qUXTmN7yZIFyn+m6l256aqZKyZyzcKP8
         wymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Fp921J5xyOMPkA1GL+gCt3XwJG9dpPCMYFOeFVTD1t4=;
        b=WFik4LpQRyiY7xL/b0/FmlTKV4dn40otL/S2QR5QLKDI8M5/9pk1QJWeXANDyVT/S0
         khajMrK44eKOAgPug8fh7MtSmMTJjvAf0G99+gu3La+HC0zuM+kplVEFU6ooKwlxn9qn
         wNwVv51dbBXHFb5CbT9rOW+fmkGCjIejpODexMxBmXsfuayXWjhH2ycrhmd2sOcHUokD
         qnuUpk4V04yTWvTcNJ77Dtu33N7NQIoPwVtyXzw68mUoJ0SrttRL/AajBAfGNSIxLPfQ
         S0LmSWAHpcuZGDLYvNVL4p1W1KEIsvWtr++u9FSc4oC+ssSIURb1jJGlQXLGOmFhWxiP
         8Y4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kzbsvpwZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv22-20020a05622a0a1600b00342f6181dafsi5700908qtb.397.2022.08.22.16.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kzbsvpwZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGx2-0005TL-UI
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlp-0005d2-MM
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:50 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlk-0005az-GG
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id w13so5668762pgq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fp921J5xyOMPkA1GL+gCt3XwJG9dpPCMYFOeFVTD1t4=;
 b=kzbsvpwZVGZmbFjryS0qfFuc75yvYfslMVvlyNjHLq+xhKK958dBn9VJpfP+H6vBSG
 /UZBDeloVWoGtsPzPKMIGFnAquFbE9QMNak6DgcQfWrBjIbemCdse5suEMe4BrkCx46d
 WiuiOdDctTqVtgvgN+d4+ufTqRb6EHuLxhKKGIxZeTuF5swzA4v9OK5W8Xh3MXkvBDt1
 TJg2TXrsT37Pvxdr0/nIq+eavo+CXHnuvUaEZj2c2vRqkEmE2gtVf0D7oYXK1PGX9yro
 ND8gO5juCgdh/BkuAkiD9K6SAFNO+Lhwlr3n2ASm8sS4qqql/LxfaMrNhFL38aemwKY9
 Zz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fp921J5xyOMPkA1GL+gCt3XwJG9dpPCMYFOeFVTD1t4=;
 b=g9AquZvdrsurMAJeBcGT3iWjsGTstYZtt/qVc6zcM2w7Es+2pkNmi5PbAJpHJtz94S
 VxTjp7KtiY1cABFlep1i5UkKChFSjlPu8uuuc/a7m2N/6HQeAWBri0/4QGFXlUU9CEu4
 e+kUWDXagfjX88JE4cr3vwfOcx93hdXTo2CuD85VewS2teFL7TxwPrmNysPOLFr3FFi0
 cuHen6mJ3hY8XpNT8mR3ZXVz5KVDFcQld55ep2Ip0KOmEl5v37Nkh2HmqC8lj94hWfgY
 6BCznfsDK4vp1XsyeEu98Sk6EB0exOq3PXNtIoHjh9cw7VW13jaIfyv2TMcbe32WA9fR
 lEcQ==
X-Gm-Message-State: ACgBeo3v0eI6OhHQYHjg26rMjw7ksjmxitAQnOE01Ql2bdj7P1vQAfb4
 6gpFXJWGoGk5QTSSZCFyzSDMS/IigBdkDw==
X-Received: by 2002:a63:83c1:0:b0:42a:d322:584f with SMTP id
 h184-20020a6383c1000000b0042ad322584fmr2800681pge.418.1661210623146; 
 Mon, 22 Aug 2022 16:23:43 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 03/17] accel/tcg: Use DisasContextBase in
 plugin_gen_tb_start
Date: Mon, 22 Aug 2022 16:23:24 -0700
Message-Id: <20220822232338.1727934-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vlpdv6m6G5JX

Use the pc coming from db->pc_first rather than the TB.

Use the cached host_addr rather than re-computing for the
first page.  We still need a separate lookup for the second
page because it won't be computed for DisasContextBase until
the translator actually performs a read from the page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h |  7 ++++---
 accel/tcg/plugin-gen.c    | 23 ++++++++++++-----------
 accel/tcg/translator.c    |  2 +-
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index f92f169739..5004728c61 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -19,7 +19,8 @@ struct DisasContextBase;
 
 #ifdef CONFIG_PLUGIN
 
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress);
+bool plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db,
+                         bool supress);
 void plugin_gen_tb_end(CPUState *cpu);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
@@ -48,8 +49,8 @@ static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
 
 #else /* !CONFIG_PLUGIN */
 
-static inline
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress)
+static inline bool
+plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db, bool sup)
 {
     return false;
 }
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 8377c15383..0f080386af 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -852,7 +852,8 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
     pr_ops();
 }
 
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_only)
+bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
+                         bool mem_only)
 {
     bool ret = false;
 
@@ -870,9 +871,9 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
 
         ret = true;
 
-        ptb->vaddr = tb->pc;
+        ptb->vaddr = db->pc_first;
         ptb->vaddr2 = -1;
-        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, true, &ptb->haddr1);
+        ptb->haddr1 = db->host_addr[0];
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
 
@@ -898,16 +899,16 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
      * Note that we skip this when haddr1 == NULL, e.g. when we're
      * fetching instructions from a region not backed by RAM.
      */
-    if (likely(ptb->haddr1 != NULL && ptb->vaddr2 == -1) &&
-        unlikely((db->pc_next & TARGET_PAGE_MASK) !=
-                 (db->pc_first & TARGET_PAGE_MASK))) {
-        get_page_addr_code_hostp(cpu->env_ptr, db->pc_next,
-                                 true, &ptb->haddr2);
-        ptb->vaddr2 = db->pc_next;
-    }
-    if (likely(ptb->vaddr2 == -1)) {
+    if (ptb->haddr1 == NULL) {
+        pinsn->haddr = NULL;
+    } else if (is_same_page(db, db->pc_next)) {
         pinsn->haddr = ptb->haddr1 + pinsn->vaddr - ptb->vaddr;
     } else {
+        if (ptb->vaddr2 == -1) {
+            ptb->vaddr2 = TARGET_PAGE_ALIGN(db->pc_first);
+            get_page_addr_code_hostp(cpu->env_ptr, ptb->vaddr2,
+                                     true, &ptb->haddr2);
+        }
         pinsn->haddr = ptb->haddr2 + pinsn->vaddr - ptb->vaddr2;
     }
 }
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index c8e9523e52..db924601ea 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -75,7 +75,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
-- 
2.34.1

