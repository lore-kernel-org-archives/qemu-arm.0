Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp624430lfq;
        Wed, 13 Jan 2021 09:30:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjj45aFj8KD45HEr3FpKZlrW1jRdqZSKaJDbAuaeytgXy6BhymC10h+rkP7DaFALLzSyI2
X-Received: by 2002:a25:d309:: with SMTP id e9mr5028141ybf.121.1610559000991;
        Wed, 13 Jan 2021 09:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610559000; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm6ycy53/tHwNUGYmYMdOQLR2pVe2zqg4jGhgvI2HAyns6wEWl1n5eFxqlaCq/cXCd
         qpUMuUVPPsE0we+ClfLHdISCguLbexJPH8kgGbNX+DeOqqvp9qqv+8Sdq6kwPjdKSrIA
         8UilCLJkLnp2F7YXjYKSxEZxTrFOYaTnzXp7ihtOlK2BJr5gubg1fNNJyfayGQLh7jpH
         jaE/NZlLEF8Qe33Xrm99bV4eZY1j8hcJSgCkO+Ivz09AHfsC7xX0Blfu8R6kgNag47MZ
         9liJEVJgFApHW2x/W3+qcgtFr9LPqAwIPMiTVdJ4wKyPbuhYf3S2ukWp7bLdOHRI/1KT
         6y5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zq1vr3q6gndSZYUaWX6IMZKeocghiG32Kg2SuEHDROY=;
        b=JsAWZgoW9wLKlB12fJx2n3T6vfbMgYcXJMokpj4HeRk7+KbnUT1UWB9IDderRE2Nqt
         skfoCZXbamrE3UcUIZsKO5KyP9BHvM5hPz/v6t/kQ3jj95fAxnZ6wvpTvxVXtKK8do7M
         KK/ovrFdmfeoQ662767hN33zOVAzlR7xN/tc809IiQzgRLFKn572842Rop3pKJldv8Q5
         4x6rSc4tfZFpFk/DJ/msBNNorKB6FB1Mtlr9pl16NUtI6MJPeyua/OEmOrIBZpg61m5+
         oCgA9z8HLL5PlVYBNevypzCO3a7eca+BifnOza4xChj86WL1cec2Zppw9+lziW3f3M1d
         gnjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QbnLjn+k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si2598519ybe.341.2021.01.13.09.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 09:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QbnLjn+k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzjy4-0004Kd-Be
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 12:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtg-000091-VC; Wed, 13 Jan 2021 12:25:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzjtd-00064v-Vc; Wed, 13 Jan 2021 12:25:28 -0500
Received: by mail-wm1-x331.google.com with SMTP id y23so2337310wmi.1;
 Wed, 13 Jan 2021 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zq1vr3q6gndSZYUaWX6IMZKeocghiG32Kg2SuEHDROY=;
 b=QbnLjn+k8wPIgmq7eclVXhR7pKsm67tcS6AbdCJF3750mVlN+akp1RPOKfHTZmhOxO
 hueb4D4BnU93a3O75Hi+faT/CxNyALcKQd1JXlvbZSdiudiftbMyqBNux3YZWbg4wOZZ
 ZZPtfDV+qCOd2Io8hb29qqUkUtCGvtfxrgIoHpvBf4b5sEZ3YAxNomr8hnqv8Wt5CHsE
 Kl2W7vZmBHoAV1WVaCq9JVQ2CxNFA0aPujMnuKvPI2W47lgQr/j8QD/61zJ2Nzrqk2kP
 NHCbrdrwj2GBtapYj8iIpN3bhMY39wQUUyM5Us3krNZjucFEfr0M/3lAJ0CS7BOD1rq2
 cBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zq1vr3q6gndSZYUaWX6IMZKeocghiG32Kg2SuEHDROY=;
 b=nWe6X2S2P48FhVeWTBdYstzuJe3Ha+77RNhUe5o7JVGzzHeqL5BSi3l0PO2cOrercL
 7Os2gALvQ20FvgidzJWut64vQtWAtJlS2pJl4AWmaL0fGvrak0mRobRLRorn7D8mbcBX
 WDfbCbeC8veNJyRuSEy/OqRAU6bzvtxKKuIA7LB+VPs4B5FkGyltMgbDw6yZkuceptB9
 gqw+kRJOWiTz47sVeXcWNmAX6vccIkpc57qz3Xq7RznpJ6CI6iCXQVMmZHwTzqQLdLMy
 iEtmKYfv5ZHrBk000EvH73c5qdoH+2XUxkTiEIg9x+FWkw/d0DX9te0Kwi7+tqSg6HJF
 nTIA==
X-Gm-Message-State: AOAM5337ZEcgWWx1qLNHNc/X1jVfbT601rT2dVuihslRXm68BLB06MeG
 OVDf5t8/jLvKivdDjCtaA+o8H/Ebnmo=
X-Received: by 2002:a1c:3d86:: with SMTP id k128mr296155wma.66.1610558722601; 
 Wed, 13 Jan 2021 09:25:22 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s19sm1013485wrf.72.2021.01.13.09.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 09:25:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] tcg/s390: Hoist common argument loads in tcg_out_op()
Date: Wed, 13 Jan 2021 18:24:57 +0100
Message-Id: <20210113172459.2481060-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113172459.2481060-1-f4bug@amsat.org>
References: <20210113172459.2481060-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-riscv@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EJvkKJ7JB+WI

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/s390/tcg-target.c.inc | 222 ++++++++++++++++++--------------------
 1 file changed, 107 insertions(+), 115 deletions(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index d7ef0790556..ec202e79cfc 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1732,15 +1732,22 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
         case glue(glue(INDEX_op_,x),_i64)
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg *args, const int *const_args)
+                              const TCGArg args[TCG_MAX_OP_ARGS],
+                              const int const_args[TCG_MAX_OP_ARGS])
 {
     S390Opcode op, op2;
-    TCGArg a0, a1, a2;
+    TCGArg a0, a1, a2, a4;
+    int c2;
+
+    a0 = args[0];
+    a1 = args[1];
+    a2 = args[2];
+    a4 = args[4];
+    c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_exit_tb:
         /* Reuse the zeroing that exists for goto_ptr.  */
-        a0 = args[0];
         if (a0 == 0) {
             tgen_gotoi(s, S390_CC_ALWAYS, tcg_code_gen_epilogue);
         } else {
@@ -1750,7 +1757,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        a0 = args[0];
         if (s->tb_jmp_insn_offset) {
             /*
              * branch displacement must be aligned for atomic patching;
@@ -1784,7 +1790,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_ptr:
-        a0 = args[0];
         if (USE_REG_TB) {
             tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
         }
@@ -1794,44 +1799,42 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     OP_32_64(ld8u):
         /* ??? LLC (RXY format) is only present with the extended-immediate
            facility, whereas LLGC is always present.  */
-        tcg_out_mem(s, 0, RXY_LLGC, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, 0, RXY_LLGC, a0, a1, TCG_REG_NONE, a2);
         break;
 
     OP_32_64(ld8s):
         /* ??? LB is no smaller than LGB, so no point to using it.  */
-        tcg_out_mem(s, 0, RXY_LGB, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, 0, RXY_LGB, a0, a1, TCG_REG_NONE, a2);
         break;
 
     OP_32_64(ld16u):
         /* ??? LLH (RXY format) is only present with the extended-immediate
            facility, whereas LLGH is always present.  */
-        tcg_out_mem(s, 0, RXY_LLGH, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, 0, RXY_LLGH, a0, a1, TCG_REG_NONE, a2);
         break;
 
     case INDEX_op_ld16s_i32:
-        tcg_out_mem(s, RX_LH, RXY_LHY, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, RX_LH, RXY_LHY, a0, a1, TCG_REG_NONE, a2);
         break;
 
     case INDEX_op_ld_i32:
-        tcg_out_ld(s, TCG_TYPE_I32, args[0], args[1], args[2]);
+        tcg_out_ld(s, TCG_TYPE_I32, a0, a1, a2);
         break;
 
     OP_32_64(st8):
-        tcg_out_mem(s, RX_STC, RXY_STCY, args[0], args[1],
-                    TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, RX_STC, RXY_STCY, a0, a1, TCG_REG_NONE, a2);
         break;
 
     OP_32_64(st16):
-        tcg_out_mem(s, RX_STH, RXY_STHY, args[0], args[1],
-                    TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, RX_STH, RXY_STHY, a0, a1, TCG_REG_NONE, a2);
         break;
 
     case INDEX_op_st_i32:
-        tcg_out_st(s, TCG_TYPE_I32, args[0], args[1], args[2]);
+        tcg_out_st(s, TCG_TYPE_I32, a0, a1, a2);
         break;
 
     case INDEX_op_add_i32:
-        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
+        a2 = (int32_t)args[2];
         if (const_args[2]) {
         do_addi_32:
             if (a0 == a1) {
@@ -1852,9 +1855,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_sub_i32:
-        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
+        a2 = (int32_t)args[2];
         if (const_args[2]) {
-            a2 = -a2;
+            a2 = -args[2];
             goto do_addi_32;
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, SR, a0, a2);
@@ -1864,7 +1867,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_and_i32:
-        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        a2 = (uint32_t)args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
             tgen_andi(s, TCG_TYPE_I32, a0, a2);
@@ -1875,7 +1878,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_or_i32:
-        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        a2 = (uint32_t)args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
             tgen_ori(s, TCG_TYPE_I32, a0, a2);
@@ -1886,45 +1889,45 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_xor_i32:
-        a0 = args[0], a1 = args[1], a2 = (uint32_t)args[2];
+        a2 = (uint32_t)args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
             tgen_xori(s, TCG_TYPE_I32, a0, a2);
         } else if (a0 == a1) {
-            tcg_out_insn(s, RR, XR, args[0], args[2]);
+            tcg_out_insn(s, RR, XR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, XRK, a0, a1, a2);
         }
         break;
 
     case INDEX_op_neg_i32:
-        tcg_out_insn(s, RR, LCR, args[0], args[1]);
+        tcg_out_insn(s, RR, LCR, a0, a1);
         break;
 
     case INDEX_op_mul_i32:
         if (const_args[2]) {
             if ((int32_t)args[2] == (int16_t)args[2]) {
-                tcg_out_insn(s, RI, MHI, args[0], args[2]);
+                tcg_out_insn(s, RI, MHI, a0, a2);
             } else {
-                tcg_out_insn(s, RIL, MSFI, args[0], args[2]);
+                tcg_out_insn(s, RIL, MSFI, a0, a2);
             }
         } else {
-            tcg_out_insn(s, RRE, MSR, args[0], args[2]);
+            tcg_out_insn(s, RRE, MSR, a0, a2);
         }
         break;
 
     case INDEX_op_div2_i32:
-        tcg_out_insn(s, RR, DR, TCG_REG_R2, args[4]);
+        tcg_out_insn(s, RR, DR, TCG_REG_R2, a4);
         break;
     case INDEX_op_divu2_i32:
-        tcg_out_insn(s, RRE, DLR, TCG_REG_R2, args[4]);
+        tcg_out_insn(s, RRE, DLR, TCG_REG_R2, a4);
         break;
 
     case INDEX_op_shl_i32:
         op = RS_SLL;
         op2 = RSY_SLLK;
     do_shift32:
-        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
+        a2 = (int32_t)args[2];
         if (a0 == a1) {
             if (const_args[2]) {
                 tcg_out_sh32(s, op, a0, TCG_REG_NONE, a2);
@@ -1952,110 +1955,107 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_rotl_i32:
         /* ??? Using tcg_out_sh64 here for the format; it is a 32-bit rol.  */
         if (const_args[2]) {
-            tcg_out_sh64(s, RSY_RLL, args[0], args[1], TCG_REG_NONE, args[2]);
+            tcg_out_sh64(s, RSY_RLL, a0, a1, TCG_REG_NONE, a2);
         } else {
-            tcg_out_sh64(s, RSY_RLL, args[0], args[1], args[2], 0);
+            tcg_out_sh64(s, RSY_RLL, a0, a1, a2, 0);
         }
         break;
     case INDEX_op_rotr_i32:
         if (const_args[2]) {
-            tcg_out_sh64(s, RSY_RLL, args[0], args[1],
-                         TCG_REG_NONE, (32 - args[2]) & 31);
+            tcg_out_sh64(s, RSY_RLL, a0, a1, TCG_REG_NONE, (32 - a2) & 31);
         } else {
-            tcg_out_insn(s, RR, LCR, TCG_TMP0, args[2]);
-            tcg_out_sh64(s, RSY_RLL, args[0], args[1], TCG_TMP0, 0);
+            tcg_out_insn(s, RR, LCR, TCG_TMP0, a2);
+            tcg_out_sh64(s, RSY_RLL, a0, a1, TCG_TMP0, 0);
         }
         break;
 
     case INDEX_op_ext8s_i32:
-        tgen_ext8s(s, TCG_TYPE_I32, args[0], args[1]);
+        tgen_ext8s(s, TCG_TYPE_I32, a0, a1);
         break;
     case INDEX_op_ext16s_i32:
-        tgen_ext16s(s, TCG_TYPE_I32, args[0], args[1]);
+        tgen_ext16s(s, TCG_TYPE_I32, a0, a1);
         break;
     case INDEX_op_ext8u_i32:
-        tgen_ext8u(s, TCG_TYPE_I32, args[0], args[1]);
+        tgen_ext8u(s, TCG_TYPE_I32, a0, a1);
         break;
     case INDEX_op_ext16u_i32:
-        tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
+        tgen_ext16u(s, TCG_TYPE_I32, a0, a1);
         break;
 
     OP_32_64(bswap16):
         /* The TCG bswap definition requires bits 0-47 already be zero.
            Thus we don't need the G-type insns to implement bswap16_i64.  */
-        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
-        tcg_out_sh32(s, RS_SRL, args[0], TCG_REG_NONE, 16);
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        tcg_out_sh32(s, RS_SRL, a0, TCG_REG_NONE, 16);
         break;
     OP_32_64(bswap32):
-        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
         break;
 
     case INDEX_op_add2_i32:
         if (const_args[4]) {
-            tcg_out_insn(s, RIL, ALFI, args[0], args[4]);
+            tcg_out_insn(s, RIL, ALFI, a0, a4);
         } else {
-            tcg_out_insn(s, RR, ALR, args[0], args[4]);
+            tcg_out_insn(s, RR, ALR, a0, a4);
         }
-        tcg_out_insn(s, RRE, ALCR, args[1], args[5]);
+        tcg_out_insn(s, RRE, ALCR, a1, args[5]);
         break;
     case INDEX_op_sub2_i32:
         if (const_args[4]) {
-            tcg_out_insn(s, RIL, SLFI, args[0], args[4]);
+            tcg_out_insn(s, RIL, SLFI, a0, a4);
         } else {
-            tcg_out_insn(s, RR, SLR, args[0], args[4]);
+            tcg_out_insn(s, RR, SLR, a0, a4);
         }
-        tcg_out_insn(s, RRE, SLBR, args[1], args[5]);
+        tcg_out_insn(s, RRE, SLBR, a1, args[5]);
         break;
 
     case INDEX_op_br:
-        tgen_branch(s, S390_CC_ALWAYS, arg_label(args[0]));
+        tgen_branch(s, S390_CC_ALWAYS, arg_label(a0));
         break;
 
     case INDEX_op_brcond_i32:
-        tgen_brcond(s, TCG_TYPE_I32, args[2], args[0],
-                    args[1], const_args[1], arg_label(args[3]));
+        tgen_brcond(s, TCG_TYPE_I32, a2, a0,
+                    a1, const_args[1], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i32:
-        tgen_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1],
-                     args[2], const_args[2]);
+        tgen_setcond(s, TCG_TYPE_I32, args[3], a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_movcond_i32:
-        tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+        tgen_movcond(s, TCG_TYPE_I32, args[5], a0, a1,
+                     a2, const_args[2], args[3], const_args[3]);
         break;
 
     case INDEX_op_qemu_ld_i32:
         /* ??? Technically we can use a non-extending instruction.  */
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args[0], args[1], args[2]);
+        tcg_out_qemu_ld(s, a0, a1, a2);
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args[0], args[1], args[2]);
+        tcg_out_qemu_st(s, a0, a1, a2);
         break;
 
     case INDEX_op_ld16s_i64:
-        tcg_out_mem(s, 0, RXY_LGH, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, 0, RXY_LGH, a0, a1, TCG_REG_NONE, a2);
         break;
     case INDEX_op_ld32u_i64:
-        tcg_out_mem(s, 0, RXY_LLGF, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, 0, RXY_LLGF, a0, a1, TCG_REG_NONE, a2);
         break;
     case INDEX_op_ld32s_i64:
-        tcg_out_mem(s, 0, RXY_LGF, args[0], args[1], TCG_REG_NONE, args[2]);
+        tcg_out_mem(s, 0, RXY_LGF, a0, a1, TCG_REG_NONE, a2);
         break;
     case INDEX_op_ld_i64:
-        tcg_out_ld(s, TCG_TYPE_I64, args[0], args[1], args[2]);
+        tcg_out_ld(s, TCG_TYPE_I64, a0, a1, a2);
         break;
 
     case INDEX_op_st32_i64:
-        tcg_out_st(s, TCG_TYPE_I32, args[0], args[1], args[2]);
+        tcg_out_st(s, TCG_TYPE_I32, a0, a1, a2);
         break;
     case INDEX_op_st_i64:
-        tcg_out_st(s, TCG_TYPE_I64, args[0], args[1], args[2]);
+        tcg_out_st(s, TCG_TYPE_I64, a0, a1, a2);
         break;
 
     case INDEX_op_add_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
         do_addi_64:
             if (a0 == a1) {
@@ -2084,7 +2084,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_sub_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             a2 = -a2;
             goto do_addi_64;
@@ -2096,18 +2095,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_and_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
-            tgen_andi(s, TCG_TYPE_I64, args[0], args[2]);
+            tgen_andi(s, TCG_TYPE_I64, a0, a2);
         } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, NGR, args[0], args[2]);
+            tcg_out_insn(s, RRE, NGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_ori(s, TCG_TYPE_I64, a0, a2);
@@ -2118,7 +2115,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
     case INDEX_op_xor_i64:
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_xori(s, TCG_TYPE_I64, a0, a2);
@@ -2130,21 +2126,21 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_neg_i64:
-        tcg_out_insn(s, RRE, LCGR, args[0], args[1]);
+        tcg_out_insn(s, RRE, LCGR, a0, a1);
         break;
     case INDEX_op_bswap64_i64:
-        tcg_out_insn(s, RRE, LRVGR, args[0], args[1]);
+        tcg_out_insn(s, RRE, LRVGR, a0, a1);
         break;
 
     case INDEX_op_mul_i64:
         if (const_args[2]) {
-            if (args[2] == (int16_t)args[2]) {
-                tcg_out_insn(s, RI, MGHI, args[0], args[2]);
+            if (a2 == (int16_t)args[2]) {
+                tcg_out_insn(s, RI, MGHI, a0, a2);
             } else {
-                tcg_out_insn(s, RIL, MSGFI, args[0], args[2]);
+                tcg_out_insn(s, RIL, MSGFI, a0, a2);
             }
         } else {
-            tcg_out_insn(s, RRE, MSGR, args[0], args[2]);
+            tcg_out_insn(s, RRE, MSGR, a0, a2);
         }
         break;
 
@@ -2153,10 +2149,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
            into R3 with this definition, but as we do in fact always
            produce both quotient and remainder using INDEX_op_div_i64
            instead requires jumping through even more hoops.  */
-        tcg_out_insn(s, RRE, DSGR, TCG_REG_R2, args[4]);
+        tcg_out_insn(s, RRE, DSGR, TCG_REG_R2, a4);
         break;
     case INDEX_op_divu2_i64:
-        tcg_out_insn(s, RRE, DLGR, TCG_REG_R2, args[4]);
+        tcg_out_insn(s, RRE, DLGR, TCG_REG_R2, a4);
         break;
     case INDEX_op_mulu2_i64:
         tcg_out_insn(s, RRE, MLGR, TCG_REG_R2, args[3]);
@@ -2166,9 +2162,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         op = RSY_SLLG;
     do_shift64:
         if (const_args[2]) {
-            tcg_out_sh64(s, op, args[0], args[1], TCG_REG_NONE, args[2]);
+            tcg_out_sh64(s, op, a0, a1, TCG_REG_NONE, a2);
         } else {
-            tcg_out_sh64(s, op, args[0], args[1], args[2], 0);
+            tcg_out_sh64(s, op, a0, a1, a2, 0);
         }
         break;
     case INDEX_op_shr_i64:
@@ -2180,87 +2176,83 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_rotl_i64:
         if (const_args[2]) {
-            tcg_out_sh64(s, RSY_RLLG, args[0], args[1],
-                         TCG_REG_NONE, args[2]);
+            tcg_out_sh64(s, RSY_RLLG, a0, a1, TCG_REG_NONE, a2);
         } else {
-            tcg_out_sh64(s, RSY_RLLG, args[0], args[1], args[2], 0);
+            tcg_out_sh64(s, RSY_RLLG, a0, a1, a2, 0);
         }
         break;
     case INDEX_op_rotr_i64:
         if (const_args[2]) {
-            tcg_out_sh64(s, RSY_RLLG, args[0], args[1],
-                         TCG_REG_NONE, (64 - args[2]) & 63);
+            tcg_out_sh64(s, RSY_RLLG, a0, a1, TCG_REG_NONE, (64 - a2) & 63);
         } else {
             /* We can use the smaller 32-bit negate because only the
                low 6 bits are examined for the rotate.  */
-            tcg_out_insn(s, RR, LCR, TCG_TMP0, args[2]);
-            tcg_out_sh64(s, RSY_RLLG, args[0], args[1], TCG_TMP0, 0);
+            tcg_out_insn(s, RR, LCR, TCG_TMP0, a2);
+            tcg_out_sh64(s, RSY_RLLG, a0, a1, TCG_TMP0, 0);
         }
         break;
 
     case INDEX_op_ext8s_i64:
-        tgen_ext8s(s, TCG_TYPE_I64, args[0], args[1]);
+        tgen_ext8s(s, TCG_TYPE_I64, a0, a1);
         break;
     case INDEX_op_ext16s_i64:
-        tgen_ext16s(s, TCG_TYPE_I64, args[0], args[1]);
+        tgen_ext16s(s, TCG_TYPE_I64, a0, a1);
         break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
-        tgen_ext32s(s, args[0], args[1]);
+        tgen_ext32s(s, a0, a1);
         break;
     case INDEX_op_ext8u_i64:
-        tgen_ext8u(s, TCG_TYPE_I64, args[0], args[1]);
+        tgen_ext8u(s, TCG_TYPE_I64, a0, a1);
         break;
     case INDEX_op_ext16u_i64:
-        tgen_ext16u(s, TCG_TYPE_I64, args[0], args[1]);
+        tgen_ext16u(s, TCG_TYPE_I64, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
-        tgen_ext32u(s, args[0], args[1]);
+        tgen_ext32u(s, a0, a1);
         break;
 
     case INDEX_op_add2_i64:
         if (const_args[4]) {
-            if ((int64_t)args[4] >= 0) {
-                tcg_out_insn(s, RIL, ALGFI, args[0], args[4]);
+            if ((int64_t)a4 >= 0) {
+                tcg_out_insn(s, RIL, ALGFI, a0, a4);
             } else {
-                tcg_out_insn(s, RIL, SLGFI, args[0], -args[4]);
+                tcg_out_insn(s, RIL, SLGFI, a0, -a4);
             }
         } else {
-            tcg_out_insn(s, RRE, ALGR, args[0], args[4]);
+            tcg_out_insn(s, RRE, ALGR, a0, a4);
         }
-        tcg_out_insn(s, RRE, ALCGR, args[1], args[5]);
+        tcg_out_insn(s, RRE, ALCGR, a1, args[5]);
         break;
     case INDEX_op_sub2_i64:
         if (const_args[4]) {
-            if ((int64_t)args[4] >= 0) {
-                tcg_out_insn(s, RIL, SLGFI, args[0], args[4]);
+            if ((int64_t)a4 >= 0) {
+                tcg_out_insn(s, RIL, SLGFI, a0, a4);
             } else {
-                tcg_out_insn(s, RIL, ALGFI, args[0], -args[4]);
+                tcg_out_insn(s, RIL, ALGFI, a0, -a4);
             }
         } else {
-            tcg_out_insn(s, RRE, SLGR, args[0], args[4]);
+            tcg_out_insn(s, RRE, SLGR, a0, a4);
         }
-        tcg_out_insn(s, RRE, SLBGR, args[1], args[5]);
+        tcg_out_insn(s, RRE, SLBGR, a1, args[5]);
         break;
 
     case INDEX_op_brcond_i64:
-        tgen_brcond(s, TCG_TYPE_I64, args[2], args[0],
-                    args[1], const_args[1], arg_label(args[3]));
+        tgen_brcond(s, TCG_TYPE_I64, a2, a0,
+                    a1, const_args[1], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i64:
-        tgen_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1],
-                     args[2], const_args[2]);
+        tgen_setcond(s, TCG_TYPE_I64, args[3], a0, a1, a2, const_args[2]);
         break;
     case INDEX_op_movcond_i64:
-        tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+        tgen_movcond(s, TCG_TYPE_I64, args[5], a0, a1,
+                     a2, const_args[2], args[3], const_args[3]);
         break;
 
     OP_32_64(deposit):
-        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[1]) {
-            tgen_deposit(s, a0, a2, args[3], args[4], 1);
+            tgen_deposit(s, a0, a2, args[3], a4, 1);
         } else {
             /* Since we can't support "0Z" as a constraint, we allow a1 in
                any register.  Fix things up as if a matching constraint.  */
@@ -2272,22 +2264,22 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                 }
                 tcg_out_mov(s, type, a0, a1);
             }
-            tgen_deposit(s, a0, a2, args[3], args[4], 0);
+            tgen_deposit(s, a0, a2, args[3], a4, 0);
         }
         break;
 
     OP_32_64(extract):
-        tgen_extract(s, args[0], args[1], args[2], args[3]);
+        tgen_extract(s, a0, a1, a2, args[3]);
         break;
 
     case INDEX_op_clz_i64:
-        tgen_clz(s, args[0], args[1], args[2], const_args[2]);
+        tgen_clz(s, a0, a1, a2, const_args[2]);
         break;
 
     case INDEX_op_mb:
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
-        if (args[0] & TCG_MO_ST_LD) {
+        if (a0 & TCG_MO_ST_LD) {
             tcg_out_insn(s, RR, BCR,
                          s390_facilities & FACILITY_FAST_BCR_SER ? 14 : 15, 0);
         }
-- 
2.26.2

