Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp277179ejk;
        Mon, 29 Jan 2024 08:11:07 -0800 (PST)
X-Received: by 2002:a5d:690e:0:b0:33a:e762:ebcc with SMTP id t14-20020a5d690e000000b0033ae762ebccmr3337939wru.59.1706544666960;
        Mon, 29 Jan 2024 08:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544666; cv=none;
        d=google.com; s=arc-20160816;
        b=U0ETV9tcxZaM51S9hvQQyZES3cE4c8wb8gqeVUsutTs7V1qM7WuIw3RS8hIEh8kl4l
         nelvHx/Ay+n6HOlSlOu/V3sn9NgXizjnQQg/GJMXr5xLETQveNtLJpDxrktThhfXkNVP
         GUfQD1AySimSISq4wATITQkzACMNbXxmxlKxj2R1PX+GlNamWLiZZh2wTGAKMSjW1B9f
         zGg1m4mONjDTdGHzUdXOuEH7tdpc2OBAggQSzicn8jLXQQONI0dVsmynWEhTLl3rcpHg
         G6+2ExjLVXnMQKeyj7K3DCihMhUH1sQLwmZ6WyPvzz1V3ECMAf72jt/eBPCmiZsksKcr
         S2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q+5SvWKJw3Pcq7y4wFA0yrN1E0wDdYRB5LHPrLR2R5E=;
        fh=Xb4KIKmbdaaiPlPH1bCESW8KkxUeVgZklsOwpxb0HGc=;
        b=AAVrVeL/pGoIqHQ1mhUd9ra/gYtUenF3VVEhbJltZTTxK1grLlZ5+Nc8g4Woh75g+y
         yZeoHN2mHoZIEM9n0OuVSxKSEQeTZReFVjUtIVBAEBURZ0vwk/NE2xwPIYoTmSuM171q
         Nu40fw9t4UucNqZ3RtzR0SnhRErHGntRop8/P8U6L0k0Kmszps3MJlQJG4Ny0/Y7fRpP
         IZJdqLRLE3eKCYTNOqIPVcvzw2b95aBn4GfOlOB8yAwORwwhY6y76YIayA0jIayh2U94
         0LiBY86jZrHqberFr+8qfAy78TS3PUHfBJm5XyzzwJ3UH+VD1aYQOzvphOGAAKIdIso7
         bfpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ovnzlj63;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q11-20020adfab0b000000b0033ade612a65sor126355wrc.7.2024.01.29.08.11.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ovnzlj63;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544666; x=1707149466; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+5SvWKJw3Pcq7y4wFA0yrN1E0wDdYRB5LHPrLR2R5E=;
        b=ovnzlj63jxl0Je1MLWw9BnbrDNPjzvx7Q+YHYIASjV/+Vyd61t3rvY6pXa5lhGEuQP
         9k31fze5YGiETF5+FHa3GYCAireI0KTCJc95LfabSkuDkLO5qkvN5kJWg64qgvuY9dD6
         Fd4rUcEV3mtdOzNx53WjDSHg14Y9De+HAXUCQy2hqB3DBdrlYZplzIz5yVHpfgZ8JT6q
         1MuA+qwgsX72SUsuJq9VvBAwzhCNgF48H+VbxmzeQ54ncj0uNWpwFlDVShNZ/++kcmkQ
         tTccFzlCckQrimzHhO/lLLmzWNWB/VYYMojl5D8h5rLuacLbGj9g22GciuROtAHqjHWM
         bZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544666; x=1707149466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+5SvWKJw3Pcq7y4wFA0yrN1E0wDdYRB5LHPrLR2R5E=;
        b=cC8lQzqrsnPZeHNxgPSnLW7bXN6mDXFIsHspchCv6dKwX3X/+H97rq+4zjF09du3qV
         p43Z3iOamNtH5LXPg9WochoF6/SmOEmAecvfddVqGQNG7w0YOx3ONbST9af2BNzRZuNd
         WfKmqiAlZyYWt/k8/Ih2dGS8c869hjPS+KvntmgLrLo4V9jqDNKX6ZFmku2TGIhu4yUV
         Zw3KYuRItLTMRBVqvHqy5Fh4eog/SvceAcuTevpzc96IOY9Q+A37PdQ8OUVZxeyYowSs
         1SSEND1NQKnX4mn0lX9o/1dRu+3OASqYjKGaEkDyf7S5O/IdrZArZCDPzJwKoFYGMLY4
         OhBQ==
X-Gm-Message-State: AOJu0YwrAjQv9IfbhHLNjRG3p/FBh90gLDDxdDeVMEe7s491HhqeyovU
	nxjXyYLrj7RVT5w5o7k2Yw7jGrgnc/KRJ+Taql96nDVrSkCzQ0FyU50pa221Qbgnxw==
X-Google-Smtp-Source: AGHT+IGZtrvB+zkUJjsAVGqIveytOHVyHqI8Q/vjlorX6vfjVFxTfYDnogBdEEvF9xxE2lcmt0PKdw==
X-Received: by 2002:adf:cc91:0:b0:33a:f340:d09d with SMTP id p17-20020adfcc91000000b0033af340d09dmr1784015wrj.49.1706544666613;
        Mon, 29 Jan 2024 08:11:06 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:11:06 -0800 (PST)
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
Subject: [PATCH v3 6/6] hw/xen: convert stderr prints to error/warn reports
Date: Mon, 29 Jan 2024 18:09:42 +0200
Message-Id: <42a8953553cf68e8bacada966f93af4fbce45919.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EAso3G4IshVt

According to the QEMU Coding Style document:

> Do not use printf(), fprintf() or monitor_printf(). Instead, use
> error_report() or error_vreport() from error-report.h. This ensures the
> error is reported in the right place (current monitor or stderr), and in
> a uniform format.
> Use error_printf() & friends to print additional information.

This commit changes fprintfs that report warnings and errors to the
appropriate report functions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
