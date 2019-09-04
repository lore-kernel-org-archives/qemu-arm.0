Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1151575wrp;
        Wed, 4 Sep 2019 13:14:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcpEx5HBTiBnDYDlMhqgYOVNGyhY7R54Ah9A2gUFzEpgKgcMz8c9lPvD5eVblb+8eoQACf
X-Received: by 2002:a17:906:6dd4:: with SMTP id j20mr35170559ejt.173.1567628044026;
        Wed, 04 Sep 2019 13:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628044; cv=none;
        d=google.com; s=arc-20160816;
        b=mgePLOZEAFgo654MOGjufUnw1YEkf9nQOLMRDhk1+4tfRGtoBFsFFPzsbtAxF+Per/
         /EpJexKfRO7pfE9cc45W4U+/6biyXNB0OJNxJO4/kJ5ws3OMznwD7Bmg4wguV4WNEawa
         4ysp1M+0Qo3f2ZFKkY+2CD5PoaZbQ7MFkqNP9UQ07qz6DN87GjiPgPmLGDZ2KsbIWqBh
         1QL3FUZxi+KM1wF548wFbWsm1KkOQAWgfKcrS3igRsNo4kqDfw4fJgGVUYSixQOIUGql
         OWDbijuQqm0OyTZe0FlSTCRZAHMoUnVJEb5ZRZ8+uBs1PHmrgm6DHAeLpPJ2fJabBZPc
         9R8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1o+uWqBuu4o1NL9VW7TCfscdl6K+gK/4Ohpfut2UuGg=;
        b=tXbrl5pckcOvzGIWeggjU+rXY6qHGVzgghtyKKoKGdibM85OC+TBlcUaqSpF0695Me
         ikRk8S9SvIm+Dc45C0dE25EYNYsPtQy5LC8xf0vEQR3OMIttP4hO8PamlqiVLa9sHHf3
         U+2TS7FsglUoD9Gj/zZo+/SGWQWeY+yaHw3vWkSIs2vhiIJYrjFBKfxrs1TPnViwsJ/H
         0SMO+3QdIuEZQ4LUcmdnZKv2uOGphu4Wp4zIWwHUp0+WLLF2RRjPV6O1xLdv5vyuNFOH
         K2+j+UQG05VnAFsb3rIjPwV02daBzckzjtS3xY+XMBiJMQGFreGnxmY3KJHNFgs7RWx6
         XGsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fNdd8Diu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk25si50534ejb.233.2019.09.04.13.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fNdd8Diu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bfG-000081-Ow
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0Y-0005EZ-N3
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0W-0002qG-II
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:58 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:33750)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0W-0002ow-8I
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id n190so11796091pgn.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1o+uWqBuu4o1NL9VW7TCfscdl6K+gK/4Ohpfut2UuGg=;
 b=fNdd8DiuTLcYPMGPz+kZGEZm4gOdHJ/qr/K3hJmq8zB+3wPlF8ErMIikd1RNliqWM/
 6IzjIlqCFvu2Y+zQkQdAjABeSb79T47F206LwD7yO9s6qn5mYuzUMjJ2PpxGjfuyQN/L
 mXgDlbbRg4PUSL5DNfnSSHK7PMVvkQjPwe3q5vZALDJKkmwlCzs61njv5oZQAwkL7jU0
 LIYdvIBNRXjOeb6Wn1lcn9yc2cqY5EPAYTHtvG79V2IXksLR5nBUFdY86lpBlQem6JZ7
 cEOOeEvItIPqJ3UB2EsOttSCI32ObEDyqU0U4kwzd7S2Y8F+0nxaMRL5+h9/7cnPW/vk
 aS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1o+uWqBuu4o1NL9VW7TCfscdl6K+gK/4Ohpfut2UuGg=;
 b=U7l7d6UC7FDB9U4WqSSkevh+6FPeILZ9ZL9PoDXPNeE1q/WRntuiMH7IqFQ3uDgmGG
 0dC7MD3YRFLlXH4CbBa6RINYjWEPGRPEXU3+a6NNNwtbZR59ZZCKU2miNCI8YnCIzQvK
 w2oEUqo07CU1ci1EByxQkrWmHoyJSq6JL+Z93NSLM5HBYJOg/O0PoFt89U7DOG23i5D6
 Qqol+mYwDEVjspkm6j5pcrNwvdU1+mT1gCY3WoyQ8k3G5J//2CluS0L85BkY40YnWmhE
 3Zx5YRRea2Jk/eaG58qQyd99GiX0FZ/z7lK88AaQytwkCyMwYKqlnfdSvomCkl6+psmB
 ZnzA==
X-Gm-Message-State: APjAAAUDdsbzd6tul40ob8EkdwrMIc6rKdXdtIv6p03rzGKs+cySklSn
 Ydb4y2vTcHVLpd/cGYzXHbI5Rw==
X-Received: by 2002:a63:9e54:: with SMTP id r20mr37649749pgo.64.1567625514948; 
 Wed, 04 Sep 2019 12:31:54 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:32 -0700
Message-Id: <20190904193059.26202-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v4 42/69] target/arm: Convert TT
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
X-TUID: nrFHdNSZgEXE

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Use unallocated_encoding.
---
 target/arm/translate.c | 90 ++++++++++++++----------------------------
 target/arm/t32.decode  |  5 ++-
 2 files changed, 34 insertions(+), 61 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index af7eddca48..46c27ea6a8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8495,6 +8495,33 @@ static bool trans_SG(DisasContext *s, arg_SG *a)
     return true;
 }
 
+static bool trans_TT(DisasContext *s, arg_TT *a)
+{
+    TCGv_i32 addr, tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    if (a->rd == 13 || a->rd == 15 || a->rn == 15) {
+        /* We UNDEF for these UNPREDICTABLE cases */
+        unallocated_encoding(s);
+        return true;
+    }
+    if (a->A && !s->v8m_secure) {
+        /* This case is UNDEFINED.  */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    addr = load_reg(s, a->rn);
+    tmp = tcg_const_i32((a->A << 1) | a->T);
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tcg_temp_free_i32(addr);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10525,7 +10552,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rs;
+    uint32_t rn;
     int op;
 
     /*
@@ -10569,70 +10596,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     /* fall back to legacy decoder */
 
     rn = (insn >> 16) & 0xf;
-    rs = (insn >> 12) & 0xf;
-    rd = (insn >> 8) & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
         abort();
     case 4:
-        if (insn & (1 << 22)) {
-            /* 0b1110_100x_x1xx_xxxx_xxxx_xxxx_xxxx_xxxx
-             * - load/store doubleword, load/store exclusive, ldacq/strel,
-             *   table branch, TT.
-             */
-            if (insn & 0x01200000) {
-                /* load/store dual, in decodetree */
-                goto illegal_op;
-            } else if ((insn & (1 << 23)) == 0) {
-                /* 0b1110_1000_010x_xxxx_xxxx_xxxx_xxxx_xxxx
-                 * - load/store exclusive word
-                 * - TT (v8M only)
-                 */
-                if (rs == 15) {
-                    if (!(insn & (1 << 20)) &&
-                        arm_dc_feature(s, ARM_FEATURE_M) &&
-                        arm_dc_feature(s, ARM_FEATURE_V8)) {
-                        /* 0b1110_1000_0100_xxxx_1111_xxxx_xxxx_xxxx
-                         *  - TT (v8M only)
-                         */
-                        bool alt = insn & (1 << 7);
-                        TCGv_i32 addr, op, ttresp;
-
-                        if ((insn & 0x3f) || rd == 13 || rd == 15 || rn == 15) {
-                            /* we UNDEF for these UNPREDICTABLE cases */
-                            goto illegal_op;
-                        }
-
-                        if (alt && !s->v8m_secure) {
-                            goto illegal_op;
-                        }
-
-                        addr = load_reg(s, rn);
-                        op = tcg_const_i32(extract32(insn, 6, 2));
-                        ttresp = tcg_temp_new_i32();
-                        gen_helper_v7m_tt(ttresp, cpu_env, addr, op);
-                        tcg_temp_free_i32(addr);
-                        tcg_temp_free_i32(op);
-                        store_reg(s, rd, ttresp);
-                        break;
-                    }
-                    goto illegal_op;
-                }
-                /* Load/store exclusive, in decodetree */
-                goto illegal_op;
-            } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch, in decodetree */
-                goto illegal_op;
-            } else {
-                /* Load/store exclusive, load-acq/store-rel, in decodetree */
-                goto illegal_op;
-            }
-        } else {
-            /* Load/store multiple, RFE, SRS, in decodetree */
-            goto illegal_op;
-        }
-        break;
+        /* All in decodetree */
+        goto illegal_op;
     case 5:
         /* All in decodetree */
         goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index c956ddb254..c63082fc9c 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -508,7 +508,10 @@ STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 @ldrex_d         .... .... .... rn:4 rt:4 rt2:4 .... .... \
                  &ldrex imm=0
 
-STREX            1110 1000 0100 .... .... .... .... ....      @strex_i
+{
+  TT             1110 1000 0100 rn:4 1111 rd:4 A:1 T:1 000000
+  STREX          1110 1000 0100 .... .... .... .... ....      @strex_i
+}
 STREXB           1110 1000 1100 .... .... 1111 0100 ....      @strex_0
 STREXH           1110 1000 1100 .... .... 1111 0101 ....      @strex_0
 STREXD_t32       1110 1000 1100 .... .... .... 0111 ....      @strex_d
-- 
2.17.1

