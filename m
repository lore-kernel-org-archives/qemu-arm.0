Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF5CCD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 17:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX0Cx-0007aP-5X; Tue, 09 Jun 2026 13:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cd-0007Kv-Lw
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0CZ-0001p6-HO
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVVARmJUwhep7oD37d2RCWN4JLy97YXNlME0a8arUGM=;
 b=Z01QdNG+wea6xfS2B3ZgWSRjIIym0Vfb89BPTFaf+zJ3K6DmQjhKcc4kRK76M2JcomK9oK
 0IdL0hm16JtTobpBJc6NE/5IodR4tkts3vDw6niQlzv2sDWbyWVTxM/578xQtF7P6CboTm
 dM9yu1KJZ8BTGWIOokoNrR9BY5/nx4U=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-o1_yU7FKODiHpbSCZ9PSpw-1; Tue, 09 Jun 2026 13:25:21 -0400
X-MC-Unique: o1_yU7FKODiHpbSCZ9PSpw-1
X-Mimecast-MFC-AGG-ID: o1_yU7FKODiHpbSCZ9PSpw_1781025920
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5178fc89b2aso95897491cf.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 10:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025920; x=1781630720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aVVARmJUwhep7oD37d2RCWN4JLy97YXNlME0a8arUGM=;
 b=EmkHQbNuTEabXjzkYiwHl8BkNrBGEALHd16eHHC9BY0QYf6/zSlNvjK2h+YkyL3SzZ
 aRI+ffHodQwhpXxpg2qn5vzK40f3lE2FrgHfKN7tH1w/4gE2KjtSKueLalc+dJF8+kwq
 nj4pg/XIt94CwbqEaWcAVNBuhF9sggZ9y5iPm62PVoJZNeOB7JuiYYwHvW1JEGkBlhYu
 OEXO6k0eGa0SWlB4ehtikyirysSkmpoiBZAPqHlzQHAVX9pE/rngSmrnUwlRJQgsFYOM
 uNUS+QqFEDtsWXvZ1sg4zfYVnW1fVXLTQkO4QYXaVa9ZAYLWBtq8eQCWdfJiTvlwD8Ro
 t1FQ==
X-Gm-Message-State: AOJu0Yz/mPyFFMGeUoFkMZaxepZanPbm8CPOHTVopTwd1hiLymFSqTWg
 Xn+Y+kdedFZJTj5e/WvUHIbJUIIOfXWGWyOsh+6pbuQ+AyIsv4cXzCDb/OIUb61+j2ooWS7ZkDB
 CahxBhcpcqJvZM92Bggqy3RKw6778twlx57cr2rBcC+p19eIrZCdDlg==
X-Gm-Gg: Acq92OE8+t1Nn/ViD10R5BFwtiKpTH8TBv/zVAtZ7ljUQjzZEu0tkHa44cE0px09H3v
 LsCzrEG8wDDnnDqjjTC9EakCJ+S/8Ip5I07knz6IdFvPnMI3haArAcRxpKsomCNohnn/Ki0VEhC
 W9jz0N433jPUNC69bAXCP2CcT2xOX9hIPbk9jZxXR3wsYybHRfXE5OiIozFcubqrZAeQc31Qd1s
 kIPrLb/0HCPyDGzt/NOg5Z+R9OQNbVCSiNQT+CMYD3Hde/XbR7RKgK2UsNsDu8tcV0Vt+tUEYhF
 w/53e3Sxj78x7tWs8R6oj1SlmQyMwd+sj2UJhoY72fxCuIiDv2FkHKBYUjURYNzvQs17mCH2rcQ
 r+qDK1WQQnFwGVnXQuGbkrh0=
X-Received: by 2002:a05:622a:47cf:b0:517:2c1e:8b6 with SMTP id
 d75a77b69052e-51795c66183mr278467401cf.38.1781025920335; 
 Tue, 09 Jun 2026 10:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:47cf:b0:517:2c1e:8b6 with SMTP id
 d75a77b69052e-51795c66183mr278466621cf.38.1781025919664; 
 Tue, 09 Jun 2026 10:25:19 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:19 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v2 01/10] migration: Use OBJECT_DECLARE_SIMPLE_TYPE
Date: Tue,  9 Jun 2026 13:25:05 -0400
Message-ID: <20260609172514.2037645-2-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 73DNVGhl2EO0aObWd1WED-pvX9F3EgzamDAqGkq1ZqE_1781025920
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Migration object's class has nothing special, switch to the newly
introduced macro.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.h | 9 +--------
 migration/migration.c | 7 +++----
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 841f49b215..293ad60e07 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -263,14 +263,7 @@ void fill_destination_postcopy_migration_info(MigrationInfo *info);
 
 #define TYPE_MIGRATION "migration"
 
-typedef struct MigrationClass MigrationClass;
-DECLARE_OBJ_CHECKERS(MigrationState, MigrationClass,
-                     MIGRATION_OBJ, TYPE_MIGRATION)
-
-struct MigrationClass {
-    /*< private >*/
-    DeviceClass parent_class;
-};
+OBJECT_DECLARE_SIMPLE_TYPE(MigrationState, MIGRATION);
 
 struct MigrationState {
     /*< private >*/
diff --git a/migration/migration.c b/migration/migration.c
index 074d3f2c69..278cad502a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -297,7 +297,7 @@ void migration_object_init(void)
 {
     /* This can only be called once. */
     assert(!current_migration);
-    current_migration = MIGRATION_OBJ(object_new(TYPE_MIGRATION));
+    current_migration = MIGRATION(object_new(TYPE_MIGRATION));
 
     /*
      * Init the migrate incoming object as well no matter whether
@@ -3975,7 +3975,7 @@ static void migration_class_init(ObjectClass *klass, const void *data)
 
 static void migration_instance_finalize(Object *obj)
 {
-    MigrationState *ms = MIGRATION_OBJ(obj);
+    MigrationState *ms = MIGRATION(obj);
 
     qapi_free_BitmapMigrationNodeAliasList(ms->parameters.block_bitmap_mapping);
     qapi_free_strList(ms->parameters.cpr_exec_command);
@@ -3993,7 +3993,7 @@ static void migration_instance_finalize(Object *obj)
 
 static void migration_instance_init(Object *obj)
 {
-    MigrationState *ms = MIGRATION_OBJ(obj);
+    MigrationState *ms = MIGRATION(obj);
 
     ms->state = MIGRATION_STATUS_NONE;
     ms->mbps = -1;
@@ -4040,7 +4040,6 @@ static const TypeInfo migration_type = {
      */
     .parent = TYPE_DEVICE,
     .class_init = migration_class_init,
-    .class_size = sizeof(MigrationClass),
     .instance_size = sizeof(MigrationState),
     .instance_init = migration_instance_init,
     .instance_finalize = migration_instance_finalize,
-- 
2.53.0


