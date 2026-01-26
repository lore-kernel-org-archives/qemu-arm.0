Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E270C88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:31:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGwG-0000KD-4M; Mon, 26 Jan 2026 02:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgE-0003KP-8h
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:37 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGg4-0004h7-5W
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:29 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-8230d228372so1749237b3a.1
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411178; x=1770015978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RU7WmALXZc85DAN4jRhE1kjsBrYxH2shv0NiJQVureY=;
 b=JJpOPm2tFff0KpKjv3r2nB0Cuq9JCohD1Y1Q7ufT7ZH+zQyrwkrb2ElBwroA+6afYb
 Qn3dqpRKjUrWxsxkL4sDQXKhFqGOIl7FLj/cqYUDcHsKnphvUJcB85lHjHDZPH8btXsH
 qnSImOZZCTKvTDoA6yHnr9sG7ky7wohBhpJ5q9G5HOeUXgpwulgjTrQhfZYCze8Ql5zp
 topc1OuU7TEH5gJ2MF7jt228HJQsKl1AHr22wuBH6gTRFOsUOl3EJJUEjaDlkbvYlbHk
 GULj1KZdiY5r0DCXQIcU5LgIwhdRxH3jKOc2zrUZ9Wnx3WT9rcXvOYyoDs21tcZqW7Qc
 BIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411178; x=1770015978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RU7WmALXZc85DAN4jRhE1kjsBrYxH2shv0NiJQVureY=;
 b=KK24ZguUEnebA2i/W/YDVcRPYZUw3I79aEg5IDiKJLm0vzPkjsJdU0DQOsBJHCvuHr
 1O4GFGBKHuG2nHAVxxhsHFEL5oSKDaqb5XrCBr/1umtG8YEMJ0h9VgfKQ1H5rnLOJeoX
 UaytZcoZT8oIVjVNpKeEZaNA4BLCwc1uBde8mfEu9gI00Yfjie1GfMePtyQeKAnxnQFR
 O6k/yV4Rsbf59aU/KZexLjZTPWVnbKfshMd5Q+NV3Pz7zTaGMH1+h3p59SXO9KOfY1z/
 cy/siJ9/+c+h2MzhI3YnAN01Hjnys95Bx+I0yigxzEO2Aof8mGjd+5WaofcJ2HzoXus1
 SxqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhKxNmVt6cpVbnx78OE8QUepUF3Om6IDk/OpFtv/WlitGs2/jGNuNMg2Y++SAXphqsjSMXUsQDEQ==@nongnu.org
X-Gm-Message-State: AOJu0YzF9invTHvohC9NH6R/KuZBcJH4WjyZ519vBAp8dzWQcKaFJsYX
 inItakq9dtQy1xsVuZXqGToeO9hmskv3pWt87NvrD85V9yiItP96KbuF
X-Gm-Gg: AZuq6aLC3Z5TBBGeNhZ4SGt474ReuhcXN+n2wuOeD608gzC27eK2/x94aCMnGX2SbgB
 1ScPkkamEZ7BqGUCmBGL5V74xA4ewEbIaaxW+auhrXpNC2uFYLcSczBcdF5/xj0bJ1NaVRIP7yK
 niO2NYlxlDKBICTmmug+/+Z2Lq5EazjPL6Q+VwWoRckrmdHQmqo1Frwg5azlG1NCzDm2tlYeZsO
 0R6RxXuzZuc4F4xHyzLLkxtXpARukbNL843PmfP41ZHdeUmveZSCPvkJJFHr8H1FlPoQb4lNx0a
 cnnM4/S/0pbkpe3mZZkVCVhOTSZcpN33YSnyqtRHtXyJ723w3+Ql7OTnz+ymc+fsW8uPlZPh++b
 v0eTAWYguNQ2LI1DVTfeEwbUN9qpQ9WtwDUDVvXy/GICOGTA42hmDPWZwHFFsmUmnbkO8Bkc05G
 b0m9n8xwBfeF0urOB8EV7yRETdJCtyL3PTy77L1v0ZbQ==
X-Received: by 2002:a05:6a00:2316:b0:81f:9aa4:1e70 with SMTP id
 d2e1a72fcca58-8234131dce2mr2974527b3a.70.1769411177763; 
 Sun, 25 Jan 2026 23:06:17 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:06:17 -0800 (PST)
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
Subject: [PATCH v4 29/33] meson.build: enable to build Wasm backend
Date: Mon, 26 Jan 2026 07:03:42 +0000
Message-ID: <9b4d7d51d8a255277937142e2b731538e0371e19.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Enable to use tcg/wasm64 as the TCG backend for the WebAssembly (wasm64)
build.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 include/accel/tcg/getpc.h |  2 +-
 include/tcg/helper-info.h |  4 ++--
 include/tcg/tcg.h         |  2 +-
 meson.build               |  4 ----
 tcg/meson.build           |  5 +++++
 tcg/region.c              | 10 +++++-----
 tcg/tcg.c                 | 14 +++++++-------
 7 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/accel/tcg/getpc.h b/include/accel/tcg/getpc.h
index 0fc08addcf..3901655715 100644
--- a/include/accel/tcg/getpc.h
+++ b/include/accel/tcg/getpc.h
@@ -9,7 +9,7 @@
 #define ACCEL_TCG_GETPC_H
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
-#ifdef CONFIG_TCG_INTERPRETER
+#if defined(CONFIG_TCG_INTERPRETER) || defined(EMSCRIPTEN)
 extern __thread uintptr_t tci_tb_ptr;
 # define GETPC() tci_tb_ptr
 #else
diff --git a/include/tcg/helper-info.h b/include/tcg/helper-info.h
index d5bda83a2e..a586b90470 100644
--- a/include/tcg/helper-info.h
+++ b/include/tcg/helper-info.h
@@ -9,7 +9,7 @@
 #ifndef TCG_HELPER_INFO_H
 #define TCG_HELPER_INFO_H
 
-#ifdef CONFIG_TCG_INTERPRETER
+#if defined(CONFIG_TCG_INTERPRETER) || defined(EMSCRIPTEN)
 /*
  * MacOSX 15 uses an old version of libffi which contains
  *   #if FFI_GO_CLOSURES
@@ -60,7 +60,7 @@ struct TCGHelperInfo {
     const char *name;
 
     /* Used with g_once_init_enter. */
-#ifdef CONFIG_TCG_INTERPRETER
+#if defined(CONFIG_TCG_INTERPRETER) || defined(EMSCRIPTEN)
     ffi_cif *cif;
 #else
     uintptr_t init;
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 60942ce05c..9937b997ac 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -940,7 +940,7 @@ static inline size_t tcg_current_code_size(TCGContext *s)
 #define TB_EXIT_IDXMAX    1
 #define TB_EXIT_REQUESTED 3
 
-#ifdef CONFIG_TCG_INTERPRETER
+#if defined(CONFIG_TCG_INTERPRETER) || defined(EMSCRIPTEN)
 uintptr_t tcg_qemu_tb_exec(CPUArchState *env, const void *tb_ptr);
 #else
 typedef uintptr_t tcg_prologue_fn(CPUArchState *env, const void *tb_ptr);
diff --git a/meson.build b/meson.build
index 7a81ff58be..82d9c94f4a 100644
--- a/meson.build
+++ b/meson.build
@@ -891,10 +891,6 @@ if have_tcg
     if not get_option('tcg_interpreter')
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
-  elif host_arch == 'wasm64'
-    if not get_option('tcg_interpreter')
-      error('WebAssembly host requires --enable-tcg-interpreter')
-    endif
   elif get_option('tcg_interpreter')
     warning('Use of the TCG interpreter is not recommended on this host')
     warning('architecture. There is a native TCG execution backend available')
diff --git a/tcg/meson.build b/tcg/meson.build
index 706a6eb260..b67d857957 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -20,6 +20,11 @@ if get_option('tcg_interpreter')
                       method: 'pkg-config')
   tcg_ss.add(libffi)
   tcg_ss.add(files('tci.c'))
+elif host_os == 'emscripten'
+  libffi = dependency('libffi', version: '>=3.0', required: true,
+                      method: 'pkg-config')
+  specific_ss.add(libffi)
+  specific_ss.add(files('wasm64.c'))
 endif
 
 tcg_ss.add(when: libdw, if_true: files('debuginfo.c'))
diff --git a/tcg/region.c b/tcg/region.c
index 5d4be1453b..6adf876d87 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -94,7 +94,7 @@ bool in_code_gen_buffer(const void *p)
     return (size_t)(p - region.start_aligned) <= region.total_size;
 }
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
 static int host_prot_read_exec(void)
 {
 #if defined(CONFIG_LINUX) && defined(HOST_AARCH64) && defined(PROT_BTI)
@@ -557,7 +557,7 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
     return prot;
 }
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
 #ifdef CONFIG_POSIX
 #include "qemu/memfd.h"
 
@@ -655,11 +655,11 @@ static int alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
     return PROT_READ | PROT_WRITE;
 }
 #endif /* CONFIG_DARWIN */
-#endif /* CONFIG_TCG_INTERPRETER */
+#endif /* !CONFIG_TCG_INTERPRETER && !EMSCRIPTEN */
 
 static int alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 {
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
 # ifdef CONFIG_DARWIN
     return alloc_code_gen_buffer_splitwx_vmremap(size, errp);
 # endif
@@ -801,7 +801,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_threads)
      * Work with the page protections set up with the initial mapping.
      */
     need_prot = PROT_READ | PROT_WRITE;
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
     if (tcg_splitwx_diff == 0) {
         need_prot |= host_prot_read_exec();
     }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3c68699138..b5690c7c5b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -252,7 +252,7 @@ TCGv_env tcg_env;
 const void *tcg_code_gen_epilogue;
 uintptr_t tcg_splitwx_diff;
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
 tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
@@ -1415,7 +1415,7 @@ static TCGHelperInfo info_helper_st128_mmu = {
               | dh_typemask(ptr, 5)  /* uintptr_t ra */
 };
 
-#ifdef CONFIG_TCG_INTERPRETER
+#if defined(CONFIG_TCG_INTERPRETER) || defined(EMSCRIPTEN)
 static ffi_type *typecode_to_ffi(int argmask)
 {
     /*
@@ -1492,7 +1492,7 @@ static ffi_cif *init_ffi_layout(TCGHelperInfo *info)
 #else
 #define HELPER_INFO_INIT(I)      (&(I)->init)
 #define HELPER_INFO_INIT_VAL(I)  1
-#endif /* CONFIG_TCG_INTERPRETER */
+#endif /* CONFIG_TCG_INTERPRETER || EMSCRIPTEN */
 
 static inline bool arg_slot_reg_p(unsigned arg_slot)
 {
@@ -1860,7 +1860,7 @@ void tcg_prologue_init(void)
     s->code_buf = s->code_gen_ptr;
     s->data_gen_ptr = NULL;
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
     tcg_qemu_tb_exec = (tcg_prologue_fn *)tcg_splitwx_to_rx(s->code_ptr);
 #endif
 
@@ -1879,7 +1879,7 @@ void tcg_prologue_init(void)
     prologue_size = tcg_current_code_size(s);
     perf_report_prologue(s->code_gen_ptr, prologue_size);
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
     flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
                         (uintptr_t)s->code_buf, prologue_size);
 #endif
@@ -1916,7 +1916,7 @@ void tcg_prologue_init(void)
         }
     }
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
     /*
      * Assert that goto_ptr is implemented completely, setting an epilogue.
      * For tci, we use NULL as the signal to return from the interpreter,
@@ -6754,7 +6754,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
         return i;
     }
 
-#ifndef CONFIG_TCG_INTERPRETER
+#if !defined(CONFIG_TCG_INTERPRETER) && !defined(EMSCRIPTEN)
     /* flush instruction cache */
     flush_idcache_range((uintptr_t)tcg_splitwx_to_rx(s->code_buf),
                         (uintptr_t)s->code_buf,
-- 
2.43.0


