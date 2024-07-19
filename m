Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp180228njc;
        Thu, 18 Jul 2024 18:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx2sF4n39ZwGnrIMUrsUnVbD/5ZV056NKF02qFwAvg669x85laXzhOu+xY9Bz1gQ+Px9kL3KvHolyXWxEc0FJcIgidwr9o
X-Google-Smtp-Source: AGHT+IEGtYXNB9IDsIwqE1X0Ay0wuObpqfwquLr/AtIRqPxSHfnr+njwtwpwoJujzW2zfuPLb4XY
X-Received: by 2002:a05:6214:4011:b0:6b5:90a8:913a with SMTP id 6a1803df08f44-6b79c5e640dmr47753946d6.8.1721351352075;
        Thu, 18 Jul 2024 18:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351352; cv=none;
        d=google.com; s=arc-20160816;
        b=SRh1Ke5UZZrstAvLbzr8PEeb/f0++5QLqY3UigFnkr+BCvGfsGyCbuyl5dV06SMEbE
         Ob4MBKgxO5OzzMuvcL6ZYuyTvKaiK1wKGs3BCQpN9yPUk05w1qHT4ZPMa4qtDlCm41Vd
         yFXA9CBTp1HGMrWqfOv96k21yoooxdlkhU+0wJPdCXgki1jTIs/j6gvnNEfmNXhMwdOy
         nbC3TDK1IZK7Ad2k4qjP9eZYSd35gj3/lw5KGaG6HyOYYNbkeQuJcNF6ZsDwDO5Ih97G
         +vXkUF4xInTHP/0TdIF7f7DM/uZ+1ezVy2p4JSSFJ5qAV982GFeCojyO5Cdk3U8Ew49u
         syIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=we9LurCnVs1ZjMT75ahcYUh77trqQXlGLoe9LPxQn/4=;
        fh=PMD1cJf9IbYeK/VmAJgusCYc7DxmYIcIgC7fGquy+wg=;
        b=cXEsghRWqePdGI19MN03pvJJKlZgDFa7lz/ZwFUPGhgXMtCY5OHXLt0rnZl/ba7NI7
         czi4F7x60Osqk0flQxTHsp1HwxgsYyTQa3wFpSb83j+JdXRuWna1cdxj+4zIprs4DleK
         CdRTAErexRljIdcSkvWmp96JHzM1uZJvtRMBV0sP74IfPvrpsrpcbomZeBnFLQKnmzOW
         Hn6ESM/QefbQHRqJEZOImnZbItoFe/EAis7PRU/vtJUhchqv13T+TaLy5rV57NragYqo
         fBxHYrvETHcX4jlbgz9RND32BrovHQzaJRmseWnBKSaTcnNCu920f2GgFntV6pnp01Dc
         Dbiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dLl5tQZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acb124fcsi4165636d6.553.2024.07.18.18.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dLl5tQZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6l-0005xk-Km; Thu, 18 Jul 2024 21:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc6J-0004Ez-RR
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:08:05 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc6F-0000vI-Cq
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-70b2a0542c2so353718b3a.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351273; x=1721956073; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=we9LurCnVs1ZjMT75ahcYUh77trqQXlGLoe9LPxQn/4=;
 b=dLl5tQZRDkqakOwlu3riUvpoq+XUuiGzcxqs4hNBKym2Ff7/saOuUXRWHEw2TkS/0k
 i2E5l1YTT/Ri8ylUbQSF9xwpy9uF5R+oeNWUpOmefvSGnOwGuRJIXWcbtN3w7iLKC5L8
 Rog7n58S2M4eKyUJ/Dcu0Ky0rvm2cE4n4AlyQsuAAQirpwhcHk3Di10Kgv7jBE0GtOTP
 HF5DFK32wjx/pKvSd7xqc1hR9q4fMT8kJ+wRsWpMAqWKOAISqJ3AHbljpC5qt/KeD/0L
 sn2dVU/cQ7C+5SMeflymtTS5cMJtagy+sJikdnNb3ccXaZKEoGdkfwP6ccubyszcBJdB
 vBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351273; x=1721956073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=we9LurCnVs1ZjMT75ahcYUh77trqQXlGLoe9LPxQn/4=;
 b=QjgHy6Ndtj9nfKzLsoAu99RFEv34odAi4ad+2Vbaj3mTs2C1nQccw/M8AOPZvHw2l1
 nM6vyiEVkcDFWIlsu8FyyweKU+fh0DIkPRImDpbuQ9MVN9SOwg/ktE+M3dVQnAahpzrz
 mZPbd26Ghm55b4ZGnXcNkcekDDavW+5DiAcoxTWsVYiI5kAZ9vCCEgDmyEV8fuu5zF1k
 I7pqutoLrUvcDoTEO5F0gWVE27nktWP1xlly9d+OvSmhwsSLuZrXC4L/yr1yrMFMUTZk
 5/mG8qpefxDslfkBNOH9Lm/mydPOmBaXkvdBGiAIDL5/bSIzP5LHsz9rjXYUuvXWXyrF
 jpvg==
X-Gm-Message-State: AOJu0YyeZYK2OxwmTLOqzeo9bh54pIPXYaKJQe2LhvfMkCnYirmln4Gn
 dMG8dK03oUrQbigKyNQNcGzOGlVnjoGzYIYGr6JH0AlOvFKqEv3DPHaSWHK3T58=
X-Received: by 2002:a05:6a20:c797:b0:1c0:e728:a99e with SMTP id
 adf61e73a8af0-1c3fdcc6affmr7325553637.26.1721351273002; 
 Thu, 18 Jul 2024 18:07:53 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 11/12] target/s390x: Use set/clear_helper_retaddr in
 mem_helper.c
Date: Fri, 19 Jul 2024 11:07:06 +1000
Message-ID: <20240719010707.1319675-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 9XzCWziSar2g

Avoid a race condition with munmap in another thread.
For access_memset and access_memmove, manage the value
within the helper.  For uses of access_{get,set}_byte,
manage the value across the for loops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 43 ++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 331a35b2e5..0e12dae2aa 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -238,14 +238,14 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
 static void access_memset(CPUS390XState *env, S390Access *desta,
                           uint8_t byte, uintptr_t ra)
 {
-
+    set_helper_retaddr(ra);
     do_access_memset(env, desta->vaddr1, desta->haddr1, byte, desta->size1,
                      desta->mmu_idx, ra);
-    if (likely(!desta->size2)) {
-        return;
+    if (unlikely(desta->size2)) {
+        do_access_memset(env, desta->vaddr2, desta->haddr2, byte,
+                         desta->size2, desta->mmu_idx, ra);
     }
-    do_access_memset(env, desta->vaddr2, desta->haddr2, byte, desta->size2,
-                     desta->mmu_idx, ra);
+    clear_helper_retaddr();
 }
 
 static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
@@ -366,6 +366,8 @@ static uint32_t do_helper_nc(CPUS390XState *env, uint32_t l, uint64_t dest,
     access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    set_helper_retaddr(ra);
+
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca1, i, ra) &
                           access_get_byte(env, &srca2, i, ra);
@@ -373,6 +375,8 @@ static uint32_t do_helper_nc(CPUS390XState *env, uint32_t l, uint64_t dest,
         c |= x;
         access_set_byte(env, &desta, i, x, ra);
     }
+
+    clear_helper_retaddr();
     return c != 0;
 }
 
@@ -407,6 +411,7 @@ static uint32_t do_helper_xc(CPUS390XState *env, uint32_t l, uint64_t dest,
         return 0;
     }
 
+    set_helper_retaddr(ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca1, i, ra) ^
                           access_get_byte(env, &srca2, i, ra);
@@ -414,6 +419,7 @@ static uint32_t do_helper_xc(CPUS390XState *env, uint32_t l, uint64_t dest,
         c |= x;
         access_set_byte(env, &desta, i, x, ra);
     }
+    clear_helper_retaddr();
     return c != 0;
 }
 
@@ -441,6 +447,8 @@ static uint32_t do_helper_oc(CPUS390XState *env, uint32_t l, uint64_t dest,
     access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+    set_helper_retaddr(ra);
+
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca1, i, ra) |
                           access_get_byte(env, &srca2, i, ra);
@@ -448,6 +456,8 @@ static uint32_t do_helper_oc(CPUS390XState *env, uint32_t l, uint64_t dest,
         c |= x;
         access_set_byte(env, &desta, i, x, ra);
     }
+
+    clear_helper_retaddr();
     return c != 0;
 }
 
@@ -484,11 +494,13 @@ static uint32_t do_helper_mvc(CPUS390XState *env, uint32_t l, uint64_t dest,
     } else if (!is_destructive_overlap(env, dest, src, l)) {
         access_memmove(env, &desta, &srca, ra);
     } else {
+        set_helper_retaddr(ra);
         for (i = 0; i < l; i++) {
             uint8_t byte = access_get_byte(env, &srca, i, ra);
 
             access_set_byte(env, &desta, i, byte, ra);
         }
+        clear_helper_retaddr();
     }
 
     return env->cc_op;
@@ -514,10 +526,12 @@ void HELPER(mvcrl)(CPUS390XState *env, uint64_t l, uint64_t dest, uint64_t src)
     access_prepare(&srca, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
 
+    set_helper_retaddr(ra);
     for (i = l - 1; i >= 0; i--) {
         uint8_t byte = access_get_byte(env, &srca, i, ra);
         access_set_byte(env, &desta, i, byte, ra);
     }
+    clear_helper_retaddr();
 }
 
 /* move inverse  */
@@ -534,11 +548,13 @@ void HELPER(mvcin)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     src = wrap_address(env, src - l + 1);
     access_prepare(&srca, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+
+    set_helper_retaddr(ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = access_get_byte(env, &srca, l - i - 1, ra);
-
         access_set_byte(env, &desta, i, x, ra);
     }
+    clear_helper_retaddr();
 }
 
 /* move numerics  */
@@ -555,12 +571,15 @@ void HELPER(mvn)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+
+    set_helper_retaddr(ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = (access_get_byte(env, &srca1, i, ra) & 0x0f) |
                           (access_get_byte(env, &srca2, i, ra) & 0xf0);
 
         access_set_byte(env, &desta, i, x, ra);
     }
+    clear_helper_retaddr();
 }
 
 /* move with offset  */
@@ -580,6 +599,8 @@ void HELPER(mvo)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
 
     /* Handle rightmost byte */
     byte_dest = cpu_ldub_data_ra(env, dest + len_dest - 1, ra);
+
+    set_helper_retaddr(ra);
     byte_src = access_get_byte(env, &srca, len_src - 1, ra);
     byte_dest = (byte_dest & 0x0f) | (byte_src << 4);
     access_set_byte(env, &desta, len_dest - 1, byte_dest, ra);
@@ -595,6 +616,7 @@ void HELPER(mvo)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
         byte_dest |= byte_src << 4;
         access_set_byte(env, &desta, i, byte_dest, ra);
     }
+    clear_helper_retaddr();
 }
 
 /* move zones  */
@@ -611,12 +633,15 @@ void HELPER(mvz)(CPUS390XState *env, uint32_t l, uint64_t dest, uint64_t src)
     access_prepare(&srca1, env, src, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&srca2, env, dest, l, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, dest, l, MMU_DATA_STORE, mmu_idx, ra);
+
+    set_helper_retaddr(ra);
     for (i = 0; i < l; i++) {
         const uint8_t x = (access_get_byte(env, &srca1, i, ra) & 0xf0) |
                           (access_get_byte(env, &srca2, i, ra) & 0x0f);
 
         access_set_byte(env, &desta, i, x, ra);
     }
+    clear_helper_retaddr();
 }
 
 /* compare unsigned byte arrays */
@@ -961,15 +986,19 @@ uint32_t HELPER(mvst)(CPUS390XState *env, uint32_t r1, uint32_t r2)
      */
     access_prepare(&srca, env, s, len, MMU_DATA_LOAD, mmu_idx, ra);
     access_prepare(&desta, env, d, len, MMU_DATA_STORE, mmu_idx, ra);
+
+    set_helper_retaddr(ra);
     for (i = 0; i < len; i++) {
         const uint8_t v = access_get_byte(env, &srca, i, ra);
 
         access_set_byte(env, &desta, i, v, ra);
         if (v == c) {
+            clear_helper_retaddr();
             set_address_zero(env, r1, d + i);
             return 1;
         }
     }
+    clear_helper_retaddr();
     set_address_zero(env, r1, d + len);
     set_address_zero(env, r2, s + len);
     return 3;
@@ -1060,6 +1089,7 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
         *dest = wrap_address(env, *dest + len);
     } else {
         access_prepare(&desta, env, *dest, len, MMU_DATA_STORE, mmu_idx, ra);
+        set_helper_retaddr(ra);
 
         /* The remaining length selects the padding byte. */
         for (i = 0; i < len; (*destlen)--, i++) {
@@ -1069,6 +1099,7 @@ static inline uint32_t do_mvcl(CPUS390XState *env,
                 access_set_byte(env, &desta, i, pad >> 8, ra);
             }
         }
+        clear_helper_retaddr();
         *dest = wrap_address(env, *dest + len);
     }
 
-- 
2.43.0

