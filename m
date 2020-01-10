Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1004913lff;
        Fri, 10 Jan 2020 09:52:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0rk+4cL071/KophBSeTzxShrZgqUmZ/c/hVB16TUpWm2pvuSz5C2hooV2C3kY0ZjuBe1i
X-Received: by 2002:ac8:140e:: with SMTP id k14mr3509280qtj.222.1578678770723;
        Fri, 10 Jan 2020 09:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578678770; cv=none;
        d=google.com; s=arc-20160816;
        b=bhdtPEArQ01crNUfpVsuuWs4m7XIrrm1AAl9AOGXIILYv9OXBhe1wYKyQwJfm2iWu5
         2wmKsbVOX/5tDJHeVWLibpyX30zw+rzIrBxqzHl376XLoh/nRMuj8pKe857THKDezY+l
         e3/izJXZhBPZJhQA1URAQUczLbHGqksLtqNQX03/9zUtvndlrMZeLGuAzBylmXrUuRHT
         DcVeI90H8PsIX7a8KIsEGXLd9AwZ5f9yhK1wKzAiEPi3GuEGLalDlg3DTKOAbrmPh81Y
         u0qI1dOFKOkNNxYvOpQYfP+pmiGnn7Do3MBqq5IztHageKw9I9o5Yt30aF1nN5jNqYae
         1X1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dbZzHITBVOqnVDLD4TmM+9ycTwCTtYfRJUwroSled+g=;
        b=cEWdQzhHXRG8MkgYVmIKHVNl8TMSr0iwwGFrPb6YIbmozx+C/bd1mi82hIucr2t5V+
         C0l0CNwglay/HfDSd0laNKirQOpJ6ZfFUQeEIhqyNHSNI2DPpvUWJrNPfEeXrhTGaiBT
         um4Zwa4ZiN3UDlwoWN7BXZo1u4zynkDDiOmhDldZp2xO0idjRWv6uZ4BlLDseuTfcrVM
         4+fKr/H4I2fQSXhbFg42lFs60He48j03xcoA2hYfJKZT6U/3vhwLmk8IXIaY2KvKHpAX
         SCljSt+l6D6KXSM+FRwwmzumNXAXV8NUqZh4KYebFx8pCiSrABWT6SNh+RcorllkrPNH
         k3mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J9Mdwn4n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d62si1670398qkc.157.2020.01.10.09.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:52:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J9Mdwn4n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipySn-0004M2-Sq
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyCT-0007MP-Iq
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyCS-0007xG-7m
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:35:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyCS-0007vm-2L
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbZzHITBVOqnVDLD4TmM+9ycTwCTtYfRJUwroSled+g=;
 b=J9Mdwn4nqwakSGd2VKh8KzPlutxRdqsVM7fal+JxsD1Bs+fFr+7qWwqpPDP2nIuuEOiVIz
 /GHTxaEOmf0Tx2DO/5n/rcPQhqr9i+cfcJIyUvcUd0jVCy5LwhrQ4xSs/ZZZanMLSNlC5T
 eZLarmXDSpCf1ulc9r9T4XetEmIhBus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-kJCXF1M2NOeo3MGVOwTh-w-1; Fri, 10 Jan 2020 12:35:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7714800EBF;
 Fri, 10 Jan 2020 17:35:51 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA2FC272D3;
 Fri, 10 Jan 2020 17:35:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] migration/multifd: fix nullptr access in terminating
 multifd threads
Date: Fri, 10 Jan 2020 18:32:10 +0100
Message-Id: <20200110173215.3865-24-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: kJCXF1M2NOeo3MGVOwTh-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Jiahui Cen <cenjiahui@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hChGhqd5mp/o

From: Jiahui Cen <cenjiahui@huawei.com>

One multifd channel will shutdown all the other multifd's IOChannel when it
fails to receive an IOChannel. In this senario, if some multifds had not
received its IOChannel yet, it would try to shutdown its IOChannel which co=
uld
cause nullptr access at qio_channel_shutdown.

Here is the coredump stack:
    #0  object_get_class (obj=3Dobj@entry=3D0x0) at qom/object.c:908
    #1  0x00005563fdbb8f4a in qio_channel_shutdown (ioc=3D0x0, how=3DQIO_CH=
ANNEL_SHUTDOWN_BOTH, errp=3D0x0) at io/channel.c:355
    #2  0x00005563fd7b4c5f in multifd_recv_terminate_threads (err=3D<optimi=
zed out>) at migration/ram.c:1280
    #3  0x00005563fd7bc019 in multifd_recv_new_channel (ioc=3Dioc@entry=3D0=
x556400255610, errp=3Derrp@entry=3D0x7ffec07dce00) at migration/ram.c:1478
    #4  0x00005563fda82177 in migration_ioc_process_incoming (ioc=3Dioc@ent=
ry=3D0x556400255610, errp=3Derrp@entry=3D0x7ffec07dce30) at migration/migra=
tion.c:605
    #5  0x00005563fda8567d in migration_channel_process_incoming (ioc=3D0x5=
56400255610) at migration/channel.c:44
    #6  0x00005563fda83ee0 in socket_accept_incoming_migration (listener=3D=
0x5563fff6b920, cioc=3D0x556400255610, opaque=3D<optimized out>) at migrati=
on/socket.c:166
    #7  0x00005563fdbc25cd in qio_net_listener_channel_func (ioc=3D<optimiz=
ed out>, condition=3D<optimized out>, opaque=3D<optimized out>) at io/net-l=
istener.c:54
    #8  0x00007f895b6fe9a9 in g_main_context_dispatch () from /usr/lib64/li=
bglib-2.0.so.0
    #9  0x00005563fdc18136 in glib_pollfds_poll () at util/main-loop.c:218
    #10 0x00005563fdc181b5 in os_host_main_loop_wait (timeout=3D1000000000)=
 at util/main-loop.c:241
    #11 0x00005563fdc183a2 in main_loop_wait (nonblocking=3Dnonblocking@ent=
ry=3D0) at util/main-loop.c:517
    #12 0x00005563fd8edb37 in main_loop () at vl.c:1791
    #13 0x00005563fd74fd45 in main (argc=3D<optimized out>, argv=3D<optimiz=
ed out>, envp=3D<optimized out>) at vl.c:4473

To fix it up, let's check p->c before calling qio_channel_shutdown.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 4ba9037e78..5da3a47ffc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1308,7 +1308,9 @@ static void multifd_recv_terminate_threads(Error *err=
)
            - normal quit, i.e. everything went fine, just finished
            - error quit: We close the channels so the channel threads
              finish the qio_channel_read_all_eof() */
-        qio_channel_shutdown(p->c, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        if (p->c) {
+            qio_channel_shutdown(p->c, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        }
         qemu_mutex_unlock(&p->mutex);
     }
 }
--=20
2.24.1

