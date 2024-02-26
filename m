Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1763365ejf;
        Sun, 25 Feb 2024 16:07:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/kGkrEyW1R3PP1lDBn2vA/sthB5RkdWNGsL0gszs3db3PPDbekBX/gCKcprWtLcbSdBSvciais2QGLtH2mYjX7KebqgMw
X-Google-Smtp-Source: AGHT+IEIv9DEs2OMvreKz57TaNhr0Giz+g0D7Zbw7if1J6g90fJxAsl7isai1Fjd7QWqHgCKgF23
X-Received: by 2002:a0c:dd12:0:b0:68f:4d2d:3f38 with SMTP id u18-20020a0cdd12000000b0068f4d2d3f38mr5789394qvk.46.1708906046112;
        Sun, 25 Feb 2024 16:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708906046; cv=none;
        d=google.com; s=arc-20160816;
        b=SiUbUOnw6FrinOB2vBnuwsOWTKx44pNAB7k3Xe5TtnV8fkAKetFCPub6Khgoq6s+Za
         PNwFGckXCVCKROOjqAi/naE43ACTK4wC1zp+tbuYAfe6BYd/IzdG0SeHFCRMOIqdD9Yd
         fSw9t8Yj/boChwTJHWKCPkMtntwPJsasNWleD8spgeAhjy/oBhlZtWI9ypEQDXUvxegC
         BDlDXka2lpjyixcj9EsZy4rgUBFNo/TFcnst5qPuZLj0+GUNKs61opuGIjImFcNM6N61
         AYu+sJeyvflGkE7jyntHtJx8O5YOnRE2SgQO2SOdt5HCh1Sgs9nvIyHIrLPEsGGuzyjl
         K7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xum/tGNEorhEX610bWwHZPsDiBGT2east0eAc/ZxI8w=;
        fh=Q3ymybApXVKZLLe/tVr7XNOAtHP7L1mCO+uDLDigmRk=;
        b=cYvQ9HaZMMvcDt4pihHc6ClVByax3Mm3W6vyTMrja+rWGnW/PacIoNtrge0mCUgFWT
         hNo5XvxsiFy4kIwyvtUJsBngYatpMO8I9JyO9ncm9kxq1IZ4na5HNHKLlnVT7mj2Mldq
         V7L3Juka5VI6qH8Ep34UcAtpjp63DTsdFxjwWab2pv/547fkAGTQOPXk+bq93rKp86w6
         MAp8EZaAnkmzzRIUw70/y6QGruMAYQDouIWSSvf1i7SUEtmwDZtdKcVhCxENiw7iFW57
         Km647KWUeXNRLlAC5tz6f4BQp99fTOFapPIq6Wz1gyUvZNtEQtnDFHUGyKCNaNOLtxRe
         ZFLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIR7ZUWO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu8-20020ad45cc8000000b0068cbab014absi4038293qvb.595.2024.02.25.16.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 16:07:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIR7ZUWO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reOSp-0006bi-2B; Sun, 25 Feb 2024 19:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOSm-0006ZS-9d; Sun, 25 Feb 2024 19:03:20 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOSg-0000IC-G0; Sun, 25 Feb 2024 19:03:18 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-608959cfcbfso24496677b3.3; 
 Sun, 25 Feb 2024 16:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708905793; x=1709510593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xum/tGNEorhEX610bWwHZPsDiBGT2east0eAc/ZxI8w=;
 b=EIR7ZUWOvMEfEqQO8jPe+/RRNpmMAAuNH9gWLPaHz0CkmC29IaFDUFgFOyd/5qjiXY
 Dmj4SRijPAVdHAAInM4ts1arrl2hw5nQjABROmtp+pJ86uXMptJXRpxJwZXtaZmNeKHV
 yMIavoPuPrIN7SyOf9wP5wtVKCs+2amtXAR5w1Zsd10+LLT1NCKdhRz8mrKtYYi0R9X0
 bge9gvHaP6F/ve540e5KT+cSiLDxncENDoSf6xmwIQ11WvySWGCRLQN6rVO7ThR52sDY
 bzLZ/h8QwMrM3jMcuzGm8SQGM1C0qAiZKFUgXUG//C+oR1bLoYfHJcDqiOSuekA27wdR
 UF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708905793; x=1709510593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xum/tGNEorhEX610bWwHZPsDiBGT2east0eAc/ZxI8w=;
 b=vtBfcbQXWkQyeBnAZJqeRdCpbwNmSXSQ6xQdgv8m2KH/icwyvpR8F0ua/Jah6Q9YNd
 hR2YuoMq/47XSN+PqeJl9vld90jVrLlwjyy+PDyMIaPm0qmg+T9lC6OZotoveENeVJ3Y
 JbP4BUKhFQ7bVux+WKRKZAN5EADE7Xtq84sHODbszciK8l+4B1fqADkMoriQcOhLVPmY
 egit0kUhLXLaXBvk2H+MocqD9VDh4v1QNCFBOSopVwjEPXGamnNbV0OUgTcrf1cJdiwA
 a2I7u/O+VifZKn0R1e1V+HAavy9zXawqgE43g1eFODCovt5msBNt0Rk87Oi4mHNfZmRa
 eIPQ==
X-Gm-Message-State: AOJu0Yw71LZtSN3jHiDEv5SpbIu03gbsAqRXoKKRYkI1ehAAGZvqml5d
 TMxfT4FrDx5/r59wnnuWhgtAxi5PmVP1MXur1PZV/nWAFAK6Bw1k/0t/jrDInvimXg==
X-Received: by 2002:a81:a012:0:b0:608:b9cb:ad40 with SMTP id
 x18-20020a81a012000000b00608b9cbad40mr5333870ywg.35.1708905792731; 
 Sun, 25 Feb 2024 16:03:12 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a818312000000b00607bfa1913csm938171ywf.114.2024.02.25.16.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 16:03:12 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 08/41] Connect SD controller to BCM2838 GPIO
Date: Sun, 25 Feb 2024 18:02:26 -0600
Message-Id: <20240226000259.2752893-9-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
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
X-TUID: +x1SV8IJU1hV

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/bcm2838_gpio.c         | 52 +++++++++++++++++++++++++++++++++-
 include/hw/gpio/bcm2838_gpio.h |  5 ++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
index 69d15dbb49..2ddf62f695 100644
--- a/hw/gpio/bcm2838_gpio.c
+++ b/hw/gpio/bcm2838_gpio.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
+#include "hw/sd/sd.h"
 #include "hw/gpio/bcm2838_gpio.h"
 #include "hw/irq.h"
 
@@ -63,6 +64,16 @@
 
 #define BYTES_IN_WORD        4
 
+/* bcm,function property */
+#define BCM2838_FSEL_GPIO_IN    0
+#define BCM2838_FSEL_GPIO_OUT   1
+#define BCM2838_FSEL_ALT5       2
+#define BCM2838_FSEL_ALT4       3
+#define BCM2838_FSEL_ALT0       4
+#define BCM2838_FSEL_ALT1       5
+#define BCM2838_FSEL_ALT2       6
+#define BCM2838_FSEL_ALT3       7
+
 static uint32_t gpfsel_get(BCM2838GpioState *s, uint8_t reg)
 {
     int i;
@@ -86,6 +97,31 @@ static void gpfsel_set(BCM2838GpioState *s, uint8_t reg, uint32_t value)
             s->fsel[index] = fsel;
         }
     }
+
+    /* SD controller selection (48-53) */
+    if (s->sd_fsel != BCM2838_FSEL_GPIO_IN
+        && (s->fsel[48] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[49] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[50] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[51] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[52] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[53] == BCM2838_FSEL_GPIO_IN)
+       ) {
+        /* SDHCI controller selected */
+        sdbus_reparent_card(s->sdbus_sdhost, s->sdbus_sdhci);
+        s->sd_fsel = BCM2838_FSEL_GPIO_IN;
+    } else if (s->sd_fsel != BCM2838_FSEL_ALT0
+               && (s->fsel[48] == BCM2838_FSEL_ALT0) /* SD_CLK_R */
+               && (s->fsel[49] == BCM2838_FSEL_ALT0) /* SD_CMD_R */
+               && (s->fsel[50] == BCM2838_FSEL_ALT0) /* SD_DATA0_R */
+               && (s->fsel[51] == BCM2838_FSEL_ALT0) /* SD_DATA1_R */
+               && (s->fsel[52] == BCM2838_FSEL_ALT0) /* SD_DATA2_R */
+               && (s->fsel[53] == BCM2838_FSEL_ALT0) /* SD_DATA3_R */
+              ) {
+        /* SDHost controller selected */
+        sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);
+        s->sd_fsel = BCM2838_FSEL_ALT0;
+    }
 }
 
 static int gpfsel_is_out(BCM2838GpioState *s, int index)
@@ -266,6 +302,11 @@ static void bcm2838_gpio_reset(DeviceState *dev)
 
     memset(s->fsel, 0, sizeof(s->fsel));
 
+    s->sd_fsel = 0;
+
+    /* SDHCI is selected by default */
+    sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
+
     s->lev0 = 0;
     s->lev1 = 0;
 
@@ -304,6 +345,8 @@ static void bcm2838_gpio_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(s), "sd-bus");
+
     memory_region_init_io(&s->iomem, obj, &bcm2838_gpio_ops, s,
                           "bcm2838_gpio", BCM2838_GPIO_REGS_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
@@ -312,7 +355,14 @@ static void bcm2838_gpio_init(Object *obj)
 
 static void bcm2838_gpio_realize(DeviceState *dev, Error **errp)
 {
-    /* Temporary stub. Do nothing */
+    BCM2838GpioState *s = BCM2838_GPIO(dev);
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "sdbus-sdhci", &error_abort);
+    s->sdbus_sdhci = SD_BUS(obj);
+
+    obj = object_property_get_link(OBJECT(dev), "sdbus-sdhost", &error_abort);
+    s->sdbus_sdhost = SD_BUS(obj);
 }
 
 static void bcm2838_gpio_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/gpio/bcm2838_gpio.h b/include/hw/gpio/bcm2838_gpio.h
index 06d48e0c19..f2a57a697f 100644
--- a/include/hw/gpio/bcm2838_gpio.h
+++ b/include/hw/gpio/bcm2838_gpio.h
@@ -14,6 +14,7 @@
 #ifndef BCM2838_GPIO_H
 #define BCM2838_GPIO_H
 
+#include "hw/sd/sd.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
@@ -29,6 +30,10 @@ struct BCM2838GpioState {
 
     MemoryRegion iomem;
 
+    /* SDBus selector */
+    SDBus sdbus;
+    SDBus *sdbus_sdhci;
+    SDBus *sdbus_sdhost;
 
     uint8_t fsel[BCM2838_GPIO_NUM];
     uint32_t lev0, lev1;
-- 
2.34.1

