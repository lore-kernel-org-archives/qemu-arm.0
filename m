Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA1C88E5B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:20:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGt5-0004qB-QU; Mon, 26 Jan 2026 02:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGeF-0002k3-7M
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:05 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGe8-00044f-V1
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:04:27 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-823075fed75so2179041b3a.1
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411061; x=1770015861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiBLBmuJrU9Jg04Dyfz191OWwD91URVjxfllKljJsDk=;
 b=Wdm9ASPCae7FvJSrkCKvAD+xiQnw9mvMphcPKZQAOh9hoiol4ElgsZnhwbQEhQOuAs
 CIqLi4ZVSvr3ebFwePhjSLnim80v4LpmG0W1oD64/EhJXWVV084DQn13SNdkqK4gd4Yv
 fT3i7/lRNAPVru6FNYsaK1izIoej86lA+dB8rtDUEG8MdP/kYRKFOQNAI0vKJRNCDXxi
 QlAyQqBncu6rtvu47XUj7U0vnH/rbrdre6j2x2hApigWIxwfiFvBvbIP150gLUKZhdii
 xByBxc9C6s+dN/8ZdTu64FkVwclIIDLyBMQoSB+46pC5TPAMGZX9LpUROhQHqMuTvEd6
 577w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411061; x=1770015861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QiBLBmuJrU9Jg04Dyfz191OWwD91URVjxfllKljJsDk=;
 b=fHZME8s3rCAlmje6XnTbnVu9ZHq2n6iQW/PGupiv5iS/AAkG9V+cqutFyJtmGlUMEk
 lN1pLbPu4FaCQ0wv4BOQAVu+x2yp6ZEQnEdz7wFHf4lnGEqTQtV0KLYaC8FEbW+LEZ+5
 9t6ht4LM/xdDWpMNRdfEiKMEgOFPqjxhz7yLWU8QruMxkC3z6oF2tsnYZ1WMuKnhp+Px
 X4dgMytuOd+K/BgesbVvKtn7JBOSh8XHek7lo+gqcpVzK52ZiVz7deOMY8BGe84NZ9CK
 0RSdpjinjegLIqd9QEQJQbUdWJIs4kCWc8XEadRGBL4/hRRCYUMXhd8Kc5+lDHfPDCNM
 w62Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuGUHErvW9/E5G6fAU4WJ4Yl5jAsLcJfYcoCp3DhqfPsObNP6qW92CM2xFNMxp9jnT7OgOlv9F9A==@nongnu.org
X-Gm-Message-State: AOJu0Yw3JI/CIQlh2C9ClYn1WqcoVg+6Mh7XUvlFJi06bh524eD221U5
 DoXa3c93FF6IR3aocHyy36D7Qu7mOFw2H6RsDsVEBvppt0QSmvJbTQ1c
X-Gm-Gg: AZuq6aIZzxtZNH+T8HNn0zwhM5nWEYwnJHk1MNWDuLsw6gPahXEnrKRIaO0BqLZ85qR
 0GhevyD++8M6W452lOxE3gKhz9dIfubOhfzMrAb+zwFAhVL6pzETo28zPNG8NoZ8xF2rVa1C3JO
 whC8Q8uM5Uag0zcfSDRg1UF7cG10Tse/0i4nvjb8hIigwmUukhZeWqTyJnZ8A5Jw0VQlvm6TsoL
 JOj3T8d8mAht7HeuqrA/OfYUBmVMP9ecWCKKaheyxu/BeaE2XxsWLM7hvbpuvxMJuR4TcHJD6Ix
 Q+S/krqIQRVWwHQtRh5PVdF7vtl9ycPkyHEXN3gkjN1+CcOdeYWvq2DdvMoi47V3S+7blMwE1Sj
 uqNGarwcVjbzvN/DZx8NCY2q30uW6KYo6VA5Y2cpEllE3LkOU5NEsVqTqJy4/roEar2jmo1RvnJ
 XnhnunTae4WnFbuJd717+xxORaJjVxix8RbmiZ+zyu6g==
X-Received: by 2002:a05:6a00:22cf:b0:822:6834:9abc with SMTP id
 d2e1a72fcca58-8234129c3c4mr2979648b3a.24.1769411061316; 
 Sun, 25 Jan 2026 23:04:21 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:04:20 -0800 (PST)
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
Subject: [PATCH v4 03/33] tcg/wasm64: Add constraint definitions
Date: Mon, 26 Jan 2026 07:03:16 +0000
Message-ID: <e8e8ce20cf8ba879a690ad579d45fb26b5b6f517.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x436.google.com
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

The Wasm backend integrates a forked TCI so its constraints are defined to
remain compatible with TCI.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64/tcg-target-con-set.h | 19 +++++++++++++++++++
 tcg/wasm64/tcg-target-con-str.h | 14 ++++++++++++++
 tcg/wasm64/tcg-target.c.inc     | 13 +++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 tcg/wasm64/tcg-target-con-set.h
 create mode 100644 tcg/wasm64/tcg-target-con-str.h

diff --git a/tcg/wasm64/tcg-target-con-set.h b/tcg/wasm64/tcg-target-con-set.h
new file mode 100644
index 0000000000..0dc41ebe33
--- /dev/null
+++ b/tcg/wasm64/tcg-target-con-set.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Wasm target-specific constraint sets.
+ *
+ * Based on tci/tcg-target-con-set.h
+ *
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * C_On_Im(...) defines a constraint set with <n> outputs and <m> inputs.
+ * Each operand should be a sequence of constraint letters as defined by
+ * tcg-target-con-str.h; the constraint combination is inclusive or.
+ */
+C_O0_I1(r)
+C_O0_I2(r, r)
+C_O1_I1(r, r)
+C_O1_I2(r, r, r)
+C_O1_I4(r, r, r, r, r)
diff --git a/tcg/wasm64/tcg-target-con-str.h b/tcg/wasm64/tcg-target-con-str.h
new file mode 100644
index 0000000000..21ddbcc01a
--- /dev/null
+++ b/tcg/wasm64/tcg-target-con-str.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define Wasm target-specific operand constraints.
+ *
+ * Based on tci/tcg-target-con-str.h
+ *
+ * Copyright (c) 2021 Linaro
+ */
+
+/*
+ * Define constraint letters for register sets:
+ * REGS(letter, register_mask)
+ */
+REGS('r', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index 3affc17232..0b12c4ea03 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -75,3 +75,16 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     tcg_debug_assert(slot >= 0 && slot < 128 / TCG_TARGET_REG_BITS);
     return TCG_REG_R0 + slot;
 }
+
+static TCGConstraintSetIndex
+tcg_target_op_def(TCGOpcode op, TCGType type, unsigned flags)
+{
+    return C_NotImplemented;
+}
+
+/* Test if a constant matches the constraint. */
+static bool tcg_target_const_match(int64_t val, int ct,
+                                   TCGType type, TCGCond cond, int vece)
+{
+    return ct & TCG_CT_CONST;
+}
-- 
2.43.0


