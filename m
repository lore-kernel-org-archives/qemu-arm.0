Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104106ejb;
        Thu, 8 Jun 2023 19:27:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Qm5ga7nYFBueHfIso2+8rkumxYsi//SHn3YZ9tB6IEvaDEgGCRev0MIwZ4R4/isXyBjvt
X-Received: by 2002:ac8:5f88:0:b0:3f9:adc9:4785 with SMTP id j8-20020ac85f88000000b003f9adc94785mr162571qta.51.1686277639140;
        Thu, 08 Jun 2023 19:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277639; cv=none;
        d=google.com; s=arc-20160816;
        b=HxecnHuNkFaSrjXEgcFHgZbptk49Ec+l9Zy+7L9SC/aysw4sqAYfFwPVL2oBKlp+Zl
         OBEEKJcU+tyMAqMlTsAWoqnkL1ho9maMVNUtLgFf8MSkJ5wA1G/mDf6h39prxlYAgA/Y
         qXkIphFogeJQoCiugOXEs8l92qaLwLU9+9oTSP/O7Q8WkCTvjpoDn7nZvO/ac+xi7O9L
         kyyVWwQoLtC1nQplyQJancZY+5UIgGHN6fo89UBx46bFcvV4oM2cQAde+rbxoOHd+N0K
         qZOwy1yJ8q/maigkKqrsv9e4CWbXTgmDXBHxh+90Js6Xwf3fEjSJSyIkgYGPvYGGcXIW
         y76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q9vppTZ0kH0Xs3eiJ138RWwvuyXdLrdS2zldn9LG9Ak=;
        b=Bvk5TYxCwpQzc11d4qDGFs4V+DotNzXqD9qM3i1iBZSn9EigxtR0PsidzzDxt+7I8e
         4pDIZ04vuJpCEzZgb2hc7TUfBScFCrumHPBj31uURxyLcoy6+NFN0HBLt3xxMCh+IDvR
         hlq1SOk8Vh7p5w/pVq9gFeJepVlGmZM/l0PqLduD47d9uqx3ba1z5pw5aA/iINam/3FB
         KzZJuZbqYIh5NvvpEpm+m483Pqx0MVwAAymbOZscgqfPEaJcnE3wZDNH5gEkrwtF/ll9
         wVqBmZ19PLlss0IqekSMjWWx2Q/b8AkbJrbmn0iMbJqCfCFz3wkFZnB9Bnj3SnIckJ3r
         om0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJWCZtF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020ac85c4d000000b003f6a4917824si1543631qtj.677.2023.06.08.19.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJWCZtF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7RpJ-0006WY-CR; Thu, 08 Jun 2023 22:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoO-0003D5-1d
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:14 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnl-0005mk-QL
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:11 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-39c7f7a151fso262802b6e.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277471; x=1688869471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9vppTZ0kH0Xs3eiJ138RWwvuyXdLrdS2zldn9LG9Ak=;
 b=nJWCZtF3h06Cbsflk7UBEJ53FYknsNeRYR21bA0viRmaMSPCSgLHyjkoEoE2Bf2wYP
 KbzSyfnF3LD/3EUE0ouVmvcrenkgmsoRMPzwy2OIKXOgyZuG0quVryf6LigxPquoubdt
 1hzXyqNsssLr69USbkwjsNilL7DFL3SVTuMyaJMYq5qYeFho/0MZg/QH2EGuPLvZgjr6
 2fpaJ0ZyKZ9ubumQcPkrTXjseaWvy4I0irHsW1cYk79sO3U1Y+LUoRSqo9kFIvGL6MJV
 5rz/8h+iTgQ+kRCeKPEGKga9hocec0MFZT/d2uLqXBgSnacI3YnOEXPNiuh6zsVEBNaz
 0x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277471; x=1688869471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9vppTZ0kH0Xs3eiJ138RWwvuyXdLrdS2zldn9LG9Ak=;
 b=cN3pz2TdCPeeXtGrYdZLd6Va5v1tJBMdtHyjOh37FstMDHv/E2pilm1bsjXK8dXAbS
 MOLNhd+XkwEY6tdq6F9laquq+jre3XreAd/LkbEdN/haHTJbRTjtrMgW7bGyJGss/lSm
 Xa+lcY0s8rbwJs7sECgbKfqDvAeCHi+sHNm7vbKjAJB5YhpbevfR6wTcZoROsd0Ic/6L
 ai/9IH3QirV5cvLh4+AE3jcjAuYjITdaO0smt+W7Rk4om1m2vRWVACd81KeiNeJ1qrWF
 ExQBJPtDYoqYfW1lN7EJbb++eS8ISxvq5YgQX2em9DMY8AlrhUmOu4OaAnoeMNuWSyAn
 8ahw==
X-Gm-Message-State: AC+VfDzV/xK7gcbnBvbIZ12cEdZhS94FS+gU/2PpyNmRmhBHaejb+1/2
 JKxR5GRiyz6ZnX9CsrwWIVU/+w==
X-Received: by 2002:a54:4117:0:b0:39a:a9e9:38cb with SMTP id
 l23-20020a544117000000b0039aa9e938cbmr282605oic.22.1686277471442; 
 Thu, 08 Jun 2023 19:24:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 31/38] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Date: Thu,  8 Jun 2023 19:23:54 -0700
Message-Id: <20230609022401.684157-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
X-TUID: QdtmykHmMxW9

This implements the VNCIPHER instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 1e477924b7..834da80fe3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2947,22 +2947,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    /* This differs from what is written in ISA V2.07.  The RTL is */
-    /* incorrect and will be fixed in V2.07B.                      */
-    int i;
-    ppc_avr_t tmp;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
-    }
-
-    VECTOR_FOR_INORDER_I(i, u32) {
-        r->VsrW(i) =
-            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
-            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
-            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
-            AES_imc[tmp.VsrB(4 * i + 3)][3];
-    }
+    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
 }
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1

