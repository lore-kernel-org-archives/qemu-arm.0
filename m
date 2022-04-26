Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp366999lfu;
        Tue, 26 Apr 2022 09:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtdYmHqP5m/D9OOZSppPAKre2pEdO0GU3f8QPqZyStkwgST7CvtC9br6ZXNKBdJbKeMkoU
X-Received: by 2002:a5b:610:0:b0:648:4f94:c5c8 with SMTP id d16-20020a5b0610000000b006484f94c5c8mr11100123ybq.159.1650991700981;
        Tue, 26 Apr 2022 09:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991700; cv=none;
        d=google.com; s=arc-20160816;
        b=s/lgNs/g/wFanLbaeHiuuMsj7We528dNkPOt2t3qNDPlyx6gR+IlkM8hlMYucZXtiC
         iih0HE4GA6D8L9Hr53+MfKScLUnQSb7N6SlY8WiYQs+3/99aXt+8wHhMl06PSCZ4/pcL
         QbyT67C5N4I6VYAagStiUWtnY0Qa4VM9J/5OiTAnAYkJzAZ+k5rvmuBZswQtMV3vXnvj
         cZSDLxuM36sP8VSog5L+k/SFrIFYvgH/UdijuQ2bHUHNJ9TW5snvfk1ab/E6LkViQjyO
         Sx99E0rSl85l/fCLvR4ZFsd372SSjIn3ctllk4eHQN3cStn/t+Es6CRyjN76flMcZaoa
         hQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jXIwkULLtYjwWB5mFtKYDvoLy2jORO/B+nK9qMPIgn4=;
        b=xWu/K7oB3cZ4Kd/FUJKvRx0lP9hNxff56hWGMl5ViHtJJJa0dnDQajTL/pyR3b/9Wp
         hOzmukX0uNia75Jc5cyovsHixQvLPHrF9mo2yC1kP8xEuWf0MOwpZjGt27LZ8/RC/4WC
         +WsMyyXBm0nSnN3hBUGysshn2BVN54x2XL+FXQb9Ji5u2GPWGoqDNLR5EGIOCBahc7bo
         5KSZIvNVbUunAmb/B1jbEzWCoFBckAlOFd8FC8wGUhNldRUaN6tK8NvLQ+LSFquauZLE
         BItToNxoDEzBVzXUnusUeUjLx31YmoTlPZ7AjAY3u6C53rF5gfnyD+s/wW5H+CvcZku4
         tT1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AkGzlSGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z123-20020a0df081000000b002f1911903cesi14175246ywe.20.2022.04.26.09.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AkGzlSGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOMO-0004fi-D5
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO63-0003BI-AN
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:39 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-0003yj-5r
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:25 -0400
Received: by mail-pg1-x52f.google.com with SMTP id bg9so16479339pgb.9
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXIwkULLtYjwWB5mFtKYDvoLy2jORO/B+nK9qMPIgn4=;
 b=AkGzlSGRdiI8w8LDdwpf3Hy7O6+ahwsuolzdl/QMo17NPsAYbmaYf15o8YGl0JSdw+
 guxcg5FqYC7TV26gNC9aBtZkNhuhmUB4nHUaRZ+W5zQPVHpd8A4O9M0XpnWHOvr0J5Gj
 tBG2uriwZYbP/h+Zpn/VQfcPTsk1YqlpYTFqyrf/k91/flg8OjCSUGklyq6AZQfNotuN
 1GtCskwkT0RCUY8VJwQauRfQT5EjLoVpuBoFqxmo4pVOqY2MMDOCo3Qljr5bisIqQayk
 UG3iF4cg+qn10uVNR5y06EmUWmV59GXC4zD//RSQF9Fj6N6zW8ESxKsXLpn/wJZOvgz+
 cvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXIwkULLtYjwWB5mFtKYDvoLy2jORO/B+nK9qMPIgn4=;
 b=4Cc12+4snc0fmY1sOAvNsRg03aA4ft22fNGjkR5bDd2bxWtt/QxrtmGfBVBf0LSVlq
 jnhNhPFrTgyURR7OqH6cXsMLAhg9KewqIPQ3t0VIybN2lsKhivrl76qqxn7hWyr4P57o
 xsCGE4oleNtPMI+iPdUa8UjxITWFVdeYkEVLw2Z1niIFnT0xUVpUx8d8x5HkbCobGV71
 Hl8Trc4+hDMoJof/pqQC6xAJBMwgLtmna+um1+wdZdKJ/x9ngsE7V5mV3Sb+IV5+8Ck3
 cLIgOb8IaYe8OGCTC4JSuI4imU8+Tls2xoXNKSFt/dOyy+CqZAK14RSiRWeSVoYe50D3
 d6nQ==
X-Gm-Message-State: AOAM532laNiEJ5n5Ua/eSSi+D4oCwUnWRXS5Gn6xorSYSuVPuHX3B8L+
 977jHkTBecQ5i7tETa8+pRyvAO4k5M2X+A==
X-Received: by 2002:a63:2acd:0:b0:3aa:86eb:3dc with SMTP id
 q196-20020a632acd000000b003aa86eb03dcmr20090038pgq.441.1650990681104; 
 Tue, 26 Apr 2022 09:31:21 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/47] target/arm: Use tcg_constant in {incr, wrap}_last_active
Date: Tue, 26 Apr 2022 09:30:35 -0700
Message-Id: <20220426163043.100432-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMX2huWDRFso

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ef57d3a2b4..c3d3f301c9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2793,11 +2793,9 @@ static void incr_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz);
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz);
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_GEU, last, last, max, zero, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
@@ -2809,11 +2807,9 @@ static void wrap_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz - (1 << esz));
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz - (1 << esz));
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, last, last, zero, max, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
-- 
2.34.1

