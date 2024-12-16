Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2204908njb;
        Mon, 16 Dec 2024 06:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5DEU0HAv48VvoGluW+dFScG50JdQPRH6Ow38IZwL+CgwQJ4G4WfowXRXMt8R596zzpOTdetLS5FNo0w==@linaro.org
X-Received: by 2002:a05:6a00:3288:b0:725:eab2:acc0 with SMTP id d2e1a72fcca58-7290c251900mr16362104b3a.22.1734358739181;
        Mon, 16 Dec 2024 06:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358739; cv=none;
        d=google.com; s=arc-20240605;
        b=gfC2gzKn1iFlv0O2s2CdiHvJwY1GW/OOgc8+HVOarDTd0dZYMr1TLS0I7/OWMPJ/1H
         eqB8nQRHtncke9jcRceoPPXwl/kZvJWSHFEcrHv1Ka3zvx2dCS2px2phIFydH/i64F5u
         TX5drATzkSwSZJzrSEhN2e3Wy70sMa6II1gTdZfOw+4eaoQYqj6O88n//Yga7UKcty/V
         Q3XnRxyDUlO6ZWSeFeW3ak9u65k4XWp3e6/Pumf40LQ9nJNLpUv2C0k66c6CGU6Gw34a
         usrmsgbB0LGi9cZbZnAntcUFnecUS4/dqa4BYSBOty1ld8tkJvqVMjf3/ERAjwelruLE
         4BBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qi8EZZuZhyaL/yFJbVrcptaHouF/D/HSpATmwYA9Dwg=;
        fh=gb0Jc5BjK1v5i4iTx0mip3mkjGNliidFNge9vpr2+k0=;
        b=evFmw5HRloPLV3sjXyRyOa3b1bUzeKhozns2wKeWza8wFNzIUMiNLtKEjgJKjOhI0y
         x/QtdjBgU+pi7aJoxdnbFDm3vi9cjTyJhovJfvIYczyMdX04EZzs2SuVbFxkCjMmzR1K
         tbLSKh6lolHsSw4RJVTJc3kDa6rL/RoGECg/xFQF+OjMLnBU6YWbzG+G6Y73kQh4Of2i
         vItULfk3cR5GX6tQjN/Ds6+4KDPKqzzFeonW2yr88ATCC5OAB7IXPP4bDNZJ57J8ZiaG
         aEBpQ6DhMlLgQKWuHpcUu0AdPJSqC/XWMT/O2b2iXjr7YxF2ixpbcuNUUvFZDDzqqfU4
         S9ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ph64Kjry;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72918ad547dsor2353887b3a.4.2024.12.16.06.18.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 06:18:59 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ph64Kjry;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358739; x=1734963539; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi8EZZuZhyaL/yFJbVrcptaHouF/D/HSpATmwYA9Dwg=;
        b=Ph64KjrydnZU+b1Qp6/2QWxOjeRbCjem8XigXMBahq1vHMg/ZYvbgqZTjZmYUOQzmH
         7O3O6HAy3sxovir6FWHNbFTrOqf41yNu8BL5lbOKcyqpgTkLh2EAS+n8c0RLLmNHRszw
         MgW0TNcYlPpUvMJEjuNOb+9qY5AReQwFy4dI4y6CLka1KEiQGQWqVOS19pjj9aL8lh4o
         IPhOw4g9w38PU5T3tX4lylpGYSu9V7wLEg9dVMFH/Y5yOPxJGv6vwXKamAaahaRKl5jF
         obMQ49ykKxmxm/cPEq7VIHBoeTGdn8XiKgYkModtQk0k3gNYEn9KOJSTbjSvxQYKVBcZ
         3jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358739; x=1734963539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi8EZZuZhyaL/yFJbVrcptaHouF/D/HSpATmwYA9Dwg=;
        b=PYsye4U0E4MI1S34AVSlxsi9xdgSTRjqyexqt7esCk7Coxm+po8+RDd8Rn35YyMWFq
         ObqB542PsvoAEgDaZt6I8Qa3DrovXoy8MvTTqmEAepMFKsLUX6neL8nM1hCyyIYuCRep
         pOEOpnK21+kB1NO8WaQvQJ7esuS9Ci83MoFZC0KJBo2DhNlFaZ2I9OpoaFO57FmtXqDs
         Yy52iSsKYN2JqJzFrW82VAOYTLx7bYlWKy6NahysKCF5EeIcZ+vnZcLGTeg978MckTUK
         4QYITb0UnVfUUxOGTUog3AfvY5AoHq+6/WfIFadROmbNzEUey0FGj4VIo2TD7OH0fvYK
         e1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHI0Iapm9RDDh0CQTLc9SUsjoymdsvkB8YboRiRp9nA0lX+g6x33BXEhZFfnRCCS1p2E9Y153SCyzUhg==@linaro.org
X-Gm-Message-State: AOJu0YxKVufxqdSLoh2beKmVandL6Jy+YcphaD02rH07HfPehk2pOTYy
	1szokzK0bhHYWUXmEWnI+BY/D/a7aFpaLEGjNtChX1fBZvpOlxbty6WvpuvUuO4z9ZqGto0J91j
	W2iQ=
X-Gm-Gg: ASbGncvSTF1BEuoUZ/smkCNkYZVzuI/TZ3ePeLcOdj9LL8Qlxr4HjtMytCwXkbm08DW
	mq2QMAQ9q0fRPP+JFSSJ0iPGkC2DVl4aYtJXzowmuvk8r7Cj98CjKuK7nEDyK3a636zJmaF71XT
	K1pGHRQJ2GJAk5JIzFKIf/ECUfnwFPILwU3Eje9a373FgYy7DAPs2VCVPWo5E/3THsqRK8tCLcG
	eYB0CcEhhRtgAX8PbmF5s6Igbc1YMhAck4sRjsmCR6sxb56K6Xjk+cPuh/ZWeM=
X-Google-Smtp-Source: AGHT+IH8pPDZ/5TGr56TeQJ6mls6zBwqtAVxXKJNEPLtzi/Krap7xQF4MYDexJJsm9ZObo8JpHjiiA==
X-Received: by 2002:a05:6a00:238c:b0:728:e2cc:bfd6 with SMTP id d2e1a72fcca58-7290c22e8a5mr16605242b3a.18.1734358738580;
        Mon, 16 Dec 2024 06:18:58 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([177.189.100.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad8acsm4948815b3a.146.2024.12.16.06.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:18:58 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	armbru@redhat.com
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 2/7] hw/misc/ivshmem-flat: Allow device to wire itself on sysbus
Date: Mon, 16 Dec 2024 14:18:13 +0000
Message-Id: <20241216141818.111255-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216141818.111255-1-gustavo.romero@linaro.org>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hUJygBwYgx6x

This commit enables the ivshmem-flat device to wire itself on sysbus. It
maps the device's Memory-Mapped Registers (MMRs) and shared memory
(shmem) into the VM's memory layout and also allows connection to an
input IRQ so that the device can trigger an interrupt for notification.

Three device options are introduced to control how this is done:
x-bus-address-iomem, x-bus-address-shmem, and x-irq-qompath.

The following is an example on how to create the ivshmem-flat device on
a Stellaris machine:

$ qemu-system-arm -cpu cortex-m3 -machine lm3s6965evb -nographic
                  -net none -chardev stdio,id=con,mux=on
                  -serial chardev:con -mon chardev=con,mode=readline
                  -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem_flat
                  -device ivshmem-flat,chardev=ivshmem_flat,x-irq-qompath='/machine/soc/v7m/nvic/unnamed-gpio-in[0]',x-bus-address-iomem=0x400FF000,x-bus-address-shmem=0x40100000
                  -kernel zephyr_kernel.elf

The IRQ QOM path option for the target machine can be determined by
creating the VM without the ivshmem-flat device, going to the QEMU
monitor and listing the QOM nodes with 'info qom-tree'. In the Stellaris
example above the input IRQ is in the machine's NVIC Interrupt
Controller.

If 'x-irq-qompath' is not provided the device won't be able to be
interrupted by other VMs (peers) and only the shared memory (shmem)
feature will be supported.

The MMRs for status and control (notification) are mapped to the MMIO
region at 'x-bus-address-iomem', whilst the shared memory region start
is mapped at address specified by 'x-bus-address-shmem'.

Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/devices/ivshmem-flat.rst | 57 +++++++++++++++++++++
 hw/core/sysbus-fdt.c                 |  2 +
 hw/misc/ivshmem-flat.c               | 74 ++++++++++++++++++++++++++--
 include/hw/misc/ivshmem-flat.h       |  9 ++++
 4 files changed, 139 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/ivshmem-flat.rst b/docs/system/devices/ivshmem-flat.rst
index 1f97052804..abc67870de 100644
--- a/docs/system/devices/ivshmem-flat.rst
+++ b/docs/system/devices/ivshmem-flat.rst
@@ -31,3 +31,60 @@ the IRQ mechanism is disabled). The shared memory region is always present.
 The MMRs (INTRMASK, INTRSTATUS, IVPOSITION, and DOORBELL registers) offsets at
 the MMR region, and their functions, follow the ivshmem spec, so they work
 exactly as in the ivshmem PCI device (see ./specs/ivshmem-spec.txt).
+
+
+Device Options
+--------------
+
+The required options to create an ivshmem-flat device are: (a) the UNIX
+socket where the ivshmem server is listening, usually ``/tmp/ivshmem_socket``;
+(b) the address where to map the MMRs (``x-bus-address-iomem=``) in the VM
+memory layout; and (c) the address where to map the shared memory in the VM
+memory layout (``x-bus-address-shmem=``). Both (a) and (b) depend on the VM
+being used, as the MMRs and shmem must be mapped to a region not previously
+occupied in the VM.
+
+Example:
+
+.. parsed-literal::
+
+    |qemu-system-arm| -chardev socket,path=/tmp/ivshmem_socket,id=ivshmem_flat -device ivshmem-flat,chardev=ivshmem_flat,x-irq-qompath='/machine/soc/v7m/nvic/unnamed-gpio-in[0]',x-bus-address-iomem=0x400FF000,x-bus-address-shmem=0x40100000
+
+The other option, ``x-irq-qompath=``, is not required if the user doesn't want
+the device supporting notifications.
+
+``x-irq-qompath``. Used to inform the device what IRQ input line it can attach
+to to enable the notification mechanism (IRQ). The ivshmem-flat device currently
+only supports notification via vector 0. Notification via other vectors are
+ignored. (optional)
+
+Two examples for different machines follow.
+
+Stellaris machine (``-machine lm3s6965evb``):
+
+::
+
+    x-irq-qompath=/machine/soc/v7m/nvic/unnamed-gpio-in[0]
+
+Arm mps2-an385 machine (``-machine mps2-an385``):
+
+::
+
+    x-irq-qompath=/machine/armv7m/nvic/unnamed-gpio-in[0]
+
+The available IRQ input lines on a given VM that the ivshmem-flat device can be
+attached should be found using the QEMU monitor (Ctrl-a + c) with:
+
+(qemu) info qom-tree
+
+``x-bus-address-iomem``. Allows changing the address where the MMRs are mapped
+into the VM memory layout. (required)
+
+ ``x-bus-address-shmem``. Allows changing the address where the shared memory
+region is mapped into the VM memory layout. (required)
+
+``shmem-size``. Allows changing the size (in bytes) of shared memory region.
+Default is 4 MiB, which is the same default used by the ivshmem server, so
+usually it's not necessary to change it. The size must match the size of the
+shared memory reserved and informed by the ivshmem server, otherwise the device
+creation fails. (optional)
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
index 833ee2fefb..972281ca57 100644
--- a/hw/misc/ivshmem-flat.c
+++ b/hw/misc/ivshmem-flat.c
@@ -420,16 +420,86 @@ static bool ivshmem_flat_connect_server(DeviceState *dev, Error **errp)
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
+    } else {
+        error_setg(errp, "No address for iomem (MMRs) specified. Can't create"
+                         " ivshmem-flat device. Use 'x-bus-address-iomem'"
+                         " option.");
+        return false;
+    }
+
+    if (s->x_sysbus_shmem_addr != UINT64_MAX) {
+        trace_ivshmem_flat_shmem_map(s->x_sysbus_shmem_addr);
+        sysbus_mmio_map(sbd, 1, s->x_sysbus_shmem_addr);
+    } else {
+        error_setg(errp, "No address for shmem specified. Can't create"
+                         " ivshmem-flat device. Use 'x-bus-address-shmem'"
+                         " option.");
+        return false;
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
 
@@ -438,13 +508,11 @@ static void ivshmem_flat_class_init(ObjectClass *klass, void *data)
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
-- 
2.34.1
