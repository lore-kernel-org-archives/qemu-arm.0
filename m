Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161739ejc;
        Tue, 14 Nov 2023 08:32:22 -0800 (PST)
X-Received: by 2002:a17:906:45a:b0:9c7:56ee:b6e5 with SMTP id e26-20020a170906045a00b009c756eeb6e5mr7019316eja.40.1699979542612;
        Tue, 14 Nov 2023 08:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979542; cv=none;
        d=google.com; s=arc-20160816;
        b=SCQdxJECQmkJi/gTDnf6JDgLcUtXNTT3wI497Q31EgSa/47TvzFvXpDUXuMjRbHFiM
         cZjCb+9K/CLN70v8QUDVeMdEVJZZuqicm8w0/GA9CrkhhB3Khi38J3mn97vVYq+DQX9A
         ifDVjdwSptcKfgrJm/1UmDxFT1oPbm576fwkCd+d+W8bmCwB05wdEq5gfz+wqm7sDcLD
         OYkZorM3GeF1tOjfGWwdfVRhVXqh/wy1ao5jrAiGQTdE7Ty+vIpdTPPYnpEBO3zPfZED
         vOhfByKw3EPVaI4FVpL/+zAPmPxq3cFw+H3Z7nxOZEaU0eDaLPkmPDmg7T6ftUXzWNw6
         glIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=htjkOQmTZcMenhXqLaaInIEhXImv4mUPxpJWcjUwWD8=;
        fh=9pdq7NpBxJPnvyNu1sJsWepRx2HfUbiacvC5FeL2cfI=;
        b=ucEcXltg8Qr7C13EcRFCsGlcUSZAQRR96LdiURhoJbH+UNCdRYFWt+XnLTAp4dpkam
         BeeDP9Ku4ZD2d0y+ilbe1XaWoC7dUQVRMYr6/A9lsxn5dj/9kN9zN/IjQvgC7dydsP8s
         lUjjlqOrS/1/y1myPdJ7wxB1IM2lNkL4pY45nKtqi4WcvYdY8c0Oe1ks7gZyr7/S4xKs
         m66Uf4noFEcTx6tlbYSvjpxER9EaNVreKsFvEq/6lPgKoL+DB2vZIVmS7IhUuNeUlVza
         ZBFM0obkd4DooP19IBU+p0uHmCOsxUireSGfFsfI9qkSd2E0UX8KHRt+1s3TSRy+DpVT
         pvXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhjUANfw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 30-20020a170906005e00b009de23de9361sor2108956ejg.15.2023.11.14.08.32.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:32:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhjUANfw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979542; x=1700584342; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htjkOQmTZcMenhXqLaaInIEhXImv4mUPxpJWcjUwWD8=;
        b=QhjUANfwbky5T3/8pW3D3zMMj2vDmFZ8liXdEYPS3/N5bcLFvtShEE7vOIRAG0y67R
         8hyqqGXra0MxZNFNpvY5DexOUm3qkR8uKck5lVq7JR8du5kHiVnVrClolwHaoj6atvS2
         jtizyNLCzwTElV9NmjSzsKErPo022Llcd08l9TxJg9wmXGlm7yHN9Mb8DSSVhAmha4dy
         K231FZx0PYWqxHkiuMNetJ5CccngzX0AZ47mU8BgkNeMGoaj+HUc40+UzYWqqNzIhhl2
         jsQ/sN+4mWzW9cBkK77lMqY4DEkjKe+fe+ebQIVM8PTC5SxwItsak69Ial8DFY++s7Kh
         X33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979542; x=1700584342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htjkOQmTZcMenhXqLaaInIEhXImv4mUPxpJWcjUwWD8=;
        b=glGXeo27uztQRGoyl+rd2X+A6yeGDRYxnNCtURdjiiHoQ18yk9F3SmpHILOGa95ORA
         16PWHYUEhmw7dLy4Roquw005asVbyxpvrnJ4qglnAUFxnkR01y4lHjZ/ED2k+PSaRd+W
         ym2+pMwLgWg8yfYIFLJlGUSVAP8kSHsqQsHd01CCkL50EV7CRkg0vxdNcaBWIyheeaEa
         3AdIhO9ir9+8Feqt3N15mlEDkdvld2L+wMm/1qrllW2FqKDA3U5dhvT5fxcZvqauJMt6
         WVNZxT/QDkB/lQ2UEdI3ixKcSn8hMr84Bs4Q2j/DgY/cj1O2ow910KqANtsv5gXdwiAO
         CnUg==
X-Gm-Message-State: AOJu0YytfhaBcmZq2PcdeAY429BOqVWOS5zkh9vJgTjax1Oj6UPsIXrh
	X4+PvVrrnElVvQS9h3ZdTC0FvvrZ
X-Google-Smtp-Source: AGHT+IEJmFgqouqetrQ1cGRifpy+1FzLH8THhoRj/4LtsoCnWeS7Y04NxjXy02qkfonieH2Xog4T5Q==
X-Received: by 2002:a17:906:7943:b0:9d3:e48f:30d3 with SMTP id l3-20020a170906794300b009d3e48f30d3mr9901673ejo.31.1699979542369;
        Tue, 14 Nov 2023 08:32:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id c26-20020a17090603da00b009adce1c97ccsm5731084eja.53.2023.11.14.08.32.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:32:21 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 9/9] hw/xen/hvm: Inline xen_arch_set_memory()
Date: Tue, 14 Nov 2023 17:31:23 +0100
Message-ID: <20231114163123.74888-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vLBQrcjE2WXn

xen_arch_set_memory() is not arch-specific anymore. Being
called once, inline it in xen_set_memory().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h |   3 -
 hw/xen/xen-hvm-common.c         | 104 ++++++++++++++++----------------
 2 files changed, 51 insertions(+), 56 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 536712dc83..a1b8a2783b 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -99,8 +99,5 @@ void cpu_ioreq_pio(ioreq_t *req);
 
 void xen_read_physmap(XenIOState *state);
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
-void xen_arch_set_memory(XenIOState *state,
-                         MemoryRegionSection *section,
-                         bool add);
 
 #endif /* HW_XEN_HVM_COMMON_H */
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 50ce45effc..789c6b4b7a 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -426,50 +426,6 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
     }
 }
 
-void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
-                         bool add)
-{
-    unsigned target_page_bits = qemu_target_page_bits();
-    int page_size = qemu_target_page_size();
-    int page_mask = -page_size;
-    hwaddr start_addr = section->offset_within_address_space;
-    ram_addr_t size = int128_get64(section->size);
-    bool log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
-    hvmmem_type_t mem_type;
-
-    if (!memory_region_is_ram(section->mr)) {
-        return;
-    }
-
-    if (log_dirty != add) {
-        return;
-    }
-
-    trace_xen_client_set_memory(start_addr, size, log_dirty);
-
-    start_addr &= page_mask;
-    size = ROUND_UP(size, page_size);
-
-    if (add) {
-        if (!memory_region_is_rom(section->mr)) {
-            xen_add_to_physmap(state, start_addr, size,
-                               section->mr, section->offset_within_region);
-        } else {
-            mem_type = HVMMEM_ram_ro;
-            if (xen_set_mem_type(xen_domid, mem_type,
-                                 start_addr >> target_page_bits,
-                                 size >> target_page_bits)) {
-                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
-                        start_addr);
-            }
-        }
-    } else {
-        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
-            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
-        }
-    }
-}
-
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
 {
@@ -512,20 +468,62 @@ static void xen_set_memory(struct MemoryListener *listener,
                            bool add)
 {
     XenIOState *state = container_of(listener, XenIOState, memory_listener);
+    unsigned target_page_bits = qemu_target_page_bits();
+    int page_size = qemu_target_page_size();
+    int page_mask = -page_size;
+    hwaddr start_addr;
+    ram_addr_t size;
+    bool log_dirty;
+    hvmmem_type_t mem_type;
+
 
     if (section->mr == &xen_memory) {
         return;
-    } else {
-        if (add) {
-            xen_map_memory_section(xen_domid, state->ioservid,
-                                   section);
-        } else {
-            xen_unmap_memory_section(xen_domid, state->ioservid,
-                                     section);
-        }
     }
 
-    xen_arch_set_memory(state, section, add);
+    if (add) {
+        xen_map_memory_section(xen_domid, state->ioservid,
+                               section);
+    } else {
+        xen_unmap_memory_section(xen_domid, state->ioservid,
+                                 section);
+    }
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
+
+    if (log_dirty != add) {
+        return;
+    }
+
+    start_addr = section->offset_within_address_space;
+    size = int128_get64(section->size);
+    trace_xen_client_set_memory(start_addr, size, log_dirty);
+
+    start_addr &= page_mask;
+    size = ROUND_UP(size, page_size);
+
+    if (add) {
+        if (!memory_region_is_rom(section->mr)) {
+            xen_add_to_physmap(state, start_addr, size,
+                               section->mr, section->offset_within_region);
+        } else {
+            mem_type = HVMMEM_ram_ro;
+            if (xen_set_mem_type(xen_domid, mem_type,
+                                 start_addr >> target_page_bits,
+                                 size >> target_page_bits)) {
+                DPRINTF("xen_set_mem_type error, addr: "HWADDR_FMT_plx"\n",
+                        start_addr);
+            }
+        }
+    } else {
+        if (xen_remove_from_physmap(state, start_addr, size) < 0) {
+            DPRINTF("physmapping does not exist at "HWADDR_FMT_plx"\n", start_addr);
+        }
+    }
 }
 
 void xen_region_add(MemoryListener *listener,
-- 
2.41.0
