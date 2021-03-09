Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955295lfg;
        Tue, 9 Mar 2021 08:21:18 -0800 (PST)
X-Received: by 2002:aca:aad6:: with SMTP id t205mr3533550oie.122.1615306878688;
        Tue, 09 Mar 2021 08:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306878; cv=none;
        d=google.com; s=arc-20160816;
        b=Wtfg7mpUZOW182hcRZVdKISgOo8XMAMwUmAhE6Ogg9e5ycdmZqoNU3coY1sOxrTxBE
         KNLPyZRtf6C8EHERwnOxx7C1PUda99cvfsx9Guxfs5T5p6a1NDVomIMbPY1wGCvPBeDp
         diU4WePiiEYCOoNicHe6TSLGE19uGNJEo2nGJ9k1S822TWLjVGHTyK4vhcql1DeHbtU6
         PRJz/3RgEGr2VXnujk1HqZJXl+bTwJbZpukPyupIg65poI1a3nFxjYCtEsEQVooVPKBI
         8tqylF2Pr80LXvk6UevlbDL3IR/Z4zHcDey8Fn1s+QtojlzD5TEFkuad5evpXSxUxPaU
         HZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OMON+uvzPOXYOLaXkReV00C37gevE1AfAAGsidJktiM=;
        b=gqdLYp3Jb3kAHxT1UX1UECW5ll3SYqMgT2uXYHXJRReB2w8r9Hgqg2zliR5lBoyZIW
         CIFkjB3H/FvBZc/VUuiIPogSvAJTg1yEikEQuQ+ttMN9HSX7z9xCurpXbSWSzlIi1Zl9
         1DE21qtZowbcqxZP7jLSv9JVrSBP+cbfbN2jUatWMZQ8BpzinQrb+JEu8xGQYAmdsheu
         vTT3TBgiHVxPg+wAv69bQDVHRykK90sLAN2tnbN+m7XC72zVRKIUfaaoGr/wNo0mCGAN
         v+cQDlFaly1gWXOKJDiELDGy+/g50ZaLtJwCWQqDWS8TpDSOaN22KYAiEVFJPJ99gtkK
         W6jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APWEuaf+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c66sor3271303otb.142.2021.03.09.08.21.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APWEuaf+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OMON+uvzPOXYOLaXkReV00C37gevE1AfAAGsidJktiM=;
        b=APWEuaf++rtiRyvVmr4jLO5CzwnWiKJxuezQBul9sXUTx1yjAcqT6o0CcKbL7+5e7O
         noDWRUy4F0MAW2rI8oAyYqcKctodTzCnPHef9ktQZ1hmpUw7QsW7QBeB/Bpfsia2fJZj
         DDUA2U0eCuuvsjhNS+1Glknksdk+GMuvBsDCa7amx20yY/a3b1/GDU61uiCvuyicIDyw
         AgdI3ULAkCJ9DYb/vN8uUw8d5VO9sGGVEMbsxH5YB8o4+8oq3ctiRpc5o1gTc8RhdnaZ
         G1Cmug+umZWbN4Gj8qFBNVp+rYAztJ7ztEXmeBhxN0WQSe00MWpStzctjt3l4si/ah50
         H5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OMON+uvzPOXYOLaXkReV00C37gevE1AfAAGsidJktiM=;
        b=IaR2QNpR9/1nTbypMy04x8PZis+hfnoy8y5O4+iZoDLKZCUHEzcUwdnTObtyvFwAlm
         iQwkpwZJluue6qvnDbsnmUYLWsV52gNl+HhCIDyB+tzvHhkZen/H5i8/uKtr34Hc6l/T
         Nj8J8ryGAdMQ3l4R8WsWQPIxH983W4JkkTZ9g2SUCZHcDi7hO7BhOmXKem55r1XfVmlj
         T+U3/EaobbSfSkOAxmd8lmSG4PntXO9pF07V+6wtmnhXNaQ46wIWIjHH8nzQt9rngWg2
         BnL3ZTRJBTf/l0iA4NHTVpzzmi6NZ+Pt6qfdl3OSqnEaMm/CxIpNz/AiRrZuhc4LlcFL
         jplg==
X-Gm-Message-State: AOAM533YD30fnrkZ3K9RI02bQImaYRx6W8ftvkdKFGl+EXujiNS/Rj3y
	Vzrz1HGffoz07znhj9OmAH8xex1M
X-Google-Smtp-Source: ABdhPJwxOCbTJkc7ToZmXR4s7rNzUrZ5TULDgbGW/9UcHqDXQY2WosJ2LyIqBSv7gPm23DGIjwVRvw==
X-Received: by 2002:a05:6830:4109:: with SMTP id w9mr24886152ott.176.1615306878286;
        Tue, 09 Mar 2021 08:21:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 31/78] target/arm: Implement SVE2 WHILERW, WHILEWR
Date: Tue,  9 Mar 2021 08:19:54 -0800
Message-Id: <20210309162041.23124-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1S0evtsP84I9

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix decodetree typo
v3: Fix iteration counts (zhiwei).
v4: Update for PREDDESC.
---
 target/arm/sve.decode      |  3 ++
 target/arm/translate-sve.c | 67 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ae853d21f2..f365907518 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -702,6 +702,9 @@ CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
+# SVE2 pointer conflict compare
+WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f833bd5e33..9e93223e62 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3218,6 +3218,73 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     return true;
 }
 
+static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
+{
+    TCGv_i64 op0, op1, diff, t1, tmax;
+    TCGv_i32 t2, t3;
+    TCGv_ptr ptr;
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    op0 = read_cpu_reg(s, a->rn, 1);
+    op1 = read_cpu_reg(s, a->rm, 1);
+
+    tmax = tcg_const_i64(vsz);
+    diff = tcg_temp_new_i64();
+
+    if (a->rw) {
+        /* WHILERW */
+        /* diff = abs(op1 - op0), noting that op0/1 are unsigned. */
+        t1 = tcg_temp_new_i64();
+        tcg_gen_sub_i64(diff, op0, op1);
+        tcg_gen_sub_i64(t1, op1, op0);
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
+        tcg_temp_free_i64(t1);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op1 == op0, diff == 0, and the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
+    } else {
+        /* WHILEWR */
+        tcg_gen_sub_i64(diff, op1, op0);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op0 >= op1, diff <= 0, the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
+    }
+
+    /* Bound to the maximum.  */
+    tcg_gen_umin_i64(diff, diff, tmax);
+    tcg_temp_free_i64(tmax);
+
+    /* Since we're bounded, pass as a 32-bit type.  */
+    t2 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t2, diff);
+    tcg_temp_free_i64(diff);
+
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    t3 = tcg_const_i32(desc);
+
+    ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
+
+    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    do_pred_flags(t2);
+
+    tcg_temp_free_ptr(ptr);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    return true;
+}
+
 /*
  *** SVE Integer Wide Immediate - Unpredicated Group
  */
-- 
2.25.1
