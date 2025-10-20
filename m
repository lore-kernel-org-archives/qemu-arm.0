Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283B5CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:22:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyEp-0004sS-SI; Mon, 20 Oct 2025 18:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyEo-0004rf-72
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:22 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyEm-0007Sj-7E
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so26421805e9.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998818; x=1761603618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/MX9EUM3OlM0fVIXCU1R8/yICbcVLFwc2FcsNTruKA=;
 b=HXhRxyCrhb+AjRMaSIVhzQ8dvZcNFigtKkiR2Wwqt9TL0Hx58qpi3oh6fHNizeBaWU
 Kf3prR+AXKN2SounIpog77Z/fnDP7AAW0mnE4b1aJpkzctV0Bsko8kCo3AWa7XEK0afc
 y5aWP7pSLuEMMb1JsKPbPKRh6wKlzi4yNJsA/e5TWMQMvaQkvhDL1fp9L+Rw2kKFmI8c
 mMAJQhAFpxhaspS1WNALb0Ip1vhJ4wNdWsopMkgbsXD+B42Mn0Q5MJdGvEBXLlIX+Z0J
 Uqxc0cnJ2QAEYuKxsyAIJLz4rRae+z2DPj/AbT2Aw6v4WPx8TVlsi0GSJQiVB4++DUx0
 5hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998818; x=1761603618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/MX9EUM3OlM0fVIXCU1R8/yICbcVLFwc2FcsNTruKA=;
 b=CpJyuRTgtIlNaRKItwGkBGjjmnGYwY+TeXoRU3aniVncOulSeWGis7fG7beXG5Ypc7
 q9kUGlSSYJlFNqXqlljOhS0n8PiciDknw1jB6OGglsPVJfye8LIitAtlEbsOhYao5dbE
 DVT5kIBZQ6CMcUhK6a4yxSvDALjbYcBteeXWDaLkDH0s42Ly6ZKXTFhbzPb7V+Kjnus+
 dcKVt8WuOQocRnhlvqBjmj0eV2fJ1GiXXgc0cPC1l9S8jxUeudgX4+XiVvE+DfEdv7yN
 1KzBedi7qrWWAlpiHGjoLA0ZYDyqIaGrtWyqQql7DgJ+6kyhkmqewutVnUS4GuAvuKtZ
 GqjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsmjl0BmgI2YPzOYJqxhdK40yyen5eXkghg9EpzPAMqprCyLhoEzYEf/Rys8sW5q4nP1wr1yOhPw==@nongnu.org
X-Gm-Message-State: AOJu0Yz/AbY/Docq2D4lmqQ77JHOcAdVnLDv6AxZhlu0zIaJRDtYQELR
 jUY4RH3Ijy/BTp53Qe1B429kj02Q2FK6yCGdJ+YFJi1AMKmHaQmsbShB6VWvFvG0s8k=
X-Gm-Gg: ASbGncvOvnlYQG1G2BuiO5LazHMgUhlK7aL1sPv5CuOfbHh9/X3R1s21Q+vdq8Ew0zW
 13mFqE7XHYJkPPyIMtYZA2PHK0U7EUSmQ09/j9huP+nngKS1Ub42qOFdYqVQ8v7ST9G4MNmDOEw
 msQ+dBqebKZAexDQY+P89GrqrN70Z0iwpVjaPOi9ICV+b4z6231NDaYNUorkuTfyrpwVFLfaHce
 QBiqyhTk0bJafSfQTZnT/GzpbrtZ8ZYB3uT+fEGnLgj4weiv6M2s0L3AFjZPj6akZ5lkztTaiXI
 /auNqf5LVpWpdLvabH3dn/tPNJLabq+KB80Y3cY+hVcPGNuFXRvNi6X7KltI7lNTalb6thUXN8U
 b3fCHf1ahnR3+V3LQF6jn5j3lrlW0j5nbK9d+XNGWqpW74BtJuQu2FGNzr2bY1doXm9SC56TybW
 iR/Far6XRZI5njGi1lPFikIPDjUnz0w8d6qOsJUR8AQBhokMYmBg==
X-Google-Smtp-Source: AGHT+IHQd94WnxOqRShneHwKD1auZ5AJi9lX/D5JtmhSmJqVvl4rtAmLxPX6xUZIlTT0afo+HO6Fjg==
X-Received: by 2002:a05:600c:1d9b:b0:46e:38f7:625f with SMTP id
 5b1f17b1804b1-471178771b6mr98997475e9.10.1760998818083; 
 Mon, 20 Oct 2025 15:20:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474975af467sm3992735e9.10.2025.10.20.15.20.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:20:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v6 26/30] hw/arm/virt-acpi-build: Include missing 'cpu.h'
 header
Date: Tue, 21 Oct 2025 00:20:06 +0200
Message-ID: <20251020222010.68708-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
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


