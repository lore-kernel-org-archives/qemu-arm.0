Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30224CCD1AF
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:03:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJVX-0005fH-1n; Tue, 21 Oct 2025 17:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVL-0005Tb-9X
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:02:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVI-000301-GZ
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:02:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4711810948aso42231905e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080566; x=1761685366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZHYX7VXV4conWXUV38dh7lf+geoYCF1Bpj8/lXvUeA=;
 b=AeI5Q2ZwkHudCWW9YbRsaX+gtenNhIL/GW+YpaNtvLqaRsG4CeMboET2lUrU/gEwG6
 ah+FY8wXOqUVocagRewJZIsxmtddSH9DimN4oM5k7jrFeAu0kRGVKxk1QQCvRCDZMqOW
 WHJDDr2VA9tzXxRzjtnCjp82jpoXGGS92zd8M5ior2APmUA7bbKBEIJS4DYCom72Yj3l
 u6/OCjg98NKdAjac63x8OHITuVxIjm8IYRpWAWYTfc9woDwhARIfl/7ZoJcLcfKjns9N
 mNVgqR9NU5rzYEz8FVVmDej1AyzSXDmSQLaKbQ8kFMnt1VcOqQAtEaoxmY5mYc5ylwG4
 W4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080566; x=1761685366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZHYX7VXV4conWXUV38dh7lf+geoYCF1Bpj8/lXvUeA=;
 b=tdWPCZwPhYxcA0s74A2N9gukmIMlF9AChlI3beoB7x25YSYm6bN+JkBZaDHzAYhsAD
 O2WRTWEtWsiBZZa9jSUmhojjIWFFYOF9xV+52WbnhOhd0tSO9+AU6RpcYrnazZSM5jd0
 1tI1iWM8mT8RA/6MKdmJ25kXQOmGLhqVBizYsPRfGJkefiNRx669PJZJqjQa9x1zV858
 c05H2eg5LmB8mw4zd7e5OkJlp5uO/Pnwr+hFAwl+/DPn/uVpLLea97K6IeCAqyfR3Nsp
 B9hOHAnyEylZKHvq8qSSPE/rPOzJBa/hmS0I+cq6vjQaxeECM1gknKfXgt3Ag4tq3IrS
 oe0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1O7ZWI5k5FIYZ3sn7KQdHbbImENmcAecqxjCnf8WB53u6G8no/Wl3mbuEt+k5xZW54XWlX7eyQ==@nongnu.org
X-Gm-Message-State: AOJu0YyVLVmFbqpNTsdf3o95xCFlTuvpW5FSdso7E8gyBP5J3j0dDdg4
 NmR7Qp7MHvfh7QEssUCwks33b0hTrYz5ww/Ihhx2qEUaiEUzYRzAu/8zMlS3mrM4FAw=
X-Gm-Gg: ASbGncsBEI/JVQr7SVGvzElBDGhdP3CGnBhxXG4+5PUwXALdbU0ESVCq/njVcrlBd7X
 Om5jFp5rEMgIpSiKHD6vP8L/bkIcv+EMZsnTZoTlD2PO4pyvpGoIcGaeOY3B9qwjQtEbY3oW8bG
 OoH5LLldvB0K7X7ZlTx+oeuL9y6vnodv+4lDgGNGc/Vh4TdM7sJLwtYX6l7DEtMdFsEJ/Vq2dh6
 OJ3vbEoEJiZ4sfrgofY8/ZgwfF6XKBqeGvZpufNRJCI9dfL5O2xTTT1Ef6T7XX97rlfRxcnMy2D
 ynZ7yvEMlthQyoqXo+1YhEmldWdblW9/aQlne25JGg/cfq478Tn8D3HWvhtWT3XGCA52MHG4YUt
 TJyma/cys5iuxdVYZDEDZpH/Pw1PRBFWAMJUqk0oXq7/g9lz2Bo2CUvfdhLiOqorAn+Ma/P9/FK
 l3covvvw29fEXwSUxxO4GUODmOVcj3AzZ6EWujGK1ARY0radKngk1Y77kLsZQP
X-Google-Smtp-Source: AGHT+IEMO2cqQFjxIrVEBZs48U7qwniflxRNGHFGC4XngGfZK8r3NAlFQZJVFwY0+JHkOxc6AaI+/Q==
X-Received: by 2002:a05:600c:871a:b0:471:14f5:124f with SMTP id
 5b1f17b1804b1-471179258f3mr133065255e9.35.1761080566464; 
 Tue, 21 Oct 2025 14:02:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428ece8sm10623795e9.7.2025.10.21.14.02.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:02:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc.michel@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Subject: [PATCH v7 14/19] hw/arm/sbsa-ref: Include missing 'cpu.h' header
Date: Tue, 21 Oct 2025 23:01:38 +0200
Message-ID: <20251021210144.58108-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

  hw/arm/sbsa-ref.c:162:25: error: use of undeclared identifier 'ARM_DEFAULT_CPUS_PER_CLUSTER'
    162 |     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
        |                         ^
  hw/arm/sbsa-ref.c:163:12: error: call to undeclared function 'arm_build_mp_affinity'
    163 |     return arm_build_mp_affinity(idx, clustersz);
        |            ^
  hw/arm/sbsa-ref.c:746:25: error: use of undeclared identifier 'QEMU_PSCI_CONDUIT_DISABLED'
    746 |     sms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
        |                         ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index cf6e6eb208a..2205500a8da 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -52,6 +52,7 @@
 #include "net/net.h"
 #include "qobject/qlist.h"
 #include "qom/object.h"
+#include "target/arm/cpu.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
-- 
2.51.0


