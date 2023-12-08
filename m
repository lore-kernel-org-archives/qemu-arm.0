Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2045590ejb;
        Thu, 7 Dec 2023 18:37:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFU1zysbvsb619Qhp2Ols70fNB3SJOhjKgoGIeqtLpqHThxOBsqZjeHwKZ+S3uBELoGabG
X-Received: by 2002:a05:620a:1343:b0:77e:fba3:58de with SMTP id c3-20020a05620a134300b0077efba358demr2278167qkl.111.1702003019945;
        Thu, 07 Dec 2023 18:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702003019; cv=none;
        d=google.com; s=arc-20160816;
        b=AdNQ5+8jwiSfoNmA5RmTcQSpCezlV/3U3bpDgv/NPcf4sCCJrGQJiRXb5cldE1dwil
         F7jTcxOyEIQJxV7JtdGHLiaOCZSzaXUEg5BsAzrsgwJ4zzvyivnDP6f8uwrSBYFC6k6h
         Wf1I7ghQopJNQ3lcmn+77AfcuT+/wjh2oG4+8ZIkE4bOLJGKJzkFKC+7gdsezXkFxp7+
         PZOKguBHTw1yQvGX/fhcg05Gr98CVEK24+1eZbUOIDfWVL9bEgbZM3QLiWLIyfad+H2a
         4XjXcCWOaWioQfR+xC0H0o4VW/K1pPPT4wA6qaRS5hIEZ7963o8wh68/LSxxoT7oR6Y8
         idow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=ta09GE/Nk4JSAIob7XLpEGTEreG7uLPC+EMbV9Vm7cOfSwysnx6yYHxsBHUy62fUlt
         lsuu5JY/fgs/lQkFXWZ+4pXKrJZ12pflme1708lcqs9Q6Bvo8stmTDcDHCnMD78duaxh
         HHT8panXrnx+Ow/Hz6lHSLyipuOVrGP4OxJTvyalCZQlRd9wpV676Hw+dq4+dDZ1m6Qc
         9zMv8d0KrTYN+/UVTAq+bURcpYp8bHWcEmA3p/Cve7ZuzxAci5T9GII0VvrfCU7L9w7Q
         3vu0w8ZiilSK4sBGs0awzxI8q0eB4Mxt6FLLM709gkSzvAJeAMl7MTLLMv8pDt1lIo1D
         Cn7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=joyuY1Za;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05620a229100b0077f378997c6si1053893qkh.505.2023.12.07.18.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=joyuY1Za;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQhS-0002yw-Dv; Thu, 07 Dec 2023 21:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQhC-0002X5-FD; Thu, 07 Dec 2023 21:34:34 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQhA-0002sM-I9; Thu, 07 Dec 2023 21:34:30 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ca0f21e48cso19955021fa.2; 
 Thu, 07 Dec 2023 18:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002866; x=1702607666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
 b=joyuY1ZazTNMPiKad1SiRU6GXqVMyk689I6NnCwo9yuLJLJJunl2nXQjqu5RcPZJA8
 y0eeUxMpn49Qg2C+/AhoED6oJkYGQLpGSBZt1ZvxlrdmjFHXgVh1+cq1kcwZ2t76EFpu
 w0193gVibIUc1Kn8/aXi4/+/+3dYD/xMrliD6lM9BGDuRbKCfyLbowomWdF1E9FwQshw
 yaQ7aoiAqtDrdMXdzPx5SL1WHQojDx9TpIpIyYq2TJ1RC1ei8zKdJC5erqNZ2VynTb1E
 LwEFnhOX1Yde2CG3uWxDiAe0dOi506cea3J4hQdEaTGxNc83/n2AZ/3oUtixLOMiK3j2
 p2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002866; x=1702607666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
 b=O2ROu9wGo/kvgEoR2kcwaNpLt3+njXS/NjOfLFalakzdosat82xCF9y4X0I5onCceY
 F42dk1y4Fn1VEYjMbZcT0/Fgalahtl9D57mLX/4StMenmGm2y2qFTEV+SVdzg2fwm+4+
 EEgT32uHqPlGg8swoRTnRkeukf+qw0eBsDCvrUZKDnAv6zzwMQQ3aZaqDNc1V2QVKifm
 JDLd2BXDxwZHi0RvVPTeojQpZZb5IhxtrfVfJCscFGiJq979P3V0jAJW3SuHwOaS5t1x
 FE/hrpJfOPTGZocmEnRThm1KBx60cql3Lot9FEka831dwJcgH/Kzz1r+O16hKsFrKq4q
 1DTA==
X-Gm-Message-State: AOJu0Yxm0wRjfRJpf7fIDKhnda7WUr39UXJ58hwE3MRZFm5y06CC9s2e
 P50lZt0gSVSt4IDM1oz19ZCCBtVJwlXQqg==
X-Received: by 2002:a2e:9d94:0:b0:2ca:692:39a8 with SMTP id
 c20-20020a2e9d94000000b002ca069239a8mr2095381ljj.74.1702002866047; 
 Thu, 07 Dec 2023 18:34:26 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:34:25 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 43/45] Add missed BCM2835 properties
Date: Thu,  7 Dec 2023 20:31:43 -0600
Message-Id: <20231208023145.1385775-44-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: ASTMN8rPZkfH

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/misc/bcm2835_property.c           | 47 ++++++++++++++++++++++++++++
 include/hw/arm/raspberrypi-fw-defs.h | 12 ++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index ff55a4e2cd..dfeb793b3e 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -19,6 +19,9 @@
 #include "trace.h"
 #include "hw/arm/raspi_platform.h"
 
+#define RPI_EXP_GPIO_BASE       128
+#define VCHI_BUSADDR_SIZE       sizeof(uint32_t)
+
 /* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
 
 static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
@@ -138,6 +141,13 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        case RPI_FWREQ_GET_CLOCKS:
+            /* TODO: add more clock IDs if needed */
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_ARM_CLK_ID);
+            resplen = 8;
+            break;
+
         case RPI_FWREQ_SET_CLOCK_RATE:
         case RPI_FWREQ_SET_MAX_CLOCK_RATE:
         case RPI_FWREQ_SET_MIN_CLOCK_RATE:
@@ -276,6 +286,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+
         case RPI_FWREQ_FRAMEBUFFER_GET_NUM_DISPLAYS:
             stl_le_phys(&s->dma_as, value + 12, 1);
             resplen = 4;
@@ -301,6 +312,42 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
                                     resplen);
             break;
 
+        case RPI_FWREQ_GET_THROTTLED:
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            resplen = 4;
+            break;
+
+        case RPI_FWREQ_FRAMEBUFFER_SET_PITCH:
+            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_FRAMEBUFFER_SET_PITCH "
+                              "is not implemented\n");
+            break;
+
+        case RPI_FWREQ_GET_GPIO_CONFIG:
+            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_GET_GPIO_CONFIG "
+                          "is not implemented\n");
+            break;
+
+        case RPI_FWREQ_SET_GPIO_CONFIG:
+            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_SET_GPIO_CONFIG "
+                          "is not implemented\n");
+            break;
+
+        case RPI_FWREQ_GET_GPIO_STATE:
+            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_GET_GPIO_STATE "
+                          "is not implemented\n");
+            break;
+
+        case RPI_FWREQ_SET_GPIO_STATE:
+            qemu_log_mask(LOG_UNIMP, "RPI_FWREQ_SET_GPIO_STATE "
+                          "is not implemented\n");
+            break;
+
+        case RPI_FWREQ_VCHIQ_INIT:
+            stl_le_phys(&s->dma_as,
+                        value + offsetof(rpi_firmware_prop_request_t, payload),
+                        0);
+            resplen = VCHI_BUSADDR_SIZE;
+            break;
         default:
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: unhandled tag 0x%08x\n", tag);
diff --git a/include/hw/arm/raspberrypi-fw-defs.h b/include/hw/arm/raspberrypi-fw-defs.h
index 4551fe7450..ded7a22f02 100644
--- a/include/hw/arm/raspberrypi-fw-defs.h
+++ b/include/hw/arm/raspberrypi-fw-defs.h
@@ -101,7 +101,6 @@ enum rpi_firmware_property_tag {
     RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_ID =             0x00040016,
     RPI_FWREQ_FRAMEBUFFER_SET_DISPLAY_NUM =            0x00048013,
     RPI_FWREQ_FRAMEBUFFER_GET_NUM_DISPLAYS =           0x00040013,
-    RPI_FWREQ_FRAMEBUFFER_GET_DISPLAY_SETTINGS =       0x00040014,
     RPI_FWREQ_FRAMEBUFFER_TEST_PHYSICAL_WIDTH_HEIGHT = 0x00044003,
     RPI_FWREQ_FRAMEBUFFER_TEST_VIRTUAL_WIDTH_HEIGHT =  0x00044004,
     RPI_FWREQ_FRAMEBUFFER_TEST_DEPTH =                 0x00044005,
@@ -160,4 +159,15 @@ enum rpi_firmware_clk_id {
     RPI_FIRMWARE_NUM_CLK_ID,
 };
 
+struct rpi_firmware_property_tag_header {
+    uint32_t tag;
+    uint32_t buf_size;
+    uint32_t req_resp_size;
+};
+
+typedef struct rpi_firmware_prop_request {
+    struct rpi_firmware_property_tag_header hdr;
+    uint8_t payload[0];
+} rpi_firmware_prop_request_t;
+
 #endif /* INCLUDE_HW_MISC_RASPBERRYPI_FW_DEFS_H_ */
-- 
2.34.1

