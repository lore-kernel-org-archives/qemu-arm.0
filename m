Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp29833wri;
        Tue, 5 Nov 2019 15:41:47 -0800 (PST)
X-Received: by 2002:a1c:7701:: with SMTP id t1mr1341324wmi.113.1572997306982;
        Tue, 05 Nov 2019 15:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572997306; cv=none;
        d=google.com; s=arc-20160816;
        b=V7FphOxqdzYDCrKuAbZE6LSrEkFALDvL6ym0OzY6ErTJr/1FcHGaZH/cy75EmiKyKv
         TZ7kksNdiMxi/S6Si3KvW1RnujhydvXlOouHhRGIPXq3Xih7GSE75wR5Wg0HP5NLQWJi
         Qolq0Cpz4OCC0rZlTzVMiGc4qYmAvQa3N4CVVuTZMxJ7PDrfrGsL80Ot7z79r2jbNTHz
         Ih7cY8gH+ePGHl+wNS5CxUYrdk9ZJw0UZYd0sv7ozaTlrmakDVXICBR5aYELS63wOw68
         RF7BoP8kLA9YFAMSqME809vW3DE7L6qTXgrQVIuetOvqZZ2qIOuAfe3VAJSosfozmzcV
         3ENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=WySS2tj+mpRubnHgzdskn314seKpdU+7MYMHfRQ/Nvs=;
        b=qipz9ZfQnPECSHHfQED3xS2b0RqNujeYYmH+UXyQBN+fyAMHvNj8SkZfhWG5AsGFvG
         YfjPUgh8a2j3EdRZEFnFetPNCom1dlISWmNRtEcrvMHq7y2d7TqlOstYGoaDj8l/OUL/
         3NiCqpGxuknotsFhdaMSadJGGDBJpLgUEHQAJMZ0CajDRUchN4Bazz1rjoJN31zbx2VJ
         GV/34DbVn0s3iwefS8291JP4tCWkaAKT0jNm25CMCWbe70t6sm04BTLTLqBQ0AEuHaKo
         atMMwOrPAjO2kqQx7Z7H9+Hbjxt2aDdDhrLYGHktB7hjW9S83QJQa4gEAOYnC7aeBFDc
         bWwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fF775Z+5;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w9sor636076wmm.11.2019.11.05.15.41.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Nov 2019 15:41:46 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fF775Z+5;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WySS2tj+mpRubnHgzdskn314seKpdU+7MYMHfRQ/Nvs=;
        b=fF775Z+5dIMsRGdWH+I2PtFx9WyG3X0MMIUcG3qgO1Q0xghnVUcLQ3a1gFaErboFW3
         e/ON+bySNI0QJXVDif7PZy3RFU8Lq2KxH9DuNKJbfajsMyo/SrRs+RjJCaADd9YarBl3
         /4WymLEBvZwVyUk2JU3KlH1x8imALHQp7HFVV0MckiJd5A71EEJxujJYu9riFJSUCWwi
         edGzcFkmpO30uUO2Eje/Ofr14pd3dV2c39c8xi0zcZk6YjywUFMPA+MSOMidL36sHGvr
         5IVOqtn/baRYdl/s7pRUYNOy+fEfWvIWlaa09Ivh8X/6MXClwiMAOJa+r9txPwQ0npHD
         zf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WySS2tj+mpRubnHgzdskn314seKpdU+7MYMHfRQ/Nvs=;
        b=UujdxhIgpo7dtVUGZJ+GcEB84lUBbM0MXGiLKoJOj2wEIPgTK0FeWyxu4xyFLfTyva
         e7fSge7GwHdi6BYdy0UY7vmMWnIs79K3dT5I1dCuQsC+5TdtRoznWkOgQBEjl/MxkODU
         iRYNpbqD0P592MN06c3ZEXx2Myk244cAkQsv2Pvh16y2WYi3IvA37kpEDWtj9LW8UVBo
         3eTGkyRVM7mMl0nxfhd7D91tEaE5PJMMAUFQYL3s/KQxMWGEpJeZBJosIKdWm8sQCYDq
         d7twWmhNQRM6lS5HxKsINb8OXrwg7IrR9H1SEgq0VJfd9bGCd5hhRxpChNmgiru//qYu
         Me2Q==
X-Gm-Message-State: APjAAAXM4GVcRgeFvPjK1MI/9bKFay1T/WDgCQit+XyWZkncAKiDCoL/
	EDepkR8vG7+U/tNazSe+sTcHT178
X-Google-Smtp-Source: APXvYqxl7N4pKSLFxno3Rdg0GkCD+jJMq+vBS7SlRpf7SeN2uE39lGmusweoOD6EHar026xvARW1hg==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr1341166wmj.84.1572997306754;
        Tue, 05 Nov 2019 15:41:46 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.home (host86-144-13-94.range86-144.btcentralplus.com. [86.144.13.94])
        by smtp.gmail.com with ESMTPSA id q25sm27295010wra.3.2019.11.05.15.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:41:46 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	quintela@redhat.com,
	dgilbert@redhat.com,
	eric.auger@redhat.com,
	shameerali.kolothum.thodi@huawei.com
Subject: [PATCH v2 3/4] migration: ram: Switch to ram block writeback
Date: Tue,  5 Nov 2019 23:40:59 +0000
Message-Id: <20191105234100.22052-4-beata.michalska@linaro.org>
In-Reply-To: <20191105234100.22052-1-beata.michalska@linaro.org>
References: <20191105234100.22052-1-beata.michalska@linaro.org>
X-TUID: 4IiZCtbmQtlT

Switch to ram block writeback for pmem migration.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5078f94..38070f1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -33,7 +33,6 @@
 #include "qemu/bitops.h"
 #include "qemu/bitmap.h"
 #include "qemu/main-loop.h"
-#include "qemu/pmem.h"
 #include "xbzrle.h"
 #include "ram.h"
 #include "migration.h"
@@ -3981,9 +3980,7 @@ static int ram_load_cleanup(void *opaque)
     RAMBlock *rb;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
-        if (ramblock_is_pmem(rb)) {
-            pmem_persist(rb->host, rb->used_length);
-        }
+        qemu_ram_block_writeback(rb);
     }
 
     xbzrle_load_cleanup();
-- 
2.7.4
