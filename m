Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3201993wrs;
        Mon, 19 Aug 2019 15:19:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHj9Jfqb1eTfGtjqMcRulURMVa2SwG7vXQMfRShoEIvdREe5FTwyGBK0O8W7w+q9WPvSOQ
X-Received: by 2002:aed:3785:: with SMTP id j5mr22324807qtb.87.1566253162238;
        Mon, 19 Aug 2019 15:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253162; cv=none;
        d=google.com; s=arc-20160816;
        b=V4o3a9ivCu2aF1MOVlYbl4peReXS7YvEaMy+gZx466VsSWWN32LTozi/l8GqZTU1NM
         qeUoze3eSBNYKWh+8sWeIFr/fXArWjTDFhlEGZ5gnod/h6JvQuWta42qzeIeJeOCurz+
         3MaT8CtuuUlAA1d1hpzPzQFMmIqnLKDDPqGM3YYxGjvLjvemRMDr5HF30TsPC7E1LPoV
         ATeTT0L6DvQXMxxVO6jXV5VxVhGfiFAUo7FebPzs5EOsk18k2GqzhrYvO+SiqK/OdbcY
         wzXaXCM3xXkLpSe2HZjKUS7M33oAezmPW8HpqLfD7YmDyVcR4xxJF3kPby4V56oJszgR
         p3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=c57Ge3veQfkyW7vksKvqnmVUD20AJ8LyQ3MkWHHu68w=;
        b=bt1vj6G0tzLV8gjE1aepjjXWQF/Xsrf2YFMjK1H2bJdYMMDvwbwIODXs9IGDDDURXX
         jlNVWZRt1Um2qURRR48bB2WAm8IoOCmiVPZNhqY4X9wW+WpM8Tz3y8klug6/2wzNVW7A
         SSiQ6IbsgSy9qa4roMpCc/C0b7RAEnr5VfkDMjo6TB8bJU54WoeVWNM2mDHpj/sSuGjY
         97ARIuoE2CZe+EurkbLl5TVKzGizHEDfoPQrTA5BGAkAp8z30s6zb5oobng0uAO/ExgX
         yoMinOSL+81RkIQfswOv2zgYbw60zuVT1rnUyyb8j6lfKFP/Dk3X3YlAqx34Rsjf5Tp9
         S4HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCwIxhDj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si9372148qkf.93.2019.08.19.15.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCwIxhDj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpzl-00068A-Hj
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMf-0002S8-Bt
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMd-0006ci-8y
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:57 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41490)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMb-0006ZH-8T
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:54 -0400
Received: by mail-pl1-x641.google.com with SMTP id m9so1578429pls.8
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c57Ge3veQfkyW7vksKvqnmVUD20AJ8LyQ3MkWHHu68w=;
 b=DCwIxhDjQ+vIrTflFcWht7h6SrT3HijQEDrF5uGuRMnbgQOyuOcrOKlpTCutUHMmuJ
 HAh2+h4AHBPd19EdTEL1xc7uY4xoEEu8177qgEDabglk7DaGwaD7UiSHzlC0064M9WbC
 JYfeK/IwyV6eKqmM0K35aSn1SG7EOSYg7aXa3Nw3AEC1M9vh8URAk9Iq5RPK88/I2VqS
 8x0wCL+rHUgMQbsIjgglapkD2a/N5HVUEXNawSNd65/Mf2GhIY3pv5aivlg/QydC0guF
 ZRV754R0xllZtGSptpPtFh6gyBAim+exDg4tfLExGwmQZrdE9f5Pc0CC0uZ6FTE82m6u
 ozrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c57Ge3veQfkyW7vksKvqnmVUD20AJ8LyQ3MkWHHu68w=;
 b=UU4ok+YOFT33nfmrugHF+mPFFv8P1VolHA1gKbinhMeBR1pN2/wj7tPLp3GVd8e/i3
 zsMHCaGtt8kvtEzqDRFvGFtqUYSTG2xcOxpU1Kr7uddY5hD0mfD90/9eQhKQMHagfRez
 ULuF9UyMHJMCM1J7jDkpiNUdh2unhlcBAX71qm7W2v/ZhKkevgIRTmGanyazs7h3ZTfE
 GdtHNEKzOyag46schsfAJUYx6hfmaY6mozUyQA4E24q+bBZsGC3iRDvS8m8N5hhAkwCS
 j6zK80m4TGvf6BMW8P8P48/GQSwlvxukTYjxmHqjm7cKqdpmjibhHX7rFDxCtJoqimPZ
 63FA==
X-Gm-Message-State: APjAAAXzplIZ3PU1rX/9ADCkN/hKZuLDJLnr+sNPDf2QIRI0T7TA27bC
 FKniH0R9dx7TSVtUczzn0Cy287BFNk8=
X-Received: by 2002:a17:902:e48d:: with SMTP id
 cj13mr2127884plb.177.1566250729553; 
 Mon, 19 Aug 2019 14:38:49 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:30 -0700
Message-Id: <20190819213755.26175-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v2 43/68] target/arm: Simplify disas_arm_insn
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ng0rK6oega9j

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 69 ++++++++++--------------------------------
 1 file changed, 16 insertions(+), 53 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 25c74206c2..49bab7d863 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10245,7 +10245,7 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, op1;
+    unsigned int cond = insn >> 28;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -10255,7 +10255,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                            default_exception_el(s));
         return;
     }
-    cond = insn >> 28;
 
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
@@ -10320,11 +10319,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             return;
-        } else if ((insn & 0x0fe00000) == 0x0c400000) {
-            /* Coprocessor double register transfer.  */
-            ARCH(5TE);
-        } else if ((insn & 0x0f000010) == 0x0e000010) {
-            /* Additional coprocessor register transfer.  */
         }
         goto illegal_op;
     }
@@ -10339,55 +10333,24 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     }
     /* fall back to legacy decoder */
 
-    if ((insn & 0x0f900000) == 0x03000000) {
-        /* All done in decodetree.  Illegal ops reach here.  */
-        goto illegal_op;
-    } else if ((insn & 0x0f900000) == 0x01000000
-               && (insn & 0x00000090) != 0x00000090) {
-        /* miscellaneous instructions */
-        /* All done in decodetree.  Illegal ops reach here.  */
-        goto illegal_op;
-    } else if (((insn & 0x0e000000) == 0 &&
-                (insn & 0x00000090) != 0x90) ||
-               ((insn & 0x0e000000) == (1 << 25))) {
-        /* Data-processing (reg, reg-shift-reg, imm).  */
-        /* All done in decodetree.  Reach here for illegal ops.  */
-        goto illegal_op;
-    } else {
-        /* other instructions */
-        op1 = (insn >> 24) & 0xf;
-        switch(op1) {
-        case 0x0:
-        case 0x1:
-        case 0x4:
-        case 0x5:
-        case 0x6:
-        case 0x7:
-        case 0x08:
-        case 0x09:
-        case 0xa:
-        case 0xb:
-        case 0xf:
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-        case 0xc:
-        case 0xd:
-        case 0xe:
-            if (((insn >> 8) & 0xe) == 10) {
-                /* VFP.  */
-                if (disas_vfp_insn(s, insn)) {
-                    goto illegal_op;
-                }
-            } else if (disas_coproc_insn(s, insn)) {
-                /* Coprocessor.  */
+    switch ((insn >> 24) & 0xf) {
+    case 0xc:
+    case 0xd:
+    case 0xe:
+        if (((insn >> 8) & 0xe) == 10) {
+            /* VFP.  */
+            if (disas_vfp_insn(s, insn)) {
                 goto illegal_op;
             }
-            break;
-        default:
-        illegal_op:
-            unallocated_encoding(s);
-            break;
+        } else if (disas_coproc_insn(s, insn)) {
+            /* Coprocessor.  */
+            goto illegal_op;
         }
+        break;
+    default:
+    illegal_op:
+        unallocated_encoding(s);
+        break;
     }
 }
 
-- 
2.17.1

