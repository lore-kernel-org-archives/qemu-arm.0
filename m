Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720586ejm;
        Tue, 25 Apr 2023 12:42:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73Q29JrgxpW4pgJSo2HK+rpmQRAoYThvzhWuAHRIFQtCCmz6Rx08PSGeuZiczv7rHeMF4u
X-Received: by 2002:ac8:5f07:0:b0:3df:a280:b622 with SMTP id x7-20020ac85f07000000b003dfa280b622mr52975qta.13.1682451767426;
        Tue, 25 Apr 2023 12:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451767; cv=none;
        d=google.com; s=arc-20160816;
        b=OlGl/hgzcO/ZHKeu1GOncojKl5TOP0vxYPmLrYn7Tm+5K7Pqz7euSBbHOdTOcwYdNJ
         dAWHlfWDnsHeDUi8RuK3/0WnvWhW1HUl2CELPxacapx366WvFuoiZgahAmaAeO4wfZbj
         BFiE+ZIReooyWi5LifGv7D7bGM+g5+Y5KwMEtGUNYt+AYT+EMtvggPRpDD38+FcBkdJm
         9tn4dfDkgqgC4b3Hc3fpm5/sMoquSpLCJKKRnVZJNsnWs/aKK3wd3p8768Fkyz9KA8DR
         FyckC3bV+G27DWH5LIXbAPPYzyIl2A8+IPKU3QAO0Oi1xbAaNdBpof20aQnxh9xtf+T7
         Zw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
        b=mGxcIhFPg0XcbwbC2FRc2e9wQ5bmu7SgjjmL1tDY1Xba5yDoeQfBeuoGDqXK8ePecJ
         bhIW42e/8uCgrXJzMYuN6VpCXkiMGjismi03A9Fby+pYsjOOfshiD82weWwlZ429/ORm
         vURsbK4RE7b7ePa/aQrfsbvECnaTq7rKZ/8piyLHg5qzk3qs4YVx5R9rEtWWUTlZXX6j
         trYU2bOQK7Vo5VQaSONdDAxtQUZQ8SWlI+CpoP/r3kuPZiw30dfygHiA419Q9Gvb0lRz
         /bR9qU5/N96YB14E3+iaht817JEtOnApMV8367Q+5rMe16/jRfwzv3M+1JwtCCwZu6B5
         +Esg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GmIMAPFZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19-20020ac87f93000000b003ef7d5b4870si4840347qtj.147.2023.04.25.12.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GmIMAPFZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prORO-0004el-Dq; Tue, 25 Apr 2023 15:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQo-0003kl-66
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:30 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQf-0004q0-2s
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:29 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8bdcf87f4so56991321fa.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451259; x=1685043259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
 b=GmIMAPFZs3NCKAV3HQdLzqQ9H3UBFOesOvGP92RJVXvYacKijZ1LJBDwMpJcEkcy1V
 +Xckyne2DIiiGefwBNUkpHuRLrra47RkkcTnZjnYIxS20m2x0S4vWleLGhJnDvDrxg73
 C8WyWsjCZKlNXqpik6lamgOM5Il4pTS67daPU9o8pUXYBHt51NU5tvMwSDBfs4rShS1i
 XivvC4Oc889uTI4MNIdnyLIqDQ8MGrK8QGJXROIt94H0nue3vnU8Idn9Y83qfxCyG2zv
 dcApWKkGvvMdTbvaDR+nQenWxZgzQnBTubajAn4BIk/ynxEfsVNvzTP6lNGUJYIojggx
 YreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451259; x=1685043259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
 b=RllzCWvUoZI/ExBVP2vVPddKrd03pgNK3l1qntYFH/sINCpLVtBzKzCBmqceHbTHUe
 Aq+5qteVNSUvCIUs2uPrK5E9FbbN0e1GTcMvYiueSdX+pKgw+621h4Qs32qnTpefwtA9
 9mcL4kj4ubKJNWTLVh4+IBAH1KGAqqCYetZVO0QuYTyneZXq8e4RcIqtvwP0fAZMWlrb
 e4SOpRuQZJ8Z7ltQVug9hfNc6NtKEtWF+9hlrxGpBcVYx5FHg6XC9Ksyrra+NVP306js
 7cFxmmQB/ddAuYOG0RXuRACcU6p8GQcvzpcnKMvU8+ogY/JIrG2OONXIbz6X1bjTVI+m
 b/XA==
X-Gm-Message-State: AAQBX9cFDiCbg+md7sGcocdjTVXEaqAchwmo3NZWqKdb0u3eCgZcKpVb
 kqPTrO+ugmpInv+2N84nUW/0EWeCgDJvr1hWR4P/OQ==
X-Received: by 2002:a2e:9059:0:b0:2a7:7771:2534 with SMTP id
 n25-20020a2e9059000000b002a777712534mr3804531ljg.35.1682451259198; 
 Tue, 25 Apr 2023 12:34:19 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 22/57] tcg/aarch64: Use full load/store helpers in
 user-only mode
Date: Tue, 25 Apr 2023 20:31:11 +0100
Message-Id: <20230425193146.2106111-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: 2yDbwpo/8ap2

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 43acb4fbcb..09c9ecad0f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1595,7 +1595,6 @@ typedef struct {
     TCGType index_ext;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
@@ -1628,40 +1627,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-#else
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_adr(s, TCG_REG_LR, l->raddr);
-    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                        : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1

