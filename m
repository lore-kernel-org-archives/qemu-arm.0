Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476021njc;
        Tue, 20 May 2025 05:54:20 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:231:c99b:9fd7 with SMTP id d9443c01a7336-231d43ad4b6mr237768145ad.19.1747745660052;
        Tue, 20 May 2025 05:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745660; cv=none;
        d=google.com; s=arc-20240605;
        b=fPeS+Jthcs/yFjQOurTDSN99BLmDj3NTc0XSd2MY32hN/0XI/nrDuhcw32RilyjkUY
         p45jaBN4Z3tl464VOuCUKmm7u+pu//NxVRtgtQXtLC9+3v6Tp3L6m44iPkQTnfdIkofT
         tVlDk7cJvvzzI81+a6LA/38sWtSrxoVyQKMzuwuF1EyhZzE/Je5ozB/6xwFGWSDQoj+/
         2nXTfxeqOG92mhv6T+1Bw02E9xeVcH5/sUngYdVRqPC/x8E4eLb/rEykD4CrMlHsD9D0
         WKXvSPsXPNtDxmtCA9ldGKNB3kKh49ATe5dfPp3C/ngG/jtMKxgaJANncKf5pzGxZPVd
         l6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cDG0pwUWpFnKg/l7uQqlMEQTPTDfS039RvtWFwYIZBA=;
        fh=IY4uCNm7bjB4PRpOwzUwbF41e7X1eH3YrboLhFN8eP0=;
        b=GmtAG8ofMokUgVrjYWuqh7cbzO6xFZAj+B89hs/C3rCfkpzNPKEhLXj7zDuYLMsumr
         chPVp7fAqX5ERh1fzYdAz36AihqsYBruBvgPihrvrdZamN3vlCFDv9eRzSHQbc/t/Mcs
         suJbNPqDbK5JUIE/irUjtOovo12jsWK0opFsgBTIu9G4VxTUAKury5PC9PlAv8Vgu+ZR
         +sfSs8A7ds5vKSjHfXe7TPVndHojjTIlaORgY4C4mCmb4717EV5bbmBKpjDWSvfJQpS9
         jXrmJ+oLQq8glbzyazpcQsuvrw+7vGqSMRZzIdZeI/w4wh1QmkMYNPMN2lhcl2tkWT9E
         Dy4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="S/f676EX";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d47d9a78sor72656715ad.0.2025.05.20.05.54.19
        (Google Transport Security);
        Tue, 20 May 2025 05:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="S/f676EX";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745659; x=1748350459; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDG0pwUWpFnKg/l7uQqlMEQTPTDfS039RvtWFwYIZBA=;
        b=S/f676EX6csJZM8J2XJFofEJhGHc94VFYyG3aAj5Dv3sk6QYt66cyGSS97OUdFZk2S
         /yp/P/0yak2JR5UwUg3UwLBYEdnVetcMyzoS9qSIRs0gVzD0yYpt3Nr1Vlifvx1h6olx
         +DSWRchhi+N24udc3rPwaIt7j5qVolUDbB3YQ2bp6c9BQPLXT9dcnrb9U5hjGMx1uUUa
         UegADAqvjoX8TBvFYcRYrEjZuwi9oMkyvbVaPYY2KAbz/dvjxjuV3PSy9OLT3RUVL8l2
         +bRYzoi5p0rxWK92gEPdPAorpVYhdEix+0PoXGbamgKwDxskhvINEyZS+95tBsvrU0DD
         9/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745659; x=1748350459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDG0pwUWpFnKg/l7uQqlMEQTPTDfS039RvtWFwYIZBA=;
        b=Znw/Tg9qqEYWmih8Dk9GaUsvcpzeX037r5UzuBQwZDoVFD6sxCeMCydUYp/4CzcoN4
         XY9JPvFT3tkhIzhbnMO5gPOw3njLlH1gunNiIkI3jnLyw7PJH2wOSnr0QJiLESAaF6PZ
         nuOXtBx97S7kAh4ckExF1VomLj6AqRkJOq7/OCbZX89g7iF9IWkyA+diYDUZDcrFFyPF
         ItoqX7c1rYAbbi//5Mq3UVLp21o+ez+HmBvkfn5pDWoVzfl/W9lS7FXOgoPxUQBO2gux
         oQJSOCYwKK6avwWYAPchrh68tLzTupi0dEhLHjB5iHiSDSCkojHYQjFIptbS4yhMdsI4
         JPkA==
X-Forwarded-Encrypted: i=1; AJvYcCUl0D4WMgYL9j+v3ZHU9PM/gvzwnoRP7cGCNqUtKMkXEl8nPjDiCh7piWEKseCVobkt17Lc1kYMhk/M4tS080CPDg==@linaro.org, AJvYcCWDg0/jYjnv4cTAjrWEg0WoLCLraVs8xmnI4tS+vsHzVCv/QF3Ih8Zndid/bv2FLW4cI4gDCMtK9o0UlceOHaHghFg=@linaro.org, AJvYcCWT2QI6cK9XVUjRGItj2hlJ933aa1JQ9cxDeooakmKJT8fTFF/twng/v8wOUgKYSZmF6hdFCsg=@linaro.org
X-Gm-Message-State: AOJu0Yxibd006hrnTULn04zONXW+4qg4fiYq8QTpD62K51BuiB/5bzUb
	Vs/Dw+ji5spp3CaiX0jLYP+lYQXah6hms/3Vha3YNkRj/Wmo/VG33hMN+tM0QLnR
X-Gm-Gg: ASbGncszBAuJ1ndKK3JN9LbsmIcVxMnkAwY0y6/uu87dQv0I6yeOYii/emrTgyMEGDc
	gCE9wf/fYyRq8+5gwQaMjTdbGC+uYl3u8kHAROdAdI669y2hy2BdQjuIJe2NE+32qQyg5HEm2BS
	KHvcO9k0yar2me0NTzar/tEAzRXeMFi2dbuULi2P3tzJYfR2GrYa/Q7o1rye9SSYgkocpu3dlm9
	v5a0Kpf9+4ZdaDB9G3jc03R8CO5DdrogM6uZrB9lKnKWTh8cZM+a7EQrDXibjA++ouFAyG6szMs
	WyBG/EizTRal4EvTxG2Hyk4vcoyVTuniksVxg1ZqTSP3Ha5t/6U=
X-Google-Smtp-Source: AGHT+IHsAaRA9611AxQxc5NVjTREuknnJ6IQooXldl0fBT1ED1f+IK7+hrgUEmMdzmSvtkHTD8mfWg==
X-Received: by 2002:a17:90b:2c8c:b0:30e:823f:ef31 with SMTP id 98e67ed59e1d1-30e823ff071mr24002616a91.29.1747745648991;
        Tue, 20 May 2025 05:54:08 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:08 -0700 (PDT)
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
Subject: [PATCH 20/33] tcg/wasm32: Add exit_tb/goto_tb/goto_ptr instructions
Date: Tue, 20 May 2025 21:51:22 +0900
Message-ID: <021c0cb8cc58c4cb673b38b75d20d27e8dec1c40.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ALi+rFcHkRFe

In the Wasm backend, each TB is compiled to a separeted Wasm
module. Control transfer between TBs (i.e. from one Wasm module to
another) is handled by the caller of the module.

The goto_tb and goto_ptr operations are implemented by returning
control to the caller using the return instruction. The destination
TB's pointer is passed to the caller via a shared wasmContext
structure which is accessible from both the Wasm module and the caller. This
wasmContext must be provided to the module as an argument which is
accessible as the local variable at index 0.

If the destination TB is the current TB itself, there is no need to
return control to the caller. Instead, execution can jump directly to
the top of the loop within the TB.

The exit_tb operation sets the pointer in wasmContext to 0, indicating that
there is no destination TB.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS                 |   1 +
 tcg/wasm32.h                |  17 ++++++
 tcg/wasm32/tcg-target.c.inc | 111 ++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 tcg/wasm32.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ac5070d058..3ca93f90de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3953,6 +3953,7 @@ M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
 S: Maintained
 F: tcg/wasm32/
 F: tcg/wasm32.c
+F: tcg/wasm32.h
 
 Block drivers
 -------------
diff --git a/tcg/wasm32.h b/tcg/wasm32.h
new file mode 100644
index 0000000000..ffa359b7dc
--- /dev/null
+++ b/tcg/wasm32.h
@@ -0,0 +1,17 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef TCG_WASM32_H
+#define TCG_WASM32_H
+
+/*
+ * wasmContext is a data shared among QEMU and wasm modules.
+ */
+struct wasmContext {
+    /*
+     * Pointer to the TB to be executed.
+     */
+    void *tb_ptr;
+};
+
+#endif
diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index ea0d1ca874..77db50cf85 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -25,6 +25,8 @@
  * THE SOFTWARE.
  */
 
+#include "../wasm32.h"
+
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
@@ -128,6 +130,11 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
  */
 #define BLOCK_PTR_IDX 17
 
+/*
+ * pointer to wasmContext
+ */
+#define CTX_IDX 0
+
 /* Temporary local variables */
 #define TMP32_LOCAL_0_IDX 1
 #define TMP32_LOCAL_1_IDX 2
@@ -334,6 +341,14 @@ static void tcg_wasm_out_op_i32_eqz(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x45);
 }
+static void tcg_wasm_out_op_i32_eq(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x46);
+}
+static void tcg_wasm_out_op_i32_ne(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x47);
+}
 static void tcg_wasm_out_op_i64_lt_u(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x54);
@@ -380,6 +395,10 @@ static void tcg_wasm_out_op_end(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x0b);
 }
+static void tcg_wasm_out_op_return(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x0f);
+}
 static void tcg_wasm_out_op_var(TCGContext *s, uint8_t instr, uint8_t i)
 {
     tcg_wasm_out8(s, instr);
@@ -590,6 +609,16 @@ static void tcg_wasm_out_op_i64_load32_u(TCGContext *s, uint32_t a, uint32_t o)
     tcg_wasm_out_op_loadstore(s, 0x35, a, o);
 }
 
+static void tcg_wasm_out_op_i32_load(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x28, a, o);
+}
+
+static void tcg_wasm_out_op_i32_store(TCGContext *s, uint32_t a, uint32_t o)
+{
+    tcg_wasm_out_op_loadstore(s, 0x36, a, o);
+}
+
 static void tcg_wasm_out_op_not(TCGContext *s)
 {
     tcg_wasm_out_op_i64_const(s, -1);
@@ -1518,6 +1547,85 @@ static void tcg_wasm_out_brcond(TCGContext *s, TCGType type,
     tcg_wasm_out_op_br_to_label(s, l, true);
 }
 
+#define tcg_wasm_out_ctx_i32_store_const(s, f, v)                       \
+    do {                                                                \
+        tcg_wasm_out_op_local_get(s, CTX_IDX);                          \
+        tcg_wasm_out_op_i32_const(s, v);                                \
+        tcg_wasm_out_op_i32_store(s, 0, offsetof(struct wasmContext, f)); \
+    } while (0)
+
+#define tcg_wasm_out_ctx_i32_store_r(s, f, r)                           \
+    do {                                                                \
+        tcg_wasm_out_op_local_get(s, CTX_IDX);                          \
+        tcg_wasm_out_op_global_get_r(s, r);                             \
+        tcg_wasm_out_op_i32_wrap_i64(s);                                \
+        tcg_wasm_out_op_i32_store(s, 0, offsetof(struct wasmContext, f)); \
+    } while (0)
+
+#define tcg_wasm_out_ctx_i32_store_local32(s, f, var)                   \
+    do {                                                                \
+        tcg_wasm_out_op_local_get(s, CTX_IDX);                          \
+        tcg_wasm_out_op_local_get(s, var);                              \
+        tcg_wasm_out_op_i32_store(s, 0, offsetof(struct wasmContext, f)); \
+    } while (0)
+
+#define tcg_wasm_out_ctx_i32_load(s, f)                                 \
+    do {                                                                \
+        tcg_wasm_out_op_local_get(s, CTX_IDX);                          \
+        tcg_wasm_out_op_i32_load(s, 0, offsetof(struct wasmContext, f)); \
+    } while (0)
+
+static void tcg_wasm_out_exit_tb(TCGContext *s, uintptr_t arg)
+{
+    tcg_wasm_out_ctx_i32_store_const(s, tb_ptr, 0);
+    tcg_wasm_out_op_i32_const(s, (int32_t)arg);
+    tcg_wasm_out_op_return(s);
+}
+
+static void tcg_wasm_out_goto_ptr(TCGContext *s, TCGReg arg)
+{
+    tcg_wasm_out_op_global_get_r(s, arg);
+    tcg_wasm_out_op_i32_wrap_i64(s);
+    tcg_wasm_out_ctx_i32_load(s, tb_ptr);
+    tcg_wasm_out_op_i32_eq(s);
+    tcg_wasm_out_op_if_noret(s);
+    tcg_wasm_out_op_i64_const(s, 0);
+    tcg_wasm_out_op_global_set(s, BLOCK_PTR_IDX);
+    tcg_wasm_out_op_br(s, 2); /* br to the top of loop */
+    tcg_wasm_out_op_end(s);
+
+    tcg_wasm_out_ctx_i32_store_r(s, tb_ptr, arg);
+    tcg_wasm_out_op_i32_const(s, 0);
+    tcg_wasm_out_op_return(s);
+}
+
+static void tcg_wasm_out_goto_tb(
+    TCGContext *s, int which, uint32_t cur_reset_ptr)
+{
+    tcg_wasm_out_op_i32_const(s, (int32_t)get_jmp_target_addr(s, which));
+    tcg_wasm_out_op_i32_load(s, 0, 0);
+    tcg_wasm_out_op_local_set(s, TMP32_LOCAL_0_IDX);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, cur_reset_ptr);
+    tcg_wasm_out_op_i32_ne(s);
+    tcg_wasm_out_op_if_noret(s);
+
+    tcg_wasm_out_op_local_get(s, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_ctx_i32_load(s, tb_ptr);
+    tcg_wasm_out_op_i32_eq(s);
+    tcg_wasm_out_op_if_noret(s);
+    tcg_wasm_out_op_i64_const(s, 0);
+    tcg_wasm_out_op_global_set(s, BLOCK_PTR_IDX);
+    tcg_wasm_out_op_br(s, 3); /* br to the top of loop */
+    tcg_wasm_out_op_end(s);
+
+    tcg_wasm_out_ctx_i32_store_local32(s, tb_ptr, TMP32_LOCAL_0_IDX);
+    tcg_wasm_out_op_i32_const(s, 0);
+    tcg_wasm_out_op_return(s);
+    tcg_wasm_out_op_end(s);
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
 {
@@ -1931,6 +2039,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 {
     tcg_out_op_p(s, INDEX_op_exit_tb, (void *)arg);
+    tcg_wasm_out_exit_tb(s, arg);
 }
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
@@ -1938,11 +2047,13 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
     /* indirect jump method. */
     tcg_out_op_p(s, INDEX_op_goto_tb, (void *)get_jmp_target_addr(s, which));
     set_jmp_reset_offset(s, which);
+    tcg_wasm_out_goto_tb(s, which, (uint32_t)s->code_ptr);
 }
 
 static void tcg_out_goto_ptr(TCGContext *s, TCGReg a0)
 {
     tcg_out_op_r(s, INDEX_op_goto_ptr, a0);
+    tcg_wasm_out_goto_ptr(s, a0);
 }
 
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-- 
2.43.0
