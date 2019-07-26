Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207468wrv;
        Fri, 26 Jul 2019 10:51:26 -0700 (PDT)
X-Received: by 2002:a17:90a:9f0b:: with SMTP id n11mr60528161pjp.98.1564163486382;
        Fri, 26 Jul 2019 10:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163486; cv=none;
        d=google.com; s=arc-20160816;
        b=bP5F1zrRoJBG7u33v/B7xkt66TwdcVtGCPaHxQz00BPuwHMKeafEvnddsv3RF1nrpe
         aC8v/ohzb/7EC9kh5uVa1TZYL1hgznK7bxU1+IHiKOi17vjLiM9MCnP3hD5I2o9xAhDl
         SIbnskZvxsTDUlJQBeNKK8dFCwwj7j4UDVPflRc/993Tu0jx/cGxywR2tRKyXhDm8LJH
         PD1GM4kVbV5FdNfusZfj+MT7/Wit3N4BWTRUdTC51bxMKTFRiu0IBlcCsaasYXixd56+
         4Q49L0FnsNQHiMMC1pqhpak2rhtlYEMq9U5IKwH/2+LmLlo7Df0DBZHlum2f/pJHJ7P4
         L+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=W3BPBGeDUmZyQaUuLRW8yTB0WQP3Hy+VMnlWae7mNLI=;
        b=aFLyuoUydlI9l+vmB+HUGCdc6Tc67FeiDKDxRmaf9EaDVOTXEz+KcRLq0JxF+a92gw
         KJFQuZrKPLS6xfqiApQYMkjuO6bMyBmTK8Y0xv6MISoLb9e6q7Re3z6Q65ifG/eqQwlQ
         GBiXz27pHzd6yH6dzwS0++qMWfLMdVqWerHXJLgLzDFt4rVa8wBAhpep0OZ4Qjmx/H+P
         m8CNt37/ivsOx/aAwAMdHRWgsehsIb14yOphi4pbxYkDNTA73mMNNE66GGOmuRx9mJTu
         3OjP5GCS66RLU+2QCefjoN783U/DcKssdTWsAwPaj17xFsJC3PrdEjw2JaLMDHl/WD/x
         Urqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e2fvHXQI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m23sor65602608pjv.21.2019.07.26.10.51.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e2fvHXQI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W3BPBGeDUmZyQaUuLRW8yTB0WQP3Hy+VMnlWae7mNLI=;
        b=e2fvHXQIMl+wPOnNu8W2rqNL50WX5PTNxKgxp9oViVF2Nim5/j+AP4LFKxtn9xE34Z
         csnLdnCeetCKbD/GthGFGI7aiYowxav48QoktypnxNu2IpK0O4VJRbwMtXyMvXcV1f9F
         4ANePOseex7d16MGcl6GK3oeebjVVya2f/tw2VQ4kkKBLtskwxQUNPJAmBDpWSbq/Jb3
         DIllizJ9tLPPW9YGyS0WMHIUG6mad/nEkCHSAdb1btmILxccoFGQ1p5ukr2mwQa873dV
         b/+wX7xUQFNBhsP6NMRCL/dWbM3/2NvHOyflAINZ0UtZL8rf7jpBk+VP3lcn1kfpSf9j
         nBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W3BPBGeDUmZyQaUuLRW8yTB0WQP3Hy+VMnlWae7mNLI=;
        b=Pfg6XtFpN3fgIyPamI7sydY0sv0B2c2uOPn/BKHVBuRdySKD6b6RJV7C1jXY2X59wH
         8d881g0u0sWnkBYd5mJOr7sUqbs2vcolgxQPz+A3ux+KlpbTMsLr0xVmJCdn51MG9yez
         3nfxv9K9PkyHRTKhAyUvv84YYTD2H9oX0j7Lbno6csYKHJAHSCAhzbFp/vTohhtt55Ov
         DLHpIESJOlsBImY6jYQuMLn4HvODYzuQtr82pVlK6s9FIYmj80KLcItUlg/fQQQTCjwV
         MOx5HBtuU+s6gpTRDsyUPVw0BzQvDwLSc4Z59GGwCLNTFRlrLVouFmtuKlwTKWiF7/Qn
         f6Qw==
X-Gm-Message-State: APjAAAVK9mM4YQ0H3HIgwHv2o4WSlTU4nvGv+wD0/eBgWyevW0SaO9Zd
	k51aqOAob5SBbnXuIyuwWK+lpu0P
X-Google-Smtp-Source: APXvYqwEalD0r43IGyBY6NPFx5rHSCx/4gI+8fTOG4l5V80U9nIibdl82rLGe+Yz3ID35xhXwv9vOw==
X-Received: by 2002:a17:90a:c68c:: with SMTP id n12mr100875680pjt.29.1564163485938;
        Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 42/67] target/arm: Simplify disas_arm_insn
Date: Fri, 26 Jul 2019 10:50:07 -0700
Message-Id: <20190726175032.6769-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: VDdak23lfXMV

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 69 ++++++++++--------------------------------
 1 file changed, 16 insertions(+), 53 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 836b3752f7..65a74a963b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10257,7 +10257,7 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, op1;
+    unsigned int cond = insn >> 28;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -10267,7 +10267,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                            default_exception_el(s));
         return;
     }
-    cond = insn >> 28;
 
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
@@ -10332,11 +10331,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10348,55 +10342,24 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
-            gen_illegal_op(s);
-            break;
+        } else if (disas_coproc_insn(s, insn)) {
+            /* Coprocessor.  */
+            goto illegal_op;
         }
+        break;
+    default:
+    illegal_op:
+        gen_illegal_op(s);
+        break;
     }
 }
 
-- 
2.17.1
