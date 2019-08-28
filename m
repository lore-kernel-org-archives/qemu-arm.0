Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1163605wrs;
        Wed, 28 Aug 2019 12:19:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPEqFGGcHMjtVU9sxw+ib6uTPklAgZ9RKhr44mukibtsW5oe0xE8xZO4WNlvxWNUYR9WSv
X-Received: by 2002:a37:9582:: with SMTP id x124mr5598842qkd.269.1567019958645;
        Wed, 28 Aug 2019 12:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019958; cv=none;
        d=google.com; s=arc-20160816;
        b=eT7PsZhH26Br9RVxw3PefBg6qjgPo/wA/4BuwtHj98cgtOJCB0fccy0aUTYgcerzIv
         amcvZ5PG/3kc14GYkhO1IqLkvYTISv1tiqbNvFP165eXsh9medYs8ubsEeJZb3SnhI3o
         DAlTlxXVqyO7YCQ2Lv1mPPHSVWd2QwN71KoXXyKOAyBrok2rA2GxCXEYahOwdumOdYoA
         j9ePTtPLE+ILXR1B1PWF9GLH8HYf48fSMH71ILCPOqML5rjiFyOT07vlz/wl+E8dDjUy
         tm62nk0vOUIgZYFgz4D4l5sQy+7IcGmvuaQmaolwjJdC0PRObIqqQFyw6YrmUBHmux3R
         0pnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=QCVrNyP4aQ0jX7CvYJg0KqtkiSJELZNM0Q5/bhu0tlI=;
        b=y7XhARdDtwd9kliqo9tZTc+YcEqjpAfG/fFngYRhd6aopZ+y4l+ZaISiGXRNgzOWy1
         pjRB71IZzCl2vQ/lRjfmUlx5gYGjLO86X/EB38oWs4MgUUORVqqvIF95Cdy56W9p9XVv
         v0KS3bCBhro2CpaeCbCb+o0BJtceQ50VgvWbxgwTQcAuEnzVA++8KoyROi0RAxPcfN2K
         17FQNcFED6eH8SARwlMAt/UzFrNp0bBAhaGw8qudfI5NjkpP2KRYOmZfFf74RG+FX6Wc
         oFGbM7wBACupkmAkG9wLg5VKn1/HLfnNok6+Ac0olUNjG0crzrpt91cjhapDU/ahleC0
         ds6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9ub4gFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d47si51281qte.90.2019.08.28.12.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9ub4gFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33TR-0007nY-DF
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33G2-0003N7-74
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33G0-0008U6-5N
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:25 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fz-0008Sj-QT
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:24 -0400
Received: by mail-pf1-x443.google.com with SMTP id y200so389500pfb.6
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QCVrNyP4aQ0jX7CvYJg0KqtkiSJELZNM0Q5/bhu0tlI=;
 b=L9ub4gFlnNTqqoViMGHLAPW95jwbeBVCJHQKC9zmbl44JbKBUXlk+U//kLRnbD7ueb
 MKFRR9CgFUJkuzs9ndYooe9WfLqDKc51fPjs0R3ilQ8W4cdGCRpsrv/7XB8SlAouY11T
 htYvPnUyfPdrj5g/IuBSu9s9Y4MtpvfDH9ghirN5LqjEbpSFyTj5X6AL71QeYO6VDBUY
 1uTrGJWgsY+2TidYV6c19vgxUBdclHrQY2glQZaTYdS6gmggWl2a10i5tbNmHQc+Q7y+
 YNOc9WIZPjtHUbTbt9OelhWuIOsa6E1JcGs78sZu6RAFwXeDCZoLbb8Glijh750CMWfD
 yRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QCVrNyP4aQ0jX7CvYJg0KqtkiSJELZNM0Q5/bhu0tlI=;
 b=ssQAKup5OvMLkuUB51WYoi8KMdXYZLKCNuXwIqUWC+qlRBa6p8JqCQfgLGEBqPxe1s
 4I3LMZaylxAiIKcsjJATrxRDt7UhI9BsFKCcQQZw4j0IIWg75xszvEnca+I6s4Px+SOQ
 IuHmkLKBQh4rcwGpxrpA4f724253nWWsGBEMviprcPbMECd3HsipvEXSMGkXSPYhIxku
 tR4eoEuphQbjXweBOpREWW+DPJ9Awz/Z3hKpEiiM6PIT1H1KK4Mghwm9QxUdLs7Vr2Z+
 4Ud2AKvhjo7OIV1eEPSTsW2pxsXd3u0hAiYYLN8EjaozjgpKXGywnC+UoswHwOW/tFQn
 ldkA==
X-Gm-Message-State: APjAAAXPXATpKQ7ZMqPGtazQQVlbj9DnxCga+k4dxefvyh1ZUsgjvcHx
 LEl4SnzHo3oVbuqmB1wwOotp+V4ZJAQ=
X-Received: by 2002:a17:90a:342d:: with SMTP id
 o42mr5916292pjb.27.1567019121835; 
 Wed, 28 Aug 2019 12:05:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:04 -0700
Message-Id: <20190828190456.30315-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v3 17/69] target/arm: Convert ERET
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
X-TUID: r2iGsjq8KhwM

Pass the T5 encoding of SUBS PC, LR, #IMM through the normal SUBS path
to make it clear exactly what's happening -- we hit ALUExceptionReturn
along that path.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Use unallocated_encoding for IS_USER check.
---
 target/arm/translate.c | 62 ++++++++++++++++--------------------------
 target/arm/a32.decode  |  2 ++
 target/arm/t32.decode  |  8 ++++++
 3 files changed, 33 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c285d4f882..203b6160da 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8477,6 +8477,27 @@ static bool trans_CLZ(DisasContext *s, arg_CLZ *a)
     return true;
 }
 
+static bool trans_ERET(DisasContext *s, arg_ERET *a)
+{
+    TCGv_i32 tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_V7VE)) {
+        return false;
+    }
+    if (IS_USER(s)) {
+        unallocated_encoding(s);
+        return true;
+    }
+    if (s->current_el == 2) {
+        /* ERET from Hyp uses ELR_Hyp, not LR */
+        tmp = load_cpu_field(elr_el[2]);
+    } else {
+        tmp = load_reg(s, 14);
+    }
+    gen_exception_return(s, tmp);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8771,29 +8792,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x4: /* crc32 */
             /* All done in decodetree.  Illegal ops reach here.  */
             goto illegal_op;
-        case 0x5:
-            /* Saturating addition and subtraction.  */
+        case 0x5: /* Saturating addition and subtraction.  */
+        case 0x6: /* ERET */
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
-        case 0x6: /* ERET */
-            if (op1 != 3) {
-                goto illegal_op;
-            }
-            if (!arm_dc_feature(s, ARM_FEATURE_V7VE)) {
-                goto illegal_op;
-            }
-            if ((insn & 0x000fff0f) != 0x0000000e) {
-                /* UNPREDICTABLE; we choose to UNDEF */
-                goto illegal_op;
-            }
-
-            if (s->current_el == 2) {
-                tmp = load_cpu_field(elr_el[2]);
-            } else {
-                tmp = load_reg(s, 14);
-            }
-            gen_exception_return(s, tmp);
-            break;
         case 7:
         {
             int imm16 = extract32(insn, 0, 4) | (extract32(insn, 8, 12) << 4);
@@ -10586,24 +10588,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     case 4: /* bxj, in decodetree */
                         goto illegal_op;
                     case 5: /* Exception return.  */
-                        if (IS_USER(s)) {
-                            goto illegal_op;
-                        }
-                        if (rn != 14 || rd != 15) {
-                            goto illegal_op;
-                        }
-                        if (s->current_el == 2) {
-                            /* ERET from Hyp uses ELR_Hyp, not LR */
-                            if (insn & 0xff) {
-                                goto illegal_op;
-                            }
-                            tmp = load_cpu_field(elr_el[2]);
-                        } else {
-                            tmp = load_reg(s, rn);
-                            tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
-                        }
-                        gen_exception_return(s, tmp);
-                        break;
                     case 6: /* MRS, in decodetree */
                     case 7: /* MSR, in decodetree */
                         goto illegal_op;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 182f2b6725..52a66dd1d5 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -211,3 +211,5 @@ BXJ              .... 0001 0010 1111 1111 1111 0010 ....      @rm
 BLX_r            .... 0001 0010 1111 1111 1111 0011 ....      @rm
 
 CLZ              .... 0001 0110 1111 .... 1111 0001 ....      @rdm
+
+ERET             ---- 0001 0110 0000 0000 0000 0110 1110
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 67724efe4b..6236d28b99 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -218,4 +218,12 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
     MSR_v7m      1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
   }
   BXJ            1111 0011 1100 rm:4 1000 1111 0000 0000      &r
+  {
+    # At v6T2, this is the T5 encoding of SUBS PC, LR, #IMM, and works as for
+    # every other encoding of SUBS.  With v7VE, IMM=0 is redefined as ERET.
+    # The distinction between the two only matters for Hyp mode.
+    ERET         1111 0011 1101 1110 1000 1111 0000 0000
+    SUB_rri      1111 0011 1101 1110 1000 1111 imm:8 \
+                 &s_rri_rot rot=0 s=1 rd=15 rn=14
+  }
 }
-- 
2.17.1

