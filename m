Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp55579lfm;
        Thu, 25 Jun 2020 20:48:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLpixJhaKW3mB6gTt0p4KgOmalychvxweG2zy5qmEElSgrwdRWFYFYY328SCmAYgu9BJzW
X-Received: by 2002:a25:d483:: with SMTP id m125mr1770708ybf.339.1593143279880;
        Thu, 25 Jun 2020 20:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143279; cv=none;
        d=google.com; s=arc-20160816;
        b=ovxvO+T2BfTjMkJ03eccrGGCcMR7OElZakL+kE/ZxGwhn2O9eejqbY/X9qBn27Fjeu
         WupkyvoHWC9vdu35Eafj9hBw2qDdt/oIEvEQsVQYGK+SQA4Ps64EQK7tdYsW2lwxVDap
         yS1hcLjqW4QmN6nExZRcg1m/VUKmqyf3kko+/rd/U+fcuwF50RA5KihzNOgdPoZK4olL
         /RxpmEwD1KGTw2npbjHwpIkjxw2KAD3H1EGqjOlfHVuOnX9segc5j0N8Gf3tXl/a5X1n
         dOxpK50YqjOyzUr33j8ViipVvbKyDcZk+VL7753xoFtMaSXCrB+4Efz+5QAM47qNt/nc
         t/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q7povnsnRNykXzxEkpJfE8mtHCMTrtjFjUM5XvpE0j8=;
        b=E57pK8PlCx91+sSY8HT/RMH73dhUUSiUsbeO/du+Tcq/skhIxGOTuGAhzx9NyyaxH3
         RJEe2yevcLAKz3sqyAj/e2KkdK0ORdsyShl24DzJ+KLZOhUABCR71xNGRAyBo2I9rZ4o
         lOXzl7fsTEhyk8vuwHFeLq7+6D8ULXO5qzsK5IeB0JQOt3HB/8yLvHDD/abQ/+DiLkJ1
         FiJVu5Pawdwmmp7iVCjebswaV9IZpakNCIRNw/D1h6vzvqf2VItP+SkmO14uDypbEmou
         Txbyy2vZ6nHMOG31exwg5zJJN5ayYud57pu59eQ1y1LiSBB41ZHhVVMef0o4iMUP+m4+
         +SnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGl0fFdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si22929876ybe.280.2020.06.25.20.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGl0fFdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofLL-0003tj-8Q
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6R-0000wc-5U
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:35 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6O-00022L-3p
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:34 -0400
Received: by mail-pf1-x444.google.com with SMTP id h185so4065758pfg.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q7povnsnRNykXzxEkpJfE8mtHCMTrtjFjUM5XvpE0j8=;
 b=kGl0fFdgEmsCBvMiAvoiXtDETRM6G1TgtbE1IdvAWP8w9ZKlXbhzBA2Dku++1n+msB
 0zPWiOTioS+q1EljiTUALp4YMQKUp6On0jzFZNygFoh/njNQYFJOUam4EMU6GyK9Fd7y
 fWDvXJLmgo+t/AfOnrAhS/yqhbtcEfJ+SFIHRVHzEJOvrjsk8hcbyCyj0/Jm+R4k6/Vq
 k9SBuKLEsiasVmCHNbsVms60vjIJfBCFpzRz/6Jwlf0iC01Bub6Zgg3VVTeqg0v6f7Ac
 dfbMX/XLf1kiwCzwwoScK6eLIjqnUFT8jJPJzv3Y1e7Wcy4YCOtGW8KFUnTEKLGEwkRD
 BgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q7povnsnRNykXzxEkpJfE8mtHCMTrtjFjUM5XvpE0j8=;
 b=BwiuzqHHhziK/MaGtN1W2XMxXC+L7lXg72mNG3dynYyDgzqbEovo3CxD+AMkHaIHk7
 4MerLJ0+KoUyzBXS0KfEAXDwX3Wtyqj/xyG9DNRbPCNI94+se4L1QsITMkWY6Mr6CRGa
 ZEgOPrw/kmkY1dO8zctaaD/7u+HIAK2dyeJxEPL3MHNlsV3Oj/2juXn5rPEEmAcWQPVj
 3Gr1vmw7HijMePvwBH0emE93ynqncAhkF5sJOMkQZwC+Pzeta9jC23nKw7shZKutjFzL
 uAC5ttb/9I8FnNXYNtks8ybrun3MaeDk+f37amiXwaTEAhmYRlgzZ+1JHLFZ0LJ4WccY
 meBA==
X-Gm-Message-State: AOAM530Y432k/CUbTHbBGnUmrbWgVpyi+AdoAbG8wDlQ4Cm9/cwqkmvl
 /ub1vPpxleRVaHhjJ3fQPfcPlQ==
X-Received: by 2002:a63:1408:: with SMTP id u8mr959872pgl.282.1593142350701;
 Thu, 25 Jun 2020 20:32:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 33/46] target/arm: Add mte helpers for sve scalar + int
 loads
Date: Thu, 25 Jun 2020 20:31:31 -0700
Message-Id: <20200626033144.790098-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aYryqa9yeJFv

Because the elements are sequential, we can eliminate many tests all
at once when the tag hits TCMA, or if the page(s) are not Tagged.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |   1 +
 target/arm/helper-sve.h    |  58 ++++++++++
 target/arm/internals.h     |   6 +
 target/arm/sve_helper.c    | 218 ++++++++++++++++++++++++++++++-------
 target/arm/translate-sve.c | 186 ++++++++++++++++++++++---------
 5 files changed, 378 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c54f0ab18a..3bf0518ca4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3405,6 +3405,7 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  * generic target bits directly.
  */
 #define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
+#define arm_tlb_mte_tagged(x) (typecheck_memtxattrs(x)->target_tlb_bit1)
 
 /*
  * Naming convention for isar_feature functions:
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7a200755ac..1bc1974fc2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1196,6 +1196,64 @@ DEF_HELPER_FLAGS_4(sve_ld1sds_le_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld1sdu_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld1sds_be_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve_ld1bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4bb_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4hh_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4hh_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4ss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4ss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4dd_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld2dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld3dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld4dd_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1bhu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bsu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bdu_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bhs_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bss_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1bds_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hsu_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hdu_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hss_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hds_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1hsu_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hdu_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hss_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1hds_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1sdu_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1sds_le_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_4(sve_ld1sdu_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+DEF_HELPER_FLAGS_4(sve_ld1sds_be_r_mte, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_4(sve_ldff1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldff1bhu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ldff1bsu_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c763a23dfb..3306c4f829 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1310,6 +1310,12 @@ void arm_log_exception(int idx);
 #define LOG2_TAG_GRANULE 4
 #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
 
+/*
+ * The SVE simd_data field, for memory ops, contains either
+ * rd (5 bits) or a shift count (2 bits).
+ */
+#define SVE_MTEDESC_SHIFT 5
+
 /* Bits within a descriptor passed to the helper_mte_check* functions. */
 FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e590db6637..767ecb399f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4393,15 +4393,89 @@ static void sve_cont_ldst_watchpoints(SVEContLdSt *info, CPUARMState *env,
 #endif
 }
 
+typedef uint64_t mte_check_fn(CPUARMState *, uint32_t, uint64_t, uintptr_t);
+
+static inline QEMU_ALWAYS_INLINE
+void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
+                                 uint64_t *vg, target_ulong addr, int esize,
+                                 int msize, uint32_t mtedesc, uintptr_t ra,
+                                 mte_check_fn *check)
+{
+    intptr_t mem_off, reg_off, reg_last;
+
+    /* Process the page only if MemAttr == Tagged. */
+    if (arm_tlb_mte_tagged(&info->page[0].attrs)) {
+        mem_off = info->mem_off_first[0];
+        reg_off = info->reg_off_first[0];
+        reg_last = info->reg_off_split;
+        if (reg_last < 0) {
+            reg_last = info->reg_off_last[0];
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    check(env, mtedesc, addr, ra);
+                }
+                reg_off += esize;
+                mem_off += msize;
+            } while (reg_off <= reg_last && (reg_off & 63));
+        } while (reg_off <= reg_last);
+    }
+
+    mem_off = info->mem_off_first[1];
+    if (mem_off >= 0 && arm_tlb_mte_tagged(&info->page[1].attrs)) {
+        reg_off = info->reg_off_first[1];
+        reg_last = info->reg_off_last[1];
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    check(env, mtedesc, addr, ra);
+                }
+                reg_off += esize;
+                mem_off += msize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+}
+
+typedef void sve_cont_ldst_mte_check_fn(SVEContLdSt *info, CPUARMState *env,
+                                        uint64_t *vg, target_ulong addr,
+                                        int esize, int msize, uint32_t mtedesc,
+                                        uintptr_t ra);
+
+static void sve_cont_ldst_mte_check1(SVEContLdSt *info, CPUARMState *env,
+                                     uint64_t *vg, target_ulong addr,
+                                     int esize, int msize, uint32_t mtedesc,
+                                     uintptr_t ra)
+{
+    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
+                                mtedesc, ra, mte_check1);
+}
+
+static void sve_cont_ldst_mte_checkN(SVEContLdSt *info, CPUARMState *env,
+                                     uint64_t *vg, target_ulong addr,
+                                     int esize, int msize, uint32_t mtedesc,
+                                     uintptr_t ra)
+{
+    sve_cont_ldst_mte_check_int(info, env, vg, addr, esize, msize,
+                                mtedesc, ra, mte_checkN);
+}
+
+
 /*
  * Common helper for all contiguous 1,2,3,4-register predicated stores.
  */
 static inline QEMU_ALWAYS_INLINE
 void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                uint32_t desc, const uintptr_t retaddr,
-               const int esz, const int msz, const int N,
+               const int esz, const int msz, const int N, uint32_t mtedesc,
                sve_ldst1_host_fn *host_fn,
-               sve_ldst1_tlb_fn *tlb_fn)
+               sve_ldst1_tlb_fn *tlb_fn,
+               sve_cont_ldst_mte_check_fn *mte_check_fn)
 {
     const unsigned rd = simd_data(desc);
     const intptr_t reg_max = simd_oprsz(desc);
@@ -4426,7 +4500,14 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     sve_cont_ldst_watchpoints(&info, env, vg, addr, 1 << esz, N << msz,
                               BP_MEM_READ, retaddr);
 
-    /* TODO: MTE check. */
+    /*
+     * Handle mte checks for all active elements.
+     * Since TBI must be set for MTE, !mtedesc => !mte_active.
+     */
+    if (mte_check_fn && mtedesc) {
+        mte_check_fn(&info, env, vg, addr, 1 << esz, N << msz,
+                     mtedesc, retaddr);
+    }
 
     flags = info.page[0].flags | info.page[1].flags;
     if (unlikely(flags != 0)) {
@@ -4532,26 +4613,67 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     }
 }
 
-#define DO_LD1_1(NAME, ESZ) \
-void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,        \
-                            target_ulong addr, uint32_t desc)  \
-{                                                              \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1,      \
-              sve_##NAME##_host, sve_##NAME##_tlb);            \
+static inline QEMU_ALWAYS_INLINE
+void sve_ldN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
+                   uint32_t desc, const uintptr_t ra,
+                   const int esz, const int msz, const int N,
+                   sve_ldst1_host_fn *host_fn,
+                   sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sve_ldN_r(env, vg, addr, desc, ra, esz, msz, N, mtedesc, host_fn, tlb_fn,
+              N == 1 ? sve_cont_ldst_mte_check1 : sve_cont_ldst_mte_checkN);
 }
 
-#define DO_LD1_2(NAME, ESZ, MSZ) \
-void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,        \
-                               target_ulong addr, uint32_t desc)  \
-{                                                                 \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
-              sve_##NAME##_le_host, sve_##NAME##_le_tlb);         \
-}                                                                 \
-void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,        \
-                               target_ulong addr, uint32_t desc)  \
-{                                                                 \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,          \
-              sve_##NAME##_be_host, sve_##NAME##_be_tlb);         \
+#define DO_LD1_1(NAME, ESZ)                                             \
+void HELPER(sve_##NAME##_r)(CPUARMState *env, void *vg,                 \
+                            target_ulong addr, uint32_t desc)           \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1, 0,            \
+              sve_##NAME##_host, sve_##NAME##_tlb, NULL);               \
+}                                                                       \
+void HELPER(sve_##NAME##_r_mte)(CPUARMState *env, void *vg,             \
+                                target_ulong addr, uint32_t desc)       \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MO_8, 1,           \
+                  sve_##NAME##_host, sve_##NAME##_tlb);                 \
+}
+
+#define DO_LD1_2(NAME, ESZ, MSZ)                                        \
+void HELPER(sve_##NAME##_le_r)(CPUARMState *env, void *vg,              \
+                               target_ulong addr, uint32_t desc)        \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
+              sve_##NAME##_le_host, sve_##NAME##_le_tlb, NULL);         \
+}                                                                       \
+void HELPER(sve_##NAME##_be_r)(CPUARMState *env, void *vg,              \
+                               target_ulong addr, uint32_t desc)        \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1, 0,             \
+              sve_##NAME##_be_host, sve_##NAME##_be_tlb, NULL);         \
+}                                                                       \
+void HELPER(sve_##NAME##_le_r_mte)(CPUARMState *env, void *vg,          \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
+                  sve_##NAME##_le_host, sve_##NAME##_le_tlb);           \
+}                                                                       \
+void HELPER(sve_##NAME##_be_r_mte)(CPUARMState *env, void *vg,          \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, MSZ, 1,            \
+                  sve_##NAME##_be_host, sve_##NAME##_be_tlb);           \
 }
 
 DO_LD1_1(ld1bb,  MO_8)
@@ -4577,26 +4699,44 @@ DO_LD1_2(ld1dd,  MO_64, MO_64)
 #undef DO_LD1_1
 #undef DO_LD1_2
 
-#define DO_LDN_1(N) \
-void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,        \
-                             target_ulong addr, uint32_t desc)  \
-{                                                               \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,      \
-              sve_ld1bb_host, sve_ld1bb_tlb);                   \
+#define DO_LDN_1(N)                                                     \
+void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,                \
+                             target_ulong addr, uint32_t desc)          \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N, 0,           \
+              sve_ld1bb_host, sve_ld1bb_tlb, NULL);                     \
+}                                                                       \
+void HELPER(sve_ld##N##bb_r_mte)(CPUARMState *env, void *vg,            \
+                                 target_ulong addr, uint32_t desc)      \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,          \
+                  sve_ld1bb_host, sve_ld1bb_tlb);                       \
 }
 
-#define DO_LDN_2(N, SUFF, ESZ) \
-void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,       \
-                                    target_ulong addr, uint32_t desc) \
-{                                                                     \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
-              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);       \
-}                                                                     \
-void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,       \
-                                    target_ulong addr, uint32_t desc) \
-{                                                                     \
-    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,              \
-              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);       \
+#define DO_LDN_2(N, SUFF, ESZ)                                          \
+void HELPER(sve_ld##N##SUFF##_le_r)(CPUARMState *env, void *vg,         \
+                                    target_ulong addr, uint32_t desc)   \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
+              sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb, NULL);   \
+}                                                                       \
+void HELPER(sve_ld##N##SUFF##_be_r)(CPUARMState *env, void *vg,         \
+                                    target_ulong addr, uint32_t desc)   \
+{                                                                       \
+    sve_ldN_r(env, vg, addr, desc, GETPC(), ESZ, ESZ, N, 0,             \
+              sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb, NULL);   \
+}                                                                       \
+void HELPER(sve_ld##N##SUFF##_le_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,            \
+                  sve_ld1##SUFF##_le_host, sve_ld1##SUFF##_le_tlb);     \
+}                                                                       \
+void HELPER(sve_ld##N##SUFF##_be_r_mte)(CPUARMState *env, void *vg,     \
+                                        target_ulong addr, uint32_t desc) \
+{                                                                       \
+    sve_ldN_r_mte(env, vg, addr, desc, GETPC(), ESZ, ESZ, N,            \
+                  sve_ld1##SUFF##_be_host, sve_ld1##SUFF##_be_tlb);     \
 }
 
 DO_LDN_1(2)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a3a0b98fbc..2620c965f0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4575,18 +4575,32 @@ static const uint8_t dtype_esz[16] = {
 };
 
 static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
-                       int dtype, gen_helper_gvec_mem *fn)
+                       int dtype, uint32_t mte_n, bool is_write,
+                       gen_helper_gvec_mem *fn)
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
     TCGv_i32 t_desc;
-    int desc;
+    int desc = 0;
 
-    /* For e.g. LD4, there are not enough arguments to pass all 4
+    /*
+     * For e.g. LD4, there are not enough arguments to pass all 4
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
+     * TODO: mte_n check here while callers are updated.
      */
-    desc = simd_desc(vsz, vsz, zt);
+    if (mte_n && s->mte_active[0]) {
+        int msz = dtype_msz(dtype);
+
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
+        desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
+        desc <<= SVE_MTEDESC_SHIFT;
+    }
+    desc = simd_desc(vsz, vsz, zt | desc);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
 
@@ -4600,64 +4614,132 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 static void do_ld_zpa(DisasContext *s, int zt, int pg,
                       TCGv_i64 addr, int dtype, int nreg)
 {
-    static gen_helper_gvec_mem * const fns[2][16][4] = {
-        /* Little-endian */
-        { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+    static gen_helper_gvec_mem * const fns[2][2][16][4] = {
+        { /* mte inactive, little-endian */
+          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
             gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-          { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
-            gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
-          { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
+              gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
+            { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
-            gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
-          { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
+              gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
+            { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
-            gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
+            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
+              gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
 
-        /* Big-endian */
-        { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-            gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-          { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+          /* mte inactive, big-endian */
+          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+              gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
-            gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
-          { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
+              gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
+            { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
-            gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
-          { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
+              gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
+            { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
 
-          { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-          { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
-            gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } }
+            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
+              gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } } },
+
+        { /* mte active, little-endian */
+          { { gen_helper_sve_ld1bb_r_mte,
+              gen_helper_sve_ld2bb_r_mte,
+              gen_helper_sve_ld3bb_r_mte,
+              gen_helper_sve_ld4bb_r_mte },
+            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1sds_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_le_r_mte,
+              gen_helper_sve_ld2hh_le_r_mte,
+              gen_helper_sve_ld3hh_le_r_mte,
+              gen_helper_sve_ld4hh_le_r_mte },
+            { gen_helper_sve_ld1hsu_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_le_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1hds_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_le_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_le_r_mte,
+              gen_helper_sve_ld2ss_le_r_mte,
+              gen_helper_sve_ld3ss_le_r_mte,
+              gen_helper_sve_ld4ss_le_r_mte },
+            { gen_helper_sve_ld1sdu_le_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_le_r_mte,
+              gen_helper_sve_ld2dd_le_r_mte,
+              gen_helper_sve_ld3dd_le_r_mte,
+              gen_helper_sve_ld4dd_le_r_mte } },
+
+          /* mte active, big-endian */
+          { { gen_helper_sve_ld1bb_r_mte,
+              gen_helper_sve_ld2bb_r_mte,
+              gen_helper_sve_ld3bb_r_mte,
+              gen_helper_sve_ld4bb_r_mte },
+            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1sds_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hh_be_r_mte,
+              gen_helper_sve_ld2hh_be_r_mte,
+              gen_helper_sve_ld3hh_be_r_mte,
+              gen_helper_sve_ld4hh_be_r_mte },
+            { gen_helper_sve_ld1hsu_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hdu_be_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1hds_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1hss_be_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1ss_be_r_mte,
+              gen_helper_sve_ld2ss_be_r_mte,
+              gen_helper_sve_ld3ss_be_r_mte,
+              gen_helper_sve_ld4ss_be_r_mte },
+            { gen_helper_sve_ld1sdu_be_r_mte, NULL, NULL, NULL },
+
+            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+            { gen_helper_sve_ld1dd_be_r_mte,
+              gen_helper_sve_ld2dd_be_r_mte,
+              gen_helper_sve_ld3dd_be_r_mte,
+              gen_helper_sve_ld4dd_be_r_mte } } },
     };
-    gen_helper_gvec_mem *fn = fns[s->be_data == MO_BE][dtype][nreg];
+    gen_helper_gvec_mem *fn
+        = fns[s->mte_active[0]][s->be_data == MO_BE][dtype][nreg];
 
-    /* While there are holes in the table, they are not
+    /*
+     * While there are holes in the table, they are not
      * accessible via the instruction encoding.
      */
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, dtype, fn);
+    do_mem_zpa(s, zt, pg, addr, dtype, nreg, false, fn);
 }
 
 static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
@@ -4739,7 +4821,7 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype,
+        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 0, false,
                    fns[s->be_data == MO_BE][a->dtype]);
     }
     return true;
@@ -4798,7 +4880,7 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
 
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), off);
-        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype,
+        do_mem_zpa(s, a->rd, a->pg, addr, a->dtype, 0, false,
                    fns[s->be_data == MO_BE][a->dtype]);
     }
     return true;
@@ -5002,7 +5084,7 @@ static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         fn = fn_multiple[be][nreg - 1][msz];
     }
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), fn);
+    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), 0, true, fn);
 }
 
 static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
-- 
2.25.1

