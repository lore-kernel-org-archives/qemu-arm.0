Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008991ejf;
        Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
X-Received: by 2002:a05:6808:14d5:b0:344:8f50:1f0f with SMTP id f21-20020a05680814d500b003448f501f0fmr133733oiw.257.1660682074597;
        Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682074; cv=none;
        d=google.com; s=arc-20160816;
        b=Wi/BRZ2BR3fSsofE3duPChR8WY97/C+EyG8tUxxIGDb1UkWP2RtGaali9Y/sTbpx4r
         GGHAWu891ZYDYBFH7FrG3MuDBCtXd78g825/2PpRRAXEXuEAeASlzZlSLdmCXIbR2viV
         giEYTcTIhLHSnDhNPwlBvsvViS/rzCZdI+zjDNxlcpkqTvfB1K/nPKHH/sh92RbjfHvq
         tIxHQ+PEpe0nDwXQIR8btkyKMecKQk2Mp9oBvr8nwD93mIRy0qIHB06gs/XrPHyQaYnq
         heiZjtev/8SSOa53znuQWVdM3s+BlpaKmL1sxXbhtHvhCq7SrSw65ix59+8vdiy4em8l
         MhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
        b=kHT5jV5BhhWXTd728CDb0zF/z5mjh9mhbcq4ZUpZL4zvOKW16G04tcR1w48UIdu5Sz
         IdaFFKiOFy0awHFytF7g/LvVzrQnTdIYOIM1QrhjfUsxbtgi3G4NW+1ObH9QbUqvsTaA
         vWuWFf4G5UcTFnm1P0NLYkYnf/jcCJ4sdDBtj1ZJcvNPpkLPM3vABDMyv54C2UThyY0f
         ub6iEXgpb6XnUw7GExYSrwrLCa6S4EUb17zLX2KqVRG13EHhQ3el0Wk7LtmHDwN71rD5
         EYOgOHksbu1clCbRPozG39c/qjC9t9QxwpyRhJx+Hd6y2gTeZqZ1w6B+kD1i1xuCW7VU
         EJ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xe9/AQOJ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ma7-20020a056870fd8700b0010d611aa103sor2295581oab.77.2022.08.16.13.34.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xe9/AQOJ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
        b=Xe9/AQOJQcDrIkOLYznYz6OyhBfMxzNRT/L7VHVGO0UzygcWPY8sF5Os3EjhNnUu7K
         MjD9NjImtaa37lMEPyYzruSlTBcyA6SkjjHUsmD32+1o6MwGEFV6C/T1WKUeK6yf1RWk
         E5q4Kq4QF7az/AGSoXjSa46Km051+7Xl00Zeh9df+Hc/bnRycLliEB2E4E2/O0MdTokw
         wD9JWyEGpTr3XR+UwJxCcS0siIxn9Amplc4zMdxbT96+L9cnaZEcwZzU9CHk8vpBMqKE
         G2IZbT/5rkX5I8IexV4koPv89fpQ/JC66eYqvZ0swik2R52Itd05EGbwd2SXiScqVD2k
         bX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3ksd7LzYDwg4KZFpTxKEvut5zUiua6xn62cdmeCd4NI=;
        b=bmYwm8B4oDsCtPe7oo4/v6oTLYcP2x/8LJezPni+Jpg07aXmctEt0T29bgwEUDpV6q
         uZOtREzT67HjdwPDaBNIlFivTctSFLiOsetViMv4gjeIghf40OwgWKK+TYp36eIu3HB8
         GCu8+Hng4XlZrNKLEQ/2su7U1mg6OYK8EbbCgdmngZgE0vh7EAcGjwb1lv9Zm8XlGYEI
         CDiCsWBPdjA+J1bIUd0Yr4jf/ccsTj1OF7GyTp6BbojElC5dSFpoiRD2IdXJtBpGBZiT
         5c4/7Ileh40GPxmtlXc731gSLeH55/1kR99WYdQ5Uyw7yH88QPm9boeuZ4AiM9jS0t9Y
         79FQ==
X-Gm-Message-State: ACgBeo0u46iAI+iSmNXtSnjKF+ugAcNEZjhvZRyxMjgsiynPCVFoMXT0
	gzKp60K226a6Rei4D9WjGvhYkdNx
X-Google-Smtp-Source: AA6agR7ycAVYd6pHVH1FBpQX1vmLrna6Z9X+/vXpR8C3fmBBiL+kNoyX0wz34woyeLhnBjSOCS/RdA==
X-Received: by 2002:a05:6870:1485:b0:11c:46b6:7b81 with SMTP id k5-20020a056870148500b0011c46b67b81mr126823oab.233.1660682074216;
        Tue, 16 Aug 2022 13:34:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 12/33] accel/tcg: Add nofault parameter to get_page_addr_code_hostp
Date: Tue, 16 Aug 2022 15:33:39 -0500
Message-Id: <20220816203400.161187-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /5N5bJGAqYj9

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 10 +++++-----
 accel/tcg/cputlb.c      |  8 ++++----
 accel/tcg/plugin-gen.c  |  4 ++--
 accel/tcg/user-exec.c   |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9f35e3b7a9..7a6dc44d86 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -599,6 +599,8 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
  * get_page_addr_code_hostp()
  * @env: CPUArchState
  * @addr: guest virtual address of guest code
+ * @nofault: do not raise an exception
+ * @hostp: output for host pointer
  *
  * See get_page_addr_code() (full-system version) for documentation on the
  * return value.
@@ -607,10 +609,10 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
  * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
  * to the host address where @addr's content is kept.
  *
- * Note: this function can trigger an exception.
+ * Note: Unless @nofault, this function can trigger an exception.
  */
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp);
+                                        bool nofault, void **hostp);
 
 /**
  * get_page_addr_code()
@@ -620,13 +622,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
  * If we cannot translate and execute from the entire RAM page, or if
  * the region is not backed by RAM, returns -1. Otherwise, returns the
  * ram_addr_t corresponding to the guest code at @addr.
- *
- * Note: this function can trigger an exception.
  */
 static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
                                                 target_ulong addr)
 {
-    return get_page_addr_code_hostp(env, addr, NULL);
+    return get_page_addr_code_hostp(env, addr, true, NULL);
 }
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2dc2affa12..ae7b40dd51 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1644,16 +1644,16 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
  * of RAM.  This will force us to execute by loading and translating
  * one insn at a time, without caching.
  *
- * NOTE: This function will trigger an exception if the page is
- * not executable.
+ * NOTE: Unless @nofault, this function will trigger an exception
+ * if the page is not executable.
  */
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp)
+                                        bool nofault, void **hostp)
 {
     void *p;
 
     (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
-                                cpu_mmu_index(env, true), true, &p, 0);
+                                cpu_mmu_index(env, true), nofault, &p, 0);
     if (p == NULL) {
         return -1;
     }
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 3d0b101e34..8377c15383 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -872,7 +872,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
 
         ptb->vaddr = tb->pc;
         ptb->vaddr2 = -1;
-        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
+        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, true, &ptb->haddr1);
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
 
@@ -902,7 +902,7 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
         unlikely((db->pc_next & TARGET_PAGE_MASK) !=
                  (db->pc_first & TARGET_PAGE_MASK))) {
         get_page_addr_code_hostp(cpu->env_ptr, db->pc_next,
-                                 &ptb->haddr2);
+                                 true, &ptb->haddr2);
         ptb->vaddr2 = db->pc_next;
     }
     if (likely(ptb->vaddr2 == -1)) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a20234fb02..1b3403a064 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -200,11 +200,11 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 }
 
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp)
+                                        bool nofault, void **hostp)
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, true, 0);
+    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, nofault, 0);
     if (unlikely(flags)) {
         return -1;
     }
-- 
2.34.1
