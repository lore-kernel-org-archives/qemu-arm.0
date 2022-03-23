Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2583246lfb;
        Wed, 23 Mar 2022 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVFEaiDs3qSeFNTjS/hNYPvWV2KrV0FKs1Klq64x6LQ7VBVzD5U7/XVRRT+9KKSMrd4sX0
X-Received: by 2002:a25:2f8f:0:b0:633:b795:6f2d with SMTP id v137-20020a252f8f000000b00633b7956f2dmr1042302ybv.289.1648057318682;
        Wed, 23 Mar 2022 10:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648057318; cv=none;
        d=google.com; s=arc-20160816;
        b=qiWyBRCtfdVrdFpDqDuLC+4JodnLaZigG2vPfipxP3kTG7W8patn3V+pcmxfesFAAv
         7YU8xc4M2jYOhN5LXOm+gBMDgyYedXEgqEbJMyOlWL1000zlgHMfxz/PiL5H0qhO2UNN
         GKk1nT01C2WKXku65E+WYcNXNUFHWjHP03w3EN2kBbuW1mKvjA6CxoyM6wsj5O+zmz/a
         LiQPJeJwqG575X6zlJ2JFsPT8LmTY19EQvDwcXgciDliGQpvzsrh0Ky+dKk70l8Ob4Xy
         cjoHyjigG4Fp+uwriHU8n0EvyAyI0xXE/Y9imi5Xm/YKGuDSgeMbsNj2QjMBj66aVJNH
         xEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VkrhIhe7YG6BgM78VtHLUlMDvp0jiKNofViYVhBy1/U=;
        b=nwHutIKmU29l96IRpGDCSBv4lqdK9DhwGxBwSAHePRq5avE8ctEXUvnIBOo8kkPkjH
         HgvtbPhhVK0z0jUlX0ASxcuPeyYl8M5Wb/Is+FlASWvcX/s3BSt6dfczTLqEl6roR9wc
         yd5m/kG7CcOVrIMkMrVBtQgg7Y0Gk0D7NdVuDj5I2LDQ8GqZA2gHvuBbUT9PzTPql/vf
         9qovTzcJykCOaAW5p8DLe8dYbAi4sb9ORCBrY0/Qf3jp3fTPMi54Y/4ihpNbd6p0x+lt
         gJ3QU5sidX18kkBWMB/X5V3gnTZohj+4gYjj1uo3GFsHQphuLpA3miG1BFc0tacRmkpY
         l5tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=qNVxXYid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63-20020a250642000000b006345ff3e33esi3239290ybg.346.2022.03.23.10.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 10:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=qNVxXYid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX4ze-00043L-3f
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 13:41:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uA-0008Ix-Tj
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:19 -0400
Received: from [2607:f8b0:4864:20::1031] (port=53129
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u9-0005Uh-Dq
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:18 -0400
Received: by mail-pj1-x1031.google.com with SMTP id v4so2428007pjh.2
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkrhIhe7YG6BgM78VtHLUlMDvp0jiKNofViYVhBy1/U=;
 b=qNVxXYid4f/16xzVNs/iRGfRJPgcmWKGFlOjDzQgeIh67roBFhkrYI8UH1l8weVvel
 1zthPzYsS8KW8Uv6S5mvFnERlSthed+P6pOhQzYFNdBwuaVH3K694RqLiyRrjSzLlifP
 BUnYyuPsWkkPZv3Sx/u+DmPQ9VJYS/BwS6ep1zx7badznB2wSy6F59EUiKeAax0USpek
 UKhHKiI6+3HnOXEmX9x0dzgwp5U3gNI0quDZwvBo3d99C2RY0xjL1Qs0ii1uGFPt4JGW
 XxJcdKtvAAbkxNNi5sQRKuBM8ol6v19eL7D2qQD4ieX4BE/Ya6Qwze7toJgpcxthUZmK
 /H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkrhIhe7YG6BgM78VtHLUlMDvp0jiKNofViYVhBy1/U=;
 b=jZP8R4yFqxPLizgrEbJHwI7EzZYK4hGdMG6p0s1OIu2tBh3EJdJq8VPAiaZkLlH+bp
 CPhswLTc3p4eYb7kPS741kAbGEt2QdlVX9MCchJUTJmNrli0flr8B1XyEpV0a84cjVfx
 t4wNGg5iLUpuA/f2gQeEotIrP/TS2oB+QYokhpU7w+wWFxEhe3q8vknqjJee5DObjDk+
 ftqBk7lYPhiMfFiJWuYwewbIoLAQdmeb8jr4UCDMy0Kdkq4pimPqGRVbOWWEvFONNjfh
 3V09tV6I0CDLuUN6wgVpujsjpdIu4oveDc8NrQmYJJbMHS01uY90jKKntTkLxSjiUidb
 9ASw==
X-Gm-Message-State: AOAM533ocU1SnrXTUmLVRvwVevVJoClZeDNq68jMl/Nhmfp85EcMPePN
 lDz1Ua5HolknO3HED9Iwj3wkcQ==
X-Received: by 2002:a17:90b:3b44:b0:1c7:9ca8:a19e with SMTP id
 ot4-20020a17090b3b4400b001c79ca8a19emr3352514pjb.245.1648056976172; 
 Wed, 23 Mar 2022 10:36:16 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:15 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:40 +0800
Message-Id: <20220323173543.146442-3-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1031.google.com
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
X-TUID: ixDAEtfxSC61

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/stellaris.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b6c8a5d609..ccc2d5def2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -1023,6 +1024,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     I2CBus *i2c;
     DeviceState *dev;
     DeviceState *ssys_dev;
+	DeviceState *gpio_d_splitter;
     int i;
     int j;
     const uint8_t *macaddr;
@@ -1237,9 +1239,20 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    &error_fatal);
 
             ssddev = ssi_create_peripheral(bus, "ssd0323");
-            gpio_out[GPIO_D][0] = qemu_irq_split(
-                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
+
+            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
+            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
+            if (!qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal)) {
+                return;
+            }
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

