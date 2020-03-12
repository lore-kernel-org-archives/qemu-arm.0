Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087492lfc;
        Thu, 12 Mar 2020 12:42:42 -0700 (PDT)
X-Received: by 2002:a63:f450:: with SMTP id p16mr9581062pgk.211.1584042162592;
        Thu, 12 Mar 2020 12:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042162; cv=none;
        d=google.com; s=arc-20160816;
        b=KYstgmJSe6OK2XY2Iz/BpvbBU+j0JcQPpZze47ikvSDc/6CPfpXN6sDzB3j16OnTTk
         mRAC+bb2e2UrSpdzkrdSOWx2uE9fkg8uD4QUF5rPQjvlIhMbRxuU4n0ziRT1XkbM0z1b
         BzhRMtVJqJ8B/jysX3OxdnGzTMk7eqNdogyqzJkuNBbsNuAcygsO/IFHszvR82rj1i9D
         kwB0uATFwIoH14CguKpqRDlyS9DfKshjgmVC6x3ph5eCFvjieZWbeTbEqwIf6mFbT3FO
         V5OrTiKsujBMFrLwkDoKlwwMxn+rrgQABQU7HbIb66i2fpOEaNWtYdBQzaL7rdYwL3BI
         4keg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Smx0MhjIAblCuxDsW4fQawwrkcOGFEYFkfhp999nt6s=;
        b=k55vznsPgttHmg/CIU3yi3Xz2lTPjbo0OahrjlLZg5RPGys+lqJQ40kL/aW2nouU3w
         b9Hi0CJUqJreuCCWWxl6y9/CRMeGKhzZDjgaOvcdPjtWYhmRJDxCIWll3aCY5mX+SavI
         rH9gFyUI0ZHBQWoney5Uj3CEFChJQA9weD7g/Kupjz2v/rVFA3hEVSG8QG3ebXldGYA0
         dZAffvXE14ehVW4VBtDNdJV8pxgyFko82f6nOmlY+H6dZ+9rniUw5gcVV30HcilgpXmW
         DvGdKKuHXScjAWFpAPHx3je/kpq0uyjrhTe56U698IwfoEGbLqTNXWezBIyOxK1J1gkX
         Xe2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbH31Di9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w8sor5207355pfj.2.2020.03.12.12.42.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbH31Di9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Smx0MhjIAblCuxDsW4fQawwrkcOGFEYFkfhp999nt6s=;
        b=cbH31Di9eWnm7xBxmIPPoPDx6u3hvM44tAQf8SBzLmev6t6MsJ6JKpAggJ1kdMIwfr
         29QLsWOLKIV/GBdBFAAos/1SSoYkdRQilSvqfqKDFGXMwK9VS3y9KBtq3uMMPdZRCweJ
         SSRyK9dc4ZfGdnxxXSZQC5PM2CXC7+sEe9ASQOUS0crepDcrmxQvZW65dDSxQ7kaZvH6
         zGNBjwLwSrE8O2nPwLsuYr1Df93Ch4zHAUKTJanlZW0WmY/47IveniyARmTirq4oVHt9
         Pyz6vC5hjrOVfaDZD5vkb0STwSCM16TKFFs1xGqFQUNSEauidiYeFy6byIk5AcFOulJ/
         8SbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Smx0MhjIAblCuxDsW4fQawwrkcOGFEYFkfhp999nt6s=;
        b=bik3SN6z+ksv+Lqa1SpxSLLKRqXGAG5lbFrsBlP05sJojLImnInqqexmUrkNeuZDFw
         aGntwygFckUOn/PdvlNCOXfnjfKWAydH3/gkH5XlWrpu72a6FJlg8ZfZrdP1+jGzgImI
         Uqi7gJmLumjM6dEaSvXoIs/C4Xd3eqj1gttzDSdFzvtWZSdy0Mf/sBXulQ57l98x1fFG
         Yjx22cTcmDOv+bXZWnM+DxRlcwIvagaRmekEPN08hnRzqeK1pS/Etnj18mwVYFiSqprC
         iv/HLVCU/AVH3FqbYIL4AKphulRbT1UAdsFWGnh6ka+SGpJ3ZmKIHMvWtzWUCoSAtzMK
         4IhQ==
X-Gm-Message-State: ANhLgQ0rE9JQkK5Uz06IDvSx+0BgllJ2JtS/Q7MVtSvBgDV94mX1T8Mh
	ZWEfyyJj8f2n28gtl1kAgpkDY+AL
X-Google-Smtp-Source: ADFU+vsUYgo0QV0IXMcrceFM0NBZFcc5/in0k4BkSy9QTqsscMASK4d+LJD/JrBlupmDKJw33F3Jaw==
X-Received: by 2002:a62:be0a:: with SMTP id l10mr10243743pff.110.1584042162090;
        Thu, 12 Mar 2020 12:42:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 16/42] target/arm: Implement the STGP instruction
Date: Thu, 12 Mar 2020 12:41:53 -0700
Message-Id: <20200312194219.24406-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HGTD59ttIRxC

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Handle atomicity, require pre-cleaned address.
v6: Fix constant offset shift, non-checked address, use pre-computed ata.
---
 target/arm/translate-a64.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b99973b5b1..048140ddc0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2735,7 +2735,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2760,6 +2760,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2772,6 +2773,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2812,7 +2821,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
         return;
     }
 
-    offset <<= size;
+    offset <<= (set_tag ? LOG2_TAG_GRANULE : size);
 
     if (rn == 31) {
         gen_check_sp_alignment(s);
@@ -2822,8 +2831,22 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr);
 
+    if (set_tag) {
+        if (!s->ata) {
+             /*
+              * TODO: We could rely on the stores below, at least for
+              * system mode, if we arrange to add MO_ALIGN_16.
+              */
+            gen_helper_stg_stub(cpu_env, dirty_addr);
+        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
+            gen_helper_stg_parallel(cpu_env, dirty_addr, dirty_addr);
+        } else {
+            gen_helper_stg(cpu_env, dirty_addr, dirty_addr);
+        }
+    }
+
+    clean_addr = clean_data_tbi(s, dirty_addr);
     if (is_vector) {
         if (is_load) {
             do_fp_ld(s, rt, clean_addr, size);
-- 
2.20.1
