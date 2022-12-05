Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379987ejx;
        Mon, 5 Dec 2022 01:58:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5un1xLd0yBgRvKsY1pXH18RHYOAH3Ctp7jKbbIwbe4Vf6csYUh2sZlibEAvq0CaBBkznhV
X-Received: by 2002:a05:622a:11d1:b0:3a5:9157:f3a4 with SMTP id n17-20020a05622a11d100b003a59157f3a4mr60872497qtk.178.1670234286144;
        Mon, 05 Dec 2022 01:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234286; cv=none;
        d=google.com; s=arc-20160816;
        b=uwX4U/S3zQVNlPYkiuT9sRL8lh7Ud7nJqiuKEYKqxwfMugWE/0WgVO1P/U0mnp0e+a
         gMD3c2j1lycySq5upoypOQbi8iq35Ip4dyraG+OopNrstB6HVOtUHCVC/Fank9krQ+Ad
         3WxvcitCsb6s0SYGBw+fdeLy7wSJpGP+lXsvuWhRmzNJ9gkPK8TYf/HoEy24NnpMJipD
         Pj0t7WEIFNbi4dg3PrG7i5r6q4pznqJO2CFB91q8mgXv6dz26L70QhWPcpCMM3wQjjHY
         8+RuGmLxvAe1vt0SAQQCC8TUSX/10ab1QFNf4MlNKMFyGslvKKEQh8Bl/hk4NvUrSSP0
         EL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8lyK5jWTjCJAgRQLnodHZvbuyoizfgIifPcdRmMqw2Q=;
        b=krv9ORfsvNl95PC1sFKt4+rA9bHSyiuZSta/sQCc0pCgMKcOwsdU0nhBsnp6pLQ11v
         V3F3e1nBVsa4Z4fSGNefyE4tJxig/KfRNbJwa3kJq7nh7F7z7Yekc0vmKwibt7niiqH6
         hTGLscOBmnVq48QMGAPScn+urmvsPjdETgNMT5MC9Rb5aBZhBElsitFRTdlNLvPAmiUv
         VvUlBgGbX7CONFf+ke5zkKg49NsAxfd6QvF+JmaUYLido6ky0kjaoRMil3QRJ9ER8gEa
         eGIOhAppFmCHPg95wskA37ikPg0IaByPexKxT/o7MrSU5OC0kF5bwtvvBGyTUSE8E0SF
         B2fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gnki1rY4;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s17-20020a05620a255100b006fa9d101797si8090291qko.328.2022.12.05.01.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:58:06 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gnki1rY4;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lyK5jWTjCJAgRQLnodHZvbuyoizfgIifPcdRmMqw2Q=;
	b=gnki1rY47FiUxrrFnj9PpVWTnUNWvjAymjiWZWkILsK0MQbu1U7nEpIweYvr/0QCTTnJu6
	rI8gAHfuJOR2o979O2WHgJAVmV1ZRtCG87vfT7Yxl+JxwA9Bdz4QO6B86kZO2MX1YpRO8n
	rh0HVNFrGNIL/KXby6KSRjDSdP31+lU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-72UGLoTcPNiov9btYGUh6w-1; Mon, 05 Dec 2022 04:58:02 -0500
X-MC-Unique: 72UGLoTcPNiov9btYGUh6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AC55811E75;
	Mon,  5 Dec 2022 09:58:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3B4F2166B2A;
	Mon,  5 Dec 2022 09:57:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 41/51] migration: Add pss_init()
Date: Mon,  5 Dec 2022 10:52:18 +0100
Message-Id: <20221205095228.1314-42-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: p3FmCYSZmd0V

From: Peter Xu <peterx@redhat.com>

Helper to init PSS structures.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 571d780987..d81bf7b183 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -542,6 +542,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
                                      bool postcopy_requested);
 
+/* NOTE: page is the PFN not real ram_addr_t. */
+static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
+{
+    pss->block = rb;
+    pss->page = page;
+    pss->complete_round = false;
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2650,9 +2658,7 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss.block = rs->last_seen_block;
-    pss.page = rs->last_page;
-    pss.complete_round = false;
+    pss_init(&pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-- 
2.38.1
