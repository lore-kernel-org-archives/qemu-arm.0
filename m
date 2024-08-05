Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986388njb;
        Mon, 5 Aug 2024 13:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxCHAqX+64sw0GvF/O/eUrbODFE+9S3rQwYGif2Sb2aW0q0UBpCMvdLDC2GdDc5jncdSwUHPTk5yXHzfozAKklvmkLpETl
X-Received: by 2002:a17:902:ecc7:b0:1fd:6c5b:afbc with SMTP id d9443c01a7336-1ff573cc1fdmr152095745ad.49.1722889053611;
        Mon, 05 Aug 2024 13:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889053; cv=none;
        d=google.com; s=arc-20160816;
        b=dU232AwCUmFsV3VPoSLbe7Yq5IbDl+K5sxjhYd2fQ95sWIWdIB075n9Gqb+lYsG/NS
         3v6Iiql2RDR09zOM/MHXZ+q0RB4thtO1TOAw3P/4/ubivCw5n9dPKRWE91E+q/C9SIQs
         wqdqKHdNUPjuOfFSjyZAZda4hvtnVLtUISZtRmm7j3ajjw9BONwdaxpBJHdU/lUusXZC
         EV+zEQrftReYe0V0TC3c1DajcZoSAhFEy3cFwVBmCk/RtX6b/QeVrfwfp0CvXfZxITyS
         K8dHkTVvGRLLqQvarziW/W/w0Zeu5fGU+7y2eVhuMKL5djdkmCIRkUFEph84UFRMTjBl
         acjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=fPOF8tPVCB5RUT1vLWhA1MQiOoDtDv85xjMES2IhNfM=;
        fh=fmpxaiEjn3EKEyEp4gOqWx4AtftCp92hb+VXFOnSOFc=;
        b=zAoVj5IY65V5f3gaggEI8/e3x6Cl5RqmR43WbhH11MEEVfcl/Vw48haNzHbGnGwb/6
         /h4xucD1nakJ6Z2j6i+Sq44k0exePoPVzVYtXrwADkVKQB1CjkZVj6dV1+cIWLjvotZm
         mK4oBgtci5SajAYBm20rNyGMa+RVk5SpS+FbRXaNidDJtdzkiovf3e5kuaQ+hJwk2DDx
         rEmt54gouzjfEN0wsXGhSfIaDidcMt15gXUT1DjfKnJEwPOtY7Mz6rsKiHDislkBI2yd
         mtSc7SHdOqOxw5/QFSNEp7lbZukSM5xXtjnQIJn4QG5Xk0ct/SLHk9KcPK80Xle1HGgn
         94sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GhT9ceQY;
       spf=pass (google.com: domain of 3xtoxzgukc8q3k5szqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3XTOxZgUKC8Q3k5szqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3XTOxZgUKC8Q3k5szqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-1ff5917a5e9sor64867315ad.19.2024.08.05.13.17.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3xtoxzgukc8q3k5szqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=GhT9ceQY;
       spf=pass (google.com: domain of 3xtoxzgukc8q3k5szqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3XTOxZgUKC8Q3k5szqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889053; x=1723493853; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPOF8tPVCB5RUT1vLWhA1MQiOoDtDv85xjMES2IhNfM=;
        b=GhT9ceQYNDGM6r76DrTOeU4BLDNQKIo4n4Tlz3Y0ORLFOEHtFHpm1dht8Xvzy5TVZw
         N/gk36bJgQZcoMno/DVC66wwPPB96SYSp065R71+NGD1fm0x2aFfIsBN0yP8Bva/prDT
         eSj9mjcC81obk7XX7exhvvEmD3yn3vur/Q+6+lSfm+lhNWjyyJgRhuCErwSgaPbl2quF
         uYBM1h7T/iVF/485dguQyG7XOKQhniJZ/XF1kwloxBhfvezwAP3vKgRsG0BtZ7mPGE1L
         8/atOotlNumZtI1nIDvNsHCsLiptQerFvgVOfpRoJfKlvW11Km182NCWvzSNzBVVqiea
         bjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889053; x=1723493853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPOF8tPVCB5RUT1vLWhA1MQiOoDtDv85xjMES2IhNfM=;
        b=QtEEDclAUoCGYdIVKsrsyPsH1rGihBXY/rRkLd3nwk4dSKqxGVT/QaEkGXg9JWE5+j
         U4Zl87AuKg++CmZDk4g6ZGJj7rnvKXebtwiINwoOTaDq/mmGQ9E9+aoonZF42NFrSplO
         w09C5b3mKF7V9EQRZFbYIFjKppwm8Ek9kMHvzvjZUJ/NmdXZ4pCAphczFOetiQe+OBUM
         l8kVjDDyY5tqLWwFlsd+biCAyxog4OmdH37HTFcLQTXREHFwCm/Z0dyW9JgnFJRWIVr5
         Y0nhz1jcHxEVZl5FiIFBJ1r3q+qqBJe2E6qoUpIauX8zMNODPeEeYnH2i0sF7Aaw/tHH
         MEaA==
X-Forwarded-Encrypted: i=1; AJvYcCVmcpi4KqbYTcQalu3F+eXqa2J+EB29Wn73+EdRNvlRdtyA9HBWZIdEkdTcDkgtlNxJUXMmLd48EQWOEreAxgf+O8ym03l7
X-Gm-Message-State: AOJu0Yy4cYilLlea2hdAnho7BpgskD681VvYipmq8WOg/10nPxRn0xVW
	gM82CUlIzufE5UckJbWZpL7eAVcxAmvQUcxOJX3nDDAQLSckKlVNElYJJD/kphAaCKyAOGLmZg=
	=
X-Google-Smtp-Source: AGHT+IGa+UzwdbIld7JsQhx6EPRnqA/aNMmojNYxLGBdvPzBROaZTGG7602qUJgCnMz1HGkefTTNEeUCUg==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:e742:b0:1f9:cbe5:e422 with SMTP id
 d9443c01a7336-1ff5748d438mr4976885ad.8.1722889053049; Mon, 05 Aug 2024
 13:17:33 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:02 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-8-tavip@google.com>
Subject: [RFC PATCH 07/23] tests/unit: add system bus mock
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5DE35A/WYJZr

From: Valentin Ghita <valentinghita@google.com>

From: Valentin Ghita <valentinghita@google.com>

Add a system bus mock and the necessary memory access functions to be
able to create unit tests for device models.

Signed-off-by: Valentin Ghita <valentinghita@google.com>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/sysbus-mock.c | 314 +++++++++++++++++++++++++++++++++++++++
 tests/unit/sysbus-mock.h |  82 ++++++++++
 2 files changed, 396 insertions(+)
 create mode 100644 tests/unit/sysbus-mock.c
 create mode 100644 tests/unit/sysbus-mock.h

diff --git a/tests/unit/sysbus-mock.c b/tests/unit/sysbus-mock.c
new file mode 100644
index 0000000000..c6c654eabc
--- /dev/null
+++ b/tests/unit/sysbus-mock.c
@@ -0,0 +1,314 @@
+/*
+ * System Bus Mock
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-core.h"
+
+#include "sysbus-mock.h"
+
+AddressSpace address_space_memory;
+
+/* Simulates guest memory space. */
+static uint8_t *guest_mem;
+static size_t guest_mem_size;
+
+static uint64_t memory_region_ram_device_read(void *opaque,
+                                              hwaddr addr, unsigned size)
+{
+    uint64_t data = (uint64_t)~0;
+    uint8_t *buf = opaque;
+
+    switch (size) {
+    case 1:
+        data = *(uint8_t *)(buf + addr);
+        break;
+    case 2:
+        data = *(uint16_t *)(buf + addr);
+        break;
+    case 4:
+        data = *(uint32_t *)(buf + addr);
+        break;
+    case 8:
+        data = *(uint64_t *)(buf + addr);
+        break;
+    }
+
+    return data;
+}
+
+static void memory_region_ram_device_write(void *opaque, hwaddr addr,
+                                           uint64_t data, unsigned size)
+{
+    uint8_t *buf = opaque;
+
+    switch (size) {
+    case 1:
+        *(uint8_t *)(buf + addr) = (uint8_t)data;
+        break;
+    case 2:
+        *(uint16_t *)(buf + addr) = (uint16_t)data;
+        break;
+    case 4:
+        *(uint32_t *)(buf + addr) = (uint32_t)data;
+        break;
+    case 8:
+        *(uint64_t *)(buf + addr) = data;
+        break;
+    }
+}
+
+static const MemoryRegionOps ram_device_mem_ops = {
+    .read = memory_region_ram_device_read,
+    .write = memory_region_ram_device_write,
+    .endianness = DEVICE_HOST_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+};
+
+void *cpu_physical_memory_map(hwaddr addr, hwaddr *plen, bool is_write)
+{
+    /* Mock implementation. Return a pointer inside the guest_mem buffer. */
+    g_assert(guest_mem != NULL);
+    g_assert(guest_mem_size <= addr + (size_t)plen);
+
+    return guest_mem + addr;
+}
+
+void cpu_physical_memory_unmap(void *buffer, hwaddr len,
+                               bool is_write, hwaddr access_len)
+{
+    /* Mock implementation. */
+}
+
+MemTxResult address_space_read_full(AddressSpace *as, hwaddr addr,
+                                    MemTxAttrs attrs, void *buf, hwaddr len)
+{
+    /* Mock implementation */
+    g_assert(guest_mem != NULL);
+
+    if (guest_mem_size < addr + (size_t)len) {
+        return MEMTX_ERROR;
+    }
+
+    memcpy(buf, guest_mem + addr, len);
+
+    return MEMTX_OK;
+}
+
+MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
+                                MemTxAttrs attrs,
+                                const void *buf, hwaddr len)
+{
+    /* Mock implementation */
+    g_assert(guest_mem != NULL);
+
+    if (guest_mem_size < addr + (size_t)len) {
+        return MEMTX_ERROR;
+    }
+
+    memcpy(guest_mem + addr, buf, len);
+
+    return MEMTX_OK;
+}
+
+MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
+                             void *buf, hwaddr len, bool is_write)
+{
+    if (is_write) {
+        return address_space_write(as, addr, attrs, buf, len);
+    } else {
+        return address_space_read_full(as, addr, attrs, buf, len);
+    }
+}
+
+void cpu_physical_memory_rw(hwaddr addr, void *buf,
+                            hwaddr len, bool is_write)
+{
+    address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
+                     buf, len, is_write);
+}
+
+void memory_region_init_io(MemoryRegion *mr, Object *owner,
+                           const MemoryRegionOps *ops, void *opaque,
+                           const char *name, uint64_t size)
+{
+    /* Mock implementation. */
+    mr->size = size;
+    mr->ops = ops;
+    mr->opaque = opaque;
+}
+
+void memory_region_init_ram_device_ptr(MemoryRegion *mr, Object *owner,
+                                       const char *name, uint64_t size,
+                                       void *ptr)
+{
+    mr->size = size;
+    mr->ops = &ram_device_mem_ops;
+    mr->opaque = ptr;
+}
+
+void memory_region_set_readonly(MemoryRegion *mr, bool readonly)
+{
+    if (mr->readonly != readonly) {
+        mr->readonly = readonly;
+    }
+}
+
+void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
+{
+    assert(n >= 0 && n < dev->num_mmio);
+    dev->mmio[n].addr = addr;
+    dev->mmio[n].memory->addr = addr;
+}
+
+void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
+{
+    /* Mock implementation. */
+    assert(dev->num_mmio < QDEV_MAX_MMIO);
+    int n = dev->num_mmio++;
+    dev->mmio[n].addr = -1;
+    dev->mmio[n].memory = memory;
+}
+
+static void sysbus_device_class_init(ObjectClass *klass, void *data)
+{
+    /* Mock implementation. */
+}
+
+void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p)
+{
+    qdev_init_gpio_out_named(DEVICE(dev), p, SYSBUS_DEVICE_GPIO_IRQ, 1);
+}
+
+/*
+ * Mock implementation of the sysbus device class.
+ * Including the sysbus source code is difficult because of the dependencies,
+ * so it is easier to define the type here.
+ */
+static const TypeInfo sysbus_device_type_info = {
+    .name = TYPE_SYS_BUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(SysBusDevice),
+    .abstract = true,
+    .class_size = sizeof(SysBusDeviceClass),
+    .class_init = sysbus_device_class_init,
+};
+
+void sysbus_mock_init(void)
+{
+    type_register_static(&sysbus_device_type_info);
+}
+
+/* Find the mmio region containing an address. */
+static MemoryRegion *find_region(SysBusDevice *dev, hwaddr addr)
+{
+    int i;
+
+    for (i = 0; i < dev->num_mmio; i++) {
+        if (dev->mmio[i].addr <= addr &&
+            (addr - dev->mmio[i].addr) < dev->mmio[i].memory->size) {
+
+            return dev->mmio[i].memory;
+        }
+    }
+
+    return NULL;
+}
+
+uint32_t sysbus_mmio_read_addr(DeviceState *dev, hwaddr addr, unsigned size)
+{
+    uint64_t value;
+    MemTxResult result;
+    MemoryRegion *mem = find_region(SYS_BUS_DEVICE(dev), addr);
+
+    assert(mem != NULL);
+    assert(mem->ops->read_with_attrs != NULL || mem->ops->read != NULL);
+
+    if (mem->ops->read_with_attrs != NULL) {
+        result = mem->ops->read_with_attrs(mem->opaque, addr - mem->addr,
+                                           &value, size,
+                                           MEMTXATTRS_UNSPECIFIED);
+        assert(result == MEMTX_OK);
+    } else {
+        value = mem->ops->read(mem->opaque, addr - mem->addr, size);
+    }
+
+    return (uint32_t)value;
+}
+
+void sysbus_mmio_write_addr(DeviceState *dev, hwaddr addr, uint64_t value,
+                            unsigned size)
+{
+    MemTxResult result;
+    MemoryRegion *mem = find_region(SYS_BUS_DEVICE(dev), addr);
+
+    assert(mem != NULL);
+    assert(mem->ops->write_with_attrs != NULL || mem->ops->write != NULL);
+    assert(!mem->readonly);
+
+    if (mem->ops->write_with_attrs != NULL) {
+        result = mem->ops->write_with_attrs(mem->opaque, addr - mem->addr,
+                                            value, size,
+                                            MEMTXATTRS_UNSPECIFIED);
+        g_assert(result == MEMTX_OK);
+    } else {
+        mem->ops->write(mem->opaque, addr - mem->addr, value, size);
+    }
+}
+
+void sysbus_dev_set_guest_mem(void *mem, size_t size)
+{
+    guest_mem = mem;
+    guest_mem_size = size;
+}
+
+MemTxResult sysbus_mmio_read_addr_raw(DeviceState *dev, hwaddr addr,
+                                      uint64_t *value, unsigned size)
+{
+    uint64_t tmp;
+    MemTxResult result;
+    MemoryRegion *mem = find_region(SYS_BUS_DEVICE(dev), addr);
+
+    assert(mem != NULL);
+
+    result = mem->ops->read_with_attrs(dev, addr - mem->addr, &tmp,
+                                       size,
+                                       MEMTXATTRS_UNSPECIFIED);
+    *value = tmp;
+    return result;
+}
+
+MemTxResult sysbus_mmio_write_addr_raw(DeviceState *dev, hwaddr addr,
+                                       uint64_t value, unsigned size)
+{
+    MemoryRegion *mem = find_region(SYS_BUS_DEVICE(dev), addr);
+    assert(mem != NULL);
+    assert(!mem->readonly);
+
+    return mem->ops->write_with_attrs(dev, addr - mem->addr, value,
+                                      size,
+                                      MEMTXATTRS_UNSPECIFIED);
+}
diff --git a/tests/unit/sysbus-mock.h b/tests/unit/sysbus-mock.h
new file mode 100644
index 0000000000..7a4c2e7b9a
--- /dev/null
+++ b/tests/unit/sysbus-mock.h
@@ -0,0 +1,82 @@
+/*
+ * System Bus Mock
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SYSBUS_MOCK_H
+#define SYSBUS_MOCK_H
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/sysbus.h"
+
+/*
+ * sysbus_mock_init
+ *
+ * Initialize the sysbus mock implementation.
+ */
+void sysbus_mock_init(void);
+
+/*
+ * sysbus_mmio_read_addr
+ * @dev: device structure
+ * @addr: address to read from
+ *
+ * Read from an address in a mmio region and assert on errors.
+ */
+uint32_t sysbus_mmio_read_addr(DeviceState *dev, hwaddr addr, unsigned size);
+
+/*
+ * sysbus_mmio_write_addr
+ * @dev: device structure
+ * @addr: address to write to
+ * @value: value to write
+ *
+ * Write to an address in a mmio region and assert on errors.
+ */
+void sysbus_mmio_write_addr(DeviceState *dev, hwaddr addr, uint64_t value,
+                            unsigned size);
+
+/*
+ * sysbus_dev_set_guest_mem
+ *
+ * Set guest generic memory space.
+ */
+void sysbus_dev_set_guest_mem(void *mem, size_t size);
+
+
+/*
+ * sysbus_mmio_read_addr_raw
+ * @dev: device structure
+ * @addr: address to write to
+ * @size: access size
+ *
+ * Read from an address in a mmio region and return errors.
+ *
+ * Returns: MEMTX_OK if the access was successful, MEMTX_ERROR otherwise
+ */
+MemTxResult sysbus_mmio_read_addr_raw(DeviceState *dev, hwaddr addr,
+                                      uint64_t *value, unsigned size);
+
+/*
+ * sysbus_mmio_write_addr_raw
+ * @dev: device structure
+ * @addr: address to write to
+ * @value: value to write
+ * @size: access size
+ *
+ * Write to an address in a mmio region and return errors.
+ *
+ * Returns: MEMTX_OK if the access was successful, MEMTX_ERROR otherwise
+ */
+MemTxResult sysbus_mmio_write_addr_raw(DeviceState *dev, hwaddr addr,
+                                       uint64_t value, unsigned size);
+
+#endif /* SYSBUS_MOCK_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
