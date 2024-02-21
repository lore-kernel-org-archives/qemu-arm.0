Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2174120ejb;
        Wed, 21 Feb 2024 13:19:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxXk7Ig8vAp4orVrmdXUd3mn0cy31Uqsf6zf20Rcd3sdasCQmbFH9loboqZedLEdhSiDkNx70GpNv7JnkvgClpF6Bx9TPF
X-Google-Smtp-Source: AGHT+IHUR3L/7TAavACwXFqKuv2qAUtFSdX+rAeyp3tKHyMvLT6ZMHLPZ4RHDSHN6kVZZ17Xvfpw
X-Received: by 2002:a9d:6e8e:0:b0:6e2:e982:5bd7 with SMTP id a14-20020a9d6e8e000000b006e2e9825bd7mr20533657otr.31.1708550390024;
        Wed, 21 Feb 2024 13:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550389; cv=none;
        d=google.com; s=arc-20160816;
        b=WD1TUI7F9iI8UD4nFQWUmnDKOra5t3C6hIc/7axKxkpkAJT8WT4TV44zQJ7jivMKmS
         UcLs2YH986rDGZ8ClJHQbThqAVbWHBy62Nt5p0TMzoVQPz1NFaAcikBfOKS2ALzlNxnT
         VOwFPdEXxvjWLQ5ukIsS1GpDpWnU8sOtEO1QeL6hJFWIPsLzm4haPA0fABz7GnZBNRAG
         jQPTTPke7VtfvBtYbadrDFRZCWN4BcnnmyNZeOLxxGYxKaUN7B7xxNM0lR5uMt/TQ22V
         D7J182mybOi7YwROD//JlyJvJHK7cw3ad79XpMDDDLozIaQDYsogGwaLfEUpaevZuV9n
         4xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GU7gAHkVNY1ZnCm5tOTnwrsOZMxJGgzLpPFYNVYgH0g=;
        fh=Tm1JBeIpbRgXIQbzR7Pxs7dfN0JWk+aR4tRoAkqiPTU=;
        b=HODIfpnBR344mAcui9fwzIn/YzF0gunrr3IYFJqJRE4yzlAy84ZRNex0krJFyzP5T3
         77nIrOQLdrMPcgdZIWUmPXDtb+3o8Ftk0wBoXPNB7h2rLoCXEz5yy3Ft4xgFPo6DTPpk
         3jlT5ojt5ia2dK5OcQGBqYgc3vO2IGNlY+xV07CszDje2EANNPJblqwRJSYelE9w04ym
         pIoBgMjgBFddk9/XEqItjTGhyJAKQ+8Wtt2hBwY5DIJ4t35WrYJJvNL6b/7vcOnqoWnB
         OeWpykcjWqnl3pS13W4olMz2A0yEz55yCwClxDjzkIH5CCm82FG9uk4y/JXNXapwzOiW
         0DTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s2bYLsq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05622a134c00b0042e02fcfc98si9937349qtk.795.2024.02.21.13.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s2bYLsq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctxt-0002rN-9F; Wed, 21 Feb 2024 16:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctxZ-0002VE-LA
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:16:57 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctxX-0000pf-Ik
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:16:57 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4127946aa11so5428025e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550214; x=1709155014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GU7gAHkVNY1ZnCm5tOTnwrsOZMxJGgzLpPFYNVYgH0g=;
 b=s2bYLsq/SnTwAs0PbA68nT8WROylbqGw12WHNeXeDvXHA5Ipw1TC4u39WSBKOre/Rf
 eL7t+tno5MU1NBQ6K1NrGh10L8Cs2/AsuVRcJ25iyuSN9+tE8rTcs+0vNBXJeQyH4ecU
 /kjCakh/NDBAFgKXodOwwwRg7eBCjdI1U38dARbstT0KySPDwU7SssOFJC59CDytSsfN
 zAkKKtHufOD/sPxKffC8Iz4uYsqOMHbeuCPj0bikcvdfP6dHus5K7G9iJBowgZ/QCCXw
 meAMy0HULcxg9VQcLG6jvyOCSz9qg4IE5iQVa+bEh3rh/Zs6LNn2f5n7v9Tj+9LgYpic
 Mo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550214; x=1709155014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GU7gAHkVNY1ZnCm5tOTnwrsOZMxJGgzLpPFYNVYgH0g=;
 b=qb+g6KDET2pqtMHyJPwg91uGlrj+Rx2UMXFrs6YpFOykpTQX6hPeMPIynb4sHahTRN
 e4Pw1LN5zckDiGKH+uAz7MXdswqYn36GRUIC1f6bC+qI/1PCWw6gjfEDDl0HA60x72sl
 WnjwTuu4+bw2IcFU5p7hBJXKltu1yKvBEtLTwvhm3FwL/8u868R+BdumJW3MVxIo4nyK
 BsWLOgv0vtdjQl+DixGkijYy4LIG8m4ezjPxpXhnLnauVxTFjpLM2mCyx9y7Yucv1Ni2
 b5tBwT4Tlzul3z8XO1gF+ifR9UhXQyya3zlTpFo92ZACh43rEmVnBWerjJcLfm/1YiEQ
 +mng==
X-Gm-Message-State: AOJu0YyZhHQfRFxN1IIZy7C8b0QO8PD/CWLLtIrRql5nt7jDjg+HxZYc
 muJeD8C2JqwSsVqe//IIhHHykoeTdla6GG4foVfTG6nL6WHqJBCkc3LEC7FtFSw=
X-Received: by 2002:a5d:47ac:0:b0:33d:38cf:aa76 with SMTP id
 12-20020a5d47ac000000b0033d38cfaa76mr10702068wrb.46.1708550213945; 
 Wed, 21 Feb 2024 13:16:53 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 df5-20020a5d5b85000000b0033d87557283sm997351wrb.0.2024.02.21.13.16.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:16:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 04/25] hw/ppc/ppc4xx_pci: Extract PCI host definitions to
 hw/pci-host/ppc4xx.h
Date: Wed, 21 Feb 2024 22:16:04 +0100
Message-ID: <20240221211626.48190-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZH3ylWmHZhb0

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240215105017.57748-3-philmd@linaro.org>
---
 MAINTAINERS                  |  1 +
 include/hw/pci-host/ppc4xx.h | 17 +++++++++++++++++
 include/hw/ppc/ppc4xx.h      |  5 -----
 hw/ppc/ppc440_bamboo.c       |  1 +
 hw/ppc/ppc440_pcix.c         |  2 +-
 hw/ppc/ppc440_uc.c           |  1 +
 hw/ppc/ppc4xx_pci.c          |  2 +-
 hw/ppc/sam460ex.c            |  1 +
 8 files changed, 23 insertions(+), 7 deletions(-)
 create mode 100644 include/hw/pci-host/ppc4xx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d61fb9319..9b6ce9a934 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2070,6 +2070,7 @@ F: hw/ppc/ppc4xx*.c
 F: hw/ppc/ppc440_uc.c
 F: hw/ppc/ppc440.h
 F: hw/i2c/ppc4xx_i2c.c
+F: include/hw/pci-host/ppc4xx.h
 F: include/hw/ppc/ppc4xx.h
 F: include/hw/i2c/ppc4xx_i2c.h
 F: hw/intc/ppc-uic.c
diff --git a/include/hw/pci-host/ppc4xx.h b/include/hw/pci-host/ppc4xx.h
new file mode 100644
index 0000000000..32396417fc
--- /dev/null
+++ b/include/hw/pci-host/ppc4xx.h
@@ -0,0 +1,17 @@
+/*
+ * QEMU PowerPC 4xx PCI-host definitions
+ *
+ * Copyright (c) 2018-2023 BALATON Zoltan
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_PCIHOST_PPC4XX_H
+#define HW_PCIHOST_PPC4XX_H
+
+#define TYPE_PPC4xx_HOST_BRIDGE "ppc4xx-host-bridge"
+#define TYPE_PPC4xx_PCI_HOST "ppc4xx-pci-host"
+#define TYPE_PPC440_PCIX_HOST "ppc440-pcix-host"
+#define TYPE_PPC460EX_PCIE_HOST "ppc460ex-pcie-host"
+
+#endif
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index ea7740239b..1bd9b8821b 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,11 +29,6 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
-#define TYPE_PPC4xx_HOST_BRIDGE "ppc4xx-host-bridge"
-#define TYPE_PPC4xx_PCI_HOST "ppc4xx-pci-host"
-#define TYPE_PPC440_PCIX_HOST "ppc440-pcix-host"
-#define TYPE_PPC460EX_PCIE_HOST "ppc460ex-pcie-host"
-
 /*
  * Generic DCR device
  */
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index c75c3083e6..e18f57efce 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -24,6 +24,7 @@
 #include "elf.h"
 #include "hw/char/serial.h"
 #include "hw/ppc/ppc.h"
+#include "hw/pci-host/ppc4xx.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
 #include "hw/sysbus.h"
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index d84418cb7b..1926ae2a27 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -25,7 +25,7 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "hw/irq.h"
-#include "hw/ppc/ppc4xx.h"
+#include "hw/pci-host/ppc4xx.h"
 #include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "trace.h"
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 7d6ca70387..1312aa2080 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -14,6 +14,7 @@
 #include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/ppc/ppc4xx.h"
+#include "hw/pci-host/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
 #include "sysemu/reset.h"
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index e4101398c9..b6c6c8993c 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -24,7 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "hw/irq.h"
-#include "hw/ppc/ppc4xx.h"
+#include "hw/pci-host/ppc4xx.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/reset.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 1e615b8d35..a28498f39c 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -25,6 +25,7 @@
 #include "elf.h"
 #include "exec/memory.h"
 #include "ppc440.h"
+#include "hw/pci-host/ppc4xx.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
-- 
2.41.0

