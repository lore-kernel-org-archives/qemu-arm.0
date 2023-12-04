Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2387363ejb;
        Sun, 3 Dec 2023 16:32:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Z2a9qkKmem0zozEIPqS1MA075uQW6tyatv1pvgxDt/on1pc+Fc8vTKBgZd0J5v4trShL
X-Received: by 2002:ac8:7fc3:0:b0:423:82dc:61b7 with SMTP id b3-20020ac87fc3000000b0042382dc61b7mr6233423qtk.30.1701649975169;
        Sun, 03 Dec 2023 16:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649975; cv=none;
        d=google.com; s=arc-20160816;
        b=vhae7n7GqP64JQvbchTUhs5uQEhCtG2V+6r/Pr5TxjeP3nyhtkSHJOKMG98ektzZLf
         7Q7b+ATxiQcU10kghQo/2FxCItZN/wBI7kTtcs95xDXT2zdkUjhUuIrNDp7JG3fYQCuA
         953kbKZzBlGlNiUTxvQSdaJn/bcb3fvlwVfAGdmHPU7JJmvqJFWCNte9g5hfhPKK1LiR
         p4Su0c6k88cnnKbTwc6sQMwtCaTYeNWwD5r3GUlvbwUKtIch4op+pIwfnbv5RfpPiOQp
         /wUlXdudTK0/s3vUGjiMl1P80zwE+QsKI1m+QYRc7DQDlpzdOam8H8yvk5o5Dck4RczD
         k71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=IOMz5khDT+zV2HFTkPMwzopO5OjYQ+HPIhGJmevkCu4wUpw35QFTzQywZAvCdvgo44
         PD9X3XFcwtXiW25W0RoMLY1S6JLnwLjwbkUxYlfF5/dXgelyHisdmPKpZB71taZ9UpSt
         afE6Xo/omi4qOcMj1BBJ0k+QR/c4bfHfCnxjZ0RVBQzejVJSAwnFTVZ7ZdfbidaySj5k
         zKExwTrt5/4VFrtTgnbeGKLgHROhDrZlZpKzJHz4S6GlRkxyERjmOje31FYqWAR56kwM
         Y3VOcVi9igkVEVUholIxdRb+QcjVMu2mOegdrLRWTRQs5vMDsykttIYez2StNZzwcgmb
         j+cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="YwnYFNp/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca16-20020a05622a1f1000b0042547f83d94si4009465qtb.27.2023.12.03.16.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="YwnYFNp/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9woR-000767-IH; Sun, 03 Dec 2023 19:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wny-0004zx-0G; Sun, 03 Dec 2023 19:27:22 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnv-0000KZ-Tg; Sun, 03 Dec 2023 19:27:21 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5d7346442d4so10658767b3.2; 
 Sun, 03 Dec 2023 16:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649638; x=1702254438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
 b=YwnYFNp/4bEsA879JYXya6NsS5vqdkEkJlnSzpbBrVQZ63GZHuKY0mdw88RU3atK5z
 FxgD6cwif5JfYn/CqlrCSvBFD7pVIbBEiIWszHAklqX4loQGnASDzMLP2sgixEKh96Gt
 tjP/JFkkXqIElYaLBe2yddYL8eciHEiMQYBH58kzOZAc1xjo74GpYSSVHBsB/ZJBZYk4
 8WrW9OcGuJS9B7rIHdfhKhyMLqDQbwUocQr/OVVyTIJ5rLPHqiHp3N59bc/HqcrHAc65
 CAJBrFI5Gu0PpOe/z5nee7Xfjm4BzLzD75diHL1/Jr4O/IdBGFS6bJnmbjvDvTW56aZm
 Et8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649638; x=1702254438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
 b=ZdqfQ16UZ/JdmtVogxAFdw7/K7dNs8s2QSxgBnuncKgW2SQIb2OtWRZuutNrdCUncO
 7BfSq4hVizq7D/eztAPBTc4pDEHluaWcxo7eptvTpO/h0CyJjrQ6qDypAzd07YeCQqjR
 db0gZSpSqvpSpBE2klAist+xUtvO2Ou4FSiRIdPLRDuwknSI0OU+mDg+GEsHUtWIs+av
 UxXeKG0HvymtVAb01dMLpzegct/Z6Tg/6Vc0bjBaTXrTqMbEui9ji7W26J+IK0dVaKDa
 DZ8/YrWdZYU6auXSjMCwXTu7SfjvB1dbp5ocZKU/hGa/6MsJsbM20PLK8XjFdZHYx8uQ
 Iv2w==
X-Gm-Message-State: AOJu0YyW5WrkI6u5MM+xA07m96u3dE7zRhqyLuFc4EoqaB/eHdEs2c1F
 mgcpVto4JKcdQJYGfx7CHceflPh2dGCDxw==
X-Received: by 2002:a81:4c04:0:b0:5d7:1941:355d with SMTP id
 z4-20020a814c04000000b005d71941355dmr1899583ywa.68.1701649638227; 
 Sun, 03 Dec 2023 16:27:18 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:27:17 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 43/45] Add missed BCM2835 properties
Date: Sun,  3 Dec 2023 18:26:17 -0600
Message-Id: <20231204002619.1367044-44-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1132.google.com
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
X-TUID: mJ1OrFoZACmp

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

