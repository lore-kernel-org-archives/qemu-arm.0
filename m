Received: by 10.25.208.194 with SMTP id h185csp1434895lfg;
        Mon, 18 Apr 2016 09:04:31 -0700 (PDT)
X-Received: by 10.55.159.73 with SMTP id i70mr7174756qke.29.1460995468784;
        Mon, 18 Apr 2016 09:04:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17si14347929qgt.85.2016.04.18.09.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBf2-0005tw-8a
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:04:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBet-0005gM-1j
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBem-0005YE-Sr
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:18 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54504 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBem-0005Xw-Id; Mon, 18 Apr 2016 12:04:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 7668D1A4600;
	Mon, 18 Apr 2016 18:03:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 490011A4611;
	Mon, 18 Apr 2016 18:03:47 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:42 +0200
Message-Id: <1460995422-14373-10-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v5 9/9] target-mips: Clean up position of
 abs2008/nan2008 cases in genfarith()
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
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4LTigMJetgdZ

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch slightly reorders cases in genfarith() so that abs2008/nan2008-
dependant cases are grouped together, for easier maintenantce (code becomes
less prone to errors).

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/translate.c | 152 ++++++++++++++++++++++++------------------------
 1 file changed, 76 insertions(+), 76 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index b7ab98a..76df972 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -8876,25 +8876,25 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i32(fp0);
         }
         break;
-    case OPC_ABS_S:
+    case OPC_MOV_S:
         {
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
             gen_load_fpr32(ctx, fp0, fs);
-            if (ctx->abs2008) {
-                tcg_gen_andi_i32(fp0, fp0, 0x7fffffffUL);
-            } else {
-                gen_helper_float_abs_s(fp0, fp0);
-            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
         break;
-    case OPC_MOV_S:
+    case OPC_ABS_S:
         {
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
             gen_load_fpr32(ctx, fp0, fs);
+            if (ctx->abs2008) {
+                tcg_gen_andi_i32(fp0, fp0, 0x7fffffffUL);
+            } else {
+                gen_helper_float_abs_s(fp0, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8913,6 +8913,23 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i32(fp0);
         }
         break;
+    case OPC_CVT_L_S:
+        check_cp1_64bitmode(ctx);
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr32(ctx, fp32, fs);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_cvt_l_s(fp64, cpu_env, fp32);
+            }
+            tcg_temp_free_i32(fp32);
+            gen_store_fpr64(ctx, fp64, fd);
+            tcg_temp_free_i64(fp64);
+        }
+        break;
     case OPC_ROUND_L_S:
         check_cp1_64bitmode(ctx);
         {
@@ -8981,6 +8998,20 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i64(fp64);
         }
         break;
+    case OPC_CVT_W_S:
+        {
+            TCGv_i32 fp0 = tcg_temp_new_i32();
+
+            gen_load_fpr32(ctx, fp0, fs);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_cvt_w_s(fp0, cpu_env, fp0);
+            }
+            gen_store_fpr32(ctx, fp0, fd);
+            tcg_temp_free_i32(fp0);
+        }
+        break;
     case OPC_ROUND_W_S:
         {
             TCGv_i32 fp0 = tcg_temp_new_i32();
@@ -9276,37 +9307,6 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i64(fp64);
         }
         break;
-    case OPC_CVT_W_S:
-        {
-            TCGv_i32 fp0 = tcg_temp_new_i32();
-
-            gen_load_fpr32(ctx, fp0, fs);
-            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
-                gen_helper_float_cvt_2008_w_s(fp0, cpu_env, fp0);
-            } else {
-                gen_helper_float_cvt_w_s(fp0, cpu_env, fp0);
-            }
-            gen_store_fpr32(ctx, fp0, fd);
-            tcg_temp_free_i32(fp0);
-        }
-        break;
-    case OPC_CVT_L_S:
-        check_cp1_64bitmode(ctx);
-        {
-            TCGv_i32 fp32 = tcg_temp_new_i32();
-            TCGv_i64 fp64 = tcg_temp_new_i64();
-
-            gen_load_fpr32(ctx, fp32, fs);
-            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
-                gen_helper_float_cvt_2008_l_s(fp64, cpu_env, fp32);
-            } else {
-                gen_helper_float_cvt_l_s(fp64, cpu_env, fp32);
-            }
-            tcg_temp_free_i32(fp32);
-            gen_store_fpr64(ctx, fp64, fd);
-            tcg_temp_free_i64(fp64);
-        }
-        break;
     case OPC_CVT_PS_S:
         check_ps(ctx);
         {
@@ -9413,6 +9413,16 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i64(fp0);
         }
         break;
+    case OPC_MOV_D:
+        check_cp1_registers(ctx, fs | fd);
+        {
+            TCGv_i64 fp0 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp0, fs);
+            gen_store_fpr64(ctx, fp0, fd);
+            tcg_temp_free_i64(fp0);
+        }
+        break;
     case OPC_ABS_D:
         check_cp1_registers(ctx, fs | fd);
         {
@@ -9428,26 +9438,31 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i64(fp0);
         }
         break;
-    case OPC_MOV_D:
+    case OPC_NEG_D:
         check_cp1_registers(ctx, fs | fd);
         {
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
             gen_load_fpr64(ctx, fp0, fs);
+            if (ctx->abs2008) {
+                tcg_gen_xori_i64(fp0, fp0, 1ULL << 63);
+            } else {
+                gen_helper_float_chs_d(fp0, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
         break;
-    case OPC_NEG_D:
-        check_cp1_registers(ctx, fs | fd);
+    case OPC_CVT_L_D:
+        check_cp1_64bitmode(ctx);
         {
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
             gen_load_fpr64(ctx, fp0, fs);
-            if (ctx->abs2008) {
-                tcg_gen_xori_i64(fp0, fp0, 1ULL << 63);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_l_d(fp0, cpu_env, fp0);
             } else {
-                gen_helper_float_chs_d(fp0, fp0);
+                gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
             }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
@@ -9513,6 +9528,23 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i64(fp0);
         }
         break;
+    case OPC_CVT_W_D:
+        check_cp1_registers(ctx, fs);
+        {
+            TCGv_i32 fp32 = tcg_temp_new_i32();
+            TCGv_i64 fp64 = tcg_temp_new_i64();
+
+            gen_load_fpr64(ctx, fp64, fs);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_cvt_w_d(fp32, cpu_env, fp64);
+            }
+            tcg_temp_free_i64(fp64);
+            gen_store_fpr32(ctx, fp32, fd);
+            tcg_temp_free_i32(fp32);
+        }
+        break;
     case OPC_ROUND_W_D:
         check_cp1_registers(ctx, fs);
         {
@@ -9841,38 +9873,6 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             tcg_temp_free_i32(fp32);
         }
         break;
-    case OPC_CVT_W_D:
-        check_cp1_registers(ctx, fs);
-        {
-            TCGv_i32 fp32 = tcg_temp_new_i32();
-            TCGv_i64 fp64 = tcg_temp_new_i64();
-
-            gen_load_fpr64(ctx, fp64, fs);
-            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
-                gen_helper_float_cvt_2008_w_d(fp32, cpu_env, fp64);
-            } else {
-                gen_helper_float_cvt_w_d(fp32, cpu_env, fp64);
-            }
-            tcg_temp_free_i64(fp64);
-            gen_store_fpr32(ctx, fp32, fd);
-            tcg_temp_free_i32(fp32);
-        }
-        break;
-    case OPC_CVT_L_D:
-        check_cp1_64bitmode(ctx);
-        {
-            TCGv_i64 fp0 = tcg_temp_new_i64();
-
-            gen_load_fpr64(ctx, fp0, fs);
-            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
-                gen_helper_float_cvt_2008_l_d(fp0, cpu_env, fp0);
-            } else {
-                gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
-            }
-            gen_store_fpr64(ctx, fp0, fd);
-            tcg_temp_free_i64(fp0);
-        }
-        break;
     case OPC_CVT_S_W:
         {
             TCGv_i32 fp0 = tcg_temp_new_i32();
-- 
1.9.1

