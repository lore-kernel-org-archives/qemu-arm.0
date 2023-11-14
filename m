Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161267ejc;
        Tue, 14 Nov 2023 08:31:46 -0800 (PST)
X-Received: by 2002:ac2:5de4:0:b0:507:b1e3:445a with SMTP id z4-20020ac25de4000000b00507b1e3445amr6218458lfq.29.1699979505977;
        Tue, 14 Nov 2023 08:31:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979505; cv=none;
        d=google.com; s=arc-20160816;
        b=KMKWPryDdzm9BUhBFVf+HOOa8zfmVy+zjFN8elG0sTdj4oHEpjZTSdDV27g0xgcCo+
         JXVa5rB5sTzEPkM+FpYpqfTzcSyC0HqV9pPrBpFn9FDItK66ECdixHVaTUUcY528R69l
         SuOkOi+Uqj9vTrzRw8B2KSzOQBhXRVgXNzaLD3hNYKXSqLS1HSRVYgHYlBQc45+GPA8/
         gFY1Utkmmuc4qA/rcXHNwGyuWL7moF8xYIhk9S9JCzfHVkzl1Z6rNPzViLq+nFWA4oN0
         RPQD4KtYew5wW3XyfxDOE2c6Fp3+bLFGMpRCex5gErrnIVnyNu2/OXSDwI+e6swNPY40
         S5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NT+opHNXDD+8bNoiCh7g5pdE2RHJ23alItnJp/zxUjY=;
        fh=gWEHW3TxA6a60GQ8RCwIBjY/qgn5Qdgh2FZ6pi5rSzM=;
        b=o2jJ+Kh7DOBwrdYx02mQ1BbR8kPhiBq72EC6iGYDllJVAJt3aixXsFntb/pqfB84+G
         qLzNzUN6273oKPqBAPNU2cMXbf52ajRvs1nbGU4WtG+Jh8U1Jr2CLoFoqs0cVr5SfJab
         RjPbHTx4YOMau6ChXGyD11wO0PNC5x3HMmvbZSBeLU/NyJ1sOXdFZnZr6BetIQsReG7p
         eN6EELlnmcb5SZuWLJLG4oGtLAYx0SO77CYycG9/9rRs+MciVFDVCEvQ61n6/P1pW3rl
         VSk0OplM02yyDhMYur0Dm0Px45tS8xbYilnLjxG37fFyw6NPqgOTg1wQjBEi470qMnCE
         v8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSdOdKfn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id un2-20020a170907cb8200b009dd98089a4csor1955469ejc.2.2023.11.14.08.31.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:31:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSdOdKfn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979505; x=1700584305; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT+opHNXDD+8bNoiCh7g5pdE2RHJ23alItnJp/zxUjY=;
        b=mSdOdKfnkD/Jyd6+o4OVphA3fEXMMM/OY+lSvTUieSyu0+TJ/KbVUmw5QSRL5ofTi/
         Szv4ZtlfIE2uTZelH3ys6Hv/mexGQha1Z438gIuSROdwJQlBlRAAc52ediJCVGZYN6py
         zLm2jHgGWuYypTKivmjGoDEbVmamrIpAtVgykO80u43JjNqQoMy6GuPTNBAvwrFbhdLL
         aROxlNp59bGGp8/H3SWxmMXydDqp2OkmCGltypBa1Cox6LEVDljWDooR7vRMunZEenvE
         Gt530HNZgZZY20L5wEFMPHQ5gIvpnCi3z1EF03Pv1/eHob4sOJALJzDHzkHUmWnh19SR
         BkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979505; x=1700584305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT+opHNXDD+8bNoiCh7g5pdE2RHJ23alItnJp/zxUjY=;
        b=D/H5IBJbH3nSiPP3IjA56ZFjmrizDVcvBWev6/EbmxZID8W4s0dOZONk533IHUe/t3
         A/KSuyqAnqAu7t/3LUjWtubu/EUaEZF/mVLATtYCx/LHpSviWe06M9hBuUUZ/25sOhzk
         uClaDgQ7RU05s7Z+G+7c359ARCzESiM0+GDomWSekiBkvEvDbD7Oga5OxTkdGW/4cMPI
         CY3DtourwtKuL7NHTK8a8FPIRp9A2O3FQEP9sMtmLMrnkGMBQyhtHwGKCl9gMih5itNE
         JsdNE1X7vk96dYtbzo3//2Iy42i2db8tL3IBN6p40FHgoa1+d6cN9JwCPtE9oyeCBGbS
         kQYA==
X-Gm-Message-State: AOJu0YxXAPNL56VUdmLONcKNlV3++pugsftwaOBkM9D5W2cPVJYO6eZ3
	wF3Wv0nJ9gtNBq6YX9wiZvO3yh6W
X-Google-Smtp-Source: AGHT+IFzZ/WlakywfS2j4RNnJu+KHOxUEpzbwil6pYOK3zfVQW64jjDAFiv/57u6cKngaCaBboQSjg==
X-Received: by 2002:a17:907:7b8f:b0:9da:f85a:233f with SMTP id ne15-20020a1709077b8f00b009daf85a233fmr9830571ejc.28.1699979505694;
        Tue, 14 Nov 2023 08:31:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id ay1-20020a170906d28100b009dd606ce80fsm5783743ejb.31.2023.11.14.08.31.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:31:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 3/9] hw/xen/hvm: Get target page size at runtime
Date: Tue, 14 Nov 2023 17:31:17 +0100
Message-ID: <20231114163123.74888-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fKVAcp+Z9TWK

In order to build this file once for all targets, replace:

  TARGET_PAGE_BITS -> qemu_target_page_bits()
  TARGET_PAGE_SIZE -> qemu_target_page_size()
  TARGET_PAGE_MASK -> -qemu_target_page_size()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 62 +++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 3b10425986..b64204ea94 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 
 #include "hw/xen/xen-hvm-common.h"
 #include <xen/hvm/e820.h>
+#include "exec/target_page.h"
 #include "cpu.h"
 
 static MemoryRegion ram_640k, ram_lo, ram_hi;
@@ -247,6 +248,9 @@ static int xen_add_to_physmap(XenIOState *state,
                               MemoryRegion *mr,
                               hwaddr offset_within_region)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     unsigned long nr_pages;
     int rc = 0;
     XenPhysmap *physmap = NULL;
@@ -254,7 +258,7 @@ static int xen_add_to_physmap(XenIOState *state,
     hwaddr phys_offset = memory_region_get_ram_addr(mr);
     const char *mr_name;
 
-    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
+    if (get_physmapping(start_addr, size, page_mask)) {
         return 0;
     }
     if (size <= 0) {
@@ -294,9 +298,9 @@ go_physmap:
         return 0;
     }
 
-    pfn = phys_offset >> TARGET_PAGE_BITS;
-    start_gpfn = start_addr >> TARGET_PAGE_BITS;
-    nr_pages = size >> TARGET_PAGE_BITS;
+    pfn = phys_offset >> target_page_bits;
+    start_gpfn = start_addr >> target_page_bits;
+    nr_pages = size >> target_page_bits;
     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, nr_pages, pfn,
                                         start_gpfn);
     if (rc) {
@@ -310,8 +314,8 @@ go_physmap:
     }
 
     rc = xendevicemodel_pin_memory_cacheattr(xen_dmod, xen_domid,
-                                   start_addr >> TARGET_PAGE_BITS,
-                                   (start_addr + size - 1) >> TARGET_PAGE_BITS,
+                                   start_addr >> target_page_bits,
+                                   (start_addr + size - 1) >> target_page_bits,
                                    XEN_DOMCTL_MEM_CACHEATTR_WB);
     if (rc) {
         error_report("pin_memory_cacheattr failed: %s", strerror(errno));
@@ -323,11 +327,14 @@ static int xen_remove_from_physmap(XenIOState *state,
                                    hwaddr start_addr,
                                    ram_addr_t size)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     int rc = 0;
     XenPhysmap *physmap = NULL;
     hwaddr phys_offset = 0;
 
-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
+    physmap = get_physmapping(start_addr, size, page_mask);
     if (physmap == NULL) {
         return -1;
     }
@@ -338,9 +345,9 @@ static int xen_remove_from_physmap(XenIOState *state,
     DPRINTF("unmapping vram to %"HWADDR_PRIx" - %"HWADDR_PRIx", at "
             "%"HWADDR_PRIx"\n", start_addr, start_addr + size, phys_offset);
 
-    size >>= TARGET_PAGE_BITS;
-    start_addr >>= TARGET_PAGE_BITS;
-    phys_offset >>= TARGET_PAGE_BITS;
+    size >>= target_page_bits;
+    start_addr >>= target_page_bits;
+    phys_offset >>= target_page_bits;
     rc = xendevicemodel_relocate_memory(xen_dmod, xen_domid, size, start_addr,
                                         phys_offset);
     if (rc) {
@@ -369,13 +376,16 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
                                   hwaddr start_addr,
                                   ram_addr_t size)
 {
-    hwaddr npages = size >> TARGET_PAGE_BITS;
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
+    hwaddr npages = size >> target_page_bits;
     const int width = sizeof(unsigned long) * 8;
     size_t bitmap_size = DIV_ROUND_UP(npages, width);
     int rc, i, j;
     const XenPhysmap *physmap = NULL;
 
-    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
+    physmap = get_physmapping(start_addr, size, page_mask);
     if (physmap == NULL) {
         /* not handled */
         return;
@@ -389,7 +399,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
         return;
     }
 
-    rc = xen_track_dirty_vram(xen_domid, start_addr >> TARGET_PAGE_BITS,
+    rc = xen_track_dirty_vram(xen_domid, start_addr >> target_page_bits,
                               npages, dirty_bitmap);
     if (rc < 0) {
 #ifndef ENODATA
@@ -410,8 +420,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
             j = ctzl(map);
             map &= ~(1ul << j);
             memory_region_set_dirty(framebuffer,
-                                    (i * width + j) * TARGET_PAGE_SIZE,
-                                    TARGET_PAGE_SIZE);
+                                    (i * width + j) * page_size, page_size);
         };
     }
 }
@@ -631,17 +640,21 @@ void xen_register_framebuffer(MemoryRegion *mr)
 
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
+
     if (unlikely(xen_in_migration)) {
         int rc;
         ram_addr_t start_pfn, nb_pages;
 
-        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
+        start = xen_phys_offset_to_gaddr(start, length, page_mask);
 
         if (length == 0) {
-            length = TARGET_PAGE_SIZE;
+            length = page_size;
         }
-        start_pfn = start >> TARGET_PAGE_BITS;
-        nb_pages = ((start + length + TARGET_PAGE_SIZE - 1) >> TARGET_PAGE_BITS)
+        start_pfn = start >> target_page_bits;
+        nb_pages = ((start + length + page_size - 1) >> target_page_bits)
             - start_pfn;
         rc = xen_modified_memory(xen_domid, start_pfn, nb_pages);
         if (rc) {
@@ -664,6 +677,9 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
                          bool add)
 {
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
     hwaddr start_addr = section->offset_within_address_space;
     ram_addr_t size = int128_get64(section->size);
     bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
@@ -679,8 +695,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
 
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
-    start_addr &= TARGET_PAGE_MASK;
-    size = ROUND_UP(size, TARGET_PAGE_SIZE);
+    start_addr &= page_mask;
+    size = ROUND_UP(size, page_size);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
@@ -689,8 +705,8 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
         } else {
             mem_type = HVMMEM_ram_ro;
             if (xen_set_mem_type(xen_domid, mem_type,
-                                 start_addr >> TARGET_PAGE_BITS,
-                                 size >> TARGET_PAGE_BITS)) {
+                                 start_addr >> target_page_bits,
+                                 size >> target_page_bits)) {
                 DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
                         start_addr);
             }
-- 
2.41.0
