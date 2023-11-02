Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321773eja;
        Thu, 2 Nov 2023 04:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF3P5+fYDrrAtRyKSvfdv79jjL9E2N7Hf+8z195lMWdhMhbOlwK09VWsXDSMxL6RXbeDec
X-Received: by 2002:a05:6830:4386:b0:6d3:fb6:3f9c with SMTP id s6-20020a056830438600b006d30fb63f9cmr9020870otv.15.1698925467481;
        Thu, 02 Nov 2023 04:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925467; cv=none;
        d=google.com; s=arc-20160816;
        b=kyBwdMe8luOCMH4LUp4yYZOR4qTr6k/Y20A6ViriyacPdrC6q5TTQJnIPJm9F7mkTt
         NIaR+ta8N5+QCtPOLqAioOXqBI/GGsKgBQn3O34Y6b2lTHC/sFie2kmsUQjQJ0oiq3VJ
         297tL+GQp9JfRizj/7LFagEFWRfszmHmnOiMlshy8tcIrdc694KFIisXO+G2lQqIs3GF
         fb9y5aHs5OnJTRnersj91I/qw8IcQC4O83A+TzHbmHQjr0fmvc3tUjRaHx7EAxMUnosF
         sqXH13iEFjocwWSxCNFxRpbiOAHH3Ha0SCOpZ4yoYJoPgXPLrprCDl40E+wX38eytzDl
         WtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A3urJpzcWBNu+N6FvtT6GHVVyu20J9BGWB+Gu+5Odqc=;
        fh=dl913iPfNrA2OqzFM5s8w96BWy5TnJzFxs2pNQzLPB8=;
        b=UrGsoX/UKib44fU+v8vRU6zYsbmgPYE/46VyzKv1vomd02sN8L2Il+uOdHbhFfvm5F
         P83s6WCdJjqdYF401gmRW1P+o3yHkj2LcVQqjP3BvbXtQEsFlxcsur7ZwSEOItkmbyIE
         KXak01PRQ00G57YPUZDFaR3q8ZTd4loRAEl2eU9DRG9kjQUPbAbV32vkfiyC1xgpH6iQ
         vwbrct+/9rqpEJs11eyOdCKymrz+1qUmqfaggk8PqOwNCQqEC2iV1JSFLM5pUOhc0lsd
         08ce3YVF2s5LJmDl1p4Ed2+hAMGqg88sZ7OXRu9DIHyuWxAdsQ88Q5aHywePEfyzFNmG
         l9Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8UPdE5o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a05622a024900b00419785d97c8si4310571qtx.564.2023.11.02.04.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8UPdE5o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyW7Z-0001uF-C4; Thu, 02 Nov 2023 07:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW7V-0001QU-JO
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW7T-00065k-1C
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3urJpzcWBNu+N6FvtT6GHVVyu20J9BGWB+Gu+5Odqc=;
 b=P8UPdE5oXJZO9YlgfGV2xtcfRn96+8oFokt09TAoAGG2Jyypoup4eHw/X1KD4E12fq5J5Q
 7tK3gDE8L5jsAXk7MpcUnGG3qgERLXUqBsbUDJHdbPS17/NDgc4dl7H4Ot5Q6i4d5rPsIm
 da5TGiv+5uQlXyMzElXmfqwmL+IO+7Y=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-bFZVhtncMQC8XQuQrStdiQ-1; Thu,
 02 Nov 2023 07:44:09 -0400
X-MC-Unique: bFZVhtncMQC8XQuQrStdiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A933380662F;
 Thu,  2 Nov 2023 11:44:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 365552026D4C;
 Thu,  2 Nov 2023 11:44:00 +0000 (UTC)
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
Subject: [PULL 24/40] cpr: reboot mode
Date: Thu,  2 Nov 2023 12:40:38 +0100
Message-ID: <20231102114054.44360-25-quintela@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lg74UYg4auyi

From: Steve Sistare <steven.sistare@oracle.com>

Add the cpr-reboot migration mode.  Usage:

$ qemu-system-$arch -monitor stdio ...
QEMU 8.1.50 monitor - type 'help' for more information
(qemu) migrate_set_capability x-ignore-shared on
(qemu) migrate_set_parameter mode cpr-reboot
(qemu) migrate -d file:vm.state
(qemu) info status
VM status: paused (postmigrate)
(qemu) quit

$ qemu-system-$arch -monitor stdio -incoming defer ...
QEMU 8.1.50 monitor - type 'help' for more information
(qemu) migrate_set_capability x-ignore-shared on
(qemu) migrate_set_parameter mode cpr-reboot
(qemu) migrate_incoming file:vm.state
(qemu) info status
VM status: running

In this mode, the migrate command saves state to a file, allowing one
to quit qemu, reboot to an updated kernel, and restart an updated version
of qemu.  The caller must specify a migration URI that writes to and reads
from a file.  Unlike normal mode, the use of certain local storage options
does not block the migration, but the caller must not modify guest block
devices between the quit and restart.  To avoid saving guest RAM to the
file, the memory backend must be shared, and the @x-ignore-shared migration
capability must be set.  Guest RAM must be non-volatile across reboot, such
as by backing it with a dax device, but this is not enforced.  The restarted
qemu arguments must match those used to initially start qemu, plus the
-incoming option.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <1698263069-406971-6-git-send-email-steven.sistare@oracle.com>
---
 qapi/migration.json              | 15 ++++++++++++++-
 hw/core/qdev-properties-system.c |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 47c02a9346..3daeffc95d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -636,9 +636,22 @@
 #
 # @normal: the original form of migration. (since 8.2)
 #
+# @cpr-reboot: The migrate command saves state to a file, allowing one to
+#              quit qemu, reboot to an updated kernel, and restart an updated
+#              version of qemu.  The caller must specify a migration URI
+#              that writes to and reads from a file.  Unlike normal mode,
+#              the use of certain local storage options does not block the
+#              migration, but the caller must not modify guest block devices
+#              between the quit and restart.  To avoid saving guest RAM to the
+#              file, the memory backend must be shared, and the @x-ignore-shared
+#              migration capability must be set.  Guest RAM must be non-volatile
+#              across reboot, such as by backing it with a dax device, but this
+#              is not enforced.  The restarted qemu arguments must match those
+#              used to initially start qemu, plus the -incoming option.
+#              (since 8.2)
 ##
 { 'enum': 'MigMode',
-  'data': [ 'normal' ] }
+  'data': [ 'normal', 'cpr-reboot' ] }
 
 ##
 # @BitmapMigrationBitmapAliasTransform:
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b9179e8917..2f1dbb3fd7 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -680,7 +680,7 @@ QEMU_BUILD_BUG_ON(sizeof(MigMode) != sizeof(int));
 const PropertyInfo qdev_prop_mig_mode = {
     .name = "MigMode",
     .description = "mig_mode values, "
-                   "normal",
+                   "normal,cpr-reboot",
     .enum_table = &MigMode_lookup,
     .get = qdev_propinfo_get_enum,
     .set = qdev_propinfo_set_enum,
-- 
2.41.0

