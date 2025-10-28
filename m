Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21338CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:21:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd54-0003Zp-GA; Tue, 28 Oct 2025 02:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd52-0003Y6-Jk
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:21:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd4z-0008ET-Fx
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:21:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so55360395e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632471; x=1762237271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0jmLQ7xJcwtr4+38+nkD40sCiXmWSUTp82bWsui4GQ=;
 b=Tk9KW/y6dqm/AKrQZxhfy5YYh1jLkDHejBCiLDXO3vdPmUK1Y+8i5kE9w4HU0f/MTT
 RBZKZONHVK+Zw2Y7MOdMzU0h1rAH65Nsek01h2GHgjLU9vDn3xLoV1PKMxwuTjM2n8R3
 0SsVQwvJ7XsrYWR4E6fNjKa9jUpxcGgZaeVn3oD7G/hfwVAlT/EetKEPRTLVQI8OwnUT
 7VV9vv4D6q8bz84K00ekua96LYkIDYFuroQxlliLeVubnhLWVMa78gbrpIu8mSLjFBrs
 fRIxRpn91MrhKHJrx0GtqpoqZHWKmUjLhurYaL93BaPTYJkbqHKuETdNTDkewpKWBZjB
 XFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632471; x=1762237271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0jmLQ7xJcwtr4+38+nkD40sCiXmWSUTp82bWsui4GQ=;
 b=VA+qrOyybFT/b13vDzPTJVJKPfLTVL12Iupv479QHkFzlUpiPnvtqQyz8f/5Xk4WnV
 //4T2utyX6umMJQulYz7qNUTzFE6tVUxIJEr1KBZqT9ZdLgjjhy9El6YESFdvnymDqwL
 quN60zlOVJp1si1ynt03GbWYCqGks6U7oRVb4wd8eVvFqlWtsqVZCusr9c54jY6PI8Qi
 5wIDDzDMT6w934W4RH9ze7WCBi9w56rce4QBtlzwBU5LLq2P3Zd3IJoAmQhHDDi9Y3Wo
 +QlIS8Y4UN4QDZ0uD9jIyKNcQ0KtW0j/zAG2MgovvDo7KSa2dtFaVvVOfg6yxp8apvM1
 IrRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLnDHHAdVlXU4kB44I1CiWsdxSmN6dk3KZkpJfYyM7UYxoJ4/HbFe0Z3KNV36EfNwixd2m6SpvEA==@nongnu.org
X-Gm-Message-State: AOJu0YyhxWeJVFEg+bfK97IzhMwdtp+GOUdxfokS6zTiENdjkLPPxVIu
 dpGttGLZlilJbZ+hnlH4Gk6FQsSdVFlRR1n9H+sbust/7iNSglQAkP8CLbT2ZG6kY6uaIoy+j8R
 M/x3pwm4=
X-Gm-Gg: ASbGncthYlOMY/UfYurfxoHLSGGcvyc18FlyZKK8/ZS98S8KKPG4sv5FDcDW7r2PuL8
 J0RUr6v5kI05+5URam72DXhiTLuM1YvJTisrF5vYDrde07+PUAxxMrRibe0jwVeNXVeys4Iqe9x
 SCS7VEf6FjEWg2D64Zl8oRK31DSzSiODN/mswlCl/xRStWnOle+KMhM7g9L0UQyl9Y3j7BBboiE
 x0OXxZWL/+fOooZpjx159IbAtBd45viFfRzSWVhr04nWYmg8QH5RWuRSgYuW9jnzKGZ8FBQIb8L
 4281VSBd3KBDZmZNCgy0P3NM0QpRFVInPVR8Mf87Cvh0t6HsxL6gri6xyKCQy/Sw7+/ha9L2lUl
 e+064Mln1SyYJFJzA3xMo2Hw80UMM3GkXdYuoCrEK7cfI1g1prgtxTo8jFhWAMsafJ+iA3Khuzc
 6SMPg4RcrHHlYAJUBsC5mnWH+0BO6aAAzbQgfD5TwRRO3quaFtReiYoeMSLe4J9pNizQ==
X-Google-Smtp-Source: AGHT+IHhajkNrNNZVimRegSS7TPNdkf/SoG/WZE/1rEfDevQN/sLYG4tDIlVIQKx4SRvLt9Dnryn4A==
X-Received: by 2002:a05:600c:8716:b0:476:84e9:b571 with SMTP id
 5b1f17b1804b1-47717dff8f1mr14761175e9.14.1761632470609; 
 Mon, 27 Oct 2025 23:21:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd48942dsm177891235e9.4.2025.10.27.23.21.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:21:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 54/59] target/arm/hvf: Flush vCPU registers once before
 vcpu_exec() loop
Date: Tue, 28 Oct 2025 06:42:30 +0100
Message-ID: <20251028054238.14949-55-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f5bab7e7213..cc02df2e907 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2015,6 +2015,7 @@ static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
 
 void hvf_arch_cpu_synchronize_pre_exec(CPUState *cpu)
 {
+    flush_cpu_state(cpu);
 }
 
 void hvf_arch_cpu_synchronize_post_exec(CPUState *cpu)
@@ -2030,8 +2031,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         return EXCP_HLT;
     }
 
-    flush_cpu_state(cpu);
-
     do {
         if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
             hvf_inject_interrupts(cpu)) {
-- 
2.51.0


