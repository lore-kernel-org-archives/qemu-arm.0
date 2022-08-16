Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009137ejf;
        Tue, 16 Aug 2022 13:34:51 -0700 (PDT)
X-Received: by 2002:a05:6870:b28f:b0:11c:25db:cc9e with SMTP id c15-20020a056870b28f00b0011c25dbcc9emr161378oao.166.1660682091534;
        Tue, 16 Aug 2022 13:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682091; cv=none;
        d=google.com; s=arc-20160816;
        b=W20H1ZR1G501e1SjoEZnuG73Yj0oQ/qP7J02Hq9RPqKTWxQ4HAneh7SJhrGBBYR33D
         Xidu3pgpfyr9lZRoE1nSgonzoqI7S3VTJ1ZKnbSIpvK431eltaeUTsKkX2g7/sC1gYie
         PrGQR0RUcckXDe5l6rH7kvIkfysZfz85IL+xEfaghdnXIR6Nq18dIcffzUF5EXd5PwG8
         UHVBpJQZ8ZtT9Z20V0B0Fm9B0kKgPFAb/B2poPnRdnvRsk+MEHmYbN70B8BL/w66vXtm
         yKLjhFzH2E/Rx2pco5ZM7KX0o5C7TmuMwsoh/cn71RxJ76GlS2z7l1lVGN98jH/Z6xwD
         J4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
        b=Ywr85c8kNkZWoOrOTSHOhdJO+q/OeXBvOpfcen0LYKC8zdVsKd0RGUvz6VyN1DwnqW
         rU0Me3BpleQ62LBVRwzNQr2qKE0gz2iqFpA+HoBSAZyljJr0r4ktnoCxCrc9DoIXtnnG
         DKyh0T+U7Uz9nm7z2/ybfcm3xex7hFlON2E9Gmz3Qa4AiSLTBd93IAuVC5wDwLwTQzco
         UOj8KxXpjVGdIHn4Ih4Nc5UDALJr7o8iDuKTT6j9f6HbBydDXt/ZtXlsiGmzG/dhHbll
         Oji+RVSsnafSfNUhFznhjGMiCxxGb59lpKyqUZIlhcisE//tpwpFeReUs6pv0Px11b7S
         A7rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnMscL2t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m131-20020acabc89000000b0033b15de461csor1398880oif.91.2022.08.16.13.34.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnMscL2t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
        b=UnMscL2tGHKxQ8TdC8xytlcZW/r7PhcnXy3TItnrZ47TsrTywSvBINJs52001Zqgq8
         iXEVGm3hy1Wpt9zLgfyEY9E9yCU4wQlALd9D98sB6lyK9lxw8PMuKE+zfYUbQFyilMxi
         IOrXGV6MQCo1jUm39K+9nv9gQvXz14aa40zy3SwAQX4m5qzeMh8UmoRdp4rWQ7fIT+le
         vMdpjMw0sdcz1xz40XVtLDShRKru6Vv1wNSbKwGjwg3Cz0sHQacu+U3rPA151E9hmUr5
         6BM32PQU2xnP6rC29ml7MAntrAjfjl2npY/PMXunwp+d9E8f9cdItfLw0XIC6rHSynxA
         ISMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XGYmwpgiZPY1AsTDknzkrjEzLYeuV4sGoEw7odttBvA=;
        b=eitW94/Z65oz8QwsODjDIruVcgIIbIBG1UCp1cAfWwjT/dgg3RIOs6Ik5RX2Hief/X
         RpYJQyFpy7SAykbA1Le7GRJ/OV8yic8FNvMqt0/zolgslOOQJQiU3pqsQjCXnEhP8VrK
         e7m1dO+aJAQ9Rl88PpCb2RtCba6VQnM7lqgVgurV2RzvrkEShGRUW0cMrHiwuHoz7OOo
         oKFQ+HNRStbBAbrdGq1xeBaK1zE3pY48gOEssdDOJ5h97/VhYecmRjghCP/5kHG6sMG4
         V6Wmrej2n/4+P+62YN8tN78bJbcqk3VZUABHA45RyVhJEcwrXsrWjdBaGFuf6XopGn6Q
         TL+A==
X-Gm-Message-State: ACgBeo1SAjJsVwVFdkkPH4GpX0BwgEGHTDzMNuX9E5/dSFj0oqExlCSI
	+SZIMOh1CWjiMLjFLRGdVVGsn+jUZjo4TENa
X-Google-Smtp-Source: AA6agR6s97iDZIwbLXL0lTAIkThy/SaWhzJUMzNdpbk2b7z0VDZgeeU4slgUEHl9QFY0DUdmH5G9Hw==
X-Received: by 2002:a05:6808:23ca:b0:344:be60:144d with SMTP id bq10-20020a05680823ca00b00344be60144dmr154235oib.38.1660682091126;
        Tue, 16 Aug 2022 13:34:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 21/33] include/hw/core: Create struct CPUJumpCache
Date: Tue, 16 Aug 2022 15:33:48 -0500
Message-Id: <20220816203400.161187-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D9S3nIrKQ4lW

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
