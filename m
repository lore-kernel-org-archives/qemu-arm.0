Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1097264ejb;
        Thu, 7 Mar 2024 04:10:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVimFgWmIA7TSfms7BNnEtpOtxJS5PO/Zy20qPBaNbYJKXUznmCcsXUb26+qbhIVBcnMu0sMrNiH48zJtm5MrOcbAKD849d
X-Received: by 2002:a05:6512:3b9:b0:513:5dee:3a7d with SMTP id v25-20020a05651203b900b005135dee3a7dmr1109169lfp.50.1709813454254;
        Thu, 07 Mar 2024 04:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709813454; cv=none;
        d=google.com; s=arc-20160816;
        b=XfWG9icrECugA5nMugReCq+BOv36BzAibsbNJdT2OYuXE09BHtQ7uZcUQeyqDGxAh9
         ijtTEWkUxVFjxT2a8JUxFzEmZu1UCqp13+8GBnex8QIEUop6CFm0g1rmgFT1xe8Z9rvp
         L9Cd6HtEa/bEQRlakSoLMEKSqQyNyEFBnp2DHfApS7N1/CJrzeXjs/wCnSoeqz9Sue4H
         Ln1fm/Kz/F7EBiV5AweuZFSF1OrOrxGwKCiZpYgpW0fI7e9O3oko7IPo5MvZ5XsTDylK
         Ev28tLVtItgcn+Om3yNbBk4UxQ6kBchkqq8XOFoyx4kz8bXCNpHCAyBAjOc3QieUf6FQ
         nFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=VChtDWH+qLD7Mp6r4cSwpKorizYtCui+hljfjCqt8Mo=;
        fh=IocJqJmOB29Kl0r32wQrUrkU7M3yAizppednyzIGpIc=;
        b=D61V4W5wgBwbM5RGGA5TXFSmiBNrcEo3ewlXRMpdpy8dDVGgU9Cf6wjLtzAHSJxT4g
         bP8f+jxWOL9616McHx4I1IOffbVJiZckKLzrKOjfA51twzbFF04XCn6QPo7M9oF63A0K
         2tdzTY7/xGdN/6oSgu0HW1FrNGYwOa0/io9PNrB2HY4LoZNKrS31Qo9HJ0zDSVxr/tpk
         dcGYOVCYbWQ5y8nVy0FFLhzIbxeXqqzK4HJc03mOBog4i/hzlFxn4s4RIVjyf/8ZDeQ2
         +O8iHBuNEDrGtIgfsPf866I7dbXtGNPYRhZdX6y9bx5mhsx7rmMy1IQ4C5IqhfJHIfpU
         1NbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ayMsSv18;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l9-20020a05600c1d0900b00412db03f18bsor2131349wms.6.2024.03.07.04.10.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 04:10:54 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ayMsSv18;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709813454; x=1710418254; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VChtDWH+qLD7Mp6r4cSwpKorizYtCui+hljfjCqt8Mo=;
        b=ayMsSv18F+fGaaazFi5wKybMWdeM4Kte4baLi3wR1F8fJMaYmk1I2iTyVZsFJ0zUXS
         Q8Ca2EihZ6hyjIdycSXerPpBbpB5tTmRBOQSy9eaV0X0HmD4BjBb+JNqpeek274GjzHn
         zu/bV4+DKERENEmO1vlx+US/QbEMaY6a2VuuQZT5+tZ3YQPoyP1NBPwy+Jzcikh6KmNF
         8zfTb5C5URNKfMzIHNZ/EylANK3zQe0C4HcjEmHeAINYgV5wiTS7sjO5GGBTghQebpCx
         6/6b/KyReBukRoPr4WuTZFHNy6+H9XeiplYUetqPA+twaC3f++e7HekgQNGM4vJ8s8JC
         zv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813454; x=1710418254;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VChtDWH+qLD7Mp6r4cSwpKorizYtCui+hljfjCqt8Mo=;
        b=ZfmJaHSdiSrkTn4YoHNvXdkEUJR1Ivp5QK7YS1ujRhDKkAQSx0IHRWh5dKw8Q0QSKJ
         musSYQhsPr6HP3uNTFmrUfUdt+CzGreGcznF+Bbe9BbqJypk/5j0GqloUCY+018Y0oeg
         HB14mF1zk+ajETmA9lH8IqD1GyvI+G0LgdUvRXHNBI+HMfp9d3J/8YbjZFa4f6czpgYz
         vcc2QpsOIjRCrpo6b0zq3gX8HbTZ76j7sYIQTNx2BxZv6cnhwvYKkwXAstT/jtUFmRoz
         oID2G4+RI6OLYLNSkKbB323Pk+eUO8QGV5KNKhzEq1u5P6X3GCZMosnkdK72H6vyX89m
         rEBg==
X-Forwarded-Encrypted: i=1; AJvYcCVm2tw/4RbHD6sC54C1fQfkVYIcydoXnTEcPBFem1hTdLViLckIyzyRJYmwlWmQUdY6FauHEH9NcM+dSBjK+iqTHKy7e3Rh
X-Gm-Message-State: AOJu0YyXaAt34n31fDX61HvzgaeWwLQzmQFSNFanJEDhjejqM9W1m/fx
	0MPPPMXLoxU/TwwgbEnmizvpm20Q/E0sRWLuzgoVCLNRNLbPT2F0UtC9Fgfcwt2uFw==
X-Google-Smtp-Source: AGHT+IG5z5IjVvtvOh5lFpn2L/IBKC3TeobA4WgnMiVUeb4EgtJ2NdEDpXSSrkWV2Mm0pxt9sAidoA==
X-Received: by 2002:a05:600c:4f51:b0:413:7f:dc4c with SMTP id m17-20020a05600c4f5100b00413007fdc4cmr2350715wmq.5.1709813453708;
        Thu, 07 Mar 2024 04:10:53 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr. [109.242.224.101])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b00413099fc248sm2535514wmo.3.2024.03.07.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:10:53 -0800 (PST)
Date: Thu, 07 Mar 2024 14:03:13 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Bcc: 
Subject: Re: [RFC PATCH-for-9.0 8/9] hw/xen/hvm: Merge xen-hvm-common.c files
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-9-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-9-philmd@linaro.org>
Message-ID: <9z8i3.ib1i46u337uu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: 3L9OvfSTHcPH

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>hw/i386/xen/xen-hvm-common.c content is target agnostic,
>and should be common to all targets. Merge both files.
>Remove the now unnecessary xen_register_framebuffer() stub.
>
>ARM targets now inherit the common xen_memory_listener.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/arm/xen_arm.c             |  24 --
> hw/i386/xen/xen-hvm-common.c | 473 -----------------------------------
> hw/xen/xen-hvm-common.c      | 458 +++++++++++++++++++++++++++++++++
> stubs/xen-hw-stub.c          |   4 -
> hw/i386/xen/meson.build      |   1 -
> 5 files changed, 458 insertions(+), 502 deletions(-)
> delete mode 100644 hw/i386/xen/xen-hvm-common.c
>
>diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>index 39dcd74d07..0ead84c9e1 100644
>--- a/hw/arm/xen_arm.c
>+++ b/hw/arm/xen_arm.c
>@@ -38,17 +38,6 @@
> #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
> OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
> 
>-const MemoryListener xen_memory_listener = {
>-    .region_add = xen_region_add,
>-    .region_del = xen_region_del,
>-    .log_start = NULL,
>-    .log_stop = NULL,
>-    .log_sync = NULL,
>-    .log_global_start = NULL,
>-    .log_global_stop = NULL,
>-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
>-};
>-
> struct XenArmState {
>     /*< private >*/
>     MachineState parent;
>@@ -136,19 +125,6 @@ void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>     return;
> }
> 
>-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>-                         bool add)
>-{
>-}
>-
>-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>-{
>-}
>-
>-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>-{
>-}


I think this is not correct, Xen on arm does not do migration and does 
not handle memory (the hardware does). We should keep the stubs here.

And not merge the physmapping/dirty mapping of i386 to the common code.

.. which I guess means xen_memory_listener cannot be shared either. 
Unless it's non-const and i386 code sets the log_* callback fields on 
init.

>-
> #ifdef CONFIG_TPM
> static void xen_enable_tpm(XenArmState *xam)
> {
>diff --git a/hw/i386/xen/xen-hvm-common.c b/hw/i386/xen/xen-hvm-common.c
>deleted file mode 100644
>index e8ef0e0c94..0000000000
>--- a/hw/i386/xen/xen-hvm-common.c
>+++ /dev/null
>@@ -1,473 +0,0 @@
>-/*
>- * Copyright (C) 2010       Citrix Ltd.
>- *
>- * This work is licensed under the terms of the GNU GPL, version 2.  See
>- * the COPYING file in the top-level directory.
>- *
>- * Contributions after 2012-01-13 are licensed under the terms of the
>- * GNU GPL, version 2 or (at your option) any later version.
>- */
>-
>-#include "qemu/osdep.h"
>-#include "qemu/range.h"
>-#include "qapi/qapi-commands-migration.h"
>-#include "exec/target_page.h"
>-#include "hw/xen/xen-hvm-common.h"
>-#include "trace.h"
>-
>-static MemoryRegion *framebuffer;
>-static bool xen_in_migration;
>-
>-static QLIST_HEAD(, XenPhysmap) xen_physmap;
>-static const XenPhysmap *log_for_dirtybit;
>-/* Buffer used by xen_sync_dirty_bitmap */
>-static unsigned long *dirty_bitmap;
>-
>-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>-                                   int page_mask)
>-{
>-    XenPhysmap *physmap = NULL;
>-
>-    start_addr &= -page_mask;
>-
>-    QLIST_FOREACH(physmap, &xen_physmap, list) {
>-        if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
>-            return physmap;
>-        }
>-    }
>-    return NULL;
>-}
>-
>-static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
>-                                       int page_mask)
>-{
>-    hwaddr addr = phys_offset & -page_mask;
>-    XenPhysmap *physmap = NULL;
>-
>-    QLIST_FOREACH(physmap, &xen_physmap, list) {
>-        if (range_covers_byte(physmap->phys_offset, physmap->size, addr)) {
>-            return physmap->start_addr + (phys_offset - physmap->phys_offset);
>-        }
>-    }
>-
>-    return phys_offset;
>-}
>-
>-#ifdef XEN_COMPAT_PHYSMAP
>-static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>-{
>-    char path[80], value[17];
>-
>-    snprintf(path, sizeof(path),
>-            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/start_addr",
>-            xen_domid, (uint64_t)physmap->phys_offset);
>-    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->start_addr);
>-    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>-        return -1;
>-    }
>-    snprintf(path, sizeof(path),
>-            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/size",
>-            xen_domid, (uint64_t)physmap->phys_offset);
>-    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->size);
>-    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>-        return -1;
>-    }
>-    if (physmap->name) {
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%"PRIx64"/name",
>-                xen_domid, (uint64_t)physmap->phys_offset);
>-        if (!xs_write(state->xenstore, 0, path,
>-                      physmap->name, strlen(physmap->name))) {
>-            return -1;
>-        }
>-    }
>-    return 0;
>-}
>-#else
>-static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>-{
>-    return 0;
>-}
>-#endif
>-
>-static int xen_add_to_physmap(XenIOState *state,
>-                              hwaddr start_addr,
>-                              ram_addr_t size,
>-                              MemoryRegion *mr,
>-                              hwaddr offset_within_region)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    unsigned long nr_pages;
>-    int rc = 0;
>-    XenPhysmap *physmap = NULL;
>-    hwaddr pfn, start_gpfn;
>-    hwaddr phys_offset = memory_region_get_ram_addr(mr);
>-    const char *mr_name;
>-
>-    if (get_physmapping(start_addr, size, page_mask)) {
>-        return 0;
>-    }
>-    if (size <= 0) {
>-        return -1;
>-    }
>-
>-    /* Xen can only handle a single dirty log region for now and we want
>-     * the linear framebuffer to be that region.
>-     * Avoid tracking any regions that is not videoram and avoid tracking
>-     * the legacy vga region. */
>-    if (mr == framebuffer && start_addr > 0xbffff) {
>-        goto go_physmap;
>-    }
>-    return -1;
>-
>-go_physmap:
>-    DPRINTF("mapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx"\n",
>-            start_addr, start_addr + size);
>-
>-    mr_name = memory_region_name(mr);
>-
>-    physmap = g_new(XenPhysmap, 1);
>-
>-    physmap->start_addr = start_addr;
>-    physmap->size = size;
>-    physmap->name = mr_name;
>-    physmap->phys_offset = phys_offset;
>-
>-    QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>-
>-    if (runstate_check(RUN_STATE_INMIGRATE)) {
>-        /* Now when we have a physmap entry we can replace a dummy mapping with
>-         * a real one of guest foreign memory. */
>-        uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
>-        assert(p && p == memory_region_get_ram_ptr(mr));
>-
>-        return 0;
>-    }
>-
>-    pfn = phys_offset >> target_page_bits;
>-    start_gpfn = start_addr >> target_page_bits;
>-    nr_pages = size >> target_page_bits;
>-    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
>-                                        start_gpfn);
>-    if (rc) {
>-        int saved_errno = errno;
>-
>-        error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
>-                     " to GFN %"HWADDR_PRIx" failed: %s",
>-                     nr_pages, pfn, start_gpfn, strerror(saved_errno));
>-        errno = saved_errno;
>-        return -1;
>-    }
>-
>-    rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
>-                                   start_addr >> target_page_bits,
>-                                   (start_addr + size - 1) >> target_page_bits,
>-                                   XEN_DOMCTL_MEM_CACHEATTR_WB);
>-    if (rc) {
>-        error_report("pin_memory_cacheattr failed: %s", strerror(errno));
>-    }
>-    return xen_save_physmap(state, physmap);
>-}
>-
>-static int xen_remove_from_physmap(XenIOState *state,
>-                                   hwaddr start_addr,
>-                                   ram_addr_t size)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    int rc = 0;
>-    XenPhysmap *physmap = NULL;
>-    hwaddr phys_offset = 0;
>-
>-    physmap = get_physmapping(start_addr, size, page_mask);
>-    if (physmap == NULL) {
>-        return -1;
>-    }
>-
>-    phys_offset = physmap->phys_offset;
>-    size = physmap->size;
>-
>-    DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
>-            "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
>-
>-    size >>= target_page_bits;
>-    start_addr >>= target_page_bits;
>-    phys_offset >>= target_page_bits;
>-    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
>-                                        phys_offset);
>-    if (rc) {
>-        int saved_errno = errno;
>-
>-        error_report("relocate_memory "RAM_ADDR_FMT" pages"
>-                     " from GFN %"HWADDR_PRIx
>-                     " to GFN %"HWADDR_PRIx" failed: %s",
>-                     size, start_addr, phys_offset, strerror(saved_errno));
>-        errno = saved_errno;
>-        return -1;
>-    }
>-
>-    QLIST_REMOVE(physmap, list);
>-    if (log_for_dirtybit == physmap) {
>-        log_for_dirtybit = NULL;
>-        g_free(dirty_bitmap);
>-        dirty_bitmap = NULL;
>-    }
>-    g_free(physmap);
>-
>-    return 0;
>-}
>-
>-static void xen_sync_dirty_bitmap(XenIOState *state,
>-                                  hwaddr start_addr,
>-                                  ram_addr_t size)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    hwaddr npages = size >> target_page_bits;
>-    const int width = sizeof(unsigned long) * 8;
>-    size_t bitmap_size = DIV_ROUND_UP(npages, width);
>-    int rc, i, j;
>-    const XenPhysmap *physmap = NULL;
>-
>-    physmap = get_physmapping(start_addr, size, page_mask);
>-    if (physmap == NULL) {
>-        /* not handled */
>-        return;
>-    }
>-
>-    if (log_for_dirtybit == NULL) {
>-        log_for_dirtybit = physmap;
>-        dirty_bitmap = g_new(unsigned long, bitmap_size);
>-    } else if (log_for_dirtybit != physmap) {
>-        /* Only one range for dirty bitmap can be tracked. */
>-        return;
>-    }
>-
>-    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
>-                              npages, dirty_bitmap);
>-    if (rc < 0) {
>-#ifndef ENODATA
>-#define ENODATA  ENOENT
>-#endif
>-        if (errno == ENODATA) {
>-            memory_region_set_dirty(framebuffer, 0, size);
>-            DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
>-                    ", 0x" HWADDR_FMT_plx "): %s\n",
>-                    start_addr, start_addr + size, strerror(errno));
>-        }
>-        return;
>-    }
>-
>-    for (i = 0; i < bitmap_size; i++) {
>-        unsigned long map = dirty_bitmap[i];
>-        while (map != 0) {
>-            j = ctzl(map);
>-            map &= ~(1ul << j);
>-            memory_region_set_dirty(framebuffer,
>-                                    (i * width + j) * page_size,
>-                                    page_size);
>-        };
>-    }
>-}
>-
>-static void xen_log_start(MemoryListener *listener,
>-                          MemoryRegionSection *section,
>-                          int old, int new)
>-{
>-    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>-
>-    if (new & ~old & (1 << DIRTY_MEMORY_VGA)) {
>-        xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>-                              int128_get64(section->size));
>-    }
>-}
>-
>-static void xen_log_stop(MemoryListener *listener, MemoryRegionSection *section,
>-                         int old, int new)
>-{
>-    if (old & ~new & (1 << DIRTY_MEMORY_VGA)) {
>-        log_for_dirtybit = NULL;
>-        g_free(dirty_bitmap);
>-        dirty_bitmap = NULL;
>-        /* Disable dirty bit tracking */
>-        xen_track_dirty_vram(xen_domid, 0, 0, NULL);
>-    }
>-}
>-
>-static void xen_log_sync(MemoryListener *listener, MemoryRegionSection *section)
>-{
>-    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>-
>-    xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>-                          int128_get64(section->size));
>-}
>-
>-static void xen_log_global_start(MemoryListener *listener)
>-{
>-    if (xen_enabled()) {
>-        xen_in_migration = true;
>-    }
>-}
>-
>-static void xen_log_global_stop(MemoryListener *listener)
>-{
>-    xen_in_migration = false;
>-}
>-
>-const MemoryListener xen_memory_listener = {
>-    .name = "xen-memory",
>-    .region_add = xen_region_add,
>-    .region_del = xen_region_del,
>-    .log_start = xen_log_start,
>-    .log_stop = xen_log_stop,
>-    .log_sync = xen_log_sync,
>-    .log_global_start = xen_log_global_start,
>-    .log_global_stop = xen_log_global_stop,
>-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
>-};
>-
>-#ifdef XEN_COMPAT_PHYSMAP
>-void xen_read_physmap(XenIOState *state)
>-{
>-    XenPhysmap *physmap = NULL;
>-    unsigned int len, num, i;
>-    char path[80], *value = NULL;
>-    char **entries = NULL;
>-
>-    QLIST_INIT(&xen_physmap);
>-
>-    snprintf(path, sizeof(path),
>-            "/local/domain/0/device-model/%d/physmap", xen_domid);
>-    entries = xs_directory(state->xenstore, 0, path, &num);
>-    if (entries == NULL)
>-        return;
>-
>-    for (i = 0; i < num; i++) {
>-        physmap = g_new(XenPhysmap, 1);
>-        physmap->phys_offset = strtoull(entries[i], NULL, 16);
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%s/start_addr",
>-                xen_domid, entries[i]);
>-        value = xs_read(state->xenstore, 0, path, &len);
>-        if (value == NULL) {
>-            g_free(physmap);
>-            continue;
>-        }
>-        physmap->start_addr = strtoull(value, NULL, 16);
>-        free(value);
>-
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%s/size",
>-                xen_domid, entries[i]);
>-        value = xs_read(state->xenstore, 0, path, &len);
>-        if (value == NULL) {
>-            g_free(physmap);
>-            continue;
>-        }
>-        physmap->size = strtoull(value, NULL, 16);
>-        free(value);
>-
>-        snprintf(path, sizeof(path),
>-                "/local/domain/0/device-model/%d/physmap/%s/name",
>-                xen_domid, entries[i]);
>-        physmap->name = xs_read(state->xenstore, 0, path, &len);
>-
>-        QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>-    }
>-    free(entries);
>-}
>-#else
>-void xen_read_physmap(XenIOState *state)
>-{
>-    QLIST_INIT(&xen_physmap);
>-}
>-#endif
>-
>-void xen_register_framebuffer(MemoryRegion *mr)
>-{
>-    framebuffer = mr;
>-}
>-
>-void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-
>-    if (unlikely(xen_in_migration)) {
>-        int rc;
>-        ram_addr_t start_pfn, nb_pages;
>-
>-        start = xen_phys_offset_to_gaddr(start, length, page_mask);
>-
>-        if (length == 0) {
>-            length = page_size;
>-        }
>-        start_pfn = start >> target_page_bits;
>-        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
>-            - start_pfn;
>-        rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
>-        if (rc) {
>-            fprintf(stderr,
>-                    "%s failed for "RAM_ADDR_FMT" ("RAM_ADDR_FMT"): %i, %s\n",
>-                    __func__, start, nb_pages, errno, strerror(errno));
>-        }
>-    }
>-}
>-
>-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>-{
>-    if (enable) {
>-        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>-    } else {
>-        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
>-    }
>-}
>-
>-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>-                         bool add)
>-{
>-    unsigned target_page_bits = qemu_target_page_bits();
>-    int page_size = qemu_target_page_size();
>-    int page_mask = -page_size;
>-    hwaddr start_addr = section->offset_within_address_space;
>-    ram_addr_t size = int128_get64(section->size);
>-    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>-    hvmmem_type_t mem_type;
>-
>-    if (!memory_region_is_ram(section->mr)) {
>-        return;
>-    }
>-
>-    if (log_dirty != add) {
>-        return;
>-    }
>-
>-    trace_xen_client_set_memory(start_addr, size, log_dirty);
>-
>-    start_addr &= page_mask;
>-    size = ROUND_UP(size, page_size);
>-
>-    if (add) {
>-        if (!memory_region_is_rom(section->mr)) {
>-            xen_add_to_physmap(state, start_addr, size,
>-                               section->mr, section->offset_within_region);
>-        } else {
>-            mem_type = HVMMEM_ram_ro;
>-            if (xen_set_mem_type(xen_domid, mem_type,
>-                                 start_addr >> target_page_bits,
>-                                 size >> target_page_bits)) {
>-                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>-                        start_addr);
>-            }
>-        }
>-    } else {
>-        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
>-            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
>-        }
>-    }
>-}
>diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>index 73fa2c414d..50ce45effc 100644
>--- a/hw/xen/xen-hvm-common.c
>+++ b/hw/xen/xen-hvm-common.c
>@@ -1,7 +1,9 @@
> #include "qemu/osdep.h"
> #include "qemu/units.h"
> #include "qemu/bitops.h"
>+#include "qemu/range.h"
> #include "qapi/error.h"
>+#include "qapi/qapi-commands-migration.h"
> #include "exec/target_page.h"
> #include "trace.h"
> 
>@@ -11,6 +13,462 @@
> #include "hw/boards.h"
> 
> MemoryRegion xen_memory;
>+static MemoryRegion *framebuffer;
>+static bool xen_in_migration;
>+
>+static QLIST_HEAD(, XenPhysmap) xen_physmap;
>+static const XenPhysmap *log_for_dirtybit;
>+/* Buffer used by xen_sync_dirty_bitmap */
>+static unsigned long *dirty_bitmap;
>+
>+static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>+                                   int page_mask)
>+{
>+    XenPhysmap *physmap = NULL;
>+
>+    start_addr &= -page_mask;
>+
>+    QLIST_FOREACH(physmap, &xen_physmap, list) {
>+        if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
>+            return physmap;
>+        }
>+    }
>+    return NULL;
>+}
>+
>+static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
>+                                       int page_mask)
>+{
>+    hwaddr addr = phys_offset & -page_mask;
>+    XenPhysmap *physmap = NULL;
>+
>+    QLIST_FOREACH(physmap, &xen_physmap, list) {
>+        if (range_covers_byte(physmap->phys_offset, physmap->size, addr)) {
>+            return physmap->start_addr + (phys_offset - physmap->phys_offset);
>+        }
>+    }
>+
>+    return phys_offset;
>+}
>+
>+#ifdef XEN_COMPAT_PHYSMAP
>+static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>+{
>+    char path[80], value[17];
>+
>+    snprintf(path, sizeof(path),
>+            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/start_addr",
>+            xen_domid, (uint64_t)physmap->phys_offset);
>+    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->start_addr);
>+    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>+        return -1;
>+    }
>+    snprintf(path, sizeof(path),
>+            "/local/domain/0/device-model/%d/physmap/%"PRIx64"/size",
>+            xen_domid, (uint64_t)physmap->phys_offset);
>+    snprintf(value, sizeof(value), "%"PRIx64, (uint64_t)physmap->size);
>+    if (!xs_write(state->xenstore, 0, path, value, strlen(value))) {
>+        return -1;
>+    }
>+    if (physmap->name) {
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%"PRIx64"/name",
>+                xen_domid, (uint64_t)physmap->phys_offset);
>+        if (!xs_write(state->xenstore, 0, path,
>+                      physmap->name, strlen(physmap->name))) {
>+            return -1;
>+        }
>+    }
>+    return 0;
>+}
>+#else
>+static int xen_save_physmap(XenIOState *state, XenPhysmap *physmap)
>+{
>+    return 0;
>+}
>+#endif
>+
>+static int xen_add_to_physmap(XenIOState *state,
>+                              hwaddr start_addr,
>+                              ram_addr_t size,
>+                              MemoryRegion *mr,
>+                              hwaddr offset_within_region)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    unsigned long nr_pages;
>+    int rc = 0;
>+    XenPhysmap *physmap = NULL;
>+    hwaddr pfn, start_gpfn;
>+    hwaddr phys_offset = memory_region_get_ram_addr(mr);
>+    const char *mr_name;
>+
>+    if (get_physmapping(start_addr, size, page_mask)) {
>+        return 0;
>+    }
>+    if (size <= 0) {
>+        return -1;
>+    }
>+
>+    /* Xen can only handle a single dirty log region for now and we want
>+     * the linear framebuffer to be that region.
>+     * Avoid tracking any regions that is not videoram and avoid tracking
>+     * the legacy vga region. */
>+    if (mr == framebuffer && start_addr > 0xbffff) {
>+        goto go_physmap;
>+    }
>+    return -1;
>+
>+go_physmap:
>+    DPRINTF("mapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx"\n",
>+            start_addr, start_addr + size);
>+
>+    mr_name = memory_region_name(mr);
>+
>+    physmap = g_new(XenPhysmap, 1);
>+
>+    physmap->start_addr = start_addr;
>+    physmap->size = size;
>+    physmap->name = mr_name;
>+    physmap->phys_offset = phys_offset;
>+
>+    QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>+
>+    if (runstate_check(RUN_STATE_INMIGRATE)) {
>+        /* Now when we have a physmap entry we can replace a dummy mapping with
>+         * a real one of guest foreign memory. */
>+        uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
>+        assert(p && p == memory_region_get_ram_ptr(mr));
>+
>+        return 0;
>+    }
>+
>+    pfn = phys_offset >> target_page_bits;
>+    start_gpfn = start_addr >> target_page_bits;
>+    nr_pages = size >> target_page_bits;
>+    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
>+                                        start_gpfn);
>+    if (rc) {
>+        int saved_errno = errno;
>+
>+        error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
>+                     " to GFN %"HWADDR_PRIx" failed: %s",
>+                     nr_pages, pfn, start_gpfn, strerror(saved_errno));
>+        errno = saved_errno;
>+        return -1;
>+    }
>+
>+    rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
>+                                   start_addr >> target_page_bits,
>+                                   (start_addr + size - 1) >> target_page_bits,
>+                                   XEN_DOMCTL_MEM_CACHEATTR_WB);
>+    if (rc) {
>+        error_report("pin_memory_cacheattr failed: %s", strerror(errno));
>+    }
>+    return xen_save_physmap(state, physmap);
>+}
>+
>+static int xen_remove_from_physmap(XenIOState *state,
>+                                   hwaddr start_addr,
>+                                   ram_addr_t size)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    int rc = 0;
>+    XenPhysmap *physmap = NULL;
>+    hwaddr phys_offset = 0;
>+
>+    physmap = get_physmapping(start_addr, size, page_mask);
>+    if (physmap == NULL) {
>+        return -1;
>+    }
>+
>+    phys_offset = physmap->phys_offset;
>+    size = physmap->size;
>+
>+    DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
>+            "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
>+
>+    size >>= target_page_bits;
>+    start_addr >>= target_page_bits;
>+    phys_offset >>= target_page_bits;
>+    rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
>+                                        phys_offset);
>+    if (rc) {
>+        int saved_errno = errno;
>+
>+        error_report("relocate_memory "RAM_ADDR_FMT" pages"
>+                     " from GFN %"HWADDR_PRIx
>+                     " to GFN %"HWADDR_PRIx" failed: %s",
>+                     size, start_addr, phys_offset, strerror(saved_errno));
>+        errno = saved_errno;
>+        return -1;
>+    }
>+
>+    QLIST_REMOVE(physmap, list);
>+    if (log_for_dirtybit == physmap) {
>+        log_for_dirtybit = NULL;
>+        g_free(dirty_bitmap);
>+        dirty_bitmap = NULL;
>+    }
>+    g_free(physmap);
>+
>+    return 0;
>+}
>+
>+static void xen_sync_dirty_bitmap(XenIOState *state,
>+                                  hwaddr start_addr,
>+                                  ram_addr_t size)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr npages = size >> target_page_bits;
>+    const int width = sizeof(unsigned long) * 8;
>+    size_t bitmap_size = DIV_ROUND_UP(npages, width);
>+    int rc, i, j;
>+    const XenPhysmap *physmap = NULL;
>+
>+    physmap = get_physmapping(start_addr, size, page_mask);
>+    if (physmap == NULL) {
>+        /* not handled */
>+        return;
>+    }
>+
>+    if (log_for_dirtybit == NULL) {
>+        log_for_dirtybit = physmap;
>+        dirty_bitmap = g_new(unsigned long, bitmap_size);
>+    } else if (log_for_dirtybit != physmap) {
>+        /* Only one range for dirty bitmap can be tracked. */
>+        return;
>+    }
>+
>+    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
>+                              npages, dirty_bitmap);
>+    if (rc < 0) {
>+#ifndef ENODATA
>+#define ENODATA  ENOENT
>+#endif
>+        if (errno == ENODATA) {
>+            memory_region_set_dirty(framebuffer, 0, size);
>+            DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
>+                    ", 0x" HWADDR_FMT_plx "): %s\n",
>+                    start_addr, start_addr + size, strerror(errno));
>+        }
>+        return;
>+    }
>+
>+    for (i = 0; i < bitmap_size; i++) {
>+        unsigned long map = dirty_bitmap[i];
>+        while (map != 0) {
>+            j = ctzl(map);
>+            map &= ~(1ul << j);
>+            memory_region_set_dirty(framebuffer,
>+                                    (i * width + j) * page_size,
>+                                    page_size);
>+        };
>+    }
>+}
>+
>+static void xen_log_start(MemoryListener *listener,
>+                          MemoryRegionSection *section,
>+                          int old, int new)
>+{
>+    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>+
>+    if (new & ~old & (1 << DIRTY_MEMORY_VGA)) {
>+        xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>+                              int128_get64(section->size));
>+    }
>+}
>+
>+static void xen_log_stop(MemoryListener *listener, MemoryRegionSection *section,
>+                         int old, int new)
>+{
>+    if (old & ~new & (1 << DIRTY_MEMORY_VGA)) {
>+        log_for_dirtybit = NULL;
>+        g_free(dirty_bitmap);
>+        dirty_bitmap = NULL;
>+        /* Disable dirty bit tracking */
>+        xen_track_dirty_vram(xen_domid, 0, 0, NULL);
>+    }
>+}
>+
>+static void xen_log_sync(MemoryListener *listener, MemoryRegionSection *section)
>+{
>+    XenIOState *state = container_of(listener, XenIOState, memory_listener);
>+
>+    xen_sync_dirty_bitmap(state, section->offset_within_address_space,
>+                          int128_get64(section->size));
>+}
>+
>+static void xen_log_global_start(MemoryListener *listener)
>+{
>+    if (xen_enabled()) {
>+        xen_in_migration = true;
>+    }
>+}
>+
>+static void xen_log_global_stop(MemoryListener *listener)
>+{
>+    xen_in_migration = false;
>+}
>+
>+const MemoryListener xen_memory_listener = {
>+    .name = "xen-memory",
>+    .region_add = xen_region_add,
>+    .region_del = xen_region_del,
>+    .log_start = xen_log_start,
>+    .log_stop = xen_log_stop,
>+    .log_sync = xen_log_sync,
>+    .log_global_start = xen_log_global_start,
>+    .log_global_stop = xen_log_global_stop,
>+    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
>+};
>+
>+#ifdef XEN_COMPAT_PHYSMAP
>+void xen_read_physmap(XenIOState *state)
>+{
>+    XenPhysmap *physmap = NULL;
>+    unsigned int len, num, i;
>+    char path[80], *value = NULL;
>+    char **entries = NULL;
>+
>+    QLIST_INIT(&xen_physmap);
>+
>+    snprintf(path, sizeof(path),
>+            "/local/domain/0/device-model/%d/physmap", xen_domid);
>+    entries = xs_directory(state->xenstore, 0, path, &num);
>+    if (entries == NULL)
>+        return;
>+
>+    for (i = 0; i < num; i++) {
>+        physmap = g_new(XenPhysmap, 1);
>+        physmap->phys_offset = strtoull(entries[i], NULL, 16);
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%s/start_addr",
>+                xen_domid, entries[i]);
>+        value = xs_read(state->xenstore, 0, path, &len);
>+        if (value == NULL) {
>+            g_free(physmap);
>+            continue;
>+        }
>+        physmap->start_addr = strtoull(value, NULL, 16);
>+        free(value);
>+
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%s/size",
>+                xen_domid, entries[i]);
>+        value = xs_read(state->xenstore, 0, path, &len);
>+        if (value == NULL) {
>+            g_free(physmap);
>+            continue;
>+        }
>+        physmap->size = strtoull(value, NULL, 16);
>+        free(value);
>+
>+        snprintf(path, sizeof(path),
>+                "/local/domain/0/device-model/%d/physmap/%s/name",
>+                xen_domid, entries[i]);
>+        physmap->name = xs_read(state->xenstore, 0, path, &len);
>+
>+        QLIST_INSERT_HEAD(&xen_physmap, physmap, list);
>+    }
>+    free(entries);
>+}
>+#else
>+void xen_read_physmap(XenIOState *state)
>+{
>+    QLIST_INIT(&xen_physmap);
>+}
>+#endif
>+
>+void xen_register_framebuffer(MemoryRegion *mr)
>+{
>+    framebuffer = mr;
>+}
>+
>+void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+
>+    if (unlikely(xen_in_migration)) {
>+        int rc;
>+        ram_addr_t start_pfn, nb_pages;
>+
>+        start = xen_phys_offset_to_gaddr(start, length, page_mask);
>+
>+        if (length == 0) {
>+            length = page_size;
>+        }
>+        start_pfn = start >> target_page_bits;
>+        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
>+            - start_pfn;
>+        rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
>+        if (rc) {
>+            fprintf(stderr,
>+                    "%s failed for "RAM_ADDR_FMT" ("RAM_ADDR_FMT"): %i, %s\n",
>+                    __func__, start, nb_pages, errno, strerror(errno));
>+        }
>+    }
>+}
>+
>+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>+{
>+    if (enable) {
>+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
>+    } else {
>+        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
>+    }
>+}
>+
>+void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>+                         bool add)
>+{
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr start_addr = section->offset_within_address_space;
>+    ram_addr_t size = int128_get64(section->size);
>+    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>+    hvmmem_type_t mem_type;
>+
>+    if (!memory_region_is_ram(section->mr)) {
>+        return;
>+    }
>+
>+    if (log_dirty != add) {
>+        return;
>+    }
>+
>+    trace_xen_client_set_memory(start_addr, size, log_dirty);
>+
>+    start_addr &= page_mask;
>+    size = ROUND_UP(size, page_size);
>+
>+    if (add) {
>+        if (!memory_region_is_rom(section->mr)) {
>+            xen_add_to_physmap(state, start_addr, size,
>+                               section->mr, section->offset_within_region);
>+        } else {
>+            mem_type = HVMMEM_ram_ro;
>+            if (xen_set_mem_type(xen_domid, mem_type,
>+                                 start_addr >> target_page_bits,
>+                                 size >> target_page_bits)) {
>+                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>+                        start_addr);
>+            }
>+        }
>+    } else {
>+        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
>+            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
>+        }
>+    }
>+}
> 
> void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>                    Error **errp)
>diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
>index 53c6a6f2a0..da8912f037 100644
>--- a/stubs/xen-hw-stub.c
>+++ b/stubs/xen-hw-stub.c
>@@ -13,7 +13,3 @@ int xen_is_pirq_msi(uint32_t msi_data)
> {
>     return 0;
> }
>-
>-void xen_register_framebuffer(MemoryRegion *mr)
>-{
>-}
>diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
>index d38759cfe4..3f0df8bc07 100644
>--- a/hw/i386/xen/meson.build
>+++ b/hw/i386/xen/meson.build
>@@ -1,7 +1,6 @@
> i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>   'xen_apic.c',
>   'xen_pvdevice.c',
>-  'xen-hvm-common.c',
> ))
> i386_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
>   'xen-hvm.c',
>-- 
>2.41.0
>
>
