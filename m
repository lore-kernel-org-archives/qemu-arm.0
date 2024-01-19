Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp937537ejg;
        Fri, 19 Jan 2024 05:24:59 -0800 (PST)
X-Received: by 2002:a2e:91c6:0:b0:2cd:24e9:731c with SMTP id u6-20020a2e91c6000000b002cd24e9731cmr1399270ljg.46.1705670699134;
        Fri, 19 Jan 2024 05:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705670699; cv=none;
        d=google.com; s=arc-20160816;
        b=A61yHm9fzpoBkqGxsyY4hQOrV1Q21r5E2tIY27iC9Z/gAqsaLHaZgB7K6vorPl5nMw
         2lM+RZO1Ide+UMeO6lOPF/tJjEx9bXpBMTueNDXOYx1EkIkwRTu7csx20oUTXElsqp19
         L0XsRYxeQB+z0Wb1i+N3N7qx9pmPw5qc5itXxx9KC8weF4HbYQvWQ/jNHxXbhRLZjUDL
         De9GCRP8VsklB5s6kNlZVBC7x1vjpypphswvrGtw0DJ0y0NQ0EUFs3NDF2nczm59sqKb
         SVRrYissTL6Q0ifTpoWJTWRdoabzWMiD8ShQBTl7ShyfqbGaMUm67ZgWJ7/uKeFqSPMq
         R3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        fh=lJw5UzM6ifQszfT4HEcQjHZ3kAdCqWnl2xV8CLz9k2o=;
        b=bI6hHisBK17ff04hl2bQ2pp5s/CowQeZL71+Lg8fSi8ZgfQ9t3Y64LjMnBlUPkhSvz
         7sW/I/MitYOr+TBV6tCaEtMoRl4xEaUrdeazhZzixtwT3qpLyHZ3XfmuyLjxWZTmm57t
         6c6T6HNPnWx5YW82/lDX2LFziwmPIUKm9mkL00C+fAhNBE0rIJym6bwldBxp2uQx0QTR
         FNoIClh8qrs3m9w+znWbD3gSJEerAGN/GfF7efhvEz3dTpaHfRrJDmuj/1pFbBvhyJmh
         IuIF+LGErkw3R3radDy2tc3iLVre2DDvOB+SOiLYmLiuXg7TjxUw95hAlgTB8ndHNJEK
         3ikg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJFffjt9;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i25-20020aa7c719000000b0055a73d102e2sor83989edq.3.2024.01.19.05.24.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 05:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJFffjt9;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670699; x=1706275499; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        b=RJFffjt9XAfd/pIoKUlHYSjgYG3lMxrQLE2SyrKMUEkep2ECMzAOci95/7gfQxsQmE
         mdgv6fIGtgtlI5y+O0qvv57csS4rMI0J4UFp9S5qNn7ZfLOax9uFMvRX6ye8nRsncNFI
         TOmy5V6JLZmUn08EP4mnOJX22h66yVnwz3HWLhkSU0OVaIi2sSypZFed0cSqCiyokk/z
         WQ5byhIcR1+gIFEgKB0uKo7laYyfIOvWB+WHa1Y97LmY6DxBa5QQiSZv/3TGboPpjoHH
         AHtZzmbcGhCYNnMIxeN7QSU6GqcpYA7esj+uKXqgwMfdzb18CO+DDGAdVP23LrKSZlui
         8QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670699; x=1706275499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        b=QvnpUyPV2WVMO2aNSaZd/Atlyuq5Ejm7/qMcDL3Bw/yyQaI4qssByIOPrXvVOCwluV
         Tiu6w+/qM8jeWFt47BAvin5BM3MN7qlyXCh/1WBg6iyn+tVDciAFIuKi+KOFVXSYHizF
         Msv7x/e/edtBVZWHd6MP11sCHU9snY6ARV3dm/nFcYjCC+k7F1RZAALGfh+OGcBYLyJD
         ttxKNO6d8LR+XqM56dy1qXgXOzqho0BQ3sYZdCLoub8k1lr1IhYQcblah8/iEY51qzAk
         UWBrxXXtbp0HiWFgYsqAnltYXVr3W13ZOy92YXSvyqqy1aCpuBOCzuq2floDUUHfsHh6
         7XNw==
X-Gm-Message-State: AOJu0YwZ+9GaxI1Y3X6t0YHUFIAzZ2iVn6rbbXiCysc28X+ddl82CNmS
	NWD1SQP2GggT9iswxqzPAQK7QSaZUWKxafOfVmeh4fwehjlrSguUdZijklbk2crQhw==
X-Google-Smtp-Source: AGHT+IGSoNv5INVnSqko5OrH7zTf+jb7pBx9jX4flwfLWo+bpMWVQxBgd75egqiSm83wZgZZW9SGQA==
X-Received: by 2002:a05:6402:c16:b0:55a:6086:7e1e with SMTP id co22-20020a0564020c1600b0055a60867e1emr457236edb.75.1705670698789;
        Fri, 19 Jan 2024 05:24:58 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
        by smtp.gmail.com with ESMTPSA id b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:24:58 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 5/5] hw/xen: convert stderr prints to error/warn reports
Date: Fri, 19 Jan 2024 15:24:47 +0200
Message-Id: <bf5504369023dc115f0d7a756c4c5254fa9cd10d.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: +Jtx2o7rdP0J

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
