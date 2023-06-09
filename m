Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103514ejb;
        Thu, 8 Jun 2023 19:25:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6j+rHP2Sdz+jx/3eExtMVgQWlEXwFZFu3QjiKjYi9jwLzaRnMIPUoYRSiWPiKSEhwKEvL4
X-Received: by 2002:a05:620a:29cc:b0:75e:d6e6:49b0 with SMTP id s12-20020a05620a29cc00b0075ed6e649b0mr9037193qkp.39.1686277524742;
        Thu, 08 Jun 2023 19:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277524; cv=none;
        d=google.com; s=arc-20160816;
        b=f34/N1M5X/gxRC3G8DhIojDNzdvv7qO/M2rj2gJ3tJW0qq3fCgrHc+SzsW/BALEVHU
         cthcUpHbo46lniijU6mrAy/gVh4wqI5WdA37jGwUA/ePT5oVl/8RjC0uP0MCAzLArxCr
         Rbu/jgYgvk2p3DTr8yhCM2d8X05TjeUVlbCvx6+/OVsO5rFLVJu4mJ17gtEWal7uVN4m
         JFN+Vrum/MaLuy+vjCacPXPAL7bxFajFVXxQV5KJOfzqh8eXbwUBoyTHs0vW2UWZJNw+
         jA6/WlWy48NV1zMsCfj+vFl9cd/5fzh9mBGCwAJsBq4XAPppKq8diheLA2+LZ7Ref6fy
         gqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a9cTbGWOromfAtczmWtGfiYZEki6ac5UCJP/59Bi41M=;
        b=C4HAEEVLofCGV7fxPJ0r2qpSERlxQNujtCSkZVSL2uXWWnZIFLf8sxRAAGDNPcWiAu
         tLhXhmADYlFEv/8rqkBSkByx+GnHq5sT95QnCy2+1nKooCnfOyV2dKp7+V/jrgweGOJr
         +Em3bMDDdbUnk57gDUSNOf6O88sUPVBBbpo3QtEgyyHLhGT0dvhRokgIrZivkEe9QihN
         hHeXNW8HmKRz3BAMPYLpnYJvPcqy7opuUospn/swyxe1hqJqBWWXg91WSvnJtndstjJX
         vJEYW+7axpdDh6T+3cB62sPwC07c1hA+/zWAjot3OJXROxJnFZPonKYK7LPgJv83IaeG
         HR0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swb5cRFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a05620a204100b0075edae90f8csi1649245qka.576.2023.06.08.19.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swb5cRFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Ro3-0002xS-Qr; Thu, 08 Jun 2023 22:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rns-0002qV-6L
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:40 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnW-0005dr-Lj
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:39 -0400
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-39c7f7a151fso262714b6e.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277457; x=1688869457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9cTbGWOromfAtczmWtGfiYZEki6ac5UCJP/59Bi41M=;
 b=swb5cRFTWS/NAy00uuAAbFB0kGV73upxQ9s7ZjrVs6wpiWMixeBHvVQKNiLn2+EV4l
 Xc7OjHp6AEaNnIbKHZJbFxUvUT7JfbGkcH9yz+Cetz92M5txQQ0LsfL8T4V5VtHH5vRe
 uj97ZX0gxNrboHCtdEtbeJ29pZsFuMaf9pNHI+7FFM3m1sCLy6ExigHDiRnO+AKIDXIC
 Bc5CqktOhIbjnomldeMjlyx3xlEAPL0pXpwdTa/0hSg24XK4d1XeQAnETd0Bf+bTKjbO
 7L6TprXX0EW2ZgUM+y/X8juezGE4y8H5fy3TOfoLfA4H/HAk+XrJ139yLJ3JBOaiBL3h
 3QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277457; x=1688869457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9cTbGWOromfAtczmWtGfiYZEki6ac5UCJP/59Bi41M=;
 b=QH5cjRm/PyMuoUtOVDfMO3jzXD9LO92vV0YHNvYVACfvkOAuYcc90wa4kjLlGgVvos
 nJSlp7HhNgAXoCaVoA4d9muUY7AwRJLQo0RTfHUJk/OwC2F4ikCGkccwMkcdzi6197F1
 N0a34BaL6VkCLVz31WqavxF6UDVhsubR6xswEORONrr2Fh/amnsa4Opbzj3/oQheGzbp
 FzWIUE6eSDOXpPFWsSTRAMd3xRl7IbVjtWaXjisEXxlW1UnEIfAyDeDM02xQnQcCgEol
 0LMlEXyR3hez29skGZE9Rz76JnB80yHzUG6ZXJEl+Nze/1cAJfjBmREK3+rYn0dRNqge
 3V8Q==
X-Gm-Message-State: AC+VfDx3/KK7m0C+nSEQdfXNb4f+XYq5emva+k6igHRo0HlXHvf6Hus1
 v8AwZXuvvtC8sE0iLtvrfeLB/g==
X-Received: by 2002:a05:6808:1aa5:b0:399:8529:6726 with SMTP id
 bm37-20020a0568081aa500b0039985296726mr208606oib.51.1686277457054; 
 Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 15/38] target/ppc: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:38 -0700
Message-Id: <20230609022401.684157-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
X-TUID: 43m0yxm+pqbB

This implements the VNCIPHERLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 34257e9d76..15f07fca2b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2973,13 +2973,7 @@ void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
-
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_isbox[a->VsrB(AES_ishifts[i])]);
-    }
-    *r = result;
+    aesdec_ISB_ISR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
 }
 
 void helper_vshasigmaw(ppc_avr_t *r,  ppc_avr_t *a, uint32_t st_six)
-- 
2.34.1

