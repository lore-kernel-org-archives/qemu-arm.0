Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4865868lfp;
        Mon, 3 Feb 2020 21:10:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkexk/R+YrvFiz0UuBHD8YX0o2TFXApVhrvNijdTjuBlZOJ0kEYR1RJOCTISRItXU/BItw
X-Received: by 2002:a05:620a:126d:: with SMTP id b13mr9988143qkl.124.1580793056554;
        Mon, 03 Feb 2020 21:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580793056; cv=none;
        d=google.com; s=arc-20160816;
        b=bOgI+0MW9SXnFiSaS7ttzH2Wpl2syEsdPysGqIhYG3lFQUnUk0QvQO8E27kqZ3YgI0
         l+FlGpMbk4oJ3vMhvUjj7wzPERKcndr4XQbOvkYauk+i17KFp1ipZhIg37gBfFg+5og+
         TorYI3qsiVqqauPJV/i9leJbIVxJI7BUH8FiipCGmCC7K7AmLCRoFYHVE6H490wYsx5k
         ZZzTZpd0q2xNcmIm3UTGc8iSuuo3wBAtgynG89iauQxDsULh5c2vHrYSgE+W1tq2+1Tx
         7W1XlZQhyx74pSkJQkQNAyf0x3vMg5mojTKTqRepiT6hzLsGo9lm00gkK3qDUAYOnfA9
         q0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=FnuQBtivZ7EncxzIflJmnkWYs8AiupbYMzRIoNKSWGQ=;
        b=RgBgslewq6KmNkAGRwptwQgnUw3y84HRQVXahyIq7PjBINycfZdxdMBeyxtHMKGlvb
         eoyAEoJPJ//YotI6W6BovCl0viGB4PVmN5U8gs1J9/R7+VYaO2ENJ9WwlCOgYXyouP0t
         7LpoS5fdJnH1VeWk4H4G1u6znN2dA/6OwjhxQbvOxFkW8ymNpRqrXOtV7cTH+cZkCPGy
         jqv8YLegCs1cHfDYpVASQLgvXuX2XQ1jALMZJ2+uWlMNr3CMw322EX7oIl6gsYHOIUmB
         qUMAKmtj/TEtb65qwdP29NHNKjRH+BJ+eZkfOk4X2x40z9buOye+AadbKjbwpO9UET2f
         Qnaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si13447012qte.198.2020.02.03.21.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 21:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyqUB-00030B-Pp
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 00:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1iyqU2-000304-9p
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 00:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1iyqU1-0003oJ-1d
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 00:10:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:41470 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1iyqU0-0002n0-Mu; Tue, 04 Feb 2020 00:10:44 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 68DF8C6E135F0EF27316;
 Tue,  4 Feb 2020 13:10:36 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 13:10:29 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] migration: Optimization about wait-unplug migration state
Date: Tue, 4 Feb 2020 13:08:41 +0800
Message-ID: <20200204050841.44453-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, jfreimann@redhat.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ka+DZ161lfWK

qemu_savevm_nr_failover_devices() is originally designed to
get the number of failover devices, but it actually returns
the number of "unplug-pending" failover devices now. Moreover,
what drives migration state to wait-unplug should be the number
of "unplug-pending" failover devices, not all failover devices.

We can also notice that qemu_savevm_state_guest_unplug_pending()
and qemu_savevm_nr_failover_devices() is equivalent almost (from
the code view). So the latter is incorrect semantically and
useless, just delete it.

In the qemu_savevm_state_guest_unplug_pending(), once hit a
unplug-pending failover device, then it can return true right
now to save cpu time.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
Cc: jfreimann@redhat.com
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
 migration/migration.c |  2 +-
 migration/savevm.c    | 24 +++---------------------
 migration/savevm.h    |  1 -
 3 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3a21a4686c..deedc968cf 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3333,7 +3333,7 @@ static void *migration_thread(void *opaque)
=20
     qemu_savevm_state_setup(s->to_dst_file);
=20
-    if (qemu_savevm_nr_failover_devices()) {
+    if (qemu_savevm_state_guest_unplug_pending()) {
         migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                           MIGRATION_STATUS_WAIT_UNPLUG);
=20
diff --git a/migration/savevm.c b/migration/savevm.c
index f19cb9ec7a..1d4220ece8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1140,36 +1140,18 @@ void qemu_savevm_state_header(QEMUFile *f)
     }
 }
=20
-int qemu_savevm_nr_failover_devices(void)
+bool qemu_savevm_state_guest_unplug_pending(void)
 {
     SaveStateEntry *se;
-    int n =3D 0;
=20
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (se->vmsd && se->vmsd->dev_unplug_pending &&
             se->vmsd->dev_unplug_pending(se->opaque)) {
-            n++;
-        }
-    }
-
-    return n;
-}
-
-bool qemu_savevm_state_guest_unplug_pending(void)
-{
-    SaveStateEntry *se;
-    int n =3D 0;
-
-    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-        if (!se->vmsd || !se->vmsd->dev_unplug_pending) {
-            continue;
-        }
-        if (se->vmsd->dev_unplug_pending(se->opaque)) {
-            n++;
+            return true;
         }
     }
=20
-    return n > 0;
+    return false;
 }
=20
 void qemu_savevm_state_setup(QEMUFile *f)
diff --git a/migration/savevm.h b/migration/savevm.h
index c42b9c80ee..ba64a7e271 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -31,7 +31,6 @@
=20
 bool qemu_savevm_state_blocked(Error **errp);
 void qemu_savevm_state_setup(QEMUFile *f);
-int qemu_savevm_nr_failover_devices(void);
 bool qemu_savevm_state_guest_unplug_pending(void);
 int qemu_savevm_state_resume_prepare(MigrationState *s);
 void qemu_savevm_state_header(QEMUFile *f);
--=20
2.19.1

