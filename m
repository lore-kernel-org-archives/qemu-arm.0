Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207744wrv;
        Fri, 26 Jul 2019 10:51:41 -0700 (PDT)
X-Received: by 2002:a17:902:28:: with SMTP id 37mr90347234pla.188.1564163501865;
        Fri, 26 Jul 2019 10:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163501; cv=none;
        d=google.com; s=arc-20160816;
        b=EVzO60iLYL7Rdr39GO9qlNrAu/8lgL+CzOeDSOMv5rTp5VAx/QjCPZIYxY4jly1wzf
         oLCkKrKIDeIJvPwCbtC47t2PPJlVB341m4bZYVwrMaQie8ARx3uQEiyLrGPreKQyfufg
         hg8p64xqnNtGcFv89gJzSzpv9bgdrCeyl14TXXQszLU9BQsmXM61v3tYjpurrCrPRh6d
         zMp1bbCzteMV+IS8xtTFYNPTKn3ipohAZH46Kv/CwE0FIQTwXaa/unoj1inr1d44IFlO
         U9EXsKnPOeRT1vGbFy/OQzyWOAATVWpJL3kHIMUEQzg3xYtfZ3YEwu4SyCLfM40Kn6uy
         pkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ZAbTmn5IF7GueTfMYNm2AkgzbEYkr29V4U+PzJz5VKI=;
        b=NoGVIEFmBaf60EY622r9erMaEKnd4Y61LUsRYDXO9TpfSAObOHUbAzuChizN+dDfva
         RjMeGmD+epZRtCZT3qX/jcDqzQqWQ0gWFMl/9A2/dNIeJpM/58dpKApZ+ecPEFXUkLZn
         FSemn0YKmM8BGvo0RS+BpghMIiM8WH10qEk+72TUMsedOW6qVlPm503eU82ZSMj4QkvT
         KPqCALn8No0WjdRGjuiGRJcfD3f4hLP2Lq96bQriMzWiaITfBsBzm0b0jcLds85wAI+N
         ddY3mTDx/qdg0TJ0k8Vo76ShBgn9lDcg+pDU8xZfr+mRPdHInvbCejcHan43ogoi6t+Y
         pfgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u1/bN0yv";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10sor65054708pjy.12.2019.07.26.10.51.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u1/bN0yv";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZAbTmn5IF7GueTfMYNm2AkgzbEYkr29V4U+PzJz5VKI=;
        b=u1/bN0yvmLzzHZfwmGdJtqVQKUSWEOylJMAksCfq9jC94VNMAvZ3KCxdO1kjRUVRI6
         /bTeVsyiywp38B2aiqP//FyAkzUuRl95nOkshxh4D6x5g2A8+TwsmjmD2UM/dhvdWItc
         cC5txPzMn2csHMyVAQicSWkWb0VBDzdBsMkITEFB83azfPSRORtz/j9G/p48f30RBXGM
         zCr6V/F8+yN8j5yFjLQdbKntZoClfHfwad7andkRFLGfRiRZEh00ICVTiR39oUpdjfl/
         rjaffxT0QJgfGP9sEvNpbUVR4xDtiKs3tyRXi/ZfExQSKUIQPEVy58ZKY73hJsYukebj
         5iDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZAbTmn5IF7GueTfMYNm2AkgzbEYkr29V4U+PzJz5VKI=;
        b=XRvKOUNwpmuvY388YrS6x+mDfFoh+YuSRhNGJ7QKjj2FlVwtJ/UpePIolZj/WdUm+L
         ryCfXTh1UAXrHcAcDX9hsAORyboZDzOonEQm8AOQ9FUslQ4/gekOqUUB/0Tf0DWzLHqg
         NwiZFeNWk5kCKHei2c10ixTuugy3nUNwXXdEmm4PwdnGeK39YiuSdpPzhqZcRtsWkqJq
         te3XQtb+BQ/oA/4IUiKvTTXEu8EBsiZHiRhcSV60R9na0ueDN3hy7Wzji60R8FBKY2S2
         UCXWXhVMtKYY6iQSv5O1Gwn5V2UTiSo4NLDP48bcGwlWjPAFXGeYW7anCAWKshxfcQiX
         hfgQ==
X-Gm-Message-State: APjAAAX1O66TmeX8ONR/ppmV9s4eWIxoYJy3qHk/8UiWE6o5tnFVXec2
	+YthEtK/+ccP4sgCloKcl/TT87oZ
X-Google-Smtp-Source: APXvYqzrmQc1cWucSqv8uNqZ14ZglvHu5suHln/I2VRApib+EQhZYORbzAHoL+pLziNA3BSEVS9jMA==
X-Received: by 2002:a17:90a:ca0f:: with SMTP id x15mr53334493pjt.82.1564163501445;
        Fri, 26 Jul 2019 10:51:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 56/67] target/arm: Convert T16, Reverse bytes
Date: Fri, 26 Jul 2019 10:50:21 -0700
Message-Id: <20190726175032.6769-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 7q2okpaDGlX0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 18 +++---------------
 target/arm/t16.decode  |  9 +++++++++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8f2adbbc7d..c9386ceefb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10616,7 +10616,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rn, rd, shift, cond;
+    uint32_t val, op, rm, rd, shift, cond;
     int32_t offset;
     int i;
     TCGv_i32 tmp;
@@ -10815,20 +10815,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
                 break;
             }
 
-            /* Otherwise this is rev */
-            ARCH(6);
-            rn = (insn >> 3) & 0x7;
-            rd = insn & 0x7;
-            tmp = load_reg(s, rn);
-            switch (op1) {
-            case 0: tcg_gen_bswap32_i32(tmp, tmp); break;
-            case 1: gen_rev16(tmp, tmp); break;
-            case 3: gen_revsh(tmp, tmp); break;
-            default:
-                g_assert_not_reached();
-            }
-            store_reg(s, rd, tmp);
-            break;
+            /* Otherwise this is rev, in decodetree */
+            goto illegal_op;
         }
 
         case 6: /* setend, cps; in decodetree */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index f43ea6ce20..8864f89a81 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -24,6 +24,7 @@
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
 &rrr_rot         !extern rd rn rm rot
+&rr              !extern rd rm
 &ri              !extern rd imm
 &r               !extern rm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
@@ -195,3 +196,11 @@ SETEND          1011 0110 010 1 E:1 000         &setend
   CPS_v6m       1011 0110 011 im:1 00 I:1 F:1
   CPS           1011 0110 011 . 0 A:1 I:1 F:1   &cps mode=0 M=0 %imod
 }
+
+# Reverse bytes
+
+@rdm            .... .... .. rm:3 rd:3          &rr
+
+REV             1011 1010 00 ... ...            @rdm
+REV16           1011 1010 01 ... ...            @rdm
+REVSH           1011 1010 11 ... ...            @rdm
-- 
2.17.1
