Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955271lfg;
        Tue, 9 Mar 2021 08:21:17 -0800 (PST)
X-Received: by 2002:a9d:3a07:: with SMTP id j7mr13850546otc.271.1615306877427;
        Tue, 09 Mar 2021 08:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306877; cv=none;
        d=google.com; s=arc-20160816;
        b=f/aK8xWp/WsP7KYhQH/y8NXeGzGETvZjxXvWAhdpDSkZ1Qv5p/Is2dkYCsK6FMjg5e
         rJdNrbNicx3s4+7aGa5/Es9eoO/gIyRzNRRGuQFbJ1bGbpnXOWUcL0O693jU6PxNBZI+
         Zj+v2yfwXFXqugDSVHve3Fs/rpS4dOHvpgAm1bm+xYFSIvnAjOTJuELx/Z7/5HU4QCbU
         p8vq7GXE4TbkWwOfeBrwRvfk3z4ys1X9eTD6fBzKD3G/Y+bJP1lEqS6RIn88Vbzk76A9
         OdbFmFFEpQauGI0hdIiwBgH0HHHDMEw4GKmNq66+8m+A3K6fsAPQ7+PkWYQmq1srCjsu
         9oqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X5qNtlKyR3HiK96NPS7iXZ0SUIEgp+QlNj8LO8hQyAM=;
        b=TrTzp06tVJ9HhKlD4GbHquC8n/nW0MIpkmNT2KhJf9wzJ9qw4u8CWK9GE+PVudIF/y
         PPA3QUA6vkCgq9rw9He9FaDKAdbRvpHehRLsODdtZYDUOPXTakr566i/Y6QACFcIojqn
         repnRZk8IBKa0R9XtxYQJNwxT8E9wVROLtt2+hTrqNg7vjce1iw6WH63v7Je8t28SQE1
         /5fkDVR/q4Nwyf1p0EQ3KchL17lIXhuJwslEG/D2ncZNHc+Zp6nE02nJGKh69Gq+u2W6
         u++00mex3w6bCEVVrWFz56gn1vkUF1j0Mvwp27TX5ko1SJ85MI4HA4CMtYLrVxbp3WfP
         iKSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+YLCFKu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w8sor1573468otk.179.2021.03.09.08.21.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N+YLCFKu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X5qNtlKyR3HiK96NPS7iXZ0SUIEgp+QlNj8LO8hQyAM=;
        b=N+YLCFKuHpHa80yDhQmA/0pb8QkwdYp1OMdY5f/Tiia43E513T517vthrv9htKFlrn
         GLVqAIDJ7O/WyIDcTb9eesnxX8Ou0wjjrBJ8LxxVn7wCnOtI+I6E543JnLDmBowl7HYk
         q0iXmgT6fYryCkgxKZ2ojymvRJX40HBKc5r0pExTr3ZyZug2ef2zUM9p2aPzuHWM6EWC
         AgVKkpYX7ueP0NFeuqCzrEZLXm4dRVscHvzkTJaygtOg0FRId+d1F8Yp/9FBcatk5L6B
         s4F0tVgPswCIkq0++LB5nMosSmLhJvdeH4LiJcc6ksdAo36sNIV1P0xRXw6272V3ixt6
         wWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X5qNtlKyR3HiK96NPS7iXZ0SUIEgp+QlNj8LO8hQyAM=;
        b=ZScZ+TyhZD+KtDmhAuG66PP3QnEzNJLc7W1v3FycaXWK52fmO7W0mDgXan2g+lTsZG
         P47gDdVFbbZUYF9G58kU5sGa2lpuMXmDhsCIrlNgPYvTuvDEbspbZv3wbUBLXbTjwqbF
         KjGcNSDPmYflfNdFYtPY47fezGpZgzl5taUJCRkVe/GvDbfCK56BN4cabqcpnysK8RP8
         WQfqQLFTrhYhW1NQbRU3WBzgZCrqrisieWv1Jo7McGf6G6A9z/1NjPDHdVgajK2wNcJA
         +BiE7B/PvMj0J2xhoR0BoN76KL901yKpZct0buFhL1wZ4mvfb19td3QeM+AHEoJjkCH8
         jzsg==
X-Gm-Message-State: AOAM532UMaxJL5TYk1RDxOd2E14IWzNUZsWZE3CEti4pkODpwo8cB1Nd
	BUP4DeyX5DZgCtTx5p3R4KPd9cX5+BDiWXeUvR8=
X-Google-Smtp-Source: ABdhPJxYsM3+LW7w7XtTP+T/HZQa9HtVg3QdMxd5ngYJ6ppOsWHGk4r0X8XiErFSuNPNFDbHNWQMMQ==
X-Received: by 2002:a05:6830:8f:: with SMTP id a15mr2285756oto.299.1615306877007;
        Tue, 09 Mar 2021 08:21:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 30/78] target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI, WHILEHS
Date: Tue,  9 Mar 2021 08:19:53 -0800
Message-Id: <20210309162041.23124-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gjbwm1eBdTpk

Rename the existing sve_while (less-than) helper to sve_whilel
to make room for a new sve_whileg helper for greater-than.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use a new helper function to implement this.
v4: Update for PREDDESC.
---
 target/arm/helper-sve.h    |  3 +-
 target/arm/sve.decode      |  2 +-
 target/arm/sve_helper.c    | 38 +++++++++++++++++++++++++-
 target/arm/translate-sve.c | 56 ++++++++++++++++++++++++++++----------
 4 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 1c7fe8e417..5bf9fdc7a3 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -913,7 +913,8 @@ DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_while, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 
 DEF_HELPER_FLAGS_4(sve_subri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0674464695..ae853d21f2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -700,7 +700,7 @@ SINCDECP_z      00100101 .. 1010 d:1 u:1 10000 00 .... .....    @incdec2_pred
 CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 
 # SVE integer compare scalar count and limit
-WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
+WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
 ### SVE Integer Wide Immediate - Unpredicated Group
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b487d6f5f..700112e6cb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3745,7 +3745,7 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
-uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
+uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
@@ -3771,6 +3771,42 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+    intptr_t i, invcount, oprbits;
+    uint64_t bits;
+
+    if (count == 0) {
+        return do_zero(d, oprsz);
+    }
+
+    oprbits = oprsz * 8;
+    tcg_debug_assert(count <= oprbits);
+
+    bits = esz_mask;
+    if (oprbits & 63) {
+        bits &= MAKE_64BIT_MASK(0, oprbits & 63);
+    }
+
+    invcount = oprbits - count;
+    for (i = (oprsz - 1) / 8; i > invcount / 64; --i) {
+        d->p[i] = bits;
+        bits = esz_mask;
+    }
+
+    d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
+
+    while (--i >= 0) {
+        d->p[i] = 0;
+    }
+
+    return predtest_ones(d, oprsz, esz_mask);
+}
+
 /* Recursive reduction on a function;
  * C.f. the ARM ARM function ReducePredicated.
  *
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5380ed26c1..f833bd5e33 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3112,7 +3112,14 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
     TCGCond cond;
+    uint64_t maxval;
+    /* Note that GE/HS has a->eq == 0 and GT/HI has a->eq == 1. */
+    bool eq = a->eq == a->lt;
 
+    /* The greater-than conditions are all SVE2. */
+    if (!a->lt && !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3135,22 +3142,42 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
      */
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
-    tcg_gen_sub_i64(t0, op1, op0);
+
+    if (a->lt) {
+        tcg_gen_sub_i64(t0, op1, op0);
+        if (a->u) {
+            maxval = a->sf ? UINT64_MAX : UINT32_MAX;
+            cond = eq ? TCG_COND_LEU : TCG_COND_LTU;
+        } else {
+            maxval = a->sf ? INT64_MAX : INT32_MAX;
+            cond = eq ? TCG_COND_LE : TCG_COND_LT;
+        }
+    } else {
+        tcg_gen_sub_i64(t0, op0, op1);
+        if (a->u) {
+            maxval = 0;
+            cond = eq ? TCG_COND_GEU : TCG_COND_GTU;
+        } else {
+            maxval = a->sf ? INT64_MIN : INT32_MIN;
+            cond = eq ? TCG_COND_GE : TCG_COND_GT;
+        }
+    }
 
     tmax = tcg_const_i64(vsz >> a->esz);
-    if (a->eq) {
+    if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
 
-        /* If op1 is max (un)signed integer (and the only time the addition
-         * above could overflow), then we produce an all-true predicate by
-         * setting the count to the vector length.  This is because the
-         * pseudocode is described as an increment + compare loop, and the
-         * max integer would always compare true.
+        /*
+         * For the less-than while, if op1 is maxval (and the only time
+         * the addition above could overflow), then we produce an all-true
+         * predicate by setting the count to the vector length.  This is
+         * because the pseudocode is described as an increment + compare
+         * loop, and the maximum integer would always compare true.
+         * Similarly, the greater-than while has the same issue with the
+         * minimum integer due to the decrement + compare loop.
          */
-        tcg_gen_movi_i64(t1, (a->sf
-                              ? (a->u ? UINT64_MAX : INT64_MAX)
-                              : (a->u ? UINT32_MAX : INT32_MAX)));
+        tcg_gen_movi_i64(t1, maxval);
         tcg_gen_movcond_i64(TCG_COND_EQ, t0, op1, t1, tmax, t0);
     }
 
@@ -3159,9 +3186,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
-    cond = (a->u
-            ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
-            : (a->eq ? TCG_COND_LE : TCG_COND_LT));
     tcg_gen_movi_i64(t1, 0);
     tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
     tcg_temp_free_i64(t1);
@@ -3181,7 +3205,11 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_while(t2, ptr, t2, t3);
+    if (a->lt) {
+        gen_helper_sve_whilel(t2, ptr, t2, t3);
+    } else {
+        gen_helper_sve_whileg(t2, ptr, t2, t3);
+    }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
-- 
2.25.1
