Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498005ejd;
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXecKNpXAl+8fWHQZx8/8TcHBgjY8zPIMMrrcW/Z1J1LstFWBJBxUU+Ble0+ca3T/NoebIkq4C429hRzHoVV1K3MGxHVtl4
X-Received: by 2002:a05:600c:4f44:b0:418:d58e:2944 with SMTP id m4-20020a05600c4f4400b00418d58e2944mr1629950wmq.18.1713542394505;
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542394; cv=none;
        d=google.com; s=arc-20160816;
        b=jfqBmLVEDqBUhe/DYVkMFyJU+JYudy0JaxSFbwVPfHiTKDIuN2GavrqAHlnFV8CJJ8
         KwnidTOvwNxql7m+RyZEJAMnWmx2AEb83glFZ5ki7NTFlVW23jphDU6Y8moYsxzjkgHW
         h0ydfmqIJGlN8vBnLb/Q8EAy44ReZzeVeLOzCVX/gclFUVA8DkEQhJ6wdtAO2uGbhIz0
         QZfkgCBc014xSFOf/BWJh43FKItaSlVr/UypXIXAvNOVlJXCfrv6ebsAT9gSSyuHnImY
         ZGJFPnBVlw9NsgItjdkECxJt6dNz+RmutBU0SYw3Mg7xoWT+8Aovv4VTKXpfjV7YJSXz
         9v+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=blRxAD//qWk7awT/WiqSSIKjaOzzlNxFM9Csitf6cJ0=;
        fh=pUBkZwEQ9H9Tq1dKsiXzu1a1G59pYXKoVhp4L6Q4+gI=;
        b=xE9/vyXUvC9yDpJrqdGqs8NnIEnVn57MaB9mzdTKvpHwBquznq1v/74nRck72q8Ytg
         FO43dAiNVeOPsXNTHfbEb5y/nOdVhGZOhTniLVbFsQm3bfJRNfJMg8hNCgpbqfva2mDC
         4ZWSK2UXyfHKL5PNxr3zvaItpJjo+Gxi8nSS8ctUPGy9FyprzqxI/PYxF0Z4HugzsBHj
         R2P4J84QFkrY4pn/t/fxcVOO8chQIZeUWrzxJJeHP6i8XS+pkM3FlhSiWARbrXWLxpnB
         B+HwKAYkmPElp2qnYXiaPf4uUJnl2kjidIHD1uc73QP7FEzRMk5+NI6/PDXPPS8Xe71z
         A1nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BLd1z7pu;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b4-20020adfc744000000b00346309e74b0sor1087332wrh.9.2024.04.19.08.59.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BLd1z7pu;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542394; x=1714147194; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blRxAD//qWk7awT/WiqSSIKjaOzzlNxFM9Csitf6cJ0=;
        b=BLd1z7puDXvmCSDsZKQuqkfmGDSUfUmjrmFdMyiRHc54/jzQjzufVn5VeLUqasDUqz
         31qUerXz8woTa1Beqqa0Ng3btGrIt416vHKHIMv6eM7QxRH7kEJYRuqdy4jOhp5EFP5P
         5HKNNkqLgYQVtj82K1QUCfofuNRYO5L4Q8NH4HmvUqhVnFVHpI7CqYyLw3iiKbknbh2Q
         24czaUqmDBThsxJwxJmGBr4M5CNEgBDO2ixIhNRhww9HU7x9+TzvgnQpiYpbTo0o56eC
         cTG+QJKP7E0Y8uqDR6Gg7yCFcOM7BVeXP9OGSICqmE2yMujIr6uVOnG0IZjRZuMAww8H
         ykBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542394; x=1714147194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blRxAD//qWk7awT/WiqSSIKjaOzzlNxFM9Csitf6cJ0=;
        b=vK45qzIU+9gZomR6DQ+a5qGv5fXiLaxDCuy3NQbK+NxWTlwSpRhyrkfIU5ZNuD4RMt
         kI0swKFj1ETTtfkExfeyYSaB8vhOwrKDjHF318ZeOWs54j7dnIDK0o1aS86ucXIPWQdQ
         bqaBktJ9A5GcxQJRTnxXnJNRka7F7PP0is0qCYfuiUwE5OogFoARiCrrkaN+HIHYppqg
         FD5TxqEMsRkfRkWiqUMY2sZ2JZ7HsdCAUNpN7PaBEUXOSrLAGP8zTwPP1kNQdY0PP0xq
         Jbtp/DgB0rjBwTktuuOFFqXEVP1mRaf7VZdWu8UkwseCsTptyU7wh2ZCjHUWSUMuWBOn
         1vzA==
X-Forwarded-Encrypted: i=1; AJvYcCWo1Ajbi2KMcspu7Y/oDusBjn6Ayidwraa7Z5NWsx9AGi7qtVvD57l0H1cwtWOeQynJ4cBp9BypDWTKxZ/T91QzNdL2T4Mf
X-Gm-Message-State: AOJu0Yy1KV2EW6YwCFS9aS/eySB5+Vohd+Tsf4JUh2pbFyj1LwKJt6Ud
	t421gSPLmN6iqP3zC+duXxb2doYFIl8YKx9H8Fd5K5F8T4BO2ui5cI6dr0zuu7WkZA==
X-Google-Smtp-Source: AGHT+IHzG9aZ9yLn4f5iy1UKnAuX/xeyHRxk/T1DgICVc15UBelbDjjnn3z1bs1ndgp8yIOgSrqAjQ==
X-Received: by 2002:a5d:4a81:0:b0:343:8d1b:b12d with SMTP id o1-20020a5d4a81000000b003438d1bb12dmr1452401wrq.46.1713542394163;
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 11/22] hw/core/loader: Add ROM loader notifier
Date: Fri, 19 Apr 2024 16:56:59 +0100
Message-ID: <20240419155709.318866-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yJDLSZLs3NEB

Add a function to register a notifier, that is invoked after a ROM gets
loaded into guest memory.

It will be used by Arm confidential guest support, in order to register
all blobs loaded into memory with KVM, so that their content is part of
the initial VM measurement and contribute to the guest attestation.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 include/hw/loader.h | 15 +++++++++++++++
 hw/core/loader.c    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 8685e27334..79fab25dd9 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -356,6 +356,21 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 ssize_t rom_add_vga(const char *file);
 ssize_t rom_add_option(const char *file, int32_t bootindex);
 
+typedef struct RomLoaderNotify {
+    /* Parameters passed to rom_add_blob() */
+    hwaddr addr;
+    size_t len;
+    size_t max_len;
+} RomLoaderNotify;
+
+/**
+ * rom_add_load_notifier - Add a notifier for loaded images
+ *
+ * Add a notifier that will be invoked with a RomLoaderNotify structure for each
+ * blob loaded into guest memory, after the blob is loaded.
+ */
+void rom_add_load_notifier(Notifier *notifier);
+
 /* This is the usual maximum in uboot, so if a uImage overflows this, it would
  * overflow on real hardware too. */
 #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
diff --git a/hw/core/loader.c b/hw/core/loader.c
index b8e52f3fb0..4bd236cf89 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -67,6 +67,8 @@
 #include <zlib.h>
 
 static int roms_loaded;
+static NotifierList rom_loader_notifier =
+    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
 
 /* return the size or -1 if error */
 int64_t get_image_size(const char *filename)
@@ -1209,6 +1211,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
     return mr;
 }
 
+void rom_add_load_notifier(Notifier *notifier)
+{
+    notifier_list_add(&rom_loader_notifier, notifier);
+}
+
 /* This function is specific for elf program because we don't need to allocate
  * all the rom. We just allocate the first part and the rest is just zeros. This
  * is why romsize and datasize are different. Also, this function takes its own
@@ -1250,6 +1257,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
 static void rom_reset(void *unused)
 {
     Rom *rom;
+    RomLoaderNotify notify;
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->fw_file) {
@@ -1298,6 +1306,13 @@ static void rom_reset(void *unused)
         cpu_flush_icache_range(rom->addr, rom->datasize);
 
         trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
+
+        notify = (RomLoaderNotify) {
+            .addr = rom->addr,
+            .len = rom->datasize,
+            .max_len = rom->romsize,
+        };
+        notifier_list_notify(&rom_loader_notifier, &notify);
     }
 }
 
-- 
2.44.0
