Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649244ejb;
        Fri, 7 Apr 2023 19:45:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yk/s8HJBmOc074hO9akeiwA9L+2WEWhBwz6R5bldoFxwvIqtITR3w/kUUnj8MJIDnJxkOO
X-Received: by 2002:a05:6214:508b:b0:5df:d35d:2108 with SMTP id kk11-20020a056214508b00b005dfd35d2108mr12719273qvb.25.1680921905606;
        Fri, 07 Apr 2023 19:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921905; cv=none;
        d=google.com; s=arc-20160816;
        b=Jh1sMdnojNx0kHdhBRPHHOmYak6es+XL2wOg/G5c3NJXyYItCxtmHfRQE0zxZdIsL2
         puHVwW6GextX+yfvy73B2Dm5BX/4eN5FM48Y3cg5u29aA5RfuLAUqxaxbzjvYVM/k0bt
         ogU1i5uEaYQcwuDfOdLvwTicVeINb6DQ0sHZ8079MFUINRIe5ZwFNHqrUPv21TpDo8XN
         xAkEJcQxzJD4SusMvx2QiqlcftkDUEo6dnGlA5M4ahgwajjwPCXPZnzoVHihx6Eqr4H+
         /RJEh4NqiSRj0PHIRHy2iUPvE+qwNRxt/gICEmbkjlJIxNDKZicaV7Edkg5XBfkf70W5
         nQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
        b=VzN5LVQYlwjF5SETqwL0XqmlpuIgCl/9XMRaAuqGPby5Ubx3R3DrSV3gMltkwljvN1
         J+Fa1wi6J9I01QKqFle6Yp7wS4hjdvNGKAoJvle3XjN/dMWc5purEimSyKxpHH3rG2iN
         yOvHGz6wOhOtC4S83X4uf0q94Sefe2TcL8czVLR/sAjeknKUkR+yTj/GIMKpt+LhRLb+
         I/O1LVPtnY2+5mY5hFBdqOkJhlYWk+veY5K5gTAgq00D8+8TQ/nDyive0+a1zjwZ1KjA
         TH/4iWmpoRgPuKjoZhHKa5q36YS3Zm5hjnnNg1rVy+5rlClnhwMZ8CgE8DHN2qbI1jSm
         B2EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea1zZYA0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi14-20020a05620a318e00b007468eb20115si3815706qkb.190.2023.04.07.19.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:45:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea1zZYA0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyXz-0006x1-Gn; Fri, 07 Apr 2023 22:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXy-0006vM-6U
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:22 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXt-0005Wo-MQ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id e13so56707plc.12
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=Ea1zZYA0y6DU1+Jpk3XYzqWFvMO+AsIyzT5p0CZL7dUA/MpgPrTLPHQlxxWoNkempS
 X9MT4q+4VuYPzo7OcJXGP+PTuDdVH8riWLRr7CtGHbkafQ47ETQOHtsnRl59TPodpW6I
 EPOSlxf/IAmKkoofGDfUiPNIPv5T5i1lPES3JqOIfHWb+vpehaBEeqMvFXytmlRQzsGB
 jcl6KmkbAjr8P2bjBz1ZwFWy/rVJdU0q5YFOiadGHD4HzrIE/okBTXSJ8SIHHzBbJD58
 d/sUkyq/0D54H27FNVV4jwZz75Kn3T1hn5YvNJs+WblO/fIKuemmmpW3g/YjkSa/NRwP
 aGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcNEhGFLchqZMB3huLw45XXaPWISEFJfrSvpuPV2BPc=;
 b=nVPZCqTF8+F4Hcf/OA4wmH4p7Mm0EulqnhGHN4UVV3OfvEsGX5JzGMnIHPKJmloyPO
 DKC5qdaaxMrC6FrQwUv51MnsxBPJTYEKKQYetX8rCT/s/0myJzTam1enuRUZl5foGftj
 lyYweRu/9qmiw7kQeuB9bFFSkU6CJQPL13Y2xMGqmrAlIOkCtQ6b8GzyNff9UVfY6gBa
 Eif9SwyUoIHcpdEKN9qubHiAxaMXB2TpvqsE+Z3cviShy2V9BaQwTxX19SzYh9psPesd
 JnCYO/4IRBBoB5ktKwg9QYmQR5n5j/ZQw1iQohLzmiZo8UuKxb0B0SOLXcFhoVdhxL4h
 Z4nw==
X-Gm-Message-State: AAQBX9d1G9tgw6upGTnrABoWjp7WawgMJSvUzicB7VJ1tfcxPuJU/D/q
 9KtfO+amNgflQZKIlrLF0ffvB7IMhbS6oYcKfPI=
X-Received: by 2002:a17:902:f94d:b0:1a1:f95a:2505 with SMTP id
 kx13-20020a170902f94d00b001a1f95a2505mr8481645plb.29.1680921796286; 
 Fri, 07 Apr 2023 19:43:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0] tcg/i386: Adjust assert in tcg_out_addi_ptr
Date: Fri,  7 Apr 2023 19:42:32 -0700
Message-Id: <20230408024314.3357414-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: 4K8Nqoz5izjr

We can arrive here on _WIN64 because Int128 is passed by reference.
Change the assert to check that the immediate is in range,
instead of attempting to check the host ABI.

Fixes: 6a6d772e30d ("tcg: Introduce tcg_out_addi_ptr")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1581
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..5a151fe64a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1082,7 +1082,7 @@ static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
     /* This function is only used for passing structs by reference. */
-    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+    tcg_debug_assert(imm == (int32_t)imm);
     tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
 }
 
-- 
2.34.1

