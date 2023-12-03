Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2334352ejb;
        Sun, 3 Dec 2023 13:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhRWQ6S/VC5xVBT3lGCNATD0BKyXsH7Kx+2nIb+bLLP15lvKaZxfMxkO0j+Mgr17rEeiCw
X-Received: by 2002:aca:1c06:0:b0:3b8:4d1e:1da with SMTP id c6-20020aca1c06000000b003b84d1e01damr4124837oic.37.1701640287137;
        Sun, 03 Dec 2023 13:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701640287; cv=none;
        d=google.com; s=arc-20160816;
        b=hT0MyZzSGCGn+uBT5wnHHNZQj2rUfN8NR5nq6ly0zdVE7Dl+3Rm5vsu1e2/RAfT/dK
         JOQ/1goGBB1MxKrB/lgkZmRiKX5Stubw38QL3IFgENC7W7nyOlQwhXerumE6wqyjl0T0
         v0N41goDI5Dk4rYtb/mlEQKHl6jWLtaFl4vYLdPA78rtIVe9E2eyIZ+I+D0b23+bpjKl
         zo2CZ8HfkQR501uA2WUU+HcwSaSD9u2ZoB4SXRNV/HhCKMEnBEEOTlNgm6UsqTUvt85M
         A19oHzqdiJzxcW+PDQBYUs9TupLpLPwsGPUPMnc3Urc8ewK/uGzxBjmB9XXHI+XIyoTx
         6GCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=cYa7Oa+OkELZyFwIQtdWuyKdmw/H5fTpu355NjyW4PDrESIReoNq8oDEnT+HFfH/MI
         oVQmYp4/vzBaEtfCDOMvAGZND0a+1mdwTyyKke2tuyWO1h4qaQjqCcYx1sX+JmBVurA8
         L6yEHyP280WYdH1q5j+CIlUcwX2f6b6NU6qYKiQMVnDUqc3ASDRwCRB8/0lUEcdSjdIO
         OjJd66EkGa3sVOPuO275kkSodl77cpBsYgDWuzPqydS/L3lHPgHfmUgyjpFpLxSjHqKX
         Un4LGO979Kz5IdshcJTg7bsNUPAXIg1e5bIrdPXqFMIugq4qjsNAqHDFa+8FiJEL8bJF
         jboA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HV+fL5hP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de30-20020a05620a371e00b0076cd7f1c3dasi8735307qkb.247.2023.12.03.13.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=HV+fL5hP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9uLs-0003kl-Ml; Sun, 03 Dec 2023 16:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9uLm-0003hB-RI; Sun, 03 Dec 2023 16:50:06 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9uLl-00006Z-3K; Sun, 03 Dec 2023 16:50:06 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d05ff42db0so42766807b3.2; 
 Sun, 03 Dec 2023 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701640202; x=1702245002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
 b=HV+fL5hPlF6wmdW1XcgqwkIAVkGB4YSDBmsQl+KcaetNAdcgYd7a4bRujN05G3n12z
 WMrArU0eDs3eD853HqXbVjQRwteDK1JwhhI48DowRER+6+PIyjPoc1098d70OxLPG/Xl
 +dox1qxG/vZmaUAQefXz6zEXCElFl6CKoxOqq7SbxC3v/q88QXKd1v3rHm7l7RWa5g0U
 C19KGZc4bLsZ2xf2du2ErjILnBKpLFvd8upP8WYAqbncmrOwEkJO84kib5gRLyMgVeo7
 M0DxD2t40ZEaZ59qVwfJBnEnMBmfBp+mGQldJcgy8HM6VHeT192x5bTIOUNzqyR39hUp
 PkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701640202; x=1702245002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GNEkGSGTayvrkpE/A09q7fosCX6vgAb65BjfPwzFOc=;
 b=TugWuBAS4Tp/dUAHvD4WBSTTqaUAh95YyLjFU8mZy0cF/zx4uydURBthusXacacNE6
 WO7diBvymGdwEzn0Jl5JBQbXuOTuHod6vas8D0noBlVd17KTIpmtBOFtCeMbH/7PyFXI
 TF9QwCtoStNecy9vfqskps8oQTHRv4eueYQnoY/bqg8JPesnmg46z+SdD50IsU/RPxpz
 7q5AJf66bH9oerFHm73Es6enVVSWfrvgw5QptHPW8H+1Ys7VRHvLltDJqcGLlH7ju2MH
 ZrVRFLd6lAhcLy59vcEPvsZFhCiPvVmH6p/LNj+rPGVN7s8jZrFE7U+YZh+Fm6H/H9b9
 5ixg==
X-Gm-Message-State: AOJu0YxrGUo6gCaJSF9gjkbJeLONUBwd0UETvD6O6b5XZ2JXmKHSmw7i
 VH/Xwh7DUQI0j7cdM4jnZESr+3k5QJP7OA==
X-Received: by 2002:a0d:ec0a:0:b0:5d8:ae19:f841 with SMTP id
 q10-20020a0dec0a000000b005d8ae19f841mr228015ywn.30.1701640202433; 
 Sun, 03 Dec 2023 13:50:02 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a816502000000b00597e912e67esm2832788ywb.131.2023.12.03.13.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:50:02 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 43/45] Add missed BCM2835 properties
Date: Sun,  3 Dec 2023 15:49:08 -0600
Message-Id: <20231203214910.1364468-44-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203214910.1364468-43-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203214910.1364468-1-sergey.kambalin@auriga.com>
 <20231203214910.1364468-2-sergey.kambalin@auriga.com>
 <20231203214910.1364468-3-sergey.kambalin@auriga.com>
 <20231203214910.1364468-4-sergey.kambalin@auriga.com>
 <20231203214910.1364468-5-sergey.kambalin@auriga.com>
 <20231203214910.1364468-6-sergey.kambalin@auriga.com>
 <20231203214910.1364468-7-sergey.kambalin@auriga.com>
 <20231203214910.1364468-8-sergey.kambalin@auriga.com>
 <20231203214910.1364468-9-sergey.kambalin@auriga.com>
 <20231203214910.1364468-10-sergey.kambalin@auriga.com>
 <20231203214910.1364468-11-sergey.kambalin@auriga.com>
 <20231203214910.1364468-12-sergey.kambalin@auriga.com>
 <20231203214910.1364468-13-sergey.kambalin@auriga.com>
 <20231203214910.1364468-14-sergey.kambalin@auriga.com>
 <20231203214910.1364468-15-sergey.kambalin@auriga.com>
 <20231203214910.1364468-16-sergey.kambalin@auriga.com>
 <20231203214910.1364468-17-sergey.kambalin@auriga.com>
 <20231203214910.1364468-18-sergey.kambalin@auriga.com>
 <20231203214910.1364468-19-sergey.kambalin@auriga.com>
 <20231203214910.1364468-20-sergey.kambalin@auriga.com>
 <20231203214910.1364468-21-sergey.kambalin@auriga.com>
 <20231203214910.1364468-22-sergey.kambalin@auriga.com>
 <20231203214910.1364468-23-sergey.kambalin@auriga.com>
 <20231203214910.1364468-24-sergey.kambalin@auriga.com>
 <20231203214910.1364468-25-sergey.kambalin@auriga.com>
 <20231203214910.1364468-26-sergey.kambalin@auriga.com>
 <20231203214910.1364468-27-sergey.kambalin@auriga.com>
 <20231203214910.1364468-28-sergey.kambalin@auriga.com>
 <20231203214910.1364468-29-sergey.kambalin@auriga.com>
 <20231203214910.1364468-30-sergey.kambalin@auriga.com>
 <20231203214910.1364468-31-sergey.kambalin@auriga.com>
 <20231203214910.1364468-32-sergey.kambalin@auriga.com>
 <20231203214910.1364468-33-sergey.kambalin@auriga.com>
 <20231203214910.1364468-34-sergey.kambalin@auriga.com>
 <20231203214910.1364468-35-sergey.kambalin@auriga.com>
 <20231203214910.1364468-36-sergey.kambalin@auriga.com>
 <20231203214910.1364468-37-sergey.kambalin@auriga.com>
 <20231203214910.1364468-38-sergey.kambalin@auriga.com>
 <20231203214910.1364468-39-sergey.kambalin@auriga.com>
 <20231203214910.1364468-40-sergey.kambalin@auriga.com>
 <20231203214910.1364468-41-sergey.kambalin@auriga.com>
 <20231203214910.1364468-42-sergey.kambalin@auriga.com>
 <20231203214910.1364468-43-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: O4nCqJw5rWHj

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

