Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5406371lff;
        Tue, 14 Jan 2020 03:54:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVgQPidBfroaHMMlG+yVChwPKXPR1U99YnuT65HZ0bbXWgjD3EdPse0Inj05WCdi8i3+AQ
X-Received: by 2002:a17:906:64cf:: with SMTP id p15mr3941396ejn.259.1579002892729;
        Tue, 14 Jan 2020 03:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002892; cv=none;
        d=google.com; s=arc-20160816;
        b=acFtXxukJxtg9k+/5BA/QeKbZdErV5KG2jQ/k+iXxHTcxpTSehiauku9ar0kFVUy89
         K/OVpFGKMZ4oaQ7kHyCKVPk2oa+t3kPxj+iFnyXNJ+kAS+o351gYkHxrpUVpGptU9sdE
         kWNEU/zUcDCkIY+Qs6tBIHNymNp8kSoUlhz+fWXEuiT6hB9ivTW03pURzWmdK6Saj+qu
         E6gSxcPTaeoWit/I0HMntqMJPyAInqX9c2BtGbe0u5JFnmyrrpu4tn3UsJy7Y6aYwORv
         Jox2CycMy0YbvtZRDBS9FtBZ4hhDUr7B5VFb8/VoIucasV6wLP+J5AImgJJc3Js4tPiE
         EemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PK1DLQmnnjOb69h2hvvX3jewUj0gHU0HSmNfuQkfjl0=;
        b=r0jiQXlu0JhyCUY6+uZub0IldCXEFpXOfgr9lW5OqsbKossBZAvgpBw4EguyTfimRI
         oPMRvK+EY06S9hbPg8FF0hj1ZAa1mHVSoGVHNmSTNYPLicngc1P1ujR5fFcdToWGSv26
         I97vmv6xG8iSPGtY9Ov2OMmLI/th6eRIucKFhh1ZD0VlRjXOp8/Y5hiP2wBG7h9Ah5Pn
         aCr8ELkGpJrIsvFUZY/BloGhT89BU9Zf6JC4iO8ndasbKcJk/GQHMEWv4J4j8zwrUgyN
         /qFw5r+BYNCcWijMrZIimPwCbK8hBwJP9OAuRjDy0+FszNZPnCItuM+QpcTpxVcbPFkL
         8O8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P9y/0B/O";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si9293574ejb.361.2020.01.14.03.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:54:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P9y/0B/O";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKmZ-0005kZ-CC
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKaC-0007LK-Fc
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKa8-0003Y5-Qv
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56934
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKa8-0003Xo-Nk
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PK1DLQmnnjOb69h2hvvX3jewUj0gHU0HSmNfuQkfjl0=;
 b=P9y/0B/ONMEqNMBiz1eWBgNRjwwx1wJhFJDLcl7zhmV66SrvnuOqM9dX9pHPaMBqcUQqKE
 JJ/r6o5xtLwN2vRrsZa2nncl8sIp34hEXMujh6wZFIAo9X3tciSO/9LXbUiEmaHr/tkK0u
 k3MDB3uNzIob3cX9IcPNEL5YrKcxmLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-uA1cweaXNCuXjAdn87jUPQ-1; Tue, 14 Jan 2020 06:41:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C126801E72;
 Tue, 14 Jan 2020 11:41:57 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 083285DA70;
 Tue, 14 Jan 2020 11:41:45 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] migration/postcopy: enable random order target page
 arrival
Date: Tue, 14 Jan 2020 12:39:15 +0100
Message-Id: <20200114113926.3556-20-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: uA1cweaXNCuXjAdn87jUPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9thapZbeQY0U

From: Wei Yang <richardw.yang@linux.intel.com>

After using number of target page received to track one host page, we
could have the capability to handle random order target page arrival in
one host page.

This is a preparation for enabling compress during postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 460abfa2c3..a7414170e5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4050,7 +4050,7 @@ static int ram_load_postcopy(QEMUFile *f)
     MigrationIncomingState *mis =3D migration_incoming_get_current();
     /* Temporary page that is later 'placed' */
     void *postcopy_host_page =3D mis->postcopy_tmp_page;
-    void *last_host =3D NULL;
+    void *this_host =3D NULL;
     bool all_zero =3D false;
     int target_pages =3D 0;
=20
@@ -4097,24 +4097,26 @@ static int ram_load_postcopy(QEMUFile *f)
              * that's moved into place later.
              * The migration protocol uses,  possibly smaller, target-page=
s
              * however the source ensures it always sends all the componen=
ts
-             * of a host page in order.
+             * of a host page in one chunk.
              */
             page_buffer =3D postcopy_host_page +
                           ((uintptr_t)host & (block->page_size - 1));
             /* If all TP are zero then we can optimise the place */
             if (target_pages =3D=3D 1) {
                 all_zero =3D true;
+                this_host =3D (void *)QEMU_ALIGN_DOWN((uintptr_t)host,
+                                                    block->page_size);
             } else {
                 /* not the 1st TP within the HP */
-                if (host !=3D (last_host + TARGET_PAGE_SIZE)) {
-                    error_report("Non-sequential target page %p/%p",
-                                  host, last_host);
+                if (QEMU_ALIGN_DOWN((uintptr_t)host, block->page_size) !=
=3D
+                    (uintptr_t)this_host) {
+                    error_report("Non-same host page %p/%p",
+                                  host, this_host);
                     ret =3D -EINVAL;
                     break;
                 }
             }
=20
-
             /*
              * If it's the last part of a host page then we place the host
              * page
@@ -4125,7 +4127,6 @@ static int ram_load_postcopy(QEMUFile *f)
             }
             place_source =3D postcopy_host_page;
         }
-        last_host =3D host;
=20
         switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
         case RAM_SAVE_FLAG_ZERO:
@@ -4178,7 +4179,8 @@ static int ram_load_postcopy(QEMUFile *f)
=20
         if (!ret && place_needed) {
             /* This gets called at the last target page in the host page *=
/
-            void *place_dest =3D host + TARGET_PAGE_SIZE - block->page_siz=
e;
+            void *place_dest =3D (void *)QEMU_ALIGN_DOWN((uintptr_t)host,
+                                                       block->page_size);
=20
             if (all_zero) {
                 ret =3D postcopy_place_page_zero(mis, place_dest,
--=20
2.24.1

