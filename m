Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3412452lfb;
        Thu, 24 Mar 2022 10:25:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMKG/lfmnsxQJvVenjAgQWVCuKuIDz101dObmfU72SWMTlDejbeXRbTsn6OYKlYkfU9nTa
X-Received: by 2002:a05:622a:1906:b0:2e1:e563:12b9 with SMTP id w6-20020a05622a190600b002e1e56312b9mr5594129qtc.44.1648142744576;
        Thu, 24 Mar 2022 10:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648142744; cv=none;
        d=google.com; s=arc-20160816;
        b=i4sIxA52KNSa581FlqO72Km2C4LWff7/cWTstwVXdPUiskfZ2GyTb6a0d/9lYxrWBd
         eKFoQfCEgm+e5UI72QflvK2d5+50NXdpuacDvGqZ+U0TYhLbSSIfbwWCK4xVcbOb3hKZ
         f0gP9dwBKSMBghWPN8VQFBjYrTY5dnbV9JaW8diFOwwF4XIZ5SQeqWqUs9faWJCYr8KM
         rEsDPkKJNCEcEJlnXH8pv0n3/9J/epCRPn/eF9JdoVSHfARr9E1SKzsUjeyygMsj3vDE
         DTesybNdfKGt9mSMdOHy9Ly7dzAVcKVZSGAbZIMorb5aQ+LYpD4h2OnWoajGKWDC6ACe
         Q6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
        b=JrR/8/lpXV4WBJzHKOZcryB3kWG+G4TCZ6yAWYFyaW7gXEvgd0GefArcjozqaP7McZ
         9oyoFVIxlku7oa517mUdF3b8LYnh8zx4/o0uAi4qejCXghUg7m3PKQcc3JOtWIpgzYTl
         0iVB8ddiKd7KNlkAAzXUhhyvifeA/wuhzQBGF961HTQr8H2exjQoSsU7zKcxJNCcAU1G
         Y9lduvYRsu/PfeIUg6FxxcZruNdc3ugzEIGhSvlzxAX7cqfgenPh/ChbAUKq9WpQ5hu4
         DLTyY+20/XDPOjCpzist6N6pIXCieyrwh2rO0BdSyJCs4pdlAGWelSUPU2xH5FN/z4lW
         uqkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=0xrFg3ft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05620a291000b0067e4be238bcsi163261qkp.257.2022.03.24.10.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 10:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=0xrFg3ft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXRDU-0004KL-29
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 13:25:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6m-0006cN-1E
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 13:18:48 -0400
Received: from [2607:f8b0:4864:20::634] (port=42532
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6k-0007ps-Hx
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 13:18:47 -0400
Received: by mail-pl1-x634.google.com with SMTP id p17so5426894plo.9
 for <qemu-arm@nongnu.org>; Thu, 24 Mar 2022 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
 b=0xrFg3ftAZkcawE+gB1ZWvMv6rKVucbksmbWNfM7joQKGhN/X8klYC2BkPIZsSALWf
 f9raFXVOVjJLSqgUer0vEMtguSlCMUWKtMg+csS/zb6A5dzdsjJ8CPsolRLg+iimCf1g
 pIQ1KO2rfbQ+OC5B1mJdTkIZMdlda7mzxEl89ckKHWBCdvFWqI4si74jFdAtdOaj0Osc
 ue0XLLgHeCpQS69sj5CxiW3r1Yl4mYwL0pSQajDRnvXMk+xMF1p0qNxlQhZrqbLS5MzG
 AWnYooXEPppusfRt5HwHj0K3cW3GzF+StSnpU0NT7KRwuu6gZHz46mMSaxP9PNMHStBT
 eigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
 b=1/YbmmHyPvFLj0/x1juiQIQRb9UWipskG1FNfn8CDTW1aDMf2yDhDcsOdzebZImWT8
 Zu8YhHAwy3dHkoH0VlPPbtrBz+NQikgbB038lS51LWPlXlRcJtZjyM2fj9o8qY5usX1o
 +LdzXe9UcbWLc9YnAU7WwbrxzLstPUg1nItKHG3Mk9XXijNyPDYpisux3ogWiLyMRzjD
 09Vb0vCtzYx7/IFrqFlG5cT1bfHPzfQReYgOyI5uNRzhjPbt4VXhAXipas1Ic1cI9qOO
 LnXKUYp0y9b0cdU31S8qGJtHCC4WGc+Ej3jjibpiYG9zS3dJPt+nk/aA4hY9mPgsCtmh
 ip0g==
X-Gm-Message-State: AOAM531of7SLWVQYGJxkQrJDLWq1wea/Aqf1fUXLWDjqkec6pfDFQVDC
 P/cuQzmFluOyLLVUP3p+3Rp+uRlJXrTEEA==
X-Received: by 2002:a17:90b:4a0d:b0:1c6:f480:b7f2 with SMTP id
 kk13-20020a17090b4a0d00b001c6f480b7f2mr19623205pjb.79.1648142325190; 
 Thu, 24 Mar 2022 10:18:45 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.10])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm3937412pfb.102.2022.03.24.10.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:18:44 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 01:17:54 +0800
Message-Id: <20220324171756.196654-3-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324171756.196654-1-zongyuan.li@smartx.com>
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gc1Ti/++/S1g

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/stellaris.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b6c8a5d609..12c673c917 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -1160,6 +1161,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             DeviceState *ssddev;
             DriveInfo *dinfo;
             DeviceState *carddev;
+            DeviceState *gpio_d_splitter;
             BlockBackend *blk;
 
             /*
@@ -1237,9 +1239,18 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    &error_fatal);
 
             ssddev = ssi_create_peripheral(bus, "ssd0323");
-            gpio_out[GPIO_D][0] = qemu_irq_split(
-                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
+
+            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
+            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
+            qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal);
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 0,
+                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0));
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 1,
                     qdev_get_gpio_in_named(ssddev, SSI_GPIO_CS, 0));
+            gpio_out[GPIO_D][0] = qdev_get_gpio_in(gpio_d_splitter, 0);
+
             gpio_out[GPIO_C][7] = qdev_get_gpio_in(ssddev, 0);
 
             /* Make sure the select pin is high.  */
-- 
2.34.0

