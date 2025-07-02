Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3697567qtb;
        Wed, 2 Jul 2025 05:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV854YpSI1SF2GoVIzAqf4gX/QXfJfsQjz+94IeoVzZpLvk1x488OKDX0hCo5u2fpg2vZnfJsOUduNHgA==@linaro.org
X-Google-Smtp-Source: AGHT+IGNoW4GhghbcarmKEKLtqhI8jMT9bpYxxbYXlFhGrvRLi2FZrVX1GhXMmwgV9oRf7z3Ppi4
X-Received: by 2002:ac8:7c43:0:b0:478:f4bd:8b8e with SMTP id d75a77b69052e-4a9769de2d5mr43399541cf.39.1751459011143;
        Wed, 02 Jul 2025 05:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459011; cv=none;
        d=google.com; s=arc-20240605;
        b=Rm43HB6cxmHsjxsJdWUgYbjVImvh2MouXdy6wVuIpjyirA1knW7WSxgAMGjoh3m64Z
         5h9rg7mAV0Tp8VyH/HJ8JKZpUj4g7WEgr5Wr9FdxDlFoXB4O+ogOTvCLv+iyt8do/0S7
         DFJ/+OtHmH6rJ4jhyE2jpnNqPGnpWK+6iBvOX3lVgC3nYGjO77Bf19/Jc4RkkrNxCyqK
         gjZmuE753+wHc69AvecHMt3Vq4NYVJbKaeYF2x+OswQFlzeNbgG8wNE3xXUgBlzlQy22
         ZR+ObGSaGqlw9hHs83EOSXrpusuketu3NQuUtS8iW8B1HvTJs+L1KNHd9ZXO+Ju/Edto
         fJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b1nwk8IyMWtkFl0V6iMZghwNPUspSshQHOECaZCfwyA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=IjwaRZ2OU5KrmjREYn0NX8twTNbO/uaNUha+Sh9s2bGFYOaP3VPiwLYD+IqPJFK6Mq
         1Vs6LtfUSDGkpPr0KjIm0gAGTIBpXA/15SPuHbR/fpSRmZqtPM1Fgo82aWYdjONeP88F
         oBucrWn1VzB1FKWy6PzFkN2HckOXbB395NkC8rybNCp1BPySB36hCfvN+xloQfOL8No3
         wNC3eGRNTO5WhOrthYduvrwe21tMejo62hIxwxqagdQoJFRLt0dU7/k6yat+QPgKndPx
         m0E2XJaMo4Bub4kLl29O1z63MLn4rCTL7Q2H6xyRQ4kdqZEBVyAdoKIwXPGw08aCNyp0
         jN4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wF8KOHab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a80870b362si103527091cf.199.2025.07.02.05.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wF8KOHab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwUg-00059T-9q; Wed, 02 Jul 2025 08:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwUC-0004zU-AC
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:48 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwTv-0007Fv-5J
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:47 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2ea35edc691so1676930fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751458948; x=1752063748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1nwk8IyMWtkFl0V6iMZghwNPUspSshQHOECaZCfwyA=;
 b=wF8KOHabFEG9yww3ZFxr+gOZvlk7vmXq7YepvzL4b0H/ljc3dlz6Yt1wPskzDRGaTe
 O10uxpNjgnvOxUIdRmguKQhUYymMN27/ZG37Cj0jroCSJyCNhEJsNJoWkEtLxpQcS0oG
 zQJyp4e+jjnKuqOAr/YFe6llU1AC2DLHB6ro+YRq2y+o1aAIY1XWyomPrxOlztVpYgVl
 xxydlC1RPqYdLCL8XvolOWe+Lw11KVMf7NNR59lUZ8vMlTcCAsCPTtcnANL04vgYVrTL
 DrF7MpuOqTdvnD0QRgEss8YcBdFeonCfMSDm3dFbJB6oGpxoSOUf8faGMy72owOK675U
 QHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751458948; x=1752063748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1nwk8IyMWtkFl0V6iMZghwNPUspSshQHOECaZCfwyA=;
 b=JdBhaY6xF5DSpqjOgyIPA0VXRhWSKjWn9Sh0lKTkVbXgO2Ocv1nXBZTZMIrYoL2BO/
 1LklCUp2WZmxqXUShiCPOQlZGF5kXn8DpyaToQ7D/rVjrjrzuHFgrWPzqHXnZKGWPKw1
 ovkk/JJgoLgFLhkw1Hj4PtRfaSMo0UR3o/XxiUBYSj8euk5FFnm3mMj0dx0wjg73yms6
 saqmkrIE4pna+GwfYS4ETsHNYMxuaJ4SVbc9z8XIlFw/1UzEGHyjfD2qmEOronbK5Imh
 SR1XoBdjSM2mE9/w85pZeFiR26TgVlQW7oSlRLKllAGOyChi042HgrscL/PmsnowyfQT
 eeNQ==
X-Gm-Message-State: AOJu0YxGg+jBHFAI+25wxEHn571zCulcPRV3K+L4q2L6VU7/J6r2vfGC
 LULCx+/5/+eBL5Je5EF3roajcGnYqMKTHf219jNO8PbbKY63zN6P1ae2h94+s0Tqjfw=
X-Gm-Gg: ASbGncu7CqJos/0tYNfaJnulLDs+iu3cPdt/QGWnquVIsnZfD/1JPP906CI4m1VRNod
 A4ncv+VdVqu1t6vU3j4IvycU3/YXIzR9C1zDBrY5KmhoXAc8po37kpQ3bHM1qhnLibIWOFVr7Mq
 JXrzxgfvvy0iIrUZjciWctk4XJ4OvJMOoiAbxZljNxBEO/dgjTqZd+KKUCDJ0H+oqc+pIBEhdEX
 spkWMr3zOOdFcu6+Gyy6/dFmCv1c4grDrf3/Utn1hiCXre3Rx6OQIXxA7EVe4U/EY5+OX4BA88V
 CXf1oIjBjCyElxeTvtrqQsYBnKdu4yt74DN9dOkWevvgjgeexbHM8fLhoCGBOJHMZOnFaQ==
X-Received: by 2002:a05:6870:41d1:b0:2c2:27c8:5865 with SMTP id
 586e51a60fabf-2f5a8a420f8mr2143156fac.9.1751458947841; 
 Wed, 02 Jul 2025 05:22:27 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1bd3sm3785013fac.28.2025.07.02.05.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:22:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 10/10] target/arm: Remove CPUARMState.vfp.scratch
Date: Wed,  2 Jul 2025 06:22:13 -0600
Message-ID: <20250702122213.758588-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702122213.758588-1-richard.henderson@linaro.org>
References: <20250702122213.758588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: dm+WQm8kVcU/

The last use of this field was removed in b2fc7be972b9.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 302c24e232..15b47a5bfc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -668,9 +668,6 @@ typedef struct CPUArchState {
 
         uint32_t xregs[16];
 
-        /* Scratch space for aa32 neon expansion.  */
-        uint32_t scratch[8];
-
         /* There are a number of distinct float control structures. */
         float_status fp_status[FPST_COUNT];
 
-- 
2.43.0

