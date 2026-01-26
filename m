Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E269C88E5B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGzK-0004bW-UQ; Mon, 26 Jan 2026 02:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfu-00035a-RO
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:21 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfp-0004Pe-6A
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2a09a3bd9c5so31294015ad.3
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411142; x=1770015942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90E4mxgxD+julKzw6BxH6qVTPgf7G7qUtJs5JfsrDkI=;
 b=kb97XZrcUvyXMa1bchEShcEdKayWMoYRO+B0dO0Md6hFpmI1cVoK7JVznK/Ta+pnBJ
 rnxilbbHcRP/71eBqoaMThMEleSvHGNknmavVsJnoamcCl/Q3d1xOOxWVJNAnLckzwi4
 JqSzIuSeq3seatYNyIItZJgEaOepyzql1ckJXFjsHkDJ22kVpnr6yATcvKcPo70EINT4
 z2UTvoVium+4ePsF7XKXEPqBv52JH4U2d3befUhyCXR2ChzCDEJr/b3zjP0DpJzPE13i
 CCI1bJ4N74hhFm24NUJWl6Z501bDYS8SfGu+S5xEwIuN5fgwgkvA1wySoRJiabgCYVWg
 gBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411142; x=1770015942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=90E4mxgxD+julKzw6BxH6qVTPgf7G7qUtJs5JfsrDkI=;
 b=bvaoVG3F8yQ20jQxyJD1vhbKXWHVyBXFiNYaoSJSgPxIETfFJOi9PM2gRzzcAkS8p8
 fiJiTTZTUvG0dQwbjT2/BvMXpKTTCsnOGU0j3HnHaXsXegP2btuRV66hztqEPu+zSeiT
 9AnNk2GZbYXN/diQ3P8c7fhBHVr0KQu8hssVocJg6n8MdGP3P/16awc4I/UqI5CrpG5l
 dBt6jvkvZRNsbItFUXXb6Qrkr8xSUJj6L189A0p0CpueL2206LWpzUV2DSHoVD4UGeJf
 c4bx9VLzsfO4sYX+O1XaO+5FtAl81UehNexxmEaZqMoJI+yEHDVw/hS4NXokezoOeCbc
 IUVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO+k2P5HKCyuzbiDwZdGT6KoWIuqg6ujyzRHyY6PxMdEUOvIgzJCPaY66GK69DJ7ssgEwNOP98TQ==@nongnu.org
X-Gm-Message-State: AOJu0YyxO3Toh/4/lJa1WcnKxhwNYLDSrO0rXrXdc2wZBGFbRt4Up/HF
 zBpuHtABhjCUHQ4YpvVGcTzXQiGn27Uca1K1Th5vP7HAKF0GLsF7uEmu
X-Gm-Gg: AZuq6aIkNpJ6mwgJJBtJq+cjtnDaA7/VP/PMdRyr2HH3O7HNU0hhNznzM3jf0cWK5/S
 Rl3GQ5lJpT0qmeEyJGg2q5pfWnw2JI3msogVYcB0cOi8fr4JqknLFaZeoG8kdhrUquwiXemZN20
 vXWMFQt5DDqEx0ZL3olZELQP+lqRZkwuuR8n7sSECuzF/gj0PWu7c5ewoc3Zbo0ZE9ShvszoAUk
 jsEwuLehmDJ2sBYx5kT+KvHHDNAVRWgnmeGV2JltpoodEiB9ADEnsGxGxjsxGICd5zufefNOj9G
 2XoqPDPqGUBplqnQ0cWdYVdXL0D/eOPdVdh7IO3WBflY4Oz/R3JDJQwOvOZVSqw67yWwXYgfXos
 U6uf04xRwpWGBP4gKYFQhtM3l4vjiiU0dOS02/ppulCIhdraSJD1m03gUms80ZeDVEG8bXZUJEd
 dwiVkOkUFvDIjL05BcBZ3wY3PyDT/bqQAG0AhT/i0GMQ==
X-Received: by 2002:a17:903:2c03:b0:2a3:1b33:ae11 with SMTP id
 d9443c01a7336-2a84533f4efmr29797365ad.53.1769411141736; 
 Sun, 25 Jan 2026 23:05:41 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:05:41 -0800 (PST)
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
Subject: [PATCH v4 21/33] tcg/wasm64: Mark unimplemented instructions
Date: Mon, 26 Jan 2026 07:03:34 +0000
Message-ID: <3a8c9ff06ad2a45f1abb375993dfed60272530e4.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pl1-x632.google.com
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

This commit adds the C_NotImplemented constraint and provides stubs for the
functions that aren't implemented in the Wasm backend.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64/tcg-target.c.inc | 119 ++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index d187dca970..bab69b00ca 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -1960,6 +1960,125 @@ static void tcg_out_mb(TCGContext *s, unsigned a0)
     tcg_wasm_out8(s, 0x00);
 }
 
+static const TCGOutOpDeposit outop_deposit = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpExtract outop_extract = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpExtract2 outop_extract2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_addco = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpAddSubCarry outop_addci = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_addcio = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpAddSubCarry outop_subbo = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpAddSubCarry outop_subbi = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpAddSubCarry outop_subbio = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpUnary outop_not = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_andc = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_eqv = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_nand = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_nor = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_orc = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpDivRem outop_divs2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpDivRem outop_divu2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpMul2 outop_muls2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_mulsh = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpMul2 outop_mulu2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBinary outop_muluh = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBswap outop_bswap16 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpBswap outop_bswap32 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpUnary outop_bswap64 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpQemuLdSt2 outop_qemu_ld2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static const TCGOutOpQemuLdSt2 outop_qemu_st2 = {
+    .base.static_constraint = C_NotImplemented,
+};
+
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
+{
+    return false;
+}
+
+static void tcg_out_set_borrow(TCGContext *s)
+{
+    g_assert_not_reached();
+}
+
+static void tcg_out_set_carry(TCGContext *s)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_tb_start(TCGContext *s)
 {
     init_sub_buf();
-- 
2.43.0


