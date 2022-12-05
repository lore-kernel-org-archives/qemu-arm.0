Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3380376ejx;
        Mon, 5 Dec 2022 01:59:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6G1whoY5i+ybuSVa+FY/llyA4tFIN78in90AYvdjVcZoOd8zA70zlG7eOBw0DZ/bdXzEKn
X-Received: by 2002:a17:906:8e93:b0:7c0:c10e:3fa9 with SMTP id ru19-20020a1709068e9300b007c0c10e3fa9mr305292ejc.385.1670234347833;
        Mon, 05 Dec 2022 01:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234347; cv=none;
        d=google.com; s=arc-20160816;
        b=JY8ohjr6bJ5Xt0UOCYfCnsKwWH0y4nIQmFgIakTLtlMed8z/D8NfP4JVdNhugJboEL
         WRyJfYO0JdHqEps+LQ8nDr+OWSykJQrexZtMy8ZtRqv3aujNhxIqb9is1k4BEDkj0DbQ
         lkVeCNNrwmqJ1p1Jf+h+lQ65yuTEatDccVtwhdKgrKq2dOfH/yV9rqjzWB9mXPEd8qEs
         2lOYPYx4dBxiqLhVU6bmJl3kadip1jfbBNmhRV0lJif1xVVkBi/wtdpR6KJ0sVlDLRHB
         pCZ1dWMNdJ754IrAMFTPLLiLsp2UQiRbK+tZSvr9Iq1eYm56PsUzf3397FLunmr2pc4+
         iteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w2uvfZXXJ9nxYpqnVRQpkPADHauD+tdAxAPNOq1F1P4=;
        b=u2JgRPYt4aOiJsOu8ZEwIweycyBffCK5+HxTAQGdr/9yODK3ctf+UmGDLlBYA0u5fL
         wntqE7arO7h9ZzHZ+MovcYsoJIfSkHmgzjMxegZ9ycmDsXQuJfH2LwLkceM4oOM2+TXP
         DbEKCheozt4vOJmKoxSh9MD9wvujU9inI9+R/BB7jLAYeHuKwObkvqOtVT29hPL2AhE3
         XpIE8O4d5suY/4ND4qlfeaWKNtefCxkfoa5w7Q58g4PWd9dpOvCPfMrZHLg8cHl+Yxsu
         WG9xdpvJkrmRBBnXpyTbhM8sVu19uZZ4TH53MYwfw6+OjRcr3OLWUr58xoprX9ZtcC7Q
         46Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f06YZT4/";
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qb27-20020a1709077e9b00b007809c50fd78si12468831ejc.262.2022.12.05.01.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:59:07 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f06YZT4/";
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2uvfZXXJ9nxYpqnVRQpkPADHauD+tdAxAPNOq1F1P4=;
	b=f06YZT4/Hgy+SBsyyOBMFQvgLboKR1BExsIAMNdTwPIjzdx70l/mAh2FUK0XYPDTO8pqTT
	PQwZY165tcndhtEUdji8NieyIkRaOlNfQxqpJUM3Bekb7tGyShDM5UU2a7P74ocuORJai2
	5IX27sePwPRsITKGANIkJpKDyKyc6lQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-VLiUXFFROyuF7R1pA9Sadg-1; Mon, 05 Dec 2022 04:58:56 -0500
X-MC-Unique: VLiUXFFROyuF7R1pA9Sadg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4871C101A528;
	Mon,  5 Dec 2022 09:58:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F81C2166B29;
	Mon,  5 Dec 2022 09:58:47 +0000 (UTC)
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
Subject: [PATCH v2 48/51] migration: No save_live_pending() method uses the QEMUFile parameter
Date: Mon,  5 Dec 2022 10:52:25 +0100
Message-Id: <20221205095228.1314-49-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 5BTThaR9xMP5

So remove it everywhere.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/register.h   | 6 ++----
 migration/savevm.h             | 2 +-
 hw/s390x/s390-stattrib.c       | 2 +-
 hw/vfio/migration.c            | 6 ++----
 migration/block-dirty-bitmap.c | 5 ++---
 migration/block.c              | 2 +-
 migration/migration.c          | 3 +--
 migration/ram.c                | 2 +-
 migration/savevm.c             | 5 ++---
 9 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index 1950fee6a8..5b5424ed8f 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -46,10 +46,8 @@ typedef struct SaveVMHandlers {
 
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
-    void (*save_live_pending)(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *rest_precopy,
-                              uint64_t *rest_postcopy);
+    void (*save_live_pending)(void *opaque,  uint64_t threshold_size,
+                              uint64_t *rest_precopy, uint64_t *rest_postcopy);
     /* Note for save_live_pending:
      * - res_precopy is for data which must be migrated in precopy
      *     phase or in stopped state, in other words - before target
diff --git a/migration/savevm.h b/migration/savevm.h
index 9bd55c336c..98fae6f9b3 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,7 +40,7 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
+void qemu_savevm_state_pending(uint64_t max_size,
                                uint64_t *res_precopy, uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index ee60b53da4..9b74eeadf3 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,7 +182,7 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void cmma_save_pending(void *opaque, uint64_t max_size,
                               uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index d03681678d..8ae1bd31a8 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,10 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *res_precopy,
-                              uint64_t *res_postcopy)
+static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
+                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index dfea546330..a445bdc3c3 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -761,9 +761,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
-                                      uint64_t max_size,
-                                      uint64_t *res_precopy,
+static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
+                                      uint64_t *res_precopy, 
                                       uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
diff --git a/migration/block.c b/migration/block.c
index 593754c38c..39ce4003c6 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -862,7 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void block_save_pending(void *opaque, uint64_t max_size,
                                uint64_t *res_precopy,
                                uint64_t *res_postcopy)
 {
diff --git a/migration/migration.c b/migration/migration.c
index 6b8a6dd74e..a75a281635 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3759,8 +3759,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pending_size, pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
-                              &pend_post);
+    qemu_savevm_state_pending(s->threshold_size, &pend_pre, &pend_post);
     pending_size = pend_pre + pend_post;
 
     trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
diff --git a/migration/ram.c b/migration/ram.c
index 640839dcee..63cb6544e5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3392,7 +3392,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void ram_save_pending(void *opaque, uint64_t max_size,
                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index 4d02887f25..9ddcbba4e3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1471,8 +1471,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
-                               uint64_t *res_precopy,
+void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
                                uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1489,7 +1488,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->save_live_pending(f, se->opaque, threshold_size,
+        se->ops->save_live_pending(se->opaque, threshold_size,
                                    res_precopy, res_postcopy);
     }
 }
-- 
2.38.1
