Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2742897qvm;
        Mon, 20 Jan 2020 02:57:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDOJMNPtALpCOhrMGma3qSJ1y5DlwRikN2x88IGqRPyodRAZ1gFjUMGovuQracMcqT/E2k
X-Received: by 2002:a05:6402:1437:: with SMTP id c23mr16190204edx.48.1579517841715;
        Mon, 20 Jan 2020 02:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579517841; cv=none;
        d=google.com; s=arc-20160816;
        b=I664tuV/43n+wB10hU5bJH6bJjMPlrckvvQCDsR7wxw9svDigvDS/WNY75x8OXPwTc
         y1kw+wNFWC0USUuKalwvF1sGhgEAUUUVpsyorMgiK1gAwg3SoQtZU7BAYtI2ubQcVyon
         eGfqm0PkD6k3EP+F7b33MnYJ/qw8b7eAXI1oBjIy8AkMMbExbWnM4wB1m/95OLi4W/25
         NEag4xySNBLR0Uzf3A02HAsxoT1USC7U094mn2JBIqOvnJy2/ib/3s1QTkOEz0OH8a66
         3WILKi/bsjZCrEyIWM4Us98chGuD+X6pXH0+dQpm4ANIdqHUKitKMyOorhWDhlzwXIxF
         ae4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WBzhg+5JJy6m9TZjuc8ccJtIryAwYcan58WTVlhEz18=;
        b=qoKZiOV9SAw8QigpHDaiVI8nxT16ENfnAuktm2Yf061ABFlFrREfF5RhZZX2R+Bg5y
         BeqfWDeXWJHp6HS/6Gaqx1+PJa0JJw0QMQOulMjXdMCmx5n1ninBJ2ebZSVgZUgWdvnY
         nloejXfdIKynibgP997d6w7Q1lgX+9zuLOjagyYmv5TpydCLHA/QGsiJ/eWRaBc09asv
         0Mr2FJGUxidQbN8AFtRq6WjFIN3wldLnNDSFq5kqFCYj49z/laagQF+bW4uutIs/AmYi
         YNcjuz1d0Wg2wBXs1eloNjz9PKv82OJ67eZv2GEF68wN6bxHAhOZLVDFJmh7bJHznA/r
         rfRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i2RVAo8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si22067368eje.430.2020.01.20.02.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:57:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i2RVAo8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUkC-0001QV-4H
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUQc-0007Q8-0m
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUQa-00033B-PV
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:37:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37910
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUQa-00032u-L3
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 05:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBzhg+5JJy6m9TZjuc8ccJtIryAwYcan58WTVlhEz18=;
 b=i2RVAo8OlWJt4L1B7j8PcX1mqlAGqFc2XOj3+DY1am3ZtnNe8/BoaRhX1HNQafuauwJqIj
 I9Pmw9wIau5aI7rpnDPa3RBkgC9bBBiCJS8P9scjmILlO8gtbjD+LwjILP86jtjmXZ5kzh
 UXdn3Vt+1RbyGUB981JOhasMvRq8FSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-LlSGLCzGNgKQjpxM2GLoeQ-1; Mon, 20 Jan 2020 05:36:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A8FDB77;
 Mon, 20 Jan 2020 10:36:55 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 189838478B;
 Mon, 20 Jan 2020 10:36:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/29] migration/multifd: fix nullptr access in terminating
 multifd threads
Date: Mon, 20 Jan 2020 11:33:33 +0100
Message-Id: <20200120103340.25118-23-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: LlSGLCzGNgKQjpxM2GLoeQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-TUID: bBED6iZDVLY2

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
index d4f33a4f2f..278b2ff87a 100644
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

