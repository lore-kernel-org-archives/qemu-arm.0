Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3191083wrs;
        Mon, 19 Aug 2019 15:05:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxl6AedmhqDE+7bpywLrPljFtPbgJwFqN4Y1g1RdVxG9JIL/95vYSjShQAiQbAOizhhBtvB
X-Received: by 2002:a17:906:8392:: with SMTP id p18mr23207078ejx.17.1566252344939;
        Mon, 19 Aug 2019 15:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252344; cv=none;
        d=google.com; s=arc-20160816;
        b=dfL1NecfDHzTKJAuUe/F3BahWlh/fEZa5C87mIY14RpRQLPMju6JE+Ur3ZxAG427x5
         VWSVyiDbRKR7FKCrEcjtFSQRTLekVqTJTKbekh8+2A8bBMZr45AQpo/mlZQQnSjXqqo+
         Thcs43uaesOWPI+rIq5Cas4MWRtkTg6oaOpMar21x7kh55dvfd7eyr6xd2C0wtj8BGxS
         y3EA715Tty4pWYqtOykw++PksFUzEtSRp/xGCkHRmjqpejjQacRI6tvpY7BkR2tlF4W5
         Hh99xUINcs9Y2jWE77nwdWYKMdG63o4eVtrBjh/1uzRJLwOykNWhGZiJESAoAFK+CiLG
         jaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ya11/VX/aRn7vG6mAkOVxrie0vDf0+2x0xJimT8Kw/s=;
        b=lp+0E9ry+G2Q1sFYL9P4fi93kuSo98i5ti0JPBajHcz836RptMBm6FmV1aC9kz9Byd
         jtlpf3HJh7AoY/kiyIkcHswVY/sAxdIYvC5ZKN9yCGuZ5aZ59AtC0OuQXVxGW8XFLWup
         cRJzZhs46Httr++Vbaj6+TFjytNWH4bjuJsvmJACh7pHxCF2F7mzFNMy3qWuz4eDj1d4
         8WXEga4YSK4NCQo2lmPjvwiQ4q2faNHmrc1I9ReUW6OCfiait6JKosIh+M5wFbWxO+bi
         hihE1u/1hV9Gb0y/4sijagB0ALAOY/8D2XW0OATMESfGHfvchQUQVzGByGHjNi+WHvt8
         9VIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I3cLjXuS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si9514215edi.158.2019.08.19.15.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I3cLjXuS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpmZ-0003uP-Gf
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMd-0002RC-Ci
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMb-0006bf-9G
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:55 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMX-0006Xz-CH
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:53 -0400
Received: by mail-pl1-x644.google.com with SMTP id y8so1579761plr.12
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ya11/VX/aRn7vG6mAkOVxrie0vDf0+2x0xJimT8Kw/s=;
 b=I3cLjXuSdVRvaHttEFWO9xBVqNs1NkIOgvZVedtNuoVMPL71J3umdP1DUTEkzHkCSJ
 KMDZSOE4l1CDRRan+IG4AprZMjriFaLecR9fv2URZ7NjbDPZAAYvx5huDgW1/sw1euGZ
 bEHpTWn89HiwJ2N+yqUrAqeSsT9YG1ILdHpjkIsk07CyPj6NLkTZYMiep26znN9lzY+Z
 nBNDMoSI/7K49b/f5I+r/PAb7D8VcXB32Kpw0cKPHl3VN34eOJ9BBucSubGXNqK5RYuE
 yoWDnwrcBiWg44E/ffk4oua5oTGg14oCYsyaGYayIkaSj12MxODfOiGUC5t5e0lBUIrE
 nPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ya11/VX/aRn7vG6mAkOVxrie0vDf0+2x0xJimT8Kw/s=;
 b=GQuGkprLL1AM467xjKgzL7z8eFTKmvItGqf4sIPzRz5uz25gosKN2SFqjtqAkbvGIE
 UkSbWrqF4P+gMHyO8GKpK1hrR3l5Do9Vbfz6AVNcf4ezndgYTcMwAyDt9R2fWSEpaikA
 xXx0MsOiqccvFA8LFHV0xAqjOdubLSu4S9ykqI4u9aKPqKw79XhGcrP3dyyT5Sn6WyPw
 slSp9ngymKXwUKw8910j12i1F89FaRwLrUIV77jFpXrauZnhyL5UQR+1huNrvoF+LZUt
 0QJ6lyqbectPt4R9+6JN1P6AwewXoqnVuj4LdFnctYAgmLeoIAXikLC4KlpITo4kkLEx
 0jcg==
X-Gm-Message-State: APjAAAVG9WoptO8T2+lt4iD+YSQriEEKlH3tIF7dw+mZuOpnZ3LTVYr/
 3WXwjlNr+xGPzHQ78W9nbUhtZOQi+0E=
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr24108861plk.180.1566250728492; 
 Mon, 19 Aug 2019 14:38:48 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:29 -0700
Message-Id: <20190819213755.26175-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v2 42/68] target/arm: Simplify disas_thumb2_insn
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
X-TUID: iVRYNgWG9udF

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 79 ++----------------------------------------
 1 file changed, 3 insertions(+), 76 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d1078ca1ec..25c74206c2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10433,9 +10433,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rn;
-    int op;
-
     /*
      * ARMv6-M supports a limited subset of Thumb2 instructions.
      * Other Thumb1 architectures allow only 32-bit
@@ -10476,34 +10473,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     }
     /* fall back to legacy decoder */
 
-    rn = (insn >> 16) & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
         abort();
-    case 4:
-        /* All in decodetree */
-        goto illegal_op;
-    case 5:
-        /* All in decodetree */
-        goto illegal_op;
-    case 13: /* Misc data processing.  */
-        op = ((insn >> 22) & 6) | ((insn >> 7) & 1);
-        if (op < 4 && (insn & 0xf000) != 0xf000)
-            goto illegal_op;
-        switch (op) {
-        case 0: /* Register controlled shift, in decodetree */
-        case 1: /* Sign/zero extend, in decodetree */
-        case 2: /* SIMD add/subtract, in decodetree */
-        case 3: /* Other data processing, in decodetree */
-            goto illegal_op;
-        case 4: case 5:
-            /* 32-bit multiply.  Sum of absolute differences, in decodetree */
-            goto illegal_op;
-        case 6: case 7: /* 64-bit multiply, Divide, in decodetree */
-            goto illegal_op;
-        }
-        break;
     case 6: case 7: case 14: case 15:
         /* Coprocessor.  */
         if (arm_dc_feature(s, ARM_FEATURE_M)) {
@@ -10532,6 +10505,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 }
 
                 if (arm_dc_feature(s, ARM_FEATURE_VFP)) {
+                    uint32_t rn = (insn >> 16) & 0xf;
                     TCGv_i32 fptr = load_reg(s, rn);
 
                     if (extract32(insn, 20, 1)) {
@@ -10590,50 +10564,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
         }
         break;
-    case 8: case 9: case 10: case 11:
-        if (insn & (1 << 15)) {
-            /* Branches, misc control.  */
-            if (insn & 0x5000) {
-                /* Unconditional branch, in decodetree */
-                goto illegal_op;
-            } else if (((insn >> 23) & 7) == 7) {
-                /* Misc control */
-                if (insn & (1 << 13))
-                    goto illegal_op;
-
-                if (insn & (1 << 26)) {
-                    /* hvc, smc, in decodetree */
-                    goto illegal_op;
-                } else {
-                    op = (insn >> 20) & 7;
-                    switch (op) {
-                    case 0: /* msr cpsr, in decodetree  */
-                    case 1: /* msr spsr, in decodetree  */
-                        goto illegal_op;
-                    case 2: /* cps, nop-hint, in decodetree */
-                        goto illegal_op;
-                    case 3: /* Special control operations, in decodetree */
-                    case 4: /* bxj, in decodetree */
-                        goto illegal_op;
-                    case 5: /* Exception return.  */
-                    case 6: /* MRS, in decodetree */
-                    case 7: /* MSR, in decodetree */
-                        goto illegal_op;
-                    }
-                }
-            } else {
-                /* Conditional branch, in decodetree */
-                goto illegal_op;
-            }
-        } else {
-            /*
-             * 0b1111_0xxx_xxxx_0xxx_xxxx_xxxx
-             *  - Data-processing (modified immediate, plain binary immediate)
-             * All in decodetree.
-             */
-            goto illegal_op;
-        }
-        break;
     case 12:
         if ((insn & 0x01100000) == 0x01000000) {
             if (disas_neon_ls_insn(s, insn)) {
@@ -10641,14 +10571,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
             break;
         }
-        /* Load/store single data item, in decodetree */
         goto illegal_op;
     default:
-        goto illegal_op;
+    illegal_op:
+        unallocated_encoding(s);
     }
-    return;
-illegal_op:
-    unallocated_encoding(s);
 }
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
-- 
2.17.1

