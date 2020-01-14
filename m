Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5393683lff;
        Tue, 14 Jan 2020 03:40:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqztx9m7o59q/FibILFJDVnYHNSrdDeNmYQkkqmlV7ZoBAR+A8xOMg/cbktQRYWCULCcNCt4
X-Received: by 2002:a17:906:f852:: with SMTP id ks18mr22213167ejb.260.1579002025547;
        Tue, 14 Jan 2020 03:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002025; cv=none;
        d=google.com; s=arc-20160816;
        b=B4KRA2px5kx/GYBFvoM5ezN5BYdM8tDcXwQtQLmYlNGzHbVPw2G0Mxu3oDS9ouu2ru
         x+I7yJ721ZjbaVeapxSS+U/URo8mkqXCKF5DVjb0OqrBH9CUCPo6mj2jmPzOhLseaUs/
         bmASQpRes3qEHa1wC4d8juFTuxCy+pCw82c9/XynfQFw+spMBTaf2rM6GJLcRHa/hb7D
         Z1Shrusvq5TLDvUnjoTqUqX9n6XXJeDvfewQC2O33FzP1iPJE6ZwTG9g43yAJRXBOC2d
         z0k4VPiZvjzkaF+Cjp9UvwpFI5efDa9VD9GY6/70ul0B2woFjM89k8L9VBmpKkiB/NXF
         j5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KP4JOgx0MH3utU/6sKW0BXPz8/EvSkOonQGNpzhU5Ck=;
        b=HW9XZjSDbru+6XIkEKnLko+lJA2Brczusc+K/ItobNJmjybP/eFDExDQ34KHAjbTQ/
         ofteq8TgTvGRtQssZJQxSlrefN2Ufx+bA3fOSNbmi2FXvvihfhc52bH+mB3fDylR3nJA
         bYviFTIHJWKi2gkLws6cfYAA41NeVHVJJfaZZ/div74yPD+2Fu6k0sR3x4UNN4rRqgSK
         WH2HJ+BvG+siJ25ZywKQn5azOoz20SaLLiXpc8v6EobDQErf1zox4Nfw/J1AAojuQMZb
         bFFrTWKe+qC7TPKbhutpTZ+IUSyNR4Q1EibXKHVBpwbWbC2pUnmUma4jhKyHaDz+L5vw
         CXNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=euIXCE3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si8417703ejb.242.2020.01.14.03.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=euIXCE3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKYa-0004WH-2d
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKYG-0004MK-NH
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKYC-0002o0-P8
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38835
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKYC-0002nc-LV
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579001999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KP4JOgx0MH3utU/6sKW0BXPz8/EvSkOonQGNpzhU5Ck=;
 b=euIXCE3QCMswE5DgnxNuqVUIAwBeG4esrkj7p4j6dre6YDaoEuvps/HXGK8attE5fxxJJB
 EZEBa0D557ogvjRIg5jwmYJmoyFGid0/yKmZ6pqrXGCbIIKdAb7yDi3HPZbNr+yS1INXGp
 lmL/uVoMptes6L6MKzjzELt1FKnoBZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-EhzFe_qDN1KDj5-4ZYYqpA-1; Tue, 14 Jan 2020 06:39:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E2D800D5E;
 Tue, 14 Jan 2020 11:39:56 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7597C5DA32;
 Tue, 14 Jan 2020 11:39:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] migration: Make sure that we don't call write() in case
 of error
Date: Tue, 14 Jan 2020 12:38:59 +0100
Message-Id: <20200114113926.3556-4-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: EhzFe_qDN1KDj5-4ZYYqpA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XV0pMm7JggHh

If we are exiting due to an error/finish/.... Just don't try to even
touch the channel with one IO operation.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index b9147bcca3..f946282adb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -900,6 +900,12 @@ struct {
     uint64_t packet_num;
     /* send channels ready */
     QemuSemaphore channels_ready;
+    /*
+     * Have we already run terminate threads.  There is a race when it
+     * happens that we got one error while we are exiting.
+     * We will use atomic operations.  Only valid values are 0 and 1.
+     */
+    int exiting;
 } *multifd_send_state;
=20
 /*
@@ -928,6 +934,10 @@ static int multifd_send_pages(RAMState *rs)
     MultiFDPages_t *pages =3D multifd_send_state->pages;
     uint64_t transferred;
=20
+    if (atomic_read(&multifd_send_state->exiting)) {
+        return -1;
+    }
+
     qemu_sem_wait(&multifd_send_state->channels_ready);
     for (i =3D next_channel;; i =3D (i + 1) % migrate_multifd_channels()) =
{
         p =3D &multifd_send_state->params[i];
@@ -1009,6 +1019,16 @@ static void multifd_send_terminate_threads(Error *er=
r)
         }
     }
=20
+    /*
+     * We don't want to exit each threads twice.  Depending on where
+     * we get the error, or if there are two independent errors in two
+     * threads at the same time, we can end calling this function
+     * twice.
+     */
+    if (atomic_xchg(&multifd_send_state->exiting, 1)) {
+        return;
+    }
+
     for (i =3D 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p =3D &multifd_send_state->params[i];
=20
@@ -1118,6 +1138,10 @@ static void *multifd_send_thread(void *opaque)
=20
     while (true) {
         qemu_sem_wait(&p->sem);
+
+        if (atomic_read(&multifd_send_state->exiting)) {
+            break;
+        }
         qemu_mutex_lock(&p->mutex);
=20
         if (p->pending_job) {
@@ -1224,6 +1248,7 @@ int multifd_save_setup(void)
     multifd_send_state->params =3D g_new0(MultiFDSendParams, thread_count)=
;
     multifd_send_state->pages =3D multifd_pages_init(page_count);
     qemu_sem_init(&multifd_send_state->channels_ready, 0);
+    atomic_set(&multifd_send_state->exiting, 0);
=20
     for (i =3D 0; i < thread_count; i++) {
         MultiFDSendParams *p =3D &multifd_send_state->params[i];
--=20
2.24.1

