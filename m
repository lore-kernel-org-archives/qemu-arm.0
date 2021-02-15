Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5558765lfc;
        Mon, 15 Feb 2021 04:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDu+ZxN+ekMogF8HqBTXv3tICyFkGC4txRkaEnH+M5BwzTmTZ2dJ2ImOx69Y3xgSteLz9y
X-Received: by 2002:a25:f805:: with SMTP id u5mr10183652ybd.2.1613390572285;
        Mon, 15 Feb 2021 04:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390572; cv=none;
        d=google.com; s=arc-20160816;
        b=ontqyyhbIxQNKEWWBYlZHsssUkaAzadXkcp66dxj0yF0HzFt2yhOovoZoJ4L6WsGBG
         StS78AICAQk7mVhhYKMC9tK+6wD1qiLnhGO5DfTVd7NfCz+mHhV7bor3hhhcTwMQZE0x
         wM0HzQB8TgdmDlM9bdTixe0+q1Q3W+WPhGi0xiACXCRFOLnCp7JFXPvvsvU60jAnVC+B
         tbh53skl0++61TunLUHUjWsM/L8YiiNZa0jhZVbjikyu/3qymF6OiZZ2VSI3IWszQziN
         shjL4noOu9f+uI0RhgvRlzAJX8D5rVzuASGbiy3Tryln65layi2xlGfQEjAw0fuaHArd
         jFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=myzWPQ7aahYwu4rcii5/SdEFuQpyy/NesVoypbH4mDU=;
        b=RZ7v35h5hKwxlkqXtHegtnPBcxrlYpNiHW+7hJjWuny8/8NCxhwBB6lmXHmh+UcjJ2
         OISc9N1JC0fL8U+kCaiLsfmoljpmmUjmoEnOUMpOjCW/vV4gZuKF1ZJydQSvHHaGMZX6
         6bfl/7asCbC0IvmGKIwgVCM4GIDnX2mDbhhyE8gHUtBCeNkRhdrt6G1xaaAq93rPQlJm
         eyueoiIx1OYGNkxBzVP+H6bk2TdztBj/Uwf4/H5tcZliuhJy1Pcx9FpdJ+GyjAGYJOWM
         sax2D+5TdnV+xmZUT2HaatCSTeM4Qykjr+W7/Szpyd/E8RtLaAhjhKk8Y0Fnan3gc+gh
         PSKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsmzH6uG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si17989906ybm.455.2021.02.15.04.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nsmzH6uG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcaZ-00058l-Kj
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRH-0000OU-Pa
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:53:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcR6-0004Iy-Et
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:53:14 -0500
Received: by mail-wr1-x435.google.com with SMTP id b3so8511273wrj.5
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myzWPQ7aahYwu4rcii5/SdEFuQpyy/NesVoypbH4mDU=;
 b=nsmzH6uGWoA95x3lefjHwaVmPI+8jgU8QWsTKUNUwlz1AiopPaw47WlXfN7/eO9J1o
 iraAOhpiHTGWHxP98tvXklA6HW/d+6gwaIHKo/DqV+ZNXTIN0QpixAv5h4m8VHUwlonS
 1LM92WFbQgmwqJls+6GvEpXbND475c46uOi+94nNLg9hcSR5PXI1bBkKaP/wa2ahgaB1
 Nj3AQvUrWRr9a6BTiRBZ14TE7LGY/LL5b+qFRV5z7xFeFjQesC7KrhlTjs7kMPcv39LL
 qnBcQr2UxPx4ZzJL6893vKBchb6oP2a3GKJMIqSQKkk8srj1kGALCZtvW8z20rY/7xHI
 r6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myzWPQ7aahYwu4rcii5/SdEFuQpyy/NesVoypbH4mDU=;
 b=ow5zzdcb13eIyHhOAxrajv0slbiyy11uG5REDA9mguKqpUnqqhGWc3qurRcD+IbRyY
 UT8liEJ5tphNbaBHgzM6ASLLUvL60/SMYveA/uyrXk61TmxpUWeBpOKY9eqjGmEalfZK
 Bj3dRZGO8TI04T+KppTErMnqJg0/FJxsSwERHdYoCGzuxUgUPz92Gnu4Szy6XYmta4k2
 /u6YXyHT4Ku4c75pHqjj6zHXDcX3mVTltgvRi+N/MBo3oXhPqrcM+E4TeuHD/4uBom3z
 fRmUHaDSiq4m6RIVI0BOV4niCiG2eC/puKroLvwEuC/TlnLjqR0NoMD41Urb0Siyq6yN
 v6jA==
X-Gm-Message-State: AOAM532qTIAKONk9X9jappywPdGQN/duSlnBWRpikNZWHsVrLlIvWlYQ
 sW6U2exOB2DIWv4+FQ/wbPbfOD3ko19wyQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr13632529wrm.152.1613389982587; 
 Mon, 15 Feb 2021 03:53:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:53:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] hw/arm/mps2-tz: Stub out USB controller for
 mps3-an524
Date: Mon, 15 Feb 2021 11:51:35 +0000
Message-Id: <20210215115138.20465-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XsgwqC9Qz2NM

The AN524 has a USB controller (an ISP1763); we don't have a model of
it but we should provide a stub "unimplemented-device" for it.  This
is slightly complicated because the USB controller shares a PPC port
with the ethernet controller.

Implement a make_* function which provides creates a container
MemoryRegion with both the ethernet controller and an
unimplemented-device stub for the USB controller.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5e12ee2c3d3..183c3920903 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -120,6 +120,8 @@ struct MPS2TZMachineState {
 
     ARMSSE iotkit;
     MemoryRegion ram[MPS2TZ_RAM_MAX];
+    MemoryRegion eth_usb_container;
+
     MPS2SCC scc;
     MPS2FPGAIO fpgaio;
     TZPPC ppc[5];
@@ -131,6 +133,7 @@ struct MPS2TZMachineState {
     UnimplementedDeviceState gfx;
     UnimplementedDeviceState cldc;
     UnimplementedDeviceState rtc;
+    UnimplementedDeviceState usb;
     PL080State dma[4];
     TZMSC msc[4];
     CMSDKAPBUART uart[6];
@@ -432,6 +435,49 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static MemoryRegion *make_eth_usb(MPS2TZMachineState *mms, void *opaque,
+                                  const char *name, hwaddr size,
+                                  const int *irqs)
+{
+    /*
+     * The AN524 makes the ethernet and USB share a PPC port.
+     * irqs[] is the ethernet IRQ.
+     */
+    SysBusDevice *s;
+    NICInfo *nd = &nd_table[0];
+
+    memory_region_init(&mms->eth_usb_container, OBJECT(mms),
+                       "mps2-tz-eth-usb-container", 0x200000);
+
+    /*
+     * In hardware this is a LAN9220; the LAN9118 is software compatible
+     * except that it doesn't support the checksum-offload feature.
+     */
+    qemu_check_nic_model(nd, "lan9118");
+    mms->lan9118 = qdev_new(TYPE_LAN9118);
+    qdev_set_nic_properties(mms->lan9118, nd);
+
+    s = SYS_BUS_DEVICE(mms->lan9118);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
+
+    memory_region_add_subregion(&mms->eth_usb_container,
+                                0, sysbus_mmio_get_region(s, 0));
+
+    /* The USB OTG controller is an ISP1763; we don't have a model of it. */
+    object_initialize_child(OBJECT(mms), "usb-otg",
+                            &mms->usb, TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(&mms->usb), "name", "usb-otg");
+    qdev_prop_set_uint64(DEVICE(&mms->usb), "size", 0x100000);
+    s = SYS_BUS_DEVICE(&mms->usb);
+    sysbus_realize(s, &error_fatal);
+
+    memory_region_add_subregion(&mms->eth_usb_container,
+                                0x100000, sysbus_mmio_get_region(s, 0));
+
+    return &mms->eth_usb_container;
+}
+
 static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
                               const int *irqs)
@@ -809,7 +855,7 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
-                { "eth", make_eth_dev, NULL, 0x41400000, 0x100000, { 48 } },
+                { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 48 } },
             },
         },
     };
-- 
2.20.1

