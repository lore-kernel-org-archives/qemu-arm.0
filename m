Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp191438lff;
        Thu, 12 Aug 2021 02:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpD3NcmhTxzgTUbsiPkwzRLRLT+UxWLQl/naxlNtJ9Tuk4jYBYPKNjIB4BfMoHg4YGqCsR
X-Received: by 2002:a05:620a:16d9:: with SMTP id a25mr3676789qkn.320.1628760984718;
        Thu, 12 Aug 2021 02:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628760984; cv=none;
        d=google.com; s=arc-20160816;
        b=jFCKgwykcGq5Ur06H7rL+bf+kFrg8K1x6nBkzG/dIsLJI/WJcqr0bzviFmeVwfFP3O
         N6dWyqJ6VzZ4LdQpG7Nq306V4aVcfFE3dX5m+gwTHWf7+1f7xBlLi/3g7lzG0Ci1Taao
         Cjxfbi/+T8r23hdWGYuIyEr4nBxxQuhtdM/uCPbYY834AHIfb3GbPysJzs39dvBpvoFO
         apSjLmRJYk+076hsluiq5N1F4iUPHxo+Mr+NxyUFsk05eWnuZbQOIsW3b98WAcUmzUC2
         YJ4zgK8FpRygyE+I+m1qCp1hbB63osXHiqfjJ0lqrU01PoVPaxV+s1OYgiD+7NhJ7YEL
         pf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HH+JYD3ePJ2M8XF+0f5Esmo3hxwe5zPdaITYbd/Hd/Y=;
        b=zVHvHLs//+KHghk3p0Vjoj10aemL0f4uuW8FpY67Xb4fvRmlhiUUcTk0nSUM1r5uhL
         b83IQie9zSIXaRXAn+RFbo4IOdVjXXxFTgNXGaVgH9FEhyVeJ27mfjTOVOns2yJ9ckie
         W7oeleOcKmgWxEjaxn1b/jNbmd6pS6FIVE698wKygKkJhOgBloPWs4plg1rJqAZb7DtM
         SWlmSAZt15cILuMEskp6LhH3KlOHQd8JFVOXejlpSFYUE+aHG6Ptxqc0KOzEPeuaac+W
         C7hayIoO6omZKYW7T/aVstTk8PH1W9Sr5uNaWDLt5wVS2FS0uPK1GAbM3LrXdouBrNRW
         Eovw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z7JlLoN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si440304qki.336.2021.08.12.02.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z7JlLoN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE78S-0003CZ-0f
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76J-0005Aq-Da
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76D-0007nm-MP
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id f5so7298857wrm.13
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HH+JYD3ePJ2M8XF+0f5Esmo3hxwe5zPdaITYbd/Hd/Y=;
 b=Z7JlLoN4vr0J9S8R+x9+SQ5T342bZj9pHK9VEf6Wfdl+T7tCdMA7apQRW4D72jeRFO
 KWX7YkCaJs4fsT5uU+n+AUwVAmR6OLtgNev8BOSHhjTSiGy0zramgR1lDOeeVOMPC0Ar
 8BCFNLHG8B2meSAmZdYZyZowL5wCy38lnNR8+jKRm/slAjHoGNHeA+0U0pkTHyetm9jw
 /mhCe5OwT0y4dyeqgfZPcvc6+cFt+ZH4B/KWv4y7P9rfI6KECRwNZNgIMhQprMERCy7a
 v9sgNzjihsEE7g/E7gBvVOAHMIVy9fu23XaTKeHJJoCtQ0JQ8jmjQNHEMNdijlROEAPQ
 bXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HH+JYD3ePJ2M8XF+0f5Esmo3hxwe5zPdaITYbd/Hd/Y=;
 b=EGdjx96ll/TH5Uet0mtw8hPxP40K0NJLR04MCR5+PkvV9yiydDZKvuit6k2SfbnvPL
 K/vocbEhVIdIrxoRKqRHMO+YA4aodeHJJna6byQA5cwAa0sTqORCskg5kcBzsKhLT1dQ
 tffhIp79sx3F6RTZmyQZqghjxlR6RB/kOdgynTCzL32ApeuVw+cl1G5im0YzdP8uZ7gS
 GPh6ANhRTLwqkSeq/jhP7IXxdv95VU8nB/16fVUA0xlg2zmEY+Krs5gV2nf7Xp2Z3jmu
 HUbI2EzrKECnZqmjhj8UBTXyWpRQqrFB0ef62r2LqNk0i4jh3qesbEWjTEyU4j5ut2Bn
 0ygw==
X-Gm-Message-State: AOAM530gQGKTNJM91w67hwzRp2EIQE5qV7beTNY+iXDV9SoqR60F0yzG
 oFXI7jDvECjwH0osQMSZNd2RWq1MMYt/5A==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr2877179wrx.399.1628760844033; 
 Thu, 12 Aug 2021 02:34:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/25] hw/timer/armv7m_systick: Add input clocks
Date: Thu, 12 Aug 2021 10:33:36 +0100
Message-Id: <20210812093356.1946-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nlfPX1EsRk4X

The v7M systick timer can be programmed to run from either of
two clocks:
 * an "external reference clock" (when SYST_CSR.CLKSOURCE == 0)
 * the main CPU clock (when SYST_CSR.CLKSOURCE == 1)

Our implementation currently hardwires the external reference clock
to be 1MHz, and allows boards to set the main CPU clock frequency via
the global 'system_clock_scale'.  (Most boards set that to a constant
value; the Stellaris boards allow the guest to reprogram it via the
board-specific RCC registers).

As the first step in converting this to use the Clock infrastructure,
add input clocks to the systick device for the reference clock and
the CPU clock.  The device implementation ignores them; once we have
made all the users of the device correctly wire up the new Clocks we
will switch the implementation to use them and ignore the old
system_clock_scale.

This is a migration compat break for all M-profile boards, because of
the addition of the new clock objects to the vmstate struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/armv7m_systick.h |  7 +++++++
 hw/timer/armv7m_systick.c         | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 685fc5bc0d7..38adf8d274e 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -15,6 +15,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 
 #define TYPE_SYSTICK "armv7m_systick"
 
@@ -25,6 +26,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
  *  + sysbus MMIO region 0 is the register interface (covering
  *    the registers which are mapped at address 0xE000E010)
  *  + sysbus IRQ 0 is the interrupt line to the NVIC
+ *  + Clock input "refclk" is the external reference clock
+ *    (used when SYST_CSR.CLKSOURCE == 0)
+ *  + Clock input "cpuclk" is the main CPU clock
+ *    (used when SYST_CSR.CLKSOURCE == 1)
  */
 
 struct SysTickState {
@@ -38,6 +43,8 @@ struct SysTickState {
     ptimer_state *ptimer;
     MemoryRegion iomem;
     qemu_irq irq;
+    Clock *refclk;
+    Clock *cpuclk;
 };
 
 /*
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 2f192011eb0..e43f74114e8 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -14,6 +14,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -201,6 +202,9 @@ static void systick_instance_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick", 0xe0);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
+    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
 }
 
 static void systick_realize(DeviceState *dev, Error **errp)
@@ -215,9 +219,11 @@ static void systick_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_systick = {
     .name = "armv7m_systick",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(refclk, SysTickState),
+        VMSTATE_CLOCK(cpuclk, SysTickState),
         VMSTATE_UINT32(control, SysTickState),
         VMSTATE_INT64(tick, SysTickState),
         VMSTATE_PTIMER(ptimer, SysTickState),
-- 
2.20.1

