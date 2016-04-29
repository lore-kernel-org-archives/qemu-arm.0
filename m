Received: by 10.25.208.137 with SMTP id h131csp819756lfg;
        Fri, 29 Apr 2016 05:08:25 -0700 (PDT)
X-Received: by 10.194.86.200 with SMTP id r8mr20842322wjz.158.1461931694209;
        Fri, 29 Apr 2016 05:08:14 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id o63si3814899wmb.95.2016.04.29.05.08.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x244.google.com with SMTP id n129so4551003wmn.1;
        Fri, 29 Apr 2016 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cxdPDfJp2aqsTISMW21ehBX5vcD1ylnjvWXmF9PWLrY=;
        b=Wub7mWwZ/KY0dDWfG+rlTA2Y5EUcVnQOWtrDCXcprB9vONo3KXamyrShkWSyFnT+yu
         N14g5125PNKgDxueh7A2ukfd+R9qIomzXWWluBEXyphP7FRRFcVN2BFLKrJf2ukuiw0g
         Zoc9ZcOysSrmhIYpsbnjlB8QsATpwtq6uu1Gs7mk8NGtlTQpEEZP9AqmIX9lTJcxPpe+
         lsN2MuCASY9MsUFtCvIGiUH7LP0f5knezk8OuXHwn1gUZO2kY9q36kbyqg+SQsN5bTE6
         134AsS5NmGfM4Zqsg4bfnbpR0nqKIw4nOOq4M5FAixSkAnCsHv9zcoTjPAYsCicd+6jG
         bPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cxdPDfJp2aqsTISMW21ehBX5vcD1ylnjvWXmF9PWLrY=;
        b=AAPPWowaeEC84+MOTIr8Ipn1nOFWggIiElQJQwlDc/r+3YnIJTH5IjnTIJRDXZsUkD
         qjP5hhqKg6zcLaOAUazVVaOTB0I7pFCE+bIUW7VifOVQhc645bLmI1HZD//QCWrrsVnH
         L/G7/eP76d8eeFzTDyks/2DY8LnFYzu8uGEeJ+9x61y5rK/+bSPtGcpldJsZClP1lVe8
         csQy2rr/cljAqmLcZN0zGLWZtVWPldvjeRc9QyXQrrk9BgC3JfUCmMiAtI+6MJjjaIQy
         bXdkTAwiEpJhqQBr72bwyAmZJ8Ol99kNZI2OhI8/z5zMbfwzj1SBTfznyrAv9sJmgB1l
         VdgQ==
X-Gm-Message-State: AOPr4FVqaW9WGgc9NuQwrRERqOiGxVVfwSN05oW6bZvZ0kUqGjAVeWddXh2dqxu1QrAnRQ==
X-Received: by 10.194.116.103 with SMTP id jv7mr22919489wjb.22.1461931693926;
        Fri, 29 Apr 2016 05:08:13 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id gk4sm14459542wjd.7.2016.04.29.05.08.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:13 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 6/7] target-arm/translate-a64.c: Unify some of the ldst_reg decoding
Date: Fri, 29 Apr 2016 14:08:03 +0200
Message-Id: <1461931684-1867-7-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: fNX8Ktmuw4n9

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The various load/store variants under disas_ldst_reg can all reuse the
same decoding for opc, size, rt and is_vector.

This patch unifies the decoding in preparation for generating
instruction syndromes for data aborts.
This will allow us to reduce the number of places to hook in updates
to the load/store state needed to generate the insn syndromes.

No functional change.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 5c8dddb..24f5e17 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2086,19 +2086,19 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
  * size: 00 -> 8 bit, 01 -> 16 bit, 10 -> 32 bit, 11 -> 64bit
  * opc: 00 -> store, 01 -> loadu, 10 -> loads 64, 11 -> loads 32
  */
-static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
+static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
+                                int opc,
+                                int size,
+                                int rt,
+                                bool is_vector)
 {
-    int rt = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
     int imm9 = sextract32(insn, 12, 9);
-    int opc = extract32(insn, 22, 2);
-    int size = extract32(insn, 30, 2);
     int idx = extract32(insn, 10, 2);
     bool is_signed = false;
     bool is_store = false;
     bool is_extended = false;
     bool is_unpriv = (idx == 2);
-    bool is_vector = extract32(insn, 26, 1);
     bool post_index;
     bool writeback;
 
@@ -2205,19 +2205,19 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
  * Rn: address register or SP for base
  * Rm: offset register or ZR for offset
  */
-static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn)
+static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
+                                   int opc,
+                                   int size,
+                                   int rt,
+                                   bool is_vector)
 {
-    int rt = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
     int shift = extract32(insn, 12, 1);
     int rm = extract32(insn, 16, 5);
-    int opc = extract32(insn, 22, 2);
     int opt = extract32(insn, 13, 3);
-    int size = extract32(insn, 30, 2);
     bool is_signed = false;
     bool is_store = false;
     bool is_extended = false;
-    bool is_vector = extract32(insn, 26, 1);
 
     TCGv_i64 tcg_rm;
     TCGv_i64 tcg_addr;
@@ -2294,14 +2294,14 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn)
  * Rn: base address register (inc SP)
  * Rt: target register
  */
-static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn)
+static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
+                                        int opc,
+                                        int size,
+                                        int rt,
+                                        bool is_vector)
 {
-    int rt = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
     unsigned int imm12 = extract32(insn, 10, 12);
-    bool is_vector = extract32(insn, 26, 1);
-    int size = extract32(insn, 30, 2);
-    int opc = extract32(insn, 22, 2);
     unsigned int offset;
 
     TCGv_i64 tcg_addr;
@@ -2360,20 +2360,25 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn)
 /* Load/store register (all forms) */
 static void disas_ldst_reg(DisasContext *s, uint32_t insn)
 {
+    int rt = extract32(insn, 0, 5);
+    int opc = extract32(insn, 22, 2);
+    bool is_vector = extract32(insn, 26, 1);
+    int size = extract32(insn, 30, 2);
+
     switch (extract32(insn, 24, 2)) {
     case 0:
         if (extract32(insn, 21, 1) == 1 && extract32(insn, 10, 2) == 2) {
-            disas_ldst_reg_roffset(s, insn);
+            disas_ldst_reg_roffset(s, insn, opc, size, rt, is_vector);
         } else {
             /* Load/store register (unscaled immediate)
              * Load/store immediate pre/post-indexed
              * Load/store register unprivileged
              */
-            disas_ldst_reg_imm9(s, insn);
+            disas_ldst_reg_imm9(s, insn, opc, size, rt, is_vector);
         }
         break;
     case 1:
-        disas_ldst_reg_unsigned_imm(s, insn);
+        disas_ldst_reg_unsigned_imm(s, insn, opc, size, rt, is_vector);
         break;
     default:
         unallocated_encoding(s);
-- 
2.5.0
