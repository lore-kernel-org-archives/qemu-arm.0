Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009115ejf;
        Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
X-Received: by 2002:a05:6830:9c9:b0:60b:b628:3ed2 with SMTP id y9-20020a05683009c900b0060bb6283ed2mr8371879ott.122.1660682088483;
        Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682088; cv=none;
        d=google.com; s=arc-20160816;
        b=v0HdDdFnPMAjBFJGKAMUWCi3VnSPoLmjZp1xr59JT8t8hkN+Hf2/g5F0OF8L8Mg3h3
         4YaOLsPvhjRo0gtWOsz11ccxs/hjKvDg/cSmueXKKafyAtSpa8UEhaEbBXgCvf74NBj6
         3KBI5qnhXvhj9b+rMI/o0aMpEXgcZIF09RVsaBrl6G9I2dCMO56bgbKt3JMa5S81G7/c
         uFG9T+EJeQP2Ce6uEkX8OG6JZAQX7vnhuQA+lYnyNMQVDjISPYR8k64PW1MFU4Q28bx+
         mZZUhjntNohezGsPH/g1Z70iPQAWd3GxKsJnCAqjQZ+lun7tf1gpQnsC2K1Es1qV9BhD
         areQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
        b=uX12SmddO29MBkJlPV1TrXoOXNg8pve4VfsQdt+ZtUsPpN5VQKua68eaigO8aYsCEP
         8gq+g9ccto4SDvDz96DAsY/iDTp6VpuwHvH1x69f+98oM7IFSw0C3lfvuD8Ma9ZFfZpD
         mil55NYG4rMBHNLqOJ9d5Q2coQkUjfhgb2Ctx6j8BX6m+S1DutSDeveh+yzgWmAEBHXp
         do3MH/c4iP6iZpRjeFC216lQ6ayd2qDQrGxq3uOWM7XMb2E27JRl4KWYeSnODXltVebM
         c7ixW056hBt3kYnJjuh66jlFOdU0o/TNhwgjRAT0EmxQR+GeG7CSvRRxSDYYM1ZmcHqP
         fPvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMVUEV59;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c84-20020aca3557000000b0033a422b549asor2788566oia.78.2022.08.16.13.34.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMVUEV59;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
        b=aMVUEV59R8mdaR0ZItQmDsMLFH7rNvDdYOYIY2QyAfMNwxCI6rjRa3+1+abcA9eBPZ
         3/ze/NAmfo5Q8N/PhjGbiu04RPzEmRrYu1h9Oom7sj1vLWOz0jy6VdwnmYE1tHJHqGPy
         MaHxV93Tfp7NCdvrZA//pTxkzvMiYVbjm03jOhjkh68zwQ2GzQk7+hN+7kkKA/yBfA6+
         g1YsM/LnArpCk/feRcLmlqbjWbQSSI7SfXkLDMtotE/YJbIRo//d0ZttvkkMjoHlOGBa
         kkGAVyZIlP2SIh2NTkoSpVRp85osHiAyxt3zYCAhq5GyCGpYbLXdWc4SLHEW7Br9jUrY
         SVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
        b=hN/H4hqX1s+0T4iuYc64oJl4tREwAGyBUGIvhfyEJK3xGfx5AtMBH4FE0pbmlW/YIR
         GJbLcWD/hfNCQ9BqU57+ejqVpigsqi9KIb6Xg3X4ryNB4wuCeSUdkQ/Y2TOooVaGBFtm
         OuxV5OLWvA16Is2Dkz8O667CyQm65GOtN361zLrk44B6cwLL4VfVrOv5G5KrX0Rs7WXT
         DQBukTtVw6QAY0blLVXuwTqkNHPqwnAZQRKdtLQ50SmHkVlsNVTlbi2zkuRLaQR7CpJB
         wi6GU7oSzYb0kQcr8PaLOBemmOYQi7I5nYUHrEj7QiEaGC57PhRRhrRjmYhjV7v2udtF
         6jFg==
X-Gm-Message-State: ACgBeo2+1UJ5dxi+te1zVi6TQLpwiT7QUz/0dqYWdDNCHbpRozwWVgir
	/eSg2NksNts2WoUNbKAthOJRnjdW
X-Google-Smtp-Source: AA6agR7bENcurirQQ6KZlmWGr7QDiQnam1w7rkYQdRHIO/g7TeZszpFe/Tc41iNHKbgpFyuP4LHhAA==
X-Received: by 2002:a05:6808:23d0:b0:344:b8fe:6f50 with SMTP id bq16-20020a05680823d000b00344b8fe6f50mr135803oib.159.1660682088090;
        Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 19/33] accel/tcg: Use DisasContextBase in plugin_gen_tb_start
Date: Tue, 16 Aug 2022 15:33:46 -0500
Message-Id: <20220816203400.161187-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O/stOm1mt/lX

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
index a693c17259..3e6fab482e 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -81,7 +81,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
-- 
2.34.1
