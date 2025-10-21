Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B545CCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:04:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJVv-0006X1-OO; Tue, 21 Oct 2025 17:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVh-0006Ek-U8
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:03:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVf-00031M-O8
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:03:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47109187c32so28885445e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080590; x=1761685390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wW2n/n59TQ98XwdluAObjuP3SDohe7zmu6LDZfQMwOI=;
 b=H0UEMW514Tjgpd47GHn/OLs0Gv+P+JJwMv3/Fsie2L/1uDqr75zCkj85RSdfYUlH4t
 mbz0utSJ2BdVbjCgKd8Ps4p/m3Y8gLu/hGI13ayY1glM04JEJZlp5FfbKvNUbze+Q/rI
 IsMgDUEpkwSQw97PD6ZXqhuSKwLbOjKEl7bsPWzt/CIl72x1HgsvTA3pq1BTjOZCRE54
 bYw4x82xoUgRRIRgkns6rYxqyXiA35v+RH1kIByur6X9jLZdh4eQdIHbUoN5QMkJHr9t
 Ngw2a++Pbm7CgV+0iE45/m7rHQW3reBNxbFozcJsnfmpj5wYB2pEU+VgUMcweifjJTge
 5QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080590; x=1761685390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wW2n/n59TQ98XwdluAObjuP3SDohe7zmu6LDZfQMwOI=;
 b=CwtiKT4t8Wy2WzQjNDTZJE3M4AyWv+IGnEqbegnsQcw2atVqpXWxptPCWvaRUhzlEw
 EnxoqcRTzNjjKQZ33bFRzgXjnLpMYqsexUTcp8wxz4/qIYA7UJKOXJruviM81POsqFjn
 30y1Jeis0bl+KLun6G0ZD/YIb3gqcpXnU3vtkBQIn4duP1lzk7PbIvd73rg4926zBGlt
 UJsD+eaEwVt9OWT4SCOnlU7Xg1dAceOsi9gGUAKvlw0qJjnmKDLKFhEtYIAfF9ZBw+ar
 zQVmIXPeGVycOp9hFqc/WQMSjcxO64M4pfisTF9OOLtR9Vv1BiAPHE+IsgJRc2q0MM6W
 Y5Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSb5wsFOF2SsbGC5dgyaP3ESSgWwmqfVsvWmQGsAhNu2m+r/HUtdIdJz8+k03g9rHCR7tW+CUBXA==@nongnu.org
X-Gm-Message-State: AOJu0Yy0ZB2dSA+YLtn38Y65YwYavi9MdbV8kuiLbDlJCNXiknzlsVQ8
 60h2STQ8TswcRsTyZFlysA749XZp/rhRlTNjTIOUpJJJbXeHiGWdBQ/5gzgiF9X4nHo=
X-Gm-Gg: ASbGncszaden1MMdKlZMjw/OzB4xTc6OMByrDkV06AopQ8hD6VSznRZgClfjDnjFNqM
 ZqQrcAjXF/0V/prhcm+tuG1Dz01sPy/BVoqXI56pvTB36BQ4Df2qa3UI9OcgEkOUkC0dvIT7FMO
 jzT2HX6tFGQ24BIGXO0mPkRdgrkOj1SbSt+9oUV5wYLB1gFHb3iIkZkpKIyKu3Jwm3vwQPu8v2K
 PxQUeVhZeE2Xi7YqmOap92pwKmzv/nXnsbBK4STtvWVgm28udfHRj5CUHmiEpaB4V/xSPIMhRsJ
 u56cjnRWR9LmGNY0ymF9C0NojIRrmovRIcvgpNVboprrYbg/hf13nJq5xNCRCUt8xWxdy31n0Hp
 krlWZus9QuIWjPRvyVOeTX4Mts01Wu7GRpxAY4RevbFLZRJ2yJpsD7OA24MwnNnMSq7bznIgA+W
 umFRrKC4SWKZva3bD2m//ViTeNmmiK1YQD3eybJzY5Moo0xmUeQAzYQlA/1VoE
X-Google-Smtp-Source: AGHT+IFMtEd9j8AaEz8NlzRIUOAP/tDz6D2xQoMGrSoaUyb0gUF8Q3f2YMrgJMJ5QSRY5TI+FF8b4g==
X-Received: by 2002:a05:600c:548a:b0:46e:3f75:da49 with SMTP id
 5b1f17b1804b1-47117925d24mr134950305e9.37.1761080589970; 
 Tue, 21 Oct 2025 14:03:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c42b567dsm10554615e9.16.2025.10.21.14.03.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:03:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc.michel@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v7 16/19] hw/arm/virt-acpi-build: Include missing 'cpu.h'
 header
Date: Tue, 21 Oct 2025 23:01:40 +0200
Message-ID: <20251021210144.58108-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


