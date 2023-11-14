Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2083524ejc;
        Tue, 14 Nov 2023 06:40:15 -0800 (PST)
X-Received: by 2002:a17:906:d8ac:b0:9bf:5df1:38cc with SMTP id qc12-20020a170906d8ac00b009bf5df138ccmr6394908ejb.4.1699972815785;
        Tue, 14 Nov 2023 06:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972815; cv=none;
        d=google.com; s=arc-20160816;
        b=Wzk/90Q6/4jriDeNIjgsgI/gk4YYi5bhK3QWpc8aVl8OKqJ2rzxR6nDUEnR7IMFiPF
         DsGiWMj/VNAXox329D/asGRGzf8i13K3MpCVYAFP7pqt4EvLr3Gct1kPNBT7f9WluT/r
         P6nRf5jG1rM8OmEfFfwV1/dBIuTYelEKU7C9Rr0lJmsZUd0KOr0jm5DlrkbEX8C1OOpd
         SSMVYw3UPAPLTO/fDO7DEzGuCMWa62WqRDsxeF3m/cC+ppqlMqXkBYESxCueI54QvN+c
         97rnOl8jopkrhMFoYTDcfuvDbJZmLGgDcAKjtFW3yG19nOumqHm7MibVCTf8yG2E5B06
         eQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cJTBhe5AIq+piFF54yNuiwKWHopSqD7by2+9eio+MdU=;
        fh=U4UXaHkGm2YPi0Wz6Rjc6ORMc3fSxv41kMvJGLrj2Ss=;
        b=YTl8jexbLqMGL6e9PFVxtyvs3ILPazeaJxs1MLQbawcy6/Ylrt94Gg0a65dpu+7jC7
         JWWjoW4GBCU8ySya0oOk9NW9EU/VDKNjfjhmCOWHP0mKnWKnqkEYOcdbbn3smWQIYKqD
         ImivrmS847ed2Vl5v/QKifjpKvtyDzKDAdh7vct9LyRorGlVtvSyFvdZTZIine6JWbS/
         peSr7X1C66DBUYD5VoxdYC4Jd1TEBIsaIPdXIUZBkxy6Ygs7XWAhTr/uVa5r4L32MWaM
         0VTKbsB3SzoB7iY+tobMJJZxOcgKartj8ayor9XkEr37JBm2jVZgejsgB236Q6KAGTA4
         KWIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWMy6rqg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n27-20020a17090673db00b009be1961b0d2sor1970265ejl.7.2023.11.14.06.40.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWMy6rqg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972815; x=1700577615; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJTBhe5AIq+piFF54yNuiwKWHopSqD7by2+9eio+MdU=;
        b=WWMy6rqgyXRh21gmyQZ6FE3ljG/qNAnWLUg/dyq2NV4Eh28aiuT+hhXZt1wRoYcfpD
         nAPfGAiZ+7wz/7iCxfu4xixNLkqXW2tglVqgJQwPhqzn4Qt8qBBeUnO5XrK4Eqtq1/wQ
         VD8x0mEEDnAcPNBpCg609vbLsbSDitTIoKU/cgykYCXADP5YQqL11H/vuZbmrS71ecss
         qBhanVdmTBRcuRQP1A2Jv02RUkSP5V9v98tg46zfZk9D2/oVjv6CmIdeLmmGjGXVa2c3
         ancPzyr/J1OmowuainewQKXXuLVkI5xOtESDY8cYn8vDyD9oLwHpL9A3qJmBa73FHsLp
         YlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972815; x=1700577615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJTBhe5AIq+piFF54yNuiwKWHopSqD7by2+9eio+MdU=;
        b=VgTHtKmHeVpsKyPpMGJN7mfO3Wn/oe4PidsVG6HjdZu12o4/FrSxlQhNItycRyyagR
         6/GRgK4Xdo9FBd1jIqQheRPBWMc188YFjETke/po9ULyo3LCHKmiGBxzE25AFgPPn2Q1
         rzQik330xwhK2h8Wkm6w39VtvHG/MLUZOh0RJ5xFhwIsbpC6vqJHVr/tz35rXuKQTTbF
         c4KH7Xrq0ODvu28V9W7WTA5HY/ZCPKfD+luap5dwY6g0kb5EO85unwzHuwN4eTj0izyr
         KtkHVV/6KAfi6RYJjz39k9sop2DWVnhHcWudIyUAnOX4z7ym1Q9AqP9bGmmx6gnFmceA
         ZmZg==
X-Gm-Message-State: AOJu0YwCRqjupufIGuk9pYWvAdgti/nfMhNib8EcOFSxl7/8lOdd8Rt3
	0xV1BEO5x5pd86F6B03S1p2YHBZ9
X-Google-Smtp-Source: AGHT+IE8dPcoX4Dac2Uu05H6YcGwd8wvx56/VSesXpaOIpMKV8Ekj9QVQKSryNOPBDH4ia71GkoHQw==
X-Received: by 2002:a17:906:6a1f:b0:9b2:df16:851d with SMTP id qw31-20020a1709066a1f00b009b2df16851dmr9925246ejc.57.1699972815506;
        Tue, 14 Nov 2023 06:40:15 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id le5-20020a170907170500b00988f168811bsm5631076ejc.135.2023.11.14.06.40.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:40:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 17/19] hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
Date: Tue, 14 Nov 2023 15:38:13 +0100
Message-ID: <20231114143816.71079-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: clTumDjsAgTE

"hw/xen/xen_pt.h" requires "hw/xen/xen_native.h" which is target
specific. It also declares IGD methods, which are not target
specific.

Target-agnostic code can use IGD methods. To allow that, extract
these methos into a new "hw/xen/xen_igd.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen_pt.h             | 14 --------------
 include/hw/xen/xen_igd.h    | 33 +++++++++++++++++++++++++++++++++
 accel/xen/xen-all.c         |  1 +
 hw/i386/pc_piix.c           |  1 +
 hw/xen/xen_pt.c             |  3 ++-
 hw/xen/xen_pt_config_init.c |  3 ++-
 hw/xen/xen_pt_graphics.c    |  3 ++-
 hw/xen/xen_pt_stub.c        |  2 +-
 8 files changed, 42 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/xen/xen_igd.h

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index d3180bb134..095a0f0365 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -15,9 +15,6 @@
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
-bool xen_igd_gfx_pt_enabled(void);
-void xen_igd_gfx_pt_set(bool value, Error **errp);
-
 void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
 
 #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
@@ -62,12 +59,6 @@ typedef struct XenPTDeviceClass {
     XenPTQdevRealize pci_qdev_realize;
 } XenPTDeviceClass;
 
-uint32_t igd_read_opregion(XenPCIPassthroughState *s);
-void xen_igd_reserve_slot(PCIBus *pci_bus);
-void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
-void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                           XenHostPCIDevice *dev);
-
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
     (XenPCIPassthroughState *, XenPTRegInfo *, uint32_t real_offset,
@@ -353,11 +344,6 @@ static inline bool xen_pt_has_msix_mapping(XenPCIPassthroughState *s, int bar)
 void *pci_assign_dev_load_option_rom(PCIDevice *dev, int *size,
                                      unsigned int domain, unsigned int bus,
                                      unsigned int slot, unsigned int function);
-static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
-{
-    return (xen_igd_gfx_pt_enabled()
-            && ((dev->class_code >> 0x8) == PCI_CLASS_DISPLAY_VGA));
-}
 int xen_pt_register_vga_regions(XenHostPCIDevice *dev);
 int xen_pt_unregister_vga_regions(XenHostPCIDevice *dev);
 void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
diff --git a/include/hw/xen/xen_igd.h b/include/hw/xen/xen_igd.h
new file mode 100644
index 0000000000..7ffca06c10
--- /dev/null
+++ b/include/hw/xen/xen_igd.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) 2007, Neocleus Corporation.
+ * Copyright (c) 2007, Intel Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Alex Novik <alex@neocleus.com>
+ * Allen Kay <allen.m.kay@intel.com>
+ * Guy Zana <guy@neocleus.com>
+ */
+#ifndef XEN_IGD_H
+#define XEN_IGD_H
+
+#include "hw/xen/xen-host-pci-device.h"
+
+typedef struct XenPCIPassthroughState XenPCIPassthroughState;
+
+bool xen_igd_gfx_pt_enabled(void);
+void xen_igd_gfx_pt_set(bool value, Error **errp);
+
+uint32_t igd_read_opregion(XenPCIPassthroughState *s);
+void xen_igd_reserve_slot(PCIBus *pci_bus);
+void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev);
+
+static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
+{
+    return (xen_igd_gfx_pt_enabled()
+            && ((dev->class_code >> 0x8) == PCI_CLASS_DISPLAY_VGA));
+}
+
+#endif
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 5ff0cb8bd9..0bdefce537 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -15,6 +15,7 @@
 #include "hw/xen/xen_native.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "chardev/char.h"
 #include "qemu/accel.h"
 #include "sysemu/cpus.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index eace854335..a607dcb56c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -56,6 +56,7 @@
 #ifdef CONFIG_XEN
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #endif
 #include "hw/xen/xen-x86.h"
 #include "hw/xen/xen.h"
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 36e6f93c37..a8edabdabc 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -59,7 +59,8 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
-#include "xen_pt.h"
+#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "qemu/range.h"
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 2b8680b112..ba4cd78238 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -15,7 +15,8 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
-#include "xen_pt.h"
+#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "hw/xen/xen-legacy-backend.h"
 
 #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 0aed3bb6fd..6c2e3f4840 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -3,7 +3,8 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "xen_pt.h"
+#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "xen-host-pci-device.h"
 
 static unsigned long igd_guest_opregion;
diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
index 5c108446a8..72feebeb20 100644
--- a/hw/xen/xen_pt_stub.c
+++ b/hw/xen/xen_pt_stub.c
@@ -6,7 +6,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "qapi/error.h"
 
 bool xen_igd_gfx_pt_enabled(void)
-- 
2.41.0
