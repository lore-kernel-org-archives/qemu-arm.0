Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57762C88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:33:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGt7-0004tx-ED; Mon, 26 Jan 2026 02:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfT-0002yA-9Y
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:58 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGez-000493-3q
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:22 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-81df6a302b1so3741732b3a.2
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411101; x=1770015901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4YcIv62PuJ+rNK7vCkPRmKZd5P+oXUEOIgAG8NgaOBE=;
 b=AOAx87vQwxG3F65N5aYEwbKLJe5Jjkjrf+TzaLhUXDIjdQvj0dTb9O2kcqBjZ2Tt7N
 LPmWNXQn677XHOYjfPrY/FZtaZrkjJ3v89yiIfr54v86hxtrloYoltOowfLWdn+fh4ZB
 p/NY8vz+b39tyRg8MYUQeZObgunCYm646dC1a3B85Cl6mNzyTqqnyuwQ8ltvkyBonKV2
 9ZnUOva65QOSOGcNRavOjXzshmRdbuDSVxmqTzHoN/VuVQiZoYSWxYmkEtYUd31qC3Az
 zhcrawGlTp2yjaBk6R3zNWx+JvEJmhqSYq7Gd1t8D0rkfeDzrCKV68Tm+vHNQmKtAhwM
 86KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411101; x=1770015901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4YcIv62PuJ+rNK7vCkPRmKZd5P+oXUEOIgAG8NgaOBE=;
 b=Glu8QYxQGCAL2cwTzfI5jEOm4GhAFifrRG5iu6X3rBtET5TYFLMN17iUXLspY++TCO
 EiaRkTcE5rXl+UG5MQxEJOtmy13aT9En5gaUJtYwXhzMq4FPHcYDBmaWcbsMQkILXM/A
 +eFGsyQvLbKJiVS2LxR2bMTBsEbgFXDzQqfYTF1aNZAHDDB5iymMmfycg+XQ8i6i+CSp
 cEwzcF5ve/ef8RwxDbDDSKeq0QKjIOExVcQKnvTN+ZYx9sDzoLJzwGyTx6TE2OFsvUFh
 ucOKeIKJm/T+P0ZpSca4FOczour4Tq9xRcJfjpMmF/2i+ngloryi8MnTjGMXMz/cNG5x
 UH/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjT3PZ8HwkI8ZZVKd3CqLizdcgzTPsIn6hxJI3adBpvm2hhEInz+W1hNxrlXZGnDbigfDYE/KVWQ==@nongnu.org
X-Gm-Message-State: AOJu0YzJUo3NW2yekEVJDFDYWpw1ixPooOHwzMeQJmYn/z01UobHGjyv
 NGP+QcWgekUjgWM1U5IPlHO0IQ5dZcyCszcZ5IyE5iud2pHh2HWGqYrU
X-Gm-Gg: AZuq6aLIzoL7hIkj/nsF6pgNNHgS7GnpvjyNne6oz2uhefEm45VSAtR1kX6m0bmX9G7
 TFLQwWFfuDKMxfhyfso05m4HLlCRHt020J/7AMtWmCmKRhM7Ek3B6aU7yfV0PBPRkZxcff6tfuq
 UWFGqscnHgk4pct0qpXSvE79Nx1dp6PymWGfXYk0Fb5YDhIF29fUZJ8r6epPdJJK3gVenjN+IWF
 1m56X2m4jazbAGXokPC8QoPYVKC/CeVMXTbjzNlYZFAPhQj5gEZ9z67qZjxaN0pGzNBH2UZOyh4
 HwGvNYSxVdorCIWMtfJeZzrKGO6NldlfPcfD2zLAUN2lczwdTB5PZkKUesFYNgbGP26LS67ZcFV
 JxeYshNtn8FdllLSxVqk/wXhT3CDCUkXqPbl5DC7wq3emGwW0ko7ZM2Ji6Gj2y4JQJsJ9oLvcGC
 ZGlktDipa3az/UOaikg3hmYVo/tM7iu7fKz7Q4CtyxnQ==
X-Received: by 2002:a05:6a21:6010:b0:350:7238:7e2b with SMTP id
 adf61e73a8af0-38e9f0f5ae1mr3253988637.16.1769411101165; 
 Sun, 25 Jan 2026 23:05:01 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:05:00 -0800 (PST)
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
Subject: [PATCH v4 12/33] tcg/wasm64: Add ext instructions
Date: Mon, 26 Jan 2026 07:03:25 +0000
Message-ID: <8e5d0a2fc176b1f0a11e92bef8c3d6e80ce76268.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x430.google.com
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

The ext operations are implemented using the corresponding instructions in
Wasm. TCI instructions are also generated in the same way as the original
TCI backend.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64/tcg-target-has.h |  1 +
 tcg/wasm64/tcg-target.c.inc | 79 +++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/tcg/wasm64/tcg-target-has.h b/tcg/wasm64/tcg-target-has.h
index cfb85388de..a29ceb2ea5 100644
--- a/tcg/wasm64/tcg-target-has.h
+++ b/tcg/wasm64/tcg-target-has.h
@@ -3,6 +3,7 @@
 #define TCG_TARGET_HAS_H
 
 #define TCG_TARGET_HAS_tst 0
+#define TCG_TARGET_HAS_extr_i64_i32 0
 
 #define TCG_TARGET_extract_valid(type, ofs, len) 0
 #define TCG_TARGET_sextract_valid(type, ofs, len) \
diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index f308cc68f2..4131595fce 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -434,6 +434,22 @@ static void tcg_wasm_out_sextract(TCGContext *s, TCGReg dest, TCGReg arg1,
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(dest));
 }
 
+static void tcg_wasm_out_extract(TCGContext *s, TCGReg dest, TCGReg arg1,
+                                 int pos, int len)
+{
+    int64_t mask = ~0ULL >> (64 - len);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg1));
+    if (pos > 0) {
+        tcg_wasm_out_op_const(s, OPC_I64_CONST, pos);
+        tcg_wasm_out_op(s, OPC_I64_SHR_U);
+    }
+    if ((pos + len) < 64) {
+        tcg_wasm_out_op_const(s, OPC_I64_CONST, mask);
+        tcg_wasm_out_op(s, OPC_I64_AND);
+    }
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(dest));
+}
+
 /*
  * The size of the offset field of Wasm's load/store instruction differs
  * depending on the "-sMEMORY64" flag value: 64bit when "-sMEMORY64=1"
@@ -991,6 +1007,69 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    tcg_out_sextract(s, type, rd, rs, 0, 8);
+    tcg_wasm_out_sextract(s, rd, rs, 0, 8);
+}
+
+static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_op_rrbb(s, INDEX_op_extract, rd, rs, 0, 8);
+    tcg_wasm_out_extract(s, rd, rs, 0, 8);
+}
+
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    tcg_out_sextract(s, type, rd, rs, 0, 16);
+    tcg_wasm_out_sextract(s, rd, rs, 0, 16);
+}
+
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_op_rrbb(s, INDEX_op_extract, rd, rs, 0, 16);
+    tcg_wasm_out_extract(s, rd, rs, 0, 16);
+}
+
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_sextract(s, TCG_TYPE_I64, rd, rs, 0, 32);
+    tcg_wasm_out_sextract(s, rd, rs, 0, 32);
+}
+
+static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_op_rrbb(s, INDEX_op_extract, rd, rs, 0, 32);
+    tcg_wasm_out_extract(s, rd, rs, 0, 32);
+}
+
+static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32s(s, rd, rs);
+}
+
+static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_ext32u(s, rd, rs);
+}
+
+static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_op_rr(s, INDEX_op_mov, rd, rs);
+    tcg_wasm_out_extract(s, rd, rs, 0, 32);
+}
+
+static void tgen_extrh_i64_i32(TCGContext *s, TCGType t, TCGReg a0, TCGReg a1)
+{
+    tcg_out_op_rrbb(s, INDEX_op_extract, a0, a1, 32, 32);
+    tcg_wasm_out_extract(s, a0, a1, 32, 32);
+}
+
+static const TCGOutOpUnary outop_extrh_i64_i32 = {
+    .base.static_constraint = C_O1_I1(r, r),
+    .out_rr = tgen_extrh_i64_i32,
+};
+
 static void tcg_out_tb_start(TCGContext *s)
 {
     init_sub_buf();
-- 
2.43.0


