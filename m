Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475985njc;
        Tue, 20 May 2025 05:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:3984:b0:215:fd75:c43e with SMTP id adf61e73a8af0-2170cde530amr23747954637.27.1747745655334;
        Tue, 20 May 2025 05:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745655; cv=none;
        d=google.com; s=arc-20240605;
        b=X0RdF8RSOOfsUyK0jdHYXpeb5nz6tnOb8H27Hou1BIV8XWK5Jz3sVyBPpofzhLvsdq
         Qe4PYvkgvsIiRNFptN4zqYnRlotQsEK2hkm2+Mx4wVtE5JRTc+J+Pd1AwylpubgQ7/4r
         8iGavFOvd5j6mnnIrVapTNWKjsArtp7fSs8ZTfnUopjDNy4B49TQHPFfc7o56w3Oj0ZH
         u6cBtlp4Qf+Zf6D7FNI4UqpPNVirczKr0yhHhKVS80EdWaVSifgc9L/LxISOCZGhNjo1
         aERirBxvOBC48k+ESJEXsvMqRJCsKGs1lKfimRDZnVuY5qpIudOogRshlTExkwUPO08r
         1Akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b7+9niXXB1Fhurf42nBGF3zTCxGh2saaYSnPS8Sr56Q=;
        fh=c83Wg5kxw/cp3XwD8SOnXo6amZEECL7ObMsBt0nSc5o=;
        b=aUmNvME6LV4eMP8p2kHlUk/hWQwgs9h/Qm7fdsWxo9/QCt/xGkkgXWEmXmooxKbazA
         jELnfl7ObgQfQyhdZCMgvFE8WqoO0iu9yCsHOGEK4OIRgMhlSCbUrDBFZB2ae2Wc2jJY
         mWv248Co96lbwH55KwxN3/VCLhW4p/MXYAlNgX7ryHsbG3tC5VIUZrPjAsXfU5NOpEPL
         hQ9nOiOMeqonhSvY6Sxkafg2oBRN84/bwVz0ZWSXI3ky9Tnv306Iv8NuZAgYyh5SKwSK
         YJ2n0giKc2qhhat/4OOlNX4Zp0lbLBNhOFAC9UumFccJfORX4qOnUQ7v3fb8GDxq7FIE
         7Mhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOpQfuAT;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb086982sor7230520a12.7.2025.05.20.05.54.15
        (Google Transport Security);
        Tue, 20 May 2025 05:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOpQfuAT;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745655; x=1748350455; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7+9niXXB1Fhurf42nBGF3zTCxGh2saaYSnPS8Sr56Q=;
        b=UOpQfuATHdKUOE1Ymi2y0JLvLQalk1S3mVcm5gH9USV/S6FaH5zyaoGGXFBcME2o6s
         RCmSBztCpCFcC1gJAdkPdCvjHpJ7PJ6Nr7cs9KIl85eU+WfIQdFrvdzwfobEq5B1iMl3
         OOABxcCuLqRSs5/GVOJJSPEsmW/+wUQshNjJr2gldHAVvjMkeorZOn2GXqKlVV/8TiVk
         h67w+LSdHSImV5ZPFJ8gxjAPTsIEKXBiXKC5pWAnUw2nSXc/KH7mKkjkIN9dbhhmMXXS
         fv/FOeLBafig0qh+uxBip8Vjrv9sj0uu4ajdSuDz2brCLxCWUOx9SU0zju7kxLLKZPYw
         uLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745655; x=1748350455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7+9niXXB1Fhurf42nBGF3zTCxGh2saaYSnPS8Sr56Q=;
        b=u2uMIBsVWovs7pJoO9IR+odnl8HwQa6aXiCexV6dw9IYrSdedRhnX8LL63koXvYIIK
         wlMGMBkuoFdlF7GotlObbkpPxNT7w8hNyW5Hft6lEwomPF+0OBFW1bN6ojSvuRxtoo0k
         6BBSJFP2yXrsEqtyNJGSGcAg1zuC7L5majK3PseQgaboBXNSGAP9hlS/CT1MgJB16wpi
         Oxb4jwkv+/Tsmf78SrlF8LHckJTqojDKlKo7BLhCl20GAzgT6gONJ06usaSBVk+tjSAq
         CqLB0fcHf4PvAfugbBaYqFHjNbEeyi+tnIFHEcYFNJ4g3hm+xdBP5EiIOr2K6IYSgdCG
         qr5g==
X-Forwarded-Encrypted: i=1; AJvYcCWKeRPGkO6fCYSXXK7+mbgWpcYjNZsG/qCqUWJq+d0YavK7ToYe1yctMkuN9d0HdqFRanOp7ik=@linaro.org, AJvYcCWR8cdhJPFFcqm2zDz90p+9gW1p7ZMA0IiObnItGXAq3Ia0M8d87fU50yhUfIE/AwJ2syHwCPW9LmfCzSySIdnzGw==@linaro.org, AJvYcCX9rcJB3OUnqtK5Pk+ObNyBNGg03lTi+IKJLByGwN7s8luJoxqMdJ+EBb8W09RQAn3WLgotzeYc5LC0y5xOJ52ESac=@linaro.org
X-Gm-Message-State: AOJu0Yxbdwcf1EWyHhNrU+b36xDVK94ZhFYnwk3gdJ5PhcAx6HFQee1t
	Q6foQlWXTJrA49GtAR0OhMm5YIq4Hnfl9LhFJfALxebsVzlQqwgYp3a1
X-Gm-Gg: ASbGnct42nWFTwy6DVTr5Hz5HI1zsamNf/E20Sc+rW2zxWgALcotYyDnauNLtPnt+fV
	gFk0RR0ZKh321os5LQgnod8YDNXbKs8WWZXQ2q57XvS4jYJVU2XT02ZrYUUjZ13LCqkGG9/dg73
	L69KDh1SQ8ah2zSVmu5LlB7XFMrhUbvPZes0mDBBxINQgTnKoy7KWkndpP5lqG+Yk/e6BTQ6zrH
	IvFVmdT1VmVRPFGsyyRCy/NKxkj1seSOFqMqpNRO19roV7UQcd9nrt3iSAjNzyFbxcmcQ7yGVuB
	/4GDdUViuy3deyeMCjiUbmwZRxxBtdrn+R+MmPwUNJ7ppsbxjpkJaJOOG7xeIQ==
X-Google-Smtp-Source: AGHT+IFPlqRQ1YPOgXYMn8sylaCHdOyEFt8VqLuMxdXEvsU5rL1gozNwHMX/DB8mCdVHm0qWPQn8Vw==
X-Received: by 2002:a17:90b:33c2:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-30e830f7b18mr25403623a91.8.1747745654522;
        Tue, 20 May 2025 05:54:14 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:14 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 21/33] tcg/wasm32: Add call instruction
Date: Tue, 20 May 2025 21:51:23 +0900
Message-ID: <f25caa407e47079f1c305869a5bce9857fb86cfd.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zdR29k0/qm+f

To call QEMU functions from a TB (i.e. a Wasm module), those functions must
be imported into the module.

Wasm's call instruction can invoke an imported function using a locally
assigned function index. When a call TCG operation is generated, the Wasm
backend assigns a unique ID (starting from 0) to the target function. The
mapping between the function pointer and its assigned ID is recorded in the
HelperInfo structure.

Since Wasm's call instruction requires arguments to be pushed onto the Wasm
stack, the backend retrieves the function arguments from TCG's stack array
and pushes them to the stack before the call. After the function returns,
the result is retrieved from the stack and set in the corresponding TCG
variable.

In our Emscripten build configuration with !has_int128_type, a 128-bit value
is represented by the Int128 struct. These values are passed indirectly via
pointer parameters and returned via a prepended pointer argument, as
described in [1].

[1] https://github.com/WebAssembly/tool-conventions/blob/060cf4073e46931160c2e9ecd43177ee1fe93866/BasicCABI.md#function-arguments-and-return-values

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32.h                |  10 +++
 tcg/wasm32/tcg-target.c.inc | 170 ++++++++++++++++++++++++++++++++++++
 2 files changed, 180 insertions(+)

diff --git a/tcg/wasm32.h b/tcg/wasm32.h
index ffa359b7dc..1944249891 100644
--- a/tcg/wasm32.h
+++ b/tcg/wasm32.h
@@ -12,6 +12,16 @@ struct wasmContext {
      * Pointer to the TB to be executed.
      */
     void *tb_ptr;
+
+    /*
+     * Pointer to the tci_tb_ptr variable.
+     */
+    void *tci_tb_ptr;
+
+    /*
+     * Buffer to store 128bit return value on call.
+     */
+    void *buf128;
 };
 
 #endif
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 77db50cf85..708af1fbb6 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -140,6 +140,9 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
 #define TMP32_LOCAL_1_IDX 2
 #define TMP64_LOCAL_0_IDX 3
 
+/* function index */
+#define HELPER_IDX_START 0 /* helper funcitons */
+
 #define BUF_SIZE 1024
 typedef struct LinkedBuf {
     struct LinkedBuf *next;
@@ -619,6 +622,12 @@ static void tcg_wasm_out_op_i32_store(TCGContext *s, uint32_t a, uint32_t o)
     tcg_wasm_out_op_loadstore(s, 0x36, a, o);
 }
 
+static void tcg_wasm_out_op_call(TCGContext *s, uint32_t func_idx)
+{
+    tcg_wasm_out8(s, 0x10);
+    tcg_wasm_out_leb128_uint32_t(s, func_idx);
+}
+
 static void tcg_wasm_out_op_not(TCGContext *s)
 {
     tcg_wasm_out_op_i64_const(s, -1);
@@ -1626,6 +1635,165 @@ static void tcg_wasm_out_goto_tb(
     tcg_wasm_out_op_end(s);
 }
 
+static void push_arg_i64(TCGContext *s, int *stack_offset)
+{
+    tcg_wasm_out_op_global_get_r(s, TCG_REG_CALL_STACK);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_op_i64_load(s, 0, *stack_offset);
+    *stack_offset = *stack_offset + 8;
+}
+
+static void gen_call(TCGContext *s, const TCGHelperInfo *info, int func_idx)
+{
+    unsigned typemask = info->typemask;
+    int rettype = typemask & 7;
+    int stack_offset = 0;
+
+    if (rettype ==  dh_typecode_i128) {
+        /* receive 128bit return value via the buffer */
+        tcg_wasm_out_ctx_i32_load(s, buf128);
+    }
+
+    for (typemask >>= 3; typemask; typemask >>= 3) {
+        int typecode = typemask & 7;
+        if (typecode == dh_typecode_void) {
+            continue;
+        }
+        switch (typecode) {
+        case dh_typecode_i32:
+        case dh_typecode_s32:
+        case dh_typecode_ptr:
+            push_arg_i64(s, &stack_offset);
+            tcg_wasm_out_op_i32_wrap_i64(s);
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            push_arg_i64(s, &stack_offset);
+            break;
+        case dh_typecode_i128:
+            tcg_wasm_out_op_global_get_r(s, TCG_REG_CALL_STACK);
+            tcg_wasm_out_op_i32_wrap_i64(s);
+            tcg_wasm_out_op_i32_const(s, stack_offset);
+            tcg_wasm_out_op_i32_add(s);
+            stack_offset += 16;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    tcg_wasm_out_op_call(s, func_idx);
+
+    if (rettype != dh_typecode_void) {
+        switch (rettype) {
+        case dh_typecode_i32:
+        case dh_typecode_s32:
+        case dh_typecode_ptr:
+            tcg_wasm_out_op_i64_extend_i32_s(s);
+            tcg_wasm_out_op_global_set_r(s, TCG_REG_R0);
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            tcg_wasm_out_op_global_set_r(s, TCG_REG_R0);
+            break;
+        case dh_typecode_i128:
+            tcg_wasm_out_ctx_i32_load(s, buf128);
+            tcg_wasm_out_op_i64_load(s, 0, 0);
+            tcg_wasm_out_op_global_set_r(s, TCG_REG_R0);
+            tcg_wasm_out_ctx_i32_load(s, buf128);
+            tcg_wasm_out_op_i64_load(s, 0, 8);
+            tcg_wasm_out_op_global_set_r(s, TCG_REG_R1);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    return;
+}
+
+typedef struct HelperInfo {
+    struct HelperInfo *next;
+    uint32_t idx_on_qemu;
+} HelperInfo;
+
+__thread HelperInfo *helpers;
+
+static void init_helpers(void)
+{
+    helpers = NULL;
+}
+
+static int register_helper(TCGContext *s, int helper_idx_on_qemu)
+{
+    int idx = HELPER_IDX_START;
+
+    tcg_debug_assert(helper_idx_on_qemu >= 0);
+
+    HelperInfo *e = tcg_malloc(sizeof(HelperInfo));
+    e->idx_on_qemu = helper_idx_on_qemu;
+    e->next = NULL;
+    if (helpers == NULL) {
+        helpers = e;
+        return idx;
+    }
+    HelperInfo *last = helpers;
+    for (HelperInfo *p = last; p; p = p->next) {
+        last = p;
+        idx++;
+    }
+    last->next = e;
+    return idx;
+}
+
+static int helpers_len(void)
+{
+    int n = 0;
+    for (HelperInfo *p = helpers; p; p = p->next) {
+        n++;
+    }
+    return n;
+}
+
+static inline int helpers_copy(uint32_t *dst)
+{
+    void *start = dst;
+    for (HelperInfo *p = helpers; p; p = p->next) {
+        *dst++ = p->idx_on_qemu;
+    }
+    return (int)dst - (int)start;
+}
+
+
+static int get_helper_idx(TCGContext *s, int helper_idx_on_qemu)
+{
+    int idx = HELPER_IDX_START;
+
+    for (HelperInfo *p = helpers; p; p = p->next) {
+        if (p->idx_on_qemu == helper_idx_on_qemu) {
+            return idx;
+        }
+        idx++;
+    }
+    return -1;
+}
+
+static void tcg_wasm_out_call(TCGContext *s, int func,
+                              const TCGHelperInfo *info)
+{
+    int func_idx = get_helper_idx(s, (int)func);
+    if (func_idx < 0) {
+        func_idx = register_helper(s, (int)func);
+    }
+
+    tcg_wasm_out_ctx_i32_load(s, tci_tb_ptr);
+    tcg_wasm_out_op_i32_const(s, (int32_t)s->code_ptr);
+    tcg_wasm_out_op_i32_store(s, 0, 0);
+
+    gen_call(s, info, func_idx);
+}
+
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -2034,6 +2202,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
     insn = deposit32(insn, 0, 8, INDEX_op_call);
     insn = deposit32(insn, 8, 4, which);
     tcg_out32(s, insn);
+    tcg_wasm_out_call(s, (int)func, info);
 }
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
@@ -3072,6 +3241,7 @@ static void tcg_out_tb_start(TCGContext *s)
     init_sub_buf();
     init_blocks();
     init_label_info();
+    init_helpers();
 
     tcg_wasm_out_op_loop_noret(s);
     tcg_wasm_out_op_global_get(s, BLOCK_PTR_IDX);
-- 
2.43.0
