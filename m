Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBE1C9831E
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:08:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMRQ-0004Zw-A6; Sat, 26 Sep 2026 03:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQq-0003CJ-7p
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:48 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQo-0000Yb-Dq
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:47 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-3381a6a05c9so987994eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406164; x=1791010964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+/cSI9KSeYzGrYLevJhsdqe9Hab1ATMpzGrHMp6RW0U=;
 b=sE3TPoYyy+w/5D1Rr+niiEDD5DEbfFd0GY55nP2glZrUwnP7Hu0w7YnG0sxXGjtlxC
 TqTilCeK2LseGqJRwGOinsJHVzzUArXoCHICBc8kx0wtdkHKwNcn5o+7EGiVVwfbvgnw
 UOPhxl6CDZPeHbKB4AdpMonUFTJwD7K3M90fiGG71Ux17OBBx8aZRZcDsDrSYusQKfr6
 sI9Xgb7i3pKS4V6sNmzCCoMS2xUnyFDYzKQ18gG30Ukj78gUKvdeIFhZvFQtu+5mhmKq
 NAQlFPd2pQf2NGqWmf6+OlF4Azgl6GtQroVcKJAs3+xFnx1Hni3OuIrHXb0CGpdydkVn
 idLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406164; x=1791010964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+/cSI9KSeYzGrYLevJhsdqe9Hab1ATMpzGrHMp6RW0U=;
 b=uOPJ5lKCCKNmVctaBhXNerZ7hIiox5KGE7NwnSwfa8n/kZ5KIIQwJgdGPVgNltawAZ
 yWL9ZYSVmwp2aYtZJKUUPQZVmwUIkePeKpKzRAhdANtVbQXlb4/zV4LIVdKYnYKivErk
 shtEH4Jg4qTHod2shzAWHhnZ/8F0yr4bRmyxlq3hrk6oazBLV5MNX51r4VUORzHTsi3V
 bimYgn7UCt74Q4wXZ+5ts0SIsMi+r9yWTC0SVmCElFlX9xuuSqrrtRWkqbAzsuXfgNzy
 d+Dc+FZLDXmOQ+ZH4cxDz9HKRiGGFxvQX+vtGGZNIzryadukZJh0EZWBiB7rXKhuqo7o
 47ew==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLhEyImtLQY1M3rlbMiGfLt2aMTp3dywiqgOkQwLA4dJ67oCe7f2jOTZLgkv1r54tYHLMOc9F26w==@nongnu.org
X-Gm-Message-State: AFuF++nQ6QWxfAzdY9rcMIZwrGILvD5p0jDQyNyIyA5PTxkRIczdDxVA
 +vopys0dzKt18IbWtIhpjtbSRUeI01EqGhkHapDJFnYscRu6l2kNxr7G
X-Gm-Gg: AYBFou154KNWyDxYae1pCKq2jCk/POPR3VZUbDm670GCSVYts3xHy2PirFZObTNGTM+
 Q/MejT18tBLvS2ngSe9apd82ou+ZicKMFXbM3gok4u7OzMcRFeBTPnnEMB9hU7Md1/ofijo0tfG
 FH9nSUSy9s1xsAGSLie4EaQJRe+T1+hI+qY6nt6wm5iqepm1Q3Nsbu8uYUnKZrU5qfbxtaf36NL
 u3a+V69dSBcz3vfVqDQXtY3EauN5v5qiUj7DPA9s/WLflsfMEx8AQf+H0UBI+aFmsxKTCmh8MBK
 JxGzDn4pl0PlysYFVO9/y1BpoJLLbvXDeRNSJs7Sm2/amFdEVJslcl4MKEHKkaWaGzaT3SLo30C
 5khuofy2Iiyx6my5YTeutotjB0oQd5kfc8ZUs9EZW6U+EZtS+ptvyEmygbhcT+zpV3NAbdx2XTx
 RPqTnmm00qJZUjw9YCvlauIRjXUqrRmKy/8MoCrrp7+IkmwLpJmen9c/bUygrHRpcY4QCL0PEx6
 km3feHsYOaAGkQKm3lEiUw+gnhjMrY=
X-Received: by 2002:a05:7301:7e04:b0:33b:c122:6bd4 with SMTP id
 5a478bee46e88-342701bed7amr1810144eec.6.1790406164340; 
 Sat, 26 Sep 2026 00:02:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:02:43 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 25/55] tcg: give common-system helper tl an i64 slot
Date: Sat, 26 Sep 2026 15:00:24 +0800
Message-ID: <20260926070057.1234-26-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

dh_alias_tl stays tl. In common-system code the helper C slot stays
uint64_t and the typecode stays i64, because one typemask is shared
by 32- and 64-bit guests. tcg_gen_callN zero-extends an I32 temp into
that slot and truncates an i64 return.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/exec/helper-head.h.inc | 21 ++++++++++++++++++--
 tcg/tcg.c                      | 35 ++++++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/include/exec/helper-head.h.inc b/include/exec/helper-head.h.inc
index 7dec5f5b067..6612937c5ae 100644
--- a/include/exec/helper-head.h.inc
+++ b/include/exec/helper-head.h.inc
@@ -45,16 +45,29 @@
 #define dh_ctype_noreturn G_NORETURN void
 #define dh_ctype(t) dh_ctype_##t
 
+#define dh_alias_tl tl
 #ifdef COMPILING_PER_TARGET
 # include "exec/target_long.h"
 # if TARGET_LONG_BITS == 32
-#  define dh_alias_tl i32
 #  define dh_typecode_tl dh_typecode_i32
 # else
-#  define dh_alias_tl i64
 #  define dh_typecode_tl dh_typecode_i64
 # endif
 # define dh_ctype_tl target_ulong
+#else
+/*
+ * Common-system helper FFI only: helper_info.typemask is compile-time
+ * and shared by 32- and 64-bit guests, so the C/libffi slot is
+ * max(i32, i64) -- always i64 / uint64_t. This is not the TCG temp
+ * width. TCGv_tl stays dynamic (I32 or I64 via tcg_type_tl());
+ * tcgv_tl_temp() is the handle-to-TCGTemp accessor and is valid for
+ * either size. Call lowering zero-extends an I32 temp into this
+ * unsigned i64 slot (dh_typecode_tl is i64, not s64). A helper C
+ * body that needs a signed guest value must narrow to XLEN and
+ * sign-extend itself; (int64_t)arg is not a 32-bit sign-extend.
+ */
+# define dh_typecode_tl dh_typecode_i64
+# define dh_ctype_tl uint64_t
 #endif /* COMPILING_PER_TARGET */
 
 #if __SIZEOF_POINTER__ == 4
@@ -76,6 +89,7 @@
 #define dh_retvar_decl0_i64 TCGv_i64 retval
 #define dh_retval_decl0_i128 TCGv_i128 retval
 #define dh_retvar_decl0_ptr TCGv_ptr retval
+#define dh_retvar_decl0_tl TCGv_tl retval
 #define dh_retvar_decl0(t) glue(dh_retvar_decl0_, dh_alias(t))
 
 #define dh_retvar_decl_void
@@ -84,6 +98,7 @@
 #define dh_retvar_decl_i64 TCGv_i64 retval,
 #define dh_retvar_decl_i128 TCGv_i128 retval,
 #define dh_retvar_decl_ptr TCGv_ptr retval,
+#define dh_retvar_decl_tl TCGv_tl retval,
 #define dh_retvar_decl(t) glue(dh_retvar_decl_, dh_alias(t))
 
 #define dh_retvar_void NULL
@@ -92,6 +107,7 @@
 #define dh_retvar_i64 tcgv_i64_temp(retval)
 #define dh_retvar_i128 tcgv_i128_temp(retval)
 #define dh_retvar_ptr tcgv_ptr_temp(retval)
+#define dh_retvar_tl tcgv_tl_temp(retval)
 #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
 
 #define dh_typecode_void 0
@@ -115,6 +131,7 @@
 #define dh_callflag_i64  0
 #define dh_callflag_i128 0
 #define dh_callflag_ptr  0
+#define dh_callflag_tl   0
 #define dh_callflag_void 0
 #define dh_callflag_noreturn TCG_CALL_NO_RETURN
 #define dh_callflag(t) glue(dh_callflag_, dh_alias(t))
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ecc1f54c1bf..ba2a1127f92 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2515,6 +2515,8 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
                           TCGTemp *ret, TCGTemp **args)
 {
     TCGv_i64 extend_free[MAX_CALL_IARGS];
+    TCGv_i64 ret_temp = NULL;
+    TCGTemp *orig_ret = ret;
     int n_extend = 0;
     TCGOp *op;
     int i, n, pi = 0, total_args;
@@ -2524,6 +2526,19 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
         g_once_init_leave(HELPER_INFO_INIT(info), HELPER_INFO_INIT_VAL(info));
     }
 
+    /*
+     * An I32 temp in an i64 slot is zero-extended; s64 is sign-extended.
+     * The call returns the wide temp, then extrl writes the I32 back.
+     */
+    if (ret != NULL && ret->type == TCG_TYPE_I32) {
+        unsigned typecode = info->typemask & 7;
+
+        if (typecode == dh_typecode_i64 || typecode == dh_typecode_s64) {
+            ret_temp = tcg_temp_ebb_new_i64();
+            ret = tcgv_i64_temp(ret_temp);
+        }
+    }
+
     total_args = info->nr_out + info->nr_in + 2;
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
@@ -2560,8 +2575,19 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
     for (i = 0; i < n; i++) {
         const TCGCallArgumentLoc *loc = &info->in[i];
         TCGTemp *ts = args[loc->arg_idx] + loc->tmp_subindex;
+        TCGCallArgumentKind kind = loc->kind;
 
-        switch (loc->kind) {
+        if (kind == TCG_CALL_ARG_NORMAL && ts->type == TCG_TYPE_I32) {
+            unsigned typecode =
+                extract32(info->typemask, (loc->arg_idx + 1) * 3, 3);
+
+            if (typecode == dh_typecode_i64 ||
+                typecode == dh_typecode_s64) {
+                kind = TCG_CALL_ARG_EXTEND_U + (typecode & 1);
+            }
+        }
+
+        switch (kind) {
         case TCG_CALL_ARG_NORMAL:
         case TCG_CALL_ARG_BY_REF:
         case TCG_CALL_ARG_BY_REF_N:
@@ -2574,7 +2600,7 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
                 TCGv_i64 temp = tcg_temp_ebb_new_i64();
                 TCGv_i32 orig = temp_tcgv_i32(ts);
 
-                if (loc->kind == TCG_CALL_ARG_EXTEND_S) {
+                if (kind == TCG_CALL_ARG_EXTEND_S) {
                     tcg_gen_ext_i32_i64(temp, orig);
                 } else {
                     tcg_gen_extu_i32_i64(temp, orig);
@@ -2602,6 +2628,11 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
     for (i = 0; i < n_extend; ++i) {
         tcg_temp_free_i64(extend_free[i]);
     }
+
+    if (ret_temp != NULL) {
+        tcg_gen_extrl_i64_i32(temp_tcgv_i32(orig_ret), ret_temp);
+        tcg_temp_free_i64(ret_temp);
+    }
 }
 
 void tcg_gen_call0(void *func, TCGHelperInfo *info, TCGTemp *ret)
-- 
2.52.0.windows.1


