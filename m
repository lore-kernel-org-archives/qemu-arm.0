Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6567547ejq;
        Mon, 15 May 2023 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7McL8Q5/Y8zRKC5THM35nNQ1V2PRcLAobebkAryacnUF5kQKSLw/tNp8d7kVls1bq7Xwot
X-Received: by 2002:a05:622a:1011:b0:3f4:427:dbb8 with SMTP id d17-20020a05622a101100b003f40427dbb8mr31781909qte.2.1684162361581;
        Mon, 15 May 2023 07:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162361; cv=none;
        d=google.com; s=arc-20160816;
        b=Bf63n23wyzkA5rq6G13RBD6SiBMG/qWOYIAHYR2da/NeGbr/7HjJaBBQqoOdrfCMjw
         4neh7FehtoOKY6VHIAMq7yZyaTwfS0+WFPUTIIp7v9YgVdFTPfPBUcc8thVRZ/j7+YQ8
         uz0vSHhr1tIa8tDRR3qUabXdSo1yq3HEEmbXwoyPAgm14qBfhmFFT0JgBwXM5ndukUbz
         V4j1dZrOlxUeHQmQruQ2JIKd8snkMvPolpYnOG6hzMlZv07w1KDRNED8Oq0jf0QEO0ln
         dvagsLv8xIR2gpNEF4alJdBjEkGbT46XVCRSR8Fxzo/6zKeBrQGLDWGkmUvhkpJ2Ppnn
         1s0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C7A+mEX1ZrmjjLYqtzKZHi9DyEb4qEYbCIsoKmrRzio=;
        b=q10yRHnqvw7YM4rqbTC4KGaUDEN3MJep6S7GyjPkEKevalO94OcUfMFhO/UDaWuqIb
         tGYnjGL3ixqUHLqBpybCP37bhZPEMVmgLE7mVLTVi/nILFEsXZuzri71OaSJOoteXZZn
         6IH4nt/WVFl5fvSW+GRTgtrcemHM1gCxhpvGRF61fwnI+xyPWndrt0kQdF22m3oAJozX
         56WG5htLaGkHct9AaQS3/2uvaZvxBzYvtk5zjyDCc8Kew+gO+XVW8Csu4Bc2oNJCHMPS
         HYiqMLX3U1YN9S9Pr3aXW6OR1cp7XszDVVayo5bWJXExgLFV6TY25NAl9lwJ42DJ/7y+
         mQcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qx4vHVbi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05622a1a8900b003f52896929bsi1764004qtc.802.2023.05.15.07.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qx4vHVbi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIf-0000d0-4D; Mon, 15 May 2023 10:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHj-0007C6-Vy
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00051t-D1
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24e09b4153eso8789301a91.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161221; x=1686753221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7A+mEX1ZrmjjLYqtzKZHi9DyEb4qEYbCIsoKmrRzio=;
 b=Qx4vHVbiUZILX0umSe3uJ//SoyiAOG2QS/k+csfwJlgO6E/jwDGcSvOOOYEhTcxepU
 NoIul6WxPoeKEK+8h+pRxVQtVC7EjN+hMMqqznWKTQtHzwsySZCcVmCmOyh9pGdtY0oi
 bztJ6KQJtKd6LAukLW9EB6D+4OsATa/GeLeP2Pf4tLzY8kdUIz5yBEr6T/FK/GBfTz3B
 yJpT8X5IhTYj3iNfeEpwpsO0fHr1S9fmP0A3osMPkiOqXWbivY2mjtdJVB0IyFK/OUJJ
 xUaQ7/JsYq6NMFd/buI6f/EtQgjKTqhsq9X8VCheSkj9WEqzlWl7zQXH6aE7YUODizzW
 fQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161221; x=1686753221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7A+mEX1ZrmjjLYqtzKZHi9DyEb4qEYbCIsoKmrRzio=;
 b=Y1wvAdZ9MksxeG2gUt5G2SSMEJy3rHb3uIUbhxWyNl06H65Eyf8humxbfmmyRc+O9R
 Ufkgd8iwuNpHNsGWyfK+M3t/gyoszW/W4FelFTqBblE09HyeA7UMzRsCrpZIkYacyFD/
 h+IcHhsG6HRCtJA+eLfwIjuCHPIUhkrVXnwQs7qJUA3nVDPq70kyFSNvU+Xyw815fZJn
 x95Lv0LesJItUnoktu3rh3HSFYePYixGYTu8DrtDZnmXtbsP1m5NGiEUWs93jeoyeuOc
 TVkW3tcuwqAn2sSas2rXrFG1D3IzmdB5NKhBwLzinlevCE39O3P1MXTSbcccpcrvwmjc
 F5aQ==
X-Gm-Message-State: AC+VfDwIXusQ1VeQ+Va/T+YQ6mwCj9ldzsVNst5a6yfmLSPXTl1/4fbW
 jrmGnNZkCwxr0tWkG079K2h12nrC/GqfmVbvcgI=
X-Received: by 2002:a17:90b:4c06:b0:246:5f9e:e4cf with SMTP id
 na6-20020a17090b4c0600b002465f9ee4cfmr33500057pjb.43.1684161221380; 
 Mon, 15 May 2023 07:33:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 31/54] tcg/loongarch64: Check the host supports unaligned
 accesses
Date: Mon, 15 May 2023 07:32:50 -0700
Message-Id: <20230515143313.734053-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: MxJbn3+E4Xwx

This should be true of all loongarch64 running Linux.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e651ec5c71..33d8e67513 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -30,6 +30,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
@@ -1674,6 +1675,14 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_target_init(TCGContext *s)
 {
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+
+    /* Server and desktop class cpus have UAL; embedded cpus do not. */
+    if (!(hwcap & HWCAP_LOONGARCH_UAL)) {
+        error_report("TCG: unaligned access support required; exiting");
+        exit(EXIT_FAILURE);
+    }
+
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
     tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
-- 
2.34.1

