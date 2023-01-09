Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2448072ejc;
        Mon, 9 Jan 2023 09:26:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv9ypm38muABq+P8ba2Vf8wYM5WjbD0Uh4cQz73odI0D8Xy7mYTRAfax02Iy/vTcfsX4kVy
X-Received: by 2002:ac8:60cd:0:b0:3ab:76f0:bd93 with SMTP id i13-20020ac860cd000000b003ab76f0bd93mr75461424qtm.15.1673285210172;
        Mon, 09 Jan 2023 09:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285210; cv=none;
        d=google.com; s=arc-20160816;
        b=ZskyOt2nMRDoVC5v2vBw0Yal8c5NIWdbGtLTdMUMLB3PTK+7cDBqnncs3nwkIZvVuA
         CJ5FazvVZiO/JIkgbweaznzLVicGkBIblsQaRhNh1Og5CgsJBQeWa9fHTVkXGboWCAIJ
         fTXf9d2EEYN99RikfY+unoX5tAhRps5UKXHf9oCRP9XH7jKw15NydXHl1N1rnPNAdliH
         IyuSEwKA8TzS5vOksABsJldXrs0SRUTDdz4ryXwniLGyfNjXspsgipeWdDr9XNLeGJXz
         8tGSP6KwsPabycJuiUK1bZhzKQj9uL5LhmsYy35q3SKTajZKQ+zTyErNvoPPF61yKk9g
         VHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oa5H9FzkZTaJfskSj9tpthaLlUFLky9el6q7qY2XuAo=;
        b=0FnEPyqw/K7bE+8FCW38MatAzaJCJhtZMlfAcZLYHexdavoRgZO66FEXmM2O1a6w7p
         BJvJWbldRiRjC1DDSHDrKiteLOlVhiba9+a8sXnrK6pmqwAAPruLBgtswx7ffWo5tIgk
         iddbJIpbRIVTO33N8pR/LQNVcvsbVFyRbMAcL8lnf415QbFTkBwMV6rFEHSHjZ+jzF7G
         X6JCAhY6IJBHBYcr7S9CDBF/Qs9V2s8ZMBwzsLbhdYPsWZxCNt83lYl+I0fT7d5I8zRB
         oQxw8AALlZxDYidqhILsseDlK6ZIEg/KtxBnjKlCBNIXcW77gRvtFRxXazdkH9wo0VRm
         31EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bz6N2mTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020ac8548a000000b003ab63cf6ec4si4784965qtq.682.2023.01.09.09.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bz6N2mTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvtY-0002fZ-Jw; Mon, 09 Jan 2023 12:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtW-0002di-Ru; Mon, 09 Jan 2023 12:25:10 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtU-0001FZ-MQ; Mon, 09 Jan 2023 12:25:10 -0500
Received: by mail-ej1-x633.google.com with SMTP id qk9so21945896ejc.3;
 Mon, 09 Jan 2023 09:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oa5H9FzkZTaJfskSj9tpthaLlUFLky9el6q7qY2XuAo=;
 b=bz6N2mTIYJuVBU/2WILAD8nxgwaiBVuINL2J1CSlde2qe5uLY7cwoSxBZqLSZMWL2A
 A8uhPtqFlpUwkDy6FXoiYp0HIfcEZfMXzxNpDIWf6nI+jY90F3F4eiBVqgYJULnHviP1
 4NzuhUn6ZwsQHASEdvYK0yvP83E4btRw/LHviiYXQ+zHMdqpKe9hr4nLCruWAMIekBnx
 uSHCk6X+dtZ07beDGcY+LcYCkYY2rNHyifWdzM9LII5/OZXyrnyDTa5sXOwig7oXF2H4
 cHpaD0RzUkAS53E3/gpc0hwd6K4K50gd95BYPw50VqlGyPUq5IIXKE1iboZm7zizmthT
 cebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oa5H9FzkZTaJfskSj9tpthaLlUFLky9el6q7qY2XuAo=;
 b=sIWAa0Ba1R385ZiZtAYpn4V/xjPzRAMTzq3NwZRNh5alDSeQZs6avE9SxsYyhvyjW8
 Pow3akSO8Zf16J1MTZP385+6avnry/QiaB1NRWPWqWKLdRbjKWIWTDVxNEfd9c8S4LOz
 ahXdPCfxLT8+EsDSXP0nLqwCkg3nHso4wd2JW8HN+kGr+9n+OvjOue91+etHyVfTwScH
 MSAvJF2Sl0LEDpSikZJqdRwubUgqXDRvncPAyb4fDX212DECrKsrRdgNrnaTlL0GDNMo
 Kn8SqAs/fHFZAM1/tqGGADjucpmB4uJwiHQKjmnbAJhKc5Yx21riYwu4VKiMMHhLD6fG
 vjRA==
X-Gm-Message-State: AFqh2kqXbWJJVwhbFuaOJgAkb3XhlCOrV6Qv6ZbzzzK1YlBMvpEqW0qe
 B89bSGOcMt5iL/OSTC8P2dMwhNN0q8lqRA==
X-Received: by 2002:a17:906:35cb:b0:84d:1270:8fe with SMTP id
 p11-20020a17090635cb00b0084d127008femr12877361ejb.67.1673285105747; 
 Mon, 09 Jan 2023 09:25:05 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 12/33] hw/i386/pc: No need for rtc_state to be an
 out-parameter
Date: Mon,  9 Jan 2023 18:23:25 +0100
Message-Id: <20230109172347.1830-13-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 39qHx+OMXVsg

Now that the RTC is created as part of the southbridges it doesn't need
to be an out-parameter any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221022150508.26830-12-shentey@gmail.com>
---
 include/hw/i386/pc.h |  2 +-
 hw/i386/pc.c         | 12 ++++++------
 hw/i386/pc_piix.c    |  2 +-
 hw/i386/pc_q35.c     |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 991f905f5d..dd059e8667 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -169,7 +169,7 @@ uint64_t pc_pci_hole64_start(void);
 DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs);
 void pc_cmos_init(PCMachineState *pcms,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 448557333b..53a5443e09 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1251,7 +1251,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
 
 void pc_basic_device_init(struct PCMachineState *pcms,
                           ISABus *isa_bus, qemu_irq *gsi,
-                          ISADevice **rtc_state,
+                          ISADevice *rtc_state,
                           bool create_fdctrl,
                           uint32_t hpet_irqs)
 {
@@ -1306,17 +1306,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     }
 
     if (rtc_irq) {
-        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
+        qdev_connect_gpio_out(DEVICE(rtc_state), 0, rtc_irq);
     } else {
-        uint32_t irq = object_property_get_uint(OBJECT(*rtc_state),
+        uint32_t irq = object_property_get_uint(OBJECT(rtc_state),
                                                 "irq",
                                                 &error_fatal);
-        isa_connect_gpio_out(*rtc_state, 0, irq);
+        isa_connect_gpio_out(rtc_state, 0, irq);
     }
-    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(*rtc_state),
+    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(rtc_state),
                               "date");
 
-    qemu_register_boot_set(pc_boot_set, *rtc_state);
+    qemu_register_boot_set(pc_boot_set, rtc_state);
 
     if (!xen_enabled() &&
         (x86ms->pit == ON_OFF_AUTO_AUTO || x86ms->pit == ON_OFF_AUTO_ON)) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8f894714e5..a577ea2f4e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -276,7 +276,7 @@ static void pc_init1(MachineState *machine,
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, true,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, true,
                          0x4);
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index da97df69f7..58c51fbd9e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -293,7 +293,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* init basic PC hardware */
-    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state, !mc->no_floppy,
+    pc_basic_device_init(pcms, isa_bus, x86ms->gsi, rtc_state, !mc->no_floppy,
                          0xff0104);
 
     /* connect pm stuff to lpc */
-- 
2.39.0

