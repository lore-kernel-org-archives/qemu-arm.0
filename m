Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4416788njb;
        Wed, 11 Dec 2024 15:04:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLIusF0U8KcTQ4LaJoI5JzOahVOpq9iSFfbFTPN/lb6sNxx5I1MnbmrKgh0FRJKM2CK75SljJHWXvqow==@linaro.org
X-Google-Smtp-Source: AGHT+IGicSz11FFxMMp1hGWDsl7+GosaMoxN2JMg8NXW0kLInTpKfIQWs/oe1E9IAoDY1KuqoV4L
X-Received: by 2002:ac8:7dd0:0:b0:466:886f:377a with SMTP id d75a77b69052e-4679615b240mr23426351cf.3.1733958264233;
        Wed, 11 Dec 2024 15:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958264; cv=none;
        d=google.com; s=arc-20240605;
        b=LxhEKfpgyzp1E3BUSmXZuum+LWAHTouv3x8RfFigHktzr0eWHw+ECg1l1U5G0tiepF
         f1sqE6muIy8dQDthaFQp/HR3vYTBvi3pzzffv+h6I78MhHJbqhp18mf6AbQxzZ8HQCWe
         HqRMmKfWj8ZW9JdCI+Cvy8vJIgA454Cfugdz1okh6Thkxukp10qWbrHtAiEac7+MHTO3
         Nooff1RMt+B+ccch0j7UAn7IjuEUDdrpOT7cXDf6Q+vS8CiC/Gn+iSl1Ds3YD5sYWnnz
         o2Iq6ytx/dL5nWpeJpeVEV7ZmZlOBoWYHFQuV5MEGBkHku/vCIGsydaEJI1aRjP5W0bp
         GXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VCHSGNyFv8LSm9JlTuEHKD53SXdp1uauhC0W87/H+/o=;
        fh=/m1BVeexb1nMGRn/BAqFdLxskXv4B+Kjv6yFexkfkVs=;
        b=Nc2vnLp94U1uSB8NGWkzdgEmxGmRMYl07HSlm2TMRxAO4F7c3IqyD/vFJcVc0sUZlu
         oV8Wi8xK3cMGz33WOav+iWUD/RZ2YMoV58y4XLV7ruSdYDRKXFyMZOnFiyqLIJDeVReW
         RqbeEIz63AHJxyLAwVwPdXts9pF+NLyaqT+z8F6URgCzocPZGSx6bRCi8sSzz4rEygHj
         JzG/nVN0+XGCRDm9pW8Zq66RbtegWBe+00aR4RYuqpL/1N6ITkvyiH+9zTJIFarxpKr+
         Yk7/W05192kF2mpDIU4jMcH/aj4RkuaKFHpfjiIE/2JC6WqXdOKvLOj1hMbjnDbdKNH4
         bKPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YywzPHbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4677774ca4bsi65889391cf.284.2024.12.11.15.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YywzPHbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVkh-0002ty-3C; Wed, 11 Dec 2024 18:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkf-0002sz-1v
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkd-0001xl-MP
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso6022514f8f.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958254; x=1734563054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCHSGNyFv8LSm9JlTuEHKD53SXdp1uauhC0W87/H+/o=;
 b=YywzPHbWUWQp+LriOA1CcyVn2HTyfr2hPLLOv8gtwPo1GCVfVn15ZM0fjBtpQsl4Rf
 CFVhPETVF5/EJHfjaHmlmx6IxJO2QqTUXj+AChr8oscMXJCLV2UHthyvL2ifbSOmaZrH
 qK1OsWkF+3mTocxJQpLBoZ0QF/UYZJsEwg5alQA6/msC9EPFS/zpm7vvZilPhjJPmS3i
 LEOYYTLT2GiI7htjI7Ab0SBgzBHNUDBIECHFf3z9p6vZt1nMEYEZ17BYng7HSaXvsB33
 HdMUio5oAKzcU+TF3EAGvJMF84c33J1yFTDiM9j/7IZJ4kSuxrHbWMbvUEWZY4gxnbFP
 vqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958254; x=1734563054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VCHSGNyFv8LSm9JlTuEHKD53SXdp1uauhC0W87/H+/o=;
 b=EHQw4IhrTmn1BzhvRrCuLGH46r9oxnpsaIf2pQ+xiQs2LRdl9SzO9xVLLP/hRcD+Li
 gqXwBpUes+s3G4C0jQzU/Wyjg5yUQCxfE7yqmgbz89y7jFSMVD0wcbS7ZKauI5Zsj02M
 jL5r682JpYJbGoPy4bjTBe37mXKqMFjpNU/UNKe+EZ5AUk58yRN/VoAR6zxeZt+kAQ9f
 0AbAkumX8ulAMHqa/9mQ32NRD4waVDeqdcQmEoaWCxj45sODmThsQEE0nSUlpOhVH5tH
 FOHFrSM+erzobca2o2KtXBBHnrloWmcAE2APC1Nd0msw6kmwr8Gvhxeeb2oYNcuK/3ul
 n9uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX59KvUFCF7a5FpOfQnIxzjyjRrKoWAQHgTq6w7eF+P/U0TqhvW1tpcJesXUbAEJsgtORMSzoL/A==@nongnu.org
X-Gm-Message-State: AOJu0YzcFE/EE56Cb3e0J+kVlztQB1MTknOg9djAteTC0SJALYwUWRia
 eJfx4s0lnVqdDP6IHBOUv8xxMrnWe9bCrXIuUHdBx0D8I0xAMY9cA/OClqz79tE=
X-Gm-Gg: ASbGncvv/CtUSaIg3dBkR438cBlSxIzVFrZgOIQLxymWBlk/kLnpshwIwORaKvUrCPR
 8jHx0qd+HS+b42JUT4Lk3NU/K6defxFNiqpJQG/k4/ZcJqWvr+luCBUmd59qHYfGEfH0KK97auK
 VaKzqNPV4ftmjxqp2QqshegraMS1kjQ1Z/kCaxKmuocZfJFyXjm2sFFuLtcvjmLC3+j9urgEvdo
 NVsgpjLd/TbKOavcBSLMvz7yjW703D4LgzDgWDcYMpM1r6icvaDzTfr6r3kvxDQ3EprqARdikpe
 l3y5dip30HtUVxfco8Tz7iIAr/17nPpLBQ==
X-Received: by 2002:a5d:598c:0:b0:385:ebaf:3824 with SMTP id
 ffacd0b85a97d-3864cea38edmr4351410f8f.27.1733958254128; 
 Wed, 11 Dec 2024 15:04:14 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-435aab63baesm62036735e9.38.2024.12.11.15.04.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/9] accel/tcg: Include missing 'exec/tswap.h' header in
 translator.c
Date: Thu, 12 Dec 2024 00:03:51 +0100
Message-ID: <20241211230357.97036-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: FOpVmZ63HDDF

translator.c indirectly gets "exec/tswap.h" declarations via
"exec/cpu-all.h". Include it directly to be able to remove the
former from the latter, otherwise we get:

  accel/tcg/translator.c:433:15: error: call to undeclared function 'tswap16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    433 |         tgt = tswap16(raw);
        |               ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/translator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index cbad00a5172..ff5dabc9014 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -15,6 +15,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/plugin-gen.h"
 #include "exec/cpu_ldst.h"
+#include "exec/tswap.h"
 #include "tcg/tcg-op-common.h"
 #include "internal-target.h"
 #include "disas/disas.h"
-- 
2.45.2

