Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1027471ejb;
        Thu, 19 Oct 2023 23:59:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8E0BdRFPCnDG16jwxl4S9E82cSksLL69i9shRdCQq3bzyRKwT5ICwHY5P4J7QdaWrRgKx
X-Received: by 2002:a05:6a00:1488:b0:68a:54e5:24e6 with SMTP id v8-20020a056a00148800b0068a54e524e6mr1042845pfu.8.1697785167286;
        Thu, 19 Oct 2023 23:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697785167; cv=none;
        d=google.com; s=arc-20160816;
        b=MGwh9cEMK7yJyD582oKQZUxeJpfNG0cSIWbZF+Pv5VS6nb949O5MMkXnau+xL7oQz5
         UbTabZNJxJjr9fHGbEOZnnWZnXtjRTmj6y+gxatfoqsGBTnWSdpVavQKTuVx9KVJaHar
         yJy1I/HNmxtdj6DaznDUqnJea1rm+y3hwc4j8/aUr39O+XqDhdcqHU/uZsED5AIcsBi2
         nFfmtOOeIGe0zcatj04a67116Ug+1sCWYOqOerzv15s/aQH/7+eYjACQQNvuvhcN/y3d
         /X3Ha5wsSThi0079Ar4jYxrKU1EFEMM2a6K9KlPg9jSBTFVOuc4ROb45uInXFz+nyHvV
         fKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=VF6oDLtyOYcF3ptVqd+MyQZn9RP0si74mFPnV/wX+pI=;
        fh=Yu5HOJ7w/MzYjXgUAIbl2JEaBSf9mHfJF3raVfOlKMQ=;
        b=NEXyUiRm0UoRV4I1cCXf2TeVwbESWJuZLfZH+L5uxIRY4fRXnfvPLVXLSub+ZsLS5G
         +6ankXC1U4Es4N6zXQOQC+gWOQ7YidRGCMA8/VIY7m7TJNCRc+GcARxD7XsQH68uc7Ub
         9OSCj8pkaRPicvax5H9kvD8eY9Yqg03lsvegx5uHeG5Dnpw76sqLBHqa6wxk63Pr//s1
         mS8pX89ja0AMXsVI2CwkX06DwZdRwtyyBoMqFdRA68w9D8gOrcR17ACvMgOS+wfxCuUi
         edijemZ3yEmjn1Wog6/PiRcKEPCJqSZel6mHmNPj3BlQZqTg1ZiPRvCOraVKZKfiS3l4
         sj3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cZPm0nBm;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:7 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from snail.vger.email (snail.vger.email. [2620:137:e000::3:7])
        by mx.google.com with ESMTPS id d19-20020a637353000000b00578b487825asi1289611pgn.208.2023.10.19.23.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:7 as permitted sender) client-ip=2620:137:e000::3:7;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cZPm0nBm;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:7 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by snail.vger.email (Postfix) with ESMTP id AAAB9805F081;
	Thu, 19 Oct 2023 23:59:26 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at snail.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376389AbjJTG70 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 20 Oct 2023 02:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376385AbjJTG7X (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Oct 2023 02:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C53D55
        for <kvm@vger.kernel.org>; Thu, 19 Oct 2023 23:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697785124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VF6oDLtyOYcF3ptVqd+MyQZn9RP0si74mFPnV/wX+pI=;
        b=cZPm0nBmGjO2vm2Bn4Me8uCP1dJFSEtiiEzrFHa4R02XqXPXu1DQVtaw3VnUAcIaA4SsMd
        nF0CxEe0MS13JJ4u+AH+c6VVkGD3fT+jTFz1GGKM6F57yr7im4BTNKxTHwOazZYO1EYUxK
        v03kXyFYuK1DDfT96cTYHSWV37bdQwI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-fHzfvg1tNdGU2Vhk7l48XQ-1; Fri, 20 Oct 2023 02:58:30 -0400
X-MC-Unique: fHzfvg1tNdGU2Vhk7l48XQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25A8110201E3;
        Fri, 20 Oct 2023 06:58:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2452E25C0;
        Fri, 20 Oct 2023 06:58:22 +0000 (UTC)
From:   Juan Quintela <quintela@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     qemu-s390x@nongnu.org,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Denis V. Lunev" <den@openvz.org>,
        Juan Quintela <quintela@redhat.com>,
        Fam Zheng <fam@euphon.net>, kvm@vger.kernel.org,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Kevin Wolf <kwolf@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Jagannathan Raman <jag.raman@oracle.com>, qemu-arm@nongnu.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Stefan Weil <sw@weilnetz.de>, Peter Xu <peterx@redhat.com>,
        Christian Schoenebeck <qemu_oss@crudebyte.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Jeff Cody <codyprime@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Leonardo Bras <leobras@redhat.com>,
        Fabiano Rosas <farosas@suse.de>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
        Steve Sistare <steven.sistare@oracle.com>,
        Michael Galaxy <mgalaxy@akamai.com>
Subject: [PULL 04/17] migration: simplify notifiers
Date:   Fri, 20 Oct 2023 08:57:38 +0200
Message-ID: <20231020065751.26047-5-quintela@redhat.com>
In-Reply-To: <20231020065751.26047-1-quintela@redhat.com>
References: <20231020065751.26047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (snail.vger.email [0.0.0.0]); Thu, 19 Oct 2023 23:59:26 -0700 (PDT)
X-TUID: WoH34gGbw7uf

From: Steve Sistare <steven.sistare@oracle.com>

Pass the callback function to add_migration_state_change_notifier so
that migration can initialize the notifier on add and clear it on
delete, which simplifies the call sites.  Shorten the function names
so the extra arg can be added more legibly.  Hide the global notifier
list in a new function migration_call_notifiers, and make it externally
visible so future live update code can call it.

No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Tested-by: Michael Galaxy <mgalaxy@akamai.com>
Reviewed-by: Michael Galaxy <mgalaxy@akamai.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <1686148954-250144-1-git-send-email-steven.sistare@oracle.com>
---
 include/migration/misc.h |  6 ++++--
 hw/net/virtio-net.c      |  6 +++---
 hw/vfio/migration.c      |  6 +++---
 migration/migration.c    | 22 ++++++++++++++++------
 net/vhost-vdpa.c         |  7 ++++---
 ui/spice-core.c          |  3 +--
 6 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/include/migration/misc.h b/include/migration/misc.h
index 7dcc0b5c2c..673ac490fb 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -60,8 +60,10 @@ void migration_object_init(void);
 void migration_shutdown(void);
 bool migration_is_idle(void);
 bool migration_is_active(MigrationState *);
-void add_migration_state_change_notifier(Notifier *notify);
-void remove_migration_state_change_notifier(Notifier *notify);
+void migration_add_notifier(Notifier *notify,
+                            void (*func)(Notifier *notifier, void *data));
+void migration_remove_notifier(Notifier *notify);
+void migration_call_notifiers(MigrationState *s);
 bool migration_in_setup(MigrationState *);
 bool migration_has_finished(MigrationState *);
 bool migration_has_failed(MigrationState *);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 29e33ea5ed..b85c7946a7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3624,8 +3624,8 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         n->primary_listener.hide_device = failover_hide_primary_device;
         qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
-        n->migration_state.notify = virtio_net_migration_state_notifier;
-        add_migration_state_change_notifier(&n->migration_state);
+        migration_add_notifier(&n->migration_state,
+                               virtio_net_migration_state_notifier);
         n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
     }
 
@@ -3788,7 +3788,7 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     if (n->failover) {
         qobject_unref(n->primary_opts);
         device_listener_unregister(&n->primary_listener);
-        remove_migration_state_change_notifier(&n->migration_state);
+        migration_remove_notifier(&n->migration_state);
     } else {
         assert(n->primary_opts == NULL);
     }
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 0aaad65c06..28d422b39f 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -872,8 +872,8 @@ static int vfio_migration_init(VFIODevice *vbasedev)
                      NULL;
     migration->vm_state = qdev_add_vm_change_state_handler_full(
         vbasedev->dev, vfio_vmstate_change, prepare_cb, vbasedev);
-    migration->migration_state.notify = vfio_migration_state_notifier;
-    add_migration_state_change_notifier(&migration->migration_state);
+    migration_add_notifier(&migration->migration_state,
+                           vfio_migration_state_notifier);
 
     return 0;
 }
@@ -882,7 +882,7 @@ static void vfio_migration_deinit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    remove_migration_state_change_notifier(&migration->migration_state);
+    migration_remove_notifier(&migration->migration_state);
     qemu_del_vm_change_state_handler(migration->vm_state);
     unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
     vfio_migration_free(vbasedev);
diff --git a/migration/migration.c b/migration/migration.c
index 818b02b707..67547eb6a1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1207,7 +1207,7 @@ static void migrate_fd_cleanup(MigrationState *s)
         /* It is used on info migrate.  We can't free it */
         error_report_err(error_copy(s->error));
     }
-    notifier_list_notify(&migration_state_notifiers, s);
+    migration_call_notifiers(s);
     block_cleanup_parameters();
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
@@ -1311,14 +1311,24 @@ static void migrate_fd_cancel(MigrationState *s)
     }
 }
 
-void add_migration_state_change_notifier(Notifier *notify)
+void migration_add_notifier(Notifier *notify,
+                            void (*func)(Notifier *notifier, void *data))
 {
+    notify->notify = func;
     notifier_list_add(&migration_state_notifiers, notify);
 }
 
-void remove_migration_state_change_notifier(Notifier *notify)
+void migration_remove_notifier(Notifier *notify)
 {
-    notifier_remove(notify);
+    if (notify->notify) {
+        notifier_remove(notify);
+        notify->notify = NULL;
+    }
+}
+
+void migration_call_notifiers(MigrationState *s)
+{
+    notifier_list_notify(&migration_state_notifiers, s);
 }
 
 bool migration_in_setup(MigrationState *s)
@@ -2233,7 +2243,7 @@ static int postcopy_start(MigrationState *ms, Error **errp)
      * spice needs to trigger a transition now
      */
     ms->postcopy_after_devices = true;
-    notifier_list_notify(&migration_state_notifiers, ms);
+    migration_call_notifiers(ms);
 
     ms->downtime =  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - time_at_stop;
 
@@ -3313,7 +3323,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         rate_limit = migrate_max_bandwidth();
 
         /* Notify before starting migration thread */
-        notifier_list_notify(&migration_state_notifiers, s);
+        migration_call_notifiers(s);
     }
 
     migration_rate_set(rate_limit);
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 939c984d5b..0f2e6fc58e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -339,7 +339,8 @@ static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
 {
     struct vhost_vdpa *v = &s->vhost_vdpa;
 
-    add_migration_state_change_notifier(&s->migration_state);
+    migration_add_notifier(&s->migration_state,
+                           vdpa_net_migration_state_notifier);
     if (v->shadow_vqs_enabled) {
         v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
                                            v->iova_range.last);
@@ -399,7 +400,7 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
     if (s->vhost_vdpa.index == 0) {
-        remove_migration_state_change_notifier(&s->migration_state);
+        migration_remove_notifier(&s->migration_state);
     }
 
     dev = s->vhost_vdpa.dev;
@@ -1456,7 +1457,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
     s->always_svq = svq;
-    s->migration_state.notify = vdpa_net_migration_state_notifier;
+    s->migration_state.notify = NULL;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 52a59386d7..db21db2c94 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -821,8 +821,7 @@ static void qemu_spice_init(void)
     };
     using_spice = 1;
 
-    migration_state.notify = migration_state_notifier;
-    add_migration_state_change_notifier(&migration_state);
+    migration_add_notifier(&migration_state, migration_state_notifier);
     spice_migrate.base.sif = &migrate_interface.base;
     qemu_spice.add_interface(&spice_migrate.base);
 
-- 
2.41.0
