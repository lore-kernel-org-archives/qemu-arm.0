Received: by 10.182.158.201 with SMTP id ww9csp261647obb;
        Mon, 16 Nov 2015 10:28:54 -0800 (PST)
X-Received: by 10.28.213.12 with SMTP id m12mr21973421wmg.26.1447698534194;
        Mon, 16 Nov 2015 10:28:54 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id lb9si47620792wjb.188.2015.11.16.10.28.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 10:28:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyOWJ-0001F6-Ne; Mon, 16 Nov 2015 18:28:51 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target-arm/translate-a64.c: Correct unallocated checks for ldst_excl
Date: Mon, 16 Nov 2015 18:28:51 +0000
Message-Id: <1447698531-4751-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-TUID: oCvVXoX9TFCV

The checks for the unallocated encodings in the ldst_excl group
(exclusives and load-acquire/store-release) were not correct. This
error meant that in turn we ended up with code attempting to handle
the non-existent case of "non-exclusive load-acquire/store-release
pair". Delete that broken and now unreachable code.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The easiest way to validate that we have the unallocated
conditions correct now is to look at C4.4.6 "load/store exclusive"
in the v8 ARM ARM rev A.3h: our three conditions correspond
to the three "unallocated" rows in the decode table.

PS: Laurent originally reported this way back in 2014:
http://lists.gnu.org/archive/html/qemu-devel/2014-10/msg01255.html

 target-arm/translate-a64.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index fe485a4..890ace4 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1833,7 +1833,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
     int size = extract32(insn, 30, 2);
     TCGv_i64 tcg_addr;
 
-    if ((!is_excl && !is_lasr) ||
+    if ((!is_excl && !is_pair && !is_lasr) ||
+        (!is_excl && is_pair) ||
         (is_pair && size < 2)) {
         unallocated_encoding(s);
         return;
@@ -1862,15 +1863,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         } else {
             do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
         }
-        if (is_pair) {
-            TCGv_i64 tcg_rt2 = cpu_reg(s, rt);
-            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
-            if (is_store) {
-                do_gpr_st(s, tcg_rt2, tcg_addr, size);
-            } else {
-                do_gpr_ld(s, tcg_rt2, tcg_addr, size, false, false);
-            }
-        }
     }
 }
 
-- 
1.9.1
