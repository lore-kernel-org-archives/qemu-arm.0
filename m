Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5289462lff;
        Tue, 14 Jan 2020 01:52:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyukjRHrm+M6Xjyzo48YeY7/HZnTck2nc0D4xPm8BCtdo3RrntaMTC6FBZ6QiYcssjv6drB
X-Received: by 2002:a17:906:b88c:: with SMTP id hb12mr21758670ejb.150.1578995521573;
        Tue, 14 Jan 2020 01:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578995521; cv=none;
        d=google.com; s=arc-20160816;
        b=SaX6qrPYEpfLAXOAsUYyone1P45hnR0d4FkQxoTKBZ6AdQqbCoYAXlFlRBRhHnsb7J
         OBYegRMCAi+VqARL2VRS/7VOcoFYf8yQmlc9LCXSVIitVteQL8Cqk+1QbWL4VVsnAift
         WFMztCUNKz5UCqSOE3sNvNsj5wYH6dMzITaXaL8p9V47A/l8lob9XmLXV3xl/uR/wLxW
         JJ9CysLN0TWmulnDzXCL2VBn5Mee+9DB60GmLXhyT+77msz98R/hpqaxS0YLlcHvGGyj
         JiFLHmGI+zK8QIdvOX4Y6ZRbrsCs8U9+PYvdVVxTRJpwI/ZEl27GJHyKSnlpL0P46b/V
         h8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WBzhg+5JJy6m9TZjuc8ccJtIryAwYcan58WTVlhEz18=;
        b=FImjJLRriUJBKUH8b540ImDY0F/s0xmEg5XiKbFTFGN/w1/xVTtpgVhxnlNX8ebi8X
         xKzDk9LqhZ+Q6UxG2hgQkACCDjt3W0sGNN4Nb9u14xwq2dV+IgG7SjCsG5DPveSicFqd
         nYOSOwWQ/TkHvyyl5mxhkGGlUR8wBdZ6hC3aXxe285Fa4Hw7d5ABWXsT7RW9S9vDSfLO
         FGu+Geiv/FjlQ3Th9ALa5EpIrtaRJLrdQ5sMy8epYJGOj+U1y4voyJnLN/xawdfRzalC
         Mj4SKDQHH0dDrvKnSxgDflOzoElixmFDRsH+wopgzZXSwu5F1mljAMJU/xJjbTG0Vmyj
         uIUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CAbRw077;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dg1si10682157edb.413.2020.01.14.01.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CAbRw077;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIrg-0004Sv-Cm
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIVZ-0008ME-A7
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:29:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIVX-0006sz-QI
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:29:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33548
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIVX-0006sk-9y
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:29:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBzhg+5JJy6m9TZjuc8ccJtIryAwYcan58WTVlhEz18=;
 b=CAbRw077YgtEauHItreN5vCmbATN+pRoiDesqctiYNhMdTbJ/akc9eS+tECkZ1/EV+b6f3
 uFyWmZwu5TU24imS9FwP4Qj0ucnCkUWQwJw14qDBLN2aQEUfu5WeI2UMaf7aNeremSpBTd
 16FJO9g8MwtBVjv//XNYpdMSyqxfwnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-M2gQWJhqOQqF533B9s1gmg-1; Tue, 14 Jan 2020 04:29:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4883107ACC4;
 Tue, 14 Jan 2020 09:29:02 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BA0327184;
 Tue, 14 Jan 2020 09:28:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/29] migration/multifd: fix nullptr access in terminating
 multifd threads
Date: Tue, 14 Jan 2020 10:26:00 +0100
Message-Id: <20200114092606.1761-24-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: M2gQWJhqOQqF533B9s1gmg-1
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ying Fang <fangying1@huawei.com>,
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
X-TUID: FEEkJ9Sefn8M

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

