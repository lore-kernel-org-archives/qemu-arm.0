Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CA5CAC5AC
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:44:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0r-0004i2-9y; Mon, 22 Sep 2025 05:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czY-0002QB-7a
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz6-0000ei-HU
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so1420802f8f.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533842; x=1759138642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kmav6an//5t3AYixPg5kMb65gCXejU84QEdCr46snK0=;
 b=tVSgAefPrxKrPFqVyNm0Ygwsr5K+x6rCpPwphEoNBdu1gt4FY1iEr5XuLXFixCYww5
 +N8hCNDrWaRWaQ+1XgGY600OH5+TiztS2Zp1wo2Ms6sL3uVfjjZ7bjnb/2qFis0SYcty
 wxLi3hZsYqHqBTeATiPjgoJz6PQmjNTrlqUOU8gDShuoDX9+h3bUNc6+25qmRdAULZeN
 OJPvMdt/NFb7iASIt0G3lEP4iiqolA28TbU2lr4XVod0Ti/fg24guWYl25F0hza3jrXj
 gNvSxWo5Ezs5BNx4Psjrk1x13yqgUeKL6VudUFYM7PgY96iEL5kwABBVqw4FkeWzczip
 47xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533842; x=1759138642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kmav6an//5t3AYixPg5kMb65gCXejU84QEdCr46snK0=;
 b=uufa/8oYv1htS1csRqpKrGwmHlWREl02G4fhmlRRej6TgBJWRv5zr04mTqzuRbjwya
 3xd0weyJ21PN0tiHgX1ZcgJtLnHePKY3zANOkliGBZveWKGXXUd6bEgPGc4IMCPI//YI
 0Kr3+lJFUKKBLi53zvfqvqjIznC2w8Uihvy1CVZMNKf0BJmNijV6AdJM0YGKOmeXXxPt
 Uyxt5Bk/r2jCo1hL21wfT3BUjHe1a0hN25KIzL9gGGPFSEP3lmtxUwyVMwTav2a3s5bN
 qE7kdYxhsvkdjGRGVm2Q0nnn+zbxofiv1yq/shAYXkF9Awom+mINX13X5Bda/6/JN9Zd
 LU0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8mSAllsSk/azrIZyqQuxKte5FPKvJkAxG7X9nIFGbbgmxf7fYbwWCbQ/29hshB2VrMU9klL/fGA==@nongnu.org
X-Gm-Message-State: AOJu0YyLs5f4UHBIU0Ho3+C2iFAcpLsO8p/LrlydfnlpPZXJ0afTbExR
 rvqmpYRM0hRGv0CMkwsBXS9Kx3oalRsvVd7FbtVCIueKkhJkZpMEbAkPfu9d03hYBiQ=
X-Gm-Gg: ASbGncvVAYX+I6vpiNmD5w0z01ytuf8uAQjPyEWQFaQ8uRrQlnjxbJYmdk4x5txtJOg
 RReb+UEj/6rL2xq3hvF+NsHQKNqVn84I3URROUORrwu/3qu9q22/KRD6Q5GPQjEi4tEINPrPc7H
 KiUQvwsClMdvxzd+JaiSedFNYcOa0Nfa9sa3LaO/yCGWDCBHwa4wpieugHt5eTVrpdsSj5zrwuI
 KTRwS9e0NDULda882mu3Wj0UF2Ws9UI838TDH+DJhWMl4ekqtqxpePPwUealSd6qHg55wCJlP9q
 MoAmV/gbQuGCfOpBOFLImRCMV6nXePf12GEhJ1T0HtSlrzPyl1yymPRopOaUaiqhJyM/dgyE3hY
 OURhWNGqYrQIkZ0ufNxnRpLU=
X-Google-Smtp-Source: AGHT+IE0mvUYSZigoWjc6qHUaYblt7fJ0hhAfjIqLVQUbFvAugta/Ux9kuFsoNExJ+cpo0Pi3lyZhQ==
X-Received: by 2002:a05:6000:2509:b0:3ec:1fff:3b25 with SMTP id
 ffacd0b85a97d-3ee7082057fmr9500958f8f.0.1758533841568; 
 Mon, 22 Sep 2025 02:37:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee073f4f3csm18495855f8f.2.2025.09.22.02.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B12F75FA12;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 12/25] semihosting/arm-compat-semi: replace target_ulong with
 vaddr
Date: Mon, 22 Sep 2025 10:36:57 +0100
Message-ID: <20250922093711.2768983-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-10-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 6725dcf4ba7..29cdab66f73 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -123,7 +123,7 @@ static GuestFD console_out_gf;
  */
 
 typedef struct LayoutInfo {
-    target_ulong rambase;
+    vaddr rambase;
     size_t ramsize;
     hwaddr heapbase;
     hwaddr heaplimit;
@@ -214,7 +214,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * global, and we assume that the guest takes care of avoiding any races.
  */
 #ifndef CONFIG_USER_ONLY
-static target_ulong syscall_err;
+static uint64_t syscall_err;
 
 #include "semihosting/uaccess.h"
 #endif
@@ -260,8 +260,8 @@ static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
 {
     /* Recover the original length from the third argument. */
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
-    target_ulong args = common_semi_arg(cs, 1);
-    target_ulong arg2;
+    uint64_t args = common_semi_arg(cs, 1);
+    uint64_t arg2;
     GET_ARG(2);
 
     if (err) {
@@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
  * is defined by GDB's remote protocol and is not target-specific.)
  * We put this on the guest's stack just below SP.
  */
-static target_ulong common_semi_flen_buf(CPUState *cs)
+static uint64_t common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp = common_semi_stack_bottom(cs);
+    vaddr sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
@@ -389,9 +389,9 @@ void semihosting_arm_compatible_init(void)
 void do_common_semihosting(CPUState *cs)
 {
     CPUArchState *env = cpu_env(cs);
-    target_ulong args;
-    target_ulong arg0, arg1, arg2, arg3;
-    target_ulong ul_ret;
+    uint64_t args;
+    uint64_t arg0, arg1, arg2, arg3;
+    uint64_t ul_ret;
     char * s;
     int nr;
     int64_t elapsed;
@@ -462,7 +462,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_WRITEC:
         /*
-         * FIXME: the byte to be written is in a target_ulong slot,
+         * FIXME: the byte to be written is in a uint64_t slot,
          * which means this is wrong for a big-endian guest.
          */
         semihost_sys_write_gf(cs, common_semi_dead_cb,
@@ -688,7 +688,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_HEAPINFO:
         {
-            target_ulong retvals[4];
+            uint64_t retvals[4];
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = get_task_state(cs);
-- 
2.47.3


