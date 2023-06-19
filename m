Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2884720ejt;
        Mon, 19 Jun 2023 08:59:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SA/G9aIVqKEBotDiCOwWIKd91jE6eZsWtHuaiC7Q4/nSAenUxdW9SoC5JiRNuJI0f59jp
X-Received: by 2002:a05:620a:29c8:b0:75b:23a0:e7ea with SMTP id s8-20020a05620a29c800b0075b23a0e7eamr13114305qkp.75.1687190385436;
        Mon, 19 Jun 2023 08:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190385; cv=none;
        d=google.com; s=arc-20160816;
        b=kwOvEtPPeC4v5x8b7+abCvqLVj1GZoFBwYK/ULCjLjVq4+nSa0QWwvSTm+lIqc0uDx
         9nJVDGjZ94PFcPlCepmDiMn0634sZXRUsXksWFyaoUyBu9jlhNw4t6ntBMf0FjakgtlK
         OEHPRAsBAZ6BmtZpOzQ6IECU7AjPdlyDQeQ/RIaxnI5+YheetOCsrQO8X4N9qHmyFIQA
         xFkU9GKgFyRfB1PP62h8ZZt/Oh5QTi8dCNWjGBc0F76ozEZQvtLbUJ8GnjL2H+jFrKnb
         oVeR8pJnXxAbg952o83eIyB3vw3xOkuHcNBtaqI2ctmZSxb7qTVdzkQdk/snOyIjFoOD
         m3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TyRRQl63EjUwf6nuHb///9HEwrhn3HTdxj4GOGWSaio=;
        b=e0r3nPtDgIMjg4oUWPyUWJp+lnrQIDC1yHXcMCgz4lyEOh2x4wnCmPzRxe/GFNaZMn
         XWWgYLLYaRmpFgFScPrj8owZTcxAhUXdx1ZgA8VIh2CpJp7lUYlWWU14MrpKIbliiRBb
         96vk5JO/z4QOkaM0J9ivreHXLYJlGtCekHrALcV1LTCOmzVDAnBfCsWVwsJWyoNCpyMr
         aF+RfvWzdFdCi8Np20GUeJFodnp61QIePJp+W2NMmJzeK4goPsrdJEhIzPopIWpZNuYr
         Z569+IkYiQ9H9Pw1VcBblrk7nzJB2Vjb5rBIQGwBXHrl3W9Yv2yFmH7xiGUaqPfNqRMY
         cWFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6S2zwWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tc10-20020a05620a2cca00b00763a0571c9esi50994qkn.566.2023.06.19.08.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6S2zwWW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHGO-0001rN-CP; Mon, 19 Jun 2023 11:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFq-0000cJ-6M
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:26 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHFj-0005Fd-38
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-988883b0d8fso246782066b.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190233; x=1689782233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyRRQl63EjUwf6nuHb///9HEwrhn3HTdxj4GOGWSaio=;
 b=f6S2zwWWAF3t1VnoQDeiBA9YlPUEUuXhyaiTrXI/3rO3gJJ4guVLEpekLkCJCemuk9
 dwjRdbCy98pxzlUPgodmMxn79cy788qEA2PugNp/zT4kwepzxvaN1bxOxrrZDBHVtAVP
 ngcEk66/HIU5pZEf0z3paxbRoq8a81rJo3MQCF5CQBgLDEu/Bi7TUpAYshA+2RKEQeo2
 3af925cGoSm4/VUu+oSJjteibsAk6ZhANI94WobQIflnV8tMyt83XnnVi4pbiIDG+ny0
 WgI1xgCJPsFMMqfvRovxYtyn2d1KfogGANSX2i0aqWf4lHIpyl3CGBqPpRO2PaM1QkfU
 hEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190233; x=1689782233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyRRQl63EjUwf6nuHb///9HEwrhn3HTdxj4GOGWSaio=;
 b=RqR70dU/D/pLDj2+zDfXCQInim30GZoLwtjCKK56dLz7vhnGXwP7bJQLvkAwAZcqdA
 0blrvREmS4TLHBf53bigDejb+QNiWrcdB278hNkxZWhGlkGW9xw+21IJ2FQDxymZvrSn
 OEDTh8tK0vhxEo+6+yoccUunwJ4Tm7sZNIzq73YaFv+KpGoNGDv90Z7rndesY0vq/DdJ
 I/aQd3efHlwcWz1kvWMI50DrC3QiSS8kuKUXASYE2raAjHwMDNkxfQZfkc4OKN3bw28i
 9L+AjmeD57dbmdYtYFxZtHj1LdsOrI5cao2Rdz0OHCaWKR6Sea2w2UrlMSIf9y9xDbeH
 S79w==
X-Gm-Message-State: AC+VfDyPjeV9ba4GjA0mo5QZ2dmHkZX4QK0RCUAODUa6OnGKkOW20/jq
 4TGRhBYt9PlupvBZjRNuFIvXnw==
X-Received: by 2002:a17:906:730c:b0:988:9b29:5653 with SMTP id
 di12-20020a170906730c00b009889b295653mr3281223ejc.77.1687190233704; 
 Mon, 19 Jun 2023 08:57:13 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 u15-20020a170906068f00b009886aaeb722sm2632724ejb.137.2023.06.19.08.57.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:57:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 28/34] target/arm/tcg: Move v8m_stackcheck() from
 op_helper.c to m_helper.c
Date: Mon, 19 Jun 2023 17:55:04 +0200
Message-Id: <20230619155510.80991-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: WuY0KHjIaTyv

No need to have the v8m_stackcheck() helper in the generic
op_helper.c, move it with the rest of the M-profile helpers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/m_helper.c  | 16 ++++++++++++++++
 target/arm/tcg/op_helper.c | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 0891acc29c..0780bb3dea 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -2893,3 +2893,19 @@ uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
         }
     }
 }
+
+void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
+{
+    /*
+     * Perform the v8M stack limit check for SP updates from translated code,
+     * raising an exception if the limit is breached.
+     */
+    if (newvalue < v7m_sp_limit(env)) {
+        /*
+         * Stack limit exceptions are a rare case, so rather than syncing
+         * PC/condbits before the call, we use raise_exception_ra() so
+         * that cpu_restore_state() will sort them out.
+         */
+        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
+    }
+}
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 70a9c37b74..04a90e3e3a 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -82,22 +82,6 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
-{
-    /*
-     * Perform the v8M stack limit check for SP updates from translated code,
-     * raising an exception if the limit is breached.
-     */
-    if (newvalue < v7m_sp_limit(env)) {
-        /*
-         * Stack limit exceptions are a rare case, so rather than syncing
-         * PC/condbits before the call, we use raise_exception_ra() so
-         * that cpu_restore_state() will sort them out.
-         */
-        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
-    }
-}
-
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
-- 
2.38.1

