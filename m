Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1162367wrp;
        Wed, 4 Sep 2019 13:26:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLG1iOb8uUkItIWpg9iK1MTUOsSgkwKyKW4bqu+Z6ep9vOH8WNIJZvG1mDDZqiPqdpn9pX
X-Received: by 2002:a50:8961:: with SMTP id f30mr155294edf.144.1567628808754;
        Wed, 04 Sep 2019 13:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628808; cv=none;
        d=google.com; s=arc-20160816;
        b=xdiuMSXb1BkmTvdYLq85hAz9PHkuX2FEeIlQ47A9sLzwlQDKrb2DYqlJudFbTCsBtp
         RdYL6OipbFyQ9uLNdcIjGMvvsOXG2+k6MKYYhFAJEe6zMEnsV96kIQvC4inQ+9EeHga9
         /ukU6ANwWJnA+ffWNinSP8Jr4be8FjLFgTolbuo/i9WwFryS2EJCfn96ERU/I/K/u/Jq
         Y2QRdA0wIbONZ1yNWgM+edtJCyhbuoKRfs+BQHiluvXvJ6p2ccBVRdphR5vMsrorWiu0
         SaakOQUw1U89qJuUrW/g8Ofq/xpaqsFPb+hTadPizCVLLSgOQ82vNQ4SPgTjy+0O93zq
         34fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VzsNEJ79vBBXHa6di56eotbjbD089opoeS7FPmrAgFs=;
        b=WmM5GeY3pIMjuhpIGvGOOCBFual6UZgoSJE7ct9sZdmMnfKKwOA+GlMbkLsyIPh06f
         +psAFmC/xzETb9U9hQ4MULyaofAm04KPOm6Gm+L2ed4KyIkydzgxttpBaiUpyNMdFV8s
         /+uOkKtVQbaRwtU+EC5I30jzt09+VWD3ioH1zx9LdWMmIk/KMj1w7p/VDYbHguvwjWVM
         D96nlxax0HkrrosaNP7UGXAYnzOPw8e03+xkSQs4VA/U+WNWAWQGwdyxQsveT9kjEH2r
         HR4n5Dr0LzKQyTBYrjy6ibvVVlndoELmEpN2C7cc2aLRy1LcICQETKZrzwOSV2gZkv5F
         +RYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYOf+kyO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t58si14041583edd.220.2019.09.04.13.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYOf+kyO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5brb-0004Oz-9K
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0a-0005HW-Se
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0Y-0002si-Lb
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:00 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0Y-0002rY-CS
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:58 -0400
Received: by mail-pf1-x444.google.com with SMTP id s12so6917158pfe.6
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VzsNEJ79vBBXHa6di56eotbjbD089opoeS7FPmrAgFs=;
 b=hYOf+kyOC9AZ+E0vgO5tCaEmGZjWMRbuJk28WTnMTHv6EuLVa+7DBJc/eksBzZo3ei
 dfExrjpYNfdJRIuoi+MKnL2DXyOsStqRfz3w1yWlS2W+I/4h2uAtEtzo3RP3zhjJrGH9
 tjaLNGjFGa8dBAVjJA7RWZZ6zNVMn3r80s/0kk//6JQMKkD4MVpYese8MTXahI9d9Osj
 pmXmn+dWSymsAAgUGwNvqFVZtnGGkwwD6/XATdAsSCKijQZHauCbH8kS18D67WEyUqP2
 oH/NYHq1etyDOUttNqtOHaYJwQJbclcgrT+0dyhkXQoWHzyO2E0fyIX+ot7TW7vSgCA+
 5A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VzsNEJ79vBBXHa6di56eotbjbD089opoeS7FPmrAgFs=;
 b=ZGYU8t6Y9Xv90IS/Xct5M0OQ5jjTZmxN4QpVWKOc6/uVXSDzyuuTm34NkdlZXcby11
 K4p/ZTe0B110zMleEtZXDieBZpjrr2/fFSQM+nk0JU3BmB6ApsT6jA96T6Xt77Qqmw0k
 Pg1wUI339VcRlgk7Sn0Lh4AAaxJ4U52OPBZcxrHXplV1CCgF3HPaADYXaWhfQnSNrarf
 A5gwtJnKeancP3+2K6XdnzxctEBzAps2/sLt3ZwVByy5eqva5Wg8QtOKcDbQN3Rpwh23
 Szk/3oB2HG0v8/EEInCvFaiQC/T6kcvvMHB1Gpo0mfmv7wLpbjI7Wuj2nMM0pfOkTsaZ
 f0Uw==
X-Gm-Message-State: APjAAAWVVqEKFT2MtonRA49pEuSDHWms/7BNrw87czuW2qN03cCFiseV
 Ny/FSlb81eXiUZ5pej7zygGndw==
X-Received: by 2002:a63:755e:: with SMTP id f30mr36601200pgn.246.1567625517269; 
 Wed, 04 Sep 2019 12:31:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:34 -0700
Message-Id: <20190904193059.26202-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v4 44/69] target/arm: Simplify disas_arm_insn
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
X-TUID: +UMIPzOYEW67

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 69 ++++++++++--------------------------------
 1 file changed, 16 insertions(+), 53 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f68e09ff1f..7f2a46100e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10364,7 +10364,7 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, op1;
+    unsigned int cond = insn >> 28;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -10374,7 +10374,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                            default_exception_el(s));
         return;
     }
-    cond = insn >> 28;
 
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
@@ -10439,11 +10438,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10458,55 +10452,24 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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

