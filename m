Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3196233wrs;
        Mon, 19 Aug 2019 15:11:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyixKNSpJ2JuQgx9o3X3wzrCuD3BdyPCEHhlMKnzNWkWNBBhsJE5W0qHZbCIuhEPL5F9YHl
X-Received: by 2002:a50:da02:: with SMTP id z2mr22531285edj.254.1566252709718;
        Mon, 19 Aug 2019 15:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252709; cv=none;
        d=google.com; s=arc-20160816;
        b=ck9y0Z3/dga7T9TwA6+rbhv6WK/Z3qIpQQEhnHQAPjCN6EMCff+z/ZSp+AKKdMTDtL
         FrR2H2q2wbrtPMSZLnzEcG4POtZ/PCe4l0tpPltW/v8UoXeZcDXK/B4quzYH4r8Xtp5+
         9Shfa28K5JcsJHbfB1O+cOlWZMJJOs2XKSPW6vDaoiLQGJucnJIkR5K53igyVUqjkcZW
         iFn70vmFRGot8NMvOTec2uLH9bhr9EZ8Xpt4NhtduE+nW7q9IBHNPdQUtQGHqtZAcRPq
         DnFCOYTbDAEPulIEi3xy/qo4XzNLv+CKpzQHIl7PaBJoUdDjBm77TJ9zSJ/bCXzp78zj
         N43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=xWTPQIHYecFzB/xCsq79DFxtQ/kqN477ghAb6EWu45A=;
        b=nZkCD/aWGN20p2mOFCfEM6enwyqJ7Ykb5kEr+8/1Om1wJHfm16/NqRXTAxymW0JXVl
         CJq7uyhQtXSdMoMnKYy5s6irBowLXgimTTXqnSHhohWev5MqTzy5xkBietxcchgXwGpN
         ESUFchDhyG8GE4otUakHdxzQFRsg20rHZ7dGh3BTJOTI4Bn5J1vORgf+Kz7zBnZz5cj2
         TrW1gbmqcqzStyFvDk6UDjSGhx2Wjfwq76/ADNG9mQ6eUqDC2B8w8Z/cM/Fwk9uNj3QB
         Y2yhWbJoMD2NoZwZ025CVAoUjHWxjxeCOn1Lvh0vNQfcAq0E5SwCxwdsmvwzgBiBrTDZ
         uHQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e8BwcgYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d46si9380242eda.190.2019.08.19.15.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e8BwcgYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpsS-0004z1-Co
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMl-0002aD-EK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMk-0006kA-5d
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:03 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMj-0006jX-Vo
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:02 -0400
Received: by mail-pg1-x541.google.com with SMTP id u17so1931788pgi.6
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xWTPQIHYecFzB/xCsq79DFxtQ/kqN477ghAb6EWu45A=;
 b=e8BwcgYXLMZDrO7gOFtA1K2tYWFxKf+QLeP7YzSCpyiYbNqRzRroQQs7AQOUdHOKW/
 jhQvujm7zMZEJc8Ddb2UJ09WZFbC6tvPQ9D6TLG9MNL2SxvR96Q7RUFqDCkjWRopJXo0
 hxPLqZJWOK9/cRzx4D6bs0o7FROvOi1KL4vb5e/4fC6mHzSB0Oy/uYCu+mS0vTl3sdj8
 QDu+MiQjKtFE7m0qADwskIcT0736i+wIu/nuwLGUzOHP5hGVitf9Rm0rzkWR7aAByzLh
 GULDdhV1zlsj9oQtVlElcoIw3hrqguwzoFtkZboIDquvpQtVLEiu4Zl6A+9BOGShUGQV
 LXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xWTPQIHYecFzB/xCsq79DFxtQ/kqN477ghAb6EWu45A=;
 b=qBBXYsD5+9G2VkPTqqnWFJPyqzHDaE5dxEhpNlEVMn3/Aav5w2kD3QBdxX9SA2yHL5
 KN6zCKV2VO8jLJbykKwkVEn9pr6CE8VHVJ0qWLC4TqV26s0MqcNVqM32+Ea2HTJtTVZo
 mVYWVHcqOm+HNZvB4aPrhrCj+8XAZNg6rcIIRI4mhHgA2NWC4MiUK/7xpy5taOVB+Xdk
 rW7lwkChrSPi5fzLxCjYTS6OTXbxjY69uqtVsNtiUwn6UcaIZUsXTmFIKA5/h7ryhZ4y
 Y3bO+LUue01v5yVhk5qpMaZV7w2cYewwAy9JIvOOXrHh0j5Dcm5iWwvSl2iPZzR/4w7E
 pncg==
X-Gm-Message-State: APjAAAUE2vpmA7hGf9tSEv9nh+n8RC3eI2ecbQCXL8oFEmO0/xqxanVK
 scClltKj/uKZBRdH3BEXcjw1dA==
X-Received: by 2002:a17:90a:ab01:: with SMTP id
 m1mr21966827pjq.69.1566250741075; 
 Mon, 19 Aug 2019 14:39:01 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:39 -0700
Message-Id: <20190819213755.26175-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v2 52/68] target/arm: Convert T16 branch and
 exchange
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHuPtMQAwqZX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 64 +++++++++++++++---------------------------
 target/arm/t16.decode  | 10 +++++++
 2 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3a3b113822..60bfc943a3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8335,7 +8335,7 @@ static bool trans_BX(DisasContext *s, arg_BX *a)
     if (!ENABLE_ARCH_4T) {
         return false;
     }
-    gen_bx(s, load_reg(s, a->rm));
+    gen_bx_excret(s, load_reg(s, a->rm));
     return true;
 }
 
@@ -8362,6 +8362,26 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
     return true;
 }
 
+static bool trans_BXNS(DisasContext *s, arg_BXNS *a)
+{
+    if (!s->v8m_secure || IS_USER_ONLY) {
+        unallocated_encoding(s);
+    } else {
+        gen_bxns(s, a->rm);
+    }
+    return true;
+}
+
+static bool trans_BLXNS(DisasContext *s, arg_BLXNS *a)
+{
+    if (!s->v8m_secure || IS_USER_ONLY) {
+        unallocated_encoding(s);
+    } else {
+        gen_blxns(s, a->rm);
+    }
+    return true;
+}
+
 static bool trans_CLZ(DisasContext *s, arg_CLZ *a)
 {
     TCGv_i32 tmp;
@@ -10637,49 +10657,11 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
-                    val = (uint32_t)s->base.pc_next | 1;
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
index 0654275e68..edddbfb9b8 100644
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
@@ -144,3 +145,12 @@ MOV_rxi         00100 ... ........              @arith_1i %s
 CMP_xri         00101 ... ........              @arith_1i s=1
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

