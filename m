Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5276408lff;
        Tue, 14 Jan 2020 01:36:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqzC5HwQmpcC9sD99lnRj5/edw4zwPb6I4LF5/KaNKYLKUIqxUB4+qFfJdpvCPQbWvsm65ez
X-Received: by 2002:a17:906:e86:: with SMTP id p6mr21907998ejf.299.1578994605001;
        Tue, 14 Jan 2020 01:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994604; cv=none;
        d=google.com; s=arc-20160816;
        b=I9alKHaFtH6gxupML6Z38phjyFpB76iTm9Vrx8kVHtWp/32Dt0Z/SN8hu0EMjrlTV5
         zCAwxUABKL7zWYYreBa3jbd0fdPY+5z2144LrylPS0/Z9iHYRM1SosxUUJyKJ3EdXSIU
         p+Sb2ojQs/EtRYSsmrv1B0n18Mhnk4GqEcA6xz1A+j73biFFdclzHIXD/d78h+7BThPl
         xU8a1uklctANW3AgVJKg4Nmj0aoeyfa90JO3lZ7jzhzavjBHObaUmVtkir/vRTuyAd7B
         RCPKJdNzyObq6yxPu7FgYDuNG0++XTkKjuHMygLvFBidVSq3vtrxVJ82GNK69w9bfemF
         kJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ynLvDJfV4kUr7Pu6PZ24xc1KIuICA5kAdzwdWYoRAQo=;
        b=a476i0b92NXTemvgUZuOJRORRIunuf0g9oVE0d/SumX3LK5WvbylCK02bM4OogMGP1
         IGjsf5zfP0rp21JhmdcQLANcAPffYglZhGzBk0AMQ8JZ1oDKt0dJs/QMO8WeKunlYUSI
         kMNsoPKlIU9BtjDEFYgoYn8OBgOZr8DP2LZx3aE0eq7jd7FqtHsXXYKdNnpZuQE68zGr
         kscy5Sau9ge3VDuXOy0g6+gpPry8eW9SPby3mDPQIjR+V0QB3XRZx8eXJ3zX+h/N+lwk
         6RtdcuhlwMRX3agM/0qBMpb5fPOOMrZ68gQLCSS7rwBllQ7E261oMEO6+Je3tGHAz5KD
         bBqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eOFciKy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc8si10697920edb.261.2020.01.14.01.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:36:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eOFciKy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIct-0000n5-Hd
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIUb-0006qV-4z
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUZ-0006es-Tm
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:09 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39583
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUZ-0006eU-Qi
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynLvDJfV4kUr7Pu6PZ24xc1KIuICA5kAdzwdWYoRAQo=;
 b=eOFciKy5T9cQaVKD0x4SyvYAWpW3qB1Gteah84ZUksWf6/UpsXuyyKxXr80EeqpKLoKZ/c
 X90+vFAZk+z9KE37WB3l1RsyCMWX402R7rxnH5V4MYL4kMmaBd3WCEMXg5hqKr472lKeKS
 7XgL99eOBWbYatH0L7lBhGulvY1k+g8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-N1f5REKCMNKMnrWrZ18yCg-1; Tue, 14 Jan 2020 04:28:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E3F1800D78;
 Tue, 14 Jan 2020 09:28:02 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453B9384;
 Tue, 14 Jan 2020 09:27:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/29] migration/ram: Yield periodically to the main loop
Date: Tue, 14 Jan 2020 10:25:51 +0100
Message-Id: <20200114092606.1761-15-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: N1f5REKCMNKMnrWrZ18yCg-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Nzdw0bKUQbl

From: Yury Kotov <yury-kotov@yandex-team.ru>

Usually, incoming migration coroutine yields to the main loop
while its IO-channel is waiting for data to receive. But there is a case
when RAM migration and data receive have the same speed: VM with huge
zeroed RAM. In this case, IO-channel won't read and thus the main loop
is stuck and for instance, it doesn't respond to QMP commands.

For this case, yield periodically, but not too often, so as not to
affect the speed of migration.

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1ec5c10561..5cd066467c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4246,7 +4246,7 @@ static void colo_flush_ram_cache(void)
  */
 static int ram_load_precopy(QEMUFile *f)
 {
-    int flags =3D 0, ret =3D 0, invalid_flags =3D 0, len =3D 0;
+    int flags =3D 0, ret =3D 0, invalid_flags =3D 0, len =3D 0, i =3D 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability =
on */
     bool postcopy_advised =3D postcopy_is_advised();
     if (!migrate_use_compression()) {
@@ -4258,6 +4258,17 @@ static int ram_load_precopy(QEMUFile *f)
         void *host =3D NULL;
         uint8_t ch;
=20
+        /*
+         * Yield periodically to let main loop run, but an iteration of
+         * the main loop is expensive, so do it each some iterations
+         */
+        if ((i & 32767) =3D=3D 0 && qemu_in_coroutine()) {
+            aio_co_schedule(qemu_get_current_aio_context(),
+                            qemu_coroutine_self());
+            qemu_coroutine_yield();
+        }
+        i++;
+
         addr =3D qemu_get_be64(f);
         flags =3D addr & ~TARGET_PAGE_MASK;
         addr &=3D TARGET_PAGE_MASK;
--=20
2.24.1

