Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp194336lff;
        Thu, 12 Aug 2021 02:40:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+00ITK535VntXaHzx9NZuxYG4cmD5Aq02utWFh5kfYyVxeLUW+64Nv2lBugAqX5H7RZdB
X-Received: by 2002:a37:6d8:: with SMTP id 207mr3512871qkg.328.1628761252922;
        Thu, 12 Aug 2021 02:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761252; cv=none;
        d=google.com; s=arc-20160816;
        b=fTRqv7KevO6EdEoxKNP4PKrtvRpsjsL34RqW3RSwb78i7yM2o4F7luQ4Gwam3aYxa1
         8k+pF9EM0p//ROcGxUiGEnItzBst/p2D0akUmn+2YghDdGZbO7ZoLp9wwITenRiX44PT
         XWVKPEwgS5XsONNHORia/L0Ok3awaF5VV4sx7h0z/fRTu+6+gDFLvZRIQRMIM6xnlCtY
         UWevxNzXNcpbTNoGinjJgWCs1OHLv5mfRyk7dFeYkL5QJ7vzNSVPZvpavAVogladLBKH
         S1ze39VOo3ci71BZ4xK/IpshStKzUNaK2saKeKAyW3SYDjSpm3WAekIeF7awZTYknTmR
         pVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I9TW5HgoQcdmb8WDggWO7uUKdFyUTLqM4EhcWbfGZhw=;
        b=FK8guZLg6RrkWr5uvEm/wjbPsTq61iHrFz11EEsCmVIlW1+zxmFsYWe+xK7S1uQ1un
         cemuxPN1cGzcPmy1VFLK86tNzGk0hOaCyY+FRkjBivek0rUSf1QgwpWNA/5PkJ4WPOnv
         TSctDxYiKU+yt/INXS/ObmuD3QFRTDR2Fbff2JDVoSnijCPU+mjvqN4fsx0FM2SDt881
         63syMmfQcrf1kE8GfPSsXNWa23TH8CleLqwgKxt+0LLnYJXKQ96wF8NNzg2JEOx/Vl/T
         ptsB4I6XeIuVLw9fsKFWixP2bvU1g3H17hFg94U6TPbHBeeD3QtVkS730NaI1iQHAxIh
         2esw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=adsc+FSf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si1735957qkm.87.2021.08.12.02.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=adsc+FSf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7Cm-000127-8q
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76Q-0005bG-J8
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76M-0007wD-So
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f12-20020a05600c4e8c00b002e6bdd6ffe2so800050wmq.5
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9TW5HgoQcdmb8WDggWO7uUKdFyUTLqM4EhcWbfGZhw=;
 b=adsc+FSfAP267D/IMPCTIeGQFSo8uUzkq7o0zeEYLxtc4vhw0eGVm5Lp4Pxj06anDz
 c4wsWOj/o7oO4yM/A0OZIUAugTvKEHBAG0jHpcD+nBWLEuxYeEXKduG4OkceAmjX+b/0
 Zb5wLobsFwFHxX0hSSYxxhvio+kVtLGYNXcKyACpnH9huTZ8Coz1ewfrz0gWS9nqbA5r
 CA6FF8lVzAVBKwHt7xfqc4K35ZI85C3a8RXp4Hdjb4OqpgbZmHwlqF5wOA8Y5VYeZQFU
 EpaE2dIW0tJyyL6eAgGBiwOaPwVynBS5n/f+FfddRW4KfO1fYu5y9zuiwAcUA7/WQgRp
 7E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9TW5HgoQcdmb8WDggWO7uUKdFyUTLqM4EhcWbfGZhw=;
 b=qX4AAoRA2tCDoMV8wwNa2DtUCJXKKOUuASTULBkqOP58e/0Dv5e+GZp/Gma7VEW3Aq
 DfTSICxrV5TIo1jehVzc2yL3JGhguZLvfkiYIqbU77zWC+dsLKGRLOg2TIR3toFonBAc
 Z97jbfVpoJMGw98Fj/xkFlmGKXH6foja+ucBRN1+aeVxiWMP3P1atP7bK0loFjOAlFSf
 QnWnUtveHu5YUhhJwQhdbf/AC4t7AvHaWxqqDSwkEd0wR/W//MWQ4LfWTFmIP6EUoMrt
 pQbxFzkQtluzVQVLD2BEPCdW+DVUW1p7jLX5pchGBsnPbIg9S59xTFV1EqGqesWaInr+
 BQvQ==
X-Gm-Message-State: AOAM5308p1nMn5iq9T+YpvPC9uv3EDR8KOV6ADLWQJIg4jjYpf7SSoxV
 juhh4GyWRe4T9CY1vnGuCYDqMRoCSHug0Q==
X-Received: by 2002:a05:600c:246:: with SMTP id 6mr3000980wmj.36.1628760853197; 
 Thu, 12 Aug 2021 02:34:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 15/25] hw/arm/nrf51: Wire up sysclk
Date: Thu, 12 Aug 2021 10:33:46 +0100
Message-Id: <20210812093356.1946-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: PdWX43s+5BPg

Wire up the sysclk input to the armv7m object.

Strictly this SoC should not have a systick device at all, but our
armv7m container object doesn't currently support disabling the
systick device.  For the moment, add a TODO comment, but note that
this is why we aren't wiring up a refclk (no need for one).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/nrf51_soc.h |  2 ++
 hw/arm/nrf51_soc.c         | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index f8a6725b775..e52a56e75e0 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -17,6 +17,7 @@
 #include "hw/gpio/nrf51_gpio.h"
 #include "hw/nvram/nrf51_nvm.h"
 #include "hw/timer/nrf51_timer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_NRF51_SOC "nrf51-soc"
@@ -50,6 +51,7 @@ struct NRF51State {
 
     MemoryRegion container;
 
+    Clock *sysclk;
 };
 
 #endif
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 9407c2f268b..e3e849a32b1 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "hw/arm/boot.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
 #include "qemu/log.h"
 
@@ -66,6 +67,23 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    /*
+     * HCLK on this SoC is fixed, so we set up sysclk ourselves and
+     * the board shouldn't connect it.
+     */
+    if (clock_has_source(s->sysclk)) {
+        error_setg(errp, "sysclk clock must not be wired up by the board code");
+        return;
+    }
+    /* This clock doesn't need migration because it is fixed-frequency */
+    clock_set_hz(s->sysclk, HCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&s->cpu), "cpuclk", s->sysclk);
+    /*
+     * This SoC has no systick device, so don't connect refclk.
+     * TODO: model the lack of systick (currently the armv7m object
+     * will always provide one).
+     */
+
     system_clock_scale = NANOSECONDS_PER_SECOND / HCLK_FRQ;
 
     object_property_set_link(OBJECT(&s->cpu), "memory", OBJECT(&s->container),
@@ -191,6 +209,8 @@ static void nrf51_soc_init(Object *obj)
                                 TYPE_NRF51_TIMER);
 
     }
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
 }
 
 static Property nrf51_soc_properties[] = {
-- 
2.20.1

