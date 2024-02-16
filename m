Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1273715ejb;
        Fri, 16 Feb 2024 06:45:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNclssck3HuOrxchuxyKndBEuVUSIq3GoIN5R84qX6vpMVCng36S2H0L21jTuwTlwkF8hWN7fvNMEM7fCH9i28oF3LF4Rm
X-Received: by 2002:a17:907:940f:b0:a3c:c13f:a1d9 with SMTP id dk15-20020a170907940f00b00a3cc13fa1d9mr8664692ejc.38.1708094712629;
        Fri, 16 Feb 2024 06:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708094712; cv=none;
        d=google.com; s=arc-20160816;
        b=nK6bHOYDKjTQ4H9O08kGRqRuOGpUTvzEq46jNAzC6pKdft0/0biRMrzhVEYGYKV6Ru
         XNBfz7VQqMe50jv917pOIS+oFodAyJ8fBWWTiZoUyx/HblqQxqyy+z1Jknb1uVf3mFo3
         R1WhoalEeligLazdle1v6m813QBwdyDmdamDxa94MBTrUd93RqTzlqg5gkmxkoAarPPA
         kqYS1wKxdFDOP/jbGJM/pyXISRp20kUYpJKmkBAHhZNXGtcSN4paYt3csLvue4QRZHuI
         uwHQchVAZdptZatRzHP8B3V8xFDhaSbhRDdKZhi6Fnqh5xVs4ymsPqe8/N1+jqSycRZb
         ST7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qLPMc5ylkP6y7icrClH7VZ3g7ncvDegsosg9by30Ht4=;
        fh=Lpcwp9LdiAwUNbpyDrg2I6lQHN13Nv3g8Z4LN+ZaSSE=;
        b=n06LmoU069PTF41jdeyJ5sCy4pCLhyX1xZciftfIfxCoavTlntBF9/yWxaySYC6hqv
         ba1bb9W1WugMTo1R3lRSASCM8raLk+ah1smPMjAJvznlH30pLGu+qgEWkxyF6VPut/6/
         tZuUbvsBTk0qmvI5eyD2xqpdQ7DVnigk/AUCNwab5NAEjBOCCAR09fCp9Ql2y0TNW92M
         XDXms18+Bbqjk1RbYGqGUs6S2itaB05s7Qzk+ebl4tZb0uqfEYIPBmpGzg1IEvtjj3wR
         +eEp/wFOaUqY5sYT4Le90HdFhcj9dR9pdA8A1BaM8LF3CxI+y4wdWOByn2QKm6p5oJr+
         z3hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsGHWB22;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gr21-20020a170906e2d500b00a3a10b1c2e7sor40301ejb.9.2024.02.16.06.45.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Feb 2024 06:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsGHWB22;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094712; x=1708699512; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLPMc5ylkP6y7icrClH7VZ3g7ncvDegsosg9by30Ht4=;
        b=CsGHWB22eYddE9fgQRvS74IDDzho+h4Y4DAQQYD2z8jY0FEivF2WO17h2CcA6KgV7D
         D4eRiJZeDrDNoM0EipJIDDsOjoX6xRG5H9LFbFqrjesg7Ewl22W9KKs18cGJtsxca1IP
         6j3CDoKyl2rdBjzKD04DvnokLq19nNnvqZJgXF2QeheJsCV3G1Qb3TFAbH9CIGiI5xrU
         NoWGvBnnDaAe11BjPIsnbdsfyVFBPi4Tl3XuORB4XAFAhjjp6GW2HvjR0pBaOHlz/tdz
         XJY0HwylZkqmhk1zEsJGhfYTaGZrhs5RKANeWgEx1+dyWa/b8phX3Glk9Z8Rz66nHr6t
         k+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094712; x=1708699512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLPMc5ylkP6y7icrClH7VZ3g7ncvDegsosg9by30Ht4=;
        b=DlNg3cmXckr2MczPRHKx9+9RYwF3e2DfJBvIFZHOJDe1GQEbXRPJqXHLvqV99caDk+
         FyUEgO6zMspgPHCWcsFLqkSOiXuxH6Fh1QXudwQ8jXn/wOfUIycN4HTQvTvFwGpjJYtb
         MCY4XYPByOJFzeinJMnRW3abuy02g1qyR51gCfD59EaknOHDDrnHwke+eVceCzYGXet/
         M7bZuX+D6Z0RB3Qc7iuXgeqToTL+ODzk99JkmFv6WhbA8QhgHKT18mS9TjzIMndNdsEK
         Td1XMUOIOXqqam0MP5ajCmB6ZHq76nm/+nyijNhKoLKfrKw4c1Nk851eiUoYbSp3BA0f
         khww==
X-Forwarded-Encrypted: i=1; AJvYcCXBwrLsgsonDclq+ASEJdZ/0vVGfpVBdApocy1kmMnN+PE1f7PjeYnISVlQVNRBGYv0biTm9FJfBunM2zUIetGPyC7e4FRE
X-Gm-Message-State: AOJu0YyzGGG8vmCf6fs+hhnwsjwJ+Trto+sWuX+8fnfIPc1Ju1mspPml
	2Ypr/igZUom7Db3TnPsEG3y0kaMB8eALJ7qS+2NS45cfWL2HD+lGbf4/sKhxXO/RRA==
X-Google-Smtp-Source: AGHT+IFPUHD/KZzIm373ceIUJP/l8ije2dVq+LH3+SJGk7jZz6TMdfiu6n1dN9N6nzYmTn4BA9YiEA==
X-Received: by 2002:a17:906:5f84:b0:a3c:1e4d:725a with SMTP id a4-20020a1709065f8400b00a3c1e4d725amr6398239eju.37.1708094712236;
        Fri, 16 Feb 2024 06:45:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.210.246])
        by smtp.gmail.com with ESMTPSA id lu15-20020a170906facf00b00a3d1c0a3d5dsm2653ejb.63.2024.02.16.06.45.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Feb 2024 06:45:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Kochkov <anton.kochkov@proton.me>,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/6] hw/misc/ivshmem-flat: Allow device to wire itself on sysbus
Date: Fri, 16 Feb 2024 15:44:52 +0100
Message-ID: <20240216144456.34992-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216144456.34992-1-philmd@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eCmqCoXHJ5rC

From: Gustavo Romero <gustavo.romero@linaro.org>

The following is an example on how to create the ivshmem-flat device on
a Stellaris machine:

$ qemu-system-arm -cpu cortex-m3 -machine lm3s6965evb -nographic
                  -net none -chardev stdio,id=con,mux=on
                  -serial chardev:con -mon chardev=con,mode=readline
                  -chardev socket,path=/tmp/ivshmem_socket,id=ivf
                  -device ivshmem-flat,x-irq-qompath=/machine/unattached/device[1]/nvic/unnamed-gpio-in[0],x-bus-qompath="/sysbus",chardev=ivf
                  -kernel zephyr_qemu.elf

The IRQ QOM path for the target machine can be determined by creating
the VM without the ivshmem-flat device, going to the QEMU console and
listing the QOM nodes with 'info qom-tree'. In the Stellaris example
above the input IRQ is in the NVIC IC.

The MMRs for status and control (notification) are mapped to the MMIO
region at 0x400FF000 (default), whilst the shared memory region start
is mapped at addr. 0x40100000 (default), but both addresses can be set
when creating the device by using 'x-bus-address-{mmr,shmem}' options,
respectively.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/devices/ivshmem-flat.rst | 56 +++++++++++++++++++++++++
 include/hw/misc/ivshmem-flat.h       |  9 ++++
 hw/core/sysbus-fdt.c                 |  2 +
 hw/misc/ivshmem-flat.c               | 63 ++++++++++++++++++++++++++--
 4 files changed, 127 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/ivshmem-flat.rst b/docs/system/devices/ivshmem-flat.rst
index 1f97052804..a10446a18f 100644
--- a/docs/system/devices/ivshmem-flat.rst
+++ b/docs/system/devices/ivshmem-flat.rst
@@ -31,3 +31,59 @@ the IRQ mechanism is disabled). The shared memory region is always present.
 The MMRs (INTRMASK, INTRSTATUS, IVPOSITION, and DOORBELL registers) offsets at
 the MMR region, and their functions, follow the ivshmem spec, so they work
 exactly as in the ivshmem PCI device (see ./specs/ivshmem-spec.txt).
+
+
+Device Options
+--------------
+
+The only required options to create an ivshmem-flat device are: (a) the UNIX
+socket where the ivshmem server is listening, usually ``/tmp/ivshmem_socket``;
+and (b) the bus type to be used by the device, which currently only supports
+"/sysbus" bus type.
+
+Example:
+
+.. parsed-literal::
+
+    |qemu-system-arm| -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem_flat -device ivshmem-flat,x-bus-qompath="/sysbus",chardev=ivshmem_flat
+
+The other options are for fine tuning the device.
+
+``x-irq-qompath``. Used to inform the device which IRQ input line it can attach
+to enable the notification mechanism (IRQ). The ivshmem-flat device currently
+only supports notification via vector 0, ignoring other vectors.
+
+Two examples for different machines follow.
+
+Stellaris machine (``- machine lm3s6965evb``):
+
+::
+
+    x-irq-qompath=/machine/unattached/device[1]/nvic/unnamed-gpio-in[0]
+
+Arm mps2-an385 machine (``-machine mps2-an385``):
+
+::
+
+    x-irq-qompath=/machine/armv7m/nvic/unnamed-gpio-in[0]
+
+The available IRQ input lines on a given VM that the ivshmem-flat device can be
+attached to can be inspected from the QEMU monitor (Ctrl-a + c) with:
+
+(qemu) info qom-tree
+
+``x-bus-address-mmr``. Allows changing the address where the MMRs are mapped
+into the VM memory layout. Default is 0x400FF000, but this address might be
+already taken on some VMs, hence it's  necessary to adjust the MMR location on
+some VMs.
+
+ ``x-bus-address-shmem``. Allows changing the address where the shared memory
+region is mapped into the VM memory layout. Default is 0x40100000, but this
+address might be already taken on some VMs, hence it's necessary to adjust the
+shared memory location.
+
+``shmem-size``. Allows changing the size (in bytes) of shared memroy region.
+Default is 4 MiB, which is the same default value used by the ivshmem server, so
+usually it's not necessary to change it. The  size must match the size of the
+shared memory reserverd and informed by the ivshmem server, otherwise device
+creation fails.
diff --git a/include/hw/misc/ivshmem-flat.h b/include/hw/misc/ivshmem-flat.h
index 97ca0ddce6..d5b6d99ae4 100644
--- a/include/hw/misc/ivshmem-flat.h
+++ b/include/hw/misc/ivshmem-flat.h
@@ -25,6 +25,12 @@
  *    socket
  *  + QOM property "shmem-size" sets the size of the RAM region shared between
  *    the device and the ivshmem server
+ *  + QOM property "x-bus-address-iomem" is the base address of the I/O region
+ *    on the main system bus
+ *  + QOM property "x-bus-address-shmem" is the base address of the shared RAM
+ *    region on the main system bus
+ *  + QOM property "x-irq-qompath" is the QOM path of the interrupt being
+ *    notified
  *  + sysbus MMIO region 0: device I/O mapped registers
  *  + sysbus MMIO region 1: shared memory with ivshmem server
  *  + sysbus IRQ 0: single output interrupt
@@ -68,9 +74,11 @@ struct IvshmemFTState {
 
     /* IRQ */
     qemu_irq irq;
+    char *x_sysbus_irq_qompath;
 
     /* I/O registers */
     MemoryRegion iomem;
+    uint64_t x_sysbus_mmio_addr;
     uint32_t intmask;
     uint32_t intstatus;
     uint32_t ivposition;
@@ -80,6 +88,7 @@ struct IvshmemFTState {
     MemoryRegion shmem;
     int shmem_fd;
     uint32_t shmem_size;
+    uint64_t x_sysbus_shmem_addr;
 };
 
 #endif /* IVSHMEM_FLAT_H */
diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index eebcd28f9a..40d7356cae 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/tpm.h"
+#include "hw/misc/ivshmem-flat.h"
 #include "hw/platform-bus.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
@@ -495,6 +496,7 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
 #endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+    TYPE_BINDING(TYPE_IVSHMEM_FLAT, no_fdt_node),
     TYPE_BINDING("", NULL), /* last element */
 };
 
diff --git a/hw/misc/ivshmem-flat.c b/hw/misc/ivshmem-flat.c
index 998c78a5ee..433a47c8d3 100644
--- a/hw/misc/ivshmem-flat.c
+++ b/hw/misc/ivshmem-flat.c
@@ -421,16 +421,75 @@ static bool ivshmem_flat_connect_server(DeviceState *dev, Error **errp)
     return true;
 }
 
+static bool ivshmem_flat_sysbus_wire(DeviceState *dev, Error **errp)
+{
+    IvshmemFTState *s = IVSHMEM_FLAT(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    if (s->x_sysbus_mmio_addr != UINT64_MAX) {
+        trace_ivshmem_flat_mmio_map(s->x_sysbus_mmio_addr);
+        sysbus_mmio_map(sbd, 0, s->x_sysbus_mmio_addr);
+    }
+    if (s->x_sysbus_shmem_addr != UINT64_MAX) {
+        trace_ivshmem_flat_shmem_map(s->x_sysbus_shmem_addr);
+        sysbus_mmio_map(sbd, 1, s->x_sysbus_shmem_addr);
+    }
+
+    /* Check for input IRQ line, if it's provided, connect it. */
+    if (s->x_sysbus_irq_qompath) {
+        Object *oirq;
+        bool ambiguous = false;
+        qemu_irq irq;
+
+        oirq = object_resolve_path_type(s->x_sysbus_irq_qompath, TYPE_IRQ,
+                                        &ambiguous);
+        if (ambiguous) {
+            error_setg(errp, "Specified IRQ is ambiguous. Can't create"
+                             " ivshmem-flat device.");
+            return false;
+        }
+
+        if (!oirq) {
+            error_setg(errp, "Can't resolve IRQ QOM path.");
+            return false;
+        }
+        irq = (qemu_irq)oirq;
+        trace_ivshmem_flat_irq_resolved(s->x_sysbus_irq_qompath);
+
+        /*
+         * Connect device out irq line to interrupt controller input irq line.
+         */
+        sysbus_connect_irq(sbd, 0, irq);
+    } else {
+       /*
+        * If input IRQ is not provided, warn user the device won't be able
+        * to trigger any interrupts.
+        */
+        warn_report("Input IRQ not specified, device won't be able"
+                    " to handle IRQs!");
+    }
+
+    return true;
+}
+
 static void ivshmem_flat_realize(DeviceState *dev, Error **errp)
 {
     if (!ivshmem_flat_connect_server(dev, errp)) {
         return;
     }
+    if (!ivshmem_flat_sysbus_wire(dev, errp)) {
+        return;
+    }
 }
 
 static Property ivshmem_flat_props[] = {
     DEFINE_PROP_CHR("chardev", IvshmemFTState, server_chr),
     DEFINE_PROP_UINT32("shmem-size", IvshmemFTState, shmem_size, 4 * MiB),
+    DEFINE_PROP_STRING("x-irq-qompath", IvshmemFTState, x_sysbus_irq_qompath),
+    DEFINE_PROP_UINT64("x-bus-address-iomem", IvshmemFTState,
+                       x_sysbus_mmio_addr, UINT64_MAX),
+    DEFINE_PROP_UINT64("x-bus-address-shmem", IvshmemFTState,
+                       x_sysbus_shmem_addr, UINT64_MAX),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -439,13 +498,11 @@ static void ivshmem_flat_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->hotpluggable = true;
+    dc->user_creatable = true;
     dc->realize = ivshmem_flat_realize;
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     device_class_set_props(dc, ivshmem_flat_props);
-
-    /* Reason: Must be wired up in code (sysbus MRs and IRQ) */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo ivshmem_flat_info = {
-- 
2.41.0
