Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868822ejg;
        Fri, 19 Jan 2024 03:14:33 -0800 (PST)
X-Received: by 2002:a05:6402:64e:b0:559:d1a5:b765 with SMTP id u14-20020a056402064e00b00559d1a5b765mr1280829edx.78.1705662872937;
        Fri, 19 Jan 2024 03:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662872; cv=none;
        d=google.com; s=arc-20160816;
        b=A8eLUSnTpnDj3uPiM8UyujvV+DHuXr2zM3Lf0bZbFtziECwAtggkyx41xWhj8a9kaZ
         aVBrhrHhBVmuIgzIRMiVnRsjCfpvEKBhHME2tNpf2FJYFDDiH4K5yHwLaxkjQZmUuCoF
         LZXO68Ov7uKjsiLQW1fFl7NefrYlb6q4eF7bISoQGp0XuHAGiQxI2/QONLS/CIrvbVKL
         //25/waPdIR1CYpOJzSTpHmgcan104WoCvoPxnckq5QV8BAZ+rIZ0Y1muiqLS5uSuyTM
         f+gcDLBTPB5FVUHTpw5IN5oJftmxmYH9ANP3IW1xDdH/GbvIAiEE+hhrdVoP76YQPL7K
         DuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oTGa3/BzlzS0hEzKw7dcC9l7LHJA830QpWxPRNzttIo=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=jLYBrDjXruCRnoWdyNX7wkzvZhqirma2pV62clMRnqFe/9aAhlSH41BTCUp43njDPn
         SuogzBIopIghnv+vAGzBJ4VKBZATK1HHF26Vp5rPki/aJ7mAknJuJOTcbSNVKTj71OQv
         jhrKsHCtD0hxj9lzI9yNn2xSeoPdjSkEGrjGcove9+FlczcQwYXWr7UMYfDa6hwKj7wt
         wDtuSCs+3I0yL1YveQDykOl13Pna7M/PKTLLjF/cg+laDZOZe3viUczypCg6N0GmzGhk
         RkrJ5H//i8psZUof4Es7WgSKYVwqRAEbgT1AfwVfyVF3YKlKQ5NVyU7fcNsZi5MYhuII
         BsBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HISQlrML;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r21-20020aa7d155000000b00559edf77265sor1144842edo.2.2024.01.19.03.14.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:32 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HISQlrML;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662872; x=1706267672; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTGa3/BzlzS0hEzKw7dcC9l7LHJA830QpWxPRNzttIo=;
        b=HISQlrMLZaUYj1LWR7FzcsAgdWXtr1AjXtiWl8jw3F09RKtozBDrYUnTiQhc3zaffh
         K5CXADOhejaQHZQfMvOLQhGsI49Jpvd8citNLbXw9JjV5zmBnZBL23Khct/vVPo7mvhc
         U0qcjb2IL44RVRChC5A1WLjkJM+Fz/v/KrQiTAfmOxQfrme/YX5Oa/T2lBCE+TiBK1P3
         jtnULn9ovKahJlMaoCKssV6/65qjlU97iJ+3m6V3A+2ltwR23nm/Ll+mN5rpviCF3+SF
         qJnE1P/2lhn8mF7RPGjs9e9LLSVUXVdY3dJZkn6p2f1XPNXmNufZjjGrkRQTznjLAKBd
         S4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662872; x=1706267672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTGa3/BzlzS0hEzKw7dcC9l7LHJA830QpWxPRNzttIo=;
        b=mmEJNKnaAHUaJz1OmqOJLHGIjQf6m46dyvAXSoIHWpn3RuAlJ4Axa3MIACBMsafhks
         16uxZD9CJ15FRgyuYhgtUPpvwUdkPmrdOpKX2XRzfGMUb7TMmmQam9DAQ/h+JoHrShYt
         eoN3QCgNQCuNeMLZ5YkvyNmziGHsvIVGMwQq3WBU0AP9YNF633XdxB2dbCkEXhwLH2mT
         NE2bpph5sDTsWvVplganFJlOu7X/5OQ1MPH7/Y8iSrmQv9VWiFwkgp8lgfPqRePbVjcy
         YAMTnlqeXisgkkfnCt0lhqzxj/03a7ysAMdD4JExI9uYMfGtriEUeZd2Ne9Hqpl5/4Ke
         m7UQ==
X-Gm-Message-State: AOJu0YzJGFnRESiaEXODs3s/j+Tn6dSSHHEy4ulcNgTz06UD03osI8FB
	rxcb44CFO6aMtZtFvo8/JlaylaO2TQu+6IRExLCamNePJYcFBV6b10arJiNS8pLi/Q==
X-Google-Smtp-Source: AGHT+IFJwYV2eU0mgnOPZgOYc+m+fobqCq6IhPou4Wj3C9UTsKQtOBkQuJyuSQx6lGanV93fM1UMig==
X-Received: by 2002:a17:906:c30d:b0:a2d:feaa:637f with SMTP id s13-20020a170906c30d00b00a2dfeaa637fmr1380599ejz.82.1705662872624;
        Fri, 19 Jan 2024 03:14:32 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:32 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/6] hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 13:14:22 +0200
Message-Id: <c5c74aadadd0da76ed2caabb22e1231d60e0bd85.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: JKQmTulbrYPC

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on tracepoints should be able to opt-in to each tracepoint and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into tracepoints.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/xen/trace-events   | 11 +++++++++
 hw/xen/xen-mapcache.c | 54 +++++++++++++++++++------------------------
 2 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 67a6c41926..1b748dba09 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -60,3 +60,14 @@ cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, ui
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
 xen_map_cache_return(void* ptr) "%p"
+xen_map_cache_init(uint64_t nr_buckets, uint64_t size) "nr_buckets = 0x%lx size %lu"
+xen_replace_cache_entry_dummy(uint64_t old_phys_addr, uint64_t new_phys_addr) "Replacing a dummy mapcache entry for 0x%"PRIx64" with 0x%"PRIx64
+xen_invalidate_map_cache_entry_unlocked_not_found(void *p) "could not find %p"
+xen_invalidate_map_cache_entry_unlocked_found(uint64_t addr, void *p) "   0x%"PRIx64" -> %p is present"
+xen_invalidate_map_cache_entry_unlocked_miss(void *buffer) "Trying to unmap address %p that is not in the mapcache"
+xen_replace_cache_entry_unlocked_could_not_update_entry(uint64_t old_phys_addr) "Unable to update a mapcache entry for 0x%"PRIx64
+xen_ram_addr_from_mapcache_not_found(void *p) "could not find %p"
+xen_ram_addr_from_mapcache_found(uint64_t addr, void *p) "   0x%"PRIx64" -> %p is present"
+xen_ram_addr_from_mapcache_not_in_cache(void *p) "Trying to find address %p that is not in the mapcache"
+xen_replace_cache_entry_unlocked(uint64_t old_phys_addr) "Trying to update an entry for 0x%"PRIx64" that is not in the mapcache"
+xen_invalidate_map_cache(uint64_t paddr_index, void *vaddr_req) "Locked DMA mapping while invalidating mapcache 0x%"PRIx64" -> %p is present"
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index f7d974677d..336c212376 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -22,16 +22,6 @@
 #include "trace.h"
 
 
-//#define MAPCACHE_DEBUG
-
-#ifdef MAPCACHE_DEBUG
-#  define DPRINTF(fmt, ...) do { \
-    fprintf(stderr, "xen_mapcache: " fmt, ## __VA_ARGS__); \
-} while (0)
-#else
-#  define DPRINTF(fmt, ...) do { } while (0)
-#endif
-
 #if HOST_LONG_BITS == 32
 #  define MCACHE_BUCKET_SHIFT 16
 #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
@@ -145,8 +135,7 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, void *opaque)
 
     size = mapcache->nr_buckets * sizeof (MapCacheEntry);
     size = (size + XC_PAGE_SIZE - 1) & ~(XC_PAGE_SIZE - 1);
-    DPRINTF("%s, nr_buckets = %lx size %lu\n", __func__,
-            mapcache->nr_buckets, size);
+    trace_xen_map_cache_init(mapcache->nr_buckets, size);
     mapcache->entry = g_malloc0(size);
 }
 
@@ -286,7 +275,9 @@ tryagain:
         test_bits(address_offset >> XC_PAGE_SHIFT,
                   test_bit_size >> XC_PAGE_SHIFT,
                   mapcache->last_entry->valid_mapping)) {
-        trace_xen_map_cache_return(mapcache->last_entry->vaddr_base + address_offset);
+        trace_xen_map_cache_return(
+            mapcache->last_entry->vaddr_base + address_offset
+        );
         return mapcache->last_entry->vaddr_base + address_offset;
     }
 
@@ -368,7 +359,9 @@ tryagain:
         QTAILQ_INSERT_HEAD(&mapcache->locked_entries, reventry, next);
     }
 
-    trace_xen_map_cache_return(mapcache->last_entry->vaddr_base + address_offset);
+    trace_xen_map_cache_return(
+        mapcache->last_entry->vaddr_base + address_offset
+    );
     return mapcache->last_entry->vaddr_base + address_offset;
 }
 
@@ -402,10 +395,10 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         }
     }
     if (!found) {
-        fprintf(stderr, "%s, could not find %p\n", __func__, ptr);
+        trace_xen_ram_addr_from_mapcache_not_found(ptr);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index,
-                    reventry->vaddr_req);
+            trace_xen_ram_addr_from_mapcache_found(reventry->paddr_index,
+                                                   reventry->vaddr_req);
         }
         abort();
         return 0;
@@ -416,7 +409,7 @@ ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to find address %p that is not in the mapcache!\n", ptr);
+        trace_xen_ram_addr_from_mapcache_not_in_cache(ptr);
         raddr = 0;
     } else {
         raddr = (reventry->paddr_index << MCACHE_BUCKET_SHIFT) +
@@ -443,9 +436,12 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
         }
     }
     if (!found) {
-        DPRINTF("%s, could not find %p\n", __func__, buffer);
+        trace_xen_invalidate_map_cache_entry_unlocked_not_found(buffer);
         QTAILQ_FOREACH(reventry, &mapcache->locked_entries, next) {
-            DPRINTF("   "HWADDR_FMT_plx" -> %p is present\n", reventry->paddr_index, reventry->vaddr_req);
+            trace_xen_invalidate_map_cache_entry_unlocked_found(
+                reventry->paddr_index,
+                reventry->vaddr_req
+            );
         }
         return;
     }
@@ -463,7 +459,7 @@ static void xen_invalidate_map_cache_entry_unlocked(uint8_t *buffer)
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to unmap address %p that is not in the mapcache!\n", buffer);
+        trace_xen_invalidate_map_cache_entry_unlocked_miss(buffer);
         return;
     }
     entry->lock--;
@@ -502,9 +498,8 @@ void xen_invalidate_map_cache(void)
         if (!reventry->dma) {
             continue;
         }
-        fprintf(stderr, "Locked DMA mapping while invalidating mapcache!"
-                " "HWADDR_FMT_plx" -> %p is present\n",
-                reventry->paddr_index, reventry->vaddr_req);
+        trace_xen_invalidate_map_cache(reventry->paddr_index,
+                                       reventry->vaddr_req);
     }
 
     for (i = 0; i < mapcache->nr_buckets; i++) {
@@ -562,24 +557,23 @@ static uint8_t *xen_replace_cache_entry_unlocked(hwaddr old_phys_addr,
         entry = entry->next;
     }
     if (!entry) {
-        DPRINTF("Trying to update an entry for "HWADDR_FMT_plx \
-                "that is not in the mapcache!\n", old_phys_addr);
+        trace_xen_replace_cache_entry_unlocked(old_phys_addr);
         return NULL;
     }
 
     address_index  = new_phys_addr >> MCACHE_BUCKET_SHIFT;
     address_offset = new_phys_addr & (MCACHE_BUCKET_SIZE - 1);
 
-    fprintf(stderr, "Replacing a dummy mapcache entry for "HWADDR_FMT_plx \
-            " with "HWADDR_FMT_plx"\n", old_phys_addr, new_phys_addr);
+    trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
 
     xen_remap_bucket(entry, entry->vaddr_base,
                      cache_size, address_index, false);
     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
                 test_bit_size >> XC_PAGE_SHIFT,
                 entry->valid_mapping)) {
-        DPRINTF("Unable to update a mapcache entry for "HWADDR_FMT_plx"!\n",
-                old_phys_addr);
+        trace_xen_replace_cache_entry_unlocked_could_not_update_entry(
+            old_phys_addr
+        );
         return NULL;
     }
 
-- 
γαῖα πυρί μιχθήτω
