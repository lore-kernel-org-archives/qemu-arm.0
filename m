Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722763eji;
        Mon, 18 Dec 2023 03:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkh9wZs7uh2VTpd/eLuEO/ChyljGl8Vqj3F5yDNoW/ZqmmvfuA5b5MmSeNhSXNxJhjHdYW
X-Received: by 2002:a05:620a:838f:b0:77f:eca:34d4 with SMTP id pb15-20020a05620a838f00b0077f0eca34d4mr20540682qkn.99.1702899266794;
        Mon, 18 Dec 2023 03:34:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899266; cv=none;
        d=google.com; s=arc-20160816;
        b=jbvtkzkchkPwsp7Lui9HGkWRA/e2ImZsLWI2CQI+UrufZbKN4geArQjieR6neiTfeo
         45tcy5z7AK0/Eespc/iiHinPZRg3GiG4EJBpCovLMbLa8IkDf1QP2KkbbgbYDKlLsRnf
         dvAQ88bJqHog3qR1Ozcr2WodMK5I9VGvMomzKdpvPYUgSbRCfTFvTYuMpO+sE8e3x1HP
         eO//rFR+6QGZ7q0czjnJI/WtS11OmY1vWO/V7ZfBVeJEAC9maiHuwOk+YQKydYmhskdq
         IDvXcgaw/RZ+ddLHWzMIMU26OucTaEx4xECaq+kBuC+hNXfJGZsYiQmzyWuZTURO02M3
         Bvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O3/6wYv4hHy3/SVN/FzEmGqjPHnS90udBu+7RZANlgE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=FnSYqOkDIlkWd0/PS+lHxIIDiWfQEvDqlXUJhgkHbMehzj4/N5hwfxKzAs3dQg1hTA
         vORl5AJWFNOAYTwrB0mWrZ+YJHYY+PpXYS/dwAz4W4NVhxKATWeSyrf6fGPiCpM/JJf0
         5gP4npkH8J6OJuwiU9EDtx7COzuJbzlLGYSQeY/9TugWvV9mTt7t5KSt8kQhKugBTpBs
         vdJ1sNt00NfwOFXzJZEKpk7Y9y4owrwRw1NHIuqQfj1auqLDBDQt84u/KNnmEX650YO+
         IwkJsr0eunkUV5EIxSCCu4eQflOb243eznei2z73zE9BL38d+zXvs7QLaNaKlzLvWvtR
         ccCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LT0YULsW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a0bce00b00777754211a6si17050633qki.424.2023.12.18.03.34.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LT0YULsW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsB-0006iH-FQ; Mon, 18 Dec 2023 06:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs9-0006f8-Jb
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs3-0003Jx-9p
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c55872d80so21726685e9.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899193; x=1703503993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O3/6wYv4hHy3/SVN/FzEmGqjPHnS90udBu+7RZANlgE=;
 b=LT0YULsWsHv19LQp4YQGVpMxKj9IUSaser+QMmzXygofDvowlENUCZY9tXbgrtbJ7R
 iFBa8fqzEgNZXbs7sqrUZoqu8vHcDvhMzSAIYFpE653CBDviiw6GJ+eXjITjwB/wJEsO
 a654G7+gPBCAtLT5PPPu3wYS0jI79IYXQl3IVrQes7v0xzv9DgpbTlqMmNSkFUqOkmH4
 E56h7oSWnW8v3KmPZ+lDAtw2qj1XqSmpTQFGQcEeMQ0VwMM+TUXqygwjm53+KZIfnjf/
 gewOHfdROBaKHT9Tt4PzkLUlacNpWhDfvbMbxOTcvZjwTYLBfYcfWRd/2gswS45X70ux
 vI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899193; x=1703503993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O3/6wYv4hHy3/SVN/FzEmGqjPHnS90udBu+7RZANlgE=;
 b=d+9kyUXQUxW9a2rXeO99ynal0UMKHsfzYNvcp8/3f1GU/Am4YYhPZ0e3OiG+HQaf0s
 cQyl2ilRs6H9jK/UwmwL+GovBdGKPpFMV8OVfLCfUsS/6MDIbKF4h2MwNKe88nVE0Lmq
 oWPNGuMyvnhWVawicB3ShbbfuNIwhRFGclOq1czMfOrWwIJNLds0d2DUrWceC5V+qJQL
 VaHMRaLS7VjAQbY1/OU63TEs2edh8d22Ds18FPIEnutTpy2dyZmzdWX5ik/xXh1WcSyA
 RopnLTTG4jLiLIQBuy8b0Nf4207lJmD8D5X8/1M7WFuQo9QOvHP1Is5blP9cLTDi4eOE
 lXrQ==
X-Gm-Message-State: AOJu0Ywwo4FDZe8iFVo2UADw/l/IKU/qSYJSAfofIc1S/JG9mTAXyeWw
 qmpmfexOoX5truqOSekzJuhCctz2LnlyqN76qDM=
X-Received: by 2002:a05:600c:3107:b0:40c:2c65:a156 with SMTP id
 g7-20020a05600c310700b0040c2c65a156mr7538135wmo.6.1702899193699; 
 Mon, 18 Dec 2023 03:33:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/35] target/arm: Set SPSR_EL1.M correctly when nested virt
 is enabled
Date: Mon, 18 Dec 2023 11:32:45 +0000
Message-Id: <20231218113305.2511480-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: ZrVTqvHl/Zs3

FEAT_NV requires that when HCR_EL2.{NV,NV1} == {1,0} and an exception
is taken from EL1 to EL1 then the reported EL in SPSR_EL1.M should be
EL2, not EL1.  Implement this behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44005665d12..220ee64df0d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11327,6 +11327,12 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         old_mode = pstate_read(env);
         aarch64_save_sp(env, arm_current_el(env));
         env->elr_el[new_el] = env->pc;
+
+        if (cur_el == 1 && new_el == 1 &&
+            ((arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV)) {
+            /* I_ZJRNN: report EL2 in the SPSR by setting M[3:2] to 0b10 */
+            old_mode = deposit32(old_mode, 2, 2, 2);
+        }
     } else {
         old_mode = cpsr_read_for_spsr_elx(env);
         env->elr_el[new_el] = env->regs[15];
-- 
2.34.1

