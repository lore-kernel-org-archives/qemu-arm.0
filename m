Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321485eja;
        Thu, 2 Nov 2023 04:43:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGyMX3Y6pIjB+F+ETJ+26SdCkoscsbYKIwPJ0U1KZERkprznhg8aQsykqO6Xv0jSjybfv6
X-Received: by 2002:a25:ce47:0:b0:da0:cb88:b890 with SMTP id x68-20020a25ce47000000b00da0cb88b890mr17772593ybe.60.1698925439599;
        Thu, 02 Nov 2023 04:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925439; cv=none;
        d=google.com; s=arc-20160816;
        b=U/ukdy9dV4fYTA1TIjveb33JHT7FKx97Ntsj9zvzCtFHOMc9LVjIzpBVc/RNJ+KJJe
         nQN3VtcKEXxcs0a6ZebqahIICk4y/jJHQQ/55yyvepzym+4nJjw1v0cdkoaCh7dNtFOa
         uwycv4ND8K72z18FmlP6cdZadvUrf8OPfO/OAZfXrp87oBavYPbxJgXECz3+BELI2eT5
         As2XhZNq38NWcd5g2hFEOsHWmKt9DfkUsTbl3ILh/xo9aQPZay4BjcOnXoMWjf3ZzDP5
         Ajqc0xnufgZV9Ju2PMH4TJC23Uk+w6rLO2tE0c+/Rz9JHg5lPLSC2ICJveBTBwX71r5c
         o5mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wrn4sanShClOlIiSikoqTAj7uLvyWROkN4mIZVT/0o4=;
        fh=dl913iPfNrA2OqzFM5s8w96BWy5TnJzFxs2pNQzLPB8=;
        b=XkT7sMiYtl2eujZthbUpgBnq1r02rLnmGQv2f6WdlvUKRC/T1xu2dr3kF4zPVeT9pO
         v1mqu3AEqM5Ak/DpFy6sVJdmVY26LZMW33a2I/n7SZppRN3x8vCc77xRBR/Ajf4QNMSl
         b0Q7TBKgN0EI0odFuBTAV9uX1bKoeYi0VY5xdtR1zmSUsrBC0LNkP0wrSlMrPmIVxrxV
         Q9IbC9+7h7TTRG73p7kzltqGTET0qQIaNe+mjOXWIp9c7Y1/QgOuThUeT8XB/NFCiS22
         bszLH1jBofBP79Py4LNeG2oisvLJbMh0kZmikT0G7tuBWusmsW/VQl7nyG0BFWiugI+e
         N0Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XoTwP/EF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dj3-20020a056214090300b00670c7fd09dfsi4156708qvb.279.2023.11.02.04.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XoTwP/EF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW7C-0007Fc-9p; Thu, 02 Nov 2023 07:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW76-0006RZ-Aw
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW74-0005yP-18
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrn4sanShClOlIiSikoqTAj7uLvyWROkN4mIZVT/0o4=;
 b=XoTwP/EFoOmMuMFIAn0IkopFg9KNJlCTiClnLyNTZyNcEEHJzV4/IuKBwlEH1XqMYdtSBy
 P2/M8aAK8aWDItmoKdZDk+KOMYbQI4WSdn+N4DKpsUjDO8X9FZ7tbd+FWGoDf8Fl5VZGnz
 UidPVy0rWAWVmNzyBsEJd1Mzis0FW0Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-qHmvaO63MTScDgTNJpg9Iw-1; Thu, 02 Nov 2023 07:43:46 -0400
X-MC-Unique: qHmvaO63MTScDgTNJpg9Iw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7360F101A529;
 Thu,  2 Nov 2023 11:43:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9EC2026D4C;
 Thu,  2 Nov 2023 11:43:36 +0000 (UTC)
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
Subject: [PULL 21/40] migration: per-mode blockers
Date: Thu,  2 Nov 2023 12:40:35 +0100
Message-ID: <20231102114054.44360-22-quintela@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YElNll7g0hcn

From: Steve Sistare <steven.sistare@oracle.com>

Extend the blocker interface so that a blocker can be registered for
one or more migration modes.  The existing interfaces register a
blocker for all modes, and the new interfaces take a varargs list
of modes.

Internally, maintain a separate blocker list per mode.  The same Error
object may be added to multiple lists.  When a block is deleted, it is
removed from every list, and the Error is freed.

No functional change until a new mode is added.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <1698263069-406971-3-git-send-email-steven.sistare@oracle.com>
---
 include/migration/blocker.h | 44 +++++++++++++++--
 migration/migration.c       | 95 ++++++++++++++++++++++++++++++++-----
 stubs/migr-blocker.c        | 10 ++++
 3 files changed, 132 insertions(+), 17 deletions(-)

diff --git a/include/migration/blocker.h b/include/migration/blocker.h
index b048f301b4..a687ac0efe 100644
--- a/include/migration/blocker.h
+++ b/include/migration/blocker.h
@@ -14,8 +14,12 @@
 #ifndef MIGRATION_BLOCKER_H
 #define MIGRATION_BLOCKER_H
 
+#include "qapi/qapi-types-migration.h"
+
+#define MIG_MODE_ALL MIG_MODE__MAX
+
 /**
- * @migrate_add_blocker - prevent migration from proceeding
+ * @migrate_add_blocker - prevent all modes of migration from proceeding
  *
  * @reasonp - address of an error to be returned whenever migration is attempted
  *
@@ -30,8 +34,8 @@
 int migrate_add_blocker(Error **reasonp, Error **errp);
 
 /**
- * @migrate_add_blocker_internal - prevent migration from proceeding without
- *                                 only-migrate implications
+ * @migrate_add_blocker_internal - prevent all modes of migration from
+ *                                 proceeding, but ignore -only-migratable
  *
  * @reasonp - address of an error to be returned whenever migration is attempted
  *
@@ -50,7 +54,7 @@ int migrate_add_blocker(Error **reasonp, Error **errp);
 int migrate_add_blocker_internal(Error **reasonp, Error **errp);
 
 /**
- * @migrate_del_blocker - remove a blocking error from migration and free it.
+ * @migrate_del_blocker - remove a migration blocker from all modes and free it.
  *
  * @reasonp - address of the error blocking migration
  *
@@ -58,4 +62,36 @@ int migrate_add_blocker_internal(Error **reasonp, Error **errp);
  */
 void migrate_del_blocker(Error **reasonp);
 
+/**
+ * @migrate_add_blocker_normal - prevent normal migration mode from proceeding
+ *
+ * @reasonp - address of an error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
+ *
+ * *@reasonp is freed and set to NULL if failure is returned.
+ * On success, the caller must not free @reasonp, except by
+ *   calling migrate_del_blocker.
+ */
+int migrate_add_blocker_normal(Error **reasonp, Error **errp);
+
+/**
+ * @migrate_add_blocker_modes - prevent some modes of migration from proceeding
+ *
+ * @reasonp - address of an error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @mode - one or more migration modes to be blocked.  The list is terminated
+ *         by -1 or MIG_MODE_ALL.  For the latter, all modes are blocked.
+ *
+ * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
+ *
+ * *@reasonp is freed and set to NULL if failure is returned.
+ * On success, the caller must not free *@reasonp before the blocker is removed.
+ */
+int migrate_add_blocker_modes(Error **reasonp, Error **errp, MigMode mode, ...);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index c334b9effd..11c1490090 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -92,7 +92,7 @@ enum mig_rp_message_type {
 static MigrationState *current_migration;
 static MigrationIncomingState *current_incoming;
 
-static GSList *migration_blockers;
+static GSList *migration_blockers[MIG_MODE__MAX];
 
 static bool migration_object_check(MigrationState *ms, Error **errp);
 static int migration_maybe_pause(MigrationState *s,
@@ -1043,7 +1043,7 @@ static void fill_source_migration_info(MigrationInfo *info)
 {
     MigrationState *s = migrate_get_current();
     int state = qatomic_read(&s->state);
-    GSList *cur_blocker = migration_blockers;
+    GSList *cur_blocker = migration_blockers[migrate_mode()];
 
     info->blocked_reasons = NULL;
 
@@ -1507,38 +1507,105 @@ int migrate_init(MigrationState *s, Error **errp)
     return 0;
 }
 
-int migrate_add_blocker_internal(Error **reasonp, Error **errp)
+static bool is_busy(Error **reasonp, Error **errp)
 {
+    ERRP_GUARD();
+
     /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
     if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
         error_propagate_prepend(errp, *reasonp,
                                 "disallowing migration blocker "
                                 "(migration/snapshot in progress) for: ");
         *reasonp = NULL;
-        return -EBUSY;
+        return true;
     }
-
-    migration_blockers = g_slist_prepend(migration_blockers, *reasonp);
-    return 0;
+    return false;
 }
 
-int migrate_add_blocker(Error **reasonp, Error **errp)
+static bool is_only_migratable(Error **reasonp, Error **errp, int modes)
 {
-    if (only_migratable) {
+    ERRP_GUARD();
+
+    if (only_migratable && (modes & BIT(MIG_MODE_NORMAL))) {
         error_propagate_prepend(errp, *reasonp,
                                 "disallowing migration blocker "
                                 "(--only-migratable) for: ");
         *reasonp = NULL;
+        return true;
+    }
+    return false;
+}
+
+static int get_modes(MigMode mode, va_list ap)
+{
+    int modes = 0;
+
+    while (mode != -1 && mode != MIG_MODE_ALL) {
+        assert(mode >= MIG_MODE_NORMAL && mode < MIG_MODE__MAX);
+        modes |= BIT(mode);
+        mode = va_arg(ap, MigMode);
+    }
+    if (mode == MIG_MODE_ALL) {
+        modes = BIT(MIG_MODE__MAX) - 1;
+    }
+    return modes;
+}
+
+static int add_blockers(Error **reasonp, Error **errp, int modes)
+{
+    for (MigMode mode = 0; mode < MIG_MODE__MAX; mode++) {
+        if (modes & BIT(mode)) {
+            migration_blockers[mode] = g_slist_prepend(migration_blockers[mode],
+                                                       *reasonp);
+        }
+    }
+    return 0;
+}
+
+int migrate_add_blocker(Error **reasonp, Error **errp)
+{
+    return migrate_add_blocker_modes(reasonp, errp, MIG_MODE_ALL);
+}
+
+int migrate_add_blocker_normal(Error **reasonp, Error **errp)
+{
+    return migrate_add_blocker_modes(reasonp, errp, MIG_MODE_NORMAL, -1);
+}
+
+int migrate_add_blocker_modes(Error **reasonp, Error **errp, MigMode mode, ...)
+{
+    int modes;
+    va_list ap;
+
+    va_start(ap, mode);
+    modes = get_modes(mode, ap);
+    va_end(ap);
+
+    if (is_only_migratable(reasonp, errp, modes)) {
         return -EACCES;
+    } else if (is_busy(reasonp, errp)) {
+        return -EBUSY;
     }
+    return add_blockers(reasonp, errp, modes);
+}
 
-    return migrate_add_blocker_internal(reasonp, errp);
+int migrate_add_blocker_internal(Error **reasonp, Error **errp)
+{
+    int modes = BIT(MIG_MODE__MAX) - 1;
+
+    if (is_busy(reasonp, errp)) {
+        return -EBUSY;
+    }
+    return add_blockers(reasonp, errp, modes);
 }
 
 void migrate_del_blocker(Error **reasonp)
 {
     if (*reasonp) {
-        migration_blockers = g_slist_remove(migration_blockers, *reasonp);
+        for (MigMode mode = 0; mode < MIG_MODE__MAX; mode++) {
+            migration_blockers[mode] = g_slist_remove(migration_blockers[mode],
+                                                      *reasonp);
+        }
         error_free(*reasonp);
         *reasonp = NULL;
     }
@@ -1634,12 +1701,14 @@ void qmp_migrate_pause(Error **errp)
 
 bool migration_is_blocked(Error **errp)
 {
+    GSList *blockers = migration_blockers[migrate_mode()];
+
     if (qemu_savevm_state_blocked(errp)) {
         return true;
     }
 
-    if (migration_blockers) {
-        error_propagate(errp, error_copy(migration_blockers->data));
+    if (blockers) {
+        error_propagate(errp, error_copy(blockers->data));
         return true;
     }
 
diff --git a/stubs/migr-blocker.c b/stubs/migr-blocker.c
index 17a5dbf87b..11cbff268f 100644
--- a/stubs/migr-blocker.c
+++ b/stubs/migr-blocker.c
@@ -6,6 +6,16 @@ int migrate_add_blocker(Error **reasonp, Error **errp)
     return 0;
 }
 
+int migrate_add_blocker_normal(Error **reasonp, Error **errp)
+{
+    return 0;
+}
+
+int migrate_add_blocker_modes(Error **reasonp, Error **errp, MigMode mode, ...)
+{
+    return 0;
+}
+
 void migrate_del_blocker(Error **reasonp)
 {
 }
-- 
2.41.0

