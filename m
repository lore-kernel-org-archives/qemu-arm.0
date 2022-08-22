Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1183771ejc;
        Mon, 22 Aug 2022 16:27:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7q9oya8nz7XWUytQ9QmwcTpoYnJvW+Bzj8plyMv3Ys2X+H9jxZn+TOI5kNjEkTbEFGbQ19
X-Received: by 2002:a05:6214:20cb:b0:496:ae67:2121 with SMTP id 11-20020a05621420cb00b00496ae672121mr17560823qve.95.1661210865187;
        Mon, 22 Aug 2022 16:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661210865; cv=none;
        d=google.com; s=arc-20160816;
        b=irP9cCyFju6+n8X9d+bEHouV1b7JoCPr4N0XEKvUTPYyDc5xza35qe++iDbP0U961j
         +fcNgRnSfX6FjrzPhU+3jO9vGzdP1dNwdRSIKyYyA8vb5e4LO1JiZDut9TwgzOvmm9XH
         6svTXcs77GPcBUuVxfTHH8ZhvseSBN36s0XI7a1YdbAEDOVEMV8nGcGswrXWeat3iSIv
         BmwwSeLjf5uKMBxlgKYa8+V5W+YJ4Yd91QDq1+C26zgDj0Gz5ZwUUqTwm2I815ltd8h9
         otSq5OOrYFWjVRePUN0JVzC/i/HITTKW3fO++2UYF9lPOkq4sxDodj4yscvWrtjJWfxr
         WK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
        b=huL1NKRzwEnJKX2tJPVjNUp/YwHoN9cGQ2MGGDaRzX5YsSYCrTgSiuEkQz1WyqDTUT
         MDM7dDrVmfP+UyulEA5Hv/Q3cVd74QdwVaJisri6iN/iBWT0+iHmIwLn6XHNyt3M6uTH
         wq6VraQgTx8KWYyWQfoL3u/Lewqf8YtgPofRlUPdk3hPn5gChPbuO/vIg1ns6ArcUNYz
         Uieeb80OxzT39RLKi6xGldf3jsG1V8OYkw5EKMJmjABHv28kIai+MDMPIFogC9m9Htsp
         JH7v6p0wZ29ZhpRV3qWf6GyAJ3M8kky5TiZPh8mzF/3OGYWuxe0xbgs6GKbYCQc2fNmd
         mhrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adtutzQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac800c7000000b00342c46c9a05si5081599qtg.704.2022.08.22.16.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adtutzQc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGpc-0003z7-N1
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlr-0005dv-80
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:51 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlp-0005bZ-0o
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:50 -0400
Received: by mail-pg1-x531.google.com with SMTP id d71so10731336pgc.13
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
 b=adtutzQcMuVneKhA8FVpCHu1q4sKiS678TT+udXfA2GxQt/gEkLYfo/eFBmoTWvGhR
 78m3hCCEBqOFVyle1P7fwfic+N+zUySTl+clA65+sRKCqx2WLKuCaxLlAHFXbQkSOaLI
 LnHmaE7uGtZbkJo7nPXiZEo1vqOlgJfSCyEhvXYCHHm7tzU/tX4/oGUYVJvynH8VpZMk
 L1AQ/NeYSzFns2J/5FZ286c/WTYZVE+ucMY+ocG56F0A0V8lzt6k4G1/uQE4t+oGBRZq
 kPZDJyvo1ytrTe2IAgSDPDzyVCzt89p3CV3PWAGVSNMFsfSB2mwRGZS29ECa4D2YpboP
 DHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
 b=bayVkSoMBhkRe+sIXZyf6+YM6eW8gfrrdCpmDU63/SPeYaK827wPX4f6/dLl8haFhW
 5+i4Q6QbdnWNgcVGO9jOVFLscy1H7Uo6Bei1vzwv9bQbVaD4hai/jp727GisWT2zmQIn
 bcwbtjwW/h+oiMo+r+lmG5Q6OGfkPlfUim3e1v65Kn4oGI131aI0xXou3KzsmQDuazep
 dqjI6M1/9/xiVuf6oJmLlBit9tOFu4AlKdkCaq1BtFKwym8R0PThJ0QjTSGfA3nDYy67
 g/fVOnJ9+O8pLqvpTUWaeAEaZE3XTkg7XtFFzMs0bzPI39A3FdSA4tb1Hx9SYKU8Xjrq
 uuHw==
X-Gm-Message-State: ACgBeo1gZFRKQZJs9+SmXMtYaDLCJgnsKtol4B4fMKzf5Iatb8vhn0c8
 QVHQrKxkQtfn0dul77crI9RLXJRhENhS5g==
X-Received: by 2002:a65:5504:0:b0:42a:352d:c79c with SMTP id
 f4-20020a655504000000b0042a352dc79cmr16561567pgr.58.1661210625251; 
 Mon, 22 Aug 2022 16:23:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 05/17] include/hw/core: Create struct CPUJumpCache
Date: Mon, 22 Aug 2022 16:23:26 -0700
Message-Id: <20220822232338.1727934-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PHHj272Bs2Vq

Wrap the bare TranslationBlock pointer into a structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 8 ++++++--
 accel/tcg/cpu-exec.c      | 9 ++++++---
 accel/tcg/cputlb.c        | 2 +-
 accel/tcg/translate-all.c | 4 ++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..8edef14199 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -233,6 +233,10 @@ struct hvf_vcpu_state;
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
+typedef struct {
+    TranslationBlock *tb;
+} CPUJumpCache;
+
 /* work queue */
 
 /* The union type allows passing of 64 bit target pointers on 32 bit
@@ -362,7 +366,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
@@ -453,7 +457,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     unsigned int i;
 
     for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index b1fd962718..3f8e4bbbc8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -243,7 +243,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -257,7 +257,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
     return tb;
 }
 
@@ -978,6 +978,8 @@ int cpu_exec(CPUState *cpu)
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
+                uint32_t h;
+
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
                 mmap_unlock();
@@ -985,7 +987,8 @@ int cpu_exec(CPUState *cpu)
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
-                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+                h = tb_jmp_cache_hash_func(pc);
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8b81b07b79..a8afe1ab9f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -103,7 +103,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
     unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
 
     for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i0 + i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 20f00f4335..c2745f14a6 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1187,8 +1187,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     h = tb_jmp_cache_hash_func(tb->pc);
     CPU_FOREACH(cpu) {
-        if (qatomic_read(&cpu->tb_jmp_cache[h]) == tb) {
-            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
+        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
+            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
         }
     }
 
-- 
2.34.1

