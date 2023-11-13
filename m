Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1408565ejc;
        Mon, 13 Nov 2023 07:22:14 -0800 (PST)
X-Received: by 2002:a17:906:13c2:b0:9bd:bbc1:1c65 with SMTP id g2-20020a17090613c200b009bdbbc11c65mr5145985ejc.13.1699888933904;
        Mon, 13 Nov 2023 07:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888933; cv=none;
        d=google.com; s=arc-20160816;
        b=Vh39McvNWxI0l9SPCG+6d+tmZnxazjG9qe8qHe5SAVa3BrQUn/HrgULcFinXLqfDl8
         67hgP6hGVzJnz20HFPvP1mNykARGFsFlJV3kqyLoxsZtcy4GirqZQY8qe1U8THypVrlO
         M2BaE/YcflPWdhpT9zzFQ1yCnFgM9x3x2REDgfOXH9TT9jQOuyEf7dDtwkAKl/e0GvUx
         LmZh9pvP6pAOsDhBXfW/uePW7YLNy1qAuun6a8VSnzaAThIIVXM0qniFSCrFjpHeySf7
         Q1g2TAv/qIaWpdBGrLXPDyiTIfVeZ9e2mLhQeFfRdsJQ/+kVBavUvyOsFAu4/Lmsqwkn
         akMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M4sm9DG4Z80HufhtnK5i8zUn8uDgyk6yGboQ8Gp5Uh8=;
        fh=sE7jrO7zRXEzTqLmd65HFEQBfnNVeSpKQq5mRfNQIAQ=;
        b=O58xYr6ncH7dhDGBlPJ1K+Xfe4zohENAKMjOwPSoRk9B30huQ5cIRspKIkHwoAPAfC
         tG0NhObDQgvIndUC0EC48wIBK5xkuOMsZCmBeu9Xl4hHUcgb/UhShaFuAWZ7k3tjZX4M
         R+H2+xtvfF+Jgg4gRou2guzkq2XN6Vt0e+Z11MIAan5K9Wcq3miknIED/GKSEt/PiCXE
         jYJwjyuXkl9TqQnY564hUVJBDZTKiagco/rKlgpgQAQgyp68q7nLv7BgvL8jR/pNmhis
         8f5GHYezdbLAHY91hWBRoEFWJW8L4AthZEijvHOLbfe5bxsblYVa0quPypmlNmvXtdHE
         eeWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRH+7mwj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s21-20020a170906221500b009e5e827f737sor1142806ejs.6.2023.11.13.07.22.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:22:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRH+7mwj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888933; x=1700493733; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4sm9DG4Z80HufhtnK5i8zUn8uDgyk6yGboQ8Gp5Uh8=;
        b=iRH+7mwjyDq/w3Zf5g1f1YJXjW89GGpRqzMwtXicDt5BBA43traLK29HMoIQGbThBx
         wBDE39An7HimJATXwNbXgadkFtRJcCd5LM4NqTlOmd+qDXwZS5RGxZWUSEI+rj36BGTO
         qJf4WOzr0UPRCgIMv1lQfM0dfnDGJyyNvEqp0qP6ZgCBEXNiIV+jgEK4bguNI1o9vWWz
         EH50T2VFM6S1ahWuxYiRMg9FAzxoGBYBJoYd4rCe0vTjLkRTo92azmSQoiqd9y7YrmVE
         IJP/F3ciAoJ2UrKMBT0/MumTRqd2bLfOGXYk2JP8EoQEDkCPXomSAB7UKU6TNeJlaL9/
         PSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888933; x=1700493733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4sm9DG4Z80HufhtnK5i8zUn8uDgyk6yGboQ8Gp5Uh8=;
        b=LR1bSvktPGMlwopapUOq4LfwhsChCZ4t3jzrIlB0K7V32r36i0ZipKewC8LV4Bc3BW
         totkl97WdII7qoggc6XWZGDSePynRut+hTu4TqU8VqvkPnetn4OMmJL1Xi5dE4q0JZ5A
         G9Bkto8CPbq2sd3VTaN25Jon1TqwfFGk4XHCnot7xcQ6L9ZjIGhFr7eibUc4oNiqiFfj
         oTXRHIWPib+O0IhUqm1F5Vj9HrX4Wyfjao2cD/fYY98HkR0D/QHQzHMwzTrPgNj3Vl/w
         uC7r6xtjJAXJ3IGoy34ryFgLxywArEuPODOOfTtrTf1bs3NkGvDw3rZb5uG791cePaWM
         KtbQ==
X-Gm-Message-State: AOJu0YwdsWQ+9M1HaXri+XMbXeQIIrq6l3KZD7nE0mYGBsPWxfLSMQ8X
	wjgM4pTSEHdegA/mjYN97/iGzygy
X-Google-Smtp-Source: AGHT+IHGfNKy17vE6nE5Sw7Yg/bCgxdoxzzgRWsVuH1JW/c7ZnqbwtyNJGeirXmng2B4mnP0CKSxhg==
X-Received: by 2002:a17:906:b092:b0:9de:2b93:cab9 with SMTP id x18-20020a170906b09200b009de2b93cab9mr5146163ejy.8.1699888933620;
        Mon, 13 Nov 2023 07:22:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b0098884f86e41sm4167855ejb.123.2023.11.13.07.22.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:22:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 09/10] hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
Date: Mon, 13 Nov 2023 16:21:12 +0100
Message-ID: <20231113152114.47916-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TYLCJFO6I90Y

"hw/xen/xen_pt.h" requires "hw/xen/xen_native.h" which is target
specific. It also declares IGD methods, which are not target
specific.

Target-agnostic code can use IGD methods. To allow that, extract
these methos into a new "hw/xen/xen_igd.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
What license for the new "hw/xen/xen_igd.h" header?
---
 hw/xen/xen_pt.h             | 14 --------------
 include/hw/xen/xen_igd.h    | 23 +++++++++++++++++++++++
 accel/xen/xen-all.c         |  1 +
 hw/i386/pc_piix.c           |  1 +
 hw/xen/xen_pt.c             |  3 ++-
 hw/xen/xen_pt_config_init.c |  3 ++-
 hw/xen/xen_pt_graphics.c    |  3 ++-
 hw/xen/xen_pt_stub.c        |  2 +-
 8 files changed, 32 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/xen/xen_igd.h

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 31bcfdf705..da5af67638 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -5,9 +5,6 @@
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
-bool xen_igd_gfx_pt_enabled(void);
-void xen_igd_gfx_pt_set(bool value, Error **errp);
-
 void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
 
 #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
@@ -52,12 +49,6 @@ typedef struct XenPTDeviceClass {
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
@@ -343,11 +334,6 @@ static inline bool xen_pt_has_msix_mapping(XenPCIPassthroughState *s, int bar)
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
index 0000000000..52f1f8244c
--- /dev/null
+++ b/include/hw/xen/xen_igd.h
@@ -0,0 +1,23 @@
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
