Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379529ejx;
        Mon, 5 Dec 2022 01:57:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6MHLq5tQ1Bv//NmTtWwipFZs1b71MHxguuHAOykhb/qCNVTfCleL44E6kxkD0aLS52W0m+
X-Received: by 2002:a37:86c7:0:b0:6fc:b48c:8fbe with SMTP id i190-20020a3786c7000000b006fcb48c8fbemr10286454qkd.105.1670234224487;
        Mon, 05 Dec 2022 01:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234224; cv=none;
        d=google.com; s=arc-20160816;
        b=Mu8n7LBW58RVmlxDOoMBXwoSd4LOL4I/onF8ox5fbQauW2iXlziL1Meq4SmiJWfwK6
         gYwO1OPd+yZm01bmEm/3SSoTybKxTWW3WJnMX++KFdgRIy/Nbslc8ZupAcwzhp4fNCdK
         lsWcw425fXcZGO/v8mUzbSOZ8/ofoaI+40mWMW7JdKCqraTbd9Py5DN18AypfF/aG4+K
         mvWn27EPkrG/sLCLI/3FJl33Psr4m1jR64G8bQnCiwp+OhKaLDFaxmuVCuvKaaRYKp84
         OKZazWDnScT6YMxZHRu10nEDh6PVzGQaflQrMgDoOoE8fulwppIbz5yVbmrJ2RxnqmyS
         NaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y2FikQbfX3Vpm8/roYrQu/IEscu7tBjOtyBOMBEKAZ8=;
        b=q8NSF1BADJX6zj754D+WQuP/AwppQlLkE9kXX1ckQ2CKCC+8TkD4nQMy3/7nP1NjI3
         scFOZEqO1FqyIUclT3gjN+3sUq7THB6YvdEW+da71CR+15SdnY/vuTqF/MCAhDwpteXD
         QdVRbRyV3rYJWHFhrBdkXSgPt1Jy3lYaGYEj2XKuY1QPdd4LWwkHGeT9/PruJ1tDcRsS
         XTr8oLGouQq6kr9o5A1wOKc2+ftjLocRBVL6kgRctWRZ/b8GvuO5hdkicGdu7lDxQHSR
         5YSq1v9L759it3uwshJvM7RmHXCDvWv+kjp0SAXTfo8rUlqgDsmbcbS/S0CFMqO68/1H
         VoUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TLTHiSsf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bm10-20020a05620a198a00b006fbdf7305f5si8263530qkb.29.2022.12.05.01.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:57:04 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TLTHiSsf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2FikQbfX3Vpm8/roYrQu/IEscu7tBjOtyBOMBEKAZ8=;
	b=TLTHiSsfstS/TX+JihE8LN9oBysQoSz0IIyyqMb6XlRfgH8psSeXLTuxY7bYL3wqPuWdc5
	i6B8kNv/p2QrWVXF+TyyK26Hl1XTJfHfX5KLE0sgk6B7HGkzbd2ZJXfeh+bmefzL3UvdhS
	m2gumZgmb8dYu0WKY7TMzTRDev/aS5g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-QIcmUqs4PX-zrDUeLndWtw-1; Mon, 05 Dec 2022 04:57:00 -0500
X-MC-Unique: QIcmUqs4PX-zrDUeLndWtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9478E3814946;
	Mon,  5 Dec 2022 09:56:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 174662166B29;
	Mon,  5 Dec 2022 09:56:50 +0000 (UTC)
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
Subject: [PATCH v2 33/51] migration: Add postcopy_preempt_active()
Date: Mon,  5 Dec 2022 10:52:10 +0100
Message-Id: <20221205095228.1314-34-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: HzJ9dQwiNJNk

From: Peter Xu <peterx@redhat.com>

Add the helper to show that postcopy preempt enabled, meanwhile active.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index cc72c24c18..00a2e30322 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -162,6 +162,11 @@ out:
     return ret;
 }
 
+static bool postcopy_preempt_active(void)
+{
+    return migrate_postcopy_preempt() && migration_in_postcopy();
+}
+
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
@@ -2433,7 +2438,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
 /* We need to make sure rs->f always points to the default channel elsewhere */
 static void postcopy_preempt_reset_channel(RAMState *rs)
 {
-    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+    if (postcopy_preempt_active()) {
         rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
         rs->f = migrate_get_current()->to_dst_file;
         trace_postcopy_preempt_reset_channel();
@@ -2471,7 +2476,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
-    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+    if (postcopy_preempt_active()) {
         postcopy_preempt_choose_channel(rs, pss);
     }
 
-- 
2.38.1
