Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1878450ejb;
        Mon, 7 Aug 2023 20:16:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+krY7pyAqcCtektdMBZVHEun+KMFjHDmcLj3ElxIFIOyQXRJHnVCLEj+zbxyUWh575Vem
X-Received: by 2002:ac8:5991:0:b0:40f:df1f:87a9 with SMTP id e17-20020ac85991000000b0040fdf1f87a9mr13846628qte.18.1691464612337;
        Mon, 07 Aug 2023 20:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464612; cv=none;
        d=google.com; s=arc-20160816;
        b=zf/4n0zIPSa7XuPbmBXOmq0EOJ2aNba9n0aZMm+D5U0+k7nnfQWk63sGAP5IjelQtR
         XEbwtT/YgFUK4U9GJlHPyRDvtU+l8TUpDFrmV9EN9W27TmviS7IjNvEkgBc+INuSS0Uj
         Uz/dKCYfIraheyG0H8qWHTppdF92/ORw6vDih+MjP0i5x5FQT4/p2tnd2UN43h9smEz4
         OCvga9vb5bMwF/SdHjDjv1kj5u3KGy2734LMQp3MH4JOjq/rOXF/gV6j56+5bil0FPiw
         hVZDKYqWRKNsbnui9TAIt9Pb4pNJ/0++zOI4Q6d9NB2lEe6ebdybuoFxWdBGjJJ/EIC6
         iuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sfMK4oMzpluAk19ya+JPxEIiB0HyoTLNffeRU4faKRc=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=wEjFVFhQYJfA1R3OHxCkeY7UgjIFTQpxRHgmqW1Zw+pQaA90CnhAsApSuVab/fc27r
         5IjokMB+fz2ffkGUgYSZQqvbuGzJTtHj7xnl8gWyHb2/SSQXS/FDSaYiMUXbq7qjFm/u
         IopAgkz0RHJhQzg2Q0y4qz13tsejMsa7f3rD8hKJRKiq+/cUiOyYa9NZ+/T2BbWGIx2w
         EVqPJfw7xI9GY0sREa0YsVmBSRxP3cFLQqLFq33G0KWCT63FPHCv0hISm/IwfiA917KQ
         cNvNdEJB7lRe0on992ze8za4clmCPotjoI3ZI5nC8Oe4AfF7FWMg6o7/oTElYe74BMnD
         9d1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCsOwg39;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a05620a024200b007672916d24asi5752870qkn.732.2023.08.07.20.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCsOwg39;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTD9O-0003Hl-Sr; Mon, 07 Aug 2023 23:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8t-0001fE-Q3
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:22 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8d-0000KC-3s
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:19 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6bceaed7abbso2231424a34.0
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 20:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464321; x=1692069121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfMK4oMzpluAk19ya+JPxEIiB0HyoTLNffeRU4faKRc=;
 b=pCsOwg39H9F3W9vixJAlk7Uu7ACQ1dh/w3NkmLue1ntC6/YmsURspRF7wuhztLCafS
 l/Qg1jMQtY1zLBEMApU3kPNi/794My6hwA4V0d6tbzIpwkp4P63sgPrencHyuWvcTr6Z
 STfrtNXBozXp8+iSK6oXiaZdpy9OnPE4E/pXyp1nMFHHgeJn7QAX0jnjsHZS2baUNfmc
 rCBGNWfziYXlC/1xAf88C5u7GgA53vfVGw1w0WtCuj8xN5bQUGNOdCnQft/Q0C2q7PSU
 anFcZC1a3SMPymILxnxzZ5Uoo/EXIkKY8bH6E9ISRadvAbn9w2r7e00SEb0kk3qjPLiz
 cFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464321; x=1692069121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfMK4oMzpluAk19ya+JPxEIiB0HyoTLNffeRU4faKRc=;
 b=B5a9BL6CIRvO7reJxvVgz9HdWwLWiUjOnFxCpPIq2vpQAcha33hIzZqyQKMcNfnR4U
 qBqWyCjGz5CcJhy8a5Jawq1kumLMk2qxjisT37Vn27K+xm8Lz8zJLmFbQaqzKL2Jf3Gd
 OHlyZJqyH5Yt4IGYK9pv9X8wKGA1gbpnPxe0eYjTz/o3qJLW5Z9BxUJ50hYeiu8ykbnh
 eTBqE1reMCyh15sgUX/xNSqp85h3hFBfXYDAMr5pafkEMBFNvqGt6lW2KdlhXJr7e80G
 cOLbGDFbwGvcD0EybzcqBf6SskMx3SozwLRUt9ULddImIfVjENjCslkqBYvkGGlPVzVi
 fKMQ==
X-Gm-Message-State: AOJu0YwKKZ16p2zeFLh95pEZV+Su0AFpMmSja1f58GfoWjb7zQjQYioT
 mrZZC9z33Tf0mcQuFXlXihikjO+po9rUP2SmxHQ=
X-Received: by 2002:a05:6358:2607:b0:132:d32d:d929 with SMTP id
 l7-20020a056358260700b00132d32dd929mr13899350rwc.20.1691464321633; 
 Mon, 07 Aug 2023 20:12:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 19/24] tcg/i386: Merge tcg_out_movcond{32,64}
Date: Mon,  7 Aug 2023 20:11:38 -0700
Message-Id: <20230808031143.50925-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 5f4jP4lUtxwh

Pass a rexw parameter instead of duplicating the functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index ec3c7012d4..b88fc14afd 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1590,24 +1590,14 @@ static void tcg_out_cmov(TCGContext *s, TCGCond cond, int rexw,
     }
 }
 
-static void tcg_out_movcond32(TCGContext *s, TCGCond cond, TCGReg dest,
-                              TCGReg c1, TCGArg c2, int const_c2,
-                              TCGReg v1)
+static void tcg_out_movcond(TCGContext *s, int rexw, TCGCond cond,
+                            TCGReg dest, TCGReg c1, TCGArg c2, int const_c2,
+                            TCGReg v1)
 {
-    tcg_out_cmp(s, c1, c2, const_c2, 0);
-    tcg_out_cmov(s, cond, 0, dest, v1);
+    tcg_out_cmp(s, c1, c2, const_c2, rexw);
+    tcg_out_cmov(s, cond, rexw, dest, v1);
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void tcg_out_movcond64(TCGContext *s, TCGCond cond, TCGReg dest,
-                              TCGReg c1, TCGArg c2, int const_c2,
-                              TCGReg v1)
-{
-    tcg_out_cmp(s, c1, c2, const_c2, P_REXW);
-    tcg_out_cmov(s, cond, P_REXW, dest, v1);
-}
-#endif
-
 static void tcg_out_ctz(TCGContext *s, int rexw, TCGReg dest, TCGReg arg1,
                         TCGArg arg2, bool const_a2)
 {
@@ -2561,8 +2551,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     OP_32_64(setcond):
         tcg_out_setcond(s, rexw, args[3], a0, a1, a2, const_a2);
         break;
-    case INDEX_op_movcond_i32:
-        tcg_out_movcond32(s, args[5], a0, a1, a2, const_a2, args[3]);
+    OP_32_64(movcond):
+        tcg_out_movcond(s, rexw, args[5], a0, a1, a2, const_a2, args[3]);
         break;
 
     OP_32_64(bswap16):
@@ -2711,10 +2701,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_movcond_i64:
-        tcg_out_movcond64(s, args[5], a0, a1, a2, const_a2, args[3]);
-        break;
-
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0);
         break;
-- 
2.34.1

