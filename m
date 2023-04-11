Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp187390ejc;
        Mon, 10 Apr 2023 18:16:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z9+gCEXDOmTg3IuOWUc24nmekrip16BpzyrZr89hab6LNduSihWZsE4PpYbxWP2GtUOu7s
X-Received: by 2002:ac8:5c03:0:b0:3e6:3bec:112 with SMTP id i3-20020ac85c03000000b003e63bec0112mr1878458qti.5.1681175815961;
        Mon, 10 Apr 2023 18:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175815; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7H34GQ00O/Ycht0Yj5xlBDAEKWiBOxu0mjqk8sHrTrPMX9cmLuMvN/Gjow1k4uqJp
         7vtxxLm3NGgwFbYj5D461Knb24JFIzkeSBR/IVuXlI8IXJbZwqdI8HWr66AAb6I6KDFT
         vRZzi91YQ2sGg6T/lruMFFMVPMs7fhzR3ubUJDGKMLHcDvRZNHTZFV/joBBa1KR3VWwj
         93lE9g99htIEte5nKInOLXYjF4pY6PNfNsKcf8n6kPe05iWvY5WpRvzYrjjG7k2lnwcR
         ckbMupnLyj81bI+yveS4asWSuRDAvyRlmyuzG4STwrRvkZjBONkNLIIn1F+w/PzUw2oE
         Gz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z0TzkZkGwvP3W/rurD/DH/1BeGi6qkBSt5gUCUNt6eQ=;
        b=EQvIboAJHLPqqMlsHCbh9qboxXza5ivP8kXEMhtw3Z/68AelQt/HOuf44RMNEC7zFY
         Etur4I4SEq+7jJYRt/zOxi8+oy3hYQRH6FVXEbgIql2iWBauphapbJOCaewm21K3VUl5
         UT/CEv6ZH0xsl5RmoLSL3wk6K7oMBzfa5qdFXJh0BYR94M2MbPmCwM0ctJzepRpoGP2q
         +qfaVZAOSLKIG1iJs7CeeTCsZQYJbTcgooGiUwzlYMC1c6KPF0x0TBVRWDAZGh8j/cqb
         vpxF3h9yt6GRiUJxu59EmX9YZcjyLT7/6lGYsvkjKK5Uib9mCT1wKTcpJcnxwuFWYIdd
         AF1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKiHGhSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq39-20020a05620a46a700b00747a2434db8si8295086qkb.772.2023.04.10.18.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKiHGhSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Wd-0004pG-FB; Mon, 10 Apr 2023 21:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WS-0003mj-Le
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:15 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WO-0001uv-MK
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h24-20020a17090a9c1800b002404be7920aso6335464pjp.5
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0TzkZkGwvP3W/rurD/DH/1BeGi6qkBSt5gUCUNt6eQ=;
 b=oKiHGhSC7dxrG+CBlWAlNmSyZnIa6EpmvVNG2UNj1opIPi482fp59tFrYRldGR2Xqn
 /Jv/ONwcFzdK2XTWEGQqKtk/DoiMYWkfcN93wQTa0CcTO8T9jragvjI18k1iEjYgXc//
 RFtXdXfq+G8fNzUy5Z9itSMjvssEWq7cS/ozjBa5556fjZaNifQvnQ6AkMV7ds6SQExe
 SG1qII5CMlROXfYOz10JQ1EBKkJdGqtBImOtRWMk/Ja6TxSEJmAbu28unBehnV8vnhJk
 FZ1oBRYl6nLuKl7nAbPkzMdsDtCZ9rVijJ+JvFY4DzmaZq7tIwiwwKLpcbKHsU0y0oJs
 CKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0TzkZkGwvP3W/rurD/DH/1BeGi6qkBSt5gUCUNt6eQ=;
 b=FZAO/HUPkq/TJIOJcNbedUFYDqg6uAI3je+E1qh6V2p4maeKPdGlkqWCftcYjx1sqL
 rwnfYphQRFkz0HSQGa9HQ5utIke0UuT1MXv03x/341fBzaXEVxZgxV3hvU3cYGHQRiHY
 7DOw1XCT3nSElOJgBaL0l5A/mKOB6q3uxVjj0kaaFMyk/cM2dVm0FoUvxYYy4Yix4UAR
 Fs/bOH6ZAaXwH3z2sJoomhdQVCF01Gk9nX+7M5aGyDNAPU/VxKL/dWUV8B/uAGqi5diX
 naAwBEBDMaiqWg73rm5tk+DUmyxGnYymu+nvNrxgz0U3VSNbwC3GJR9hvRixCOXEYSgy
 0kFg==
X-Gm-Message-State: AAQBX9eKKF2sphpfoITfCn9IXUErLnkQzb4Dt4KWaaMKAdE85ydwalL/
 Rd0Ccowm/C3Uxo6vpJ5FlnAzow==
X-Received: by 2002:a17:90b:224b:b0:246:a5b5:eb26 with SMTP id
 hk11-20020a17090b224b00b00246a5b5eb26mr1463406pjb.41.1681175407174; 
 Mon, 10 Apr 2023 18:10:07 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 43/54] tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:05:01 -0700
Message-Id: <20230411010512.5375-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: mhdCf6SE2m7j

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d4134bc86f..425ea8902e 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -994,14 +994,14 @@ static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
     label->label_ptr[0] = label_ptr[0];
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
@@ -1009,13 +1009,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1023,14 +1019,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
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
@@ -1038,13 +1027,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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

