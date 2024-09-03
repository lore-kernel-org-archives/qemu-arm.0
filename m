Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500456njf;
        Tue, 3 Sep 2024 09:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5MWq6ENpU/Xy6a5icOwuinpS7mnglbyPBz9KSmjM3BhUXZW6mXWm8QOpGZ7AG8yO6xxf1Wry7b12v2g==@linaro.org
X-Google-Smtp-Source: AGHT+IF8Lzyx124eVXjU5Igc4TCRTIRO9qDt+YQnaIjXFRaA5+ZzDBofiJ3dzGbGtXaTR0/H5db7
X-Received: by 2002:a05:6830:7317:b0:709:2fa3:1329 with SMTP id 46e09a7af769-70f71057f2cmr14817972a34.18.1725379791084;
        Tue, 03 Sep 2024 09:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379791; cv=none;
        d=google.com; s=arc-20160816;
        b=mIf7/imHW82bqOwcAnoCUXlZkhudiEqjvsrFAMpdk3anRAT80DI09psQXbg6PbHS4J
         hSyTn6K5n8jIVsyWu84NlyB6ONgo7Fx9S+HS7EgzKxxI3Wwja9/xmngLcIK08sJWz17S
         C8x90Zzys3gG+Po/Zu6QErStNgYEyB3fwM76ymZnFyNUF0Qbyiw9JVO8F/+sFvFmjDf+
         UDsMFLCrlXSMF5/FtG8xrDyrSdA7ttDbfngH4TjcJSrGEi5MIT3HcjICIflukg6kbY9s
         bwTOG0yGuoqG6EUiOhGZdgi6h9lX2QN/G5XYM39BiN6yinHa0DCmon9s/q+FkZ4sZYIq
         cxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fmZw44UFxtNmu5XvjUhvfl85V31SothT2rfnjTZFuAs=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=o4KBd3Bp8+cnL3ZoCFCmwZdNskfjrYvLv8Qd2XOEpJthf9lJnlf8UTWbpZWiv2vHNt
         FvbKy6byDXyMR2iyGtpIOW6EtSC0fCnJ0I1aYhpT4URqmQZ7siEuxC/T4RRiT8MUb+Hu
         KqB4OR6jZwnEow81Zs9X8an+fbUBjq42b8hycV8b7hQSLgEMm50wMDJ8HUz0MI2iUH/U
         9uCm/6/KFSjodrPf0tHK3yzN05POm4y88PgFtaDn1gdSvd+l0+WPtPJT0WVPHON1Yh44
         cE8/Qz+aKmL4Zt0Znp8qdyI9hqSiFrE1NdHguJGPZfEIVKwl8NG2FZ9/05xUkTSFLNl7
         /q3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sTlZn3aw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5007123ddd7si2730388e0c.41.2024.09.03.09.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sTlZn3aw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW5Q-0000bO-OX; Tue, 03 Sep 2024 12:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5N-0000Mw-PP
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW5L-0002u3-NR
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42c828c8863so20607705e9.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379730; x=1725984530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fmZw44UFxtNmu5XvjUhvfl85V31SothT2rfnjTZFuAs=;
 b=sTlZn3aw6pMOqOf//5jDyOls/ect+KjCVvTuttQ8lfzFQ4hkZ2f2o3p/aH0S0gIkGF
 +0mbkZQi1jGK2NeVN43KVcimuw0pReKjXxY/TVxejzwCvysF8ND0wnHHJr1s9Ag9ZF6f
 8DqfXi/uRxSpRkm7XufoplPqktfxU3G5p/RlGz0iPvCdYxd1yPePXbb5wq5WXDiKLqOg
 /deQTkAydElW5tJGb+rwBYnInwXhLhLKSKoChkpZ5lWL7GoGiZtErbd/NWa0vILIx+Kb
 8NBAkpvVlW3LU2C4Zt/thPfsh1FyZdzb7mDM6CRFocz+cMER5SX0aIWdq1I/NxvziLpl
 b89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379730; x=1725984530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmZw44UFxtNmu5XvjUhvfl85V31SothT2rfnjTZFuAs=;
 b=qW+0Ozh5vezb7bMfV9TfNyRAe7ujwNjg13LvnZeOGc6JxWaij1Kd/uWu9kK3wgMOSG
 N+xa5NZ7PNHhTuUNYIM7L5nst9bZ/CJWhEvxIiJdS/zNfYcGdDS47XH4Yn/5tDZTNO+Z
 Twdvdo7lrfv/AWHv27IyP+sk64lXIrssvbxli/54pSUaW+LkNIY2+HqLvsoHuu6EvCJU
 HOp8dJcq/pO959600GzuQTN7BmCkwTSfMqq+MdCYIrA/XQmWaW1nA/BodJZA4UFNmg0L
 M9gdJRCztm9iGNd3ANyhirs1KyfbydoCIfrZyhyfzt0ZVq8ECqcaS+7jdtLTwG3LnBce
 KCUw==
X-Gm-Message-State: AOJu0YwzkGtdJJbv8PdsijtXhVxeWfQy2upDEitC5fZruWMEZcjLRQc8
 M0JmkrcGa8Zjh53Pd3jHNacRhbSyHnwpT3HKWkTPeSTR+geoHi6NR9iKOcxeXmbkKZ9lSr4947j
 X
X-Received: by 2002:a05:600c:1c89:b0:426:66a2:b200 with SMTP id
 5b1f17b1804b1-42bd052b0f6mr84809015e9.0.1725379730219; 
 Tue, 03 Sep 2024 09:08:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 35/53] hw: Remove PCMCIA subsystem
Date: Tue,  3 Sep 2024 17:07:33 +0100
Message-Id: <20240903160751.4100218-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nstvVZn/xhhP

The only PCMCIA subsystem was the PXA2xx SoC and the machines
using it, which have now been removed. Although in theory
we have a few machine types which have PCMCIA (e.g. kzm,
the strongarm machines, sh4's sh7750), none of those machines
implement their PCMCIA controller, and they're all old and
no longer very interesting machine types.

Rather than keeping all the PCMCIA code in-tree without any
active users of it, delete it. If we need PCMCIA in future
we can always resurrect it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/pcmcia.h   | 63 -------------------------------------------
 hw/pcmcia/pcmcia.c    | 24 -----------------
 hw/Kconfig            |  1 -
 hw/meson.build        |  1 -
 hw/pcmcia/Kconfig     |  2 --
 hw/pcmcia/meson.build |  1 -
 6 files changed, 92 deletions(-)
 delete mode 100644 include/hw/pcmcia.h
 delete mode 100644 hw/pcmcia/pcmcia.c
 delete mode 100644 hw/pcmcia/Kconfig
 delete mode 100644 hw/pcmcia/meson.build

diff --git a/include/hw/pcmcia.h b/include/hw/pcmcia.h
deleted file mode 100644
index 6c08ad616a5..00000000000
--- a/include/hw/pcmcia.h
+++ /dev/null
@@ -1,63 +0,0 @@
-#ifndef HW_PCMCIA_H
-#define HW_PCMCIA_H
-
-/* PCMCIA/Cardbus */
-
-#include "hw/qdev-core.h"
-#include "qom/object.h"
-
-typedef struct PCMCIASocket {
-    qemu_irq irq;
-    bool attached;
-} PCMCIASocket;
-
-#define TYPE_PCMCIA_CARD "pcmcia-card"
-OBJECT_DECLARE_TYPE(PCMCIACardState, PCMCIACardClass, PCMCIA_CARD)
-
-struct PCMCIACardState {
-    /*< private >*/
-    DeviceState parent_obj;
-    /*< public >*/
-
-    PCMCIASocket *slot;
-};
-
-struct PCMCIACardClass {
-    /*< private >*/
-    DeviceClass parent_class;
-    /*< public >*/
-
-    int (*attach)(PCMCIACardState *state);
-    int (*detach)(PCMCIACardState *state);
-
-    const uint8_t *cis;
-    int cis_len;
-
-    /* Only valid if attached */
-    uint8_t (*attr_read)(PCMCIACardState *card, uint32_t address);
-    void (*attr_write)(PCMCIACardState *card, uint32_t address, uint8_t value);
-    uint16_t (*common_read)(PCMCIACardState *card, uint32_t address);
-    void (*common_write)(PCMCIACardState *card,
-                         uint32_t address, uint16_t value);
-    uint16_t (*io_read)(PCMCIACardState *card, uint32_t address);
-    void (*io_write)(PCMCIACardState *card, uint32_t address, uint16_t value);
-};
-
-#define CISTPL_DEVICE         0x01  /* 5V Device Information Tuple */
-#define CISTPL_NO_LINK        0x14  /* No Link Tuple */
-#define CISTPL_VERS_1         0x15  /* Level 1 Version Tuple */
-#define CISTPL_JEDEC_C        0x18  /* JEDEC ID Tuple */
-#define CISTPL_JEDEC_A        0x19  /* JEDEC ID Tuple */
-#define CISTPL_CONFIG         0x1a  /* Configuration Tuple */
-#define CISTPL_CFTABLE_ENTRY  0x1b  /* 16-bit PCCard Configuration */
-#define CISTPL_DEVICE_OC      0x1c  /* Additional Device Information */
-#define CISTPL_DEVICE_OA      0x1d  /* Additional Device Information */
-#define CISTPL_DEVICE_GEO     0x1e  /* Additional Device Information */
-#define CISTPL_DEVICE_GEO_A   0x1f  /* Additional Device Information */
-#define CISTPL_MANFID         0x20  /* Manufacture ID Tuple */
-#define CISTPL_FUNCID         0x21  /* Function ID Tuple */
-#define CISTPL_FUNCE          0x22  /* Function Extension Tuple */
-#define CISTPL_END            0xff  /* Tuple End */
-#define CISTPL_ENDMARK        0xff
-
-#endif
diff --git a/hw/pcmcia/pcmcia.c b/hw/pcmcia/pcmcia.c
deleted file mode 100644
index 03d13e7d670..00000000000
--- a/hw/pcmcia/pcmcia.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * PCMCIA emulation
- *
- * Copyright 2013 SUSE LINUX Products GmbH
- */
-
-#include "qemu/osdep.h"
-#include "qemu/module.h"
-#include "hw/pcmcia.h"
-
-static const TypeInfo pcmcia_card_type_info = {
-    .name = TYPE_PCMCIA_CARD,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(PCMCIACardState),
-    .abstract = true,
-    .class_size = sizeof(PCMCIACardClass),
-};
-
-static void pcmcia_register_types(void)
-{
-    type_register_static(&pcmcia_card_type_info);
-}
-
-type_init(pcmcia_register_types)
diff --git a/hw/Kconfig b/hw/Kconfig
index f7866e76f73..72aea9b8b73 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -27,7 +27,6 @@ source nvme/Kconfig
 source nvram/Kconfig
 source pci-bridge/Kconfig
 source pci-host/Kconfig
-source pcmcia/Kconfig
 source pci/Kconfig
 source remote/Kconfig
 source rtc/Kconfig
diff --git a/hw/meson.build b/hw/meson.build
index 1c6308fe957..b871cdca75c 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -27,7 +27,6 @@ subdir('nvram')
 subdir('pci')
 subdir('pci-bridge')
 subdir('pci-host')
-subdir('pcmcia')
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
diff --git a/hw/pcmcia/Kconfig b/hw/pcmcia/Kconfig
deleted file mode 100644
index 41f2df91366..00000000000
--- a/hw/pcmcia/Kconfig
+++ /dev/null
@@ -1,2 +0,0 @@
-config PCMCIA
-    bool
diff --git a/hw/pcmcia/meson.build b/hw/pcmcia/meson.build
deleted file mode 100644
index edcb7f5d263..00000000000
--- a/hw/pcmcia/meson.build
+++ /dev/null
@@ -1 +0,0 @@
-system_ss.add(when: 'CONFIG_PCMCIA', if_true: files('pcmcia.c'))
-- 
2.34.1

