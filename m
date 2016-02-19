Received: by 10.25.208.211 with SMTP id h202csp31269lfg;
        Fri, 19 Feb 2016 12:05:26 -0800 (PST)
X-Received: by 10.98.71.15 with SMTP id u15mr20758093pfa.161.1455912326588;
        Fri, 19 Feb 2016 12:05:26 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com. [2607:f8b0:400e:c00::22a])
        by mx.google.com with ESMTPS id v69si18355658pfa.186.2016.02.19.12.05.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22a as permitted sender) client-ip=2607:f8b0:400e:c00::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22a as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x22a.google.com with SMTP id x65so56431546pfb.1;
        Fri, 19 Feb 2016 12:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HLZgjS3qRCpcUWinxUWyDiyOlIJbXywh2wkNvniZtDM=;
        b=RsJXxg/iZGbYiF8EPbFzBjiPYAvTlHipKbNJGicWC6FRi+nRfiEpeGl29/AQPpcI0O
         jMlPaev51OfyHaUUVO3G8zhbmlYLS3DajD51z+LxAWxfTDMVpbmLxFrMVhKHcJMUxvK+
         s0AO+VZqBorr9UvF27BG76KQxNKqM3bEQxsRCbdACiJxkAsy/RcCHA9f/ylRSpLUmOvc
         Y4PQ9+3opm8DIfbu5x3ra8X+fnpgwNI9Uyts8SZ2O4gGdP7jmSWr7gdHZgeQzax+rh0n
         BLVsmKB4eZa1ccVJuUP3ZVEP5VHbFfp20GRFqVQeEChpCyZ0tXHillLAlYP+EPaLZNSk
         fEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HLZgjS3qRCpcUWinxUWyDiyOlIJbXywh2wkNvniZtDM=;
        b=PG1WOO++nJ/C/E5EONXYDq0JV4ruszISqxhMfX2ZdvS1zlUvD0tUX5QhoE+7gW/LVx
         fsVxL/K1yjbejH/YgtE7wU6cGF4Sqp8aCt0nigYgQfuruSFw3j+LflLea3qiGFfxHcGf
         v6q5EMm2+x9AQGzQznG6Z9/2/KlLBHvXtX5I2lQT4kN02GfAL17s9++3XlktVYrAGn94
         AG2O4+ASCbDh6BRsj12UkPgLQlPB+cyjy3MBGnP2W7doJBB0okv/kcHrLXbW8P6EvasU
         uzRenQAUn2J2uSYTuhZoorQo4IQjBdAttRafKV3kNQtSYiZTj0SdUTqeR3zU+Jm2OkuX
         8kAw==
X-Gm-Message-State: AG10YOSI8JlebTSJwYHggF8RVKu8wcz5D2dk+Z3GuND5t/qDMt1XyLF3IZVfpUcRGpWzGw==
X-Received: by 10.98.16.198 with SMTP id 67mr20721157pfq.21.1455912326248;
        Fri, 19 Feb 2016 12:05:26 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id xv2sm19844864pab.10.2016.02.19.12.05.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:25 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 6/8] target-arm/translate-a64.c: Unify some of the ldst_reg decoding
Date: Fri, 19 Feb 2016 21:04:50 +0100
Message-Id: <1455912292-23807-7-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: fLa7572ByXt+

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
