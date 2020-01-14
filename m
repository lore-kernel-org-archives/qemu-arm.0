Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5399348lff;
        Tue, 14 Jan 2020 03:46:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzOy/l3ZmrjW467BlM7y7qp7miIpUCmW9/y9DKffHYtx0b9uTSAIXrm4h1Bs4ThwSOltjk
X-Received: by 2002:a0c:c18f:: with SMTP id n15mr15898332qvh.35.1579002392306;
        Tue, 14 Jan 2020 03:46:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002392; cv=none;
        d=google.com; s=arc-20160816;
        b=tUfTlygEhQ1O5vgVy1gpQAnWROSrMACsYhh83uYc84GVf3kl+ZFFAxsGaXA20nHRY5
         KrYStlIgmAWB1L5HWR9zPPXulJgIpAGiO7w67qSksHA6rp9eLGFXaQ0Ot65BZK//kCNu
         NuJ6WVOzkAjk+k+8XPDDHq5P7UYl55E/wPK6lE00W6mDFirvTD9d+lMDBcEs8eX4OwOU
         ciF7OW2pHt/zg1wkLMhdDNz8kvNt+xv9rs/O3TkOVPstkymh19ICToJo79in0yHiqL4v
         UVRMCLMoxOZsrtgq1PNiTQ0I2OQSzcMe90j01bWfDH2Nei6vMhRz3ac6HB6b+0rdfL60
         la6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LsOB1plsrf+L0MjZkIhW9gkC1Fbo6Je4OwCPKg11rHk=;
        b=imgLiMW1iWT7K/EH0v0Msg30dkiCs6Gs8ZwLVg80L8qNUNjz2qb4SgIfa40KhAbj+O
         G6kAc22ckfR1QbojEqTgdZtS71DClFZBCmEg7oaikyyzJjOpukBPeAzij3MBQAO9VvpE
         DvjvJp3Al7ZZSigE5Iq/2e0kARZvzl/99y591WNoriklUxwWNE65rLHyGCzn428U/qcD
         /vOK+uenvz2662WYMZx2TNVFWtK/eIwJ5UbpVQOgqn7ms6FSAXIvGnGnk1orB+xjhqEB
         e+Vx+o6Es7mXA9Hh36qOw7RRZTfF6zgjtAx2zimKfsJ6Oy2mHywoX46kJ/Fazb56wdqL
         OxAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CE9X34KE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si7949658qka.362.2020.01.14.03.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:46:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CE9X34KE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKeV-0004Z1-7F
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKYw-0005U9-JC
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKYs-00038m-Ei
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52299
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKYs-000382-8Y
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LsOB1plsrf+L0MjZkIhW9gkC1Fbo6Je4OwCPKg11rHk=;
 b=CE9X34KE97ledRYV5SMWRRW6BAHk6img3Qi0b3+kqnKGL87/v7U5gM0yXRt+yrtAlBWC71
 +NYmfUjDTvRxlZMTcfQ/7udOw1u0UqwWiQHI/OpnL/cvGWMzZGqgzyLwbXbgTIoDCwZ4qn
 s6yVERzyd92z9R97YDtJiS823Rc1iks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-tfEsJDOUPC-qwyMMu6an_Q-1; Tue, 14 Jan 2020 06:40:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 834AF801E6C;
 Tue, 14 Jan 2020 11:40:38 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 258605DA32;
 Tue, 14 Jan 2020 11:40:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] migration: Rate limit inside host pages
Date: Tue, 14 Jan 2020 12:39:04 +0100
Message-Id: <20200114113926.3556-9-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tfEsJDOUPC-qwyMMu6an_Q-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Lin Ma <LMa@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jn5/SylZFNA6

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
index 17cd8d524b..1ec5c10561 100644
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

