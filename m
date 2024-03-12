Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674320ejc;
        Tue, 12 Mar 2024 01:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHuY0Qcjlpqc+g+Tvs7TgyPRRZnAjuW8ZmyTyxoh+wN7BPWMHIeTDu+6Jkag8UdXRnsXBma6de530LOP4iIJRnAFRE9XS1
X-Google-Smtp-Source: AGHT+IELHCoWh0VZVOP0zwwJTGTdCdoD2OxZ4AXgHvTZVOhoCGspGPX7VO6W1zM2TBfIa89jYVeg
X-Received: by 2002:a0c:cd88:0:b0:690:f804:e915 with SMTP id v8-20020a0ccd88000000b00690f804e915mr393931qvm.26.1710231806390;
        Tue, 12 Mar 2024 01:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231806; cv=none;
        d=google.com; s=arc-20160816;
        b=08KB+gUR2s0WMM5E56LdCPaYZ/tNe6V4sSeDaH6xD8oOojdP3mBXPnuaUwmFMQbEzI
         704ovpiyjR/tJB9n8uXdcDMIvMKIxfya25WUb7U3lhwRTW4uxD8wfs+F9Tnv/mJA8N8d
         xL4cYhkDsYCg7QqFLTeft9APn/+zjQPuN2H7NWEmD7jUHfzSnPt1vgNaITOspFVXAIxW
         pvZC6yOliz3szUgEDAuYy+xTAHJQx1utwAZUx87j3MGvKQNNkQGz8j1TeEF5rC0PjArp
         i4asz6hWMQVoqMjIyt+ZcO7Tnrc1Xukr7n9VQtssPpcKl0BU4ywcX1VhSOnieWkcMb5Z
         RcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eC/1sv6Wv+c7ut+0cdVRZlJFS7IBk+vo2wQm3zp+8ts=;
        fh=+qpzb3SYbhq67lhRB0qgJZVW/O3RhcqEk2U7nqc1BKg=;
        b=SKiuswgPZU9WfghpKV0cOHcbYBjJfbxav5LhdzlrcwZ/8SeNa934XktcqVUEkBT0c8
         flnhgwKzp8v0Wwm8n7ANhx26jl6LR+P/t/P0UrNmzoRIBG6EcoRNzPLSE225VT+FbY4u
         MlPVw1a2rLSXdQ/sCoHDqOddt4BVGq4im/qbDDktK9bGE170s1WroF9h64BlX394Kbi0
         X8tHwC5TmXG7xdneJlnlced0VArk6R1c7P2koZmRcIGvJNyV7oDgUXivGUgs3zyh6Lk7
         e/AipeeEdbYHYYhM2Mr7fg3bQ3gHmlBa697y2ZTElaQiMM0gL613GG276aURTebWLpil
         YGBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fd1fc1iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl13-20020ad45e8d000000b00690796914e5si7451774qvb.181.2024.03.12.01.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fd1fc1iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxPf-0005bV-A4; Tue, 12 Mar 2024 04:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPd-0005YM-1E
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:05 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPb-00018X-DQ
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:04 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-513a81b717cso2246156e87.0
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231782; x=1710836582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eC/1sv6Wv+c7ut+0cdVRZlJFS7IBk+vo2wQm3zp+8ts=;
 b=Fd1fc1iq/M+GU7EAm8sZ0C+YlMZ4hfOLoC+TBCHc0XXVliSk2MMvXiGhrvkIr7jWeJ
 U3hTRGc3aNZasSo+eWZXHL0AjxCxegy959CbkM/XeZn7RZyEvhrhffLQnSXQjNX0wQ3r
 GbAMJQa4HWQhGu+PinoRzPWtEa2RRGNHMKkk+aDDuWb+2pgHB/6ccbUQzVbkIA15Q422
 XrZpMt/MZyUrOKqTXwtT6TqHaWTpSK/0JhZrloTus8M5DU+mYAXowU7J5+m6kACLZ5M7
 9HiQGNM4CTBv50mGBm0mFaqR2NCPIkQO+rd8T8xW+BxQOE+XkCmYDMXp2FFXIRe2uqiz
 ApFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231782; x=1710836582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eC/1sv6Wv+c7ut+0cdVRZlJFS7IBk+vo2wQm3zp+8ts=;
 b=tXfsjcbjrk6RGJJK8FRVlZWNJuFBEuqLKxpBM+0vJARsdvhqUp+2yquFmz7mXy7KbK
 N0E8KqScU054NIG9nDUVZWNvCRfNDQvOU15OwNp8WVqDPHZp887YqkfyB4sRRsK8IQfW
 tA1NOIfJEpTB9C6CsmWkFPe/eBx1n27cNFRC1gBMGWm5DzXVOjXPAtkF3T9WQjfSASS+
 xw91XD0EiFlgTJUTkBnT3xKHuEUs6i8Is5R8rlSzFR3+ZR6LtxkRb9EHHEoUKb1HeXqX
 TLAq8GIB4XY9JiQRVv/xifqgCl1DtrQxYf7xW5I+1nxGOi3ZWMkKHJlbwGCdHq9mhn4F
 88vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnERek2sBdp8o4fgMR760SlH4zswEU6U4gKl0BVQ/aafHu733HlmTZxPtxnKoFcwWN8AM8tqsVNLNmMCVKXdT7f44x
X-Gm-Message-State: AOJu0YxICLGT9M0FEe/fuFoC4HPt3VvR1iN1FbW26TZQ85A8W5TL51Ao
 OzAaMlla8KGTmbWKQneiK+bukDlLb4AbxOjzeabe5dz5t1eSkYehuNWRLPz3Ql6eNYUZLyiheLQ
 S
X-Received: by 2002:a19:5f5a:0:b0:513:ee3:65bd with SMTP id
 a26-20020a195f5a000000b005130ee365bdmr4962829lfj.35.1710231781536; 
 Tue, 12 Mar 2024 01:23:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b004130c1dc29csm11664395wmq.22.2024.03.12.01.23.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/13] hw/ppc/sam460ex: Support short options for adding drives
Date: Tue, 12 Mar 2024 09:22:28 +0100
Message-ID: <20240312082239.69696-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8VsZrI5IkP06

From: BALATON Zoltan <balaton@eik.bme.hu>

Having to use -drive if=none,... and -device ide-[cd,hd] is
inconvenient. Add support for shorter convenience options such as
-cdrom and -drive media=disk. Also adjust two nearby comments for code
style.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20240305225721.E9A404E6005@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 7e34b6c5e0..d42b677898 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -33,6 +33,7 @@
 #include "hw/char/serial.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
+#include "hw/ide/pci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/ppc/fdt.h"
 #include "hw/qdev-properties.h"
@@ -449,15 +450,27 @@ static void sam460ex_init(MachineState *machine)
 
     /* PCI devices */
     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
-    /* SoC has a single SATA port but we don't emulate that yet
+    /*
+     * SoC has a single SATA port but we don't emulate that
      * However, firmware and usual clients have driver for SiI311x
-     * so add one for convenience by default */
+     * PCI SATA card so add one for convenience by default
+     */
     if (defaults_enabled()) {
-        pci_create_simple(pci_bus, -1, "sii3112");
+        PCIIDEState *s = PCI_IDE(pci_create_simple(pci_bus, -1, "sii3112"));
+        DriveInfo *di;
+
+        di = drive_get_by_index(IF_IDE, 0);
+        if (di) {
+            ide_bus_create_drive(&s->bus[0], 0, di);
+        }
+        /* Use index 2 only if 1 does not exist, this allows -cdrom */
+        di = drive_get_by_index(IF_IDE, 1) ?: drive_get_by_index(IF_IDE, 2);
+        if (di) {
+            ide_bus_create_drive(&s->bus[1], 0, di);
+        }
     }
 
-    /* SoC has 4 UARTs
-     * but board has only one wired and two are present in fdt */
+    /* SoC has 4 UARTs but board has only one wired and two described in fdt */
     if (serial_hd(0) != NULL) {
         serial_mm_init(get_system_memory(), 0x4ef600300, 0,
                        qdev_get_gpio_in(uic[1], 1),
@@ -531,6 +544,7 @@ static void sam460ex_machine_init(MachineClass *mc)
 {
     mc->desc = "aCube Sam460ex";
     mc->init = sam460ex_init;
+    mc->block_default_type = IF_IDE;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("460exb");
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc4xx.sdram";
-- 
2.41.0

