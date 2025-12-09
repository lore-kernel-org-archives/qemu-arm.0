Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6557D3B7F8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 16:30:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vT0Zt-00064O-0w; Tue, 09 Dec 2025 11:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vT0Zp-00063L-8E
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 11:28:37 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vT0Zm-0001qZ-5y
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 11:28:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so55526025e9.2
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 08:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765297712; x=1765902512; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MkWeudNaF1+ueMET4K1nVx1b7yn/EBnoozPVJySp7c=;
 b=tiZgDmw0rOTOtUAOLgnMP6bFvSpAEN5DQ6grxa5DC09x3/mdgxwGShiwyJ6OOQp7VH
 X5Hb3IAZbe2kjd4YAwPMTOrc2Ht8ssFHGfpbv5ThqNSI1LmQ4+puMbFrIe1JxeSEJlf6
 1wmw9PpVjl5P9AxtKisHTh3DhlCdzr2FUqdBZ7hKWsQzQ+5J3jdRq9rNOchqzFIHfYiL
 kb4uH1MuafBFULTMmOMsAUZOAUwvCKBg31fYxbvmUeLUXetZiykcAIgWbjzUctnIkH+2
 KfQN140x0mrbYHUcwFZBURObMfN5WlnxI4r2MVUVg9KXa5pUUKV9gsQWf0mj6u/+qqFj
 1rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765297712; x=1765902512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9MkWeudNaF1+ueMET4K1nVx1b7yn/EBnoozPVJySp7c=;
 b=XWMyYnFt1mGKaTMYVq7pfTbdBe1yLnTJl/2DtIZZYBosTgjppg4rNWGTtDAbcBgx2Y
 1DCdTjBYCOb5X8XD0GxXxAD+xbDEdkgyK8Q5XFKAihQh+8IyB9Hypoas/gnxVJ/Ic+qa
 Ovpmjpe2JYExh3zLBiTzTfcDwQs28GGoVceFHZxvPmVY8A4sDva9XLAFd5ulm59j2+GW
 V7m1eiUKkoWQ+AsJX5TohkEJWJiOg992xp8iLD+x+Vilpxb0g2/0x7P5Z5JOc8qCnm0R
 vTQSN7RppnSw+a2krggvd3fhhH8KK3WU2FsTZYE+nPYqRz6NP9KOct7Ph9mTP3qJbJwA
 AG5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmDYnae+URx0ygIaZAoGzwXDt7dYqJokzYbw7pY5S7P2YwdoDNf1/BjSJvW+kYr7O/sCimZph6ZA==@nongnu.org
X-Gm-Message-State: AOJu0Yw+4Cxak4s3d5KAxt57TnOqHUg92I2bmz+eyuHLR1wcE1gwTbxa
 5Bgu47Yvr50Yh8NFAAOfe4G3B5w9mes4fH0usa6newFnlhv7FFEjVsN4CnjfbCGIOx4=
X-Gm-Gg: ASbGnctLIMoxAzoiucZRR2Ky1FjP2i9tTu43RZaxYfsjK0GQHBRM6T8vsMpiuvifwyF
 z6/oDO/2RQHRTMTJ84tHyc0KzR2mZfPlpB/VrTD1b0iY0q7bq8x9/a/f3CGO6siqetRMBMsB0IY
 NDOD0L5SBNEdKoYhoQkdAY34EJMC2M/wsjwMgi5r2n+MJzJoxkUdIZWs4rTNl117ZfBaIRuMEK2
 4MovGpzIJvWscHtXyRbycKcadg+CkQ4VvKbD0CqJTC3NKIDJCXlKKuCUObX11ObhPbqb8vtaCLS
 IpyEG95u+HpqbVMkPsOoMQ46TDK/sCgLcxYCZzyV6qVaz3lUTvVh1A1fH424wEhYXA7IoTKyVFC
 wukcm9z+B7Qg+pltvANO1qF1K8NxdH/oxPCGXy8bGBiP1DbpQawjulhMJY2ij0FuudZE2cax9tV
 mGZcWf2mdGGRs=
X-Google-Smtp-Source: AGHT+IGxj5qL4dAdq8gjsJooMyKaQa8qm0BY/qriP3S63OtC4Pz5SBwI8PRpXAYGaa5Z6m4qd1IeaQ==
X-Received: by 2002:a05:600c:a48:b0:479:2a0b:180d with SMTP id
 5b1f17b1804b1-47939dff030mr106092415e9.11.1765297711973; 
 Tue, 09 Dec 2025 08:28:31 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe90fdsm31011912f8f.3.2025.12.09.08.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 08:28:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DD1405F87A;
 Tue, 09 Dec 2025 16:28:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Stussak <christian.stussak@imaginary.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 1/4] Revert "target/arm: Re-use arm_is_psci_call() in HVF"
Date: Tue,  9 Dec 2025 16:28:26 +0000
Message-ID: <20251209162829.1328559-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209162829.1328559-1-alex.bennee@linaro.org>
References: <20251209162829.1328559-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This breaks a pure HVF (--disable-tcg) build because the fallback stub
will always report false.

This reverts commit 4695daacc068cd0aa9a91c0063c4f2a9ec9b7ba1.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Christian Stussak <christian.stussak@imaginary.org>
Message-ID: <20251209092459.1058313-2-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index de1e8fb8a05..70d34063df8 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1935,7 +1935,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
+        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
             /* Do NOT advance $pc for HVC */
             if (!hvf_handle_psci_call(cpu)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
@@ -1949,7 +1949,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
+        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
             /* Secure Monitor Call exception, we need to advance $pc */
             advance_pc = true;
 
-- 
2.47.3


