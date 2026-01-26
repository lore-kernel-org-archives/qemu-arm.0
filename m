Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ADBC88E5B
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:19:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGt4-0004o5-OC; Mon, 26 Jan 2026 02:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGf3-0002tW-Q4
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:42 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGev-0004Kr-Gp
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:18 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-823081bb15fso2134754b3a.3
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411110; x=1770015910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wyAR69Bcdaoiwt/QbVg4P4PwKbHvN8hOTaOTvBaaj0=;
 b=m/rktlBuYrMjqwiZ2xdutqSryeLsY2RCQVBWSfO9UtsZCu+CHl6+z+yrfKiO2RN6HN
 /2s9GXp+IzFzSe7pQhmnRPoj1Wb8SYnKRv6EOQ58kSiFG8Q1S/rfQqAAeMLkwfflrKS2
 aN4QCJB5BHUs+WkXyAOnzwIx5E7kj9r8zaqxjXO88pnG2pPWMWVIvgR3xi0qPyMGvTnP
 9+EnBnT3CSR4L4BQZO/eBcbSAzFMegGafHvD2ek0QRVKObGPQq3BHWd8bG+ddoBFkC05
 aMgsx6lNcAwVaHVtRjr1q6xpKB09DdboRr8i4WoABRdKa91mCujg7Rv5AkhpTKfo3SFq
 bnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411110; x=1770015910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4wyAR69Bcdaoiwt/QbVg4P4PwKbHvN8hOTaOTvBaaj0=;
 b=fFdzD9GrARHsm5jxL7+qM0rxqB5wO/wIwjGOcMr0iecBry3N7pqyTsGeRk+b87FcqC
 HanRPyM4d9xcsolj651K1rr99J37cBF/UU7TaL2uujzWB/rOgahN/EBxFrpgWSCymLiZ
 j93rvP0RwV4c7hQiBVOnqa9YxwFLmVLbVXXiuQPlUYHbshFaicoN/ubdSnBve7v+YDPR
 I7oHZS0eG8TGFGmZ+VfP2WUXGqDrMeT4ztjpP4DQH61sQq9JWUO4yLZQXWYmB/7ovQTX
 NWqd1jsAjYS4uYNeclfhj7+Wa8AuBvXzHByBevhVYnmX4gkNZ+yFH7TmcC8K1fg7vWMZ
 QeVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLsfuOzmX+P2twOc+8XR9O0BVbMHFPVbEGbr3VCyD20Rokz784r+iSi08Edfz68lgT9tFoW42RYA==@nongnu.org
X-Gm-Message-State: AOJu0Yz/jarKe8XYPs4J0UokHjKpYt9mg8f4oR6G9cQcFReQZw6yYrU0
 /+CAQLX05En0tYFKuCXQDhrZ35JJkML7gApsATCGnqt+wga+9d07A92/
X-Gm-Gg: AZuq6aLyjwpi42IWbT+X+TOwKyfQIx8ykeuKcjMBAPPqflNiBEe1gK/ysGotgU1CmB0
 /MGPfTXi6gp6HhzDbbw5YYdOnl1WD0PQTkQROb/B69jkeUN8vCLhSS402+srdafqT+59ODTRPOf
 CJWG3QJoc9/0s0WhNF5DKv1mixOFhMOXlOqofOo96O9SVjC9x+XhRbDeTOhgvcKIbXH8kAE49Kr
 iq5CNOMIlAd4OXq+iUxbS85tjqXCQHiXcJGq2S3Er6Lf+HjlyzjlxNukfc5EcT8c16yWHL+JtDz
 Jo3TfJPPtZ5ICzY5RiXz1ils7f92e2mOVQRr6up8arZcg7n0rC+Yj+R/ZgXC9rbFxxnm19SIF7S
 8zSdcHPObNIe5co1c75MFKMkhoRQkX3+He7yD2KQmRzrZ39LPkD6zITnbtXJp3PY0GRfZpfEiwW
 JX9ADpDQ/qRN3THFfXSQuVOM4yDxzSNND+0TYt97RH/u4DoVZH+ug5
X-Received: by 2002:a05:6a00:3cce:b0:823:1406:8797 with SMTP id
 d2e1a72fcca58-8234121c8cemr2920028b3a.31.1769411110265; 
 Sun, 25 Jan 2026 23:05:10 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:05:09 -0800 (PST)
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
Subject: [PATCH v4 14/33] tcg/wasm64: Add neg/ctpop instructions
Date: Mon, 26 Jan 2026 07:03:27 +0000
Message-ID: <5011a6543e5e20630673e27b681e6de31e9d28eb.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x42b.google.com
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

The neg/ctpop operations are implemented using the corresponding
instructions in Wasm. TCI instructions are also generated in the same way as
the original TCI backend.

The Wasm backend implements only TCG_TARGET_REG_BITS=64 so the ctpop
instruction is generated only for 64bit operations, as declared in
cset_ctpop. Therefore, this commit adds only the 64bit version of ctpop
implementation.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64.c                |  4 ++++
 tcg/wasm64/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/tcg/wasm64.c b/tcg/wasm64.c
index 8c8dcb81c7..a5e72d8fe5 100644
--- a/tcg/wasm64.c
+++ b/tcg/wasm64.c
@@ -359,6 +359,10 @@ static uintptr_t tcg_qemu_tb_exec_tci(CPUArchState *env, const void *v_tb_ptr)
             tci_args_rrr(insn, &r0, &r1, &r2);
             regs[r0] = (uint32_t)regs[r1] % (uint32_t)regs[r2];
             break;
+        case INDEX_op_ctpop:
+            tci_args_rr(insn, &r0, &r1);
+            regs[r0] = ctpop64(regs[r1]);
+            break;
         default:
             g_assert_not_reached();
         }
diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index d4db2528f8..8932330e3a 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -188,6 +188,7 @@ typedef enum {
     OPC_I32_SHR_S = 0x75,
     OPC_I32_SHR_U = 0x76,
 
+    OPC_I64_POPCNT = 0x7b,
     OPC_I64_ADD = 0x7c,
     OPC_I64_SUB = 0x7d,
     OPC_I64_MUL = 0x7e,
@@ -547,6 +548,21 @@ static void tcg_wasm_out_movi(TCGContext *s, TCGType type,
    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
 }
 
+static void tcg_wasm_out_neg(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg));
+    tcg_wasm_out_op(s, OPC_I64_SUB);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
+}
+
+static void tcg_wasm_out_ctpop64(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(arg));
+    tcg_wasm_out_op(s, OPC_I64_POPCNT);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(ret));
+}
+
 static void tcg_out_op_ri(TCGContext *s, TCGOpcode op, TCGReg r0, int32_t i1)
 {
     tcg_insn_unit_tci insn = 0;
@@ -1138,6 +1154,34 @@ static const TCGOutOpBinary outop_remu = {
     .out_rrr = tgen_remu,
 };
 
+static void tgen_neg(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
+{
+    tcg_out_op_rr(s, INDEX_op_neg, a0, a1);
+    tcg_wasm_out_neg(s, a0, a1);
+}
+
+static const TCGOutOpUnary outop_neg = {
+    .base.static_constraint = C_O1_I1(r, r),
+    .out_rr = tgen_neg,
+};
+
+static void tgen_ctpop(TCGContext *s, TCGType type, TCGReg a0, TCGReg a1)
+{
+    tcg_out_op_rr(s, INDEX_op_ctpop, a0, a1);
+    tcg_wasm_out_ctpop64(s, a0, a1);
+}
+
+static TCGConstraintSetIndex cset_ctpop(TCGType type, unsigned flags)
+{
+    return type == TCG_TYPE_REG ? C_O1_I1(r, r) : C_NotImplemented;
+}
+
+static const TCGOutOpUnary outop_ctpop = {
+    .base.static_constraint = C_Dynamic,
+    .base.dynamic_constraint = cset_ctpop,
+    .out_rr = tgen_ctpop,
+};
+
 static void tcg_out_tb_start(TCGContext *s)
 {
     init_sub_buf();
-- 
2.43.0


