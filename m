Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp442559dyc;
        Thu, 3 Jul 2025 03:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDBESrtcTKnnlY6IcMipxxZt5HtEiiRvG7rBr34ut2TQx5DD6iEx1N2k6KJLD8n4wsreY8Ve5fd9FCCA==@linaro.org
X-Google-Smtp-Source: AGHT+IHzVBL7AlVVrvhbiPE7D7EXbkvADuhri5BK6DpS0fzpZOV/M7ZbkUsVuX7r9LLLlUgLhZN0
X-Received: by 2002:a05:6000:2184:b0:3a8:38b3:6e32 with SMTP id ffacd0b85a97d-3b32b1458f3mr1637952f8f.8.1751539303498;
        Thu, 03 Jul 2025 03:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751539303; cv=none;
        d=google.com; s=arc-20240605;
        b=Q+GLCeITikkfgM4kS3gYE8Km22+8HAAAkCj9izuKSAMAPUl8CxMzXEeO7WoFIWRdWt
         1rmBfw+cSOzD5mSbH28veRKGnPhEQwznWZQRtbDSRTwN5x9Ax0jyUqKaZJVaC0yOeH7V
         UDAtANRMB9dZnGBNXvyKqsBapN9zNEeHdIpptoKFDy9ErkI6OtgCN6QqehEqEGaxyrJs
         +Znwt9VEF3wsO+Z4dYq9YsXee8ikrW24X9CeWIC9C1oPJ8rw5xKHfnyBTEQqFychkh78
         nmQ2lXqU+wDeOF5Mqazc+OIaiJBGQlXoK8Op1t36UL5bF9RkCyDEO8a6txBn+8H/Fdg8
         EGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=TdG8L+yB767vIZqZXbycsVEFmcHuIlM+bOEVoMQ88J8=;
        fh=2OWm8s7qWlCZ9oKfEpMPigkCh0wt4LR/kIjLb0p9Pkg=;
        b=VaJmSDzbY8rF9Z1wu0wWLSudl5kcUEz9xDFE7NiNU45QCcvNndiHTfIMhh204UCEB+
         zhgFZUiNOWLWp9AkUcQPwW1RaVaUITaQ/8JQJKOU9xAw4C3F/GuYSRrt3pk5gsK9U589
         ITp7ZHlr9M0OlatlPdykOPvMTTDk55ThpelL8IZ2nJY9PxutfND1Mwi6+ApswNMrkE67
         G2CQq/u4tSonattmnNgLStx6hoUz+nLFE8JUDj9CMxrSjxIJV7i0O4THQSm2QDvVC60/
         Q8hkvDG9RB2iEW19CG3EWcm78K83lXtjmQjjdJQJ4nA6cj6dp80WIDlHathRv9llXRXX
         objw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0818f42si10699857f8f.743.2025.07.03.03.41.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXtXk6mQ3z6L4vY;
	Thu,  3 Jul 2025 18:38:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BC4591402F7;
	Thu,  3 Jul 2025 18:41:42 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Jul 2025 12:41:42 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>,
	<mst@redhat.com>, Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
	<itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH qemu v17 1/5] hw/cxl-host: Add an index field to CXLFixedMemoryWindow
Date: Thu, 3 Jul 2025 11:41:06 +0100
Message-ID: <20250703104110.992379-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
References: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: jH63dswVzPgf

To enable these to be found in a fixed order, that order needs to be known.
This will later be used to sort a list of these structures so that address
map and ACPI table entries are predictable.

Tested-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v17: Tag from Eric.
---
 include/hw/cxl/cxl.h | 1 +
 hw/cxl/cxl-host.c    | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 3ae4303383..83096b2300 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -28,6 +28,7 @@
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
