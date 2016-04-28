Received: by 10.25.208.137 with SMTP id h131csp508364lfg;
        Thu, 28 Apr 2016 14:34:04 -0700 (PDT)
X-Received: by 10.112.140.3 with SMTP id rc3mr7190687lbb.85.1461879244060;
        Thu, 28 Apr 2016 14:34:04 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x230.google.com (mail-lf0-x230.google.com. [2a00:1450:4010:c07::230])
        by mx.google.com with ESMTPS id l201si6098384lfb.209.2016.04.28.14.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Apr 2016 14:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::230 as permitted sender) client-ip=2a00:1450:4010:c07::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::230 as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x230.google.com with SMTP id c126so111927260lfb.2
        for <alex.bennee@linaro.org>; Thu, 28 Apr 2016 14:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jo4winHR00qmGsBEd9PWVO7H76TSF9hhLV3eCsS4n5g=;
        b=PxAO35oDubnMyU2g9p315nTlTCgVyzrBJpuayVdxrxR6nbOlOdP3mLWGpbMQrPrEra
         DTjJ1X6LkFKnR913c/v5ChMdysWjaRBAmfsRS6UvSSNF/gV7vtD2VXfp8m9CM++ciQpm
         ROvoGqnYqJEXHuMc6xHUAqQeFLmCdk7pYBzQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jo4winHR00qmGsBEd9PWVO7H76TSF9hhLV3eCsS4n5g=;
        b=R9mLXoy3v6FuNDNcRwYgJdjFW0dSLkkaTRf3AW1E8AVONZvdA7VjGzC+VWZZzXjcbA
         PqIBC7FlfxMR09D8bjRAxyiWkb41HGC+oJOrYmZ9TLsd20dbhsVliQnKnlGGwSGUwIOK
         J3jvExstks5Kyfy/QcNrfZzlplvO1QkeBOIwas3Zcx6Mg+nLLVCDmR50pZA9S2v690hY
         wkx0DIPLWtldl8yK8wLEyJ4h3WRdV687sWXQyyPA1yZjnoCA76+aSmsT/8pHaphopvcb
         Jj086DcGazO62Mdvhn0CWrKJvkEhg7g44luo76klMEUAV1Og7bX7VqTiZfHrRrLxW+Ih
         jFeg==
X-Gm-Message-State: AOPr4FVHX9sJuDi9xrW0BIr3NTSXHLL/G43n/PfKi7n8c9PXb/Jkq0H68xYGDPvIYuqMEtrWru0=
X-Received: by 10.112.56.33 with SMTP id x1mr7093338lbp.46.1461879243075;
        Thu, 28 Apr 2016 14:34:03 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id m7sm1953148lbr.6.2016.04.28.14.34.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Apr 2016 14:34:02 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	"Vassili Karpov (malc)" <av1474@comtv.ru>,
	Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 01/10] tcg: Clean up direct block chaining data fields
Date: Fri, 29 Apr 2016 00:33:46 +0300
Message-Id: <1461879235-7694-2-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461879235-7694-1-git-send-email-sergey.fedorov@linaro.org>
References: <1461879235-7694-1-git-send-email-sergey.fedorov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zi9uiQclk820

From: Sergey Fedorov <serge.fdrv@gmail.com>

Briefly describe in a comment how direct block chaining is done. It
should help in understanding of the following data fields.

Rename some fields in TranslationBlock and TCGContext structures to
better reflect their purpose (dropping excessive 'tb_' prefix in
TranslationBlock but keeping it in TCGContext):
   tb_next_offset  =>  jmp_reset_offset
   tb_jmp_offset   =>  jmp_insn_offset
   tb_next         =>  jmp_target_addr
   jmp_next        =>  jmp_list_next
   jmp_first       =>  jmp_list_first

Avoid using a magic constant as an invalid offset which is used to
indicate that there's no n-th jump generated.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

Changes in v5:
 * Fixed rebase conflicts

 include/exec/exec-all.h      | 44 ++++++++++++++++++++++++--------------
 tcg/aarch64/tcg-target.inc.c |  7 +++---
 tcg/arm/tcg-target.inc.c     |  8 +++----
 tcg/i386/tcg-target.inc.c    |  8 +++----
 tcg/ia64/tcg-target.inc.c    |  6 +++---
 tcg/mips/tcg-target.inc.c    |  8 +++----
 tcg/ppc/tcg-target.inc.c     |  6 +++---
 tcg/s390/tcg-target.inc.c    | 11 +++++-----
 tcg/sparc/tcg-target.inc.c   |  9 ++++----
 tcg/tcg.h                    |  6 +++---
 tcg/tci/tcg-target.inc.c     | 10 ++++-----
 translate-all.c              | 51 +++++++++++++++++++++++---------------------
 12 files changed, 96 insertions(+), 78 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6c113a3d2010..445d946d84fb 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -259,20 +259,32 @@ struct TranslationBlock {
     struct TranslationBlock *page_next[2];
     tb_page_addr_t page_addr[2];
 
-    /* the following data are used to directly call another TB from
-       the code of this one. */
-    uint16_t tb_next_offset[2]; /* offset of original jump target */
+    /* The following data are used to directly call another TB from
+     * the code of this one. This can be done either by emitting direct or
+     * indirect native jump instructions. These jumps are reset so that the TB
+     * just continue its execution. The TB can be linked to another one by
+     * setting one of the jump targets (or patching the jump instruction). Only
+     * two of such jumps are supported.
+     */
+    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
+#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
 #ifdef USE_DIRECT_JUMP
-    uint16_t tb_jmp_offset[2]; /* offset of jump instruction */
+    uint16_t jmp_insn_offset[2]; /* offset of native jump instruction */
 #else
-    uintptr_t tb_next[2]; /* address of jump generated code */
+    uintptr_t jmp_target_addr[2]; /* target address for indirect jump */
 #endif
-    /* list of TBs jumping to this one. This is a circular list using
-       the two least significant bits of the pointers to tell what is
-       the next pointer: 0 = jmp_next[0], 1 = jmp_next[1], 2 =
-       jmp_first */
-    struct TranslationBlock *jmp_next[2];
-    struct TranslationBlock *jmp_first;
+    /* Each TB has an assosiated circular list of TBs jumping to this one.
+     * jmp_list_first points to the first TB jumping to this one.
+     * jmp_list_next is used to point to the next TB in a list.
+     * Since each TB can have two jumps, it can participate in two lists.
+     * The two least significant bits of a pointer are used to choose which
+     * data field holds a pointer to the next TB:
+     * 0 => jmp_list_next[0], 1 => jmp_list_next[1], 2 => jmp_list_first.
+     * In other words, 0/1 tells which jump is used in the pointed TB,
+     * and 2 means that this is a pointer back to the target TB of this list.
+     */
+    struct TranslationBlock *jmp_list_next[2];
+    struct TranslationBlock *jmp_list_first;
 };
 
 #include "qemu/thread.h"
@@ -340,7 +352,7 @@ void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr);
 static inline void tb_set_jmp_target(TranslationBlock *tb,
                                      int n, uintptr_t addr)
 {
-    uint16_t offset = tb->tb_jmp_offset[n];
+    uint16_t offset = tb->jmp_insn_offset[n];
     tb_set_jmp_target1((uintptr_t)(tb->tc_ptr + offset), addr);
 }
 
@@ -350,7 +362,7 @@ static inline void tb_set_jmp_target(TranslationBlock *tb,
 static inline void tb_set_jmp_target(TranslationBlock *tb,
                                      int n, uintptr_t addr)
 {
-    tb->tb_next[n] = addr;
+    tb->jmp_target_addr[n] = addr;
 }
 
 #endif
@@ -359,7 +371,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
                                TranslationBlock *tb_next)
 {
     /* NOTE: this test is only needed for thread safety */
-    if (!tb->jmp_next[n]) {
+    if (!tb->jmp_list_next[n]) {
         qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                                "Linking TBs %p [" TARGET_FMT_lx
                                "] index %d -> %p [" TARGET_FMT_lx "]\n",
@@ -369,8 +381,8 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
         tb_set_jmp_target(tb, n, (uintptr_t)tb_next->tc_ptr);
 
         /* add in TB jmp circular list */
-        tb->jmp_next[n] = tb_next->jmp_first;
-        tb_next->jmp_first = (TranslationBlock *)((uintptr_t)(tb) | (n));
+        tb->jmp_list_next[n] = tb_next->jmp_list_first;
+        tb_next->jmp_list_first = (TranslationBlock *)((uintptr_t)tb | n);
     }
 }
 
diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index 88183c830fb0..1447f7c216d9 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -1306,12 +1306,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 #ifndef USE_DIRECT_JUMP
 #error "USE_DIRECT_JUMP required for aarch64"
 #endif
-        tcg_debug_assert(s->tb_jmp_offset != NULL); /* consistency for USE_DIRECT_JUMP */
-        s->tb_jmp_offset[a0] = tcg_current_code_size(s);
+        /* consistency for USE_DIRECT_JUMP */
+        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
         /* actual branch destination will be patched by
            aarch64_tb_set_jmp_target later, beware retranslation. */
         tcg_out_goto_noaddr(s);
-        s->tb_next_offset[a0] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
         break;
 
     case INDEX_op_br:
diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
index 977baa05c516..f9f54c64c6af 100644
--- a/tcg/arm/tcg-target.inc.c
+++ b/tcg/arm/tcg-target.inc.c
@@ -1665,17 +1665,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_goto(s, COND_AL, tb_ret_addr);
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_offset) {
+        if (s->tb_jmp_insn_offset) {
             /* Direct jump method */
-            s->tb_jmp_offset[args[0]] = tcg_current_code_size(s);
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
             tcg_out_b_noaddr(s, COND_AL);
         } else {
             /* Indirect jump method */
-            intptr_t ptr = (intptr_t)(s->tb_next + args[0]);
+            intptr_t ptr = (intptr_t)(s->tb_jmp_target_addr + args[0]);
             tcg_out_movi32(s, COND_AL, TCG_REG_R0, ptr & ~0xfff);
             tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, TCG_REG_R0, ptr & 0xfff);
         }
-        s->tb_next_offset[args[0]] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
         tcg_out_goto_label(s, COND_AL, arg_label(args[0]));
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 8d242a666591..317484cb5db3 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1790,7 +1790,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_jmp(s, tb_ret_addr);
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_offset) {
+        if (s->tb_jmp_insn_offset) {
             /* direct jump method */
             int gap;
             /* jump displacement must be aligned for atomic patching;
@@ -1801,14 +1801,14 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                 tcg_out_nopn(s, gap - 1);
             }
             tcg_out8(s, OPC_JMP_long); /* jmp im */
-            s->tb_jmp_offset[args[0]] = tcg_current_code_size(s);
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
             tcg_out32(s, 0);
         } else {
             /* indirect jump method */
             tcg_out_modrm_offset(s, OPC_GRP5, EXT5_JMPN_Ev, -1,
-                                 (intptr_t)(s->tb_next + args[0]));
+                                 (intptr_t)(s->tb_jmp_target_addr + args[0]));
         }
-        s->tb_next_offset[args[0]] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
         tcg_out_jxx(s, JCC_JMP, arg_label(args[0]), 0);
diff --git a/tcg/ia64/tcg-target.inc.c b/tcg/ia64/tcg-target.inc.c
index 7557e6a9d41c..395223e34003 100644
--- a/tcg/ia64/tcg-target.inc.c
+++ b/tcg/ia64/tcg-target.inc.c
@@ -881,13 +881,13 @@ static void tcg_out_exit_tb(TCGContext *s, tcg_target_long arg)
 
 static inline void tcg_out_goto_tb(TCGContext *s, TCGArg arg)
 {
-    if (s->tb_jmp_offset) {
+    if (s->tb_jmp_insn_offset) {
         /* direct jump method */
         tcg_abort();
     } else {
         /* indirect jump method */
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R2,
-                     (tcg_target_long)(s->tb_next + arg));
+                     (tcg_target_long)(s->tb_jmp_target_addr + arg));
         tcg_out_bundle(s, MmI,
                        tcg_opc_m1 (TCG_REG_P0, OPC_LD8_M1,
                                    TCG_REG_R2, TCG_REG_R2),
@@ -900,7 +900,7 @@ static inline void tcg_out_goto_tb(TCGContext *s, TCGArg arg)
                        tcg_opc_b4 (TCG_REG_P0, OPC_BR_SPTK_MANY_B4,
                                    TCG_REG_B6));
     }
-    s->tb_next_offset[arg] = tcg_current_code_size(s);
+    s->tb_jmp_reset_offset[arg] = tcg_current_code_size(s);
 }
 
 static inline void tcg_out_jmp(TCGContext *s, TCGArg addr)
diff --git a/tcg/mips/tcg-target.inc.c b/tcg/mips/tcg-target.inc.c
index ee98e24c8cca..b0440b9c5a79 100644
--- a/tcg/mips/tcg-target.inc.c
+++ b/tcg/mips/tcg-target.inc.c
@@ -1397,19 +1397,19 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_offset) {
+        if (s->tb_jmp_insn_offset) {
             /* direct jump method */
-            s->tb_jmp_offset[a0] = tcg_current_code_size(s);
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
             /* Avoid clobbering the address during retranslation.  */
             tcg_out32(s, OPC_J | (*(uint32_t *)s->code_ptr & 0x3ffffff));
         } else {
             /* indirect jump method */
             tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                       (uintptr_t)(s->tb_next + a0));
+                       (uintptr_t)(s->tb_jmp_target_addr + a0));
             tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
         }
         tcg_out_nop(s);
-        s->tb_next_offset[a0] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
         tcg_out_brcond(s, TCG_COND_EQ, TCG_REG_ZERO, TCG_REG_ZERO,
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 039fa77748c2..da100528ab6f 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -1902,14 +1902,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_b(s, 0, tb_ret_addr);
         break;
     case INDEX_op_goto_tb:
-        tcg_debug_assert(s->tb_jmp_offset);
+        tcg_debug_assert(s->tb_jmp_insn_offset);
         /* Direct jump. */
 #ifdef __powerpc64__
         /* Ensure the next insns are 8-byte aligned. */
         if ((uintptr_t)s->code_ptr & 7) {
             tcg_out32(s, NOP);
         }
-        s->tb_jmp_offset[args[0]] = tcg_current_code_size(s);
+        s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
         /* To be replaced by either a branch+nop or a load into TMP1.  */
         s->code_ptr += 2;
         tcg_out32(s, MTSPR | RS(TCG_REG_TMP1) | CTR);
@@ -1918,7 +1918,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         /* To be replaced by a branch.  */
         s->code_ptr++;
 #endif
-        s->tb_next_offset[args[0]] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
         {
diff --git a/tcg/s390/tcg-target.inc.c b/tcg/s390/tcg-target.inc.c
index 8e8064ce73e7..e0a60e618c56 100644
--- a/tcg/s390/tcg-target.inc.c
+++ b/tcg/s390/tcg-target.inc.c
@@ -1717,7 +1717,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_offset) {
+        if (s->tb_jmp_insn_offset) {
             /* branch displacement must be aligned for atomic patching;
              * see if we need to add extra nop before branch
              */
@@ -1725,15 +1725,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                 tcg_out16(s, NOP);
             }
             tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-            s->tb_jmp_offset[args[0]] = tcg_current_code_size(s);
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
             s->code_ptr += 2;
         } else {
-            /* load address stored at s->tb_next + args[0] */
-            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_TMP0, s->tb_next + args[0]);
+            /* load address stored at s->tb_jmp_target_addr + args[0] */
+            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_TMP0,
+                           s->tb_jmp_target_addr + args[0]);
             /* and go there */
             tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_TMP0);
         }
-        s->tb_next_offset[args[0]] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
         break;
 
     OP_32_64(ld8u):
diff --git a/tcg/sparc/tcg-target.inc.c b/tcg/sparc/tcg-target.inc.c
index c6479e25076b..9938a5085eac 100644
--- a/tcg/sparc/tcg-target.inc.c
+++ b/tcg/sparc/tcg-target.inc.c
@@ -1229,18 +1229,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_offset) {
+        if (s->tb_jmp_insn_offset) {
             /* direct jump method */
-            s->tb_jmp_offset[a0] = tcg_current_code_size(s);
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
             /* Make sure to preserve links during retranslation.  */
             tcg_out32(s, CALL | (*s->code_ptr & ~INSN_OP(-1)));
         } else {
             /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_T1, (uintptr_t)(s->tb_next + a0));
+            tcg_out_ld_ptr(s, TCG_REG_T1,
+                           (uintptr_t)(s->tb_jmp_target_addr + a0));
             tcg_out_arithi(s, TCG_REG_G0, TCG_REG_T1, 0, JMPL);
         }
         tcg_out_nop(s);
-        s->tb_next_offset[a0] = tcg_current_code_size(s);
+        s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
         tcg_out_bpcc(s, COND_A, BPCC_PT, arg_label(a0));
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 40c8fbe2ae64..ea4ff02308fc 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -510,9 +510,9 @@ struct TCGContext {
 
     /* goto_tb support */
     tcg_insn_unit *code_buf;
-    uintptr_t *tb_next;
-    uint16_t *tb_next_offset;
-    uint16_t *tb_jmp_offset; /* != NULL if USE_DIRECT_JUMP */
+    uint16_t *tb_jmp_reset_offset; /* tb->jmp_reset_offset */
+    uint16_t *tb_jmp_insn_offset; /* tb->jmp_insn_offset if USE_DIRECT_JUMP */
+    uintptr_t *tb_jmp_target_addr; /* tb->jmp_target_addr if !USE_DIRECT_JUMP */
 
     /* liveness analysis */
     uint16_t *op_dead_args; /* for each operation, each bit tells if the
diff --git a/tcg/tci/tcg-target.inc.c b/tcg/tci/tcg-target.inc.c
index 85eeb5de246a..fa74d5278eaa 100644
--- a/tcg/tci/tcg-target.inc.c
+++ b/tcg/tci/tcg-target.inc.c
@@ -553,19 +553,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out64(s, args[0]);
         break;
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_offset) {
+        if (s->tb_jmp_insn_offset) {
             /* Direct jump method. */
-            tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_offset));
+            tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_insn_offset));
             /* Align for atomic patching and thread safety */
             s->code_ptr = QEMU_ALIGN_PTR_UP(s->code_ptr, 4);
-            s->tb_jmp_offset[args[0]] = tcg_current_code_size(s);
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
             tcg_out32(s, 0);
         } else {
             /* Indirect jump method. */
             TODO();
         }
-        tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_next_offset));
-        s->tb_next_offset[args[0]] = tcg_current_code_size(s);
+        tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_reset_offset));
+        s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
         break;
     case INDEX_op_br:
         tci_out_label(s, arg_label(args[0]));
diff --git a/translate-all.c b/translate-all.c
index 79a515dde74a..c6613d13c980 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -931,7 +931,7 @@ static inline void tb_jmp_remove(TranslationBlock *tb, int n)
     TranslationBlock *tb1, **ptb;
     unsigned int n1;
 
-    ptb = &tb->jmp_next[n];
+    ptb = &tb->jmp_list_next[n];
     tb1 = *ptb;
     if (tb1) {
         /* find tb(n) in circular list */
@@ -943,15 +943,15 @@ static inline void tb_jmp_remove(TranslationBlock *tb, int n)
                 break;
             }
             if (n1 == 2) {
-                ptb = &tb1->jmp_first;
+                ptb = &tb1->jmp_list_first;
             } else {
-                ptb = &tb1->jmp_next[n1];
+                ptb = &tb1->jmp_list_next[n1];
             }
         }
         /* now we can suppress tb(n) from the list */
-        *ptb = tb->jmp_next[n];
+        *ptb = tb->jmp_list_next[n];
 
-        tb->jmp_next[n] = NULL;
+        tb->jmp_list_next[n] = NULL;
     }
 }
 
@@ -959,7 +959,8 @@ static inline void tb_jmp_remove(TranslationBlock *tb, int n)
    another TB */
 static inline void tb_reset_jump(TranslationBlock *tb, int n)
 {
-    tb_set_jmp_target(tb, n, (uintptr_t)(tb->tc_ptr + tb->tb_next_offset[n]));
+    uintptr_t addr = (uintptr_t)(tb->tc_ptr + tb->jmp_reset_offset[n]);
+    tb_set_jmp_target(tb, n, addr);
 }
 
 /* invalidate one TB */
@@ -1003,19 +1004,21 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
     tb_jmp_remove(tb, 1);
 
     /* suppress any remaining jumps to this TB */
-    tb1 = tb->jmp_first;
+    tb1 = tb->jmp_list_first;
     for (;;) {
         n1 = (uintptr_t)tb1 & 3;
         if (n1 == 2) {
             break;
         }
         tb1 = (TranslationBlock *)((uintptr_t)tb1 & ~3);
-        tb2 = tb1->jmp_next[n1];
+        tb2 = tb1->jmp_list_next[n1];
         tb_reset_jump(tb1, n1);
-        tb1->jmp_next[n1] = NULL;
+        tb1->jmp_list_next[n1] = NULL;
         tb1 = tb2;
     }
-    tb->jmp_first = (TranslationBlock *)((uintptr_t)tb | 2); /* fail safe */
+
+    /* fail safe */
+    tb->jmp_list_first = (TranslationBlock *)((uintptr_t)tb | 2);
 
     tcg_ctx.tb_ctx.tb_phys_invalidate_count++;
 }
@@ -1100,15 +1103,15 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     trace_translate_block(tb, tb->pc, tb->tc_ptr);
 
     /* generate machine code */
-    tb->tb_next_offset[0] = 0xffff;
-    tb->tb_next_offset[1] = 0xffff;
-    tcg_ctx.tb_next_offset = tb->tb_next_offset;
+    tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
+    tb->jmp_reset_offset[1] = TB_JMP_RESET_OFFSET_INVALID;
+    tcg_ctx.tb_jmp_reset_offset = tb->jmp_reset_offset;
 #ifdef USE_DIRECT_JUMP
-    tcg_ctx.tb_jmp_offset = tb->tb_jmp_offset;
-    tcg_ctx.tb_next = NULL;
+    tcg_ctx.tb_jmp_insn_offset = tb->jmp_insn_offset;
+    tcg_ctx.tb_jmp_target_addr = NULL;
 #else
-    tcg_ctx.tb_jmp_offset = NULL;
-    tcg_ctx.tb_next = tb->tb_next;
+    tcg_ctx.tb_jmp_insn_offset = NULL;
+    tcg_ctx.tb_jmp_target_addr = tb->jmp_target_addr;
 #endif
 
 #ifdef CONFIG_PROFILER
@@ -1489,15 +1492,15 @@ static void tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
         tb->page_addr[1] = -1;
     }
 
-    tb->jmp_first = (TranslationBlock *)((uintptr_t)tb | 2);
-    tb->jmp_next[0] = NULL;
-    tb->jmp_next[1] = NULL;
+    tb->jmp_list_first = (TranslationBlock *)((uintptr_t)tb | 2);
+    tb->jmp_list_next[0] = NULL;
+    tb->jmp_list_next[1] = NULL;
 
     /* init original jump addresses */
-    if (tb->tb_next_offset[0] != 0xffff) {
+    if (tb->jmp_reset_offset[0] != TB_JMP_RESET_OFFSET_INVALID) {
         tb_reset_jump(tb, 0);
     }
-    if (tb->tb_next_offset[1] != 0xffff) {
+    if (tb->jmp_reset_offset[1] != TB_JMP_RESET_OFFSET_INVALID) {
         tb_reset_jump(tb, 1);
     }
 
@@ -1690,9 +1693,9 @@ void dump_exec_info(FILE *f, fprintf_function cpu_fprintf)
         if (tb->page_addr[1] != -1) {
             cross_page++;
         }
-        if (tb->tb_next_offset[0] != 0xffff) {
+        if (tb->jmp_reset_offset[0] != TB_JMP_RESET_OFFSET_INVALID) {
             direct_jmp_count++;
-            if (tb->tb_next_offset[1] != 0xffff) {
+            if (tb->jmp_reset_offset[1] != TB_JMP_RESET_OFFSET_INVALID) {
                 direct_jmp2_count++;
             }
         }
-- 
2.8.1
