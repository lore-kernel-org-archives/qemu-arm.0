Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C3D33980
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 15:11:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRXSs-0003gI-M4; Fri, 05 Dec 2025 10:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXSr-0003d1-13
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXSp-0001Rf-6r
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so14322295e9.2
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 07:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764947477; x=1765552277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNRoxsNNrYd1+8NJrEKrokd9NPN4VEeWaFFpiw4lBGU=;
 b=EV9kqBqhkbgPotbM8PWa8huUzaT/jVLZzbNtfxcgRAzCGRvHLTM6igwGGak2GHwqWY
 dxZBWSrigXRjhZ9q4vLR8k5o+3YmvVjf9vd5NYBWHN3Wu+XMDwlxPIUSimA4905VZnlp
 gZgJuWZfbtEwFu73Dqe8JJhe7d8kWTJOM35PvivrfPqlm51geNIVmpgUe4krIpBP63PI
 aFzumXAcNXzT4P0zCKV+hKAnu/yk9yg/Sp290y6w3pflKIyAas5/hPZu91YUIoha1myS
 pN7O0wZsXE6udtY+y95IksbNt02axlQ2JhV/nl3GDS/OPII8JdYh8elA99Cm+pvmkNNe
 MzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764947477; x=1765552277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SNRoxsNNrYd1+8NJrEKrokd9NPN4VEeWaFFpiw4lBGU=;
 b=CGE1GqcpbgVsldX1pCL2WWM06VQ/+zwi+1u7MhP9q+72o6nwrmsJi3geC37aZsILqX
 pjIPLHL9mtzSk9phtF7WWCfPq96gd8asptyI2lIkcxpvUKJjNRk1kaCQSjyBiipHqOuP
 1U9KWfBx84iEGV+ad9epBInGVTZ9670UF3a0XKOTnKXGIydxRqbXZ74W8wuQmLzE7Hi/
 W5nB6KhBv9BvIRTzAbJb3OiER3RdAvjhJMnEVldR3keoysFRDqLnYjBBlyZGodTBdh2J
 CFBWq2g5COmsQ1rGJVkgx+aDFqp0YIETWYn+iIWV00pdG626nsQrCbG5I0HnAV7oZhWp
 E5Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF7DbIPZ+SsHCtzc5pbQp/+5N/0vLn+UgYNvVK7Jk3QCTxUT5qe7KPDBMM8IPTJFJ0BC4ukqEIBg==@nongnu.org
X-Gm-Message-State: AOJu0YxaNwC9yhZz5dj3tmceTIVbrwtr0hh7R8UipPm9FsGLzv2wdINm
 YdQE07lVRktAD2eStmkX+8PfJ0r1iRxqhPZPUzKL44q4Jkse4i4lgSYyXAWsg1VDC4o=
X-Gm-Gg: ASbGnctdlBFgJ4VSup7c73xAe4QysMJYL1zy5rYLnEbFFA6Lg0QwI44YC+FO6brhb0/
 IrR9r9hLqb9cMLjBJ+tYkVZo3luqZA78ecwaLtWVLi9m2y2Fr+omrprrOMl2K38lBTxiwagxncm
 6otetqJsaEKQ2XfMEZAGpalABQ/Q+fQZWtRzUYNLfvwNvsuYbKWx5o9PboiDA8QEeoBHW/50iWx
 8OY8GKfCLK2461UCTu/XTJL12CRP35prqgDYHHJzGDJws+RiTZoTeB2KoKmB6yyYbUrfF5WnK1S
 PQO2DfXuWboI6qXDTZhrdIW8xoB+0604Y3wWQcEdaN/HdSwnFEg0N4x/81jVfC8lpYzEsUsCqJh
 kgQS2yJbLTd1Nk8G48luqv6trDwlvRDMCn6l14Qyd4j90sjlPyqItvOZHVqC3bXNbYaHIjbZp5F
 iPMN4OVjKepWU=
X-Google-Smtp-Source: AGHT+IGT9nMbbGKbe0jvIAstlq9HEshYBDi2cuW5ilozLcsEOgE8dadbKnKf/wfgUO2Hq3l1x1dkoQ==
X-Received: by 2002:a05:600c:3106:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-4792af1b207mr106135245e9.21.1764947476663; 
 Fri, 05 Dec 2025 07:11:16 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47930ca15adsm93255835e9.13.2025.12.05.07.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 07:11:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 71E565F833;
 Fri, 05 Dec 2025 15:11:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/2] Revert "target/arm: Re-use arm_is_psci_call() in HVF"
Date: Fri,  5 Dec 2025 15:11:14 +0000
Message-ID: <20251205151115.2035930-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205151115.2035930-1-alex.bennee@linaro.org>
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


