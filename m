Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5567179lfc;
        Mon, 15 Feb 2021 04:13:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9WsZsj6DelFN+0TnGJK35yiwOEn8iciTYux0yEHuus7WQuC/5vC+rIo+85eWGQIZcx2Wc
X-Received: by 2002:a25:ab6a:: with SMTP id u97mr21686017ybi.288.1613391214164;
        Mon, 15 Feb 2021 04:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613391214; cv=none;
        d=google.com; s=arc-20160816;
        b=bDacNGvDclXEawJi+frFqmZWzZxS/UtPn3QI5FXxCwNBkW2rp6ymg9nkh/NpnsPxXA
         xkO+DWo+VBIY7dJibVkEF+YfNpdU0Yqc1YGGcPmMCWrdroEg/qNGw8Isc/J8Fua+DA9L
         o7zMHomm+bDmmTrP9RemzOyLrmklTUFF7YQtzUsAvs+UC9D4CcyVTm7r8haAotpkbZfW
         NLS1eeWqz8uj0IMSlOyVUETTNAQ9IF7TNuiMjzOA0nmrhznYcYU/k5Z9anOfKU/4KpYi
         N0EJDCagSgi0kDYuKMlAPBJYt3ZkTr7hRB1g+qk1RK/3D4ROliu/0AGhfiQWPPK9Ah+A
         1YNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wGYGw0ciQ1NZJCLjbpj4MSbJnkP3xpGrgMVONXVokMg=;
        b=cruNMaH+fQv5CLkbZmlQMl1/G7St3AHSzUAMUtRcO26DLlHXszjNXFyw/eN/9yG1Fo
         ULrVD0NQJIsXGIhWG4OkA86KqP/e6hFfAhjb8FjbthV5SCgWYCilla51Io5GnbgdiwUo
         AXDyIiEzUjqf9Kp24TJplP39DbNKlbLM4uhzn3IERxCcxag778mJNlJ/Pop/wRIsYR+y
         3ebB/eZrB0DlImSZKq5AXrLO6potebLOyOxx8zACFmexXs/wTOYwudAsP+s/KHKQRCpV
         GgZlJyRmkUWAJ08OwxOj1Yzhg2fsdkqBqLo/5+ZQH1u6wsTbBS7k/BgPciHPSNpNEHfN
         e7MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmNoUA+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t70si7475209ybi.50.2021.02.15.04.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmNoUA+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBckv-0007VC-FQ
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRF-0000Nk-W5
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:15 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcR9-0004JF-RD
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n6so8484956wrv.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGYGw0ciQ1NZJCLjbpj4MSbJnkP3xpGrgMVONXVokMg=;
 b=LmNoUA+bfSN/lWSQ515HzJRXmPTjyQP0d+5I7rp8koQAqo5abKaRDzsNN09H3E6Jng
 RaS62sHgPv8XOYIP61QNpQtZFtTEBc/Kmd3hM8Ln1up0GnaKU5x284nC5j4+2ZlRYfSv
 mIMsQr3XE1JjFjr4kcmJOQHqI/3JvU4/0MMFcF0HPr/BjX71qjU/CN0Fel0IS2OogZgb
 ilkLsLTbU7ZLl5RSSNuZzisX6kHcTfGxz3cUSf7dBIn/2uWy2wIgt1L9qMRnnZdJvRoZ
 vHg3VW8THxUSrTpQbne5kUA6hDhi0ePqQS1xBM3MZVK9Jl5i7tZ6M4r+gNDJAJN3ORly
 +aBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGYGw0ciQ1NZJCLjbpj4MSbJnkP3xpGrgMVONXVokMg=;
 b=gEYLsbnTQ1EZJrTaXDwwcB5m2ETPrD9W70LFIxamcVigpo0sNnuHD1G/lqzDxUKuPU
 LnXhyytkYDQoSkfnYk38h3J0XRqRqs47uNJHrkXFiOZuFLHQM31LsvTLFvz/u/3AKXJU
 9OZYeZiiz7etoF21/nleH8tGd5oikc1XCjF/OgbE6PSCkToQWBCXMIWotuBoJPoWHP5C
 e5ae9rLKxQjEQ7mmJ0kxiB2Y6EkujXABWOCn+PLXTkhFS2+75KuAuSrU+NSxXaZVaJu4
 rsb7fo4dtWEB9gqX2JXB+n/5AwcnPzbPIGl63h5E/Cq4XvW4RV3Vl93FhU72W8JBztFB
 5SkQ==
X-Gm-Message-State: AOAM531siNIrWZHzrRBcAO+5DFr/ORPtokqh6Ihnq2j1YR9nd4BNisaC
 oVWRZFOI1ejofUjdVBrEDVZ2eA==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr4306458wrw.124.1613389986144; 
 Mon, 15 Feb 2021 03:53:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:53:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
Date: Mon, 15 Feb 2021 11:51:36 +0000
Message-Id: <20210215115138.20465-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4N8lbA2v1V3r

The AN524 has a PL031 RTC, which we have a model of; provide it
rather than an unimplemented-device stub.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 183c3920903..2c385422373 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -60,6 +60,7 @@
 #include "hw/misc/tz-msc.h"
 #include "hw/arm/armsse.h"
 #include "hw/dma/pl080.h"
+#include "hw/rtc/pl031.h"
 #include "hw/ssi/pl022.h"
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/net/lan9118.h"
@@ -132,8 +133,8 @@ struct MPS2TZMachineState {
     UnimplementedDeviceState gpio[4];
     UnimplementedDeviceState gfx;
     UnimplementedDeviceState cldc;
-    UnimplementedDeviceState rtc;
     UnimplementedDeviceState usb;
+    PL031State rtc;
     PL080State dma[4];
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
@@ -596,6 +597,23 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static MemoryRegion *make_rtc(MPS2TZMachineState *mms, void *opaque,
+                              const char *name, hwaddr size,
+                              const int *irqs)
+{
+    PL031State *pl031 = opaque;
+    SysBusDevice *s;
+
+    object_initialize_child(OBJECT(mms), name, pl031, TYPE_PL031);
+    s = SYS_BUS_DEVICE(pl031);
+    sysbus_realize(s, &error_fatal);
+    /*
+     * The board docs don't give an IRQ number for the PL031, so
+     * presumably it is not connected.
+     */
+    return sysbus_mmio_get_region(s, 0);
+}
+
 static void create_non_mpc_ram(MPS2TZMachineState *mms)
 {
     /*
@@ -846,7 +864,7 @@ static void mps2tz_common_init(MachineState *machine)
 
                 { /* port 9 reserved */ },
                 { "clcd", make_unimp_dev, &mms->cldc, 0x4130a000, 0x1000 },
-                { "rtc", make_unimp_dev, &mms->rtc, 0x4130b000, 0x1000 },
+                { "rtc", make_rtc, &mms->rtc, 0x4130b000, 0x1000 },
             },
         }, {
             .name = "ahb_ppcexp0",
-- 
2.20.1

