Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1087994ejb;
        Thu, 7 Mar 2024 03:54:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSsNFB54PccdhQauUV+lHmrpr4pqofWuM9RcYm7cv92kIB3UFO80l8gsaeu+LDF+yJYneJpeL8kBXrN9Qn8vAIhqWaeSLL
X-Received: by 2002:ac2:555e:0:b0:513:26e7:440c with SMTP id l30-20020ac2555e000000b0051326e7440cmr1162402lfk.61.1709812469909;
        Thu, 07 Mar 2024 03:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709812469; cv=none;
        d=google.com; s=arc-20160816;
        b=yY0XBugJIIO6dxtjt4AoHcf27lVWZW1klq/ORyQbfDS4u+L6XVmWmmxPYcl+Cit5d4
         0tNbeIOOE5H0bL60M0c91jr71T7xf3IsvU95slrp6wzCDlqfHt6Gqyr7f81aBzR3DLZ4
         frxiVuqvgWe7g6zTVVrHhoeqyf5ifsYy/gCU74hqNrdiJdUMOslKtkcqKTfu5uL6osI+
         GD+J5HPbK0Y7QuI5ApB/AxEWHbCdKfdIoBedIITK3/GK11MA2T9z1omucd+HyBpoING6
         qzURysH6m+GqUgme3GrjAZh6eND1qTEQAgNvSpPaWUw1HUHA1r3fWWPvjBFJZsDYMLkY
         FnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=D4wGmyvUQ61mLBJ031BInsy1nVuxKAhaid0zefzzgGc=;
        fh=UQiUUdN6tGIYFYNRNOd68sadaryBOZhK+SvWTFZrnpE=;
        b=bJXyFER14E8aoy9oHwmbcs3xZMHOsqdEG0oQapjZ1qcdIfHRQTXr/PAJ1jP/2sGN4y
         QivKOmriydvSdCDcBeFhR7mM6LcZtgdwZW4ZRZrIuyKfHxJtp0szbi9cv9q7SuIIRr1D
         Mplp/tOfyvkexCwEFkMJjCVf3E5khZ9bjzH20N8jKQANONZ41gyHdKFJ2pjoJdjtVQ+f
         dlOEbfaDQMKlC51Y1NF2MdfuvO5qiN3w/NlBQu1KGvAJXASLC+LtXniISpPMvac4HnRw
         RXlTg4IkKPhjzXBT+Poz/zpstPZYrdg6L/zrRu6Sy0xc2o6he8nI5O3/Ilzel8ZhisYl
         pTYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKnOPS3y;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z25-20020a195e59000000b00513432ac58asor2847422lfi.17.2024.03.07.03.54.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 03:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AKnOPS3y;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812469; x=1710417269; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D4wGmyvUQ61mLBJ031BInsy1nVuxKAhaid0zefzzgGc=;
        b=AKnOPS3yAQXAA6hpSrzT4KmDvN5/IFOaK+svXPj8eqk2Q8DotHOVP7ZnflbHSTc5Tg
         4YMLKja5IUZCQGIa5qkZ/A7z17QjeMSMxRcBgh4jHTMhnK2MtG6C9WZmxa7vxpwFW5UF
         ggZYHAhkuP3XUkge04PyOUvz41ZZEB1NedCap5k0iP5pxHlDcE0/mM0BVeBmjr6zRjA3
         6M0WySbO3xu0Up9FCQfMEHSXhoJ3ZQuw1SVEjVJRNViRV10dO5KJscIYg6OPtigTONiH
         tGM9FEpvkSbLzm5/iv+XyEHX94Mf0JMUC6WHNOOAo2fnCq/cQHUZrD6Abhv8GRfv7Bvq
         900g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812469; x=1710417269;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4wGmyvUQ61mLBJ031BInsy1nVuxKAhaid0zefzzgGc=;
        b=nYOIUNqkvl8fFt+J6uGRDiMhBGnm968lD70aKx7biVpp2YWqCk5I8YdsxaAMM9/zJN
         zY2OhikvvnXoGWf/lSAjCeysPUQxmPepn4AMw0RHhY6WRrRYpJVaHnjm5zho5Zw/2oNo
         j+7th8D5UklNP1ldJ1YFqB+3DjeIQMX1NCA+7V7zyNlzpS/loYqiUDLbgmnewsXVnzPE
         8Yh+T41+WZbdMLYMBOTbsB/g3k9tIyIYFTD3nCMXhn0WVsbD8HSokFXP/ayXMpv8qOeD
         gn0twR5G+eKgBFbrPbcwO9llMln1bKwJClCzD4PFNXMFqxLXhFlt/zmiZyojuwCahJ9H
         4XNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ0nKmZ+7j/SeIvD9Q4PguF021vIHiR45XcouDRtfJKrBWOZVnnlsf9YTBnEtT9Dp/bOVXH+//0ZWHy/DNSrT2+dzjlXym
X-Gm-Message-State: AOJu0Yx6W0rkrMN8DOuojMmqJAAfmFaEOlqP+jRU/4G4mOsRfA3FXlM4
	Z28UEUrYdMgf1vhPWi+THqtrKU4fbkqlpZloUFizCfqcXosvNwaJ8uxMAiqDQwMR+Q==
X-Google-Smtp-Source: AGHT+IHz5Cvig/z02xR0HuA2J9PkQo8Dyofphkh0RFYr8J9DsKohKy9DtwP9NgjeqhuAqzXFKS1QlQ==
X-Received: by 2002:a2e:9ad6:0:b0:2d3:e236:ddc2 with SMTP id p22-20020a2e9ad6000000b002d3e236ddc2mr1155474ljj.30.1709812469290;
        Thu, 07 Mar 2024 03:54:29 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr. [109.242.224.101])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d6309000000b0033e122a9a91sm19368088wru.105.2024.03.07.03.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:54:29 -0800 (PST)
Date: Thu, 07 Mar 2024 13:49:11 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 3/9] hw/xen/hvm: Get target page size at runtime
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-4-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-4-philmd@linaro.org>
Message-ID: <9z7qq.40e122bkrid@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: goHGOlVv+mCB

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>In order to build this file once for all targets, replace:
>
>  TARGET_PAGE_BITS -> qemu_target_page_bits()
>  TARGET_PAGE_SIZE -> qemu_target_page_size()
>  TARGET_PAGE_MASK -> -qemu_target_page_size()
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 62 +++++++++++++++++++++++++++----------------
> 1 file changed, 39 insertions(+), 23 deletions(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 3b10425986..b64204ea94 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -22,6 +22,7 @@
> 
> #include "hw/xen/xen-hvm-common.h"
> #include <xen/hvm/e820.h>
>+#include "exec/target_page.h"
> #include "cpu.h"
> 
> static MemoryRegion ram_640k, ram_lo, ram_hi;
>@@ -247,6 +248,9 @@ static int xen_add_to_physmap(XenIOState *state,
>                               MemoryRegion *mr,
>                               hwaddr offset_within_region)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>     unsigned long nr_pages;
>     int rc = 0;
>     XenPhysmap *physmap = NULL;
>@@ -254,7 +258,7 @@ static int xen_add_to_physmap(XenIOState *state,
>     hwaddr phys_offset = memory_region_get_ram_addr(mr);
>     const char *mr_name;
> 
>-    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
>+    if (get_physmapping(start_addr, size, page_mask)) {
>         return 0;
>     }
>     if (size <= 0) {
>@@ -294,9 +298,9 @@ go_physmap:
>         return 0;
>     }
> 
>-    pfn = phys_offset >> TARGET_PAGE_BITS;
>-    start_gpfn = start_addr >> TARGET_PAGE_BITS;
>-    nr_pages = size >> TARGET_PAGE_BITS;
>+    pfn = phys_offset >> target_page_bits;
>+    start_gpfn = start_addr >> target_page_bits;
>+    nr_pages = size >> target_page_bits;
>     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
>                                         start_gpfn);
>     if (rc) {
>@@ -310,8 +314,8 @@ go_physmap:
>     }
> 
>     rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
>-                                   start_addr >> TARGET_PAGE_BITS,
>-                                   (start_addr + size - 1) >> TARGET_PAGE_BITS,
>+                                   start_addr >> target_page_bits,
>+                                   (start_addr + size - 1) >> target_page_bits,
>                                    XEN_DOMCTL_MEM_CACHEATTR_WB);
>     if (rc) {
>         error_report("pin_memory_cacheattr failed: %s", strerror(errno));
>@@ -323,11 +327,14 @@ static int xen_remove_from_physmap(XenIOState *state,
>                                    hwaddr start_addr,
>                                    ram_addr_t size)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>     int rc = 0;
>     XenPhysmap *physmap = NULL;
>     hwaddr phys_offset = 0;
> 
>-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>+    physmap = get_physmapping(start_addr, size, page_mask);
>     if (physmap == NULL) {
>         return -1;
>     }
>@@ -338,9 +345,9 @@ static int xen_remove_from_physmap(XenIOState *state,
>     DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
>             "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
> 
>-    size >>= TARGET_PAGE_BITS;
>-    start_addr >>= TARGET_PAGE_BITS;
>-    phys_offset >>= TARGET_PAGE_BITS;
>+    size >>= target_page_bits;
>+    start_addr >>= target_page_bits;
>+    phys_offset >>= target_page_bits;
>     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
>                                         phys_offset);
>     if (rc) {
>@@ -369,13 +376,16 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>                                   hwaddr start_addr,
>                                   ram_addr_t size)
> {
>-    hwaddr npages = size >> TARGET_PAGE_BITS;
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr npages = size >> target_page_bits;
>     const int width = sizeof(unsigned long) * 8;
>     size_t bitmap_size = DIV_ROUND_UP(npages, width);
>     int rc, i, j;
>     const XenPhysmap *physmap = NULL;
> 
>-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>+    physmap = get_physmapping(start_addr, size, page_mask);
>     if (physmap == NULL) {
>         /* not handled */
>         return;
>@@ -389,7 +399,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>         return;
>     }
> 
>-    rc = xen_track_dirty_vram(xen_domid, start_addr >> TARGET_PAGE_BITS,
>+    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
>                               npages, dirty_bitmap);
>     if (rc < 0) {
> #ifndef ENODATA
>@@ -410,8 +420,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>             j = ctzl(map);
>             map &= ~(1ul << j);
>             memory_region_set_dirty(framebuffer,
>-                                    (i * width + j) * TARGET_PAGE_SIZE,
>-                                    TARGET_PAGE_SIZE);
>+                                    (i * width + j) * page_size, page_size);
>         };
>     }
> }
>@@ -631,17 +640,21 @@ void xen_register_framebuffer(MemoryRegion *mr)
> 
> void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+
>     if (unlikely(xen_in_migration)) {
>         int rc;
>         ram_addr_t start_pfn, nb_pages;
> 
>-        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
>+        start = xen_phys_offset_to_gaddr(start, length, page_mask);
> 
>         if (length == 0) {
>-            length = TARGET_PAGE_SIZE;
>+            length = page_size;
>         }
>-        start_pfn = start >> TARGET_PAGE_BITS;
>-        nb_pages = ((start + length + TARGET_PAGE_SIZE - 1) >> TARGET_PAGE_BITS)
>+        start_pfn = start >> target_page_bits;
>+        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
>             - start_pfn;
>         rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
>         if (rc) {
>@@ -664,6 +677,9 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>                          bool add)
> {
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>     hwaddr start_addr = section->offset_within_address_space;
>     ram_addr_t size = int128_get64(section->size);
>     bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>@@ -679,8 +695,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
> 
>     trace_xen_client_set_memory(start_addr, size, log_dirty);
> 
>-    start_addr &= TARGET_PAGE_MASK;
>-    size = ROUND_UP(size, TARGET_PAGE_SIZE);
>+    start_addr &= page_mask;
>+    size = ROUND_UP(size, page_size);
> 
>     if (add) {
>         if (!memory_region_is_rom(section->mr)) {
>@@ -689,8 +705,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
>         } else {
>             mem_type = HVMMEM_ram_ro;
>             if (xen_set_mem_type(xen_domid, mem_type,
>-                                 start_addr >> TARGET_PAGE_BITS,
>-                                 size >> TARGET_PAGE_BITS)) {
>+                                 start_addr >> target_page_bits,
>+                                 size >> target_page_bits)) {
>                 DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
>                         start_addr);
>             }
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
