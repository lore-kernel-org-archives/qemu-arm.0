Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321606eja;
        Thu, 2 Nov 2023 04:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMv40k/sVQAXPj3Zm3aML5GPhTEbnOQcd3pOeaIMKC4PsawIeMi/mBlFN4HKWwWoqjyMSO
X-Received: by 2002:a05:6902:1083:b0:d9d:39af:2feb with SMTP id v3-20020a056902108300b00d9d39af2febmr21137010ybu.50.1698925450252;
        Thu, 02 Nov 2023 04:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925450; cv=none;
        d=google.com; s=arc-20160816;
        b=SpBs03PSfpHurlw5eH8EKsXwsV1UUnf+XlHrKAXJ8UvoH4dw1Y/i1eyXE9lkJd6VI5
         MiwC8vgRSzHF5E/VkDH+7PMHN6apQahcT96HCO/opBgii5paFc08Rs5nwmomd60gGnyp
         gRHxG6RIDbtou5W0DyIIBrYvRUv9r4KZbt2binyTBYyp7Pf4LfwITPP0V6I5+3Gpo7DK
         ceL7J1vW3IdIi5NyOXPftjDRntZbvYd2vysM/YlWs8tlmiJM/IC7YSWfC37uvTq5BOSi
         22toa3Ue44kX74GWj9K27K7KRT2BmrCuybcs/LPMUV+DN5gGy/kT7BawXBHnPPRkghc4
         YCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LICwPjw/3kWeAVFaS7cZEa1An4PYJYAkFM1YB+oeIuc=;
        fh=dl913iPfNrA2OqzFM5s8w96BWy5TnJzFxs2pNQzLPB8=;
        b=kNB/DgHGdU7ZWt8DKlfaarwX0kEYKv/rktdZ40lAfECqHejdeKuA1rPsNVzLij3hPI
         sPHmDtzrWtn87NiTTaNQMo1mc2Lj1qDPmn8nD+vkAmEVypqkJqCe33ymPqEmMQhr0GP3
         k86549bfMblC5HaQFmu+y1VGOC0YF4DFVQwYELwwwOFKeQuK5cWFqAmqXznNkWmvxD1p
         C+02ead+ZQ+QXixpQG++fnnxLyOx2UYY0F8Gvc8Pc4zSHQ9qzKr/rECdEqAzl3wjOkV/
         j88PSQzLzjmIrvRrgSdBMhmi+P4DSZKcqV60XVvszj0X7FNkMduOEq1Df6iUDvu/TaWL
         WagA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iFlK1jG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw20-20020a05620a601400b0076da7493e12si4443993qkb.505.2023.11.02.04.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iFlK1jG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW7J-00086L-CJ; Thu, 02 Nov 2023 07:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW7H-0007qR-3G
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW7F-00062I-3s
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LICwPjw/3kWeAVFaS7cZEa1An4PYJYAkFM1YB+oeIuc=;
 b=iFlK1jG8bzmno8MqD5yWJnqBvofJJ6g9gixEbwKBysbB2FQhLrdjlQL2Pe+Gz5td6jtgGE
 k+ECUvKXZ0+7ri+yBk0TxstClw0fDnOV4lDxNb8G4edUR/SzAu+NZ0aNDsazvM5TngOCf7
 dP0Xd2oOt1s44C9GVkhhoH+/RVdaYO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-gSXH1LkiNbWlL8vlM6sE6g-1; Thu, 02 Nov 2023 07:43:53 -0400
X-MC-Unique: gSXH1LkiNbWlL8vlM6sE6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CD4C101A54C;
 Thu,  2 Nov 2023 11:43:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C212B2026D4C;
 Thu,  2 Nov 2023 11:43:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Steve Sistare <steven.sistare@oracle.com>
Subject: [PULL 22/40] cpr: relax blockdev migration blockers
Date: Thu,  2 Nov 2023 12:40:36 +0100
Message-ID: <20231102114054.44360-23-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TNm7LPHPplz3

From: Steve Sistare <steven.sistare@oracle.com>

Some blockdevs block migration because they do not support sharing across
hosts and/or do not support dirty bitmaps.  These prohibitions do not apply
if the old and new qemu processes do not run concurrently, and if new qemu
starts on the same host as old, which is the case for cpr.  Narrow the scope
of these blockers so they only apply to normal mode.  They will not block
cpr modes when they are added in subsequent patches.

No functional change until a new mode is added.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <1698263069-406971-4-git-send-email-steven.sistare@oracle.com>
---
 block/parallels.c | 2 +-
 block/qcow.c      | 2 +-
 block/vdi.c       | 2 +-
 block/vhdx.c      | 2 +-
 block/vmdk.c      | 2 +-
 block/vpc.c       | 2 +-
 block/vvfat.c     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 1d695ce7fb..6318dd02e7 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -1369,7 +1369,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
                bdrv_get_device_or_node_name(bs));
     bdrv_graph_rdunlock_main_loop();
 
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/qcow.c b/block/qcow.c
index fdd4c83948..eab68e387c 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -307,7 +307,7 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
                bdrv_get_device_or_node_name(bs));
     bdrv_graph_rdunlock_main_loop();
 
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vdi.c b/block/vdi.c
index fd7e365383..c647d72895 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -498,7 +498,7 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
                bdrv_get_device_or_node_name(bs));
     bdrv_graph_rdunlock_main_loop();
 
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
     if (ret < 0) {
         goto fail_free_bmap;
     }
diff --git a/block/vhdx.c b/block/vhdx.c
index e37f8c0926..a9d08742f9 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1096,7 +1096,7 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vhdx format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index 1335d39e16..85864b8045 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1386,7 +1386,7 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     error_setg(&s->migration_blocker, "The vmdk format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vpc.c b/block/vpc.c
index c30cf8689a..aa1a48ae0e 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -452,7 +452,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
                bdrv_get_device_or_node_name(bs));
     bdrv_graph_rdunlock_main_loop();
 
-    ret = migrate_add_blocker(&s->migration_blocker, errp);
+    ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
     if (ret < 0) {
         goto fail;
     }
diff --git a/block/vvfat.c b/block/vvfat.c
index 266e036dcd..9d050ba3ae 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1268,7 +1268,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                    "The vvfat (rw) format used by node '%s' "
                    "does not support live migration",
                    bdrv_get_device_or_node_name(bs));
-        ret = migrate_add_blocker(&s->migration_blocker, errp);
+        ret = migrate_add_blocker_normal(&s->migration_blocker, errp);
         if (ret < 0) {
             goto fail;
         }
-- 
2.41.0

