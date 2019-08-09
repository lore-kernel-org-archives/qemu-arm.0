Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9357488wrv;
        Fri, 9 Aug 2019 08:42:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgxRLYshGc9wNhsqoySQzux3qTCCoVGxN4Ym/2K6TfluTYZynogz3Xqm391fPeEb9y60hR
X-Received: by 2002:a17:906:724a:: with SMTP id n10mr18720760ejk.54.1565365341377;
        Fri, 09 Aug 2019 08:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565365341; cv=none;
        d=google.com; s=arc-20160816;
        b=hsjq0978UyFte+WRMUNjS5sZ5flNonuZj5AFnjxbTeDPd88Og5VD0PshOQtOZUaYAn
         wReRfdraLc5CykM4fYrQfZ83GZdRjbsA8iKtaHlGmxlM7Bu58iAsFwtckcKgSDswaqBK
         Q5DYMDaZkK4IYR05NqIQTxCaxgEdzeapTz56aKTeeTSYufOKpv80CSIx93/UOVnS+0KU
         6CoXKG71g1nX8O/2jKqAdzd6oCIVUjui4HKo9XabGKefFjDMHVyvIT4PH0Z9xyLdP/ZW
         ErR7JNTXaTllbRJNcrvgn2Fc7V/nuyDfwx9MyJH/2vK98Vb3pFyuLcBXCSFNA1cz/sn5
         tsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=x8MCVdcm8N9Wdyzx80ABjmXcKcOIg3c8JF8kLGEmqDw=;
        b=lt8hqKXmk80eaCjj+p5ApJQqR4NjiSBg8r07H4zhLaKZ8jXii2FZfuIgvMu1na1pI5
         QuESR/3KCoFyMo8Vsft7/NbW47m4JFVVXX9h5D3C7kE13pkQ8Ef6bDtXgPog/VY8PGms
         7SEkGDmU1alroPN4Go1DJUj/b2EiE5x45ESZ3XLT9fwAk0qeq0zBqD3CNMLeo0V9wGey
         1V4y8jKPOKTQO15zQsqTXDbHAPpjGBluCMmGp9q8bPqhHjNzRvcZ/XXDvEi2Bf0Rzdb/
         PwIP9F2Bw/IEcXqeUqqmEP2E4+AO4FvAKFnS63pR2X+XaYxqPshVPspTev+ZB8y7L0gj
         l+Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=loVYDKjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si3400835eda.394.2019.08.09.08.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 08:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=loVYDKjB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw724-0001El-FQ
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 11:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50795)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71o-0000dH-O4
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71n-0008Uv-Lt
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:42:04 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42311)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw71l-0008S6-Mr
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:42:03 -0400
Received: by mail-pg1-x543.google.com with SMTP id t132so46042765pgb.9
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 08:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x8MCVdcm8N9Wdyzx80ABjmXcKcOIg3c8JF8kLGEmqDw=;
 b=loVYDKjBaQT2QJuvWNv441HJ4opYXwOlNGJtXF7TcgVjOtY/Q5TxH1B3gcaIIE10s8
 4m/5mFet2d2doJgS+C7NHkl71dKMhvcKFXA9Cr53VFJN+bVv4Vo27vSxAGBbL9PRYb9R
 9F6ljy04E0bDeWuXq1sfdNfwEMZLm9tyB7Ex4sQOJhsOvB7M4VSNPYK+djHYFg7VojU0
 MtuBefnWTW4Co+HtG0+4tUDiJto32DH8EbT6YlEY56i3H8I9otXAc6YMStZIMkGMzd0b
 G0IIyIQ1nPIUoYGART9l/srPZAUjoKTxhODqXrdGJIPuaE7XzdtI5niKqJo4YbJAeSUR
 uRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x8MCVdcm8N9Wdyzx80ABjmXcKcOIg3c8JF8kLGEmqDw=;
 b=qTQLozvkNRg1twBXq3Xa3HQ86dF1gu5WcmACh1aXcLaxHmeY8Ynl0MwBu2IKp5ZFyQ
 Sq2abwBQIiKbl94bCKXEtd8zGO3wQoDdcJZQsT2w9ZPoaUzIErvudVOMH1cHSVK9zz4m
 DUixwktSUAFG+rju0AK6uGELyJXt7PhgswLSJ8xvGrHRJATOfAw/R0w8f+TqxZwaS4yz
 KgqKfRD1vc4Je0nnZUmvC5aIxig9pTArYVc0vLpBlzHJRgHbwJOHkHJ1XNE/OqYnL1Ev
 MsHsWA8WHTx/VvRb8o9Y40/goPJN/pPhtau8kkYRBsbOn6AQpugdWu6vQpQkhi23ZkO3
 OsCQ==
X-Gm-Message-State: APjAAAWkl394xxrc/b4QqAQpUAVXxslA94DdAxjGcfQuABOqMc7b8pKG
 8qU+QqEW7NYDEUlm7n1TuRoPvw==
X-Received: by 2002:a17:90a:360b:: with SMTP id
 s11mr9919689pjb.51.1565365320410; 
 Fri, 09 Aug 2019 08:42:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 67sm80452179pfd.177.2019.08.09.08.41.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  9 Aug 2019 08:41:53 -0700
Message-Id: <20190809154153.31763-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809154153.31763-1-richard.henderson@linaro.org>
References: <20190809154153.31763-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH 3/3] target/riscv: Remove redundant declaration
 pragmas
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Alistair.Francis@wdc.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b1u+OHjUs5VU

These are now generated by decodetree itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8d6ab73258..adeddb85f6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -708,26 +708,9 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.inc.c"
 #include "insn_trans/trans_privileged.inc.c"
 
-/*
- * Auto-generated decoder.
- * Note that the 16-bit decoder reuses some of the trans_* functions
- * initially declared by the 32-bit decoder, which results in duplicate
- * declaration warnings.  Suppress them.
- */
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
-# pragma GCC diagnostic push
-# pragma GCC diagnostic ignored "-Wredundant-decls"
-# ifdef __clang__
-#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
-# endif
-#endif
-
+/* Include the auto-generated decoder for 16 bit insn */
 #include "decode_insn16.inc.c"
 
-#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
-# pragma GCC diagnostic pop
-#endif
-
 static void decode_opc(DisasContext *ctx)
 {
     /* check for compressed insn */
-- 
2.17.1

