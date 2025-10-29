Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A710ACCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:57:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEEA2-0001vY-8o; Wed, 29 Oct 2025 17:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE9w-0001sS-Mc
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:56:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE9o-0008JR-KK
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:56:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42701b29a7eso235791f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774993; x=1762379793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zG/Qnb38xympFyj6CMDqOivPUjIexpytFtgM6ZeeyWk=;
 b=rnXSLzcyGQFGDOlaHAPbJLUqxb/BjprQe2ljPTKEouKXB68gNoAiNGjHPqru5zsQMg
 HQO3QhQauOfDMBYAdW6usZ0EtUadMoo3vunlUp52BMgH2VkVqRp+VyfSUeCGSp0A3miN
 jDSBhEHiWICmc7IrDGurslWkOXThgXw0OvVt9nVnb8eRYDIdsRZtXBfq9CgOj6Zw2/Go
 wT6/CwHwNGi5pjvk5k9wITdsR258VQtYfne8TcTsWdfoiPeIB1SKAkM5F5XFk39FWzmr
 VJYV0eNwNAItfQJEYfHz1UCVVF3BKKtw0o9ccP0cAAoaiTtnG9VU5HMzgw/50WRXy0+U
 gRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774993; x=1762379793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zG/Qnb38xympFyj6CMDqOivPUjIexpytFtgM6ZeeyWk=;
 b=r0sRczKE1p304rdtmsVmo7FltTzlwq0wC21SaXW1kSjJrmqanRlPHMkFkb6QoyHlhb
 BOeZqo9aMi/pfVTqSS/jmZEyJa990QGFtQb+Fv0c1hsFzxwUqNrM+1u6c3J8SdFHSX6x
 PJcmpnakUN7KIf1daB6sKq25yu65U7Ub3D9LWiELFgJ62VRwXETVoXQIaH3inpYcbQ+5
 SVQBFVfwFWnwU9/s0d8W+HnmMxTx5IFS1ocPcQ7dVPf4XWiCyNM1Ni6VkhZS2gurVxHd
 fEMGflBerOthZThpDE6URhwbC8N1XiQXpDxEzBYzWz7pKDbsCmw1AEwdv4cIbczvmVtd
 jruA==
X-Gm-Message-State: AOJu0YydtapOea0CJvThYJKVqu/PBi+J2zy7oJWZpQnjaPSD7fJ3zhd9
 mPhMDp5x6GFMQN8ESo3FscijJ2OpXnDiLHTwjcXOWXyt+M9HB5hoevciJ2y42YSPKGo=
X-Gm-Gg: ASbGncuXPpT4QBEM9TIWeyE55xvaoHTXH5V8CdZh8qdMNiX2Bdf1ZZiUddlX8NKDiTe
 wmIU0aT1Fiq60WqAcbLC1g2Bd8y6Y095B6VVhR2KfA4Kw0CFutOpsjp/AAqo1qnxpXuWmmwNa2Z
 GVycagqEHBZS1cN1GyBHPLqQDbqDHOYCUOxumzT+adFseXGugqXQlz7vhXqQmPA09a6XBCmtFkp
 8EV/WfHJTq4DDPhlML8fOA/bFbzPF3WCrd80rN0zfrMlwKP9YJPAHwIj11BCBAH34uKpikJ6wRL
 ZsOKnOM0PXWyh01bxuVoMlmT+noeCd+6Mh5x3/30/NBlMMCzvs7l/eB6WsNPQ6e69LNifa1MU65
 +wt0Qdfb3McBzKROtUsk/Q+SHvlrAqcMjz9OGhB9ns2/q2dtPZaE3o0OgxhesQD3lTaQ8N0r5ki
 0LnIJ0LDVcYA1y0ZDHGEH57Xp1fj3fPrIkkFBMaElCg9fd3/1+kA==
X-Google-Smtp-Source: AGHT+IEgYXAiNqbgrYwZxHxjm0MWEUHv/nwLsIkcUaY8N0ly4tQPUx/xK+zoagSb96myG2MM2QSJ/A==
X-Received: by 2002:a05:6000:24c4:b0:429:8d74:4b16 with SMTP id
 ffacd0b85a97d-429b4c81dc6mr919430f8f.20.1761774993159; 
 Wed, 29 Oct 2025 14:56:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b2dsm28162128f8f.2.2025.10.29.14.56.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:56:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 16/23] hw/arm/virt-acpi-build: Include missing 'cpu.h' header
Date: Wed, 29 Oct 2025 22:39:53 +0100
Message-ID: <20251029214001.99824-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

"cpu.h" is indirectly pulled in by another header. Include
it explicitly in order to avoid when changing default CPPFLAGS path:

  hw/arm/virt-acpi-build.c:903:34: error: call to undeclared function 'arm_feature';
    903 |         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
        |                                  ^
  hw/arm/virt-acpi-build.c:903:53: error: incomplete definition of type 'ARMCPU' (aka 'struct ArchCPU')
    903 |         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
        |                                               ~~~~~~^
  include/qemu/typedefs.h:30:16: note: forward declaration of 'struct ArchCPU'
     30 | typedef struct ArchCPU ArchCPU;
        |                ^
  hw/arm/virt-acpi-build.c:903:60: error: use of undeclared identifier 'ARM_FEATURE_PMU'
    903 |         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
        |                                                            ^
  hw/arm/virt-acpi-build.c:993:10: error: use of undeclared identifier 'QEMU_PSCI_CONDUIT_DISABLED'
    993 |     case QEMU_PSCI_CONDUIT_DISABLED:
        |          ^
  hw/arm/virt-acpi-build.c:996:10: error: use of undeclared identifier 'QEMU_PSCI_CONDUIT_HVC'
    996 |     case QEMU_PSCI_CONDUIT_HVC:
        |          ^
  hw/arm/virt-acpi-build.c:1000:10: error: use of undeclared identifier 'QEMU_PSCI_CONDUIT_SMC'
   1000 |     case QEMU_PSCI_CONDUIT_SMC:
        |          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-8-philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8bb6b605154..200e2a1da70 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -62,6 +62,7 @@
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
 #include "hw/virtio/virtio-acpi.h"
+#include "target/arm/cpu.h"
 #include "target/arm/multiprocessing.h"
 
 #define ARM_SPI_BASE 32
-- 
2.51.0


