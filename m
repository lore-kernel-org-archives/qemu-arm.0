Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp3537792njc;
        Thu, 12 Jun 2025 06:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUw5RTeQ58zCjuZ7eqPqAky5eVFCRW8alIf0kio3uLSddTrp1cyCuJyfVBe9NCFbk8oakLlWELVoBpv8w==@linaro.org
X-Google-Smtp-Source: AGHT+IFmCr4vu5QKn9CSEFQ4ErhzzmT/d9XpS1VDVD/cZ+vSRmpQGwsjy1RxDPgIE42T3NyKlO1j
X-Received: by 2002:a05:6000:1ac6:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a5586f4225mr6220763f8f.56.1749735852404;
        Thu, 12 Jun 2025 06:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749735852; cv=none;
        d=google.com; s=arc-20240605;
        b=AqP4ImCSGTLA3aDJaWsF6KjAvxwAO8eqkTA4Kt1rt1YIuXvEK1/Ds+V34Z7F/GAy0n
         NGoKe29rY7P2I9jyzUaE2WF8BQO0cVawpU6D8VebpYiS//isq1jeumLk+YGPH0BmMQXn
         gWbbUBJmmad7ctR6fov+aOCkugh8tLBYRWTME2id+wMbgl57BBK2c7VOaYfE34Y/vV+Z
         y3aMcxg/C0LatKH9hsBPMhGQThIt3KIUC4SoPUNiws7reHFrIfdP1ouxZxWeA6oXBG8X
         Bh7z1dPReC5GOPZ5TEzwdNzE67cCxwKPDXSjlwqC8YvsHaKxD4zRy5om3tCPptG/RRaF
         y+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8lPDHt8Gn34qgRK7zIgSLshQT/xfKk/LZUiMIlwVy+Y=;
        fh=j5hUnuCKl+LEtbJKgnRKD4Q/IHAUrR7LU1LWM4QNBKo=;
        b=Zo07EoApralWobP4Jbbe+fnJ6XSncVdrO2IBAYLw9wdM5BV/PIPnczGiLdqBpeQNXk
         7XipJfYIOugDz1rzlxcEyNcrE03BhJWRzamNtR7Ygsvc0pzx9GDOXTFE3SClAb5W1BoK
         mHZuKoVf5awWLZu9ovXH49+VVBqVTSm2LuI60mM4aVaxuKw4NVKx5iL/21Jt4kbQPwhU
         MgedLBGTtIFV45nuyQgY2+VA4TwCLKvLg7sC7MwS85SeBdAwVdtF1+Fj6mL7inEET2Kd
         I0scg/whC6mwqS3yAL/JB9snEjXgebtPF7YJxScx2lUtDU+2kDxTcWYKDIzVdWq1YSVv
         0rTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4532fdfbde2si10310315e9.190.2025.06.12.06.44.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJ3c80S09z6K8xM;
	Thu, 12 Jun 2025 21:42:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 94F261402F3;
	Thu, 12 Jun 2025 21:44:11 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Jun 2025 15:44:10 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, <mst@redhat.com>, Zhijian Li
	<lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alireza Sanaee
	<alireza.sanaee@huawei.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>
Subject: [PATCH v15 1/4] hw/cxl-host: Add an index field to CXLFixedMemoryWindow
Date: Thu, 12 Jun 2025 14:43:35 +0100
Message-ID: <20250612134338.1871023-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: YcvSesAD2iUT

To enable these to be found in a fixed order, that order needs to be known.
This will later be used to sort a list of these structures so that address
map and ACPI table entries are predictable.

Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v14: Picked up tags. Thanks!
---
 include/hw/cxl/cxl.h | 1 +
 hw/cxl/cxl-host.c    | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 75e47b6864..b2bcce7ed6 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -27,6 +27,7 @@
 typedef struct PXBCXLDev PXBCXLDev;
 
 typedef struct CXLFixedWindow {
+    int index;
     uint64_t size;
     char **targets;
     PXBCXLDev *target_hbs[16];
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index e010163174..b7aa429ddf 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -24,13 +24,15 @@
 
 static void cxl_fixed_memory_window_config(CXLState *cxl_state,
                                            CXLFixedMemoryWindowOptions *object,
-                                           Error **errp)
+                                           int index, Error **errp)
 {
     ERRP_GUARD();
     g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
     strList *target;
     int i;
 
+    fw->index = index;
+
     for (target = object->targets; target; target = target->next) {
         fw->num_targets++;
     }
@@ -325,14 +327,15 @@ static void machine_set_cfmw(Object *obj, Visitor *v, const char *name,
     CXLState *state = opaque;
     CXLFixedMemoryWindowOptionsList *cfmw_list = NULL;
     CXLFixedMemoryWindowOptionsList *it;
+    int index;
 
     visit_type_CXLFixedMemoryWindowOptionsList(v, name, &cfmw_list, errp);
     if (!cfmw_list) {
         return;
     }
 
-    for (it = cfmw_list; it; it = it->next) {
-        cxl_fixed_memory_window_config(state, it->value, errp);
+    for (it = cfmw_list, index = 0; it; it = it->next, index++) {
+        cxl_fixed_memory_window_config(state, it->value, index, errp);
     }
     state->cfmw_list = cfmw_list;
 }
-- 
2.48.1
