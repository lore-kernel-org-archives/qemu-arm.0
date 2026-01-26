Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F259FC88E59
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:15:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGmc-00068K-KX; Mon, 26 Jan 2026 02:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGeH-0002kK-Oz
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:05 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGeB-00044N-WC
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:04:32 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-8231061d234so3419989b3a.1
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411057; x=1770015857; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FW3Xgb6O5qaPdMbHJGW4nylfvciL9bC4hS3dP0yYtQ=;
 b=Z45nBW7SuEg2aHYl8HU56leVOpybdQef32/aB0XpkWqJMNKEL3vU+LoU3oIclhkX2M
 RanX1Guj75U/absj0FnG9ST0j9hmcQTqYiWsh4fH3bilvSnZRiC7zbpP2YiFQj+i8qdZ
 BuzHsJejQCXQe0C7kZrp7F7HLjCIL8EXsDW4SzNow9uDiX5BknKXI8HTr4uf5toNjr1S
 7bqa+hwxpvTw1odOn3rvPZ7TlXxI54H959SheonBvUWWtPDEF1MuyxpCQbUdoVUl6Ubp
 vMNrLZVmijOS/xouJXGOv1Op7H7tgI5zq7vXEOCJdhVSVWmSUcXHy/MpQ4G7MrKNmVYt
 AOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411057; x=1770015857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8FW3Xgb6O5qaPdMbHJGW4nylfvciL9bC4hS3dP0yYtQ=;
 b=JWl5pB+rmR166yjjnzY/lTsU/gisk/Ep/c2JKkw/TtIcAfj3vToJxrSBW5Qq1HThJw
 pgQ2islNASANGZ644E810ISPfH7J4hZv0b08PaYs9rXffpWuXV0mnyQu4UN7JGewXbJO
 VfFzBCk3tSDbMLEsu1q+pRLVdmpxwu/dnr53hzrZHrwZ49AeoS5BtvPrtZIi4H4fJgKu
 utLUKu0mNIOW0H4H+hxBeV7YPKWG01nktgODmHa6K8uX2b3YpgleLqZz3OZplBTuG0J8
 qmbEUlwpc+TsBz7B2bmCFPXr9u4fwM9ZGKXl2UtkMm1S42xWKCPaEJ4au4RSATt28xbK
 TGfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvEhu45tbTwYEhAl8/US5L6QoVREktbeWqNC92b/DyvcY38oJyG6Uplray8cwd7+6nP4gq1e5Ljw==@nongnu.org
X-Gm-Message-State: AOJu0YzBpzxUZ8oUU/ZQftF1YvkUakf+OWOtiVwSNtQIK+6F4GDrOWRi
 jwmKqXH3BrUc5wM8CGk8pNMDd5+hLBA6PcDA/zll2/q4CDs92H4sbM+N
X-Gm-Gg: AZuq6aKCV9gYO9pGo0vFon1bHkhCnDNjKLze6zYbevCouPhOFrChJyKgj1IyYAST9n6
 obWKynQsOlE+II6EsKhOcZ3KzEtXVWxwUVKgtdyxQLAwPgqhpDoi5vi+TV+KClCN0bShYEGQvnl
 nfg1e5nZNr+yCOgc5Doqs6y/J5JWTVh1tY8D0GyfrA17oIMY2NF9gTkfPm38aLO28GwgWhSJ1pn
 rwjcd0FRpuHf9xEMdezJhbcqPnWDcizZhqY3VmkFFNwkVGTp1MGg230ArNQgQTiQ9amxcG5FooW
 lX8DwQe43ymcZcgBLpi3nsH8s/SBFf6EBlJNltRum4uGQwTFdv0urFKKI2YhbIpOJehdafzriPx
 j8DPKlxToaSGRjBNbFwtFkSXiRGK+hf3iF73TBybytCaAtK/GjXSHNnQpC5pAaagwUeA9/Oo0FY
 5qj4zmfMKEYvQjA/UvQsUDeONO5Z+s7vytHjckbChWRxNK/7RLQqxV
X-Received: by 2002:a05:6a00:3e11:b0:81f:3f88:89ee with SMTP id
 d2e1a72fcca58-823411b83c6mr3738378b3a.12.1769411056966; 
 Sun, 25 Jan 2026 23:04:16 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:04:16 -0800 (PST)
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
Subject: [PATCH v4 02/33] tcg/wasm64: Add register-related definitions
Date: Mon, 26 Jan 2026 07:03:15 +0000
Message-ID: <8cccaa9366173c874e08d909184bd1c1214a83aa.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x433.google.com
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

This commit adds the register allocation definitions and register names to
the Wasm backend. As in TCI, call arguments are stored on the stack buffer
and the return value is placed in the registers R0 and R1 when needed.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64/tcg-target.c.inc | 77 +++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 tcg/wasm64/tcg-target.c.inc

diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
new file mode 100644
index 0000000000..3affc17232
--- /dev/null
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2009, 2011 Stefan Weil
+ *
+ * Based on tci/tcg-target.c.inc
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+static const int tcg_target_reg_alloc_order[] = {
+    TCG_REG_R2,
+    TCG_REG_R3,
+    TCG_REG_R4,
+    TCG_REG_R5,
+    TCG_REG_R6,
+    TCG_REG_R7,
+    TCG_REG_R8,
+    TCG_REG_R9,
+    TCG_REG_R10,
+    TCG_REG_R11,
+    TCG_REG_R12,
+    TCG_REG_R13,
+    TCG_REG_R14,
+    TCG_REG_R15,
+    /* 2 of these are call clobbered, so use them last. */
+    TCG_REG_R1,
+    TCG_REG_R0,
+};
+
+#ifdef CONFIG_DEBUG_TCG
+static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
+    "r00",
+    "r01",
+    "r02",
+    "r03",
+    "r04",
+    "r05",
+    "r06",
+    "r07",
+    "r08",
+    "r09",
+    "r10",
+    "r11",
+    "r12",
+    "r13",
+    "r14",
+    "r15",
+};
+#endif
+
+/* No call arguments via registers.  All will be stored on the "stack". */
+static const int tcg_target_call_iarg_regs[] = { };
+
+static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
+{
+    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
+    tcg_debug_assert(slot >= 0 && slot < 128 / TCG_TARGET_REG_BITS);
+    return TCG_REG_R0 + slot;
+}
-- 
2.43.0


