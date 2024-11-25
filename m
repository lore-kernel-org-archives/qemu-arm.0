Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569295njc;
        Mon, 25 Nov 2024 11:59:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUA5/+YkAxon2ZjBknqTzel1YKriOzcxcwD1GC9CJMYzeiWSPNolgSScnO3wBOqBy95LgS5wmAtnaUYuA==@linaro.org
X-Received: by 2002:a5d:5f89:0:b0:382:43ab:7d68 with SMTP id ffacd0b85a97d-38260b46e1fmr11698062f8f.12.1732564769681;
        Mon, 25 Nov 2024 11:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564769; cv=none;
        d=google.com; s=arc-20240605;
        b=RvtYjeXwTsNJ03VKpiHQH64XNuOsVj4o+K1qhnGvSXMsz2+ex9nSNko0/ZCqhFO/c9
         uI/6KoKFJfgI4IDEm6WtomwycaBMg/vdmEBIbGIa96IlT6OuBpqPW/8geOlX0r5HNK69
         zmIhJkeWEMZDToxyngvWUcIydymc1x5e0G/mf6RZ8YqFrN7PvYnwbYFb0AsGzDmIzwPa
         1A8vr3/dtZtuBorRIgtZg3a3uPzJFvkfIQIA4M4rX61VBWBngKea2uTNscUcv+V/8Z0J
         kdpZVQjJn0+B7z8/Ma5lG9wZdIEOS0459dXUQegO/EQsw9pbKZ1gnPwdCuyZxSkwK+K3
         XUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JcJPrbjMCLmh0eNMSHwL1G2MB7wFRr0T2Y0cUgmEayE=;
        fh=Amv8T+Wg+FJBQQJADCSWfTXz8aSQtTFLPKCy+qrw21I=;
        b=d15RYcqNXl8/VPW/YnWCD1ZrtSlkfOIxHE3/vdB82RhF+GeI775NC/+J2jj1h9a1b5
         NO8ygCTJEJoSGDV9YHSeNiOYAmqdoQetkLk/SPvfHoQF/Vst+A/TL8NgbAqEEma1PR8n
         smMHX43KM3FR/ZU3gagznsksP9ijkOrYymgjB1JVgWTAwJ/XhfafVuR8Q+tnodJeha9s
         MG3FZeyNFVLlfPNFTT6q3UoP93rRVdCpUjY0OXXg6jC9gSxpRAyH0/PY57ghOJqVBwbV
         Sj9uU43ITTWBl3ZtdVTd6RYOA2kDWh+jvhdxUjS97ZzrAzNNYhFUFwcSKQqqA5iQPSCo
         jjOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6nvf3F4;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3825fb09d4bsor2230022f8f.1.2024.11.25.11.59.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6nvf3F4;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564769; x=1733169569; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcJPrbjMCLmh0eNMSHwL1G2MB7wFRr0T2Y0cUgmEayE=;
        b=X6nvf3F46b0rLnYFh3/GI5VB8+JUkHHnHMo+pfGu8vfKlqAe/B79h03kAVpcN/fs3k
         L03DMz8DcrPbYUhsSEWXuTtAnoqdXdMNsF7En9UqrVIBTKkUhrLIRU4EYFENQ6OapV8o
         Rw8Jj9ALD2jsDrH6sXwlAuy55saMOzVu7VIvnvwtNKafa4MbjnTdwfHdsjZHe8wyv1Mm
         wCdCtJjm1QGtDaV5/mQPY3VkiwSl83BYGUD1nnDaQqhwSqLvOLdd3qhaR2sVOIKqUOPC
         kLtWj0L1yLVlvB89AAlE38yoGRXacLqW+5TMYpbnBUw9gcM4L61tKHNW8vtZ/ft8niWM
         eJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564769; x=1733169569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcJPrbjMCLmh0eNMSHwL1G2MB7wFRr0T2Y0cUgmEayE=;
        b=PoBQTvcLUIavJlnhsWKVkkDFaDIBFOSlCN/wm4kkbBc/r2EFF4PgvDerkyZfB8yYsN
         yk9DsMr6alQXt+qYR5YlruwZ5I/0gHkBL9vuHDhhHN9rX7K4IbMoYk9QINRof3bQJ2GC
         xgN7vXm99HORloscQtYjToWO7l11yUxMheCq47IL6TJvk0qoQBMpKyc1j5Dcr2cGyxDF
         oVUAmhFtsy4bV/iRenMu3pd6K8phb7ptRLjuW3YniovkX8sAtmGcth7Y6yOOSllG3jYi
         AKrMWvpC9m004/tjepOXcJqSHNnjVTYrOxXu52uPXmxKXJb2rjkaODwhERN0ftvK9O5N
         ckKA==
X-Forwarded-Encrypted: i=1; AJvYcCXpy2R/O9i1mgVUu1ve36SPFbhk92A0VVUKe2Ghc/niuZnzFMfWjoSIX/ayuwActo5IGWycgyJQfmDK+g==@linaro.org
X-Gm-Message-State: AOJu0Yz8l5RgjqcHQBqnOViu3Q8xpvbX09vsmV8bADpmSCdJChfPzBt0
	/AbHL4Dr5dorDZRfZst13G8OBUwe/o9RqAZiIppzSvu6KvfzVSCcrJ6DNdVHxhH0ZA==
X-Gm-Gg: ASbGnct24J/M137aRsBnJUFma+9xqZ6XUil1ZW834+R3JM0IulvdaSVGRBTTg46UQ53
	dS9bIEU0FFnSBRZm4CYk+W7mgAD0vK0uwsJEd6Ks0UsKYwmFsWWI/a37xALjupGyfeG/EoTvluH
	lp9Yokh/IJ5TajnnK7aCNxb1doALlI/LIyd2S1B7cIT0rWoZ/hFJyJNwr4yHxmJqhaNUoZmqu5m
	VClsyUOk9DIfjl9ccwNpoze6pIKDQ8KfyjzRUNSoJxuBR/1aZOO7AXqGy3X0MZkiHpK
X-Google-Smtp-Source: AGHT+IEg6YuxoILvMPLYuVly61vnvw6FfSnv0Ejz5HnIAwlyt73nF1r2uz5gua2PinPmEU6MzS2shQ==
X-Received: by 2002:a05:6000:1fab:b0:382:4aa0:e728 with SMTP id ffacd0b85a97d-38260b46dd6mr12738762f8f.1.1732564769159;
        Mon, 25 Nov 2024 11:59:29 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 08/26] hw/core/loader: Add ROM loader notifier
Date: Mon, 25 Nov 2024 19:56:07 +0000
Message-ID: <20241125195626.856992-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4nqD0o6uaiX8

Add a function to register a notifier, that is invoked after a ROM gets
loaded into guest memory.

It will be used by Arm confidential guest support, in order to register
all blobs loaded into memory with KVM, so that their content is moved
into Realm state and measured into the initial VM state.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/loader.h | 15 +++++++++++++++
 hw/core/loader.c    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 7f6d06b956..0cd9905f97 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -353,6 +353,21 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
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
index 31593a1171..759a62cf58 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -67,6 +67,8 @@
 #include <zlib.h>
 
 static int roms_loaded;
+static NotifierList rom_loader_notifier =
+    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
 
 /* return the size or -1 if error */
 int64_t get_image_size(const char *filename)
@@ -1179,6 +1181,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
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
@@ -1220,6 +1227,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
 static void rom_reset(void *unused)
 {
     Rom *rom;
+    RomLoaderNotify notify;
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->fw_file) {
@@ -1268,6 +1276,13 @@ static void rom_reset(void *unused)
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
2.47.0
