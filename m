Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276581ejb;
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JGadE3DrDpAhcrGLPp4GWc7uVmCwJAFpvKL8JLtvJ2em7EX4PjP5M6i/hXKsi/5nNUTQG
X-Received: by 2002:a05:6214:3016:b0:5ef:d5b0:c33f with SMTP id ke22-20020a056214301600b005efd5b0c33fmr12168146qvb.2.1684600144509;
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600144; cv=none;
        d=google.com; s=arc-20160816;
        b=04rqIkaLcVMuVNBGcSyJ2khT1t952pe6AJDNlRng/qoxm3EZ7Bw1d9TRmBn0DMOtz5
         UHZ2p/7BZAJmiqd6d5nwNWVructf1/hk6zYojZtX/qi850rxDQXx5KSpvTisYUY5XmFS
         QVPo8x/1Q+h7K8I1X/pug51aVQdVGDMmJQZ3MXsHyNAUfxIyyQp02co/DDHCVtfpy2SG
         KR/549UyXlT7E3n/0UcVi/paIPs+AVyiwJvEjqkHlDVpS89knRFz8VbnqJeToJL0WXQZ
         KwUMuBTzHEXqnATuUrlSGECuxVRA/sSiWr+pzstGY6yDO9yTcWoaOwt9i+87KAv6gH/H
         5klQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vQccedObj4utMlf35wyWC0cbgMCPr9JJZ7oY1hv6HgQ=;
        b=n3h0Y14zZltfAih9Mge1CxfGU50vdtrI1oaMmzgtJt2f9/PfM3DLvz8rlRWdHaaAPD
         h84bQ+YA98UtOLifLzg2thl5PC907WIpH9V1NBG+0bTYPcOCC1e+CqxFKC1kQgOeLN6B
         cgdFoKy404GEWxzt6QXpyWi89lwTWo4Mjo3WpssUb5ekJMbBJbZi8N76/uY3/kRHsz+e
         fPfRpmCFKdvUrhcuaHxNbS+O2WQ9x2nLUmbKMnbWFwGkWCmugxB3NOg6voBu2CwXlvKR
         JojRyTU5d3ia7+ANVOU4AT5cPulxrirzKhwuOWTrk72ZvI3Xxt7hZoWod7A8U6Y0IiA5
         GdFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKI5yfv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020ae9f70a000000b007579762eb52si996778qkg.363.2023.05.20.09.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKI5yfv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PQJ-0003o8-No; Sat, 20 May 2023 12:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQE-0003i7-V1
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:12 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ8-0003AY-OM
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:09 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ae452c2777so14290695ad.0
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600021; x=1687192021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQccedObj4utMlf35wyWC0cbgMCPr9JJZ7oY1hv6HgQ=;
 b=XKI5yfv+SgDnQucNQwDJ6OSB1LfdiwE6VehPGMn8vcaoaKm3jqBPQmG/nT+Jj7ordb
 hXRlbDAlb3TMNyAYGpd118W0AALLzrXNBzJw+UCZ0LeSHLU0wdsLJT5wZXkGr2e3inqF
 YbJ+J3yAEapIc76wAvwxmxxiwVNRiI3jo9tCTfTaxamp3AuU9mYY/X3pHZdnRbdXYLV2
 TNPVHvdtB2i5t9vpyxp543xRLqc+Lfr9Vo2SmiGklEluHDQ9dTOBDGVK6rQvKIy1ePmq
 sos+IZ9F7znLsq0Ss53PAHEXm6L6wlkBTzydKFCT+EdZj9853fLPTuOYS7cvrinpp4x4
 8oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600021; x=1687192021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQccedObj4utMlf35wyWC0cbgMCPr9JJZ7oY1hv6HgQ=;
 b=URObraC8Pt0BjtNjDGGvw8oOimz0PCMAY/aZZ+X5mONHB4ulHFqVU7KRfJ/KWm/oqz
 nujsYd4gxh41jIM00Rb2OTVO37b+uqhyHiNkhFsIzc+dPD6Lz3Y/qhdJdHfCfD2vqhTr
 XAfiFd2UBLrvtyphrHJYXrYC/UXH/yHYMimGGsgaxs90V6P+FTyMaw5TZ2fmLuH7RQtg
 ASFAFonl6tlTg15Fxm00Ne4a/mHIZnSlKwAuPZ6OvP1+Vc8BVDgiADtCF+NmWzFTDl4j
 ggOMgqaqRqCv8upMFgCkADB3avJugZK+3lbSjC+82vtBLjpRyATLnZaPQha8+Po4mkns
 NKVw==
X-Gm-Message-State: AC+VfDwIiLJRj7uBQtRD9qvq+YvpKQtsNGxcGQb2sTZGB7wYDDWb9g73
 usAoOef0/CUpu4jEgUoCQBVIK3ZBKVXrdh92868=
X-Received: by 2002:a17:903:32cd:b0:1a9:581b:fbb1 with SMTP id
 i13-20020a17090332cd00b001a9581bfbb1mr7576495plr.32.1684600021189; 
 Sat, 20 May 2023 09:27:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:27:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 17/27] target/s390x: Use cpu_{ld,st}*_mmu in do_csst
Date: Sat, 20 May 2023 09:26:24 -0700
Message-Id: <20230520162634.3991009-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zYhLpb1ouwsH

Use cpu_ld16_mmu and cpu_st16_mmu to eliminate the special case,
and change all of the *_data_ra functions to match.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-s390x@nongnu.org
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/mem_helper.c | 65 ++++++++++++++---------------------
 1 file changed, 26 insertions(+), 39 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 0e0d66b3b6..b6cf24403c 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1737,6 +1737,9 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                         uint64_t a2, bool parallel)
 {
     uint32_t mem_idx = cpu_mmu_index(env, false);
+    MemOpIdx oi16 = make_memop_idx(MO_TE | MO_128, mem_idx);
+    MemOpIdx oi8 = make_memop_idx(MO_TE | MO_64, mem_idx);
+    MemOpIdx oi4 = make_memop_idx(MO_TE | MO_32, mem_idx);
     uintptr_t ra = GETPC();
     uint32_t fc = extract32(env->regs[0], 0, 8);
     uint32_t sc = extract32(env->regs[0], 8, 8);
@@ -1780,15 +1783,17 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
         }
     }
 
-    /* All loads happen before all stores.  For simplicity, load the entire
-       store value area from the parameter list.  */
-    svh = cpu_ldq_data_ra(env, pl + 16, ra);
-    svl = cpu_ldq_data_ra(env, pl + 24, ra);
+    /*
+     * All loads happen before all stores.  For simplicity, load the entire
+     * store value area from the parameter list.
+     */
+    svh = cpu_ldq_mmu(env, pl + 16, oi8, ra);
+    svl = cpu_ldq_mmu(env, pl + 24, oi8, ra);
 
     switch (fc) {
     case 0:
         {
-            uint32_t nv = cpu_ldl_data_ra(env, pl, ra);
+            uint32_t nv = cpu_ldl_mmu(env, pl, oi4, ra);
             uint32_t cv = env->regs[r3];
             uint32_t ov;
 
@@ -1801,8 +1806,8 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 ov = cpu_atomic_cmpxchgl_be_mmu(env, a1, cv, nv, oi, ra);
 #endif
             } else {
-                ov = cpu_ldl_data_ra(env, a1, ra);
-                cpu_stl_data_ra(env, a1, (ov == cv ? nv : ov), ra);
+                ov = cpu_ldl_mmu(env, a1, oi4, ra);
+                cpu_stl_mmu(env, a1, (ov == cv ? nv : ov), oi4, ra);
             }
             cc = (ov != cv);
             env->regs[r3] = deposit64(env->regs[r3], 32, 32, ov);
@@ -1811,21 +1816,20 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
 
     case 1:
         {
-            uint64_t nv = cpu_ldq_data_ra(env, pl, ra);
+            uint64_t nv = cpu_ldq_mmu(env, pl, oi8, ra);
             uint64_t cv = env->regs[r3];
             uint64_t ov;
 
             if (parallel) {
 #ifdef CONFIG_ATOMIC64
-                MemOpIdx oi = make_memop_idx(MO_TEUQ | MO_ALIGN, mem_idx);
-                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi, ra);
+                ov = cpu_atomic_cmpxchgq_be_mmu(env, a1, cv, nv, oi8, ra);
 #else
                 /* Note that we asserted !parallel above.  */
                 g_assert_not_reached();
 #endif
             } else {
-                ov = cpu_ldq_data_ra(env, a1, ra);
-                cpu_stq_data_ra(env, a1, (ov == cv ? nv : ov), ra);
+                ov = cpu_ldq_mmu(env, a1, oi8, ra);
+                cpu_stq_mmu(env, a1, (ov == cv ? nv : ov), oi8, ra);
             }
             cc = (ov != cv);
             env->regs[r3] = ov;
@@ -1834,27 +1838,19 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
 
     case 2:
         {
-            uint64_t nvh = cpu_ldq_data_ra(env, pl, ra);
-            uint64_t nvl = cpu_ldq_data_ra(env, pl + 8, ra);
-            Int128 nv = int128_make128(nvl, nvh);
+            Int128 nv = cpu_ld16_mmu(env, pl, oi16, ra);
             Int128 cv = int128_make128(env->regs[r3 + 1], env->regs[r3]);
             Int128 ov;
 
             if (!parallel) {
-                uint64_t oh = cpu_ldq_data_ra(env, a1 + 0, ra);
-                uint64_t ol = cpu_ldq_data_ra(env, a1 + 8, ra);
-
-                ov = int128_make128(ol, oh);
+                ov = cpu_ld16_mmu(env, a1, oi16, ra);
                 cc = !int128_eq(ov, cv);
                 if (cc) {
                     nv = ov;
                 }
-
-                cpu_stq_data_ra(env, a1 + 0, int128_gethi(nv), ra);
-                cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
+                cpu_st16_mmu(env, a1, nv, oi16, ra);
             } else if (HAVE_CMPXCHG128) {
-                MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
-                ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
+                ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi16, ra);
                 cc = !int128_eq(ov, cv);
             } else {
                 /* Note that we asserted !parallel above.  */
@@ -1876,29 +1872,20 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
     if (cc == 0) {
         switch (sc) {
         case 0:
-            cpu_stb_data_ra(env, a2, svh >> 56, ra);
+            cpu_stb_mmu(env, a2, svh >> 56, make_memop_idx(MO_8, mem_idx), ra);
             break;
         case 1:
-            cpu_stw_data_ra(env, a2, svh >> 48, ra);
+            cpu_stw_mmu(env, a2, svh >> 48,
+                        make_memop_idx(MO_TE | MO_16, mem_idx), ra);
             break;
         case 2:
-            cpu_stl_data_ra(env, a2, svh >> 32, ra);
+            cpu_stl_mmu(env, a2, svh >> 32, oi4, ra);
             break;
         case 3:
-            cpu_stq_data_ra(env, a2, svh, ra);
+            cpu_stq_mmu(env, a2, svh, oi8, ra);
             break;
         case 4:
-            if (!parallel) {
-                cpu_stq_data_ra(env, a2 + 0, svh, ra);
-                cpu_stq_data_ra(env, a2 + 8, svl, ra);
-            } else if (HAVE_ATOMIC128) {
-                MemOpIdx oi = make_memop_idx(MO_TEUQ | MO_ALIGN_16, mem_idx);
-                Int128 sv = int128_make128(svl, svh);
-                cpu_atomic_sto_be_mmu(env, a2, sv, oi, ra);
-            } else {
-                /* Note that we asserted !parallel above.  */
-                g_assert_not_reached();
-            }
+            cpu_st16_mmu(env, a2, int128_make128(svl, svh), oi16, ra);
             break;
         default:
             g_assert_not_reached();
-- 
2.34.1

