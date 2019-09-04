Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp987686wrp;
        Wed, 4 Sep 2019 10:23:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlifcdxhhOtql8nFGl32oJm9DOR8XW0dLgpU2jdCz7uOdJuhYhsHa5kSLn2Z1QlPPPcg96
X-Received: by 2002:a50:c385:: with SMTP id h5mr42442230edf.18.1567617790302;
        Wed, 04 Sep 2019 10:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617790; cv=none;
        d=google.com; s=arc-20160816;
        b=umCCCsXnM2+tx1Jfd/NU2PRs7lAazQX8Tc8KGN6EJA1RwzWsNngp4pDxtahi8SSCSf
         C8tvJFBPa+M3YBSkIeeKcxiljx+aq0IybXAvGPG/kW17UDl1KihgfwgkAVniHm7tegt+
         3rl3PMIzmpP2fwVr0qqDcHU7O1mIXtjMGjxGmvws/xiQXU2NQQGT9Ehs8OkoWKn6f9tP
         4kY1a+yHb++0j2sWfYkFV/o8Yp6gLPDCJwzClV7rVlA5Or21nFQxwZJ4yo8FXWVtRwZJ
         sUvuXMDWl+DWS2S8FCHPO4dCOM80WN+sD9HiI3z2E+3W0tO5/T1fBSrJ96R3J5ziXLtV
         maug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=rnPX/CkCbP5cUR+Jpf6ypoo9OA8ST+okjOPSeePlPKk=;
        b=oIR6UflCvMMzwWdQHTyQC5oBPXqCUYuJdlFhLDB1jm9YGFYd8cAzcbNnCKU5idK06b
         jnBdZ7nZ4dgluQDLUSYitpllF8xhqukOohFHj+r69UQK1Vg1m70aIYOd+TZcXQsUkSl6
         Q7yOhshQq2kKkYtzZ9LOGeLXiDOI6RD1LTVYSFDxIb1uzRd5VhnNkkwrL9Qg7s+IgIFu
         igZdTS4K6nYmKrTdR3K0YWW43cMAe7BR7a6qcKehIC5hz8HDj4GD2ecqDTjJd65Es3hL
         fP/YUv1Z0secBxtwR9J0Plwn4zvZ9AZw4fF7GsBI49B8vYGGRprvCr8LCYRg1g4jF3j4
         tbTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nXyUKui9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si8119906ejr.299.2019.09.04.10.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nXyUKui9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Yzs-0001Ht-NQ
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 13:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yqk-0001j1-QQ
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 13:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yqi-00079a-Av
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 13:13:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5Yqe-000771-8P; Wed, 04 Sep 2019 13:13:36 -0400
Received: by mail-wr1-x444.google.com with SMTP id z11so22107793wrt.4;
 Wed, 04 Sep 2019 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnPX/CkCbP5cUR+Jpf6ypoo9OA8ST+okjOPSeePlPKk=;
 b=nXyUKui9x9H0GwOqTGL8jqK3/3LURKyF4b8QwEoQ3mLJlf8zfaY6DrGlj8LXlCuRNH
 4WYb1TX1NdW8pmcdvovw0iqDM7rwYcBQ+GlF3FDmpp/6WtzlINcIeozhrwL12QoeHnPn
 +Oxc+UubrO3NCVe8Q+lW1XMBwExJQUs5mpb+2i/PK4sibcQdzR6mUfb4HicRFhIA4QJY
 CQoVU1Jf4CwdZqiV8bi6hjCYGmhhrfopLkVK1mQSYIqoMIQqgNn1pGCbEC1dhHEJtuEP
 cEUVkwj7UwWUWozKCQo9Hr8r/hsRRwG9cuppjladKzq4upUaio3bzLRbki2ffwTxEg0Q
 RGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rnPX/CkCbP5cUR+Jpf6ypoo9OA8ST+okjOPSeePlPKk=;
 b=E57i7jaExaQ7BuB3/XXCUHft8IO5kGRK0Ahw++v5wRdu3B3nj2y1p6arH7snemgzNE
 YkV6GGqT7OpADo4v+8gpO0wfcaxaiMJGub/xTJcIuyZIPdDGZL5INYHwEB5LDJynUSq1
 8DOgjnDyb3YKHmLlT/SO/bUPzgeIvGNfrRtgdswXrrtEH0XdKarsy63l+VOelg17IAxx
 m1sAKgnAsJ+I1hkLXHXuu/yxUBVKjF2uJhsJG5eev15cwEp0tqyIEuK+UHtnVrv3053I
 HZx6NAvQVcJavv3FcEPH8dmcSY+wSD/cUFP5vYhiq7q2mGmPbVVDcmASh2rhQvYZXyzL
 pbIA==
X-Gm-Message-State: APjAAAWvbZxV2X8wApOIpMU+fItwUTNN94vdMKOfk6RsyIdXUe6W1III
 Q25dE2YbYPqMNe12VSpCaoA=
X-Received: by 2002:a5d:460e:: with SMTP id t14mr51954710wrq.171.1567617215265; 
 Wed, 04 Sep 2019 10:13:35 -0700 (PDT)
Received: from x1w.redhat.com ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id p19sm2339512wmg.31.2019.09.04.10.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:13:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>
Date: Wed,  4 Sep 2019 19:13:11 +0200
Message-Id: <20190904171315.8354-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 10/14] hw/arm/raspi: Define various blocks base
 addresses
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2792ihylb3tY

The Raspberry firmware is closed-source. While running it, it
accesses various I/O registers. Logging these accesses as UNIMP
(unimplemented) help to understand what the firmware is doing
(ideally we want it able to boot a Linux kernel).

Document various blocks we might use later.

Adresses and names based on:
https://github.com/hermanhermitage/videocoreiv/wiki/MMIO-Register-map

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/raspi_platform.h | 49 +++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 069edab526..c6f4985522 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -25,42 +25,73 @@
 #ifndef HW_ARM_RASPI_PLATFORM_H
 #define HW_ARM_RASPI_PLATFORM_H
 
-#define MCORE_OFFSET            0x0000   /* Fake frame buffer device
-                                          * (the multicore sync block) */
-#define IC0_OFFSET              0x2000
+#define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
+#define CCPT_OFFSET             0x1000   /* Compact Camera Port 2 TX */
+#define INTE_OFFSET             0x2000   /* VC Interrupt controller */
 #define ST_OFFSET               0x3000   /* System Timer */
+#define TXP_OFFSET              0x4000
+#define JPEG_OFFSET             0x5000
 #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
-#define ARM_OFFSET              0xB000   /* BCM2708 ARM control block */
+#define ARBA_OFFSET             0x9000
+#define BRDG_OFFSET             0xa000
+#define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
+#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 (SP804) */
 #define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Semaphores
                                                       * Doorbells & Mailboxes */
 #define PM_OFFSET               0x100000 /* Power Management, Reset controller
                                           * and Watchdog registers */
 #define CPRMAN_OFFSET           0x101000 /* Clock Management */
+#define A2W_OFFSET              0x102000
 #define AVS_OFFSET              0x103000 /* Audio Video Standard */
 #define RNG_OFFSET              0x104000
 #define GPIO_OFFSET             0x200000
-#define UART0_OFFSET            0x201000
-#define MMCI0_OFFSET            0x202000
-#define I2S_OFFSET              0x203000
-#define SPI0_OFFSET             0x204000
+#define UART0_OFFSET            0x201000 /* PL011 */
+#define MMCI0_OFFSET            0x202000 /* Legacy MMC */
+#define I2S_OFFSET              0x203000 /* PCM */
+#define SPI0_OFFSET             0x204000 /* SPI master */
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define PIXV0_OFFSET            0x206000
+#define PIXV1_OFFSET            0x207000
+#define DPI_OFFSET              0x208000
+#define DSI0_OFFSET             0x209000 /* Display Serial Interface */
+#define PWM_OFFSET              0x20c000
+#define PERM_OFFSET             0x20d000
+#define TEC_OFFSET              0x20e000
 #define OTP_OFFSET              0x20f000
+#define SLIM_OFFSET             0x100000 /* SLIMbus */
+#define CPG_OFFSET              0x110000
 #define AVSP_OFFSET             0x130000
 #define BSC_SL_OFFSET           0x214000 /* SPI slave */
+#define THERMAL_OFFSET          0x212000
 #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
 #define EMMC1_OFFSET            0x300000
+#define EMMC2_OFFSET            0x340000
+#define HVS_OFFSET              0x400000
 #define SMI_OFFSET              0x600000
+#define DSI1_OFFSET             0x700000
+#define UCAM_OFFSET             0x800000
+#define CMI_OFFSET              0x802000
 #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
 #define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
+#define VECA_OFFSET             0x806000
+#define PIXV2_OFFSET            0x807000
+#define HDMI_OFFSET             0x808000
+#define HDCP_OFFSET             0x809000
+#define ARBR0_OFFSET            0x80a000
 #define DBUS_OFFSET             0x900000
 #define AVE0_OFFSET             0x910000
 #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
+#define V3D_OFFSET              0xc00000
 #define SDRAMC_OFFSET           0xe00000
+#define L2CC_OFFSET             0xe01000 /* Level 2 Cache controller */
+#define L1CC_OFFSET             0xe02000 /* Level 1 Cache controller */
+#define ARBR1_OFFSET            0xe04000
 #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
+#define DCRC_OFFSET             0xe07000
+#define AXIP_OFFSET             0xe08000
 
 /* GPU interrupts */
 #define INTERRUPT_TIMER0               0
-- 
2.20.1

