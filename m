Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp215640eje;
        Tue, 13 Feb 2024 07:53:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxkI01XwZHVGNY9FXJbZf6FAVakg/uV2SSaVDne3xsxB+Pfwq+zNpaekbnwm3B88IAnVHP
X-Received: by 2002:ac8:57d0:0:b0:42d:ae83:e319 with SMTP id w16-20020ac857d0000000b0042dae83e319mr2357758qta.18.1707839589510;
        Tue, 13 Feb 2024 07:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707839589; cv=none;
        d=google.com; s=arc-20160816;
        b=bRSV1MkMR7sPiiZkMh87Q9XjHARiTBgtnhD38LgcMSrTw+QzxsHOAbQeYGt1V3rJeM
         5FNzmCaicJ91lknTCyxfCGWkRVu9PsjcNqiw/vQ9ThpZY+jcHaMwesa6DwMn0mrm5TCv
         7NLN03m5rrxf7Nh937WG8f8Nt+9x44jaloxvbws8oG2HytSAIQxbXZLv+wRIvxlWa/nj
         ptWFIJVY/jaV5I3BDSW2SDXypJIoyfQeLECYrwP7gWHar4N/xvcY34a4lVB0EiBFGNYc
         Ww+Jsu/CMZa79XpybpYKXANKF3macPaW0I8kzdqYG0/4X1aAC1wAfcHr290is/5JPtIP
         NWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+WO+U/cdRoubxdgTYbsdCfwDQVIWpi3TD0ntR/eAxO0=;
        fh=JzdV5S9lgebcAT1R/+4dNU6Er8pFLoQ9wcZsd72WJ7o=;
        b=e8vSK2vI98oRx/gju8gCxn1wELlzN0wkhMpG/cHlVE1MbMyENfcBf/tlFzaMJYHO0v
         YihH4yFNfY54vuJM3KyX5VVWIavcgMEvkU1o/rx1Zy/fIDQG0xhucEodqVzCr5VF1OWG
         yecaqHOXzEdGhTfgSHRzV/TxfbCPISiZROp/DhJgZ9W6kjXuD6H8MFoZ+fZYIEnkKZ3L
         LOkBqb/W0NrEBBtRToDSXiTPPLkUVdmuDGpfaUnO5WakzyEJWjbpRk413CG6CXUqX/HZ
         Qj/1k6T+5FnUcnDEUaPabXRRoNzwlIDLoh1TqqLpvTS+0/9aYpVynPHXVSVnhlZM2fHq
         K2ww==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgQv+149;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWyiKZggvVKp5VWDleE1sBCcmjn6DmS4aT8QZqIkzS4K1pWj9PWXjO5xnlpvSeNPfdUIkCcjNmibla9cjvWtKh94GM9qMVX
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020ac85b81000000b0042db439fc96si547178qta.514.2024.02.13.07.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgQv+149;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rZv5S-0001mP-5U; Tue, 13 Feb 2024 10:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv5P-0001jS-Vu
 for qemu-devel@nongnu.org; Tue, 13 Feb 2024 10:52:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZv5O-0005qQ-Ee
 for qemu-devel@nongnu.org; Tue, 13 Feb 2024 10:52:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33b86bc4bbaso1017152f8f.0
 for <qemu-devel@nongnu.org>; Tue, 13 Feb 2024 07:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707839561; x=1708444361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WO+U/cdRoubxdgTYbsdCfwDQVIWpi3TD0ntR/eAxO0=;
 b=TgQv+149C3sg1m9l4Xc1SGrOORe/CLY65Wo+7bhPpBkjHZtlFgwRYAIwz8fP3E8DpG
 s3qfhNf7/ar1kOHaKguVFJtQhXb94oAXLJ5CNiBHZBv0t64uMvVctpmN5JSofOmg5jqW
 VDObuReY5v17W9Pnhg66JFNgUd33bWfGtyl1YtAVNZaARjcZc7eFYUWRH56fgkt9Pnr+
 VXpOVwAORwUf6iclBXzBQ4KYiHLCFud6KFkSO4ILAXbcvYEtnmjkqIuHn5RCbPZa1rOl
 a6Bm8srRKwEdUadEu8wFXbPnuqO2sq/OTZ/UoDYlBJN9qbgFMdKnulsFXsu1r14HCDmu
 YbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707839561; x=1708444361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+WO+U/cdRoubxdgTYbsdCfwDQVIWpi3TD0ntR/eAxO0=;
 b=SCclwq7NnL3BF9jTzUtN2AIrZrPHZRq9vO+XUOpqWBhi+tDCIc6ZtuHcC3N04L3vbB
 fT+l5oNvVi/LhHe7fwftZAMgWqfRDE5BEhCudChy40sWfYjplJ35OT0jagwghOda/64a
 90j89V7fnPobCVRoh7WzrpzeZYt6iwdPs496gz530R4gEPb/SchWtmxgsbktiyczZEjM
 fpDjP66bkoMr9040Xoa7wqyJ0dJWrjpVDZsk7hQFGIajXisRfykEGazA0HokQ7P+pG/L
 UHoOMIB1L78cf4qQu1stcJlz8kYfQKVg3+iMLdRBjOrb07eup7FmAIELEL5nJoMwcKkX
 JWxg==
X-Gm-Message-State: AOJu0Yx+yLk6XwJMiN6vz+JU+7vJ5yoH8xQI4DS9QN/twiLyEs7RDzL6
 58PQiykWT5CRWLydgCp00My0LuIZvxaLezqSgguxCgfyj1ZWdT5W6wwYPYMYr/PggSFGgNnXNB4
 Q
X-Received: by 2002:a5d:4041:0:b0:33c:e2ff:6c85 with SMTP id
 w1-20020a5d4041000000b0033ce2ff6c85mr404562wrp.49.1707839561003; 
 Tue, 13 Feb 2024 07:52:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWuhi63JoJf7Hfb60531BHbj9k6yJtyJsKRjX8qXWSp/rOSmT/+PHCgezmXIenmTz+Jt0OZIZ+GxKZOF0aPmt1AMrvdyebU1wKovZMHvuXlbIzuFTsZQXU1dDrtew3Yv6zN3c7oeVphpBR1Z8FP+BT3Rg==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a5d558e000000b0033929310ae4sm9873011wrv.73.2024.02.13.07.52.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 07:52:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/4] hw/arm/stellaris: Add missing QOM 'SoC' parent
Date: Tue, 13 Feb 2024 16:52:14 +0100
Message-ID: <20240213155214.13619-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213155214.13619-1-philmd@linaro.org>
References: <20240213155214.13619-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: eAhi7hRxgMJn

QDev objects created with qdev_new() need to manually add
their parent relationship with object_property_add_child().

Since we don't model the SoC, just use a QOM container.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index d9884286b3..a2f998bf9e 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1031,6 +1031,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
      * 400fe000 system control
      */
 
+    Object *soc_container;
     DeviceState *gpio_dev[7], *nvic;
     qemu_irq gpio_in[7][8];
     qemu_irq gpio_out[7][8];
@@ -1052,6 +1053,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     flash_size = (((board->dc0 & 0xffff) + 1) << 1) * 1024;
     sram_size = ((board->dc0 >> 18) + 1) * 1024;
 
+    soc_container = object_new("container");
+    object_property_add_child(OBJECT(ms), "soc", soc_container);
+
     /* Flash programming is done via the SCU, so pretend it is ROM.  */
     memory_region_init_rom(flash, NULL, "stellaris.flash", flash_size,
                            &error_fatal);
@@ -1066,6 +1070,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
      * need its sysclk output.
      */
     ssys_dev = qdev_new(TYPE_STELLARIS_SYS);
+    object_property_add_child(soc_container, "sys", OBJECT(ssys_dev));
 
     /*
      * Most devices come preprogrammed with a MAC address in the user data.
@@ -1092,6 +1097,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(ssys_dev), &error_fatal);
 
     nvic = qdev_new(TYPE_ARMV7M);
+    object_property_add_child(soc_container, "v7m", OBJECT(nvic));
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_uint8(nvic, "num-prio-bits", NUM_PRIO_BITS);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
@@ -1125,6 +1131,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
             dev = qdev_new(TYPE_STELLARIS_GPTM);
             sbd = SYS_BUS_DEVICE(dev);
+            object_property_add_child(soc_container, "gptm[*]", OBJECT(dev));
             qdev_connect_clock_in(dev, "clk",
                                   qdev_get_clock_out(ssys_dev, "SYSCLK"));
             sysbus_realize_and_unref(sbd, &error_fatal);
@@ -1138,7 +1145,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
     if (board->dc1 & (1 << 3)) { /* watchdog present */
         dev = qdev_new(TYPE_LUMINARY_WATCHDOG);
-
+        object_property_add_child(soc_container, "wdg", OBJECT(dev));
         qdev_connect_clock_in(dev, "WDOGCLK",
                               qdev_get_clock_out(ssys_dev, "SYSCLK"));
 
@@ -1178,6 +1185,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             SysBusDevice *sbd;
 
             dev = qdev_new("pl011_luminary");
+            object_property_add_child(soc_container, "uart[*]", OBJECT(dev));
             sbd = SYS_BUS_DEVICE(dev);
             qdev_prop_set_chr(dev, "chardev", serial_hd(i));
             sysbus_realize_and_unref(sbd, &error_fatal);
@@ -1298,6 +1306,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         DeviceState *enet;
 
         enet = qdev_new("stellaris_enet");
+        object_property_add_child(soc_container, "enet", OBJECT(enet));
         if (nd) {
             qdev_set_nic_properties(enet, nd);
         } else {
-- 
2.41.0

