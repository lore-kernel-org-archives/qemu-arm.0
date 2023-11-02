Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp323276eja;
        Thu, 2 Nov 2023 04:47:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsCsiiNQsq1VKdVip+vcR/vRiINEgvw1b9sYER14rS39LXfX2zw2PHqXGwUJMQKYh/xfY3
X-Received: by 2002:ac8:594a:0:b0:41e:23c7:ec24 with SMTP id 10-20020ac8594a000000b0041e23c7ec24mr21451459qtz.59.1698925638014;
        Thu, 02 Nov 2023 04:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925638; cv=none;
        d=google.com; s=arc-20160816;
        b=UQkPDsdIPClRdq9hlJ+XegJQF0Rk8hRRsL82Oh2BWsKM8+lKVTFnl3JZXHyZzHgEY1
         Jtv5FTg0UrF9eorqt2YLJwJcMX9gRbz7uAk0faNGgxd4JMzDRAPeQ5xSNbcneG2xZ9Nx
         KGRiOGZax0Ync25LqlwP63wvifs/qsBXuDe99gtA4Qwhqb6+9D/Tv+oPbYB/Yss/yJtr
         wwZsg4wtwlAPBLHNkA8SRCos8ICPTvBGwRrUNmdFJ+LYhVvwfSGPkXCIShH93zlCbm5l
         QlzV9XI7gHOzFkSQ1h2p6jpX0vts6NnU5aAfAiSnpAAxwnSIMi+KXaeZyIeNGmscKKyk
         e4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=juXYONqV+/W0nBHoFpD72iSqcDaEYIDEPx7/03c+W6Y=;
        fh=dl913iPfNrA2OqzFM5s8w96BWy5TnJzFxs2pNQzLPB8=;
        b=D0XgK3YlL5MQvkc3saKsNnG8tE7bzKlBj86zvJxieunMhQLQnHMBXjXut9AuuEMQJ8
         +Q0RxQuM0bg56Fe5XLkhAkB8MmO0LGqLVr+b5P8Jqn77zzohRM4GgJ66NmLLqhRjNvw0
         ziI8xaHkGAJ8y2quzuYLs1bTom+azuyWe/LGU0JkAAaYGLrSmpIiziy8SwmMjeLNZxH0
         qR7MdUcJivnmmgcD9hnJomyokZ7Hv+9vNK4mrfYtbVxFou0tEi+5nOhRldvBwACEyLji
         3CCWzFZxIKYmsPRnNFghJf5ussbCbQOCxNGVI5fqN0iOphkYG6YBung6WVaT42ywu+P9
         VeeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ilvsc7Cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a05622a148800b004121604095asi4577664qtx.61.2023.11.02.04.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:47:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ilvsc7Cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW7O-0000UZ-Hm; Thu, 02 Nov 2023 07:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW7M-0000E3-MN
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW7J-00063x-Sg
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juXYONqV+/W0nBHoFpD72iSqcDaEYIDEPx7/03c+W6Y=;
 b=Ilvsc7CuldllT+4phK0F5EQL4GlqLv6sEsUI/A0sl6na1QGhS10d3KYksri5Uv8AVDV5KT
 kxDmz2WSBCDesmvs4uifC61u6nzE96YcGbhbGAChp4VrRDYYWNRIS1lvJc+6m+6Vh12SVa
 QLrpSnThshcE0StWLYXoISvPRrn170M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-q6u3DRwIPHumia6WlCgZjg-1; Thu, 02 Nov 2023 07:44:01 -0400
X-MC-Unique: q6u3DRwIPHumia6WlCgZjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCBF5101A52D;
 Thu,  2 Nov 2023 11:43:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 844BB2026D4C;
 Thu,  2 Nov 2023 11:43:52 +0000 (UTC)
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
Subject: [PULL 23/40] cpr: relax vhost migration blockers
Date: Thu,  2 Nov 2023 12:40:37 +0100
Message-ID: <20231102114054.44360-24-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: cBq7/O/blw6R

From: Steve Sistare <steven.sistare@oracle.com>

vhost blocks migration if logging is not supported to track dirty
memory, and vhost-user blocks it if the log cannot be saved to a shm fd.

vhost-vdpa blocks migration if both hosts do not support all the device's
features using a shadow VQ, for tracking requests and dirty memory.

vhost-scsi blocks migration if storage cannot be shared across hosts,
or if state cannot be migrated.

None of these conditions apply if the old and new qemu processes do
not run concurrently, and if new qemu starts on the same host as old,
which is the case for cpr.

Narrow the scope of these blockers so they only apply to normal mode.
They will not block cpr modes when they are added in subsequent patches.

No functional change until a new mode is added.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <1698263069-406971-5-git-send-email-steven.sistare@oracle.com>
---
 hw/scsi/vhost-scsi.c | 2 +-
 hw/virtio/vhost.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 5d9e06a9bb..3126df9e1d 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -210,7 +210,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
                 "When external environment supports it (Orchestrator migrates "
                 "target SCSI device state or use shared storage over network), "
                 "set 'migratable' property to true to enable migration.");
-        if (migrate_add_blocker(&vsc->migration_blocker, errp) < 0) {
+        if (migrate_add_blocker_normal(&vsc->migration_blocker, errp) < 0) {
             goto free_virtio;
         }
     }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index aa7b272452..9c9ae7109e 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1527,7 +1527,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     }
 
     if (hdev->migration_blocker != NULL) {
-        r = migrate_add_blocker(&hdev->migration_blocker, errp);
+        r = migrate_add_blocker_normal(&hdev->migration_blocker, errp);
         if (r < 0) {
             goto fail_busyloop;
         }
-- 
2.41.0

