Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1098562ejb;
        Thu, 7 Mar 2024 04:13:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVwAl01YdnNfDZ4oIYpGRZHDlrHBpmpKl0fz1W4JQSogCRXd4zFcPdUDbccnaOKFRTS1ATyh3aeNVc0OTTPkCQy8JYvByck
X-Received: by 2002:a05:600c:310c:b0:412:f047:4df1 with SMTP id g12-20020a05600c310c00b00412f0474df1mr4646514wmo.19.1709813593007;
        Thu, 07 Mar 2024 04:13:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709813592; cv=none;
        d=google.com; s=arc-20160816;
        b=EDFj63dj2kprKNhNVjZa+9VMCBUF3Y7Isc9KvnBG2/mCiMgniAoD79F7UgcKmvSa/g
         slpGiqZsPsOvXe2L8iBbOJXnzxM6GSm9r0f7ocNMS2agYrP+rKCGjuD7mEm1At7WmL0r
         VjZg7oX3AIH0u4pS3MsGP+TYd2tbbzRoTzQ8c4glXBpBqxwOei9RwBzQeB9/kDl3Awli
         hlvVUpG41CEM/2M9Gc7dtPU+wjE7uQz/KsKqd0uZuWkEnrQ1Jm+FsiMmMI/G4x2N5mXu
         L3fY8L2buXwSyC5oiiOtOVcI52kq1nnye8Fmev0rd0TxbGk7DkHWGnG4xwxbCHQevRkK
         Dpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=9jKcNU8mtddf0xD96048JENdNgxkV5RZUTuB2JvZ3Dk=;
        fh=fCJagYNorT0748iUxSn9k5wdqIDeagIUiBhA4MI7Wog=;
        b=n1eN9eKkZJ671SV/AH9bVpMMypxN3i9RERSmuLy6mP5iKb2gJt1oyvpaLZZ3CdVKm7
         QDuuYY3cgUpVuhgRk2lOqHgdLNx/7uCcO1IyVj+crQC8B81JFBNFY04g68HKnML61q/K
         wUYPtJ31KbPKfoUu/JWYdG46ZgetRUEYr8d3jHhYJ9EqmizDlOUYfV17+scIWhMDms3r
         jMQHd//NwghhRjg1eJ7yf32wtFYGgw9dlAqB3KLjQRUxfMY55WK3x2fpbLEjVXCCSMj8
         6/RrsMRpTrFdsqBLrmRsynraJk8EiQhGbKxKEKKG21E5vBWcFgnMqKPQaA1a/054jjvM
         +coA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W2fHOCvV;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n23-20020a05600c3b9700b00412f0bc3152sor1550535wms.7.2024.03.07.04.13.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 04:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W2fHOCvV;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709813592; x=1710418392; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9jKcNU8mtddf0xD96048JENdNgxkV5RZUTuB2JvZ3Dk=;
        b=W2fHOCvVz1m6FEkJhzWWcRL1Qv1AB9fKw05UQC1sBdLDyc6LQbzJEtisu71wbuKy2Y
         5LE3C0q1+VeoxX6DAzBekRKEDuxMNJiW1YO/FVfqzVLWS98/Qf2e8DAROPfThwB6z4kx
         3dS1/73jNpecOu8oem0mlnYPou0Sfhv9ZIxnQjL+dsbVoEclG+U3rKupti2bqesTVUlY
         ty9wU3gyq5U/QHjfrZt+c9lMC3AOaOnQX+UpVTQJpKs1FQpali5SXV2FR/77NU47lLxR
         xziiIF4sB9tyLMHhx5BGI/WF4QLR04kDfW8vLm1oU7RAoRv2ldfVEmTTJgQHv5012Otx
         QVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813592; x=1710418392;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9jKcNU8mtddf0xD96048JENdNgxkV5RZUTuB2JvZ3Dk=;
        b=oWybdy89EvXg48cGTUzmJIIlvof/i2CgKlFqai0n/3KlYj+7zQM8wbdL1QlJRgBVGc
         Qy9WtOBqjA320KnrcVqhzY2wNk4w7j9NOoo8DPgxdfUgEJyPSfFJeUPdwJkRVvbZOgj4
         SawXDVxQXCC0Jrfye7npTfNeFixmFlXsWFcNFS012quYJaB2ZWBLZwsWIbjF0V02A0Y3
         08raH82+slj8QTw5dfXN+DRWVOaRd5pa9lKIfIw5DLWkitWuwPsptrutFVLTDKvUZvE4
         vOlCKG8x48KLu75C+i12PJB4E+dr/liXo7ufc0W2uyqiTfDGuHoXreEsEFKRv/GKzhIx
         2iqg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5la4XouvepYF8GEAFYu7lXqUNxj2ojIXEy1pJTtAeK9BXMeHYqB+WK4IPjAw8uVOZB3AGApGD7hh1SBVtgf7fqCNDqHD
X-Gm-Message-State: AOJu0Yxy7CeZAtqDiNNKWFreIOHDd1TASxTc5pQs2EMnUUPx4iq5EZ7n
	/C5oVuVr21JhzuW/RZRwmgGLAYDfzqRClJubKa20ibVu2eGfexzdgQ2aBrEEciOhWg==
X-Google-Smtp-Source: AGHT+IEZSbHZqEkiGm8ptHFul1KfAi5rGSBCKI8+od071N4EROSygV23LA7LHPIPhTI5uqeuF0rSog==
X-Received: by 2002:a5d:64af:0:b0:33e:5310:820f with SMTP id m15-20020a5d64af000000b0033e5310820fmr5236522wrp.67.1709813592443;
        Thu, 07 Mar 2024 04:13:12 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d59c7000000b0033e475940fasm7826319wry.66.2024.03.07.04.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:13:12 -0800 (PST)
Date: Thu, 07 Mar 2024 14:11:03 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Bcc: 
Subject: Re: [PATCH-for-9.0 9/9] hw/xen/hvm: Inline xen_arch_set_memory()
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-10-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-10-philmd@linaro.org>
Message-ID: <9z8lx.2kzq0em3zqbp@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: a9nTh4ME6iRb

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>xen_arch_set_memory() is not arch-specific anymore. Being
>called once, inline it in xen_set_memory().
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/hw/xen/xen-hvm-common.h |   3 -
> hw/xen/xen-hvm-common.c         | 104 ++++++++++++++++----------------
> 2 files changed, 51 insertions(+), 56 deletions(-)
>
>diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
>index 536712dc83..a1b8a2783b 100644
>--- a/include/hw/xen/xen-hvm-common.h
>+++ b/include/hw/xen/xen-hvm-common.h
>@@ -99,8 +99,5 @@ void cpu_ioreq_pio(ioreq_t *req);
> 
> void xen_read_physmap(XenIOState *state);
> void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
>-void xen_arch_set_memory(XenIOState *state,
>-                         MemoryRegionSection *section,
>-                         bool add);
> 
> #endif /* HW_XEN_HVM_COMMON_H */
>diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
>index 50ce45effc..789c6b4b7a 100644
>--- a/hw/xen/xen-hvm-common.c
>+++ b/hw/xen/xen-hvm-common.c
>@@ -426,50 +426,6 @@ void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
>     }
> }
> 
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
>-
> void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>                    Error **errp)
> {
>@@ -512,20 +468,62 @@ static void xen_set_memory(struct MemoryListener *listener,
>                            bool add)
> {
>     XenIOState *state = container_of(listener, XenIOState, memory_listener);
>+    unsigned target_page_bits = qemu_target_page_bits();
>+    int page_size = qemu_target_page_size();
>+    int page_mask = -page_size;
>+    hwaddr start_addr;
>+    ram_addr_t size;
>+    bool log_dirty;
>+    hvmmem_type_t mem_type;
>+
> 
>     if (section->mr == &xen_memory) {
>         return;
>-    } else {
>-        if (add) {
>-            xen_map_memory_section(xen_domid, state->ioservid,
>-                                   section);
>-        } else {
>-            xen_unmap_memory_section(xen_domid, state->ioservid,
>-                                     section);
>-        }
>     }
> 
>-    xen_arch_set_memory(state, section, add);
>+    if (add) {
>+        xen_map_memory_section(xen_domid, state->ioservid,
>+                               section);
>+    } else {
>+        xen_unmap_memory_section(xen_domid, state->ioservid,
>+                                 section);
>+    }
>+
>+    if (!memory_region_is_ram(section->mr)) {
>+        return;
>+    }
>+
>+    log_dirty = memory_region_is_logging(section->mr, DIRTY_MEMORY_VGA);
>+
>+    if (log_dirty != add) {
>+        return;
>+    }
>+
>+    start_addr = section->offset_within_address_space;
>+    size = int128_get64(section->size);
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
> }
> 
> void xen_region_add(MemoryListener *listener,
>-- 
>2.41.0
>
>


Same observation as in previous patch, in Arm xen, qemu doesn't handle 
memory, it is only responsible for devices and their memory.
