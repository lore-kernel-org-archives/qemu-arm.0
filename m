Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3845316ejb;
        Tue, 19 Sep 2023 13:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8KVGlwlzYa5pYvSMWIMYli5TYzqhnpKXbQe8/zRCW4iwf7fSkq6ppwFK4S1lrfHhDQVRa
X-Received: by 2002:a05:620a:668:b0:76e:f5ef:daf3 with SMTP id a8-20020a05620a066800b0076ef5efdaf3mr582692qkh.68.1695153955926;
        Tue, 19 Sep 2023 13:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153955; cv=none;
        d=google.com; s=arc-20160816;
        b=eMFcZ6XRXy99Naxu5B8SB4jhkJCN7DBW7nMgeXJCO91dsYiERocThP3nSPyHvy9B2k
         vatbYzNGyi9+q1o8Lk8w/FhqtKzOkFl7F2SbF4Lzatfc/pVk4QGw4hpVPwfjSgV+bRY+
         y5D4YpxTwAH5jYAk+RdG6T4JZK1tBAUepd6nN1IV5eIRWB5XGDASr3T+q39/Wunv1JIe
         fCR+06gy/J3AVjoLV7h0WT9NPl09JXRPSx435VSbn0TiB74ww1XD0JMZaAOJADWM+utn
         2Ase0l2DoWYr5wqTBR5n5NfMo5/2VQK9RRbEcB0NELhvjRW4G8SwVL74Uoa05T+50HKn
         5uaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=WDRWOhh3VW0C6dXpPJT1aSezqw+qmGqchWiEjYKyhCA=;
        fh=31Pgf1blV3SQPmQ8WOxvGy7Z8ujSo7iGO5C67upv8D4=;
        b=Bimi1mPIRWlKXp4RX+asWBeLgayqoirCSlo0DdgHDKR2sL8EZz+UPwNWa1R+5byvV/
         YlULT+zrNH+yUeyRa8U4I+XSNFq2lfktRUcc5pnyuneELu2E0PVk+PebefeDX0OwI2Ub
         hw9QyGXtVhDCwdiW/bxhfFy5XJ962+sJ75Fcw58L8hRThUHRIZqWl2eq5DRMuWsYIeCa
         POn3ZgLaXOtRHMXo6HUbCC25dthyDC6vJiY0erOP9j0maBNS3so3jzHus9ohQlSfCF4W
         JeVFDaEFYnUoc3eYJcrdgTfyDYDDI4/zL+TvmWtsRx/AgBa0dMR3tQ7n0TvHDqQCK87a
         oW8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="R6/n01z4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05620a228a00b00773cc7fe271si3607223qkh.386.2023.09.19.13.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:05:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="R6/n01z4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qigxv-0006Bi-3M; Tue, 19 Sep 2023 16:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3K-EJZQwKCkQtghonkyzklgtmuumrk.iuswks0-jk1krtutmt0.uxm@flex--nabihestefan.bounces.google.com>)
 id 1qiezn-0005GE-6p
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 13:58:47 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3K-EJZQwKCkQtghonkyzklgtmuumrk.iuswks0-jk1krtutmt0.uxm@flex--nabihestefan.bounces.google.com>)
 id 1qiezB-00014B-Fv
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 13:58:45 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d818fb959f4so6233419276.1
 for <qemu-devel@nongnu.org>; Tue, 19 Sep 2023 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146283; x=1695751083; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WDRWOhh3VW0C6dXpPJT1aSezqw+qmGqchWiEjYKyhCA=;
 b=R6/n01z47Y8KlioftIpE98luag4BxWJxfX9z01mbZfNI5fNouHJiyVAW6jLdtIet7d
 iel/OE1d8K6JDqX72kQjD2qT4jdnfx34eJukEKpXQ2EpmsR1e+7muw6h1FMUMjp3QhZV
 KZtwglH/Bdo82rYaf+s2Y0YW41RIe99USh1QqyZr37E/DmXquzVk4i0u9VFgOKdU6VKQ
 xt91Q2TWBpJFAzCUldF/pFP5H/9zxTOi61uiK+hSdMJQZjJjWwVcdA9jvhbc2RfmKK6B
 4i0m5hY8yOrWRbWWUMK9/H/lGwBgpD0c6zf7pETMxZzIbxtPMiAcisjWteBkgtJel1DG
 LQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146283; x=1695751083;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WDRWOhh3VW0C6dXpPJT1aSezqw+qmGqchWiEjYKyhCA=;
 b=vd/W6oOI2NcqMRd2+pcklcy6lkwWlayrydP4PI/vxt68cpIXe8rp6G2Hd/QfLwUeiM
 Dwg4ElVLxxyL21TAwTLdl2biQKTK9OXDML3aXHRyQrwj5/b2vKURMoKrWO0eG5jcEs0h
 0X2SxGs3BfYuPeDSxzfhhjXOZlpMLqC0+kqQzbBZjGjKekhQz+QjpGVbX2OzQE+/VJL3
 INipAMBG8u2e/myDjsIfzFdU+OOR0cOAo191qBFtgI5vadJxzrr+XWtGXIRhdJ1D2gsk
 cjmvdxuNUGSSO8TKVh3ykxA/38iTZEOWokbPesjP0S9H7Dvc+vhzC1bDRdHtK1ebjrQX
 qyZg==
X-Gm-Message-State: AOJu0Yys1Txn1r/KKTuZQkEkWfEqIxAGMc2toQAAIFE/HwIk1GS3+L4f
 RFmfsOZtP+RvKMsCO+0Su5FEKPQvU6dP6u+Y/x4=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:408f:0:b0:d7f:8774:dfd4 with SMTP
 id n137-20020a25408f000000b00d7f8774dfd4mr5741yba.12.1695146283633; Tue, 19
 Sep 2023 10:58:03 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:24 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-14-nabihestefan@google.com>
Subject: [PATCH 13/14] hw/arm: Connect to chardev backend for NPCM8XX
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3K-EJZQwKCkQtghonkyzklgtmuumrk.iuswks0-jk1krtutmt0.uxm@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:51 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1VbNlTOy/8MD

From: Hao Wu <wuhaotsh@google.com>

As NPCM8XX SoCs have 2 mailboxes, we can't use -global to connect
the mailboxes to their specific chardevs. So we add the search
for chardev code here, similar to what we did for the GMAC devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm8xx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/npcm8xx.c b/hw/arm/npcm8xx.c
index a9eb2b894c..8859cb274d 100644
--- a/hw/arm/npcm8xx.c
+++ b/hw/arm/npcm8xx.c
@@ -16,6 +16,7 @@
 
 #include "qemu/osdep.h"
 
+#include "chardev/char.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/npcm8xx.h"
 #include "hw/char/serial.h"
@@ -25,7 +26,9 @@
 #include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "qom/object.h"
 #include "sysemu/sysemu.h"
 
 #define ARM_PHYS_TIMER_PPI  30
@@ -762,6 +765,14 @@ static void npcm8xx_realize(DeviceState *dev, Error **errp)
 
     /* PCI Mailbox. Cannot fail */
     for (i = 0; i < ARRAY_SIZE(s->pci_mbox); i++) {
+        g_autofree char *char_name = g_strdup_printf("pci%d", i);
+        Chardev *chardev = qemu_chr_find(char_name);
+
+        if (chardev) {
+            qdev_prop_set_chr(DEVICE(&s->pci_mbox[i]), "chardev", chardev);
+        } else {
+            warn_report("PCI Mailbox %d does not have a chardev backend.", i);
+        }
         sysbus_realize(SYS_BUS_DEVICE(&s->pci_mbox[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox[i]), 0,
                                        npcm8xx_pci_mbox_addr[i]);
-- 
2.42.0.459.ge4e396fd5e-goog

