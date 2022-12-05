Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3380435ejx;
        Mon, 5 Dec 2022 01:59:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DyFXE4xQ9Cvx2CAHsQu4+d1vHyscAzqFElA/g0XZ/ig3d34WWoL3US3LrpjeubJNFUZC7
X-Received: by 2002:a05:622a:4a11:b0:3a5:1cc6:ae12 with SMTP id fv17-20020a05622a4a1100b003a51cc6ae12mr75601749qtb.103.1670234355830;
        Mon, 05 Dec 2022 01:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234355; cv=none;
        d=google.com; s=arc-20160816;
        b=znAsXSieB72csRr17cgtiX9kaPexlwW6aJwJn1meXEsAHslCeBHsMQ62PkK/iyD7iJ
         JistqntzoXwGdhedQ+LrR0aiLmderY5szqAPWzyYUVP/ulyHBO29tPIE6a51xM5oA1Uy
         IMFkpM/99/jDPVq7YOzo9qM6QrR9/xfcCCnuUgfd4A+yBo8RtB+Ygt2Rt4qgZt6BvBEd
         GyxeO1eVi2UarD2FU1m7NNT9E3EfNDIZHJSohpoo+hfI3kRqcFED1zdXY/RA30UF5t38
         uGnA8NLETy5BydJxSDTsYRk5XltLq8dwWd/XqWIPpjhGjtT5zBqs07ui/LkmqCuTf4j9
         ZKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aVA2ExIvUYYnRwSS5NgfSR0yZwp2UOeIEJlbVzJFJzk=;
        b=ZONFRrBOR4b7TxwxVM6xsBhM1p9HnBL9Xt2LdkeeM8rkFF2lvttMS1/SyWxKbMrH5O
         wWUDrT6hd1bVWXkU/aWpfCineM/qfscB6EGRmTBA0ma1hN3gWFu+fZSHvFTzb4l3tRwr
         AaxWyXd+Mtq9yJ6CIy9FVo4Rk9EFLdKCcFY2ZDRkzoKfAr3y44KkJ17IliFPFhAmVIib
         Rveu2QgjYBKZW8ObmmrGOP6vh8ZTx/3XGEY9LNdEbj5u2PLIqa20JIZl012BH1uyk/dV
         HE38Js74vRL85i3xY17Wbv+UMhQ4Q14VQklbL8uP6C5z2hPOiQxGoHD1TmKwA9e4T//b
         w+jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ix9fXHg8;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id jz14-20020a0562140e6e00b004bb57dda803si7302676qvb.214.2022.12.05.01.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ix9fXHg8;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVA2ExIvUYYnRwSS5NgfSR0yZwp2UOeIEJlbVzJFJzk=;
	b=ix9fXHg8hYLxwSsclAxmbOIQhJoT6cRclVnYVVd8yn5VdM0B6ZeUCspmY1efrnm+ytu2QK
	QmebegGmO6M0C7Pk6r6PVbTg5UCSQlQqO74xG4g5tdC6g5RmHNlp0NgQgyxjt1DzP76nJ0
	8i93Pdu7PyfvGDMD2NLX66KMqF8CTjg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-U0U7Wxn0PFiNrtkvAwFA_g-1; Mon, 05 Dec 2022 04:59:13 -0500
X-MC-Unique: U0U7Wxn0PFiNrtkvAwFA_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAC7E800B23;
	Mon,  5 Dec 2022 09:59:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3681B2166B29;
	Mon,  5 Dec 2022 09:59:03 +0000 (UTC)
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
Subject: [PATCH v2 50/51] migration: Remove unused threshold_size parameter
Date: Mon,  5 Dec 2022 10:52:27 +0100
Message-Id: <20221205095228.1314-51-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: Oa+bvYEoNPcx

Until previous commit, save_live_pending() was used for ram.  Now with
the split into state_pending_estimate() and state_pending_exact() it
is not needed anymore, so remove them.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   |  7 +++----
 migration/savevm.h             |  6 ++----
 hw/vfio/migration.c            |  6 +++---
 migration/block-dirty-bitmap.c |  3 +--
 migration/block.c              |  3 +--
 migration/migration.c          |  4 ++--
 migration/ram.c                |  6 ++----
 migration/savevm.c             | 12 ++++--------
 8 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index 313b8e1c3b..5f08204fb2 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -58,11 +58,10 @@ typedef struct SaveVMHandlers {
      * pending data.
      */
     /* This calculate the exact remaining data to transfer */
-    void (*state_pending_exact)(void *opaque,  uint64_t threshold_size,
-                                uint64_t *rest_precopy, uint64_t *rest_postcopy);
+    void (*state_pending_exact)(void *opaque, uint64_t *rest_precopy,
+                                uint64_t *rest_postcopy);
     /* This estimates the remaining data to transfer */
-    void (*state_pending_estimate)(void *opaque,  uint64_t threshold_size,
-                                   uint64_t *rest_precopy,
+    void (*state_pending_estimate)(void *opaque, uint64_t *rest_precopy,
                                    uint64_t *rest_postcopy);
 
     LoadStateHandler *load_state;
diff --git a/migration/savevm.h b/migration/savevm.h
index 613f85e717..24f2d2a28b 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,11 +40,9 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending_exact(uint64_t max_size,
-                                     uint64_t *res_precopy,
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
                                      uint64_t *res_postcopy);
-void qemu_savevm_state_pending_estimate(uint64_t max_size,
-                                        uint64_t *res_precopy,
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
                                         uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 1545498e11..8dbbfa2c56 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,8 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_state_pending(void *opaque,  uint64_t threshold_size,
-                               uint64_t *res_precopy, uint64_t *res_postcopy)
+static void vfio_state_pending(void *opaque, uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -511,7 +511,7 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     }
 
     /*
-     * Reset pending_bytes as .save_live_pending is not called during savevm or
+     * Reset pending_bytes as .state_pending_* is not called during savevm or
      * snapshot case, in such case vfio_update_pending() at the start of this
      * function updates pending_bytes.
      */
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5b24007650..8a11577252 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -761,8 +761,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_state_pending(void *opaque, uint64_t max_size,
-                                       uint64_t *res_precopy,
+static void dirty_bitmap_state_pending(void *opaque, uint64_t *res_precopy,
                                        uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
diff --git a/migration/block.c b/migration/block.c
index 8e6ad1c468..4f1f7c0f8d 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -862,8 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque, uint64_t max_size,
-                                uint64_t *res_precopy,
+static void block_state_pending(void *opaque, uint64_t *res_precopy,
                                 uint64_t *res_postcopy)
 {
     /* Estimate pending number of bytes to send */
diff --git a/migration/migration.c b/migration/migration.c
index 9e18c911db..b54e4657ce 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3759,12 +3759,12 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(s->threshold_size, &pend_pre, &pend_post);
+    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
     uint64_t pending_size = pend_pre + pend_post;
     trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
 
     if (pend_pre <= s->threshold_size) {
-        qemu_savevm_state_pending_exact(s->threshold_size, &pend_pre, &pend_post);
+        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
         pending_size = pend_pre + pend_post;
         trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
     }
diff --git a/migration/ram.c b/migration/ram.c
index ad5a2eeadd..48378ee57e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3392,8 +3392,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
-                                       uint64_t *res_precopy,
+static void ram_state_pending_estimate(void *opaque, uint64_t *res_precopy,
                                        uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
@@ -3409,8 +3408,7 @@ static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
     }
 }
 
-static void ram_state_pending_exact(void *opaque, uint64_t max_size,
-                                    uint64_t *res_precopy,
+static void ram_state_pending_exact(void *opaque, uint64_t *res_precopy,
                                     uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index 89b9075ff1..5ad94f0be9 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1471,8 +1471,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_exact(uint64_t threshold_size,
-                                     uint64_t *res_precopy,
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
                                      uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1489,13 +1488,11 @@ void qemu_savevm_state_pending_exact(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque, threshold_size,
-                                     res_precopy, res_postcopy);
+        se->ops->state_pending_exact(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
-                                        uint64_t *res_precopy,
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
                                         uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1512,8 +1509,7 @@ void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque, threshold_size,
-                                        res_precopy, res_postcopy);
+        se->ops->state_pending_estimate(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-- 
2.38.1
