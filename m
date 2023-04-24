Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2599519ejm;
        Sun, 23 Apr 2023 22:51:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bqtZBBUYnEfgZHvzlkbcLGyrjkSRO/hQISyUSp0yMLw2wFIvBxjdEzlSUDq7zSDhqyKGED
X-Received: by 2002:a05:622a:190d:b0:3f0:a3ef:5bfc with SMTP id w13-20020a05622a190d00b003f0a3ef5bfcmr1293253qtc.29.1682315478449;
        Sun, 23 Apr 2023 22:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315478; cv=none;
        d=google.com; s=arc-20160816;
        b=GI96wO9zUzAtnFPdSCloCj/vvcdi+vp7R+0UVERDjwgmr0tkMtZ2wLTSlndrAP4XCY
         oBTN4DWNKFBYdJhjMTauS0oiBGhgtKjy5PVasKu44abSv+xPytMmJciFcj0cxh3WECjZ
         2TRoR+b3ohldMpPHJdptu3U98z7sDQPtuLaLfHZ6eX9jW7bLu/A8JAtCjlhEmmZpbWsG
         eF9yM/QbenYEZ+m2VViCNQ5cSCCqmYhWHbAIUVZAGBAfRceNjeCzbeed7BkSUP5IT65R
         kdp8Ql1td9Zuma+NkdogfpSLHJxQNMguBfxxrc3Tis3Z6EmaPmIR5hrc912E9+aFQz6/
         uuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QhG/YblVw95Lhxb+Zi1tBoEAbDtFZFxW4Ta81aHHVFo=;
        b=rnAN3gJKlUvZAdeCqn0XiOYlLzVEooB+Ftkc+OMt7wiZXbU3J8vuTTLTbFIuw9/YA4
         BC362fsp3vy7hj+NTpqJwrCKBhP0pHAEIzNAZeUPHqzfFwXfUv4wZm8hDYfHbX73nIdP
         26ZVfo8z3nUHX7c5uLxXnvDMI0y8UYJ6uF5knwlUzJUVd1g0i0RGbCYfDbgz4b4+yuWj
         lOAqriJiEThOPe+5fYLUJo2OEKACwc+nvVs2fgB30cl2fD9oTRQfKeAvWkY3ZrrJtZWe
         oCiHCuX1uEppV5i94f2PGJWMle+ZLvrkh+VqiLtfhSmfGsPXdqc045DNAHjX0tJmY4zE
         IhPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGx+Nh5g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020ac87f55000000b003e37fa49987si456847qtk.254.2023.04.23.22.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGx+Nh5g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp4a-0005o4-TK; Mon, 24 Apr 2023 01:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0g-0006J4-O2
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0H-0005Io-U8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso2305178f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315073; x=1684907073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhG/YblVw95Lhxb+Zi1tBoEAbDtFZFxW4Ta81aHHVFo=;
 b=eGx+Nh5gFKiD+sdKX2F0VcnOEFCQ/HBpaMYQUbAHLvIXwv4G7m6DVhRO5Z2lWIGWYP
 G9GsdmDYet602ukiacSzVVWS1iyZPhm+EIDh2LDhDXlaSs+IYbGQ1ZFOfkf8Vlff3ebY
 6xVczSB+6Z5vCYXA45Oev6g1Yh+UqPI4SH4KSgYEdp507ChBAa47a7h9KdDkTtFIw4it
 vdrS6o9takR6a6FbeFFtHV2UprHgFPARA5yPUsDbz4YsJkGpmubx374tDXMVvlbBwNSZ
 49vHuRlm4c5/KQfcm6/BpFLtHaUjXbgTV0tNABbw/m+kHTEfysrTBVb0l2/uNwb1oI56
 gIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315073; x=1684907073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhG/YblVw95Lhxb+Zi1tBoEAbDtFZFxW4Ta81aHHVFo=;
 b=X17rQIKa5hacLST9yekIn8B0g3lhf2kyvap5etSzTKlIxu41scZNXhEAzuzUgO3duD
 cQb1VnPHDorXijAdrabNymyqrwMcS9TVBACK4db2bp2y+QG7nsFJBG+ENcqjwXuWlxYe
 UM59PQKsYMZ9Ddm2yXSC7n5dpl7gvrV8bIhBi9jeXkizohW+bew0T6aosKaNLMd0Y6Ws
 jy89t6dN1Q4z9eDTxywaTNJtcD/5Ct4eogrzo62UMrr0WpUTEyn4h4DEMpY9//o3ZcCq
 v/ll+oUJC7BW6GYv6JMxn3BFqzM9RExEATtbD6RafrXzQ4NiQ2LUXmkXi9E1FAEy16GL
 0vFg==
X-Gm-Message-State: AAQBX9d5tYei4rPxS3ejGJbL8+vqRdPQFFelY/bdVQEmej4MaLgy3SZ7
 sRFdi7NhwAGUHZrXzm+WskiPdWmRzDv2ozteUllRaA==
X-Received: by 2002:a5d:4f05:0:b0:2ef:baa1:f3fc with SMTP id
 c5-20020a5d4f05000000b002efbaa1f3fcmr7977418wru.19.1682315073355; 
 Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 46/57] tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 24 Apr 2023 06:40:54 +0100
Message-Id: <20230424054105.1579315-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c4nK0jDg4Vx4

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index b0ed39beff..4c8e38599b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -920,14 +920,14 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
+/* We have three temps, we might as well expose them. */
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 3, .tmp = { TCG_REG_TMP0, TCG_REG_TMP1, TCG_REG_TMP2 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    TCGReg a0 = tcg_target_call_iarg_regs[0];
-    TCGReg a1 = tcg_target_call_iarg_regs[1];
-    TCGReg a2 = tcg_target_call_iarg_regs[2];
-    TCGReg a3 = tcg_target_call_iarg_regs[3];
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -935,13 +935,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
-
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
-    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
+    tcg_out_ld_helper_ret(s, l, true, &ldst_helper_param);
 
     tcg_out_goto(s, l->raddr);
     return true;
@@ -949,14 +945,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
-    TCGReg a0 = tcg_target_call_iarg_regs[0];
-    TCGReg a1 = tcg_target_call_iarg_regs[1];
-    TCGReg a2 = tcg_target_call_iarg_regs[2];
-    TCGReg a3 = tcg_target_call_iarg_regs[3];
-    TCGReg a4 = tcg_target_call_iarg_regs[4];
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_sbimm12(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -964,13 +953,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     }
 
     /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
-    tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, a2,
-                   l->type, s_bits, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
-
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
 
     tcg_out_goto(s, l->raddr);
-- 
2.34.1

