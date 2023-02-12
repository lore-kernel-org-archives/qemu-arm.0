Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3597289ejb;
        Sun, 12 Feb 2023 04:46:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/x/lSeny2/wjwtCC+y6uLJvkzcbOdCiLOSduqX6UW/woHAWFLRZHn5rtqKFV1xKtz5g6KM
X-Received: by 2002:a05:6214:20a8:b0:53c:97fb:3595 with SMTP id 8-20020a05621420a800b0053c97fb3595mr39659189qvd.32.1676205982984;
        Sun, 12 Feb 2023 04:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676205982; cv=none;
        d=google.com; s=arc-20160816;
        b=Kh8p2g7H8DaR6SdM0iExZPdbefeObER+ujIEzWk1sGEMgjY1o5fO3iF7xsZuuXHYD4
         Pu29mLP1rTRKMm38PNRVfj1R/ORxXEx4w4+jVfw9z7ndQ/YkLO7p+dctAZ/Q0jBwLW/2
         jy897SuXq+ukD8diQL5dcQ8hnFUQbIBPV6CkR2/FLH7rpskihnDUyDAQBeTclCHQkzR9
         v2yhf8Ea2FovnfPyYL/lec5pRc3JTSAQ46ekUEklg/XFqS13y3mtN1P21BIHl45czcOO
         U6rMYg+DrCkB1MrIqBIR82PU2xczTvWd26RF2uWqcpuJkH4nfbU0aDRKjzEC8Sx4bcRl
         h7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fi++imiPLh2c7/ZXjqu1mp5iLpVSOS8PCd7++CxcYu0=;
        b=Ny2T18SszIOrsYLv9QbtEl6b5y9tnXNSwL8vT1Ba2roARK5mCRxDwcN28/wvfG496f
         5nvWKJF1ONDLxZoN7TGJo/L41c7Pxm2/kznObU9rOfUj2+f3pqfsKqwq9hT8KPgedZXw
         dxc5rRSLfGdDtG0aaRpX0rw7IOBCGHFH7QRsDpGjqEZRtQZmM7Z/kCmgrAa8p3TsyCLt
         1z0CHdgGKwrGIK7sbYqQ8W1KNvDF9ddQ8hxQWVNvpJStjy2wplSDw4NyK/OlP/CicGoR
         2Goz1V6Rb+F8MMt69G7hMGEK/kt6kOHKFsT/ynBJUMKdZ85Vskh0IWpNX45W54KTX55M
         mcjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ESMOUhpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m66-20020a378a45000000b006faa9dcae3bsi6783644qkd.11.2023.02.12.04.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 04:46:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ESMOUhpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRBiI-0004zA-Kz; Sun, 12 Feb 2023 07:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdF-0007d6-Do; Sun, 12 Feb 2023 07:39:04 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdC-0001NQ-Uf; Sun, 12 Feb 2023 07:39:00 -0500
Received: by mail-ej1-x62f.google.com with SMTP id sa10so25823770ejc.9;
 Sun, 12 Feb 2023 04:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fi++imiPLh2c7/ZXjqu1mp5iLpVSOS8PCd7++CxcYu0=;
 b=ESMOUhpQiADPFH1M/yEE7gyP/EbG2el8NodjgnFuLRjZlaRWFggf3kY83mKgyqdVRw
 HuxoU6wzSEWyZx9vjdPUCbt+YiP0OJwYmVuc05C9O0p5cMXj1UsfxqR0hOoBcSwpvk4H
 UEsb3rRJJ1/aFG+RJOwSPMI3z45LU6QX/Ya5IaAyJ2+T0wilNNfXrikP/SeDa5gB1QtK
 trLKjbGT8rQ6RNgKlXspQqCa26teJEZKs7jAMe0XZNBys/QZv93tP3Jov1hm8x/sd4B1
 vNS0tDJRvgwN8enkSjB2IrCBoKATQRYDNp6LRXHTZsopDST9EtWoh7pni0BlMZXBDchG
 m+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fi++imiPLh2c7/ZXjqu1mp5iLpVSOS8PCd7++CxcYu0=;
 b=WyqEJbLejeLVBrEdrPQH85E46DGJ+xqE3H9HLAU8rbLyF2KJndwDizGfITIF3X04co
 h3oy0TIOh3vmbcyRAScvNsBJDJSQ//BkQJKXP3lz4DwxHBpf9Op6+6X/trwFRNOfRpER
 xEQrchGLolM8eNDi4TvjK7F/JlZTShIevjyfylHg6fEssNQC4BSFRyyzHzPZt1dJoiif
 0uTcjBMqrJXG6FDSsDpFmNUi749TdKwP4KcllFRTWhlQKi0uJNiFO0hw/rpvww1QtQFe
 xu1QK34WCtfK8YT7RFYP9Y9VBGsFQThWz3wJSVSgYdzKNxJLJuoi8hkBBLM8bsXpSO3G
 rpZw==
X-Gm-Message-State: AO0yUKU2oR9ryCJP4g7Z3Qbv0oFS7WyWrR9ZdwFqviMYfIXPEuAVEkB6
 M3SPH8tE5u4N4QccYj55s148w+Fw36k=
X-Received: by 2002:a17:906:5202:b0:878:7530:5303 with SMTP id
 g2-20020a170906520200b0087875305303mr24982312ejm.5.1676205536276; 
 Sun, 12 Feb 2023 04:38:56 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 13/23] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
Date: Sun, 12 Feb 2023 13:37:55 +0100
Message-Id: <20230212123805.30799-14-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
X-TUID: eMSbu0i6krUq

This aligns PIIX4 with PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-30-shentey@gmail.com>
---
 hw/isa/piix4.c  | 44 ++++++++++++++++++++++++++++++++------------
 hw/mips/malta.c |  6 ++++--
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de60ceef73..de4133f573 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -51,9 +51,16 @@ struct PIIX4State {
     PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
+
+    uint32_t smb_io_base;
+
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
+
+    bool has_acpi;
+    bool has_usb;
+    bool smm_enabled;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
@@ -234,17 +241,26 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     /* USB */
-    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
+                                TYPE_PIIX4_USB_UHCI);
+        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
     }
 
     /* ACPI controller */
-    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
-    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_acpi) {
+        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
+        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
+        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
+        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
+        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
     }
-    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
 
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
 }
@@ -255,13 +271,16 @@ static void piix4_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
-    object_initialize_child(obj, "uhci", &s->uhci, TYPE_PIIX4_USB_UHCI);
-
-    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
-    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
-    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
 }
 
+static Property piix4_props[] = {
+    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void piix4_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -280,6 +299,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
      */
     dc->user_creatable = false;
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix4_props);
 }
 
 static const TypeInfo piix4_info = {
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ec172b111a..db5e5fd85c 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1254,8 +1254,10 @@ void mips_malta_init(MachineState *machine)
     pci_bus_map_irqs(pci_bus, malta_pci_slot_get_pirq);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
-                                            TYPE_PIIX4_PCI_DEVICE);
+    piix4 = pci_new_multifunction(PIIX4_PCI_DEVFN, true,
+                                  TYPE_PIIX4_PCI_DEVICE);
+    qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
+    pci_realize_and_unref(piix4, pci_bus, &error_fatal);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
-- 
2.39.1

