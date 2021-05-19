Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp896612lfm;
        Tue, 18 May 2021 17:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEozboB2Q0mrF3cyWg38X2E8LI7TbWJy+JHjQVoEykesUHfw2r4BfZJMdwUMIljWj+4ZKd
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr8829822jak.91.1621382649886;
        Tue, 18 May 2021 17:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621382649; cv=none;
        d=google.com; s=arc-20160816;
        b=ZmXL0ymStw16JuxJb5vrTv07DW2HeNvHH+vujZS1hKrRQlLDLE1InlUq0pBg1ElGoC
         /10OMOVBeMITTmdC4Id0PjEf/GDCLnKL4zAbZUPcaGNqAZz5am10Xyc7CiE9V0fegPok
         8TsCPvBSDj7cEMcP0mohYwPcEjBroCa3xByfCh8wFPH2q6Abt/EMC5nOIs4iJup6GSJQ
         keKxSblb3gEat9JTkHCq9O9IV/8eiAiYoGClGAjrYZKIY936ANX5oKkz3Sp9HwCvQc+K
         9TeqE2q+5O7U77a+ZMUN3CO1Pv7eDJIY3RhIxAGFEI2DCjuVjEMVizYkjGZKePqgqFs9
         w6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5OUsOo+ZCpiudrawUfOvbimEPvYDe3SmcHKVA1q1DR8=;
        b=R6LBTGjPIU3qVs0mUJiF3amV2UbVOabaiIyDCkJLOB4yIvyZeoNl18VOJQXl38uhmS
         5lR0viXBE8zNm2BEm9I14JIIb1mXxcUOS8bIUmgFUoZfGJhwM6QE2uJo/sx17I5Sb3pC
         w3K9y8YSl2p+wv3Wm7/HK0FX5JW70VPHRCHn9sgSpGFMvFWdvdgL7nMVwUZggWBO6gLO
         9XGSmpUcsEkSpzprzEfErERgEhEQzi1ynFLfDop/unAq+J5BRE9sVkxSd/uUwQnJ45gX
         +dvPa0BOeKnCvFzNcPdE2pZF2IdTU3FEzpLHQ1dJa0O4RHk36MXenVAH2QQBFRQThWAP
         t27Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Aghj3LzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si21770406ilz.34.2021.05.18.17.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 17:04:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Aghj3LzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj9h3-0002uo-13
	for alex.bennee@linaro.org; Tue, 18 May 2021 20:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gh-0002sh-Mk; Tue, 18 May 2021 20:03:47 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lj9gg-0000No-2J; Tue, 18 May 2021 20:03:47 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 s5-20020a05683004c5b029032307304915so2958634otd.7; 
 Tue, 18 May 2021 17:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5OUsOo+ZCpiudrawUfOvbimEPvYDe3SmcHKVA1q1DR8=;
 b=Aghj3LzCI5YJQ5+oFspfOVlZrg+aqfqaCv6NaV3Z1PTvC2WZE1tRmUSamzh0elsiqo
 bLzNKC47laCEr1PloEnsvjGNqwWyFnXtQq+uzNCr5syX3nKisIeXYygsTl32y1N2WhJJ
 HOUyVZ/+5vWjF/e/JSYfrBBAh/XnQpyqePZ3R22INhltmCZPxkOlqu3Uo1HIT2uJ6pWh
 ZOheOQPplm/1HuYLdL7IqThz00qUJ1Jz8yikhbnIxd9TST6A+0pxraVC4vBTK5Ga1/4r
 Ibuwy0jzQB2I7+gRTkpxRdJopDrKPCnYINYQ2zmP6jJ5JCh9Ke7nstexh0BBw/Ltl9OJ
 L/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5OUsOo+ZCpiudrawUfOvbimEPvYDe3SmcHKVA1q1DR8=;
 b=DfBjz+7Db1EwPmW5u8JnTL+rUBvHO7qGgO40zSK+8xmFzGfzaUmGd+xLuOQpWyDyF5
 1+ZHaotwVPVeRWCoe9HIpfgsUG9jqLq5DjkGpauKr7qVnZVKxyyY4exm7m06U3ZXtLcp
 Si5s2GsGrNfjrXN7/332mlS7Qs6F8YaYViEihAdDP5BUBQoH3qGwvk4dCKhqvHP2fl9N
 8SV4Kepwq24kYRv0bHk5wd0hsR5B9rxIYeLoD1Xj8Xa3iDpCTRGwgrmncUw/fcBBMn25
 jZXfXD+gwZrcGKkFm3E13R3vLTFM49ASadipfEL14z9mb0y4pnPaFw+C1majnr56OG7E
 UILg==
X-Gm-Message-State: AOAM531VxI42iM6yBRudQsRAbkW9AV4vqHjptR2iwGlmvEK3mkXsaEZo
 dWdc4rqqgB/JMyUb9fLwKg==
X-Received: by 2002:a9d:2de3:: with SMTP id g90mr6293529otb.274.1621382623941; 
 Tue, 18 May 2021 17:03:43 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id z15sm4265984otp.20.2021.05.18.17.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 17:03:42 -0700 (PDT)
Received: from t560.minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by serve.minyard.net (Postfix) with ESMTPA id 2C6051800D4;
 Wed, 19 May 2021 00:03:42 +0000 (UTC)
From: minyard@acm.org
To: qemu-devel@nongnu.org,
	Titus Rwantare <titusr@google.com>
Subject: [PATCH 1/3] adc: Move the zynq-xadc file to the adc directories
Date: Tue, 18 May 2021 19:03:29 -0500
Message-Id: <20210519000331.3690536-2-minyard@acm.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519000331.3690536-1-minyard@acm.org>
References: <20210519000331.3690536-1-minyard@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x329.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JorQDBylz0VG

From: Corey Minyard <cminyard@mvista.com>

It's an ADC, put it where it belongs.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 MAINTAINERS                          | 6 ++++--
 hw/adc/meson.build                   | 1 +
 hw/{misc => adc}/zynq-xadc.c         | 2 +-
 hw/arm/xilinx_zynq.c                 | 2 +-
 hw/misc/meson.build                  | 2 +-
 include/hw/{misc => adc}/zynq-xadc.h | 0
 6 files changed, 8 insertions(+), 5 deletions(-)
 rename hw/{misc => adc}/zynq-xadc.c (99%)
 rename include/hw/{misc => adc}/zynq-xadc.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index eab178aeee..6cb3b15f97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -913,8 +913,10 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/xilinx_*
 F: hw/*/cadence_*
-F: hw/misc/zynq*
-F: include/hw/misc/zynq*
+F: hw/misc/zynq_slcr.c
+F: hw/adc/zynq-xadc.c
+F: include/hw/misc/zynq_slcr.h
+F: include/hw/adc/zynq-xadc.h
 X: hw/ssi/xilinx_*
 
 Xilinx ZynqMP and Versal
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index 6ddee23813..3d397b4ea1 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -1,2 +1,3 @@
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
+softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
\ No newline at end of file
diff --git a/hw/misc/zynq-xadc.c b/hw/adc/zynq-xadc.c
similarity index 99%
rename from hw/misc/zynq-xadc.c
rename to hw/adc/zynq-xadc.c
index 7b1972ce06..cfc7bab065 100644
--- a/hw/misc/zynq-xadc.c
+++ b/hw/adc/zynq-xadc.c
@@ -15,7 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/misc/zynq-xadc.h"
+#include "hw/adc/zynq-xadc.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 81af32dc42..245af81bbb 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -26,7 +26,7 @@
 #include "hw/boards.h"
 #include "hw/block/flash.h"
 #include "hw/loader.h"
-#include "hw/misc/zynq-xadc.h"
+#include "hw/adc/zynq-xadc.h"
 #include "hw/ssi/ssi.h"
 #include "hw/usb/chipidea.h"
 #include "qemu/error-report.h"
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 66e1648533..508fce50c7 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -84,7 +84,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_cprman.c',
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
-softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc.c'))
+softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-xramc.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
diff --git a/include/hw/misc/zynq-xadc.h b/include/hw/adc/zynq-xadc.h
similarity index 100%
rename from include/hw/misc/zynq-xadc.h
rename to include/hw/adc/zynq-xadc.h
-- 
2.25.1

