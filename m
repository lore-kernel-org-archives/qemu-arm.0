Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2721741lfm;
        Fri, 3 Jul 2020 11:50:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/qr+Lvzt0Ojp5GBzE2cCM388ACBKOSWC8r5c7vvsaPqOM/RmqsaE09RCo3P4Lcqajly3p
X-Received: by 2002:a25:b948:: with SMTP id s8mr58858953ybm.487.1593802228432;
        Fri, 03 Jul 2020 11:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593802228; cv=none;
        d=google.com; s=arc-20160816;
        b=EpB13s+DcFqWmukuZVDF2mlDpbR3g8Pvn43+E1oSGnMdd9tpjXCVZeUavBmQtvfmmG
         eLu43bFROw/1m+CeO9dYFNQo/TrhEaf0RlKkU8pjyj5WB15L67d1BmmmkqHtvOjkx8zc
         vEg6MClASHD0X+cnZSJ2t7p7uqeFae4LNQxIMieMz+q1Y2bZlAw9q61Q6VXGqjaAZdpE
         b0ng/b0nEzUrbnx+hw9k3QasingQlvZ5TZw7b+TigM4ugXtygibkwxxV+LcwJRI89zgk
         WfggJ3fgVZeGNh1DvuLB0g3mr8N/lrZOKzzDxzZRVM7cYw24uMG500AB3URY+mZMW/PU
         mcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y9ApWH9gz4M4qZvGxoP6zo+vP+3Z0/10bVmtSoKgmDA=;
        b=IxHZ8X4unoqopufXOBN2c8LUddOQjQqqNuK9E9t/KQ10bSNiHiwtBfJjjA5ssE6MUF
         SYw5ar63PvBzhkTExm5OEa1h4OVIY4tUkzvgERGSDxt4fz+YqQ5MZy+W4TE8xa4O6dE2
         881+z54ICxq7lNnIGN6s9/Mqt1KcX6FaijEZMgJ2pIXqUm+nX/HvKTZnVx+RL/cT3goW
         tYDsnZTa2k2daXpuJ0ZwAlTrmwXPybbT54txacveSNDUq618xHSWmV1/QmEufdW8Whzo
         HSrTrGwINiLq4wCaOgyGj+usRGu8PR+al4pg0z4Q43u9UZtew7InjoYEDcZ1lLV7XnoI
         bPNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WGG4HmeK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v141si515963ybb.12.2020.07.03.11.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 11:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WGG4HmeK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrQlX-0003Pr-OU
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 14:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrQl6-0002oS-Ok; Fri, 03 Jul 2020 14:50:01 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrQl5-0007dC-4r; Fri, 03 Jul 2020 14:50:00 -0400
Received: by mail-wr1-x441.google.com with SMTP id s10so33695708wrw.12;
 Fri, 03 Jul 2020 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9ApWH9gz4M4qZvGxoP6zo+vP+3Z0/10bVmtSoKgmDA=;
 b=WGG4HmeKWLz+kxxqc8rPXhCqT+QP+vqOXsU5ZHY/LfEs9GDrQGYtqRObnqqIy5D+Ds
 3BG5FVWk3TTLApEXgACm0rFLTDfJ8d+jjRCFmGjEcShsMriWW8b+aYMWn8rlhgwwNwsJ
 wfSmJ0WTVGjYiQZoylYvUQF+jRloEQQw1iFl9PLe9TESvpNTDtlJCvOURdruz5sXX+jd
 zw+l0OfkTT1/4bNuPuP1YAEAd3SlBoawtbBukiQDSyaYGOI0jxL4KgxLVZuH6kVGlXkG
 p56mtIGkJxObAymfysJexA6eg2xFrd3bGkrF6UAK2qxDkO6a54cNgXj2FI6NsoGWaOb4
 fkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y9ApWH9gz4M4qZvGxoP6zo+vP+3Z0/10bVmtSoKgmDA=;
 b=HHbBgGxqdYCmkCV0gNAyuwCb/valDS2ZvJHAHilV3Gfdtkw9OoMZ3BT+QU6yecgzPq
 w4loAIRBmqsOE3vhhcwbRsQ9VYGYUzwaOkXk/OT5wu5bWxC6wWj9HcJDvBriILKCfqfb
 pCc78I6ttfB6f3B/Fj5eS7XLECgbsA0CTFEqmwJaEP9vwAbi0pEWjlWPtzZ8oCtrA0bS
 kGqGs4H9w10DTn5O+rcCSrhjMTU90iVq5mYC2wWXPdEwz52JePXx6rurwm3ok9ZUSW8e
 QRKCb28+bSJob30NsPjUUQwaCsUsfrOL8UBLbxvBunknHs6VCdqFSVHh/AbW42Xery/a
 NBGg==
X-Gm-Message-State: AOAM531eBHxrS5CYR02/2IXhdSsLETCfEQk2JUfL523bcTEjrhG0UIYo
 KX+cS39eCcZURoIHGPl4wd19fu3mwj0=
X-Received: by 2002:adf:edd0:: with SMTP id v16mr37371559wro.214.1593802196812; 
 Fri, 03 Jul 2020 11:49:56 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x11sm13778369wmc.26.2020.07.03.11.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:49:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/ppc: Use TYPE_SYSBUS_OHCI instead of hardcoded string
Date: Fri,  3 Jul 2020 20:49:52 +0200
Message-Id: <20200703184952.4918-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703184952.4918-1-f4bug@amsat.org>
References: <20200703184952.4918-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B2ubMY4x64kU

By using the TYPE_* definitions for devices, we can:
- quickly find where devices are used with 'git-grep'
- easily rename a non-user-creatable device (one-line change).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 3 ++-
 hw/ppc/sam460ex.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 9cccc68c35..c122a4eca5 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -36,6 +36,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/i2c-ddc.h"
+#include "hw/usb/hcd-ohci.h"
 #include "qemu/range.h"
 #include "ui/pixel_ops.h"
 #include "qemu/bswap.h"
@@ -1961,7 +1962,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->state.mmio_region);
 
     /* bridge to usb host emulation module */
-    usb_dev = qdev_new("sysbus-ohci");
+    usb_dev = qdev_new(TYPE_SYSBUS_OHCI);
     qdev_prop_set_uint32(usb_dev, "num-ports", 2);
     qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 1a106a68de..593436937a 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -35,6 +35,7 @@
 #include "hw/char/serial.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
+#include "hw/usb/hcd-ohci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/ppc/fdt.h"
 #include "hw/qdev-properties.h"
@@ -370,7 +371,7 @@ static void sam460ex_init(MachineState *machine)
 
     /* USB */
     sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
-    dev = qdev_new("sysbus-ohci");
+    dev = qdev_new(TYPE_SYSBUS_OHCI);
     qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
     qdev_prop_set_uint32(dev, "num-ports", 6);
     sbdev = SYS_BUS_DEVICE(dev);
-- 
2.21.3

