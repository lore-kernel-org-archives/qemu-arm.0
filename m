Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3380517ejx;
        Mon, 5 Dec 2022 01:59:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7W50c+EegOtD1C/NvcdIdbPg+MJveox013MYgcN8JkndbHxJqiEOMdCPelJc4PCeaWBeco
X-Received: by 2002:ae9:e715:0:b0:6fc:90dd:b02a with SMTP id m21-20020ae9e715000000b006fc90ddb02amr23233568qka.471.1670234365130;
        Mon, 05 Dec 2022 01:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234365; cv=none;
        d=google.com; s=arc-20160816;
        b=uA+K0lfhU1lW5uQGgrmLX6uE84CTGfWshGuF2dP7ntDA0S3T8/8bOc5K/79wMoYkXH
         7s5rCm9GBLxC1qN3HrIZrjzbaXkk1qbmjvYuitlETVtBDDbExkEDdWfnCeocXr0KjZEj
         cPvwGQllkyPLmtP8WzEitITMOi92pttAhSANCiHool9wfNLMWmGovtIXQUB04QjNcdVN
         wEE54ENYLZwHyJYY9lmNM3ODuNfVFaPMVI3/QHMEEDwTiXyUVitd42DzOfsgQli7HZGe
         TDO/OYLbKEUpu2nlypcwHAcoucBrpKV/KkeHjBLdUwLI/htMHbZP2i5vIYSL6JlV/sER
         37TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JsXt0Mo+YraOe+nVpUCs7+EEHIwsfkziC7U7eKyeVHo=;
        b=m3ERCNXdkcu9tIjaRVKEAoZd/pYLgcWR2eJ0EMaV5BJEiu3zloNXTWagAWjt5luqRB
         h66XlulyrJwsY4MWAn1qkxs7HbliF9wGygn4/1zKLXn1yHRqrGYgdombztLfUjwEqdSL
         My9rCJ94JWi+YsRw9tbqkIo5ipoDOjCVdfIFLstIk63GOLwLFFe6p54H/KLgG3pzhLSY
         Ap55Fsegfv7X+ky4YwhV1uJC48zQMCHyg1VOcNME9ui8KFVSfaGhM3+sOyYjCBINAiNx
         4luXtPtERrasZf/iIgR5/Jl6QVzhXxmsl8cnAbWrzDXKVz/LBnM2itCLiMNuzkYzkE/a
         tCXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h2fJDSv1;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b14-20020ac8678e000000b003a35753365dsi7669123qtp.77.2022.12.05.01.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h2fJDSv1;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsXt0Mo+YraOe+nVpUCs7+EEHIwsfkziC7U7eKyeVHo=;
	b=h2fJDSv1FSZ6FZm0wuHAM/UYyC2pibquccjq41VVOlqlEiwwuPalNMWuaTYBFCYx7bjVhU
	nCofc9o5YjTyrpdq0WHd+e3wZ9SB9Y0nyCxbLCYfcYPXsVnqaKloeZHtIHyMsVGfg1Zvd9
	n3SrH5Q2eBHYgg+SzmZPfxNBDj6iPSQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-GxyJAN8aPheGjp7hlT7Stg-1; Mon, 05 Dec 2022 04:59:22 -0500
X-MC-Unique: GxyJAN8aPheGjp7hlT7Stg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10C38185A794;
	Mon,  5 Dec 2022 09:59:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15D182166B29;
	Mon,  5 Dec 2022 09:59:11 +0000 (UTC)
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
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 51/51] migration: simplify migration_iteration_run()
Date: Mon,  5 Dec 2022 10:52:28 +0100
Message-Id: <20221205095228.1314-52-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: SetKVq0ktour

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b54e4657ce..b2c974f166 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3769,23 +3769,23 @@ static MigIterateState migration_iteration_run(MigrationState *s)
         trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
     }
 
-    if (pending_size && pending_size >= s->threshold_size) {
-        /* Still a significant amount to transfer */
-        if (!in_postcopy && pend_pre <= s->threshold_size &&
-            qatomic_read(&s->start_postcopy)) {
-            if (postcopy_start(s)) {
-                error_report("%s: postcopy failed to start", __func__);
-            }
-            return MIG_ITERATE_SKIP;
-        }
-        /* Just another iteration step */
-        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
-    } else {
+    if (pending_size < s->threshold_size) {
         trace_migration_thread_low_pending(pending_size);
         migration_completion(s);
         return MIG_ITERATE_BREAK;
     }
 
+    /* Still a significant amount to transfer */
+    if (!in_postcopy && pend_pre <= s->threshold_size &&
+        qatomic_read(&s->start_postcopy)) {
+        if (postcopy_start(s)) {
+            error_report("%s: postcopy failed to start", __func__);
+        }
+        return MIG_ITERATE_SKIP;
+    }
+
+    /* Just another iteration step */
+    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
     return MIG_ITERATE_RESUME;
 }
 
-- 
2.38.1
