Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6072059wrv;
        Tue, 6 Aug 2019 21:54:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHFlkpbV1L5PF7euGQJvY82zkwtOckct6tjpnFiibJDHKtZMkcdCd46I63zuF5SBzcsPLV
X-Received: by 2002:a05:620a:1107:: with SMTP id o7mr5947300qkk.324.1565153648334;
        Tue, 06 Aug 2019 21:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153648; cv=none;
        d=google.com; s=arc-20160816;
        b=O4XfR/jcDCIldzg6hGO86pGfMtzdmeHBPgOrB8zicf8VfK6S+ROkuOGIZUekInVhqv
         uBfImRyVzY7e1zSrAPlmMpKhakkpTyRBxJEAU1hayTUetF8pRnFN1WAicoCNp8U0fcf1
         khJ6AZSYKIuslnHA7K931GhfknOixSBJ2J7YVCRL+m6iqGjxFLxQlzeBcD0gQosxsJH+
         xTH8ThJDg/K2esRYZizm2j8bfddqKanzikWDUl10GuLeaLK+vhoSaeuznGWbc+4JPkqP
         d84aApaDzfybFJP27gRYLT2wMOYPiry9kVDFibs56cEibMcL1aiGVscx4dSACKZFCzGP
         oZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GZbt2b6q6zC+AHslpvt/yBukAaZDdWPbQRYzrmp82HY=;
        b=s29oXGJ8y/1rU0TOc+vuE7uOICDmlGHdwfR/8BuCNcSR1u8YIPLzmqLGWPoTF/1xQR
         sPT/+aN48qJkOBnIw9+4ec7ct/XvVQrX6hVM/hwXec3rPy0YqjxxVg7DZyo7S2xPW3bA
         9G3X92pkN6+2r/NF4OtjOYoFOR/2F2gBdIQgbvXrF6J+r6yPqaUkOKZChUY9+CsXrha6
         5iC3oPKqL/UmgU9fXjy51r01xJTGrikvw4jrfnuf9BxCUOIShF4SuUpd3zPgbIt7RuZS
         ZOymolx6EnsAtV+Vw81t2iuE6MljpDchsJv8EwlyFnSDyQEXnUQfkGJT755yuX7fK3mO
         QGmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tFp+JZxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19si41306725qth.58.2019.08.06.21.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tFp+JZxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvDxf-0001fS-Nq
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40801)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxW-0001VG-BV
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxV-0004v6-3D
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:58 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxU-0004uB-Sn
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:57 -0400
Received: by mail-pg1-x543.google.com with SMTP id w10so42792764pgj.7
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GZbt2b6q6zC+AHslpvt/yBukAaZDdWPbQRYzrmp82HY=;
 b=tFp+JZxQA7az7Mi2xYjdbzV6BXaWFW6JH2twX9RL9qQjAtjeGhzoErJs6dQCWTKu8q
 7eOXH4X3rlo7bnLQYz6s7QXzmeAwnPh0jv245HC+4z+UBnLSkbhQsYgEwBPsg4euOGot
 SIbXXaz2z+YBNs+0s8cXuKleShyBBJSPs7WUO9U7b9pjg9433Xv0ffUz2nOBMzwn/s5N
 mJVumDXqcPqHgVqlJjfAEb9kMWO0OlxRNxIzukqRVCX6ARGVHF+XJ7qCz2MW4c0UQRXo
 OfOG+z8zVpUr+vOefiCnqeCQcqZPf0OX4bINk9KiNivF2utz8upKAXcXIC14C+gbZ6/I
 CuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GZbt2b6q6zC+AHslpvt/yBukAaZDdWPbQRYzrmp82HY=;
 b=ZUwX8Zd4IQHrg4QBqLTP7+adax+K6vSzrHfoJ0yUkNa0jCOiM016WQoq3g+yKoTu+p
 PaBBZcFKALbCwI5IjJdTYw2qpS6QWb7Nx6LFuBYhXU6s/+Vb7IUF45WfZaEGB73C3bYM
 Ul//JS6b2HbZzd3OAeeze4Kyf+sV0HZs5fGth8ocgo+k33mFeUZJm5ofvHI9EfCUIfYv
 OjuHaugCm/LtIOOPFgNXFCgDLPz93FE10stTI+jl9XhJdZJciMgmYkfgJjDjfgK993R6
 Y7ufgHtA4tP+mduYp4/fReh6zKcD+ry76hPk33Oef2nDKglQ2YK6b6FF2iNR8HJEiesb
 BxeA==
X-Gm-Message-State: APjAAAXZwb1grcanfpus6w4Uh8GAlJDJ7nyxu11VjMBtGo9rFYgafeFq
 7IXv0IyV8MmXG/oUu39vMeNvNg==
X-Received: by 2002:aa7:9834:: with SMTP id q20mr7548885pfl.196.1565153635874; 
 Tue, 06 Aug 2019 21:53:55 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:34 -0700
Message-Id: <20190807045335.1361-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH 10/11] target/arm: Use unallocated_encoding for
 aarch32
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
X-TUID: fD4+Sg0Af8Dz

Promote this function from aarch64 to fully general use.
Use it to unify the code sequences for generating illegal
opcode exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h     |  2 --
 target/arm/translate.h         |  2 ++
 target/arm/translate-a64.c     |  7 -------
 target/arm/translate-vfp.inc.c |  3 +--
 target/arm/translate.c         | 22 ++++++++++++----------
 5 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 9cd2b3d238..12ad8ac6ed 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,8 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-void unallocated_encoding(DisasContext *s);
-
 #define unsupported_encoding(s, insn)                                    \
     do {                                                                 \
         qemu_log_mask(LOG_UNIMP,                                         \
diff --git a/target/arm/translate.h b/target/arm/translate.h
index de600073d8..6a65df0b27 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -98,6 +98,8 @@ typedef struct DisasCompare {
     bool value_global;
 } DisasCompare;
 
+void unallocated_encoding(DisasContext *s);
+
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
 extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d68bfc66d3..9e1ffe9cfb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -352,13 +352,6 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
     }
 }
 
-void unallocated_encoding(DisasContext *s)
-{
-    /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
-}
-
 static void init_tmp_a64_array(DisasContext *s)
 {
 #ifdef CONFIG_DEBUG_TCG
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 5065d4524c..3e8ea80493 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -108,8 +108,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
     if (!s->vfp_enabled && !ignore_vfp_enabled) {
         assert(!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                           default_exception_el(s));
+        unallocated_encoding(s);
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6b0ab7247..2d447d4b90 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1285,6 +1285,13 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+void unallocated_encoding(DisasContext *s)
+{
+    /* Unallocated and reserved encodings are uncategorized */
+    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
+                       default_exception_el(s));
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -1315,8 +1322,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         return;
     }
 
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    unallocated_encoding(s);
 }
 
 static inline void gen_add_data_offset(DisasContext *s, unsigned int insn,
@@ -7638,8 +7644,7 @@ static void gen_srs(DisasContext *s,
     }
 
     if (undef) {
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                           default_exception_el(s));
+        unallocated_encoding(s);
         return;
     }
 
@@ -9266,8 +9271,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             break;
         default:
         illegal_op:
-            gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                               default_exception_el(s));
+            unallocated_encoding(s);
             break;
         }
     }
@@ -10955,8 +10959,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    unallocated_encoding(s);
 }
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
@@ -11779,8 +11782,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     return;
 illegal_op:
 undef:
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    unallocated_encoding(s);
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
-- 
2.17.1

