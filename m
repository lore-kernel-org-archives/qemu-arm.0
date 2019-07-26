Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207655wrv;
        Fri, 26 Jul 2019 10:51:36 -0700 (PDT)
X-Received: by 2002:a62:b408:: with SMTP id h8mr22960868pfn.46.1564163496419;
        Fri, 26 Jul 2019 10:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163496; cv=none;
        d=google.com; s=arc-20160816;
        b=NlgpG+ISHGy2UFqRbS5iQclyR0qGeTh88Eori0SrcxzfN5ue/thHQIZK4n4JfxKyLl
         NhI9fyE5dFzQdjQDhLLXPDO37ekvIhPKt7HF5hyu25ngaLWGYfTQZ957LM2gGuPJ53IX
         9JpVyVKxITTbLOsDp9gYtRnPF2FLr7S0y/saX17zHBBBBRRIZ346cGJ0TJ6muePSC3o3
         9HrilqPwWkJSfT1sgyBDDzUPn7qWyle3+3OtXmsoC8yaV4iFIsrYYlegTtYKCx4gTJtg
         DSMf4LB4rmRDFFR08cjS6hGiz3W3k4vwsSO+4oe4aiIC58NMxYLXd060Gdv5RLHh5GH8
         Se0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=IrOBDo+AXilRW3wlJP2NZAtzPEtyDf6q+uMfRAEA/NI=;
        b=BFuxisRE0VJu+cc1DIvHMNY2UkalrLl1P7NIUctVqyVIaqQ5HANwalUEd+nZBNmBRX
         6kyQib+4ksmS4iwtuVynvfR/sm/uaRlmOt5P7fQqBAl0USQR3+IJNNLEX8h4Eroro8j2
         WNMbl9jANTJSz7GF7eMxTkhAmOjqhTCoLEIQ4Mtjk4W9KdFgfWmyq/wgsdQ3zVK6rxzi
         81Qch6b+rya4awq14Vr0yjmuoOo3sBzpTZMCckeLPxxXBcnMiec8ULh9G5TrRuymdd7x
         Jq2mv8CBWSTNoVayugRha+U5F3i2OSuyjx8V9ZeBOi0wzRlPgaWRk0uUBTrovBW3MNmF
         Rccg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HoMVKWu0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j39sor65202744plb.22.2019.07.26.10.51.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HoMVKWu0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IrOBDo+AXilRW3wlJP2NZAtzPEtyDf6q+uMfRAEA/NI=;
        b=HoMVKWu0oOTa7UKx7ED5TontqAfti1JQ7VEe/rbHXTE6oXK41FnB8koKNRRa71pN5u
         syIBAu0/b9SOUGSx0Rt0Aua2n+KjsSgFnKGnT2pW8vHEQDBl2WSeNV1/vFeNAxwa/v4Q
         Tu8M3VjQY9QW9pS3aQUVEy+u/cDRtctHyw0WkzFqdQKVEEA5yS5A+eTtBw4IFUFgvZAe
         mJAh7sDsN9fZqnxRg3H1UQbVJ4POiLKiVdqubDzV+40lC5E6eS4/JUKDpqKAf++KtyN1
         hFrKhaVAfdwaPhF7KXln3gcXZEvMmT8h7ghX3OaKtOhRQw4s1ui45XsKGiLU29CFuqCQ
         re0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IrOBDo+AXilRW3wlJP2NZAtzPEtyDf6q+uMfRAEA/NI=;
        b=WS08xCAIS2KdUSJTi3rlWdhK3IXuq5jGVZeCkv2xBlPFxpft2oOoP4Wp3fLDltly3Y
         dXOzDcInzawNM5l+/2NkCWvCuawC/QEwlLlTe19kc0XTgydjidI1fGpZeVTDYx+x6lwc
         CZhjuxW2mSvinRFFNWDpuExo2zlxVRXFC6p8LR/WX0dcTWz/p3DiZVhOlMzKBQwdXLFo
         tGtcLEVFW+c+hwCpDn9mutBRewOhQq6P/5PJcAc+a1M2xKLuubC6Aa63B7m8lkSyWIed
         90mJaQQZO67LJsCDq0pxZmX76wCaAjJd5+uXjj3KQu/q+l9nYWcH6LWzn82u7e816hJZ
         IOqA==
X-Gm-Message-State: APjAAAUB9ieIkAvhn+c6EqQH5emphw9ck1k/weVxgpjANCvJF3OjhKEx
	B3Semd3SN6/Qd0pbCWdWbplFqfZLFEb6Aw==
X-Google-Smtp-Source: APXvYqy9OGNGKQ5h+et5+J+SrXhlN8lcWxk5kbiWRbKP6YLAch7y2QBgopRNTIUaAdnPXtiVHE4eLQ==
X-Received: by 2002:a17:902:e210:: with SMTP id ce16mr98753140plb.335.1564163496015;
        Fri, 26 Jul 2019 10:51:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 51/67] target/arm: Convert T16 branch and exchange
Date: Fri, 26 Jul 2019 10:50:16 -0700
Message-Id: <20190726175032.6769-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: GMg4PEURiD+3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 64 +++++++++++++++---------------------------
 target/arm/t16.decode  | 10 +++++++
 2 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9bdcb91537..e2183eb543 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8406,7 +8406,7 @@ static bool trans_BX(DisasContext *s, arg_BX *a)
     if (!ENABLE_ARCH_4T) {
         return false;
     }
-    gen_bx(s, load_reg(s, a->rm));
+    gen_bx_excret(s, load_reg(s, a->rm));
     return true;
 }
 
@@ -8433,6 +8433,26 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
     return true;
 }
 
+static bool trans_BXNS(DisasContext *s, arg_BXNS *a)
+{
+    if (!s->v8m_secure || IS_USER_ONLY) {
+        gen_illegal_op(s);
+    } else {
+        gen_bxns(s, a->rm);
+    }
+    return true;
+}
+
+static bool trans_BLXNS(DisasContext *s, arg_BLXNS *a)
+{
+    if (!s->v8m_secure || IS_USER_ONLY) {
+        gen_illegal_op(s);
+    } else {
+        gen_blxns(s, a->rm);
+    }
+    return true;
+}
+
 static bool trans_CLZ(DisasContext *s, arg_CLZ *a)
 {
     TCGv_i32 tmp;
@@ -10645,49 +10665,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
                 }
                 break;
             case 3:
-            {
                 /* 0b0100_0111_xxxx_xxxx
                  * - branch [and link] exchange thumb register
+                 * In decodetree
                  */
-                bool link = insn & (1 << 7);
-
-                if (insn & 3) {
-                    goto undef;
-                }
-                if (link) {
-                    ARCH(5);
-                }
-                if ((insn & 4)) {
-                    /* BXNS/BLXNS: only exists for v8M with the
-                     * security extensions, and always UNDEF if NonSecure.
-                     * We don't implement these in the user-only mode
-                     * either (in theory you can use them from Secure User
-                     * mode but they are too tied in to system emulation.)
-                     */
-                    if (!s->v8m_secure || IS_USER_ONLY) {
-                        goto undef;
-                    }
-                    if (link) {
-                        gen_blxns(s, rm);
-                    } else {
-                        gen_bxns(s, rm);
-                    }
-                    break;
-                }
-                /* BLX/BX */
-                tmp = load_reg(s, rm);
-                if (link) {
-                    val = (uint32_t)s->pc | 1;
-                    tmp2 = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(tmp2, val);
-                    store_reg(s, 14, tmp2);
-                    gen_bx(s, tmp);
-                } else {
-                    /* Only BX works as exception-return, not BLX */
-                    gen_bx_excret(s, tmp);
-                }
-                break;
-            }
+                goto illegal_op;
             }
             break;
         }
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index edb67a3896..4701f72357 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -24,6 +24,7 @@
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
 &ri              !extern rd imm
+&r               !extern rm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 &ldst_block      !extern rn i b u w list
@@ -144,3 +145,12 @@ MOV_rri         00100 ... ........              @arith_1i %s
 CMP_rri         00101 ... ........              @arith_1i s=1
 ADD_rri         00110 ... ........              @arith_1i %s
 SUB_rri         00111 ... ........              @arith_1i %s
+
+# Branch and exchange
+
+@branchr        .... .... . rm:4 ...            &r
+
+BX              0100 0111 0 .... 000            @branchr
+BLX_r           0100 0111 1 .... 000            @branchr
+BXNS            0100 0111 0 .... 100            @branchr
+BLXNS           0100 0111 1 .... 100            @branchr
-- 
2.17.1
