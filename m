Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5274964lff;
        Tue, 14 Jan 2020 01:35:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqza8LbRXso3UJkalY1jiARRWvK6gQZT3lAw+X6f8awYvOIoyZGynd2CyIgyNOsgtcUWxOq0
X-Received: by 2002:ac8:65ce:: with SMTP id t14mr2746064qto.72.1578994513213;
        Tue, 14 Jan 2020 01:35:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994513; cv=none;
        d=google.com; s=arc-20160816;
        b=VMxQ/d5FGtgjtH9Azj+9i/T0w269X97kD/iN9p4KOAelJ4lzH/PgjZ4DjoviqcoJ/R
         VZzXThuscCAVxPi+Tb46yK77Mno7LbzsZKOse/tnbag25pjtBXDff2Dzw2XWdSljcgKY
         H3NxGbpIK5XCaLFGnuVstf58B64zjHXFyki4z5/H0jkIM0jMisGKJ0rey34opVNgq6r6
         viKvGKlqAGv7rjdbydXQkQSETAERwFg9enMJE3wSOafM6HkbYE29KHzCVjABggEU4SSQ
         eIUz1TVy+p6AYjduA+6p8uxI+lKSDnobnXuNvhYjWwIbInu7qklbE8pDFReo+AmJiuey
         cpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sF9PT3VudShxE0wmWXTxFC1tzz8+9eCtUOBba9umQls=;
        b=P+ReSgkVawo/TqDjKebqYUxB1TdNsQ6pgQX4Y3BWI3WgG+pMra3RHgxHi55RzXrAMt
         uy64jVyE45KwaMK2LFp9RYqAWh2oXQSS8kgAwxK4g9NsKmHPb8MU+lsH6rKhliA98Z4a
         xbk58mWkL664zzAMGzoKD+TKh3oUb0jVWHBVvUHwZy19uWXyOfhPv8GLObfWb37j5nQ1
         bLwgKTxTYxgnWmrmcu7tzGoDYMJQQLCpvqtDrz0CIfLw/qHstWzbHm5wkPigRk2rv5s+
         02vUorJi50OicB3Qqv5gRfSQX3JU2MA+rX2ws3CztJ39UFNP1jDz1/gWDiMUxIiyXhQ2
         u7WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tyk1Evnj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by16si7690932qvb.159.2020.01.14.01.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:35:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tyk1Evnj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIbP-00070w-Sj
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIVn-0000Bb-DM
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:29:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIVj-0006v3-QW
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:29:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57575
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIVj-0006ur-M2
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sF9PT3VudShxE0wmWXTxFC1tzz8+9eCtUOBba9umQls=;
 b=Tyk1EvnjmL1vDrQKdNGCq92JiCiA6o4TpDM91N0kJmN6Gu+bDm0a4bF3LcMbpaRa4zlPSd
 AOCVsdm6UfRdVSLY7Ya4+fgee26+7RkUWJhcYeXSOyaVNQQSwpHiqc73sFWChM3OP0K4ue
 g/YcAaxC5mpqSNgLDls/LIta+qN2XZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-cd6qPQNGOOKXLbzmPYfuhA-1; Tue, 14 Jan 2020 04:29:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FC2107ACC5;
 Tue, 14 Jan 2020 09:29:15 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1197E19757;
 Tue, 14 Jan 2020 09:29:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] migration/multifd: fix destroyed mutex access in
 terminating multifd threads
Date: Tue, 14 Jan 2020 10:26:01 +0100
Message-Id: <20200114092606.1761-25-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: cd6qPQNGOOKXLbzmPYfuhA-1
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iNsg8b/VxZTS

From: Jiahui Cen <cenjiahui@huawei.com>

One multifd will lock all the other multifds' IOChannel mutex to inform the=
m
to quit by setting p->quit or shutting down p->c. In this senario, if some
multifds had already been terminated and multifd_load_cleanup/multifd_save_=
cleanup
had destroyed their mutex, it could cause destroyed mutex access when tryin=
g
lock their mutex.

Here is the coredump stack:
    #0  0x00007f81a2794437 in raise () from /usr/lib64/libc.so.6
    #1  0x00007f81a2795b28 in abort () from /usr/lib64/libc.so.6
    #2  0x00007f81a278d1b6 in __assert_fail_base () from /usr/lib64/libc.so=
.6
    #3  0x00007f81a278d262 in __assert_fail () from /usr/lib64/libc.so.6
    #4  0x000055eb1bfadbd3 in qemu_mutex_lock_impl (mutex=3D0x55eb1e2d1988,=
 file=3D<optimized out>, line=3D<optimized out>) at util/qemu-thread-posix.=
c:64
    #5  0x000055eb1bb4564a in multifd_send_terminate_threads (err=3D<optimi=
zed out>) at migration/ram.c:1015
    #6  0x000055eb1bb4bb7f in multifd_send_thread (opaque=3D0x55eb1e2d19f8)=
 at migration/ram.c:1171
    #7  0x000055eb1bfad628 in qemu_thread_start (args=3D0x55eb1e170450) at =
util/qemu-thread-posix.c:502
    #8  0x00007f81a2b36df5 in start_thread () from /usr/lib64/libpthread.so=
.0
    #9  0x00007f81a286048d in clone () from /usr/lib64/libc.so.6

To fix it up, let's destroy the mutex after all the other multifd threads h=
ad
been terminated.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 278b2ff87a..7221f54139 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1053,6 +1053,10 @@ void multifd_save_cleanup(void)
         if (p->running) {
             qemu_thread_join(&p->thread);
         }
+    }
+    for (i =3D 0; i < migrate_multifd_channels(); i++) {
+        MultiFDSendParams *p =3D &multifd_send_state->params[i];
+
         socket_send_channel_destroy(p->c);
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
@@ -1336,6 +1340,10 @@ int multifd_load_cleanup(Error **errp)
             qemu_sem_post(&p->sem_sync);
             qemu_thread_join(&p->thread);
         }
+    }
+    for (i =3D 0; i < migrate_multifd_channels(); i++) {
+        MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
+
         object_unref(OBJECT(p->c));
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
--=20
2.24.1

