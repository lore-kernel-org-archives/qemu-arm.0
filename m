Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1121163wrp;
        Wed, 4 Sep 2019 12:40:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCiNDsGlbTusWy9LTzGukas9MoDKBeJe1YSfYJfSrBwq7YADWwFXtXgskSDSK3NvnalawX
X-Received: by 2002:a05:6402:7d1:: with SMTP id u17mr32847635edy.132.1567626024494;
        Wed, 04 Sep 2019 12:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626024; cv=none;
        d=google.com; s=arc-20160816;
        b=PIQajo71p4PKshEwQaPuRq1pP5NGlizOurAb8PEkCBpoWDyr1k3wq7Fc5ogu1otbDo
         RaeGtnLnCwUqDltt9oOaZJIhLbgDAwNoUEQ/fV1AAazdK5T+Wv9E/4Dw5+jUoxNJhkcG
         rfxcZ6Dx/QGAGsx27bzqFFm3knKH8GpeRWgoIbkf5rYl1f/FYBVEd4/ipbmnuu5/dja9
         59thabeT3fXPv+z+lQbPfrYajI4dZl0HgHg+/UeCbnIPuu4qx7adBTqy4hBzbr0VVxjR
         qiWO8iuC6K0kW3jPJ+JBrjsQBk5BFkHPB3cmW9kQcm2+kVKRIMoMWmNrzkNS+lq7Jpnw
         3YEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=DQ2Al2ZzVVcL195LoX3T2MlUUfcTCEsrN0xAjDQ6QOs=;
        b=mKvJzcsNLT1WKsTnDnEg/5XWfTOLDenb9/Jwj9C8feac5bcQnW815lkYTgpQg6jO3a
         6r19+H4O/2/Lws8DSEk5OgUWICSqFr2P5tMBdjUa90qgMkkuWJJQ3n7wvH+LSl30CRKd
         26GHf6uW/Zu1IGWGqxQt+Cm+1IuI/8K38p+BNSR/FiFczQ227K7var1TFDRGT7jzd0uh
         IN0PPCNQhLc707PrFAZI+TKeJ8P+1byijcFa8lYcz/zqFJfijUBpd09rjmSqo8FgsLqJ
         T2NMgTHFe6IzL2os1BohO8VRJCC/50cZxT480dOnB7cAcR3/OrARBfPSsveVYjRFyAJk
         ZquA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rzQPC7qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si3770ejr.389.2019.09.04.12.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rzQPC7qk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b8g-00050c-Pr
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azy-0004Ow-O9
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azw-0002Hg-Tv
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37781)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azw-0002HC-Mg
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id d1so11777997pgp.4
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DQ2Al2ZzVVcL195LoX3T2MlUUfcTCEsrN0xAjDQ6QOs=;
 b=rzQPC7qk+vBNALaK/ET6NoVKklI8sPNx+uJAEcv7SPlZJBWxxNa80iuJ3v9do3CZU+
 WY9JXwlvhKpatCZAbWsz0DBvgYj3f068/Jaf3tG73cZg7kXad0JY7XfGd0MdxkLn/DlW
 tLh2g+TO8XeiEZm3czeWtqS/fX4dZH+nUS2eRRHdDtsoEj9GMhJhcchJt7Y0Ys4Tfv2t
 woQEg3bOwsbmfxC4EMRHDE/o4DBuwM2YD1vietsH3DjQvOYAye9SMzDOQ9LJhcroOMK+
 iPAlqvp1X9kydUJHU6XuuPTA7lYZUou46u+eMpC98rm34dXShCNegGUEutcmWcaeIgYG
 o4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DQ2Al2ZzVVcL195LoX3T2MlUUfcTCEsrN0xAjDQ6QOs=;
 b=cwZcDeGGl74ZH31SkVmAqUa8Ng33bXHibHW1bTZ0vfWLmUfc56xjOepkkiXHGMtGsG
 X80roodBVu0SsHJ0sFCyEel+HTYk+3gWM6bUmf6VlHwYu5FAK1l8Or0cb6VwawJxdRPS
 dj6GueOYfCenNK3u+dsCugeMyuUBQGS/bULWTShRgRA6UEXvI218VLqzzqFBVhDf0jR9
 KWJnS6hQdcmHkdK0L5eLv1HQfPDg5CfpYCWk6oGmgyTVLmdhvSYXnIT5pGeCmViMUKjk
 3Lp6/eswM1RByTKETmt/cBBMF3wv9EkHrdqO3+cFajsCn53CuNW9Z8j2VqSJaUfqFhXr
 v8Bw==
X-Gm-Message-State: APjAAAWEhqTA5zIhEn12sazVfaZHSEV6sZrmY04s+4T9W++VTLl52GCo
 i/A0qqLmVMxCmUvi6q9yDdRVGA==
X-Received: by 2002:a63:5f09:: with SMTP id t9mr36814107pgb.351.1567625479605; 
 Wed, 04 Sep 2019 12:31:19 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:05 -0700
Message-Id: <20190904193059.26202-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::533
Subject: [Qemu-arm] [PATCH v4 15/69] target/arm: Convert BX, BXJ,
 BLX (register)
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
X-TUID: JPAQDNQRIA5N

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 78 ++++++++++++++++++++----------------------
 target/arm/a32.decode  |  7 ++++
 target/arm/t32.decode  |  2 ++
 3 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9d3f31f569..386a460bf5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8458,6 +8458,38 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     return true;
 }
 
+static bool trans_BX(DisasContext *s, arg_BX *a)
+{
+    if (!ENABLE_ARCH_4T) {
+        return false;
+    }
+    gen_bx(s, load_reg(s, a->rm));
+    return true;
+}
+
+static bool trans_BXJ(DisasContext *s, arg_BXJ *a)
+{
+    if (!ENABLE_ARCH_5J || arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    /* Trivial implementation equivalent to bx.  */
+    gen_bx(s, load_reg(s, a->rm));
+    return true;
+}
+
+static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
+{
+    TCGv_i32 tmp;
+
+    if (!ENABLE_ARCH_5) {
+        return false;
+    }
+    tmp = load_reg(s, a->rm);
+    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_bx(s, tmp);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8747,12 +8779,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             /* All done in decodetree.  Illegal ops already signalled.  */
             g_assert_not_reached();
         case 0x1:
-            if (op1 == 1) {
-                /* branch/exchange thumb (bx).  */
-                ARCH(4T);
-                tmp = load_reg(s, rm);
-                gen_bx(s, tmp);
-            } else if (op1 == 3) {
+            if (op1 == 3) {
                 /* clz */
                 ARCH(5);
                 rd = (insn >> 12) & 0xf;
@@ -8763,30 +8790,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             break;
-        case 0x2:
-            if (op1 == 1) {
-                ARCH(5J); /* bxj */
-                /* Trivial implementation equivalent to bx.  */
-                tmp = load_reg(s, rm);
-                gen_bx(s, tmp);
-            } else {
-                goto illegal_op;
-            }
-            break;
-        case 0x3:
-            if (op1 != 1)
-              goto illegal_op;
-
-            ARCH(5);
-            /* branch link/exchange thumb (blx) */
-            tmp = load_reg(s, rm);
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->base.pc_next);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-            break;
-        case 0x4:
-            /* crc32 */
+        case 0x2: /* bxj */
+        case 0x3: /* blx */
+        case 0x4: /* crc32 */
             /* All done in decodetree.  Illegal ops reach here.  */
             goto illegal_op;
         case 0x5:
@@ -10620,16 +10626,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             goto illegal_op;
                         }
                         break;
-                    case 4: /* bxj */
-                        /* Trivial implementation equivalent to bx.
-                         * This instruction doesn't exist at all for M-profile.
-                         */
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rn);
-                        gen_bx(s, tmp);
-                        break;
+                    case 4: /* bxj, in decodetree */
+                        goto illegal_op;
                     case 5: /* Exception return.  */
                         if (IS_USER(s)) {
                             goto illegal_op;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index a8ef435b15..6cb9c16e2f 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -29,6 +29,7 @@
 &s_rrrr          s rd rn rm ra
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
+&r               rm
 &msr_reg         rn r mask
 &mrs_reg         rd r
 &msr_bank        rn r sysm
@@ -195,8 +196,14 @@ CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
 
 %sysm            8:1 16:4
 
+@rm              ---- .... .... .... .... .... .... rm:4      &r
+
 MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
 MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
 
 MRS_reg          ---- 0001 0 r:1 00 1111   rd:4 0000 0000 0000  &mrs_reg
 MSR_reg          ---- 0001 0 r:1 10 mask:4 1111 0000 0000 rn:4  &msr_reg
+
+BX               .... 0001 0010 1111 1111 1111 0001 ....      @rm
+BXJ              .... 0001 0010 1111 1111 1111 0010 ....      @rm
+BLX_r            .... 0001 0010 1111 1111 1111 0011 ....      @rm
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 261db100ff..337706ebbe 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -26,6 +26,7 @@
 &s_rrrr          !extern s rd rn rm ra
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
+&r               !extern rm
 &msr_reg         !extern rn r mask
 &mrs_reg         !extern rd r
 &msr_bank        !extern rn r sysm
@@ -211,4 +212,5 @@ CRC32CW          1111 1010 1101 .... 1111 .... 1010 ....      @rndm
     MSR_reg      1111 0011 100 r:1 rn:4 1000 mask:4 0000 0000  &msr_reg
     MSR_v7m      1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
   }
+  BXJ            1111 0011 1100 rm:4 1000 1111 0000 0000      &r
 }
-- 
2.17.1

