Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6558444ejq;
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eBccenH/uB+Xu4KDmutHme0bht2j+YAbQTAeGQ2gsEj4cfWiR9gGtzHuDpi0teyi2SsEQ
X-Received: by 2002:a67:f353:0:b0:434:8479:1812 with SMTP id p19-20020a67f353000000b0043484791812mr13491511vsm.18.1684161396416;
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161396; cv=none;
        d=google.com; s=arc-20160816;
        b=NLOpsBLcaCWshG8IrW6q0GV/TQXRPGYzYZZB3duPYrmnWCWiCP00yuzCJe9RqAaY3m
         uLq9ZqVCocNQ9uFfokhz8u4inFlYTqd7EJCbVUgp8FyLwXTxyZExoFwwYjqQb6YbEZe0
         DidwtG84+Pp6OjhuLVg3RcEQ6Zw+FEZsKLFv9j5WYLj9tjkjW2TrKlu7qkxX24wD3vo4
         vkdCqPSKPOlAkYsJsyL0XDADEI7+0isL6IUEWeSaIt5zm43hFTEW1uwWmMHfJ2ZEhrkN
         aKLt6EJ/WncLQ78vitEtWbF/OcfsjqVXC+LR6g560AUbABEG2FB7/Apn8Emw+rOfflMX
         hGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8/oWD1U747odSVFFBC9M3Sdo3AJc8ITxvfJIeQOUz74=;
        b=Z52ie1TZ5udL74yRcYQaTMQPNcxZvS3VodPuh/tEwb0r5DXM+FZLpTfrxKFtw9KZ4T
         OJxrT8/t411n2XCqzz1C8upM04DQw/fqte+oJwl6cgHYU8eUqRJaZ60sVcjyLz06jkkJ
         fEfYZWA8dccqG7H96OjfS4uIG0Ou7JopBG8hithtqstsqx8LCvlKywkfNAm07jXCphkc
         2n/EQi73WnJUzM0YDWnVW4fCpN9vpffuQQj21hgpPjeum3cQOPKjupgoKC0mWMVhcBn5
         h8sdn02P5GFh4Ifz5anj9HKaBvUfyPUKYtj4UJU1EvPJeB9wCm7yLMXHff+mpOXJclkT
         BcAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Eln7J/z7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a37c244000000b007577c53de4bsi11166225qkm.780.2023.05.15.07.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Eln7J/z7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIj-00010E-Pk; Mon, 15 May 2023 10:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHh-00079i-1o
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHZ-00050M-Qy
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:42 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-53033a0b473so6283461a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161216; x=1686753216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/oWD1U747odSVFFBC9M3Sdo3AJc8ITxvfJIeQOUz74=;
 b=Eln7J/z7uhECyw02TtVZ7H6I39wO9KqkRVEtDU5gCVV/3jjVDt8rrjLSSBPRF/MH4k
 yDZvUvHVdrve854lhDDkvbgkwOQ/Nr5cc6K9dk+3rrmJbHsk41Eea00a2kUU3EAdgp2K
 BYXiOaecJOEyeaX6/qTPVl9MWzT6d7jFwBxpYGxnPMKoUPykASrr5Emqe0u0ySNXkog8
 EJOLSVE7hT5/9UJt4IKn+W1yQas2XbSq8V2rJ5hsEVYSlfoJILKN3Lx7LLZJVTUR+ZOy
 dyu+soMKykN/vncGPGkVfI+T9uxvsAbOOVZ71BVznP7922gztE615Yf5VZOfYgkn//x8
 O4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161216; x=1686753216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/oWD1U747odSVFFBC9M3Sdo3AJc8ITxvfJIeQOUz74=;
 b=HKmefYa2y2dt3Ei66vIWopujIcMIEiievEUbYPTVtato+slBZEenhVSurHasHdziVd
 IOTdca3eW+TpN8aGUQqK7ygc6s6jk0u1gKeBtLIOEgnhFrT80dVbmMZptD3FetKVxOdD
 hStTM/gpUwoXa0haoQsopMYFDEK3Nd40/3sKMSzM59LugeijZsj/BUfIF7Abtzo6uqQS
 bMSOoojHYvCScfnVr3+s5vUHcdMltv9o94Htj9bgNXzftrbB9+J7p1G8zmMPy6y0CpM+
 7cwr0/bvGNg1waMXXy5adJwcSJsXmXPEfJSXrvuECxfrZnfyC/AaKCxoAQE9irMgTUqa
 kCNg==
X-Gm-Message-State: AC+VfDytwjjTj9xpHpLAcfeX1OmHpkTdm6sZ6rxNMwYCBE4JfewvpO9k
 cS7eltD1PWFiS2LciCBN+8iulg==
X-Received: by 2002:a17:903:22cd:b0:1aa:ee36:4095 with SMTP id
 y13-20020a17090322cd00b001aaee364095mr43063462plg.43.1684161216423; 
 Mon, 15 May 2023 07:33:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 25/54] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
Date: Mon, 15 May 2023 07:32:44 -0700
Message-Id: <20230515143313.734053-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xce8ItwWzVUk

Emphasize that the constant is signed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 64464ab363..15d6a9fd73 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -399,7 +399,8 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
 }
 
-static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
+/* A 13-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 {
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
@@ -408,7 +409,7 @@ static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 {
     if (check_fit_i32(arg, 13)) {
         /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_imm13(s, ret, arg);
+        tcg_out_movi_s13(s, ret, arg);
     } else {
         /* A 32-bit constant zero-extended to 64 bits.  */
         tcg_out_sethi(s, ret, arg);
@@ -433,7 +434,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 13-bit constant sign-extended to 64-bits.  */
     if (check_fit_tl(arg, 13)) {
-        tcg_out_movi_imm13(s, ret, arg);
+        tcg_out_movi_s13(s, ret, arg);
         return;
     }
 
@@ -767,7 +768,7 @@ static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_ICC, ret, 1, 1);
         return;
     }
@@ -803,11 +804,11 @@ static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
     /* For 64-bit signed comparisons vs zero, we can avoid the compare
        if the input does not overlap the output.  */
     if (c2 == 0 && !is_unsigned_cond(cond) && c1 != ret) {
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movr(s, cond, ret, c1, 1, 1);
     } else {
         tcg_out_cmp(s, c1, c2, c2const);
-        tcg_out_movi_imm13(s, ret, 0);
+        tcg_out_movi_s13(s, ret, 0);
         tcg_out_movcc(s, cond, MOVCC_XCC, ret, 1, 1);
     }
 }
@@ -844,7 +845,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
     if (use_vis3_instructions && !is_sub) {
         /* Note that ADDXC doesn't accept immediates.  */
         if (bhconst && bh != 0) {
-           tcg_out_movi_imm13(s, TCG_REG_T2, bh);
+           tcg_out_movi_s13(s, TCG_REG_T2, bh);
            bh = TCG_REG_T2;
         }
         tcg_out_arith(s, rh, ah, bh, ARITH_ADDXC);
@@ -866,7 +867,7 @@ static void tcg_out_addsub2_i64(TCGContext *s, TCGReg rl, TCGReg rh,
          * so the adjustment fits 12 bits.
          */
         if (bhconst) {
-            tcg_out_movi_imm13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
+            tcg_out_movi_s13(s, TCG_REG_T2, bh + (is_sub ? -1 : 1));
         } else {
             tcg_out_arithi(s, TCG_REG_T2, bh, 1,
                            is_sub ? ARITH_SUB : ARITH_ADD);
@@ -1036,7 +1037,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_code_gen_epilogue = tcg_splitwx_to_rx(s->code_ptr);
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
-    tcg_out_movi_imm13(s, TCG_REG_O0, 0);
+    tcg_out_movi_s13(s, TCG_REG_O0, 0);
 
     build_trampolines(s);
 }
@@ -1430,7 +1431,7 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
     if (check_fit_ptr(a0, 13)) {
         tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
-        tcg_out_movi_imm13(s, TCG_REG_O0, a0);
+        tcg_out_movi_s13(s, TCG_REG_O0, a0);
         return;
     } else {
         intptr_t tb_diff = tcg_tbrel_diff(s, (void *)a0);
-- 
2.34.1

