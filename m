Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1713C88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:22:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGtB-00054R-Pp; Mon, 26 Jan 2026 02:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGff-00032S-AG
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:12 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfN-0004OW-CE
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:50 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-352c414bbbeso3581957a91.0
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411124; x=1770015924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRvv9p8AjfI6p8OdF3uHIM8PWJAgRGM7ioj0JHvJIuU=;
 b=GiJlcjRjpl3teIDCQHzRXE5BOClZuQ/8A6syb9Lie8cwrrwW+M94R8PGoZdCdO8GVV
 pZbAh4uCHLkfdPpjorgrE15Yl5qj9rvh4hrIAQmpcMVuPQ4Izz3U8jcbc0fPt23dT7KM
 ua1WkW62h6BgS8MT3PbDQjelRnChECEAxi8xFu04D2nnEL9x8XAJwXCpadU5tACk8j+R
 Ufj6IUJDSWaRIsV6WX2He5OcHgSQBvhZ0Xvziq3ZJdaiejYdlHAr4qPgHy7QxpNpFIR2
 q/ntj5gGOcEa80gtF8ca5tuK8bmyH55YaSzHVxCb6yndpCGMFCLxbWQLS2u47zO/Mg3l
 tSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411124; x=1770015924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hRvv9p8AjfI6p8OdF3uHIM8PWJAgRGM7ioj0JHvJIuU=;
 b=J8Cu1JFXisMArmIDDPseIEIvlRECb7acnv6RwKGnV8MkMZiXxdPvHZ+HvoH89r3Mh8
 HDqi7jLxb+n8yflrQ9mzUroM36Dh4uooQ8Iw4uwm3PWMp7AXT51G20ASE84UwLfxzWuB
 Fx0b3UEjHshg8v2ZSal+Lz+S4sQWRBh0TCzHjYLOIO92bKa68esP7FuW6FZh2rSa3vd9
 2icEGxKa+1YZnk6DR+UGFuvb9EfTAahWm2RSdp1GnEOE1dr529ScZStQXY5wvG92Ud+t
 M74rME3CAvcqW6dsV3ZiBJtx/IKuDUsEzv+5bC3N44Z0lQZYBVJUMqOsOkuggaMBBBq/
 tlzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMtfqypYlpeuJxU5P5KeHT0y6zauSmT1oeKHFf309uZAyssnprXRPfhHV//aQq0eqjDWPrQdA5HA==@nongnu.org
X-Gm-Message-State: AOJu0Yy1BOpdry64nX5qiwORh/YwEQ0SMg4QBFO4fjO2AZbea6Sue00x
 5eRKqKIZpyqfphSyW1LixY99r1BEkmAXgHXIlWMNAoyadLCE4rJkIFoZ
X-Gm-Gg: AZuq6aL7ZWdy4hfkc+/yzJGZcOcecVREcFaAJIKZjcwW49RGofmvpU1BmKsJJmqjQK9
 PNkOH9vukeIctNySvVpRDfS8Wps4i+JzA5U1mX/tbpL3+yQNrZ4ktVn01fWg7PlA5/HpWGgdg03
 CDDIczKdW+uaQXDHWUB9J12QXfFZfr9B4DJUjxA/CZjF4xEkRA265Jn/VT6YR66mH9znYavKGaR
 AKEahCHxoSi1KMZ90bz17MxbwL5LyLHQ/jO3Zlp+Ivny3Oyfe/2JUQzmqwi5Jpwznh7+uVdDU0/
 MMleZOUwOQv9iDYx/c4Zg3dDPWhpEBVH6Qf0BUK9B0XlFhQeRoLu22GaKVKY1DVFoXcvUQgX3Hd
 cx53rNVG71xwNRd9rgG8OMoqp9OfLkaRi+2sKa67vXfvj58vrUYO+kvfJZxsOCJyxAtoqN3XQKH
 LY2fAejb+UMRjxJXqkbmQdCaGL+ZMBo7enPpQ9Ra9OtQ==
X-Received: by 2002:a17:90a:d88b:b0:340:bfcd:6af9 with SMTP id
 98e67ed59e1d1-353c446c8d2mr2783226a91.3.1769411123864; 
 Sun, 25 Jan 2026 23:05:23 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:05:23 -0800 (PST)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 17/33] tcg/wasm64: Add exit_tb/goto_tb/goto_ptr instructions
Date: Mon, 26 Jan 2026 07:03:30 +0000
Message-ID: <3d4437590a984eea62ed4ae809087de6531fc643.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In the Wasm backend, each TB is compiled to a separeted Wasm module. Control
transfer between TBs (i.e. from one Wasm module to another) is handled by
the caller of the module.

The goto_tb and goto_ptr operations are implemented by returning control to
the caller using the return instruction. The destination TB's pointer is
passed to the caller via a shared WasmContext structure which is accessible
from both the Wasm module and the caller. This WasmContext must be provided
to the module as an argument.

If the destination TB is the current TB itself, there is no need to return
control to the caller. Instead, execution can jump directly to the top of
the loop within the TB.

The exit_tb operation sets the pointer in WasmContext to 0, indicating that
there is no destination TB.

TCI instructions are also generated in the same way as the original TCI
backend.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS                 |   1 +
 tcg/wasm64.c                |  20 ++++++
 tcg/wasm64.h                |  15 ++++
 tcg/wasm64/tcg-target.c.inc | 136 ++++++++++++++++++++++++++++++++++++
 4 files changed, 172 insertions(+)
 create mode 100644 tcg/wasm64.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 30e468f290..40aae1fc8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4112,6 +4112,7 @@ M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
 S: Maintained
 F: tcg/wasm64/
 F: tcg/wasm64.c
+F: tcg/wasm64.h
 
 Block drivers
 -------------
diff --git a/tcg/wasm64.c b/tcg/wasm64.c
index ca67436192..c54c5c5b2c 100644
--- a/tcg/wasm64.c
+++ b/tcg/wasm64.c
@@ -28,6 +28,11 @@ static void tci_args_l(uint32_t insn, const void *tb_ptr, void **l0)
     *l0 = diff ? (void *)tb_ptr + diff : NULL;
 }
 
+static void tci_args_r(uint32_t insn, TCGReg *r0)
+{
+    *r0 = extract32(insn, 8, 4);
+}
+
 static void tci_args_rl(uint32_t insn, const void *tb_ptr,
                         TCGReg *r0, void **l1)
 {
@@ -413,6 +418,21 @@ static uintptr_t tcg_qemu_tb_exec_tci(CPUArchState *env, const void *v_tb_ptr)
                 tb_ptr = ptr;
             }
             break;
+        case INDEX_op_exit_tb:
+            tci_args_l(insn, tb_ptr, &ptr);
+            return (uintptr_t)ptr;
+        case INDEX_op_goto_tb:
+            tci_args_l(insn, tb_ptr, &ptr);
+            tb_ptr = *(void **)ptr;
+            break;
+        case INDEX_op_goto_ptr:
+            tci_args_r(insn, &r0);
+            ptr = (void *)regs[r0];
+            if (!ptr) {
+                return 0;
+            }
+            tb_ptr = ptr;
+            break;
         default:
             g_assert_not_reached();
         }
diff --git a/tcg/wasm64.h b/tcg/wasm64.h
new file mode 100644
index 0000000000..9da38e4d0e
--- /dev/null
+++ b/tcg/wasm64.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef TCG_WASM_H
+#define TCG_WASM_H
+
+/*
+ * WasmContext is a data shared among QEMU and wasm modules.
+ */
+struct WasmContext {
+    /*
+     * Pointer to the TB to be executed.
+     */
+    void *tb_ptr;
+};
+
+#endif
diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index 3fe0ae2381..ff1151390b 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/queue.h"
+#include "../wasm64.h"
 
 typedef uint32_t tcg_insn_unit_tci;
 
@@ -139,6 +140,9 @@ static const uint8_t tcg_target_reg_index[TCG_TARGET_NB_REGS] = {
 /* Global variable used for storing the current block index */
 #define BLOCK_IDX 16
 
+/* Local variable pointing to WasmContext */
+#define CTX_IDX 0
+
 typedef enum {
     OPC_UNREACHABLE = 0x00,
     OPC_LOOP = 0x03,
@@ -146,6 +150,8 @@ typedef enum {
     OPC_ELSE = 0x05,
     OPC_END = 0x0b,
     OPC_BR = 0x0c,
+    OPC_RETURN = 0x0f,
+    OPC_LOCAL_GET = 0x20,
     OPC_GLOBAL_GET = 0x23,
     OPC_GLOBAL_SET = 0x24,
 
@@ -751,6 +757,81 @@ static void tcg_wasm_out_brcond(TCGContext *s, TCGType type,
     tcg_wasm_out_br_to_label(s, l, true);
 }
 
+#define CTX_OFFSET(f) offsetof(struct WasmContext, f)
+
+static intptr_t tcg_wasm_out_get_ctx(TCGContext *s, intptr_t off)
+{
+    tcg_wasm_out_op_idx(s, OPC_LOCAL_GET, CTX_IDX);
+    return tcg_wasm_out_norm_ptr(s, off);
+}
+
+static void tcg_wasm_out_exit_tb(TCGContext *s, uintptr_t arg)
+{
+    intptr_t ofs;
+
+    /* Store ctx.tb_ptr = 0 which indicates there is no next TB */
+    ofs = tcg_wasm_out_get_ctx(s, CTX_OFFSET(tb_ptr));
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0);
+    tcg_wasm_out_op_ldst(s, OPC_I64_STORE, 0, ofs);
+
+    /* Return the control to the caller */
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, arg);
+    tcg_wasm_out_op(s, OPC_RETURN);
+}
+
+static void tcg_wasm_out_goto(TCGContext *s, TCGReg target, int block_depth)
+{
+    intptr_t ofs;
+
+    /* Check if the target TB is the same as the current TB */
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(target));
+    ofs = tcg_wasm_out_get_ctx(s, CTX_OFFSET(tb_ptr));
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, ofs);
+    tcg_wasm_out_op(s, OPC_I64_EQ);
+
+    /*
+     * If the target TB is the same as the current TB, no need to return to the
+     * caller. Just branch to the top of the current TB.
+     */
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, BLOCK_IDX);
+    tcg_wasm_out_op_idx(s, OPC_BR, block_depth); /* br to the top of loop */
+    tcg_wasm_out_op(s, OPC_END);
+
+    /* Store the target TB to ctx.tb_ptr and return */
+    ofs = tcg_wasm_out_get_ctx(s, CTX_OFFSET(tb_ptr));
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(target));
+    tcg_wasm_out_op_ldst(s, OPC_I64_STORE, 0, ofs);
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0);
+    tcg_wasm_out_op(s, OPC_RETURN);
+}
+
+static void tcg_wasm_out_goto_ptr(TCGContext *s, TCGReg arg)
+{
+    tcg_wasm_out_goto(s, arg, 2);
+}
+
+static void tcg_wasm_out_goto_tb(
+    TCGContext *s, int which, uintptr_t cur_reset_ptr)
+{
+    intptr_t ofs;
+
+    /* Set the target TB in the tmp variable. */
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, get_jmp_target_addr(s, which));
+    ofs = tcg_wasm_out_norm_ptr(s, 0);
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, ofs);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(TCG_REG_TMP));
+
+    /* Goto the target TB if it's registered. */
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(TCG_REG_TMP));
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, cur_reset_ptr);
+    tcg_wasm_out_op(s, OPC_I64_NE);
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+    tcg_wasm_out_goto(s, TCG_REG_TMP, 3);
+    tcg_wasm_out_op(s, OPC_END);
+}
+
 static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
 {
     tcg_insn_unit_tci insn = 0;
@@ -760,6 +841,35 @@ static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
     tcg_out32(s, insn);
 }
 
+static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
+{
+    tcg_insn_unit_tci insn = 0;
+    intptr_t diff;
+
+    /* Special case for exit_tb: map null -> 0. */
+    if (p0 == NULL) {
+        diff = 0;
+    } else {
+        diff = p0 - (void *)(s->code_ptr + 4);
+        tcg_debug_assert(diff != 0);
+        if (diff != sextract32(diff, 0, 20)) {
+            tcg_raise_tb_overflow(s);
+        }
+    }
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 12, 20, diff);
+    tcg_out32(s, insn);
+}
+
+static void tcg_out_op_r(TCGContext *s, TCGOpcode op, TCGReg r0)
+{
+    tcg_insn_unit_tci insn = 0;
+
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    tcg_out32(s, insn);
+}
+
 static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
 {
     tcg_insn_unit_tci insn = 0;
@@ -1468,6 +1578,32 @@ static void tcg_out_br(TCGContext *s, TCGLabel *l)
     tcg_wasm_out_br(s, l);
 }
 
+static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
+{
+    tcg_out_op_p(s, INDEX_op_exit_tb, (void *)arg);
+    tcg_wasm_out_exit_tb(s, arg);
+}
+
+static void tcg_out_goto_tb(TCGContext *s, int which)
+{
+    /* indirect jump method. */
+    tcg_out_op_p(s, INDEX_op_goto_tb, (void *)get_jmp_target_addr(s, which));
+    set_jmp_reset_offset(s, which);
+    tcg_wasm_out_goto_tb(s, which, (intptr_t)s->code_ptr);
+}
+
+static void tcg_out_goto_ptr(TCGContext *s, TCGReg a0)
+{
+    tcg_out_op_r(s, INDEX_op_goto_ptr, a0);
+    tcg_wasm_out_goto_ptr(s, a0);
+}
+
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    /* Always indirect, nothing to do */
+}
+
 static void tcg_out_tb_start(TCGContext *s)
 {
     init_sub_buf();
-- 
2.43.0


