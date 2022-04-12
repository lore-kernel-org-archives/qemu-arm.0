Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2011201lfq;
        Mon, 11 Apr 2022 17:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxclnKyYUpTXnCALWgILiEkfSGH2dbk8MMnxMRJb2+xmHfEl5YguiLSt8Wk3NUZMTmZTWN+
X-Received: by 2002:a5b:402:0:b0:63d:4a05:29b with SMTP id m2-20020a5b0402000000b0063d4a05029bmr23676726ybp.619.1649724616981;
        Mon, 11 Apr 2022 17:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724616; cv=none;
        d=google.com; s=arc-20160816;
        b=G+lUEwZ1sCOEN803QgLYVY9Xy9CqgksWiIu/sHlwvD6iTn2riGRjkenqXXR7EGrLg8
         8IkfT70wHrs/jXDHYwEnJerQE/2i79UkawpfgaGzL53ERd3+IIvz6ZihWdDtIC/OXQpw
         Unjrh2vxIyu6Q0ZVOqHvuNPfQkaqiT7xM9Ks31ZSdnaCkt+QFdO5zUpD8wJxCwiRkksC
         qHmxOW1LDqzbeVlGPcIM+zCOymxa7k+iLUfukebXpYHmler2gpa9bbcHnUNDAw/sSOMM
         ILcwHxheok0xYQ7wqAsX0I6VWgWzQsqPkrb0wKrA/EZGcCu6SKZIytcJp9k3OEPHrcPA
         y9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Bp2AEYW6PnMq5QzYwmOeueQXF8b6aBC6y++J377950=;
        b=XdF9b/VY+Jf4f74fATxuWKn/C8accpR9Y1cDiQcAgV9LDlTQQ640aRo7e8txj4BURA
         40x7KbDXZuHNtDpG+QmImo7jGh2msYiCoxh0jGheP813g1yqRHi8NPsLJdQzTjugOhwp
         zeWG5/jO7W+FFqXNjGrBK4931OLDVuEFjT8UCBjhsArgQBQeQVkCJQjxdruJG4Wyd3If
         miOotFhqKW2EGGlYIW4fRh4OnNd/uyuDi0TQN3dh3mCIEgAC0Mi53gxwB9E63ZIHXLn8
         a9XWt4KkkRYiAlgeG3+5dnbmlq3KBiVhZadkMgNu7hJyQHFOs7x6l0SJh23w4os3s11/
         2WJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="uYd/ckj2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020a0dfa04000000b002eb899b8002si5032629ywf.497.2022.04.11.17.50.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="uYd/ckj2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4jY-00022L-AK
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Th-0001xn-H6
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:54 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Te-0001tV-IV
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id 66so15606608pga.12
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Bp2AEYW6PnMq5QzYwmOeueQXF8b6aBC6y++J377950=;
 b=uYd/ckj2P59vXk7M5UnUbi9bbrNaAmc+2Z+/zJa5vc9gKdadjBOr5XtGvn3fDpObGj
 2HFTUN+4ArnshAt4lYrRrn1gy1Pg8+5W0Hs2bJoOVgsOEDZH1UWbABfjXSdbpJ0S5Hu4
 hJR2GbDWXJdTMDAmV5x5wNrhBQzivevpzjEoMZbPAYYbVFmLkkC3GosstbVeftmWvW8G
 ugSFWMXMwbk6qsF8N+p7hJgiCjnDWYh6V5yb57eXnsuqhB5QYRGfF+j4E42/tsin/2SC
 cYd9btq7tErbUvKnjXY8L1zT71YGGj3vsplgPnLQCE8UryvaMp7UIp21Ik6gZc/5ojUB
 x67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Bp2AEYW6PnMq5QzYwmOeueQXF8b6aBC6y++J377950=;
 b=fp1o+kEK8+z09U3vFqv4EbAHRSD4ox+hA2+THxjd/LxXYGzXZ9jiVWtn2sd43I6tEf
 JO4Kx+p7lEb8Cb34X/DL9dGkGi8DPIgLa5ZXwRMQWNPe97ikR+vHQFlBQV0VbRxsnrRe
 EiVQn0LMJQmEfWs471ikagF5PcbNMb+xTX32kJTLn9R9eQRso0FzuVYd74XTDvyp9HC2
 mD1UrPAU+8LammWM+KbnTtWhmmjj0rUJyM2Q82qD+nmSYbldbB6WI1k/I66feUzXlesJ
 Oy8fh9PqzBKbG1s+N8XcNIko6S96gsKyHAl8YoTBy8IPd9zxhxrUTEaSCkGEoRww4IXk
 9bLw==
X-Gm-Message-State: AOAM533VOTiNdD2IE1bQwGdfDvauuGBzeWqSwvFESuNPVDfqEJhcz7/t
 U0+KvfR2qcHw2zT5sQMf/k2vJQ==
X-Received: by 2002:a05:6a00:a26:b0:4fd:f9dd:549c with SMTP id
 p38-20020a056a000a2600b004fdf9dd549cmr35308176pfh.42.1649723626814; 
 Mon, 11 Apr 2022 17:33:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Mon, 11 Apr 2022 17:33:23 -0700
Message-Id: <20220412003326.588530-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e6tHIHCrxzhL

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index aebe3be1ba..f75f0fc110 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 98fc3ace1f..2b6b9afd76 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 7775a84575..2592d7008a 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -73,6 +73,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1

