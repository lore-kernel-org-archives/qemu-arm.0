Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp324521eja;
        Thu, 2 Nov 2023 04:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHMvlDyIcLLzSbckD7JrY8YT2bC+0bF3z/9dQmQG6CSBYdjHrVsqrHCIQ0Gl3RjzaF7J+1
X-Received: by 2002:ad4:5f8f:0:b0:671:43fc:c276 with SMTP id jp15-20020ad45f8f000000b0067143fcc276mr17339912qvb.55.1698925795492;
        Thu, 02 Nov 2023 04:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925795; cv=none;
        d=google.com; s=arc-20160816;
        b=W2Yu3P7g0r6hdh3xJz0bzqhPDqYg1WVT2hSOyQXz4ClDFF8QnoMZ4bgkPTRxIavatI
         xie4nJvhTYgSs56xUJVGwKNTi99DTLvkEzdxHmd7UvZkRlgq62K6mYFNbzl84OUCfYKz
         oChjuLPYZGJL7hII64eNuEDXi2p6rIdvbHYFy7XJdIMjaMp9/BYzkWkMs4YZ1+7b1Tnz
         b4+NCNWNSMXZUG0/7YuBlVvu0JKDByV3di6juA9ByWazsK6s9QZalF5HXgLO39Yi4q7y
         TrqTUDuRmSE/5bKxsQ+XA2bDDPr+0b5SaxN27ppdinoursVmAMetVVq/KgUEszH6bT5e
         E/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3dtnusKfaaZrO2xI8NJWYkRbGLyVmKHxddx2t7DxngM=;
        fh=4wZu+atqzYBMEiZk99UkEBAtonlm8/YNK4xyRowi1KA=;
        b=TXV+di+ScoAJH2/LyeWXh+SFVSx4xtT22uhBCohW2UQphf/VAlZPBki8wUIfhjlbnY
         1kljxMNfKcPtQdEX2m8rD4Fuj2DczKEI8lpY3YPWEgpfnD3nJGpBLUtGanMSQy4FAPBF
         WRjQNStBu22chqWfpzHQsuh7Q6dGw81jw7O3nBB2yU1LqHGMq/plAKFcw6RwQVIFkZ+H
         CQwqe08bD8ZQ5pQuV3fmyUNEw6KZ4xi+86GNi5xisaPbWiLjRjNscMA5gvMNvR/ZLpea
         0n4IMf3geB3CTBl65hymoSto6+ngQBR/C/YXU3MOLkj8gHfrVf5YwU/Sh3/4wWQH95u3
         ZpaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OhwpYzBi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a0cef87000000b0066d0656ef0esi4243101qvr.615.2023.11.02.04.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OhwpYzBi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyW76-0006Tp-Qo; Thu, 02 Nov 2023 07:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6r-0005M6-Gc
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6o-0005uY-Ss
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dtnusKfaaZrO2xI8NJWYkRbGLyVmKHxddx2t7DxngM=;
 b=OhwpYzBi9LTYlDiLREzY3hoxS2EEKPPlGqNK/qo1xapMx32nav8f3N13MgZgw/YK0CBdt+
 IJ912xe5tKCMWnVj2T1lwLWrn9pmksrLFz0DhGHDOQt9/GEiFGXhl0RCB9nhRp1x3Rgcjw
 M8XSjnAiC+0uU0UD26DGP4SYbe60184=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-_uJZo_BQOYmWx5-JzNLMXQ-1; Thu,
 02 Nov 2023 07:43:30 -0400
X-MC-Unique: _uJZo_BQOYmWx5-JzNLMXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F01A2808FCE;
 Thu,  2 Nov 2023 11:43:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 441D12026D4C;
 Thu,  2 Nov 2023 11:43:21 +0000 (UTC)
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
 Fam Zheng <fam@euphon.net>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PULL 19/40] migration: Add tracepoints for downtime checkpoints
Date: Thu,  2 Nov 2023 12:40:33 +0100
Message-ID: <20231102114054.44360-20-quintela@redhat.com>
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
X-TUID: U7bJYPrLtfVt

From: Peter Xu <peterx@redhat.com>

This patch is inspired by Joao Martin's patch here:

https://lore.kernel.org/r/20230926161841.98464-1-joao.m.martins@oracle.com

Add tracepoints for major downtime checkpoints on both src and dst.  They
share the same tracepoint with a string showing its stage.

Besides the checkpoints in the previous patch, this patch also added
destination checkpoints.

On src, we have these checkpoints added:

  - src-downtime-start: right before vm stops on src
  - src-vm-stopped: after vm is fully stopped
  - src-iterable-saved: after all iterables saved (END sections)
  - src-non-iterable-saved: after all non-iterable saved (FULL sections)
  - src-downtime-stop: migration fully completed

On dst, we have these checkpoints added:

  - dst-precopy-loadvm-completes: after loadvm all done for precopy
  - dst-precopy-bh-*: record BH steps to resume VM for precopy
  - dst-postcopy-bh-*: record BH steps to resume VM for postcopy

On dst side, we don't have a good way to trace total time consumed by
iterable or non-iterable for now.  We can mark it by 1st time receiving a
FULL / END section, but rather than that let's just rely on the other
tracepoints added for vmstates to back up the information.

With this patch, one can enable "vmstate_downtime*" tracepoints and it'll
enable all tracepoints for downtime measurements necessary.

Drop loadvm_postcopy_handle_run_bh() tracepoint alongside, because they
service the same purpose, which was only for postcopy.  We then have
unified prefix for all downtime relevant tracepoints.

Co-developed-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231030163346.765724-6-peterx@redhat.com>
---
 migration/migration.c  | 16 +++++++++++++++-
 migration/savevm.c     | 14 +++++++++-----
 migration/trace-events |  2 +-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3e38294485..c334b9effd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -103,6 +103,7 @@ static int close_return_path_on_source(MigrationState *s);
 
 static void migration_downtime_start(MigrationState *s)
 {
+    trace_vmstate_downtime_checkpoint("src-downtime-start");
     s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
 }
 
@@ -117,6 +118,8 @@ static void migration_downtime_end(MigrationState *s)
     if (!s->downtime) {
         s->downtime = now - s->downtime_start;
     }
+
+    trace_vmstate_downtime_checkpoint("src-downtime-end");
 }
 
 static bool migration_needs_multiple_sockets(void)
@@ -151,7 +154,11 @@ static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
 
 int migration_stop_vm(RunState state)
 {
-    return vm_stop_force_state(state);
+    int ret = vm_stop_force_state(state);
+
+    trace_vmstate_downtime_checkpoint("src-vm-stopped");
+
+    return ret;
 }
 
 void migration_object_init(void)
@@ -495,6 +502,8 @@ static void process_incoming_migration_bh(void *opaque)
     Error *local_err = NULL;
     MigrationIncomingState *mis = opaque;
 
+    trace_vmstate_downtime_checkpoint("dst-precopy-bh-enter");
+
     /* If capability late_block_activate is set:
      * Only fire up the block code now if we're going to restart the
      * VM, else 'cont' will do it.
@@ -520,6 +529,8 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
+    trace_vmstate_downtime_checkpoint("dst-precopy-bh-announced");
+
     multifd_load_shutdown();
 
     dirty_bitmap_mig_before_vm_start();
@@ -537,6 +548,7 @@ static void process_incoming_migration_bh(void *opaque)
     } else {
         runstate_set(global_state_get_runstate());
     }
+    trace_vmstate_downtime_checkpoint("dst-precopy-bh-vm-started");
     /*
      * This must happen after any state changes since as soon as an external
      * observer sees this event they might start to prod at the VM assuming
@@ -571,6 +583,8 @@ process_incoming_migration_co(void *opaque)
     ret = qemu_loadvm_state(mis->from_src_file);
     mis->loadvm_co = NULL;
 
+    trace_vmstate_downtime_checkpoint("dst-precopy-loadvm-completed");
+
     ps = postcopy_state_get();
     trace_process_incoming_migration_co_end(ret, ps);
     if (ps != POSTCOPY_INCOMING_NONE) {
diff --git a/migration/savevm.c b/migration/savevm.c
index 99ce42b6f3..bc98c2ea6f 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1526,6 +1526,8 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
                                     end_ts_each - start_ts_each);
     }
 
+    trace_vmstate_downtime_checkpoint("src-iterable-saved");
+
     return 0;
 }
 
@@ -1592,6 +1594,8 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
     json_writer_free(vmdesc);
     ms->vmdesc = NULL;
 
+    trace_vmstate_downtime_checkpoint("src-non-iterable-saved");
+
     return 0;
 }
 
@@ -2133,18 +2137,18 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     Error *local_err = NULL;
     MigrationIncomingState *mis = opaque;
 
-    trace_loadvm_postcopy_handle_run_bh("enter");
+    trace_vmstate_downtime_checkpoint("dst-postcopy-bh-enter");
 
     /* TODO we should move all of this lot into postcopy_ram.c or a shared code
      * in migration.c
      */
     cpu_synchronize_all_post_init();
 
-    trace_loadvm_postcopy_handle_run_bh("after cpu sync");
+    trace_vmstate_downtime_checkpoint("dst-postcopy-bh-cpu-synced");
 
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    trace_loadvm_postcopy_handle_run_bh("after announce");
+    trace_vmstate_downtime_checkpoint("dst-postcopy-bh-announced");
 
     /* Make sure all file formats throw away their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
@@ -2155,7 +2159,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         autostart = false;
     }
 
-    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
+    trace_vmstate_downtime_checkpoint("dst-postcopy-bh-cache-invalidated");
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -2169,7 +2173,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
 
     qemu_bh_delete(mis->bh);
 
-    trace_loadvm_postcopy_handle_run_bh("return");
+    trace_vmstate_downtime_checkpoint("dst-postcopy-bh-vm-started");
 }
 
 /* After all discards we can start running and asking for pages */
diff --git a/migration/trace-events b/migration/trace-events
index 5820add1f3..e54f317e3b 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -17,7 +17,6 @@ loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
 loadvm_postcopy_handle_listen(const char *str) "%s"
 loadvm_postcopy_handle_run(void) ""
-loadvm_postcopy_handle_run_bh(const char *str) "%s"
 loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
@@ -50,6 +49,7 @@ vmstate_save(const char *idstr, const char *vmsd_name) "%s, %s"
 vmstate_load(const char *idstr, const char *vmsd_name) "%s, %s"
 vmstate_downtime_save(const char *type, const char *idstr, uint32_t instance_id, int64_t downtime) "type=%s idstr=%s instance_id=%d downtime=%"PRIi64
 vmstate_downtime_load(const char *type, const char *idstr, uint32_t instance_id, int64_t downtime) "type=%s idstr=%s instance_id=%d downtime=%"PRIi64
+vmstate_downtime_checkpoint(const char *checkpoint) "%s"
 postcopy_pause_incoming(void) ""
 postcopy_pause_incoming_continued(void) ""
 postcopy_page_req_sync(void *host_addr) "sync page req %p"
-- 
2.41.0

