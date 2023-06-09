Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104321ejb;
        Thu, 8 Jun 2023 19:28:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4wINflE81BbBH2aoQCDqIJbq0fA4aohPgiOdNYqBvHZHDqkm+QR5JTTypE/0CUkTLaQEoA
X-Received: by 2002:ac8:5703:0:b0:3f6:914f:5934 with SMTP id 3-20020ac85703000000b003f6914f5934mr198509qtw.58.1686277693900;
        Thu, 08 Jun 2023 19:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277693; cv=none;
        d=google.com; s=arc-20160816;
        b=oQzezhLKEBvdbvetIRglcPWuOzYoJgGy5ai5WY0jsc3+2R4jW2P06ncB0EDo2YmTo5
         EChd13K44RWQqRptQBCD3PLwv+iJSk/R0X+tTFoyXj2DjAYovO6NRzB676V2/85xEoeb
         v4MQSz2FyrZd3QeOFL/A1Nk86dG1Lmgg2vWvyz41cRMqXzZHkx0Cyr0f2Bnm9IhB8cBy
         IiWwPe6dCu0fRmatKZICc8M9z6Oy2O07AbKZmZ/0zb9pVC/N1B4kCbjSa8f8TZj63wOT
         alwbaFDKfiTYp9yxwrkruXK2BhDSZG+uUNsAXh0wR2nhjWYE21lT/yFYyGvuhal9n8do
         nekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
        b=xMub+V4Z19/xGv6QnYBXdfXPLlV5OgDwb1Yz9JZCUvyhY85VHs0kMg5y64mv26rQP9
         WyM/hKgJW/6NbuQ1lE8LW8pGJbUVA+0nPVQWj1itRxSg8Xkwk6ksUfRO3KZ4MTm6ohDR
         Gg6sANsAuQxblf/0a2KrexCGcJO1n5bJDkp6N8pnT2FV4P9W2Swff2WVRDAe1xAQE6Aq
         iigDJ2T01iX0zQ4MXHeFL4X4TE6x/IUukOpQESdq4k61koC0LJkSpfewX5nj/LVDOho4
         9/0BtLju7w54lS/LoC+Fd2S6l4VhLpE8whjxadbdMIU+tdUPT4vy30WgyWbCSOTtIE/9
         MkNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbpS69gz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05622a100a00b003f91737aa85si1647236qte.144.2023.06.08.19.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbpS69gz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RpA-0005EX-BD; Thu, 08 Jun 2023 22:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Ro5-0002y9-UD
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:54 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rna-0005ha-Qp
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:24:52 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-39a3f165ac5so219138b6e.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277461; x=1688869461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
 b=zbpS69gzh/dR28tCj8pisAa4WcDflkfTGy34MML4nwm224mHp68pxd8rw/fqix2T4f
 xkqOV/t6pfQl33O7MS8TK3EZSnkdYzMHFcva9He5YHwrDapHfK+7VRvDN49qvwUekK3c
 qN8UJZuwcq4Trr25e4gP0LTzGX2wjF2OnRfNpGd4N8EwG1+7xJOQ6RMXsG/o1TUvKPjR
 NJc1TaA4IpEi6+t9oGPLBL5qqf6Ol0IYXaTuhh15wUQ8OhKfKTNtEJiiKPi7F/akFqny
 OXmidwh/llLp3QxVnUZVeVoBkprE9qZ/gboVVqH5Q7JmdizhXPtEC4Rbw4+fwrRLMs7D
 8LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277461; x=1688869461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
 b=Hm427SzmArFPlMEl5ebf0MRl8TdImh3vrUcusK/BTsCQn/eNcyL5mBwSj9t+/BZ7o+
 PcqlbpJT/KEI3nLiOkCxd7jZtgvxdR8R7IjFL6la9BmLMiQSZgUU424U6/m7RmSHmkEd
 rLUdgOeDUgRJzK9LTwp599Dh4CQFp6zPST2fYdGAoYV49bmoAHSW/EUyCuJjxRrf/LUE
 CLe+/Gp0nAhyehm0ssJ8wGbhY5xVzHsnkMVHSMDE+woYvRjKLd9ZgC8LteHRmPcXOgpx
 aNogzQtrNSw72eCf8WQafm2JJswdOhREKEZsR4Lw7MFmCR5kobdepxRfdEYcMYtVnnuk
 RstA==
X-Gm-Message-State: AC+VfDwmtJGbYzZCBS1ePVRnIoOhH2z+kokip+ptq77c/o/Y91nN5U42
 zibje4QT7XonOAZhp87QZg9QcmtzOnCZ68hUPS4=
X-Received: by 2002:aca:b01:0:b0:38c:5a32:325b with SMTP id
 1-20020aca0b01000000b0038c5a32325bmr262270oil.41.1686277461655; 
 Thu, 08 Jun 2023 19:24:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 20/38] target/i386: Use aesdec_IMC
Date: Thu,  8 Jun 2023 19:23:43 -0700
Message-Id: <20230609022401.684157-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
X-TUID: NPe/2LK8racf

This implements the AESIMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0a37bde595..893913ebf8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2215,15 +2215,10 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 #if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    int i;
-    Reg tmp = *s;
+    AESState *ad = (AESState *)&d->ZMM_X(0);
+    AESState *st = (AESState *)&s->ZMM_X(0);
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
-                          AES_imc[tmp.B(4 * i + 1)][1] ^
-                          AES_imc[tmp.B(4 * i + 2)][2] ^
-                          AES_imc[tmp.B(4 * i + 3)][3]);
-    }
+    aesdec_IMC(ad, st, false);
 }
 
 void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.34.1

