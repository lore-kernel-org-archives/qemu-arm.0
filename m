Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp593052ejj;
        Thu, 23 Nov 2023 10:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYlpxC2Cgyi6MwxivwNHpz/z4YvLR6C0dRg/YD6HXOHxYSlXZbiQzQp80r63qbdje4QFMT
X-Received: by 2002:a17:90b:4b84:b0:280:2823:6615 with SMTP id lr4-20020a17090b4b8400b0028028236615mr290003pjb.36.1700764614659;
        Thu, 23 Nov 2023 10:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764614; cv=none;
        d=google.com; s=arc-20160816;
        b=05u0HLvHvxqP8FF75SsnXfMUZ2265/ZboqB7XR0lscF3DckBAzo0OKmyvN1fpahVn6
         4nooOKvTKZbYHo1ekVMxkTg2qD3i+jwa01a5nJj2sZ8pDpLMT7ADTqS9UvILcFL7Dqwi
         zhCrlDxKdwNY8iur5occMZTNpn3EQ9UrSdgpAOQ7KATa34E2VF5Zpi/415UzvJ93G+YY
         qdERAqHPrt/TYqHtibvwxdLZPkYbpKDOG6Q/GEPL7zwEbXQJj7WWTavnHCumuzjYU/0j
         tWACdMF9sCSkj8bFg2OYbBdO+GMrXtE9nYRZsWGrZlNjc6mi8GUrBN3R0v9AME/4Cw66
         FB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=cqp56K59q3umRruYVBhFmPPZuHH1N9xP5Bn9Um8qZmE=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=NyJ/GeVFqskkHKP690iGllXmcPtq7uYAmZ9QggC78NMFaVRrAf2QJErxfLwdp62GQm
         fm6akw5RqJO29TS4L/n+LQ+/cYaktR4s0hO7voTeoZYegWbCLqvvR+Hoyyx+huBJDjj6
         LQfRRb51Y5ZxRFM6Dg3S1HUj4onzuUgaEbiW6JHJyEzLXvVLUQk6WJhwh9RNW7EEmYH1
         UVtxyQ9awygqex1NG8HfLWMsmM88HCgWEhxa5EqTnl7R0MA33hEXE7PGFnlZPxMkMwAY
         tA1h3aoiz58JiJ3HY52gF2JmGvAw4HW8p/bhYpidDPMD0ysL1N8/8KDYHeT0thW8za9Z
         U0Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJQrToCs;
       spf=pass (google.com: domain of kvm+bounces-2384-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2384-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2384-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id qe5-20020a17090b4f8500b0026d41496190si2468499pjb.85.2023.11.23.10.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2384-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJQrToCs;
       spf=pass (google.com: domain of kvm+bounces-2384-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2384-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83C49B217A9
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5994D11F;
	Thu, 23 Nov 2023 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJQrToCs"
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3F710C3
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:45 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-332cb136335so755724f8f.0
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764603; x=1701369403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqp56K59q3umRruYVBhFmPPZuHH1N9xP5Bn9Um8qZmE=;
        b=zJQrToCsTDxMnJ/juvr24vHRdBUdC+hWakKWO0CsesWt7wX+OiCLfFkZBi9qgM5b2y
         0LGwnaOZ0A0Nvepj4yPWsyh4n7zhkmzIPDEaIdub+dMumGnBxuRtYuypLfTT/5H/IcWd
         DqHOMb0Gfdtl+1ZDvvP5WJjWVQkeVBX92DiqhS8ZOON+cCB+DDenJboxmWgJimVaIJjd
         fbLrZcJYj1VUD1n7KGQvDsdo9KafvYrfGmhAwRc+dEU8IDYbobJkuBBV6vnxA9WTss/6
         xcK3MQldrQB9xXt8kxopo5Nkml1fh0/prpFaUFAwNlnsRbBvaXEWfFn6Ch5A2EmoOYZa
         tWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764603; x=1701369403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqp56K59q3umRruYVBhFmPPZuHH1N9xP5Bn9Um8qZmE=;
        b=wEoyQN/Yq7IgLPT9IBxoJTxV8sQcwTMAfiH5oIpADc+mhqC6xHQ27YegV73Yl+U640
         pfL1EJBLdb7y4w+g89YPBXSsqpJZgvmF51EsfwC4/bX9+brGwwdH+ubrIAi+lF3wwWm+
         eA7FpH2noCvYE1n0pVK93Et3w4n8J+oseRjuXMSUzTjzU9MCaNFuo30D8HVrzl8Owaam
         2NnY0UsJhdr+cZlQ+hWg+xgNei0cd2QJNOQAjX0kafn+kLGoKWvnIBvEMmymSFwJ/A7L
         m9GcQTIY2UgbK1isWx78M+mY4utgE/HFlO8Rtr1sTT1Unwfvxb7DQ4wzGx+8ah2KmteU
         73HQ==
X-Gm-Message-State: AOJu0Yw9R9de5FRUYXaFpJpXDIzxdsKx0BY37PWLDsN0o8fwWnLK+kPz
	h/q4V859EVUG+O9E5IS3wKYv8w==
X-Received: by 2002:adf:f88c:0:b0:319:7c0f:d920 with SMTP id u12-20020adff88c000000b003197c0fd920mr198305wrp.57.1700764603697;
        Thu, 23 Nov 2023 10:36:43 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b0032d8eecf901sm2346025wrb.3.2023.11.23.10.36.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 15/16] target/arm/kvm: Have kvm_arm_handle_debug take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:16 +0100
Message-ID: <20231123183518.64569-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
References: <20231123183518.64569-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iFGM3nttvdEG

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 9f58a08710..1f6da5529f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1344,7 +1344,7 @@ static int kvm_arm_handle_dabt_nisv(ARMCPU *cpu, uint64_t esr_iss,
 
 /**
  * kvm_arm_handle_debug:
- * @cs: CPUState
+ * @cpu: ARMCPU
  * @debug_exit: debug part of the KVM exit structure
  *
  * Returns: TRUE if the debug exception was handled.
@@ -1355,11 +1355,11 @@ static int kvm_arm_handle_dabt_nisv(ARMCPU *cpu, uint64_t esr_iss,
  * ABI just provides user-space with the full exception syndrome
  * register value to be decoded in QEMU.
  */
-static bool kvm_arm_handle_debug(CPUState *cs,
+static bool kvm_arm_handle_debug(ARMCPU *cpu,
                                  struct kvm_debug_exit_arch *debug_exit)
 {
     int hsr_ec = syn_get_ec(debug_exit->hsr);
-    ARMCPU *cpu = ARM_CPU(cs);
+    CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
 
     /* Ensure PC is synchronised */
@@ -1426,7 +1426,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 
     switch (run->exit_reason) {
     case KVM_EXIT_DEBUG:
-        if (kvm_arm_handle_debug(cs, &run->debug.arch)) {
+        if (kvm_arm_handle_debug(cpu, &run->debug.arch)) {
             ret = EXCP_DEBUG;
         } /* otherwise return to guest */
         break;
-- 
2.41.0

