Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E3FCAC5AE
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Sep 2025 16:35:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1SQs-0001JP-Jq; Wed, 24 Sep 2025 12:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1SQq-0001HS-K6
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 12:33:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1SQg-0007hb-Kx
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 12:33:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e326e4e99so1331855e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758731593; x=1759336393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYlzON49AvbxhbpDD4RKuVLUadRyeOo7snZVQLU3QFA=;
 b=SqkSQwfetOuFTbKcHMIiXLP6wFy57ATTdu3KwfvXkpsFD9gov44CXMBlilEoD++YmU
 SpIjWdipKDcECv8wBh58Wzv7Ur3NZHwD/yHD0ECQpAMkNi78IK4ILoASJlyuSpm8Kk14
 i7RC4Wtx0+dQLmzdKmhoAMvXm45/pJnsLXpHjWqZjAi+kWhjGco4xIJw7MSrjZqJMMom
 xOtc1ggtisQD6MeXHnpHP95ThrmmFl2kIY9q3k/dup2QjDf1UCYB7hbt9Yz81lWx/k9+
 iqYCjvwyiAef8WDhj2BQ3G0/3omkH3+f4si+XRa6ZDIxXEf7QJTbgvRY5ejA0hORtARI
 65Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758731593; x=1759336393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYlzON49AvbxhbpDD4RKuVLUadRyeOo7snZVQLU3QFA=;
 b=Re1k9LxYsc+J9DgBDcdbD2JB8Pri4OTUZl3hNF7OE+4+z1AS4tgop2IgfEjSeHXMzo
 Cc6FGr3sjp2SXcrn0V+oB5vDRX5Dvct1ACs73hBrLGTBGHWUJ9PE3bDpZ+iKy/0UfoF9
 UJZvJ5VurugIG8TKbbnTgfLYk7o3a12i3TXaYRy4Aei6o0qDInUSiC7RubhWNqjNeu3s
 bOt+2ODZj3wLB7pcR4Cv1IRanipBijcurMGvXGQlMTTmNqnLJ/RMd4+GR5VbxQZmUtsw
 +EyIXWbcSEcKCDw0O9mJn9lfEpH2YSd0Aeq1ydUaKLGPiiDGk6FwqpedNN5h8QBFeH9y
 8u0g==
X-Gm-Message-State: AOJu0YyIeAyE5Ui+miwCSW63/58AlK7DS6VLlRlxYkaPYDokkHyUgMMj
 OkiXfKbNEcnWb/c+GJgW2WxtvbVufyG5AjqbgQlWPffCAZZ4Dsk1G+ArgdWGKTx1PVcykJGhvBL
 jUFnl0bSOkA==
X-Gm-Gg: ASbGnctFubL9IJmNg6Yyqaedl3/PytdZyFFlSRQ59BD4Ngdm3IZE7Y1veezoW7J+VLI
 IA+76RLevKaEPj1GhrhdmrXTAx2lXVvZBDStY3osf9lpqvx0C62z0DT2Rdp7Hz2hZTmzB3ZMhzW
 +dTSodyVTwALC25kA+qe3Y5j2VM8gQUUOqOwSZKdW/LOFkMh8DgAhUA+Lwk14mW6MJPSGKAXgPt
 995vUtBP4F53DRaGZg2Tm/SXvMo48XUwpdQmR93wMIbo1WjGfrm3kOi3pW2sNEtefDscO/Tca5y
 2wCoSgci6vSvj7AzcR5Ofq1WtjXhExd9jPmRJJsl9PuZJmTLBWXJqYtM9uhRl02ny6nDn3XmC94
 jDL1bwFCPsIViF40yJR1Rt2jCglQ+DZIqib/77J+NN8ukNnQP/tIaVrWgaNa6h780a18gFrB/
X-Google-Smtp-Source: AGHT+IFpm5/Mi91c3TswF2pQWn0IjvbQT1b6SShTq1L+n9QlPfIQGuSY2+UZNUfBKkIXOXfdRAXOGg==
X-Received: by 2002:a05:600c:4695:b0:45d:98be:eea6 with SMTP id
 5b1f17b1804b1-46e32c2f687mr2944445e9.3.1758731592607; 
 Wed, 24 Sep 2025 09:33:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-402188ef7b2sm10155281f8f.34.2025.09.24.09.33.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 09:33:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] target/arm: Trace vCPU reset call
Date: Wed, 24 Sep 2025 18:32:54 +0200
Message-ID: <20250924163255.51145-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924163255.51145-1-philmd@linaro.org>
References: <20250924163255.51145-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 target/arm/cpu.c        | 2 ++
 target/arm/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f422e608bf3..391a03c1953 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -233,6 +233,8 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
     CPUARMState *env = &cpu->env;
 
+    trace_arm_cpu_reset(arm_cpu_mp_affinity(cpu));
+
     if (acc->parent_phases.hold) {
         acc->parent_phases.hold(obj, type);
     }
diff --git a/target/arm/trace-events b/target/arm/trace-events
index badff2b2e46..72a2c7d0969 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -15,6 +15,7 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
 
 # cpu.c
+arm_cpu_reset(uint64_t mp_aff) "cpu %" PRIu64
 arm_emulate_firmware_reset(uint64_t mp_aff, unsigned target_el) "cpu %" PRIu64 " @EL%u"
 
 # arm-powerctl.c
-- 
2.51.0


