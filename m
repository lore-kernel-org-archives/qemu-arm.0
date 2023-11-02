Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp325431eja;
        Thu, 2 Nov 2023 04:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0cetrlfeajboz/pYAhXLiKY1M7J09gHso/vXOa6skjGMqaS/sm0QJnbYPT4/tIK4QBsY3
X-Received: by 2002:a05:6808:13ce:b0:3b2:ee79:c0fd with SMTP id d14-20020a05680813ce00b003b2ee79c0fdmr23382407oiw.1.1698925899765;
        Thu, 02 Nov 2023 04:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925899; cv=none;
        d=google.com; s=arc-20160816;
        b=YqU3Qoba85eg0G/nsmP/QL1SIM2b/oSZamiT0vUXoeHt2pNQNsuKRTMVtR1rZfAN78
         6JpRk1OEtJqmLk/34h+ViuBH55BlexE2AvkESpioNKKHMvjZxvp93RogJ94HU3DC43cV
         FZsLMrvtJTeEmxk9F1cpBGdtpQAfdBhZXlC5IQnpnzzmENcdn0SGTnaCbt21aw2Aqj44
         0Tf/d3BC3fyjVyk+8Wa49Cv0t+pogHJkgUFcBpt58uYEb2VlAjQqm6bIM/9CBTqrynuU
         m3NYH1CQ/V7NL1Uh2qYiFGj821eN7vM0xS1YkjuK2M2NSVlTeWQNQTvlk1lBZXJ5hWHu
         f2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=A2dUeUEkHOWtdapffpWvq6I3Lhn/0yHvWITCRBykm30=;
        fh=T4EM+6jbLn5eRwObk7JR2S+dK3nM2HMDfFhJxfrmv8w=;
        b=CZxCr0Hd+zwebAgqALfVOoi75K51ss3S6nV9vD7dAKYMolE1zJiB1uV/f4UIEpeuIO
         YfWdx9acfCsgpNv+LoJ/7lxZP+/DLSaPNr31T2MqH9VnIhCVvL4Aah18MsAs7xRq/iIW
         JXxvpdlqUL/ZLXEHT2Ic319ArE4MLBtEFpSpwWyhgiZxj5oGWw2sODBRn3MoNABcGnfM
         tzirwELmEiesjHWa6SJngdF2g7IuV50dnuDBbhKlJl3/3KfDMp3+4EKjAtPqUNhCR/Rx
         FkA3RmB4+PcwoItLRbnAORTJ3zfxDztvbelGDwAxQsnfT7KFWcsdblfS0OklQBTmPiIl
         KRkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eiJBxoyV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a37e30d000000b00778b6e3d867si4076999qki.666.2023.11.02.04.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eiJBxoyV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyWAW-0001EK-Cy; Thu, 02 Nov 2023 07:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW91-0007u9-4c
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW8t-0006lH-Rs
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2dUeUEkHOWtdapffpWvq6I3Lhn/0yHvWITCRBykm30=;
 b=eiJBxoyVqRshGCbuyoOgwGR2qrVNrMPJFosx140N6OoNcd+SVt8d7ffpK6wZirl/yNRnzq
 TwsTXC+X++/MlwtnmX7xD0RGl9xVER1R/X+5PQK/AUcj3iesQNlXd+gB9P61LJOLPRQz6u
 6KcctypyMNlO6xSR78CZSBhFbzh+IXg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-Di8xxpG5NfKkJuDTFU8eaQ-1; Thu,
 02 Nov 2023 07:45:35 -0400
X-MC-Unique: Di8xxpG5NfKkJuDTFU8eaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D53623C14906;
 Thu,  2 Nov 2023 11:45:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AFA32026D4C;
 Thu,  2 Nov 2023 11:45:26 +0000 (UTC)
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
 Fam Zheng <fam@euphon.net>
Subject: [PULL 35/40] migration: Convert the file backend to the new QAPI
 syntax
Date: Thu,  2 Nov 2023 12:40:49 +0100
Message-ID: <20231102114054.44360-36-quintela@redhat.com>
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
X-TUID: jc57GPnTcB+n

From: Fabiano Rosas <farosas@suse.de>

Convert the file: URI to accept a FileMigrationArgs to be compatible
with the new migration QAPI.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231023182053.8711-9-farosas@suse.de>
---
 migration/file.h      |  9 ++++++---
 migration/file.c      | 22 +++++++---------------
 migration/migration.c | 10 ++++------
 3 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/migration/file.h b/migration/file.h
index 3888a57105..37d6a08bfc 100644
--- a/migration/file.h
+++ b/migration/file.h
@@ -7,9 +7,12 @@
 
 #ifndef QEMU_MIGRATION_FILE_H
 #define QEMU_MIGRATION_FILE_H
-void file_start_incoming_migration(const char *filename, Error **errp);
 
-void file_start_outgoing_migration(MigrationState *s, const char *filename,
-                                   Error **errp);
+#include "qapi/qapi-types-migration.h"
+
+void file_start_incoming_migration(FileMigrationArgs *file_args, Error **errp);
+
+void file_start_outgoing_migration(MigrationState *s,
+                                   FileMigrationArgs *file_args, Error **errp);
 int file_parse_offset(char *filespec, uint64_t *offsetp, Error **errp);
 #endif
diff --git a/migration/file.c b/migration/file.c
index ec069ef329..5d4975f43e 100644
--- a/migration/file.c
+++ b/migration/file.c
@@ -36,20 +36,16 @@ int file_parse_offset(char *filespec, uint64_t *offsetp, Error **errp)
     return 0;
 }
 
-void file_start_outgoing_migration(MigrationState *s, const char *filespec,
-                                   Error **errp)
+void file_start_outgoing_migration(MigrationState *s,
+                                   FileMigrationArgs *file_args, Error **errp)
 {
-    g_autofree char *filename = g_strdup(filespec);
     g_autoptr(QIOChannelFile) fioc = NULL;
-    uint64_t offset = 0;
+    g_autofree char *filename = g_strdup(file_args->filename);
+    uint64_t offset = file_args->offset;
     QIOChannel *ioc;
 
     trace_migration_file_outgoing(filename);
 
-    if (file_parse_offset(filename, &offset, errp)) {
-        return;
-    }
-
     fioc = qio_channel_file_new_path(filename, O_CREAT | O_WRONLY | O_TRUNC,
                                      0600, errp);
     if (!fioc) {
@@ -73,19 +69,15 @@ static gboolean file_accept_incoming_migration(QIOChannel *ioc,
     return G_SOURCE_REMOVE;
 }
 
-void file_start_incoming_migration(const char *filespec, Error **errp)
+void file_start_incoming_migration(FileMigrationArgs *file_args, Error **errp)
 {
-    g_autofree char *filename = g_strdup(filespec);
+    g_autofree char *filename = g_strdup(file_args->filename);
     QIOChannelFile *fioc = NULL;
-    uint64_t offset = 0;
+    uint64_t offset = file_args->offset;
     QIOChannel *ioc;
 
     trace_migration_file_incoming(filename);
 
-    if (file_parse_offset(filename, &offset, errp)) {
-        return;
-    }
-
     fioc = qio_channel_file_new_path(filename, O_RDONLY, 0, errp);
     if (!fioc) {
         return;
diff --git a/migration/migration.c b/migration/migration.c
index 0911fb310c..04037b340c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -508,7 +508,6 @@ static bool migrate_uri_parse(const char *uri,
 
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
-    const char *p = NULL;
     g_autoptr(MigrationAddress) channel = NULL;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
@@ -551,8 +550,8 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 #endif
     } else if (channel->transport == MIGRATION_ADDRESS_TYPE_EXEC) {
         exec_start_incoming_migration(channel->u.exec.args, errp);
-    } else if (strstart(uri, "file:", &p)) {
-        file_start_incoming_migration(p, errp);
+    } else if (channel->transport == MIGRATION_ADDRESS_TYPE_FILE) {
+        file_start_incoming_migration(&channel->u.file, errp);
     } else {
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
@@ -1900,7 +1899,6 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
     bool resume_requested;
     Error *local_err = NULL;
     MigrationState *s = migrate_get_current();
-    const char *p = NULL;
     g_autoptr(MigrationAddress) channel = NULL;
 
     /* URI is not suitable for migration? */
@@ -1940,8 +1938,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
 #endif
     } else if (channel->transport == MIGRATION_ADDRESS_TYPE_EXEC) {
         exec_start_outgoing_migration(s, channel->u.exec.args, &local_err);
-    } else if (strstart(uri, "file:", &p)) {
-        file_start_outgoing_migration(s, p, &local_err);
+    } else if (channel->transport == MIGRATION_ADDRESS_TYPE_FILE) {
+        file_start_outgoing_migration(s, &channel->u.file, &local_err);
     } else {
         error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
                    "a valid migration protocol");
-- 
2.41.0

