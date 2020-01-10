Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp989451lff;
        Fri, 10 Jan 2020 09:37:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqygw/3nIZq13k6t4mnFIU98qzE5YwXVHHmEduSSjxb84uWk6objJh3sKbx+9RwEXgWAEG3A
X-Received: by 2002:a17:906:4814:: with SMTP id w20mr4379347ejq.9.1578677840929;
        Fri, 10 Jan 2020 09:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578677840; cv=none;
        d=google.com; s=arc-20160816;
        b=nmfCM1OAjXoiWUMpxjawhf+mvvv4/IhiLeKhWl2zCLA2AOuv9qh1U7x63KAoeTSvAi
         Z1JXjK/r8QheeOIkDVnztol7oGnlwX27GZ6k5T60g+z76NYUNPu8OksBA2EDrfgqb3q7
         UEg09pgcjvGpXoaMOoUB7a91ZBAsdzkiZ0Xe9RURM2DL1MXW2Po/ysfKq2WbMaqX61FB
         YCol5tSm3iLyQ/RRRZW+fKoDiov9HthkCb7Ko2pW/nbm2raqNfDK1OIPVaTZ31i6ii/0
         TP04ep5OvvQPYXozzEW7QgAhAn+GjMP7byUv7pvxv/TolUynTwwf+cGgxMT6+5Lo0ycE
         b1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eEHRcnwANxr423cwLkkLHDuGP/Ef0JMPZnyINFPFaGo=;
        b=WNlcDzG0sX4AWj4uQnbbIkw/IdRGG3NM1qTdZ2YlJJe2f2Ld0ECGcBlnHyxdAIQez3
         2y7QvJp5sQMlxK3fA0ReZDXLPZVV8WItgFXTSZCpZN80922U7r/baPHk1pdGEYB4g13l
         9cjiKBzc5DUA2LdZwQvviNdTw/5+DnkJUJw72j9ZpV+lELG/1CdQMJrD5x7WLnCOFOjb
         b4tVNLT5jhKzAzMH/u/aFq8WDNTG1B9MKK/3LryO7+N9kbTTfScKOFELvuqQn1mHvAXR
         fLUenZOF9Lw1zGYQVJsRfyoW/rVzomFyqr6Ln5nWBGj1B64wdD4GIIgPRlRdoUINXG4r
         2png==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DERXxMKS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si2036076edr.114.2020.01.10.09.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DERXxMKS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyDn-0000Wy-1T
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyA0-0003vj-P2
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipy9y-00021G-48
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:33:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21696
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipy9x-000205-V0
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eEHRcnwANxr423cwLkkLHDuGP/Ef0JMPZnyINFPFaGo=;
 b=DERXxMKSy/W6sa8yVGBkX/SAjpkvrxKuMum7AF6m8dhY0ie1487bd5lDWB1goGH4XWki5Q
 HaBW5SVTze7pG3oRXuFQ+RoTRtNqmCnKXfV+Z5vX8n7KWB+Mq9mkY5FdlT8P7oJUy4VBeQ
 v+6y/8k/od9BNJLdv/56H/CIDp3NSv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-5cgGwGj_NValYyU-6de_Vg-1; Fri, 10 Jan 2020 12:33:19 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 089E1801E70;
 Fri, 10 Jan 2020 17:33:18 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 002C219C4F;
 Fri, 10 Jan 2020 17:33:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/28] migration: Rate limit inside host pages
Date: Fri, 10 Jan 2020 18:31:54 +0100
Message-Id: <20200110173215.3865-8-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 5cgGwGj_NValYyU-6de_Vg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Lin Ma <LMa@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AUjZBCUqqfG3

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When using hugepages, rate limiting is necessary within each huge
page, since a 1G huge page can take a significant time to send, so
you end up with bursty behaviour.

Fixes: 4c011c37ecb3 ("postcopy: Send whole huge pages")
Reported-by: Lin Ma <LMa@suse.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c  | 57 ++++++++++++++++++++++++------------------
 migration/migration.h  |  1 +
 migration/ram.c        |  2 ++
 migration/trace-events |  4 +--
 4 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 354ad072fa..27500d09a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3224,6 +3224,37 @@ void migration_consume_urgent_request(void)
     qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
 }
=20
+/* Returns true if the rate limiting was broken by an urgent request */
+bool migration_rate_limit(void)
+{
+    int64_t now =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    MigrationState *s =3D migrate_get_current();
+
+    bool urgent =3D false;
+    migration_update_counters(s, now);
+    if (qemu_file_rate_limit(s->to_dst_file)) {
+        /*
+         * Wait for a delay to do rate limiting OR
+         * something urgent to post the semaphore.
+         */
+        int ms =3D s->iteration_start_time + BUFFER_DELAY - now;
+        trace_migration_rate_limit_pre(ms);
+        if (qemu_sem_timedwait(&s->rate_limit_sem, ms) =3D=3D 0) {
+            /*
+             * We were woken by one or more urgent things but
+             * the timedwait will have consumed one of them.
+             * The service routine for the urgent wake will dec
+             * the semaphore itself for each item it consumes,
+             * so add this one we just eat back.
+             */
+            qemu_sem_post(&s->rate_limit_sem);
+            urgent =3D true;
+        }
+        trace_migration_rate_limit_post(urgent);
+    }
+    return urgent;
+}
+
 /*
  * Master migration thread on the source VM.
  * It drives the migration and pumps the data down the outgoing channel.
@@ -3290,8 +3321,6 @@ static void *migration_thread(void *opaque)
     trace_migration_thread_setup_complete();
=20
     while (migration_is_active(s)) {
-        int64_t current_time;
-
         if (urgent || !qemu_file_rate_limit(s->to_dst_file)) {
             MigIterateState iter_state =3D migration_iteration_run(s);
             if (iter_state =3D=3D MIG_ITERATE_SKIP) {
@@ -3318,29 +3347,7 @@ static void *migration_thread(void *opaque)
             update_iteration_initial_status(s);
         }
=20
-        current_time =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-
-        migration_update_counters(s, current_time);
-
-        urgent =3D false;
-        if (qemu_file_rate_limit(s->to_dst_file)) {
-            /* Wait for a delay to do rate limiting OR
-             * something urgent to post the semaphore.
-             */
-            int ms =3D s->iteration_start_time + BUFFER_DELAY - current_ti=
me;
-            trace_migration_thread_ratelimit_pre(ms);
-            if (qemu_sem_timedwait(&s->rate_limit_sem, ms) =3D=3D 0) {
-                /* We were worken by one or more urgent things but
-                 * the timedwait will have consumed one of them.
-                 * The service routine for the urgent wake will dec
-                 * the semaphore itself for each item it consumes,
-                 * so add this one we just eat back.
-                 */
-                qemu_sem_post(&s->rate_limit_sem);
-                urgent =3D true;
-            }
-            trace_migration_thread_ratelimit_post(urgent);
-        }
+        urgent =3D migration_rate_limit();
     }
=20
     trace_migration_thread_after_loop();
diff --git a/migration/migration.h b/migration/migration.h
index 79b3dda146..aa9ff6f27b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -341,5 +341,6 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, vo=
id *opaque);
=20
 void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
+bool migration_rate_limit(void);
=20
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 733aee61e3..718a02a974 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2639,6 +2639,8 @@ static int ram_save_host_page(RAMState *rs, PageSearc=
hStatus *pss,
=20
         pages +=3D tmppages;
         pss->page++;
+        /* Allow rate limiting to happen in the middle of huge pages */
+        migration_rate_limit();
     } while ((pss->page & (pagesize_bits - 1)) &&
              offset_in_ramblock(pss->block, pss->page << TARGET_PAGE_BITS)=
);
=20
diff --git a/migration/trace-events b/migration/trace-events
index 6dee7b5389..2f9129e213 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -138,12 +138,12 @@ migrate_send_rp_recv_bitmap(char *name, int64_t size)=
 "block '%s' size 0x%"PRIi6
 migration_completion_file_err(void) ""
 migration_completion_postcopy_end(void) ""
 migration_completion_postcopy_end_after_complete(void) ""
+migration_rate_limit_pre(int ms) "%d ms"
+migration_rate_limit_post(int urgent) "urgent: %d"
 migration_return_path_end_before(void) ""
 migration_return_path_end_after(int rp_error) "%d"
 migration_thread_after_loop(void) ""
 migration_thread_file_err(void) ""
-migration_thread_ratelimit_pre(int ms) "%d ms"
-migration_thread_ratelimit_post(int urgent) "urgent: %d"
 migration_thread_setup_complete(void) ""
 open_return_path_on_source(void) ""
 open_return_path_on_source_continue(void) ""
--=20
2.24.1

