Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207543wrv;
        Fri, 26 Jul 2019 10:51:29 -0700 (PDT)
X-Received: by 2002:a62:7994:: with SMTP id u142mr23858943pfc.39.1564163489613;
        Fri, 26 Jul 2019 10:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163489; cv=none;
        d=google.com; s=arc-20160816;
        b=VbXwRkZm0Q+dGcjOBe5+VgZWHdJQcD4EryI60G1n3pF/ru+9p4DQz16huTotWOiLVm
         BwF1qIaUZm4T0R2MXsKyV1gIDIMGUC5uUsTCRtah9mReHgYiH2S4hfE4nVZGWYy8vzpQ
         txSDwTSETgIi5fzoamF42uKmSWa+Qoy4VLPWaVJ6k/6unLEn1bkjZoK8TAtIZJ3D79js
         5ftzx0KwMxRekNSX2ByE8JTD0mEV6WLzCyTKICCaXDNsRrXXlAkQ65pPgqLGcQsEhhUF
         S/W22+aselH3SbI2itmITS10xGC/xEr/j5tzBuv24x+u6hRqidHDFeLJmvTwF4CS0nlw
         hfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=DJdrX3hGPWd+nibN4wc0pBIHsM6KUMw+bIbJb3gnsWg=;
        b=vTWAEKTR3Luzeuof1kQxCczqtX5NbWNwfdYnAhAmyNHX4SgjH8nJ3krzW1zULG1HHE
         UhD+qoxe8Gsf1XXK4LGqRWJWqJyx1NfMzW5Xh1nBc/xFPLV4uffPf/YB+vUZ+6Tm+4eL
         isX7Aaa3NamcsfMP2w84cPInFrSWoofbPHhCL7d6jVHsJnNIbxoDvS6WB9Lnikhctt4L
         bGSS0TiERPn+luH4HdxQx24Jvu0UkyhW0zVkNTAszuCbImyr7w9/CCwXs5/21s667u4k
         kPqXVrXCjMk36rdhYuQjdQBi7N4wxRiWswQQALneG9BUxP147n8zQTKB2R/+MVXXtvOc
         ak5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMX8tfFk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z15sor30827321pfq.47.2019.07.26.10.51.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMX8tfFk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DJdrX3hGPWd+nibN4wc0pBIHsM6KUMw+bIbJb3gnsWg=;
        b=SMX8tfFkoYwIcv28vMhG4MahozdMyw8XYZvQYpm8lIsJRiHb2YmyH0RHZXRjuDqG8h
         aNaPPkmq5W0/5pVAmjCWfTw3wz9bM+uMD8/wWAd7UTVSZcmT3E1EswqaoFFdThQENjXW
         m6/AdnpmZt44SLMTqMHuS/1Ygct9wrRViSSX1T/N16/h31A7MIrgfc+3VctsYstZwYBF
         binQlAKZEC9FHXAt+6B1htgh6+w9laFYIrPMfNyZu/up+pEGglfJE8rnNYlPcS1VZbOD
         Tb+UqKL8bN/1z/8zfK4TddcX6zacp/nRkYa/T+205DTcD+r2xOL0uRy/6kbL+3xOLaUi
         +eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DJdrX3hGPWd+nibN4wc0pBIHsM6KUMw+bIbJb3gnsWg=;
        b=UdIWdcH4Sxo3BuaLgKsHOJqIxiSK/lGWQUhlrrAUSHHtKUumA5eLQ8Xf81O5eHDuBV
         OoI7s3RXiggGMRiPxlfaDki0iILziRkP15TKLwAiTmhG7Q6vno3G+8NNLD4VYtd6Zatg
         JC3imgLEjQhdVj0Svkf6AgAhI6gik5BgmwSubONS4UwmHgLOurwhuZ/1YfMVp9zx33hS
         6EwloMZBpPPSkfH0NLgG37tkLRH//cpF8K9942XvOiHZbqIlzLWOz0wKPVQCNeEjHYKy
         WiOlPwLEdpGWfYzW8pjbAm3XZdBztq1nN5NIrd1OFw2BrDHA4Wzl2xTfJHexWQ85c+FY
         94wA==
X-Gm-Message-State: APjAAAU7phe6riJzKhw1E7Lv9/8tpk586d1pszcNM+dL/veKm1SAxzNN
	436qwNFhlnSweyfBYS08633HajvA
X-Google-Smtp-Source: APXvYqxt5OeXyTqlms/fhyEnWqA7BM19XAhuclm4VyzXPMYj4CgieR1zEPJaoVEaJ23TsrDFfI/G/g==
X-Received: by 2002:a63:5823:: with SMTP id m35mr93897621pgb.329.1564163489154;
        Fri, 26 Jul 2019 10:51:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 45/67] target/arm: Convert T16 load/store (register offset)
Date: Fri, 26 Jul 2019 10:50:10 -0700
Message-Id: <20190726175032.6769-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: D9+8z1NMl4wa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++----------------------------------------
 target/arm/t16.decode  | 15 +++++++++++++
 2 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 17a0eea425..7b87621315 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10754,55 +10754,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         goto illegal_op;
 
     case 5:
-        /* load/store register offset.  */
-        rd = insn & 7;
-        rn = (insn >> 3) & 7;
-        rm = (insn >> 6) & 7;
-        op = (insn >> 9) & 7;
-        addr = load_reg(s, rn);
-        tmp = load_reg(s, rm);
-        tcg_gen_add_i32(addr, addr, tmp);
-        tcg_temp_free_i32(tmp);
-
-        if (op < 3) { /* store */
-            tmp = load_reg(s, rd);
-        } else {
-            tmp = tcg_temp_new_i32();
-        }
-
-        switch (op) {
-        case 0: /* str */
-            gen_aa32_st32_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 1: /* strh */
-            gen_aa32_st16_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 2: /* strb */
-            gen_aa32_st8_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 3: /* ldrsb */
-            gen_aa32_ld8s_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 4: /* ldr */
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 5: /* ldrh */
-            gen_aa32_ld16u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 6: /* ldrb */
-            gen_aa32_ld8u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 7: /* ldrsh */
-            gen_aa32_ld16s_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        }
-        if (op >= 3) { /* load */
-            store_reg(s, rd, tmp);
-        } else {
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
+        /* load/store register offset, in decodetree */
+        goto illegal_op;
 
     case 6:
         /* load/store word immediate offset */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 9833fc97e7..567c5005d6 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&ldst_rr         !extern p w u rn rt rm shimm shtype
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -54,3 +55,17 @@ ORR_rrri         010000 1100 ... ...            @lll_noshr
 MUL              010000 1101 rn:3 rd:3          &s_rrrr %s rm=%reg_0 ra=0
 BIC_rrri         010000 1110 ... ...            @lll_noshr
 MVN_rrri         010000 1111 ... ...            @lll_noshr
+
+# Load/store (register offset)
+
+@ldst_rr         ....... rm:3 rn:3 rt:3 \
+                 &ldst_rr p=1 w=0 u=1 shimm=0 shtype=0
+
+STR_rr           0101 000 ... ... ...           @ldst_rr
+STRH_rr          0101 001 ... ... ...           @ldst_rr
+STRB_rr          0101 010 ... ... ...           @ldst_rr
+LDRSB_rr         0101 011 ... ... ...           @ldst_rr
+LDR_rr           0101 100 ... ... ...           @ldst_rr
+LDRH_rr          0101 101 ... ... ...           @ldst_rr
+LDRB_rr          0101 110 ... ... ...           @ldst_rr
+LDRSH_rr         0101 111 ... ... ...           @ldst_rr
-- 
2.17.1
