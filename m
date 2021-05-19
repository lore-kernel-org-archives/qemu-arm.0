Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp896622lfm;
        Tue, 18 May 2021 17:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8g0lO3Q1ecGVFOvPqPH5vWr83Frza6QTBqCx5kkeYRq02g+xStca85F8dJwWleigfqpgy
X-Received: by 2002:a5d:8481:: with SMTP id t1mr7054326iom.39.1621382650854;
        Tue, 18 May 2021 17:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621382650; cv=none;
        d=google.com; s=arc-20160816;
        b=eVuctGh2zuGuhJP305fZ9BqBEvuMkfhuX3hPWF37YZbvx5Qq0sgHKbNa0FdEXNmcLU
         HGzPEF1fHPRu71ZBK192QeggYFb9lApKLSAW/kaImj0KDy6KNTh/SP/asg8OBY8kX6DY
         EJSmB0tzSE2KKBkuapPnMzF5wvwTeJnuLwnuain7Kn1/TTkwUnBm4EgU2qzv7KfS4XJa
         vHmUXCj+xD+PwTrCu2NsOU7UcFMrJ/VK6A6Hys/qLKwDwx0uv2OGQI02VUuYzrQXabHd
         9wS9xT1KIsP53E5/ZUIHbp+ewKge1bjRs31P6cH8LeHty9HIE+w9ktwHSGzP3ElXUOlG
         G+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ei6hA6Voi4g0dxlsggCJS5H+up1et4z2XYyd28qRn04=;
        b=NVDmGgLk5hvJJtKdjn/itWV+FrSlELx0JDmhvnS5wovq9aW/r/0eknQd3MgPCpvQvF
         3WrgpPcWvJnrLUzeu+b5AqIdZXq9pxA+OYb5owYoc5+sa87wrWeolcPONmY2ZihvKrPx
         MGL6cmKA0elXzk0CvkuqvBJbR2bkKCzkUkT4vRFEM5YLn2MZHAhF48hGcVIIvssu/eMq
         RSWOCd3JgFEJAwHHk2CviadKOPnDN3j5m8wDM/npKgscThWQiVyjheEL1OGaYWF9iarr
         3eoY24wvsco9XSsd/on/P+sK8QG/iQfrNFpsDgPuq0VqCLY9B5o2uSPxQ1wsynPPsK6x
         9DrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="u0qKP/xq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si15272299ioi.54.2021.05.18.17.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 17:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="u0qKP/xq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj9h4-0002yP-6U
	for alex.bennee@linaro.org; Tue, 18 May 2021 20:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gi-0002t7-Gd; Tue, 18 May 2021 20:03:48 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gg-0000OA-9S; Tue, 18 May 2021 20:03:48 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so10208782otc.12; 
 Tue, 18 May 2021 17:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ei6hA6Voi4g0dxlsggCJS5H+up1et4z2XYyd28qRn04=;
 b=u0qKP/xqeHh+yTgId4OkBau82lJv4LlWwlwLNkd2dvMQcE/z122YWnzPCWLX5dlAcJ
 UuttqGwChKN5yFVNvmWbnmy366qiZwbVcPnkRvTIN4drHcCJGSg6Yp3eG50an/AVelw7
 CyV+frVqJXqgGAlMdKn+aXLvjXBJSX9CPOfEanM4/nI/RdiVZW8LU2E5MAmApkO5uP60
 Lj75JgDa3uCykew/3I8607m6ESQx6ZDkB3f+zA6uACs0xzO9yb7YzFieTm1ETmk1LYoo
 YnNaoPl9STPA4NAQ0usEZpbtU5YoC216bWowdmFvsLBh75vJejv97qQjVhpPSaqoGORU
 ickg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ei6hA6Voi4g0dxlsggCJS5H+up1et4z2XYyd28qRn04=;
 b=crWGMmEde2ygZAelvttXOnp3E7oQkDrLYHWRiVBvj/KsHVR+r5xoLOX3/gFdLENSsy
 VpWvrDlpdmcjR7H6iqkqSIXtPbG1Szjr4HUbX247VnrAAdFZSXQPZqXU7phd+qjpe0ur
 tAHRFuQGK/kT6mMdoaf4HR0Lb3i+OXco3AQq+/axwQnJ8Vx9mSbUaB39LYpaGe2S6C2S
 CwNOr7f+6/P+kFoLuO19NZ4IUbIc1tNTZslysWcvGIXVhMR1v4yN+be0sXTvEMLv9n/B
 6dAGIpyGn9Z8mWDOrP2Ggu3A44ABfsSe82DiP1KtZcY3S1+6Gpz36g2PgQIzaXwVsOD+
 QSsA==
X-Gm-Message-State: AOAM531bocXnSm4p6xc65WZIMtlYRTmQea/SO/0hWtQaHQtUcfCcGuQ5
 1FhQMVtjQdyJJmOgv5UM2A==
X-Received: by 2002:a9d:17d0:: with SMTP id j74mr6238191otj.92.1621382624312; 
 Tue, 18 May 2021 17:03:44 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id o1sm4268877otj.39.2021.05.18.17.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 17:03:43 -0700 (PDT)
Received: from t560.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by serve.minyard.net (Postfix) with ESMTPA id 4297D1800EA;
 Wed, 19 May 2021 00:03:42 +0000 (UTC)
From: minyard@acm.org
To: qemu-devel@nongnu.org,
	Titus Rwantare <titusr@google.com>
Subject: [PATCH 2/3] adc: Move the max111x driver to the adc directory
Date: Tue, 18 May 2021 19:03:30 -0500
Message-Id: <20210519000331.3690536-3-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519000331.3690536-1-minyard@acm.org>
References: <20210519000331.3690536-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6N6tnPrgNYs9

From: Corey Minyard <cminyard@mvista.com>

It's an adc, put it where it belongs.

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 MAINTAINERS                        | 4 ++--
 hw/adc/Kconfig                     | 3 +++
 hw/{misc => adc}/max111x.c         | 2 +-
 hw/adc/meson.build                 | 3 ++-
 hw/arm/spitz.c                     | 2 +-
 hw/misc/Kconfig                    | 3 ---
 hw/misc/meson.build                | 1 -
 include/hw/{misc => adc}/max111x.h | 0
 8 files changed, 9 insertions(+), 9 deletions(-)
 rename hw/{misc => adc}/max111x.c (99%)
 rename include/hw/{misc => adc}/max111x.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6cb3b15f97..4fbedc7c11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -834,8 +834,8 @@ F: hw/display/tc6393xb.c
 F: hw/gpio/max7310.c
 F: hw/gpio/zaurus.c
 F: hw/misc/mst_fpga.c
-F: hw/misc/max111x.c
-F: include/hw/misc/max111x.h
+F: hw/adc/max111x.c
+F: include/hw/adc/max111x.h
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
 F: include/hw/display/tc6393xb.h
diff --git a/hw/adc/Kconfig b/hw/adc/Kconfig
index 25d2229fb8..a825bd3d34 100644
--- a/hw/adc/Kconfig
+++ b/hw/adc/Kconfig
@@ -1,2 +1,5 @@
 config STM32F2XX_ADC
     bool
+
+config MAX111X
+    bool
diff --git a/hw/misc/max111x.c b/hw/adc/max111x.c
similarity index 99%
rename from hw/misc/max111x.c
rename to hw/adc/max111x.c
index 1b3234a519..e8bf4cccd4 100644
--- a/hw/misc/max111x.c
+++ b/hw/adc/max111x.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/misc/max111x.h"
+#include "hw/adc/max111x.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index 3d397b4ea1..ac4f093fea 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -1,3 +1,4 @@
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
-softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
\ No newline at end of file
+softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
+softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index b45a929cbd..0e2626125e 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -30,7 +30,7 @@
 #include "audio/audio.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
-#include "hw/misc/max111x.h"
+#include "hw/adc/max111x.h"
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index c71ed25820..996d45aff5 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -11,9 +11,6 @@ config ARMSSE_MHU
 config ARMSSE_CPU_PWRCTRL
     bool
 
-config MAX111X
-    bool
-
 config TMP105
     bool
     depends on I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 508fce50c7..b0a8ee8994 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -3,7 +3,6 @@ softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
-softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
 softmmu_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
 softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
diff --git a/include/hw/misc/max111x.h b/include/hw/adc/max111x.h
similarity index 100%
rename from include/hw/misc/max111x.h
rename to include/hw/adc/max111x.h
-- 
2.25.1

