Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629306lfr;
        Fri, 16 Apr 2021 11:31:17 -0700 (PDT)
X-Received: by 2002:a17:90a:8b16:: with SMTP id y22mr10828606pjn.191.1618597877240;
        Fri, 16 Apr 2021 11:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597877; cv=none;
        d=google.com; s=arc-20160816;
        b=clwgamlytF00cUDF930ph7GSiaLsL439RsNuXG3SMdcNCJpk0jEHQoJZWz/KFtSkSP
         jsdok18nuo5cTI9ytTyQPewmTk62jVqLVNNMspHRsr8MSDzTpNPtrukNmJYr5eFt2/wB
         5r961asKIDRwsoPOpDEH0lnUukQkhvpFLnTgGgaOMlZzaxXguWqZAwuhCWzvPTt12DLz
         8sBJlzpmdOZeo7+zgRxm+HT6NfQOVJsma54lX3oFZPeaQ1I7LIOZRty1JzfNlSY7ZV/x
         9Ku4lMnM2wteu2d2L1VRg8EnKWRrt2KUu9pdz/DUdkyv6/L5cu1Fok/lEzJzKpnonJnT
         9GjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1NtJeZCZXJQVsZg4wkjWgi0tGTthzJlM6W10jtA+8DA=;
        b=UMD93xF1SN+MNIOCDdTRmSk17G70Yoq9fcjQc3cBYasBbKyMlnwi+RwQo03duEDTvJ
         fX+hNu1ipfAEALphiio/pxsheZXPNpEC/Ll8Ltdl5bCFcC3Rn+tgFkkUnSOVGtz5cvLo
         LUHexT17mnnGfdkFMdlvb80PrJwB0dbkCkHtrB0Ms+NIcoRyKT9i0jTr+OlIcuOnFPGn
         1/awIxXZ4AAE5KiHPCfZyAo77uZzU45pciTuh3lS5aekBZNjqR++z9/BjyuOFGtMdk7y
         IDCrsLbnVVq5dPBDbeF6/Mj23oP6UHGezwuwNdMhj/3fTpa5fUVzBCTDsks5rEe46f24
         n1Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrRBuiSs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j3sor3360425pgp.82.2021.04.16.11.31.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Apr 2021 11:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrRBuiSs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1NtJeZCZXJQVsZg4wkjWgi0tGTthzJlM6W10jtA+8DA=;
        b=PrRBuiSsFoG/gXJHsn2xvFk27mF53yOWkk7C/lze+EwBxaZXwcJEWpzpkya4qZU6oy
         T7oE+9Ud9Sp8fE48GlN6VWtpEwuUOVnNUdUBte0LasroWG/69ZRr5GaYZj8rZzMmKXi9
         KB5Ds1DpVrcrXfQY0Jyy8t3X5atmnN6aMqqCN7CQKAJ3DosfKPLrIJeqr2H//MdnOpXK
         cgO+aPZyMTs++Y8zHEiVVM0QgZerngNcWuWMWmdxo1q5uOZQzf4or9BTtdim5OP+oe32
         GviuM6BNyj84Nd6XpppwSPc332mbJTonSQ12ugR1sLLtrd+uLQ9UpoK+0+IY5XFOHNns
         nURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NtJeZCZXJQVsZg4wkjWgi0tGTthzJlM6W10jtA+8DA=;
        b=ONufdhfmnPin18yBoBqC68iH/iv/uXNKU7Y92xNL2gFXiWpnhz1v0BVSDjMiFD4WBO
         zTy5shpib+iL9TNP0NMnVZ0onydUxWUzu1QdB7Rkcg4rwerwpxRKRppDGq/wSYPZXE29
         8V7omRoZQNrKg04KqXAkkRK0Dcmoag0NsdA3krFsprI1/HF8eTbkui8KLvZ4BWV+Mp0b
         21mJoDQ/YcFOnQlqUCRANJDc1DgwFr8gzA3jKJ9CourYqqBNyHb/VKuyemWUtSm9nmqW
         Coegzx/7dD100DLHfbT9hnYtwDdYnx30ifpfNrHl06s+na+Ry6XuKnj6aPZb2tlpQoNh
         lnrQ==
X-Gm-Message-State: AOAM530BGN52URx46J879LBSSEJKjdYX9BS3dhpZe6idP5SQqD0/s4hB
	jAkR4vBqhRN2KE/RCBC/P+tk0xc8
X-Google-Smtp-Source: ABdhPJyQ+nV377F9u+ktmo4ERWBcgX9Jl24SrONm/yD36xY79eWUS23PUksWkWGkP3jhwVaFDUrpvQ==
X-Received: by 2002:a63:4644:: with SMTP id v4mr394897pgk.316.1618597876798;
        Fri, 16 Apr 2021 11:31:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:31:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 9/9] target/arm: Remove log2_esize parameter to gen_mte_checkN
Date: Fri, 16 Apr 2021 11:31:06 -0700
Message-Id: <20210416183106.1516563-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JJnZ4D0FNMeT

The log2_esize parameter is not used except trivially.
Drop the parameter and the deferral to gen_mte_check1.

This fixes a bug in that the parameters as documented
in the header file were the reverse from those in the
implementation.  Which meant that translate-sve.c was
passing the parameters in the wrong order.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate-a64.c | 15 +++++++--------
 target/arm/translate-sve.c |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3668b671dd..868d355048 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -44,7 +44,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int count, int log2_esize);
+                        bool tag_checked, int size);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a68d5dd5d1..f35a5e8174 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -295,9 +295,9 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
  * For MTE, check multiple logical sequential accesses.
  */
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_esize, int total_size)
+                        bool tag_checked, int size)
 {
-    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {
+    if (tag_checked && s->mte_active[0]) {
         TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
@@ -306,7 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
@@ -315,7 +315,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
 
         return ret;
     }
-    return gen_mte_check1(s, addr, is_write, tag_checked, log2_esize);
+    return clean_data_tbi(s, addr);
 }
 
 typedef struct DisasCompare64 {
@@ -2965,8 +2965,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     }
 
     clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
-                                (wback || rn != 31) && !set_tag,
-                                size, 2 << size);
+                                (wback || rn != 31) && !set_tag, 2 << size);
 
     if (is_vector) {
         if (is_load) {
@@ -3713,7 +3712,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                size, total);
+                                total);
 
     /*
      * Consecutive little-endian elements from a single register
@@ -3866,7 +3865,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     tcg_rn = cpu_reg_sp(s, rn);
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
-                                scale, total);
+                                total);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5179c1f836..584c4d047c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4264,7 +4264,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /*
@@ -4352,7 +4352,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
-- 
2.25.1
