Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED53CCD1A5
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 20:58:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJR4-0000ZI-ST; Tue, 21 Oct 2025 16:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJR3-0000Wk-T5
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJR1-0002NP-Qz
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so172862f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080302; x=1761685102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhKwIpK6oHtKElKWV9wfvCnnIBbAtivgR1l9aH1KDRU=;
 b=d7eG6t4VUVxk+Ey2vwF972TzngwI/r9GsMe1ewd6JK1YFuxmcwzBBM1ZWea4JlbSr5
 7UJdjBaLU3SZdOAnLqTYwsZhaSJGUr5Og7ycZBalp2ucbHhY8gGEcvTQOc9P8j9qXPni
 RA1R9FvY3TfPwQoHcg2h1G9InW414SDLvOA8QSPFlge114uyN/GRV0L7p7SFYz3reyZy
 FC9BncCeEbJqSDJhnkTamRB6N+DpWFYj3rJA7wSzahNm7OmjypqUCnMznQCd1qWdjQc5
 B1V+lX6rm7yi7pvXAOYUPQT3OPBNJJPspQxIcXsc6tVFHhrcdKqIou4f9J/4RI9tpGJb
 HnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080302; x=1761685102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhKwIpK6oHtKElKWV9wfvCnnIBbAtivgR1l9aH1KDRU=;
 b=Le2nVBDxAdZF7xSgIku/IRHZ8J0NwCUToPieNMR9Nu+7fCPflaAKL18JGnt50cM2bp
 OJ4R4/glAXc1Z3Xsl0uD4SL4JTKS8PLegxHGo2/PBLRYUrdMYCYIL/MG1fr6yHwrAC9k
 HiVTOfAIuNZEWqPKe6697Rg/7EnGOUoAI38nlCHOSx5F4VZFSL+W8KghlDmcHGYVHCNc
 kVDgz0r2Fe6iszNvx1uogwFmbmnhjEPFPlDTfQw6pkK1H6zSoJEIjdNqSw08hD06ZGCK
 sBTsI7GAUcw6tNukWGOsf8MVKt+L9PLkZAuaWrnW2Wf1W/Z9eGwhbofESZFr1IQM49AL
 mwLQ==
X-Gm-Message-State: AOJu0YyOfEiEa1luN0+8TDZh7X5ryjHDJncoihqLEFxISpBVmn4zZ0Xy
 olPM2hrWkuMWYLPkYq7NOMmpEip3U7tbVPe3s338G4Ve6TSviHmXZOqAp9+KcajSpZ0=
X-Gm-Gg: ASbGncsmtWJiLu70HkEvbijAtVCwLQVximLCnw2yFjg3yAparKQHUT8sl4/hZk3Y23u
 JzCa1QQIQofc78Md6yDNVRRT2691Qjx33dFSMFz1wZ8Hhms4FEoTEuYpc824PLFSW8XxkzxX1Q0
 Jx1rjnplDd5PmY4dBECqpP3OUxMhEih1XnxapfMty78N4Q/lOAfNGqw6I8cYqe+LH7SXWyz2fV7
 CJQn5zRgDb8bUpSsdKPpNwHbHEDgwA7eQAIohpq7KcqIECce2kP2k/Z82iZSxRpNTHhdS0n+Hf8
 3bM099EjpW6iisOrVKtDQQRdsqBBCH2udiy8rZhaao/1UCMXhks5iAPZ2xY8RmgEfL5n4vrwWOU
 mE4FQrE5OOh80EXapUZ8BYQAts1LhcV1JgctPRGO+1dzevzuZOCnMUZbq6jbKNLJkJQ6IHorV4z
 6dqlufcLbxuTsnS8bQ3HK1Njs0xxVb+TOq75Jm5RtvJEBGP9Y/yPAKAydhv58s
X-Google-Smtp-Source: AGHT+IEd/UUE56W5KjJpwQejPhpsH9urDl28j9H+KgQrbuItNFnqsfDOrr3Ib4fSrJ/nhkRfeiCx7A==
X-Received: by 2002:a05:6000:310e:b0:426:dac0:8ee8 with SMTP id
 ffacd0b85a97d-428532554b6mr823031f8f.10.1761080301940; 
 Tue, 21 Oct 2025 13:58:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c34sm21788824f8f.17.2025.10.21.13.58.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 13:58:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 03/19] hw/arm: Add DEFINE_MACHINE_ARM() /
 DEFINE_MACHINE_AARCH64() macros
Date: Tue, 21 Oct 2025 22:57:24 +0200
Message-ID: <20251021205741.57109-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

A machine defined with the DEFINE_MACHINE_ARM() macro will
be available in both qemu-system-arm and qemu-system-aarch64
binaries.

One defined with DEFINE_MACHINE_AARCH64() will only be
available in the qemu-system-aarch64 binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/arm/machines-qom.h | 28 ++++++++++++++++++++++++++++
 target/arm/machine.c          | 18 ++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/hw/arm/machines-qom.h b/include/hw/arm/machines-qom.h
index a17225f5f92..3f64d5eb024 100644
--- a/include/hw/arm/machines-qom.h
+++ b/include/hw/arm/machines-qom.h
@@ -9,10 +9,38 @@
 #ifndef HW_ARM_MACHINES_QOM_H
 #define HW_ARM_MACHINES_QOM_H
 
+#include "hw/boards.h"
+
 #define TYPE_TARGET_ARM_MACHINE \
         "target-info-arm-machine"
 
 #define TYPE_TARGET_AARCH64_MACHINE \
         "target-info-aarch64-machine"
 
+/*
+ * A machine filtered with arm_machine_interfaces[] or
+ * arm_aarch64_machine_interfaces[] will be available
+ * in both qemu-system-arm and qemu-system-aarch64 binaries.
+ *
+ * One filtered with aarch64_machine_interfaces[] will only
+ * be available in the qemu-system-aarch64 binary.
+ */
+extern const InterfaceInfo arm_machine_interfaces[];
+extern const InterfaceInfo arm_aarch64_machine_interfaces[];
+extern const InterfaceInfo aarch64_machine_interfaces[];
+
+/*
+ * A machine defined with the DEFINE_MACHINE_ARM() macro will be
+ * available in both qemu-system-arm and qemu-system-aarch64 binaries.
+ *
+ * One defined with DEFINE_MACHINE_AARCH64() will only be available in
+ * the qemu-system-aarch64 binary.
+ */
+#define DEFINE_MACHINE_ARM(namestr, machine_initfn) \
+        DEFINE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, \
+                                            arm_machine_interfaces)
+#define DEFINE_MACHINE_AARCH64(namestr, machine_initfn) \
+        DEFINE_MACHINE_WITH_INTERFACE_ARRAY(namestr, machine_initfn, \
+                                            aarch64_machine_interfaces)
+
 #endif
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 44a0cf844b0..0befdb0b28a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -9,6 +9,7 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "target/arm/gtimer.h"
+#include "hw/arm/machines-qom.h"
 
 static bool vfp_needed(void *opaque)
 {
@@ -1212,3 +1213,20 @@ const VMStateDescription vmstate_arm_cpu = {
         NULL
     }
 };
+
+const InterfaceInfo arm_machine_interfaces[] = {
+    { TYPE_TARGET_ARM_MACHINE },
+    { TYPE_TARGET_AARCH64_MACHINE },
+    { }
+};
+
+const InterfaceInfo arm_aarch64_machine_interfaces[] = {
+    { TYPE_TARGET_ARM_MACHINE },
+    { TYPE_TARGET_AARCH64_MACHINE },
+    { }
+};
+
+const InterfaceInfo aarch64_machine_interfaces[] = {
+    { TYPE_TARGET_AARCH64_MACHINE },
+    { }
+};
-- 
2.51.0


