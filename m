Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289022njb;
        Mon, 7 Oct 2024 18:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAVUalpWFj4l0EJ6jMYEPS/bKEz7f3KQoAymfnmS2U5zPDke2YAuFdpmqNbh3QvqJCxSbkSGDpK4ZOEg==@linaro.org
X-Google-Smtp-Source: AGHT+IGQ+7n882v4M6fd0JXHNzEnXfbEJiXTMt4XFABqzTbftl364R8xqCbxgQAs+dJmi/7FY1Xp
X-Received: by 2002:a05:620a:248b:b0:7a6:5a80:7ee7 with SMTP id af79cd13be357-7ae6f48ae99mr2297041285a.46.1728350489261;
        Mon, 07 Oct 2024 18:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350489; cv=none;
        d=google.com; s=arc-20240605;
        b=go/wFQ+EylGEerrnZvBolso9vaiQj7GnRks1+k0hCVS9E0MnH19Mq0CQNQF9qR5Ihw
         gMq2RJacBqgFnQM7y3xwki/X/JaEuPusLZA+RoXmnOzw2dUKejk6YCipM3WmZomvCWsp
         Ua2WT1luZCFgSoEQmSbzImXceJntRh+GnctXflqau2Xa2NUe0CQaDjct/oSUVlaqIsZz
         uC+SSfl8j3IwyysQFJxGWLb67u4IsCwyKbuKUERmLI+Q3u8alRsfCDKu0L5S1dr4QLKg
         IIm6Bnow0jLMTcIMzfi0pxAQoVTOEqRV7AX35vJrFY6kMCBgm+lyypwLLUbhTcuPJ0yQ
         npSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=YIWmowqh9ilBPFqbJVFwbgPlrwHIw046vPnX3/duUf8=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=ed2eR74mUnpMxGJE6pyehvqORbP2yor/XRLSAhBoDTChBF9nwn+zzjQTwKdnUR9qKO
         krnw1PR2WQ8iaBFVlMuD+g1GNzJi2GSmy1l6nDGZ64XMuA7nfhXA4qPWjMIWy4nEgMfu
         67v1apbuyufYRaMmleF51Eu9CPqXbxe4+mi3sj9RdmZFudrTD6rIsDwYJVpHdjUhFWun
         igiRCgACDusSdzBHfq4KzsfGUh6KWCtvmdedehANRD2lu4t5pY7GzjseTuiWiAnlw8A2
         Y1BG0hmsuVy8OfhZXqkXwRRWAHSUTBdpbC60n1GxoiwsHx6uQKXYh9pvqUqhl7eG2q4N
         GiJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=u7ui+LIm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da74ac725si79041391cf.12.2024.10.07.18.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=u7ui+LIm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxytl-0003aY-Sz; Mon, 07 Oct 2024 21:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3k4gEZwUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com>)
 id 1sxysp-0007zq-UH
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:30 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3k4gEZwUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com>)
 id 1sxysi-0000Af-DW
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:26 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-6e2d1860a62so47738217b3.0
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350356; x=1728955156; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YIWmowqh9ilBPFqbJVFwbgPlrwHIw046vPnX3/duUf8=;
 b=u7ui+LImFaOOJ5kLN/Jmoe0p2opkvfDsBTOeA0VDRthZMHvRzGRU5al3GHV9mtUeWc
 gFaEX2ivu3B0QGomD11CP4sbBhZVIzyIeYZDH5AGYUdTXPZp5b3Ni8KIDe9Zle0oMgnL
 YIv2d82Qcl2gLSaTeljpdRwY5KINJQF6BhO//9aX6d9DDHpluZg+g4eorTdTnOXDfNYe
 DkrqnfDhL/5P+sGfbnb50VfErshZA0k5jrHG7KJ8F8bg3xjOMzuniH1umvw7eKx9z4FT
 5vJhje+nwb3sqFlt4dZeI+YkVPXV+BUdAOajR6jALm+dl0plhhXSlgTbkqK1ZR4ssM4C
 q/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350356; x=1728955156;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YIWmowqh9ilBPFqbJVFwbgPlrwHIw046vPnX3/duUf8=;
 b=LcrA7NjaCotZbw+6aaWk9trdMtRhm7108IMAxDgJFYLfndHC7TQ35ociSumYx5pKtC
 GEq6bxK1hJeSAT2qxeKRtZIANTWMbzQOQGrMVnz1DJ83WYrDaRAVpFjpEGv1IXJ9Sobg
 hidJ+BIKw5zz0hYpB9VDx8hp1i4qqBdomtRWEKw/aNLD8wa4Dau7kwKdBv0j4bPjFsaY
 /cmu6xiTWRBQd6rriODOXtOW6H5MKUkUffLJxFnWUcSvBDl3Q7grnlo2nZRfOibnpYYC
 m6L9xmI3Dba8QXEaccgxbeBMoSNctAfEwI1PXCTxp1CzGfVgguJ9RpH2iYqgTbGY/d5m
 lw9g==
X-Gm-Message-State: AOJu0YzRKAGIrh+WAmM3OfoSou7zLOtYQRDPMr4aqQD31VUF5A1xxwel
 TWX8fbYp2AeJQBd2B7ylxOBNzy65XPdykjdUy3Bn0K/8YHXzI5Abu+Lgjdl6v/kUlR6Zk7YWEg=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:690c:2c87:b0:6e2:b263:1040
 with SMTP id
 00721157ae682-6e2c6e88722mr1437387b3.0.1728350355919; Mon, 07 Oct 2024
 18:19:15 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:38 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-13-tavip@google.com>
Subject: [PATCH v2 12/25] hw/misc: add support for RT500's reset controller
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3k4gEZwUKCPQpWrelckkcha.Ykimaiq-Wnijkjcjq.knc@flex--tavip.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 2uMZ112IrKNn

The RT500 reset controller has two instances that have the same
register layout but with different fields for some registers.

The model only provides set and clear functionality for the various
reset lines which is common for both instances. Because of that only
one type is implemented for both controllers.

The patch includes automatically generated headers which contains the
register layout and helpers.

The header can be regenerated with the svd-rstctl0 and svd-rstctl1
targets when the build is configured with --enable-mcux-soc-svd.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/arm/svd/rt500_rstctl0.h | 110 ++++++++++++
 include/hw/arm/svd/rt500_rstctl1.h | 110 ++++++++++++
 include/hw/misc/rt500_rstctl.h     |  32 ++++
 hw/misc/rt500_rstctl.c             | 258 +++++++++++++++++++++++++++++
 hw/arm/svd/meson.build             |   8 +
 hw/misc/Kconfig                    |   3 +
 hw/misc/meson.build                |   1 +
 hw/misc/trace-events               |   4 +
 8 files changed, 526 insertions(+)
 create mode 100644 include/hw/arm/svd/rt500_rstctl0.h
 create mode 100644 include/hw/arm/svd/rt500_rstctl1.h
 create mode 100644 include/hw/misc/rt500_rstctl.h
 create mode 100644 hw/misc/rt500_rstctl.c

diff --git a/include/hw/arm/svd/rt500_rstctl0.h b/include/hw/arm/svd/rt500_rstctl0.h
new file mode 100644
index 0000000000..da25f22208
--- /dev/null
+++ b/include/hw/arm/svd/rt500_rstctl0.h
@@ -0,0 +1,110 @@
+/*
+ * Copyright 2016-2023 NXP SPDX-License-Identifier: BSD-3-Clause
+ *
+ * Automatically generated by svd-gen-header.py from MIMXRT595S_cm33.xml
+ */
+#pragma once
+
+#include "hw/register.h"
+
+/* Reset Controller 0 */
+#define RT500_RSTCTL0_REGS_NO (31)
+
+/* System Reset Status Register */
+REG32(RT500_RSTCTL0_SYSRSTSTAT, 0x0);
+
+/* Peripheral Reset Control Register 0 */
+REG32(RT500_RSTCTL0_PRSTCTL0, 0x10);
+
+/* Peripheral Reset Control Register 1 */
+REG32(RT500_RSTCTL0_PRSTCTL1, 0x14);
+
+/* Peripheral Reset Control Register 2 */
+REG32(RT500_RSTCTL0_PRSTCTL2, 0x18);
+
+/* Peripheral Reset Control Register 0 SET */
+REG32(RT500_RSTCTL0_PRSTCTL0_SET, 0x40);
+
+/* Peripheral Reset Control Register 1 SET */
+REG32(RT500_RSTCTL0_PRSTCTL1_SET, 0x44);
+
+/* Peripheral Reset Control Register 2 SET */
+REG32(RT500_RSTCTL0_PRSTCTL2_SET, 0x48);
+
+/* Peripheral Reset Control Register 0 CLR */
+REG32(RT500_RSTCTL0_PRSTCTL0_CLR, 0x70);
+
+/* Peripheral Reset Control Register 1 CLR */
+REG32(RT500_RSTCTL0_PRSTCTL1_CLR, 0x74);
+
+/* Peripheral Reset Control Register 2 CLR */
+REG32(RT500_RSTCTL0_PRSTCTL2_CLR, 0x78);
+
+
+#define RT500_RSTCTL0_REGISTER_ACCESS_INFO_ARRAY(_name) \
+    struct RegisterAccessInfo _name[RT500_RSTCTL0_REGS_NO] = { \
+        [0 ... RT500_RSTCTL0_REGS_NO - 1] = { \
+            .name = "", \
+            .addr = -1, \
+        }, \
+        [0x0] = { \
+            .name = "SYSRSTSTAT", \
+            .addr = 0x0, \
+            .ro = 0xFFFFFF0E, \
+            .reset = 0x1, \
+        }, \
+        [0x4] = { \
+            .name = "PRSTCTL0", \
+            .addr = 0x10, \
+            .ro = 0x820AE0F5, \
+            .reset = 0x7DF51F0A, \
+        }, \
+        [0x5] = { \
+            .name = "PRSTCTL1", \
+            .addr = 0x14, \
+            .ro = 0xFEFE7FF3, \
+            .reset = 0x101800C, \
+        }, \
+        [0x6] = { \
+            .name = "PRSTCTL2", \
+            .addr = 0x18, \
+            .ro = 0xFFFFFFFC, \
+            .reset = 0x1C000001, \
+        }, \
+        [0x10] = { \
+            .name = "PRSTCTL0_SET", \
+            .addr = 0x40, \
+            .ro = 0x820AE0F5, \
+            .reset = 0x0, \
+        }, \
+        [0x11] = { \
+            .name = "PRSTCTL1_SET", \
+            .addr = 0x44, \
+            .ro = 0xFEFE7FF3, \
+            .reset = 0x0, \
+        }, \
+        [0x12] = { \
+            .name = "PRSTCTL2_SET", \
+            .addr = 0x48, \
+            .ro = 0xFFFFFFFC, \
+            .reset = 0x0, \
+        }, \
+        [0x1C] = { \
+            .name = "PRSTCTL0_CLR", \
+            .addr = 0x70, \
+            .ro = 0x820AE0F5, \
+            .reset = 0x0, \
+        }, \
+        [0x1D] = { \
+            .name = "PRSTCTL1_CLR", \
+            .addr = 0x74, \
+            .ro = 0xFEFE7FF3, \
+            .reset = 0x0, \
+        }, \
+        [0x1E] = { \
+            .name = "PRSTCTL2_CLR", \
+            .addr = 0x78, \
+            .ro = 0xFFFFFFFC, \
+            .reset = 0x0, \
+        }, \
+    }
diff --git a/include/hw/arm/svd/rt500_rstctl1.h b/include/hw/arm/svd/rt500_rstctl1.h
new file mode 100644
index 0000000000..7b0380798f
--- /dev/null
+++ b/include/hw/arm/svd/rt500_rstctl1.h
@@ -0,0 +1,110 @@
+/*
+ * Copyright 2016-2023 NXP SPDX-License-Identifier: BSD-3-Clause
+ *
+ * Automatically generated by svd-gen-header.py from MIMXRT595S_cm33.xml
+ */
+#pragma once
+
+#include "hw/register.h"
+
+/* Reset Controller 1 */
+#define RT500_RSTCTL1_REGS_NO (31)
+
+/* System Reset Status Register */
+REG32(RT500_RSTCTL1_SYSRSTSTAT, 0x0);
+
+/* Peripheral Reset Control Register 0 */
+REG32(RT500_RSTCTL1_PRSTCTL0, 0x10);
+
+/* Peripheral Reset Control Register 1 */
+REG32(RT500_RSTCTL1_PRSTCTL1, 0x14);
+
+/* Peripheral Reset Control Register 2 */
+REG32(RT500_RSTCTL1_PRSTCTL2, 0x18);
+
+/* Peripheral Reset Control Register 0 SET */
+REG32(RT500_RSTCTL1_PRSTCTL0_SET, 0x40);
+
+/* Peripheral Reset Control Register 1 SET */
+REG32(RT500_RSTCTL1_PRSTCTL1_SET, 0x44);
+
+/* Peripheral Reset Control Register 2 SET */
+REG32(RT500_RSTCTL1_PRSTCTL2_SET, 0x48);
+
+/* Peripheral Reset Control Register 0 CLR */
+REG32(RT500_RSTCTL1_PRSTCTL0_CLR, 0x70);
+
+/* Peripheral Reset Control Register 1 CLR */
+REG32(RT500_RSTCTL1_PRSTCTL1_CLR, 0x74);
+
+/* Peripheral Reset Control Register 2 CLR */
+REG32(RT500_RSTCTL1_PRSTCTL2_CLR, 0x78);
+
+
+#define RT500_RSTCTL1_REGISTER_ACCESS_INFO_ARRAY(_name) \
+    struct RegisterAccessInfo _name[RT500_RSTCTL1_REGS_NO] = { \
+        [0 ... RT500_RSTCTL1_REGS_NO - 1] = { \
+            .name = "", \
+            .addr = -1, \
+        }, \
+        [0x0] = { \
+            .name = "SYSRSTSTAT", \
+            .addr = 0x0, \
+            .ro = 0xFFFFFFFF, \
+            .reset = 0x1, \
+        }, \
+        [0x4] = { \
+            .name = "PRSTCTL0", \
+            .addr = 0x10, \
+            .ro = 0xD40000FF, \
+            .reset = 0x1C0FF00, \
+        }, \
+        [0x5] = { \
+            .name = "PRSTCTL1", \
+            .addr = 0x14, \
+            .ro = 0x4E7EFF00, \
+            .reset = 0xB18100FF, \
+        }, \
+        [0x6] = { \
+            .name = "PRSTCTL2", \
+            .addr = 0x18, \
+            .ro = 0x3FFCFAE0, \
+            .reset = 0xC001011F, \
+        }, \
+        [0x10] = { \
+            .name = "PRSTCTL0_SET", \
+            .addr = 0x40, \
+            .ro = 0xD40000FF, \
+            .reset = 0x0, \
+        }, \
+        [0x11] = { \
+            .name = "PRSTCTL1_SET", \
+            .addr = 0x44, \
+            .ro = 0x4E7EFF00, \
+            .reset = 0x0, \
+        }, \
+        [0x12] = { \
+            .name = "PRSTCTL2_SET", \
+            .addr = 0x48, \
+            .ro = 0x3FFCFAE0, \
+            .reset = 0x0, \
+        }, \
+        [0x1C] = { \
+            .name = "PRSTCTL0_CLR", \
+            .addr = 0x70, \
+            .ro = 0xD40000FF, \
+            .reset = 0x0, \
+        }, \
+        [0x1D] = { \
+            .name = "PRSTCTL1_CLR", \
+            .addr = 0x74, \
+            .ro = 0x4E7EFF00, \
+            .reset = 0x0, \
+        }, \
+        [0x1E] = { \
+            .name = "PRSTCTL2_CLR", \
+            .addr = 0x78, \
+            .ro = 0x3FFCFAE0, \
+            .reset = 0x0, \
+        }, \
+    }
diff --git a/include/hw/misc/rt500_rstctl.h b/include/hw/misc/rt500_rstctl.h
new file mode 100644
index 0000000000..ae7e304b2e
--- /dev/null
+++ b/include/hw/misc/rt500_rstctl.h
@@ -0,0 +1,32 @@
+/*
+ * QEMU model for RT500 Reset Controller
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_MISC_RT500_RSTCTL_H
+#define HW_MISC_RT500_RSTCTL_H
+
+#include "hw/arm/svd/rt500_rstctl0.h"
+#include "hw/arm/svd/rt500_rstctl1.h"
+#include "hw/sysbus.h"
+
+#define TYPE_RT500_RSTCTL "rt500-rstctl"
+#define RT500_RSTCTL(o) OBJECT_CHECK(RT500RstCtlState, o, TYPE_RT500_RSTCTL)
+
+#define TYPE_RT500_RSTCTL0 "rt500-rstctl0"
+#define TYPE_RT500_RSTCTL1 "rt500-rstctl1"
+
+typedef struct {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    uint32_t regs[RT500_RSTCTL1_REGS_NO];
+} RT500RstCtlState;
+
+#endif /* HW_MISC_RT500_RSTCTL_H */
diff --git a/hw/misc/rt500_rstctl.c b/hw/misc/rt500_rstctl.c
new file mode 100644
index 0000000000..a6e818c0a0
--- /dev/null
+++ b/hw/misc/rt500_rstctl.c
@@ -0,0 +1,258 @@
+/*
+ * QEMU model for RT500 Reset Controller
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "migration/vmstate.h"
+#include "hw/misc/rt500_rstctl.h"
+
+#include "trace.h"
+
+/*
+ * There are two intances for RSTCTL with the same register names and layout but
+ * with different fields.
+ */
+#define BUILD_BUG_REG_ADDR(reg) \
+    QEMU_BUILD_BUG_ON((int)A_RT500_RSTCTL0_##reg != (int)A_RT500_RSTCTL1_##reg)
+
+#define REG(s, reg) (s->regs[R_RT500_RSTCTL0_##reg])
+#define RF_WR(s, reg, field, val) \
+    ARRAY_FIELD_DP32(s->regs, RT500_RSTCTL0_##reg, field, val)
+#define RF_RD(s, reg, field) \
+    ARRAY_FIELD_EX32(s->regs, RT500_RSTCTL0_##reg, field)
+
+#define RSTCTL_SYSRSTSTAT_WMASK (BITS(7, 4) | BIT(0))
+#define RSTCL0_PRSCTL0_WMASK (BITS(30, 26) | BITS(24, 20) | BIT(18) | \
+                              BIT(16) | BITS(12, 8) | BIT(3) | BIT(1))
+#define RSTCL0_PRSCTL1_WMASK (BIT(24) | BITS(16, 15) | BITS(3, 2))
+#define RSTCL0_PRSCTL2_WMASK (BITS(1, 0))
+#define RSTCL1_PRSCTL0_WMASK (BIT(29) | BIT(27) |  BITS(25, 8))
+#define RSTCL1_PRSCTL1_WMASK (BIT(31) | BITS(29, 28) | BITS(24, 23) | \
+                              BIT(16) | BITS(7, 0))
+#define RSTCL1_PRSCTL2_WMASK (BITS(31, 30) | BITS(17, 16) | BIT(10) | \
+                              BIT(8) | BITS(4, 0))
+
+
+/*
+ * The two RSTCLK modules have different write register masks.
+ */
+typedef struct {
+    SysBusDeviceClass parent;
+    const struct RegisterAccessInfo *reg_info;
+    int reg_info_num;
+} RT500RstCtlClass;
+
+#define RT500_RSTCTL_CLASS(klass) \
+    OBJECT_CLASS_CHECK(RT500RstCtlClass, (klass), TYPE_RT500_RSTCTL)
+#define RT500_RSTCTL_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(RT500RstCtlClass, (obj), TYPE_RT500_RSTCTL)
+
+BUILD_BUG_REG_ADDR(SYSRSTSTAT);
+BUILD_BUG_REG_ADDR(PRSTCTL0);
+BUILD_BUG_REG_ADDR(PRSTCTL1);
+BUILD_BUG_REG_ADDR(PRSTCTL2);
+BUILD_BUG_REG_ADDR(PRSTCTL0_SET);
+BUILD_BUG_REG_ADDR(PRSTCTL1_SET);
+BUILD_BUG_REG_ADDR(PRSTCTL2_SET);
+BUILD_BUG_REG_ADDR(PRSTCTL0_CLR);
+BUILD_BUG_REG_ADDR(PRSTCTL1_CLR);
+BUILD_BUG_REG_ADDR(PRSTCTL2_CLR);
+
+static MemTxResult rt500_rstctl_read(void *opaque, hwaddr addr,
+                                     uint64_t *data, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    RT500RstCtlState *s = opaque;
+    RT500RstCtlClass *c = RT500_RSTCTL_GET_CLASS(s);
+    const struct RegisterAccessInfo *rai = &c->reg_info[addr / 4];
+    MemTxResult ret = MEMTX_OK;
+
+    switch (addr) {
+    case A_RT500_RSTCTL0_SYSRSTSTAT:
+    case A_RT500_RSTCTL0_PRSTCTL0:
+    case A_RT500_RSTCTL0_PRSTCTL1:
+    case A_RT500_RSTCTL0_PRSTCTL2:
+        *data = s->regs[addr / 4];
+        break;
+    default:
+        ret = MEMTX_ERROR;
+    }
+
+    trace_rt500_rstctl_reg_read(DEVICE(s)->id, rai->name, addr, *data);
+    return ret;
+}
+
+static MemTxResult rt500_rstctl_write(void *opaque, hwaddr addr,
+                                      uint64_t value, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    RT500RstCtlState *s = opaque;
+    RT500RstCtlClass *c = RT500_RSTCTL_GET_CLASS(s);
+    const struct RegisterAccessInfo *rai = &c->reg_info[addr / 4];
+    struct RegisterInfo ri = {
+        .data = &s->regs[addr / 4],
+        .data_size = 4,
+        .access = rai,
+    };
+
+    trace_rt500_rstctl_reg_write(DEVICE(s)->id, rai->name, addr, value);
+
+    switch (addr) {
+    case A_RT500_RSTCTL0_SYSRSTSTAT:
+    {
+        /* write 1 to clear bits */
+        REG(s, SYSRSTSTAT) &= ~value;
+        break;
+    }
+    case A_RT500_RSTCTL0_PRSTCTL0:
+    case A_RT500_RSTCTL0_PRSTCTL1:
+    case A_RT500_RSTCTL0_PRSTCTL2:
+    {
+        register_write(&ri, value, ~0, NULL, false);
+        break;
+    }
+    case A_RT500_RSTCTL0_PRSTCTL0_SET:
+    case A_RT500_RSTCTL0_PRSTCTL1_SET:
+    case A_RT500_RSTCTL0_PRSTCTL2_SET:
+    {
+        uint32_t tmp;
+
+        tmp = A_RT500_RSTCTL0_PRSTCTL0 + (addr - A_RT500_RSTCTL0_PRSTCTL0_SET);
+        s->regs[tmp / 4] |= value;
+        break;
+    }
+    case A_RT500_RSTCTL0_PRSTCTL0_CLR:
+    case A_RT500_RSTCTL0_PRSTCTL1_CLR:
+    case A_RT500_RSTCTL0_PRSTCTL2_CLR:
+    {
+        uint32_t tmp;
+
+        tmp = A_RT500_RSTCTL0_PRSTCTL0 + (addr - A_RT500_RSTCTL0_PRSTCTL0_CLR);
+        s->regs[tmp / 4] &= ~value;
+        break;
+    }
+    }
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps rt500_rstctl_ops = {
+    .read_with_attrs = rt500_rstctl_read,
+    .write_with_attrs = rt500_rstctl_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void rt500_rstctl_reset_enter(Object *obj, ResetType type)
+{
+    RT500RstCtlState *s = RT500_RSTCTL(obj);
+    RT500RstCtlClass *c = RT500_RSTCTL_GET_CLASS(s);
+
+    for (int i = 0; i < c->reg_info_num; i++) {
+        hwaddr addr = c->reg_info[i].addr;
+
+        if (addr != -1) {
+            struct RegisterInfo ri = {
+                .data = &s->regs[addr / 4],
+                .data_size = 4,
+                .access = &c->reg_info[i],
+            };
+
+            register_reset(&ri);
+        }
+    }
+}
+
+static void rt500_rstctl_init(Object *obj)
+{
+    RT500RstCtlState *s = RT500_RSTCTL(obj);
+
+    memory_region_init_io(&s->mmio, obj, &rt500_rstctl_ops, s,
+                          TYPE_RT500_RSTCTL, sizeof(s->regs));
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static const VMStateDescription vmstate_rt500_rstcl0 = {
+    .name = "rt500-rstctl0",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, RT500RstCtlState, RT500_RSTCTL0_REGS_NO),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_rt500_rstcl1 = {
+    .name = "rt500-rstctl1",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, RT500RstCtlState, RT500_RSTCTL1_REGS_NO),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void rt500_rstctl0_class_init(ObjectClass *klass, void *data)
+{
+    RT500RstCtlClass *rc = RT500_RSTCTL_CLASS(klass);
+    static const RT500_RSTCTL0_REGISTER_ACCESS_INFO_ARRAY(reg_info);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    RESETTABLE_CLASS(klass)->phases.enter = rt500_rstctl_reset_enter;
+    dc->vmsd = &vmstate_rt500_rstcl0;
+    rc->reg_info = reg_info;
+    rc->reg_info_num = ARRAY_SIZE(reg_info);
+}
+
+static void rt500_rstctl1_class_init(ObjectClass *klass, void *data)
+{
+    RT500RstCtlClass *rc = RT500_RSTCTL_CLASS(klass);
+    static const RT500_RSTCTL1_REGISTER_ACCESS_INFO_ARRAY(reg_info);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    RESETTABLE_CLASS(klass)->phases.enter = rt500_rstctl_reset_enter;
+    dc->vmsd = &vmstate_rt500_rstcl1;
+    rc->reg_info = reg_info;
+    rc->reg_info_num = ARRAY_SIZE(reg_info);
+}
+
+static const TypeInfo rt500_rstctl_types[] = {
+    {
+        .name          = TYPE_RT500_RSTCTL,
+        .parent        = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(RT500RstCtlState),
+        .instance_init = rt500_rstctl_init,
+        .abstract      = true,
+    },
+    {
+        .name          = TYPE_RT500_RSTCTL0,
+        .parent        = TYPE_RT500_RSTCTL,
+        .class_init    = rt500_rstctl0_class_init,
+        .class_size    = sizeof(RT500RstCtlClass),
+    },
+    {
+        .name          = TYPE_RT500_RSTCTL1,
+        .parent        = TYPE_RT500_RSTCTL,
+        .class_init    = rt500_rstctl1_class_init,
+        .class_size    = sizeof(RT500RstCtlClass),
+    },
+};
+
+DEFINE_TYPES(rt500_rstctl_types);
diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
index adf0f8327a..eb2fab54f5 100644
--- a/hw/arm/svd/meson.build
+++ b/hw/arm/svd/meson.build
@@ -28,4 +28,12 @@ if get_option('mcux-soc-svd')
     [ '-i', rt595, '-o', '@SOURCE_ROOT@/include/hw/arm/svd/flexspi.h',
       '-p', 'FLEXSPI0', '-t', 'FLEXSPI',
       '--fields', 'STS0:SEQIDLE MCR0:SWRESET INTR:IPCMDDONE'])
+  run_target('svd-rt500-rstctl0', command: svd_gen_header +
+    [ '-i', rt595, '-o', '@SOURCE_ROOT@/include/hw/arm/svd/rt500_rstctl0.h',
+      '-p', 'RSTCTL0', '-t', 'RT500_RSTCTL0',
+      '--fields', 'SYSRSTSTAT: PRSTCTL*:'])
+  run_target('svd-rt500-rstctl1', command: svd_gen_header +
+    [ '-i', rt595, '-o', '@SOURCE_ROOT@/include/hw/arm/svd/rt500_rstctl1.h',
+      '-p', 'RSTCTL1', '-t', 'RT500_RSTCTL1',
+      '--fields', 'SYSRSTSTAT: PRSTCTL*:'])
 endif
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 02feb93840..4b688aead2 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -221,4 +221,7 @@ config FLEXCOMM
 config RT500_CLKCTL
     bool
 
+config RT500_RSTCTL
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 15f9153be4..bf0988fd43 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -154,3 +154,4 @@ system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkctl0.c', 'rt500_clkctl1.c'))
+system_ss.add(when: 'CONFIG_RT500_RSTCTL', if_true: files('rt500_rstctl.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b19393dd36..721ebe4bb7 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -376,3 +376,7 @@ rt500_clkctl0_reg_write(const char *regname, uint32_t addr, uint32_t val) "%s[0x
 # rt500_clkctl1.c
 rt500_clkctl1_reg_read(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] -> 0x%08x"
 rt500_clkctl1_reg_write(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] <- 0x%08x"
+
+# rt500_rstctl.c
+rt500_rstctl_reg_read(const char *id, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] -> 0x%08x"
+rt500_rstctl_reg_write(const char *id, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
-- 
2.47.0.rc0.187.ge670bccf7e-goog

