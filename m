Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B70BC88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGtA-000517-DM; Mon, 26 Jan 2026 02:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGff-00032U-NY
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:12 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfW-00048r-1T
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:54 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82318b640beso1386801b3a.0
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411097; x=1770015897; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xLnjwS0H8xJ5zGA0L6/eddBTubde3eAT1NVQlZwuDi8=;
 b=II1bCHKCZQrsTr9T76FujldLyteVnlwmblxLXEDc811WOsysnbX43kYGr8+15fswxG
 /2I0czXOkdO+dY4C/DFGVnAQw2AIbLsIXFp9/HEGOlctWko4EUaXXhK86Fq6TKBE7set
 K12P7n+Y0JCEmTOBubV4TNzDMDU/6IWv6wZPfbO3gIUGMfhIy1pZYkJBt44YxtQ3Wuvb
 +qhzPvf5+hvtUAJ330NVL2XQf5GmbC9wKCy6UQKzGd4bNvI11Q1wYrUcr5bLSwjzjB+9
 7iw8RrbX7yTwUn8TRrE/LdLt/FDXdLNCAJP3lTvHhr5/cVK+K4N2ZJ5IyPIZX3sPR9iD
 tOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411097; x=1770015897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xLnjwS0H8xJ5zGA0L6/eddBTubde3eAT1NVQlZwuDi8=;
 b=tJfZeStPYfMn1ZKCca/oSLMkxGYxh9rcaGT2YMRHNsOaB2aiydiMjLwWNac3awxl84
 a3Fix2isQ8PFALJl4Si7/bRlv8Tq/tT12kiQSLO8DTBBUVuqX4ujOpfesck5YYNuuE3S
 JDgDD+z0NKANrn4s43h8gPxAT/jvwxQVEaQJCF7ICwyZqNGHKiy3lja8p8J3jQB22e6D
 X6ArrbOduN431Bc3i+L7l+JgXo77ka+00a3KNxfZdM2s+Fg1K9qYke+4a54eD7bfbwzu
 H4HWgLlMwOU0hChDxE7MtAK2JrlFUPYeq1JJkGLh0eO3/9YMwhnKKhCn+BqEGYDnUpM6
 Ygeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUCWGAZiP0zGrTcE1/qYSHs2FL5sTtkF0HRLZXLiIQhme4YpmJAWqAqxYy1dcUjoHAEZdKW3Md7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz60y0LLWbOEqazf36wrCAVIXG/CWMe4xEL7dQ7DtzACt8dYT/S
 dy8yORun1CR0Pq9xptLDSGbILBKozxeoGiWjDQW4XduKgMw9UsVhgUdn
X-Gm-Gg: AZuq6aJgshYv1D3+Z/oataI+5/mqCrc9bDXK9LmdIldockzikH4uLMupFfYvDxvO2i1
 72ACg5WLvnfmNX+1+aazmAI/iXnSsEZ+fqndraYitYszDMo+ZjtQJENZ+az2OSHCpbDc62hF0MJ
 xflSovB3hXLEVgZ7wf4J6rDpKpQhaR0AxOVnQ6p9XanQKK8J3ILgypt9zs5WUSFhCs5pCf1i66l
 JDgFjauR3uRKAUkHdVyL5m1wHzia5V5Tiqdq3gGW8xszxXcVijLGsrZ/KkhSTedrcI2TTUypUG3
 YHFbPue4t3hfL279153MK8vuQV87rOmhvHoY0HOl4USVtdnLGnvQhvPAsYuUKKyq0G0xpbua09m
 CiYwMqtjfpcSBGZ1Gat9gyhJ50kKVvrUCZ0SX/hBxDiznfTReq8RueCOOmvfDGa9Koajf9Ryes1
 FMc5WP8YVFuf41RV4df2M1bdSVC3X6EfnKU4w7thq+ig==
X-Received: by 2002:a05:6a00:188f:b0:821:8ebc:2899 with SMTP id
 d2e1a72fcca58-823411dc3d6mr3174807b3a.7.1769411096762; 
 Sun, 25 Jan 2026 23:04:56 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:04:56 -0800 (PST)
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
Subject: [PATCH v4 11/33] tcg/wasm64: Add mov/movi instructions
Date: Mon, 26 Jan 2026 07:03:24 +0000
Message-ID: <8c72aab90a9c5839e91914ff545face4aa37f2d0.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x435.google.com
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

Theese operations are implemented using the corresponding instructions in
Wasm. TCI instructions are also generated in the same way as the original
TCI backend.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64.c                |  4 ++++
 tcg/wasm64/tcg-target.c.inc | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tcg/wasm64.c b/tcg/wasm64.c
index fa7413fc1d..2c8a7b814e 100644
--- a/tcg/wasm64.c
+++ b/tcg/wasm64.c
@@ -260,6 +260,10 @@ static uintptr_t tcg_qemu_tb_exec_tci(CPUArchState *env, const void *v_tb_ptr)
             tmp32 = tci_compare32(regs[r1], regs[r2], condition);
             regs[r0] = regs[tmp32 ? r3 : r4];
             break;
+        case INDEX_op_mov:
+            tci_args_rr(insn, &r0, &r1);
+            regs[r0] = regs[r1];
+            break;
         case INDEX_op_tci_movi:
             tci_args_ri(insn, &r0, &t1);
             regs[r0] = t1;
diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index 6b6d6402f4..f308cc68f2 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -501,6 +501,28 @@ static void tcg_wasm_out_st(
     tcg_wasm_out_op_ldst(s, opc, 0, offset);
 }
 
+static void tcg_wasm_out_mov(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg));
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
+}
+
+static void tcg_wasm_out_movi(TCGContext *s, TCGType type,
+                              TCGReg ret, tcg_target_long arg)
+{
+   switch (type) {
+   case TCG_TYPE_I32:
+       tcg_wasm_out_op_const(s, OPC_I64_CONST, (int32_t)arg);
+       break;
+   case TCG_TYPE_I64:
+       tcg_wasm_out_op_const(s, OPC_I64_CONST, arg);
+       break;
+   default:
+       g_assert_not_reached();
+   }
+   tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
+}
+
 static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
 {
     tcg_insn_unit_tci insn = 0;
@@ -798,6 +820,20 @@ static void tcg_tci_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
+{
+    tcg_out_op_rr(s, INDEX_op_mov, ret, arg);
+    tcg_wasm_out_mov(s, ret, arg);
+    return true;
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
+{
+    tcg_tci_out_movi(s, type, ret, arg);
+    tcg_wasm_out_movi(s, type, ret, arg);
+}
+
 static void stack_bounds_check(TCGReg base, intptr_t offset)
 {
     if (base == TCG_REG_CALL_STACK) {
-- 
2.43.0


