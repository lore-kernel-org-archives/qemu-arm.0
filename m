Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1145803wrp;
        Wed, 4 Sep 2019 13:07:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwE3FpM+3DEY9Sz+Ni8W4kfs+Ui5ehzg41FIpuX/M63OXssEPqumoHWu/aAwdzi0y35poAe
X-Received: by 2002:a17:906:c59:: with SMTP id t25mr34739985ejf.206.1567627675313;
        Wed, 04 Sep 2019 13:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627675; cv=none;
        d=google.com; s=arc-20160816;
        b=N3U/u+TESiCxlHF7oWgHMWoSFsZ4+/oRHC2NOCS5XChSIELqbaK0KjkDDWq1aYGJa4
         zOe4ec8Ir1l1uF4DLMuWkXmZaCfdvLIS62IfBljj5lRuYuNCU+BcmesOEu8UATkr4EHy
         yQoLiBY/G19D2LqHigI15N81AiFgBTy1ZVi7w8zl79Y7ZORr/wG4Q1qPwUytSMVkLEFG
         cExIkzFNNRsqUfbA3F8D7TR0CEdPbMP0uVOY4h0RfFWLqP4LtamibXuXSFnvoU9z0M9h
         zPIc9L6poMRliPu9thUXyMD2iz5fTziN9nBBemu/+jA80B8+0OCX/lzJQp8BJwLYdaqh
         TEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=3YTIbEYYLxo/KQorAmZTbgiM25Lefa2PHYOLeWCcYi0=;
        b=fKr5W3nzu6EeHaNvfVS+qPMXQSpGqBndF6Sd19LBypZo+z99yh7f1+hRaHYsI4BRrL
         my+tnAYogRQj3pWX+sJME5zsnWdWvbUqpdBfPumvJ+Yy2XMgygNDRKq8rRlr0q7+f58j
         MPEl+v5oTVvgNReyvtuTxt5CMcQ9kUi0/besMOxUMLJsUsf4j88VYM5oAEsXe5ttRxm7
         X5EYGb8IRWZII1Xh4EL7niHnssW2yhlOAtv4r+GZPhyhXgjh5y7APxM+29GZPwVYUrtx
         ef4mruNPufRXZzgxKolqFfmNcUL+2+kJbZn9Z90ID6Ju9oF29UY8MB3YxZI+H/TgBFLI
         vjBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWmnukhB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si50677ejd.171.2019.09.04.13.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sWmnukhB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bZJ-00026a-Kg
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0Z-0005Fx-QV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0X-0002rQ-ML
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:59 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41610)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0X-0002qU-5z
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:57 -0400
Received: by mail-pf1-x441.google.com with SMTP id b13so7277203pfo.8
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3YTIbEYYLxo/KQorAmZTbgiM25Lefa2PHYOLeWCcYi0=;
 b=sWmnukhBDGqqcv9TjfJdZ4SDcjn9MSCaKDM1tJlw3hc3tFSxec9rouYA6YODRBk0o7
 n94gEhbxKULseowqcYiiBCewkSsYUt8yq+el1xfOtPtk12nql1NRSzE7ZknirJ2Xcbd5
 ANt7aIWg/D1iLHRXqxnubmvKCKvXIHfTHrO4SgDq5tioVMz1lHYX7VZNzXRoxSmEZMQX
 jWSaxVv7e6fGN5ciAUK3BkJsRoz+mTHBpcesf1guc1o/EAkSKx2PWE3Ec9K87205CoUS
 LSLZMszDz8c1KSyKVlXoWjVSgrHfFA6yUZg8ZUO1na9EJTx1ae9wTM/rvhmx4WyYe7xU
 DZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3YTIbEYYLxo/KQorAmZTbgiM25Lefa2PHYOLeWCcYi0=;
 b=GAn0HERWJN+MeFCEl4dryKGTxplQtsPRxr2KcadS14wLF+hS/Up+U1+UvvTrM8Yv5I
 5j3mtMKoHpz115SXOaaGuQpYpXLIjDUx/Z9tMX3HVpxFosMJPVMRhIYV0u8FrGmLRAsT
 NsmGyV+Vp3HThqdCU0z/RwkQuMpowJfJzS64rJx0mfZpOqz0xVGSPUJPBRPaFnvF+N2f
 ne/VjWONt6LOGzTLSZkFuMzUQSdfgZ/tN32q3tnZxvsL9JEnYdOEQE3LNdTki1htGA8Y
 9AEJuyYh0NhTYfhdDUXybbiyS50Zd4kgmrrOkF4YDoepCeFl6UYc7BiYNSnHJ1qemq+E
 C+Tw==
X-Gm-Message-State: APjAAAVSr4qw0EUSiL7522IyBh6rS8z9seDt0tQrZhSEF5NSEHoGmPj+
 0gFqTWrSuqO40J7/Yr0Fgtd0hlH1ohY=
X-Received: by 2002:a63:f048:: with SMTP id s8mr35777496pgj.26.1567625516138; 
 Wed, 04 Sep 2019 12:31:56 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:33 -0700
Message-Id: <20190904193059.26202-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 43/69] target/arm: Simplify disas_thumb2_insn
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
X-TUID: GGGwPxjhidns

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 79 ++----------------------------------------
 1 file changed, 3 insertions(+), 76 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 46c27ea6a8..f68e09ff1f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10552,9 +10552,6 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rn;
-    int op;
-
     /*
      * ARMv6-M supports a limited subset of Thumb2 instructions.
      * Other Thumb1 architectures allow only 32-bit
@@ -10595,34 +10592,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
@@ -10651,6 +10624,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 }
 
                 if (arm_dc_feature(s, ARM_FEATURE_VFP)) {
+                    uint32_t rn = (insn >> 16) & 0xf;
                     TCGv_i32 fptr = load_reg(s, rn);
 
                     if (extract32(insn, 20, 1)) {
@@ -10709,50 +10683,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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
@@ -10760,14 +10690,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

