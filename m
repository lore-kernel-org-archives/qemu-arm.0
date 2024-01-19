Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868846ejg;
        Fri, 19 Jan 2024 03:14:35 -0800 (PST)
X-Received: by 2002:a17:906:2bc1:b0:a2e:9169:ce7d with SMTP id n1-20020a1709062bc100b00a2e9169ce7dmr1294725ejg.145.1705662875547;
        Fri, 19 Jan 2024 03:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662875; cv=none;
        d=google.com; s=arc-20160816;
        b=dYJ8zusbKI8zSR2GnC0yZHAhkcpf1z48UPuHW4zlk+ylw72N1PZt/bYHjbjXKDhoDq
         ign+2V3LiVjJBuYW8uqK7uyzj37LN4MIQUS8x+Cv5TJtW+O7WDoEOBFpJR1P1La0DwSz
         8XK6LwTJOp+ulGZo6dTNpFkurTx+ZoogBLf6vJnBMsySZ2NIwujU886TQN21bDukddFI
         M0EY4OMnilkzgB0AqTDJf4phqYkmNmp/AuNhJ7CoXJj+COSYur3h5t8e+cxVWQhN3pl9
         87NzpZnRE69fu1iOQNf0UzFYMeL2cIPDxx5mKGcaercQMdDA/YFhbyUAwGB9+Yza/WRu
         u8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=KdQ4YqLWWfBoAB6OTjKt70O56QSZ6srEbw0toq2465pdHp/UERRz4ESrGVaS5aZ8cV
         OkZ8jCA8JZnG7e3d05gmjtA2fUzGnGi7GY2JDTW77d36adHkA0Hoe/YOeY4vAyI4eWlF
         6B2XIVoVBChEqjsmF22MdGMQReOgQCGJBUj4xtL0XmnqxDOX53MMLCG7g/hK3HRkvJRZ
         lpAPQ6+nCw7Xr+ygBglZ4IKB1y1iPAvWObrwgFSdBGitWYDGmuag36X5mTtCJG9IZpBB
         h1y5GiaidJ8rFdUGbV/S18CYUQFWvS/F2iBbUTPwfZYO3Sc89vMwHmknizgaYrcsDMAE
         ee2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrrB8iod;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6-20020a170906018600b00a2d19613457sor23030ejb.8.2024.01.19.03.14.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrrB8iod;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662875; x=1706267675; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        b=FrrB8iodOPP+egKFwv+8+FmomfN/hbEbKLiuy5tHTaQbfN6q6QtLm/19JlOCIF0Skz
         J/G7l0goUPaJZJp2GhZ6KDPA1pWAt1VKvbLkUUN0vS0RxzL+8Cxs9U2LVijyIx/dSXD0
         OTjwBhrXuq33c+/uMGd+AVOUfZJ5qDHVU6qtu7+heacET/5EyogCGcPe42lNoxa5i9Zj
         PXMTwWPPR+yg54jG7V0qloyNK3ZmMQ0b+WxLBTwZwR4eT9qsIUWJj+14D3IcvV+OU1gM
         37xAmDBDaIZNmnMPUVrXCJOglgmpWbH2gdln8Nv/tBL1Ab1yf6YIALEq9L1SqmvxY1I/
         SmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662875; x=1706267675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        b=dctm0nDwVmpBfJ4hpE6n+vT57G2uWnp0CkdGsr0I2RzVIqcmpi32yIJr0Rwd9ZCkV7
         UndAT4heELqKLAxEm6Vsx6kWZ1AHL5MIDMzrwTssyrmnUVcKODOUWzMU6hIh6kNOLWAI
         X8yJtiMBYMYHIIL5Hcnd8pvI5SvDueo61Sm1ZRyyEAltxyC4lBpLqB4mrokEM7MinLMe
         ELEfhsTcIEpkD1wkqeVlslcs6M/u7VGV46JWep2muHGIlaHdaqNwr5ubHeTDEPR2j/uJ
         jNgTYE9sT6mXQZuE+Bbhwcam3a4zM3TmNNhPlFswqtlIYATuLJNYIdnCRrRKCdLhYdAd
         5NaA==
X-Gm-Message-State: AOJu0YwrcJsw26EV4kLm8DX2ehOZEf2BXoQnYG+SG2nzwUGnkNZE2M+F
	G/jID+Mx+RRcnBE3uCbozp3cetDu6SN6NHNl6CV9ZUFJ/2iV6kdL9TEyvLPZS77BbQ==
X-Google-Smtp-Source: AGHT+IF4AKB3i0EE93JVm2SSXHrrPDR51ugIZukdaXM3CyfR1H0BSql7r9j8TEJPqMkdOzhg3JEZ+A==
X-Received: by 2002:a17:906:5592:b0:a2c:2185:6dfe with SMTP id y18-20020a170906559200b00a2c21856dfemr1442314ejp.105.1705662875311;
        Fri, 19 Jan 2024 03:14:35 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:35 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/6] hw/xen: convert stderr prints to error/warn reports
Date: Fri, 19 Jan 2024 13:14:24 +0200
Message-Id: <a741c525845c8df4088e358b1c255828a8d3d956.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: MbkXDYhqYPMV

According to the QEMU Coding Style document:

> Do not use printf(), fprintf() or monitor_printf(). Instead, use
> error_report() or error_vreport() from error-report.h. This ensures the
> error is reported in the right place (current monitor or stderr), and in
> a uniform format.
> Use error_printf() & friends to print additional information.

This commit changes fprintfs that report warnings and errors to the
appropriate report functions.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/xen/xen-hvm-common.c | 12 ++++++------
 hw/xen/xen-mapcache.c   |  5 ++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 05a29c6f11..baa1adb9f2 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -20,8 +20,8 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
         /* RAM already populated in Xen */
-        fprintf(stderr, "%s: do not alloc "RAM_ADDR_FMT
-                " bytes of ram at "RAM_ADDR_FMT" when runstate is INMIGRATE\n",
+        warn_report("%s: do not alloc "RAM_ADDR_FMT
+                " bytes of ram at "RAM_ADDR_FMT" when runstate is INMIGRATE",
                 __func__, size, ram_addr);
         return;
     }
@@ -552,9 +552,9 @@ static void cpu_handle_ioreq(void *opaque)
         req->data = copy.data;
 
         if (req->state != STATE_IOREQ_INPROCESS) {
-            fprintf(stderr, "Badness in I/O request ... not in service?!: "
+            warn_report("Badness in I/O request ... not in service?!: "
                     "%x, ptr: %x, port: %"PRIx64", "
-                    "data: %"PRIx64", count: %u, size: %u, type: %u\n",
+                    "data: %"PRIx64", count: %u, size: %u, type: %u",
                     req->state, req->data_is_ptr, req->addr,
                     req->data, req->count, req->size, req->type);
             destroy_hvm_domain(false);
@@ -758,9 +758,9 @@ void xen_shutdown_fatal_error(const char *fmt, ...)
     va_list ap;
 
     va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
+    error_vreport(fmt, ap);
     va_end(ap);
-    fprintf(stderr, "Will destroy the domain.\n");
+    error_report("Will destroy the domain.");
     /* destroy the domain */
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
 }
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 336c212376..4f956d048e 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -347,9 +347,8 @@ tryagain:
         MapCacheRev *reventry = g_new0(MapCacheRev, 1);
         entry->lock++;
         if (entry->lock == 0) {
-            fprintf(stderr,
-                    "mapcache entry lock overflow: "HWADDR_FMT_plx" -> %p\n",
-                    entry->paddr_index, entry->vaddr_base);
+            error_report("mapcache entry lock overflow: "HWADDR_FMT_plx" -> %p",
+                         entry->paddr_index, entry->vaddr_base);
             abort();
         }
         reventry->dma = dma;
-- 
γαῖα πυρί μιχθήτω
