Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp277099ejk;
        Mon, 29 Jan 2024 08:10:59 -0800 (PST)
X-Received: by 2002:a05:6512:110c:b0:510:15aa:ef16 with SMTP id l12-20020a056512110c00b0051015aaef16mr4180117lfg.58.1706544659023;
        Mon, 29 Jan 2024 08:10:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544658; cv=none;
        d=google.com; s=arc-20160816;
        b=Eco58eDMr6zYR0UwPeCymNj4z9nTjr6J3jKoYlhfTnS7cNX0hhHxBz5sRXhDtVvNtC
         TtnCSTe+7VDBWDNScrUHGiCvWUN1Y3xS/FH38TfkGDLKxX1ch3emFZbCFwEfO9u61bBF
         bvfqvANgQJ7qj0aROKd9207SOrxDRYQOOpTRaDgaocjWD0OAllcD2Av8C2U7BTZ6KcSQ
         /P5eSuQjEU1YYzeFHsY51J81Ti7rXdXNqxV/z1eE023/gMtYyQzMyDmKJJUGUq5Pfkim
         vI7JG/y2Nsj30tssjxjA42LrhrOtrcJXN2/05wxNCDwz47s3yaBmn82kwYjyvC3/1PES
         hcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zPokHMZSaf9YJuvbqyZkKKACp6RuNQ4cINXS/c1TsXk=;
        fh=Xb4KIKmbdaaiPlPH1bCESW8KkxUeVgZklsOwpxb0HGc=;
        b=mA5NeulnD1P4Y5Z0q2vJXfBpTEmKcbBSe3+Jl3H5x1LzW1TxY8cbfA5SZ3aC5Bxk1S
         04BKRQabwE9/xZTTGrM0HSHMFA8sZ7zmlUsTclqhClXHqMKC8JuCbf0Qf6U3vNlpfa1g
         oQ693MGpR8HDgqEZAgkcQpfjGTcso8lYVjp925BIlEQ9Oe+RJXLSXOsw37+m7oaeGnRM
         BXb3tll6bKHg8eodmUJ6bpnZ2FSoEZxk5BqtJHK6ChV7K/vVKz/t37tkMwtYaiApXHLv
         t4nBvpTYJYFY157/EfzhnOvh7OAs8lwFD8LVzaTzQX5hx/0ji+Q+9Wsh8PR0ZwQL3WvB
         QV8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OFyWuJTl;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 21-20020a05600c025500b0040ef9db636csor506811wmj.7.2024.01.29.08.10.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OFyWuJTl;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544658; x=1707149458; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPokHMZSaf9YJuvbqyZkKKACp6RuNQ4cINXS/c1TsXk=;
        b=OFyWuJTlxgz07svUXZZwpFQ/4KbeS8BXEp6MhMMOSjE1eusEHHcDRT03opccCxYXEa
         TnJ1zwRPZpgG59yZynLuOo7qyipknIx647PVcxsaLKKnOwl/z48yTZdJunjJ8kx18rnr
         5ZmG4z25p6G70PVKoaRK5Bgf/YzTf2F2P/ta6EJjWjEFKLZsg27DC4ZnGYzVRSaVtZ4N
         YFFCTIfbRlw6MFNDhF4sbF9/m+BVoKrXMTnLaUvoUuNPUgvhJKtiWfuD9zTX9g0SKS+X
         VigYr5V8m5rn5UNEJzmbEVfDtAQ6X77mniRugic0YFKcv9scN7I0GUaE6vXJJyiRjZ2k
         LIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544658; x=1707149458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPokHMZSaf9YJuvbqyZkKKACp6RuNQ4cINXS/c1TsXk=;
        b=Q4n+kkUdTqmPH7X2TPvg3OnsGOxUBObJrSEVEjNJv+Gd2iL62hK3SDxBlTB0O1orbK
         Vx6HcxCLaSG24Zltbgyk8Hq5/bP1vFIoNDQPJsgyzAAneN/wu52ckyxTI9c6UfKfm/nA
         spspAFV/6G7tpfXC8XH+F/o4DiBQ+Jb/cdNSiotUXswRtLVuAe91iNbT0HuS/fGi/79n
         kL7xdO1n8zGm30K6OvKJAEZiFs8LV6HCfzT/U/xGTeOvEa4A6w2OF+8iS10tWZc9N3mH
         F2CSDhU0qiQJVg0eJ5O6i038IZAzkKeyQvD7N5OC01+cuTetxyo7ODrqonWk7/ytqfVm
         16Bw==
X-Gm-Message-State: AOJu0Yx6aJhmcd/fzgyIbZ7Sum6ndODo6hNyo3VM/R76p/Zb0n75EWw5
	03DPq8K19wPXhRKaLUcqalq6QoN4wrKLHBetkqoxfms9EekeZZBOQeFBe9U1kkEEUA==
X-Google-Smtp-Source: AGHT+IH2u+X0jHxP0JLWVS3FK/D/Os2n9uQ6Ne/3EkPY/YogM8wr2ifOFRbEXd/GLM5pC/sG/O6R+Q==
X-Received: by 2002:a05:600c:3547:b0:40e:f5d0:8517 with SMTP id i7-20020a05600c354700b0040ef5d08517mr3106234wmq.33.1706544658554;
        Mon, 29 Jan 2024 08:10:58 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:10:58 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/6] hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
Date: Mon, 29 Jan 2024 18:09:40 +0200
Message-Id: <2fbe1fbc59078e384761c932e97cfa4276a53d75.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: d54MIuiAG6SO

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
index 67a6c41926..a65dc0e55f 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -60,3 +60,14 @@ cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, ui
 xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
 xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
 xen_map_cache_return(void* ptr) "%p"
+xen_map_cache_init(uint64_t nr_buckets, uint64_t size) "nr_buckets = 0x%"PRIx64" size 0x%"PRIx64
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
