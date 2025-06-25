Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp966238dyb;
        Wed, 25 Jun 2025 09:20:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuCzuknWh/W/hTxdOC9e52zMKIah/akG7UBUzwICoBPWcajgl6hVShKuGV672/YHD+vk/E3iq0nJF5AA==@linaro.org
X-Google-Smtp-Source: AGHT+IGB9ccgSsrUUVvirGHqhuWalN1kmW0Dk2u69SrEqfL9PKoSqvy1VvHymoEFyaiHAbFfFB62
X-Received: by 2002:a05:6000:4a19:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a6ed5b8e60mr3203153f8f.2.1750868400024;
        Wed, 25 Jun 2025 09:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750868400; cv=none;
        d=google.com; s=arc-20240605;
        b=QV6lPe32zUkV5OmPf/Xe8sq3NgONok0WxjGAkUHxJPLa/WKRhgGqRBhI9TiQnxkJ2a
         2CDAsrBMmXDtbqyIcrv8zMydUauK1UpMhtgfnZRNux44Htgjv2DbbWNnVA0FkqNglJdU
         T87dl93M9KrZpoEjAL5+DAExSqu/iFYcSMGh0CCae/F0u1Lvf9C0tiRugksdO+6EGah3
         OGlXXqAdsZJCejfmrY/l4RzY8hOaFLx6zVc2JiacZzHsd8Bqhmvv+vVbm6/8MK8t7QSZ
         7Dx0Kdn7+7BaKUcesCz1zQFntCGp6ZIDzo2V+ksilMnQfaVdj2HzIUqpuZWz3Ee+HMhV
         Qk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8hB+xHU/yzfqHTWTU+eqdXiiQtqygR92l3vx8sLiNwQ=;
        fh=XUvLIQQ+XauERGTJwKbaGPxk6m9WHQ9TdRLiHbw47Bs=;
        b=RVsiE7+MnjF52ZQINrzoEsPVEhUGnhKxabxei+SGJ2obbbzZFRfmU3mMNpD1JcvwyR
         H0xweTw0HSOSn+e9c9d63MAVCDeAvLqfur/36OM+UpP9JeymO1FelF6eEPzTgfRan7p/
         oaQfmdrBf5neJes1/BEul9u5tGJZPzZsbX6idec5IiZXkNimj/o/cmaH6N3xV++0XMwU
         ivDj0zPRSY/Zu/+cHWIKGz2A1mhX5wDarR/dQwjmn3FPhTdIVKoK+CYLyrK+8YaD7z72
         ZwJM1DAyxvN8FrIWx68IxWUErWXZUMb5vBYKZd4f0QKGgbbMXIeBqesp50zh06lb1Tc5
         tGlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e80e1ea3si3577176f8f.225.2025.06.25.09.19.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jun 2025 09:20:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bS6V34vJfz6DJfs;
	Thu, 26 Jun 2025 00:19:55 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F3A51402F7;
	Thu, 26 Jun 2025 00:19:59 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Jun 2025 18:19:58 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, <mst@redhat.com>, Zhijian Li
	<lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH qemu v16 1/5] hw/cxl-host: Add an index field to CXLFixedMemoryWindow
Date: Wed, 25 Jun 2025 17:19:22 +0100
Message-ID: <20250625161926.549812-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: FjGTaJ6648oI

To enable these to be found in a fixed order, that order needs to be known.
This will later be used to sort a list of these structures so that address
map and ACPI table entries are predictable.

Tested-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v16: Tested tag
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
