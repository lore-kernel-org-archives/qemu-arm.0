Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp167362lfb;
        Thu, 21 Jan 2021 11:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/oh/c4LCiprpGQMnK46yI7H/18OM1UdGEYdMLQ3pJ6iShxXP7iWkGdfDYXseuV5YxAYHL
X-Received: by 2002:a25:5243:: with SMTP id g64mr1190394ybb.193.1611256754681;
        Thu, 21 Jan 2021 11:19:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611256754; cv=none;
        d=google.com; s=arc-20160816;
        b=wVzg1gKzluEROu/9e+vpkP/TwDNCfSc4h+ThkYZBPSg53cZ3DbCf+WxNVqIYWmaAzD
         GpVJyCruOItyFQo6cFvFZXviZply/yvSSgXjcN02f0WavyJS0WtcpMzmCaXYJKK1XoQK
         dBnGwAIj4UGY2S7X6/XAYTFi8QhGFR4asT7oK//O2iz6Ckm6UUPstrpqmFhpx7lwRukH
         kuk6wsOcCo1M1qGoBqeDvfe45VM03lsVEA+xaEyHE0DVAWj5tQvYMxTXUV+ImYqtB2vd
         WKHCl4qJZ5Omqz1CA8EJ4sy6MPkzT/GM+I4/6D1HqRdxHmT3lK0fbj6lGWzRlj3bDEII
         qqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Z/cipOte9qBYkDz6GvPRQ6o8HFNldLG8VuXdickyLI0=;
        b=C+N81PRMaA5M6h9Aopl5bC/Wuza3Krk1kP8y6K3U7iy/HxeXj/UNtBqGK9qFyA+BVx
         47hbVaYFSqujvlboBjMjf2nbpsUKUuLp9Qk8KqOCzSk2cX3agSbnw8g1+KtNx9NeUkO7
         HZUBTvnZbU83ZBkVsycLv9WMam4EIzbpYpsL4zIZJzBYp2yK4jGdPqz9QWG1cAMLK2E5
         E5pPkPjjtjdZEXwVmVrv/OZtha7MFIhZa0mMQGEmdEZf8J8GVENIqkinCuhY/gpZxHev
         Uymcn7VahsOVJ5XihSSfBIhiR1xkfeyKsnQbH8b9uwyf47d1alpXLfGvscDPQ5HYnbdq
         UAhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oWQf5mXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si5542413ybr.94.2021.01.21.11.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:19:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oWQf5mXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fUA-0005E4-0V
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIG-0002JC-Mb
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:56 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005qJ-0e
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:54 -0500
Received: by mail-wm1-x331.google.com with SMTP id m2so2404923wmm.1
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/cipOte9qBYkDz6GvPRQ6o8HFNldLG8VuXdickyLI0=;
 b=oWQf5mXQjxxvNIvb4Vaxap6AVWNDVlMKT+WWVO2mo9tc1gY0eby3GoYw3X8XfVN74Y
 nQ6fuO4uAV7UsGcYnXNLQposNWFbqizkA9je55Eq/4hNS0qukhUp7XjGxqP/adIK5yhQ
 4zYpvbQ1jPkqV73THeoIkWrMVM6O0ab7hADHX8zeHgZrFHCtZqQ83np4KlnpvEthekil
 IZ5P3/xlhHZN2WxKhJQCs0Veh7dgu1HLg4SNq0U4Iy9WTYNl1CSxnEACe0HFGTNHSG5O
 1H+mp0Mj5e6T5Wg5h0fpJv7D5pUuNyUhRU1TRrs0MSNv3LWbZsL0toT4/0acnWtY7r/l
 Pypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/cipOte9qBYkDz6GvPRQ6o8HFNldLG8VuXdickyLI0=;
 b=djDEnfG7pHEvCUBMcOkKFOzZ5wZ3cMVr55M8+KBaQn1u4f6mKJxmxVWYxmEskxkCia
 8qc70Xw2kjcNxwII1CkMb9osvq6kEQ5CAgvZyjTBtf7wcAMsnc8het2ISZqYypzlwE59
 yXp53oNvKBrtEenuuolGPbtACJAPG4SYRhWKmbiovRraAgafGIoWdAujBupcwswd/TPS
 P6wOXGUZ2gFV96pFlonvBso52RccPzFscUAVzQ3DRmzAdTR2uX2Bn6uMwv4T80m/dJcS
 SmLsm3y9sOKZeqjzjmfLZUCYO0vsr1Gl5BBAkyWRS6rOt5dy+UXngCRn+mvzFDyDwGe/
 3SCw==
X-Gm-Message-State: AOAM530XoDjYldbkKpY+2kRhRFTy1DRZkZKOqwk+McKbvHC9wJ0CctUr
 0Cj4QHsq92IkIZeR0/KOFD6sg97bVZLI3Q==
X-Received: by 2002:a1c:de09:: with SMTP id v9mr790569wmg.0.1611255998800;
 Thu, 21 Jan 2021 11:06:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/25] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
Date: Thu, 21 Jan 2021 19:06:11 +0000
Message-Id: <20210121190622.22000-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: goReWhbZqDQh

Create and connect the two clocks needed by the ARMSSE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6a9eed9022a..7acdf490f28 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -62,6 +62,7 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 #define MPS2TZ_NUMIRQ 92
@@ -100,6 +101,8 @@ struct MPS2TZMachineState {
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
     SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
+    Clock *sysclk;
+    Clock *s32kclk;
 };
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
@@ -110,6 +113,8 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 20000000
+/* Slow 32Khz S32KCLK frequency in Hz */
+#define S32KCLK_FRQ (32 * 1000)
 
 /* Create an alias of an entire original MemoryRegion @orig
  * located at @base in the memory map.
@@ -396,6 +401,12 @@ static void mps2tz_common_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
+    /* These clocks don't need migration because they are fixed-frequency */
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
+    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
+
     object_initialize_child(OBJECT(machine), TYPE_IOTKIT, &mms->iotkit,
                             mmc->armsse_type);
     iotkitdev = DEVICE(&mms->iotkit);
@@ -403,6 +414,8 @@ static void mps2tz_common_init(MachineState *machine)
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
     qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
+    qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
+    qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
-- 
2.20.1

