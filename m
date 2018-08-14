Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4030190wru;
        Tue, 14 Aug 2018 05:43:42 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzllHVSKYVAXcI85sHxpP1CaDgutvrQSUSulwrLH+7/410k8EkXSnof70vn830PdWqrkRn4
X-Received: by 2002:ac8:5188:: with SMTP id c8-v6mr21637624qtn.35.1534250622640;
        Tue, 14 Aug 2018 05:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250622; cv=none;
        d=google.com; s=arc-20160816;
        b=p9vM+lSG69SHWnccYfykNIBDx1ijfoQ64h2eje8RdTri63gSLsxa/xs1lK+IzFU3+V
         umRD7iQ7q2yS7MJbEmA0+g8k/wypVpstWbDzIFQbUOcCbUUGiJpWaMLUc5tn3v0rypXV
         BxlkxcVo6Q/9LS5OCMNoNJRx7qawqx3MLxD6wPXu+rTZcSIhsLKDo6+gsApggBU8mWeq
         NHV4IabYN8ksruWi752dHQVPzGQ4Kg5NhFbbEIm3Y0Bg1BfKJFGq9HQf5FXPKwDH9rsz
         ccUlpZ2vCFjJn+QSWjM0Bzz1dlvd/VaHU8R+tJPO2EgXkVBpwSm4WHem6YWsA1n54QEH
         //sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=OEsBL3DieiJtZRMaFhV8SI3KRZGrsLCyyFDRJIPWfN0=;
        b=OT6hpzRaMXYJqQQuzomekOIj2Vmlw/qtkpha2MjDevX7iyuYmOo973u7F7qdA0COQ/
         G7TxmG3b+VvXeOR4XhnQfdrKlxuaGVMkdzSZfAMluAMjjnQG9oZBwGl/rgovYIkCXm9W
         7sasvPYDFPYXrJHMf5v29Yp/gp9TBTu207o8VV9rSHhUjKU+EIsh+8CWJoh5vWNkRzaj
         98AUmOEFa0tuUAh0wZ5C7UAna4Iz3RXNRXG7Kq1Rrfb3rpWqZc1RO3O/xqg5Wt6DnBzM
         L3sciqXxekQ89szCvVWqP1F4m1CvFFEoxTp6FRsHefmgqoKjbaFiTP2mOMAKA+7gq0Vn
         HeMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u33-v6si42345qvh.150.2018.08.14.05.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfm-0005p3-3k
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfI-0005WH-QF
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfH-0002K2-Ok
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfH-0001z2-Fm; Tue, 14 Aug 2018 08:43:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfF-0006rR-Fk; Tue, 14 Aug 2018 13:43:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:53 +0100
Message-Id: <20180814124254.5229-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/10] target/arm: Implement AArch32 ERET
 instruction
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yZsW8Slr6wUr

ARMv7VE introduced the ERET instruction, which is necessary to
return from an exception taken to Hyp mode. Implement this.
In A32 encoding it is a completely new encoding; in T32 it
is an adjustment of the behaviour of the existing
"SUBS PC, LR, #<imm8>" instruction.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3f5751d4826..5ecc24f12fb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8887,6 +8887,25 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             tcg_temp_free_i32(tmp2);
             store_reg(s, rd, tmp);
             break;
+        case 0x6: /* ERET */
+            if (op1 != 3) {
+                goto illegal_op;
+            }
+            if (!arm_dc_feature(s, ARM_FEATURE_V7VE)) {
+                goto illegal_op;
+            }
+            if ((insn & 0x000fff0f) != 0x0000000e) {
+                /* UNPREDICTABLE; we choose to UNDEF */
+                goto illegal_op;
+            }
+
+            if (s->current_el == 2) {
+                tmp = load_cpu_field(elr_el[2]);
+            } else {
+                tmp = load_reg(s, 14);
+            }
+            gen_exception_return(s, tmp);
+            break;
         case 7:
         {
             int imm16 = extract32(insn, 0, 4) | (extract32(insn, 8, 12) << 4);
@@ -11144,8 +11163,16 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         if (rn != 14 || rd != 15) {
                             goto illegal_op;
                         }
-                        tmp = load_reg(s, rn);
-                        tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
+                        if (s->current_el == 2) {
+                            /* ERET from Hyp uses ELR_Hyp, not LR */
+                            if (insn & 0xff) {
+                                goto illegal_op;
+                            }
+                            tmp = load_cpu_field(elr_el[2]);
+                        } else {
+                            tmp = load_reg(s, rn);
+                            tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
+                        }
                         gen_exception_return(s, tmp);
                         break;
                     case 6: /* MRS */
-- 
2.18.0

