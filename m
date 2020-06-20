Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1877442lfm;
        Sat, 20 Jun 2020 16:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/xHblTMx9AYrfnrdmM4Q5v3jeLyH2CigwPgxteBMJyzXyIscZxoq9lRnXGCJTzPPSeB3u
X-Received: by 2002:a25:d40b:: with SMTP id m11mr16434956ybf.66.1592694575817;
        Sat, 20 Jun 2020 16:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592694575; cv=none;
        d=google.com; s=arc-20160816;
        b=LiXyeAVaKAKWPAOfdEJzBr7qY0wmIOc0DRaXPw3nVSpDtcH5W/jehKhRzYrGZ725uW
         6/uxejngUU8GJJUYcunrrmBq5zu7yrUuUvRSJj7zBPWu1F9eGfS+lkp4BN6sOIQ4sB71
         fl+hdEL7/GzAw/IVrfvwOGLY5nKUNsyZsLTOLJuiabHOnx7HxRbM+poVeKvGUoTiFZX4
         wGBZxDoW+Gmua22D2UXck8PFSEQXkcQ6M5lLeJkkN0AVB4jJzKNgGMH/0xeC3zElQOvQ
         DLXr/PnyyaILjIHb6lCjXWSUxUn++jLeFhhj1Pwz50v0y/XpS4zr6jjUbH5wgv2Z8SGl
         qPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zb02tNNP3k4Arx05DuNHXof+/AxtMqtoGOWXwVkHhHE=;
        b=YEvHhBkCz5ww5VcJ+ZXkcCVcjcXQkz9w1gag9F6Jj7HPLpDt6Cvdxlzux5wVWWmqmB
         2YXZwkEINdgBYEHY0o9z9H0xMzx9kR9tmMlgvFdwnYhUO2GggtyByOw0Dv6565GVBDEl
         TpTEYnpCa8Yt0A4MdLyw69LHGioP3oWfozB41gODjkrZ5fMwZnx8DPOabyOSxoZ89aOz
         cT2tt4YHlloVJbDoyZ9Crht6SKruHOMtolwdkdxFkjPBuQVm0dsIwXY+nQlsMiY6B2VX
         0ZBA02dzwGVi0FXR/U5pOC2hf5kZibTiaphKZHhcUbaXqZzGwd5NV1jzwHoDpadWNp/v
         Thdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ChozLKdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x68si9216541ybg.110.2020.06.20.16.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 16:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ChozLKdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmmcB-0001v3-7W
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 19:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmaC-0007B4-NB; Sat, 20 Jun 2020 19:07:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmaB-0002Mn-3y; Sat, 20 Jun 2020 19:07:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id r15so12422190wmh.5;
 Sat, 20 Jun 2020 16:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zb02tNNP3k4Arx05DuNHXof+/AxtMqtoGOWXwVkHhHE=;
 b=ChozLKdbQ6jvH8LOrBEmhTiTnB6CM+KaxSJdPJhNfUQdvp+Fbh+88XYQq+WPSKInD3
 Xkq9bOIrF+jqzR56B1axkXGlgG0EhSOqtU4HMbH939mn0vVwpKYdkJp7tdpV6HnPJoAJ
 D+zKWH3VtEgbC05QjDHppTqE8X/LqasuySfLvoxr1Va9Aba9GTFVI+GPbo8xUMBOwssF
 df2l1p36/tOI4KieRx4Zr0uTySdF3Qz1/kgW+mV7TCL3BPf7gdivfz14u0oAwgWKkbE9
 tAWOGoTXm4A8Jxjr0IK049PuAuro/O32n3h2krOyNuPBTjDus4txUa6f27mooZjyPQco
 r8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zb02tNNP3k4Arx05DuNHXof+/AxtMqtoGOWXwVkHhHE=;
 b=YNY5Bqw8jIQID3Q54r1ynJsTe+Ur7C09wXlUNQDRMWobP2GRYhFgqU6VyvWOmMGewB
 CGpkry6byiz+YbtTalGMriShiO162X6B28HDxwNPtXxLZtHib1sM3Xjs1kORkXIBvcSt
 z3Hd8wsp3X2p/SxgsqNu/P4tUR7gYq3OeSbhKksHqvKb+ddFoVElwUxEo6NgAgCTwiX9
 WLapnI19z7pDKDPmRM81Ds2wTAJF+Nk8goJMEVJPbdVJNRJLieS5cA2KXFkVyB+Goukc
 f+Z/rI4YvfsToYvSrLNlVXfVns1H/pxHWzTA9dzgAtR/EYsy2bmCpm5U5cmVM4LeAs9N
 20JQ==
X-Gm-Message-State: AOAM530R3kw1GjlotMjs4ThpjooND/NaXZBXrH4SlWaxKVLCs8iQOrZT
 p64lJHfNnbmeec/4vDuyEQv/589F
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr10382440wmm.131.1592694448968; 
 Sat, 20 Jun 2020 16:07:28 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id o82sm11455037wmo.40.2020.06.20.16.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 16:07:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] hw/misc/mps2-fpgaio: Use the LED device
Date: Sun, 21 Jun 2020 01:07:17 +0200
Message-Id: <20200620230719.32139-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620230719.32139-1-f4bug@amsat.org>
References: <20200620230719.32139-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c3joswtuWeB7

Per the 'ARM MPS2 and MPS2+ FPGA Prototyping Boards Technical
Reference Manual' (100112_0200_07_en):

  2.1  Overview of the MPS2 and MPS2+ hardware

       The MPS2 and MPS2+ FPGA Prototyping Boards contain the
       following components and interfaces:

       * User switches and user LEDs:

         - Two green LEDs and two push buttons that connect to
           the FPGA.
         - Eight green LEDs and one 8-way dip switch that connect
           to the MCC.

Add the 2 LEDs connected to the FPGA.

This remplaces the 'mps2_fpgaio_leds' trace events by the generic
'led_set_intensity' event.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/mps2-fpgaio.h |  1 +
 hw/misc/mps2-fpgaio.c         | 13 ++++++++-----
 hw/misc/Kconfig               |  1 +
 hw/misc/trace-events          |  1 -
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 69e265cd4b..228b813fd3 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -32,6 +32,7 @@ typedef struct {
 
     /*< public >*/
     MemoryRegion iomem;
+    DeviceState *led[2];
 
     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 2f3fbeef34..65488f8634 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -24,6 +24,7 @@
 #include "migration/vmstate.h"
 #include "hw/registerfields.h"
 #include "hw/misc/mps2-fpgaio.h"
+#include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "qemu/timer.h"
 
@@ -176,12 +177,9 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset) {
     case A_LED0:
-        /* LED bits [1:0] control board LEDs. We don't currently have
-         * a mechanism for displaying this graphically, so use a trace event.
-         */
-        trace_mps2_fpgaio_leds(value & 0x02 ? '*' : '.',
-                               value & 0x01 ? '*' : '.');
         s->led0 = value & 0x3;
+        led_set_state(LED(s->led[0]), value & 0x01);
+        led_set_state(LED(s->led[1]), value & 0x02);
         break;
     case A_PRESCALE:
         resync_counter(s);
@@ -249,6 +247,11 @@ static void mps2_fpgaio_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &mps2_fpgaio_ops, s,
                           "mps2-fpgaio", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
+
+    s->led[0] = create_led(obj, LED_COLOR_GREEN,
+                           "USERLED0", LED_RESET_INTENSITY_ACTIVE_HIGH);
+    s->led[1] = create_led(obj, LED_COLOR_GREEN,
+                           "USERLED1", LED_RESET_INTENSITY_ACTIVE_HIGH);
 }
 
 static bool mps2_fpgaio_counters_needed(void *opaque)
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index f60dce694d..889757731b 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -93,6 +93,7 @@ config MIPS_ITU
 
 config MPS2_FPGAIO
     bool
+    select LED
 
 config MPS2_SCC
     bool
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 57d39bf9b9..8bc7a675e8 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -89,7 +89,6 @@ mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC
 mps2_fpgaio_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 FPGAIO read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_fpgaio_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 FPGAIO write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_fpgaio_reset(void) "MPS2 FPGAIO: reset"
-mps2_fpgaio_leds(char led1, char led0) "MPS2 FPGAIO LEDs: %c%c"
 
 # msf2-sysreg.c
 msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" PRIx64 " data 0x%" PRIx32 " prev 0x%" PRIx32
-- 
2.21.3

