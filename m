Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689B1CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:53:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtse-0005TL-J5; Thu, 23 Oct 2025 07:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtsc-0005N6-Iv
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtsZ-0002a1-4W
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso7940915e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220393; x=1761825193; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcuUhmYfuiOMUA6fkhcSZ2utpWByLaxsadmUM1Ytmjw=;
 b=mIrZO1EkK5++0T97kde2qev8sr0mJL7l/rD3l25HsbHbyh06myu9CSzjLkYNk37wAA
 ei14u73yR16DCLqq9IRrvVdyyc507CUMVNWHfhOnbQVmGDQULhmI5jMoHU46HWPwN//E
 oEfjjTP3RYNZmHO80Gth07a1Z6xrD/2EBSp3CRBTSnlLF70FdBC9Is+fQidQn2kdcQSb
 D/zPhANoENlUh3axUcAFYTJ2ncz6DViQ2+rFztiJb+1H+h0Ol2rSku2OBODYMO0HlVUf
 hl4dDlvYdJm7wutBZQNYbD1VFhGSnExVVai3r2jda655aNzi/DSwirtF49Sa54pQXkal
 7r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220393; x=1761825193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcuUhmYfuiOMUA6fkhcSZ2utpWByLaxsadmUM1Ytmjw=;
 b=JOyyEoa22zz3iBOFSBzZq7xHDHcz8UaaKjTg1setMkfXL2ETW1TvBXULcJ+lQ4EeGo
 P8re+yX6xdN2/zSRyxYr0pus4KmOrlj3Zzb5lluUDutwufzkiUjwSNCO+yRfbmtNbkF9
 pAbMPg44fmAEwBBKzY3DXjR7bD+Bu62qfWoPTGlOk8PYouprLVTmLRck2wnWA3ZmK53H
 U1KPWez4CM0M9FzUvDLkezAZEVYtjSTZt12M+B2IbjXGKJfcbHvnXm/aUhXiPqd5B593
 h6RFvcUl1mtm7ogbJbztfNHML23/BftQPHGU3Wi28qoaZgcTpVYUGHzeh3vrpLV6SyUO
 Tw8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxtnZn0bgjgx3agHC8j+lvSBKAWCzxWaaW38RvLvHyk3vCgwdFINCrg4CpG1EUE016yi07RKrWQQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzx/U9K55hHHnUFQIu9r8Oqg9lBz/oACYq0zymujMDVoxt+U51Q
 Zwyhs3vMPbxZvdZL/ddi4e7G+3VoUi68Vd4cyAkmRHlH24fCSG2Ml6hBNLoPVY7qa60=
X-Gm-Gg: ASbGncv7PY6QCsHHG6F4mzwuV8g+NnaviKtX22wxnH9hE/Pe0u3DBSFproM/D6/BFuv
 MYuSf1SIS3fzcK/7h2DPJlOqlL+6fiYC2Ng4axJn7nXywMZCLdqDSWwBogJxB18VFp0b2Fq5Joc
 TAZmtJxvkHT/wcylVyDCKdNjROL11xEzbVXNvrlPfqyC5NHK9h+JZk6DsIUpyI/+EOpei1zGB5k
 gGBmdsEmwTDupy/O6SSG1HtGoOA1QagON0RSwPscFgp7q9Dy/JpEopyX6Jr4tVVon25Mu6hcEzC
 wK/3uoS8/w9Wr1qdWHIfrbvZDnWV8s1Aex3IjYQDm9MxuoaG4gjQYb0iVtyYmQq8+5goVRuRHuW
 8VIt0blR9g8qeXwTpRofy9ai3FhuSWl9IZqrgB9kgeoRXr5UJ2lhZYK8wnRIM/vgRxPtJGJ1XCL
 A8x60XIQbpWGxCMxL2E3JZal418T0gWknr8b5DF8BVGq5MqiybLQ==
X-Google-Smtp-Source: AGHT+IEXZEZsRuDE4uGNeWOqPatKxg3anrumOc/RC6nTgP06JMi9bVb0uqT8L9tZDj0jRZA34AMf8A==
X-Received: by 2002:a05:600c:3b8d:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-471179176b9mr206081475e9.28.1761220393079; 
 Thu, 23 Oct 2025 04:53:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496bf7137sm59345735e9.3.2025.10.23.04.53.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:53:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 30/58] target/arm: Re-use arm_is_psci_call() in HVF
Date: Thu, 23 Oct 2025 13:52:41 +0200
Message-ID: <20251023115311.6944-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Re-use arm_is_psci_call() instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 67130ce27d2..e913662dee5 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1945,7 +1945,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
+        if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
             if (!hvf_handle_psci_call(cpu)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
@@ -1958,7 +1958,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+        if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
             advance_pc = true;
 
             if (!hvf_handle_psci_call(cpu)) {
-- 
2.51.0


