Received: by 10.25.159.19 with SMTP id i19csp857917lfe;
        Fri, 12 Feb 2016 06:37:00 -0800 (PST)
X-Received: by 10.66.147.103 with SMTP id tj7mr2629918pab.72.1455287819940;
        Fri, 12 Feb 2016 06:36:59 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com. [2607:f8b0:400e:c03::244])
        by mx.google.com with ESMTPS id y29si20402949pfi.115.2016.02.12.06.36.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) client-ip=2607:f8b0:400e:c03::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x244.google.com with SMTP id y7so695131paa.0;
        Fri, 12 Feb 2016 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b90yldKzeIG660WGwHVvKsMno2SNK6wcv8kCSk48vXY=;
        b=X4go8EhMdCBrAu9OBgQaHhAJE36TtZpw2gtlcduBzO1+7cAs2lkZHhYqn2sGdqrp/0
         pyR3JnctMSZwGMpTMBVE7yarHe0uIlPW2uo8btFIJRMFbRLZi0L3WmyN9ju058n+NSKm
         j/tdGxstwfMG2COwsE590JuNd6VGfn2Sb3eARZ7ZCN6REn2fdPmgSwCkPisLnrV0T+PF
         2Zbkgt+rmvI/Xs2gTNVcv5ycDCg5Bb2qI95e5UEHXvSeoI4do6obMU04/D7qp5kYuilh
         1drQGah03o9qg2PnEsBVPSDCk7AnEtQjUhjnS0AJ3GD3scoZSRaV/pLbTgJ5Q9TvtFRh
         UcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b90yldKzeIG660WGwHVvKsMno2SNK6wcv8kCSk48vXY=;
        b=mxdC7GdjZaCUZxBRjBnMfSWtLfb/CtwP36M2QXpjWE2K9L2Ef02gWUrm5Dhi7Ke7aA
         1Ad7k6rHqHa8QqHbILNDlpuZAaSed96DztZbze2uRycZeXtWe1vPyEBP9lXDxaW1+cfu
         zG0ICrTqWQ1wfjfv9tkmxnc1rVw74aLolTjKCWz4xeSEte/QOAyo4ygnEwQMa7k6XJ1g
         L2ce/1SwmBEMAdN/aIkafqs8ldGyoJNiOCAobcVjP/JGv/39QX8+Mn7u1I3HVtUfL3GK
         v0kwBgap4xoaMwH0YZ1r6tTEaI1PVVR9fKBDh+7SFUyGUpUtcDNJ7RUx+pzkPmYyFgPt
         VoZg==
X-Gm-Message-State: AG10YOQCuzB+ETU89X9zQau/sEkoIS55Lpj/7vybkTgtXp+lJGvakaj4gRy9IUNauodiXg==
X-Received: by 10.66.218.196 with SMTP id pi4mr2475022pac.147.1455287819577;
        Fri, 12 Feb 2016 06:36:59 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id tn5sm18951780pac.32.2016.02.12.06.36.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:59 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 6/9] target-arm/translate-a64.c: Unify some of the ldst_reg decoding
Date: Fri, 12 Feb 2016 15:33:59 +0100
Message-Id: <1455287642-28166-7-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: 000o6SpAePeN

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The various load/store variants under disas_ldst_reg can all reuse the
same decoding for opc, size, rt and is_vector.

This patch unifies the decoding in preparation for generating
instruction syndromes for data aborts.
This will allow us to reduce the number of places to hook in updates
to the load/store state needed to generate the insn syndromes.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index bf31f8a..9e26d5e 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2075,19 +2075,19 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
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
 
@@ -2194,19 +2194,19 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
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
@@ -2283,14 +2283,14 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn)
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
@@ -2349,20 +2349,25 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn)
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
1.9.1
