Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A28ED1171E
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 17:52:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQUXq-0000jt-Un; Tue, 02 Dec 2025 12:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQUXY-0000fb-VI
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 12:51:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQUXW-0001Vd-SV
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 12:51:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso24777665e9.2
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 09:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764697908; x=1765302708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nNAKiD2KFQe7dDwm1ph5n7Eqp+TtKu8jd1cW1u/1N9k=;
 b=elMwHUQRmOaaQGRtsphMqmQhedC2JfTcOK35Gxn8W+6V6g+Yb0yBXUrFi7BqpXDNGw
 wMzqtlG+rpnvwErmnLUXIU1L1dZzHYmqOBMrypsaixOksWTVb8C3pTcHUe/bLyU4Rpue
 +vxdt0mnbC0eK4SX5BYicbCZN0OFoM9zNeB0Y2k+hj5MIA4GDzxxeDDV8hLUghzVtQs0
 PsrG3pqp7u1sxFAflqAUvX2FByYHF2zqhH/1JvjEP0uDjZHakPMnM6Yia0ih91E83OIt
 KQSij64XZR5kqD7TBfDqDT6CTCJzlX0Qh8sdHMAmH1U9PYR/133kCT9zKevbrgeAD111
 sxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764697908; x=1765302708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNAKiD2KFQe7dDwm1ph5n7Eqp+TtKu8jd1cW1u/1N9k=;
 b=AXsc//dOTUTmoz5O23+FmoY2hnSBYb8bzj4YgmHyYOHlAK5blvUysSpaM5AfRMa5Fx
 ETfpVccf6KgqXrmkPd7Y8eXZhJC8lfgJQ9GFBBoYu6lZlIgDYHH4EZ1u1O8F/luEg6Vk
 pD3mDPZ5LFkoHsVMnNldbmbW+eJt9NkbNmh8IO9LGW1IaeX4P9hLjTHwaYrXBU9pZ3MM
 JMzw2nOVkXot7Cs2VUv4OqrJZ2HQgdj5ZK1mtE9mApC48CtT1xUie35UaAqerTUQP1Px
 VOsGe60q1B1J8HjEi+kl1gGX+rfk9OXjhUMoAGpiOtI4YpAsOd8MJX4E4ZwjLD1sWtt4
 Om4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuVcaoOZu+hlMv9FtG+swF9sq46hPXDqbSdU2P0gZaGLiI4ySOZ9otchnBWMw1wTP3bPGKwZbPlw==@nongnu.org
X-Gm-Message-State: AOJu0YyuNLgI+erQqryfx0LdA4V76uB3aD5wL/lWCAWn0vgCoDQThxx8
 ZSVai8rt1pCE7CSaHF4TnjUHYPmDscwAiVJf6MmJU3VWS+yHaPaYvZAfZuG5YVV+9Cs=
X-Gm-Gg: ASbGncsj6Xdt4OYcEeus9f0VxaVp593ovQ/9pH5sswObRwJ3+Oy64UKmkDer1pP/3a2
 EgvL4Elm0ngNcnK2mVKeBvBXUyv2VkX9LM4cTMCnf71mgTD43BhhhtZ/zgBYKX6kRdOKuNZyaCs
 aHps47bnSSzATsVtHlzzzKYqQKbhfldVVyxo12Bz16y9Guz6NwCV6Ksj76ltNAw9z3AyoHm9RNn
 0avmd36SLzfQB09xxIbTBjRMPUqicfQt+a1RGr/BnvtA941eLEjp5559GGz+e1Vp7IvJ4r+Ug+v
 5rcSMlFSJo7lwbTXsBYs0PH9OLNAbiOgBtD7nidMgkGrFLKCKFLxlPPktDpi4zvLxYejF0kB4p7
 Xxc1W/mNdY/jBw2KjxXl5yhbbUCUc9apC6WUvogqn9nCzyamJImv4p/11a+381NFVf67zm8mnwQ
 hD6tettZpUSAjtrn7bXuOPpCEBaGIQUdPWpl+do2i2D2uCELDwJUCd8UE/l5FPP3fx5wlX+Qs=
X-Google-Smtp-Source: AGHT+IGQWZrnhCXRrCNucUhJWFiPNs+g4YtJpn+pbgmUbfXkiD1t5XGrcULpcuYd3hQi9/Yd/6veiw==
X-Received: by 2002:a05:600c:1d0e:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-477c01c4d79mr401104005e9.27.1764697908157; 
 Tue, 02 Dec 2025 09:51:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a6530a5sm1689915e9.5.2025.12.02.09.51.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 09:51:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Christian Stussak <christian.stussak@imaginary.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.2] target/arm/hvf: Break loop if guest halted vCPU
 during hv_vcpu_run()
Date: Tue,  2 Dec 2025 18:51:46 +0100
Message-ID: <20251202175146.20331-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since commit 93ac765076a we try to call hv_vcpu_run() many times
in a row, but we missed the guest could have halted a vCPU; if so
we need to return to outer loop.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3228
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3230
Fixes: 93ac765076a ("target/arm/hvf: Keep calling hv_vcpu_run() in loop")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index de1e8fb8a05..10ac5559ca1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2029,10 +2029,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     int ret;
     hv_return_t r;
 
-    if (cpu->halted) {
-        return EXCP_HLT;
-    }
-
     flush_cpu_state(cpu);
 
     do {
@@ -2041,6 +2037,10 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
             return EXCP_INTERRUPT;
         }
 
+        if (cpu->halted) {
+            return EXCP_HLT;
+        }
+
         bql_unlock();
         cpu_exec_start(cpu);
         r = hv_vcpu_run(cpu->accel->fd);
-- 
2.51.0


