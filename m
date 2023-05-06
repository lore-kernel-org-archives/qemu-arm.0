Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884614ejq;
        Sat, 6 May 2023 00:25:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VIArRG8Ie9O4Fj/0SMgbmjzGZh8ze8qPfemgKeqC3M805WXegEMvLp5rO1zW/FmJFONUn
X-Received: by 2002:ac8:5987:0:b0:3f3:8773:6c52 with SMTP id e7-20020ac85987000000b003f387736c52mr80097qte.30.1683357954100;
        Sat, 06 May 2023 00:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357954; cv=none;
        d=google.com; s=arc-20160816;
        b=JUJeyUB3dP9SFBIyRyI1Ye9aFEioUo8gD849lhbvX8hOynQ/I/2GC5xfnuqpGHhpvg
         sqzRQz+bOFjuEMTTu0G2eCS4PLwxeD6mPkLCkLR9FmTw6gO507zmBYlif4cF+1IQVN+m
         vhvYtpzgCe46d1TW7VMtWTDuMLhyYcYyl+xOo+tEdh1SRrx4SSgNakn6dY0uW6SQT++z
         1d8IwV7pwdMDlskEKKZJVOstA/Jn9nkUtA6rIrwZxHAu3H3+Njg3mTH+GvshBCI4lJ4K
         WeUD0UCwYgojeUezVPwePgADASp93DuLJCX1rcMkKmLbAUQGVwAwRvTlSZMG1jqFDMmB
         r2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8inodTGUilDAhT6OBmWmJGZ3vieMgwqC5uJSdvFYggQ=;
        b=ylB1/8tkQgHPNxOAUE4jogYCK+UsUKrisOcbA0je1CHQbSswOUQO1DdMOj2En+LFRJ
         2o3GmxZiG14ZNhiOMY1FvY8EmMVbOSZ0IuvnB67pzYxYCvSLuWDARAU1vPw+R86WgwRN
         q0pkoILtCA5TjDVMvCwG3SIqmct2kbAOx7qh4kaJTR+lIRFOQMAVQwMbX1TjdUSq1gR6
         ikLX8K4oQgfuG4uf5OG9lOWtEu7xOFYyslu4p3zLXyEU1VnCicgmRlU2IFlB88NNjmy1
         7r0hO2xRXMcmZ5IP7gybTJvxmvdaV9kHB0paQFsEvCs2+JLbb0FwEA0LthOwOnhL68NI
         7WqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIpqUy5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a049200b003eadeb5429fsi1182199qtx.473.2023.05.06.00.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIpqUy5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCG8-0004hM-4g; Sat, 06 May 2023 03:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCG6-0004YZ-7q
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFo-0004Sc-AC
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so1658144f8f.2
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357771; x=1685949771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8inodTGUilDAhT6OBmWmJGZ3vieMgwqC5uJSdvFYggQ=;
 b=mIpqUy5ESK+cnzGBnByEF+zrbEq4AiX0bwxfBgdHOVN8z9EhahKHcDwNoidD4WOMAJ
 qGqzo2l1pbQV8gVE7a5fxIMlG/3xR/u++MndQBVEklVRw26YniFURqaSVA013I4eoGqA
 QE1LarIssaEfw47qUhEL98SQtyxFbOf/Uf6QDfrw3cRiJntsUjKdKNqoLT8hOROlSX8Y
 k6faQDE44VMivzHTscD1/klAwUrOIn7m4E5g5OeZAXk3Bp19IthEaHJuRsY6genBC7x3
 qclwaQsbzIqEhHSJUvibDpis1AzsbGtpZxVSdaZQVjcrBGQx6jiFKWlsbZrWXLq4+rCQ
 TuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357771; x=1685949771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8inodTGUilDAhT6OBmWmJGZ3vieMgwqC5uJSdvFYggQ=;
 b=g1bwQ1HrFShMg/WDwTcq9GrNNWdwJ87/tWci4RmH1Qb59PcSh+2HsQndOYcBcsye/V
 dqkgeK/8hm1SvsW+z29GRkdnpa9UIQpXil3v3Q/sRaLY2OmxPd1eFGwNmgqBPFeqMkr4
 bpTtpbOTrS5AhCJwTgjmxe+hjjveT6y8/Jq0tCXyRY2TJrNLad9Sftnn/08sDRpq/m8R
 AYGzhd/BhuJnM7Y+7SzUwc/vZs+CyIalGk9SaGJZY+Jcx3lH9H0QHTMou2hdCrEgWnXL
 UAaXOFiXZ3eEs3WxZ+D2WhNbOp3AMM1Znb4Wc7thws6DAPgSfKbRT7X7KQqpWz3x9XeW
 koog==
X-Gm-Message-State: AC+VfDz/zmAZ6mmIu045GsuhpM8a77pfYnySlINGKPPEjgzGokYJ4fCQ
 itjwfe5aZ2/v85g3B4LrL8TSqA==
X-Received: by 2002:a5d:6a8b:0:b0:304:6762:2490 with SMTP id
 s11-20020a5d6a8b000000b0030467622490mr2934795wru.3.1683357770910; 
 Sat, 06 May 2023 00:22:50 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 19/30] tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Sat,  6 May 2023 08:22:24 +0100
Message-Id: <20230506072235.597467-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4z9CDLeGIRO6

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c3157d22be..dfcf4d9e34 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1718,26 +1718,22 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 #if defined(CONFIG_SOFTMMU)
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
-    tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
@@ -1745,25 +1741,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_R4, lb->type, size, data_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
-- 
2.34.1

