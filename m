Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5198981lfh;
        Thu, 2 Jun 2022 14:56:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyarMNz/DcFSniBI4Wmfp/puqzP/6BVhRRAqUdAhhF/ELjDwf7zQ2DtsWWgcVm4GlFNVFxM
X-Received: by 2002:a05:622a:1981:b0:304:d8c9:3d98 with SMTP id u1-20020a05622a198100b00304d8c93d98mr2806549qtc.254.1654207013590;
        Thu, 02 Jun 2022 14:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207013; cv=none;
        d=google.com; s=arc-20160816;
        b=mB1AkY/ff4hkI4j4WZMJ6Tz+/uHgm49elHwdDMUEuoIJoRuyqgIgV1WdAgWEvYKgET
         v5Q0A89Ys/W4fI7wey9GQ9TEaaoVT8zHNimk6AuEZAh59N51jJSjRZsE7sc02f9mfpnx
         RERzXQvZl8Z5e+r2GuOrrsbjqP7S09P0IG+HVxfeylVQK5s7eEHckjejs9BVwohrC3QR
         wtCC5tgs2il3FJZwksRJOkT7p0W67Sim7ds/a6V+Df5zeP2fIe2SPEQip/cq9Pa6SC5v
         BrIOON9svGSSF1ObSK4XqYtCvKHvnvryAF4NWb660a8YERR/zEidvU4WKcPh5vsEGJ6E
         XOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
        b=sCwQPB4/F1857cpchul5bNw8dOYdBGWbbCiFTjpTCegUfu2lw4D0FiI4dL3VLfME/v
         YorbwCYdrOfHJaZQSwjOEQogPDMfWQaAzqJ/z65HyXCs+dO3m9mK0d4v0qEOnYoTnLcF
         gzAcrA1Ju05bEj42tmpsRCgIxqk3b0FiETzS1Z/rSvIvKGnQF4EVGAWYaCe+ylVTP2FF
         HbMrWF325gpwZJkcBEtPkeaO+5r4qA3dVQfWzuw3gMJ6JTj6zb8a5cuEjVRJXapgA419
         u+PLiwOgYVIzz7H3Qp9CqLlaLyzquSpSHjsiVhn8okz0efx2+hxTqPUyUQiie5Y1hlIU
         wScw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bywEvkmn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020ac85b88000000b002fcc569f050si2774774qta.731.2022.06.02.14.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bywEvkmn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsoH-00059s-1z
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgl-0004ag-1Q
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:07 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgi-0008WT-J9
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:06 -0400
Received: by mail-pg1-x529.google.com with SMTP id x12so5785239pgj.7
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=bywEvkmnIb7r7ZyRdZI97F7nc/D52jZRCdOtDo6VwfxJrbCe1kBxIg8dYCSiI5CXcr
 RfdnG0flMby4SkyKS/d8FYOalskgszDFWbv+OeQHNE8vXYRB/q6Q3UNoCgUY9EqmwBIG
 lLU0rZaFk58qNMNQMZJfvDb+bXwnhg6ijKs6FidUiL/MDb0RQn5q432DjvKz+7eINLzy
 IUVaExTTYxUdgVDhZ4E/jvap0NuWA1RmIiYVZElJadWbr1FAGg1mXDpsKXoCm5S7eXUs
 doTipSrO2Hp/NIehwvlOGatB27eeC34fJEO6fC+aKlfHLlqRJow7bSrlpBUtQhEzvbly
 cHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=fKiKCx90XCUXHzgzyYHIZxRYJAXFQV1QTok+o2o8Ya4jhwOsOLU9lgOXO4Ko8fpf92
 PXygYs1mEYth2h270DY24si+/oLGajkGaT8BF5YO20yQ5Ukqyl4KsGSV2GTW7A2h9MP1
 E25nxAPYcARbIxbv2iwW5V4BTKHdu82fPctAzsHx7ow7guQEChMCmw7e66XyALZsO9xd
 ErhR/MbyJgBNs//jdgugTiK8xUWvkVTbss7dqpZg/MObArjQZLoS5W+7AMAMYgXTrf8R
 D60L57cDngf1nt69trzBh6eBCwHYlIyA0CFWCWf/Ejs+/Iq66/iycR3Z1YitZnhHTHo1
 C7Bw==
X-Gm-Message-State: AOAM533NOSc04WugrrWYRtoT86NEel/vueFmK9zg+Z34vtkwNcuSUSCx
 Irx+5Yb6FrX42QsT/cr492hJWA==
X-Received: by 2002:a63:44b:0:b0:3fc:cd1c:49e8 with SMTP id
 72-20020a63044b000000b003fccd1c49e8mr6061503pge.172.1654206542235; 
 Thu, 02 Jun 2022 14:49:02 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/71] target/arm: Do not use aarch64_sve_zcr_get_valid_len in
 reset
Date: Thu,  2 Jun 2022 14:47:51 -0700
Message-Id: <20220602214853.496211-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qav9MM7PzU0x

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1

