Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3184781wrs;
        Mon, 19 Aug 2019 14:59:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSGyhC6MdEqIyo38MRZcQTHyb0J1Dd3xVQUkBqGCvdrZnN4UrxCm/g1KyOSacXkV7qOsO6
X-Received: by 2002:a17:907:217b:: with SMTP id rl27mr23130579ejb.154.1566251943117;
        Mon, 19 Aug 2019 14:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251943; cv=none;
        d=google.com; s=arc-20160816;
        b=IYVTkJPC9F61VQCO1hvXUz+C3GdWlG+Gjt/ufsc5CZdlODNDtjW1DKh90SJZ1vyWyb
         fBQDH4H12ZDyzBfigqEAVGNSdwCUiP4/E/XjHipGs4bcOvNyl1DG8wqcP2JsmsHjZTlA
         DSZyF9QHq7AUEIEpa9Vj33js6gN9Uztuk+dhbyjjjUYDpyp+4NLQAhjr6ej/GZNigWfa
         KUiCnaCSzbDSWFziXLPBPnPmMTEfGL4Hidr1t/w/6NY5AX449J0OceP5BkyIy4Iw2HZP
         JmjldHiLSbl+50d9Q6C/AZRABdtcXlOXbuvpSwDXk7LpZiw9IunL+AaKcSJPDSDEahN7
         oFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=e+H++wAKyA1U/1YuB/2iGYEbH8KDD+Sy3cPPJBo/ztc=;
        b=ftR3DO/A4497Jfvb6d09kaWl6333xCLpkAIJG3jpqcsuIDrV/zDWT6/+BLEiESXSNI
         uYF3umM2pjrjysLJwaXwWPVVfrpGvgl4efzDvJcnH6DMTD7KoTIb8Ej3f6dW9l8qi8yu
         F3SuoJZdIVPqZ2n7qS2ulFcuHzCj2dSre7f1lIccwYZLp257B1V/ejTaOZPAgqcPKvkA
         Btli+tOB3ALEHqGin+0XMZXNPqC8H/DZ/nJyJlHkyvlRKRutbe3dBzGxwt9GnCxlJ8Gy
         mPRsmYP+aAtowlzDwHDkuQ8P38SYB2ukcuRYL0HYzwLWpL2sHak8+PrPPiHm/qsT5Xao
         9+KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BPkzu9Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m26si6808503edc.388.2019.08.19.14.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BPkzu9Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpg5-0003Z0-MP
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM5-0001fg-6s
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM3-0006AR-RL
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:21 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpM3-0006AB-LH
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:19 -0400
Received: by mail-pf1-x442.google.com with SMTP id 196so1940190pfz.8
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e+H++wAKyA1U/1YuB/2iGYEbH8KDD+Sy3cPPJBo/ztc=;
 b=BPkzu9VfHA0Ug4azqB6MlZseOF0rAlCUSH8Px+FcrOi8fOeuOGf48r1VdhRxbQrBac
 MHNwfmkgnVPfgJ0BBh/vKM9MjGSxmKf+BaHOlZt5gRE9iRGaBM5u1mAIqmPSaHh0+P3Q
 E4OonWZBWMd1POO7e/n+BI3adVKNLj1Uj+EBVmqzA54TnUMzyMZnMHeIE3lVixtLT0E0
 zjfHRvgxAJGf6xBfxtjl4oWNcPQv4uvfp57O/maBfDItlA8sXfezcKPYb0kbvdrnxIOw
 SWtQcU0K88cNCHhyjxm8YJSFi6bL/0xR23Id5p4ZL3O04/WL5LTfDl+MJ6prBQFtxJgu
 7DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e+H++wAKyA1U/1YuB/2iGYEbH8KDD+Sy3cPPJBo/ztc=;
 b=jK2HNF/e+s+YVFWJBa5k5HU0Olhs2onN+avh3ox2/lTdvAHSBo89QlQ15cSjiVr4iO
 bvE5MfYrbbI6RM27ug6vXLwez47YpDTW8l20XoYY2/6zaIDibqDN5QMbFHWm3/gXOfbH
 df7yrc1VWuGlpLHSyKzmYRnaXpAy1SVa94gthuUFInSV4uopmmrYBQ6gr1xfPIrdy3QA
 PPmUAs5KEMvzrzW3Axx65X0OvdfJLjm7u+uMA58I+hTCphiWVqQiq1GYCxCbGooT95Jr
 wdgi1P5pUfrK3qSweL4/HMUXXYbltd8cedOkUVcDf1kFluKgW2/FgASVXUhoxm8U/Zj/
 OYYQ==
X-Gm-Message-State: APjAAAXt07IWg5h3imPmrsX2rub2NDtPt/1pilXAh/p+N88hWLSsjFlI
 zVfTsmSqtHciom3t4+yAt9rWrQ==
X-Received: by 2002:a65:654d:: with SMTP id a13mr21542136pgw.196.1566250698650; 
 Mon, 19 Aug 2019 14:38:18 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:04 -0700
Message-Id: <20190819213755.26175-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v2 17/68] target/arm: Convert ERET
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
X-TUID: ff+c2S87+Zqa

Pass the T5 encoding of SUBS PC, LR, #IMM through the normal SUBS path
to make it clear exactly what's happening -- we hit ALUExceptionReturn
along that path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 58 ++++++++++++++----------------------------
 target/arm/a32.decode  |  2 ++
 target/arm/t32.decode  |  8 ++++++
 3 files changed, 29 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f0fa5253b6..cb7b35489f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8474,6 +8474,23 @@ static bool trans_CLZ(DisasContext *s, arg_CLZ *a)
     return true;
 }
 
+static bool trans_ERET(DisasContext *s, arg_ERET *a)
+{
+    TCGv_i32 tmp;
+
+    if (IS_USER(s) || !arm_dc_feature(s, ARM_FEATURE_V7VE)) {
+        return false;
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
@@ -8768,29 +8785,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
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
@@ -10586,24 +10584,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

