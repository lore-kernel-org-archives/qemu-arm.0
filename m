Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5270695lff;
        Tue, 14 Jan 2020 01:30:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdFH9hkQlXjTlbFsa5iYKwnXYCGMnjbBlpupkuL2OiKT09Menbmc2tsen5hQ64yTr8bto5
X-Received: by 2002:a17:906:4749:: with SMTP id j9mr20775027ejs.132.1578994256280;
        Tue, 14 Jan 2020 01:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578994256; cv=none;
        d=google.com; s=arc-20160816;
        b=QdqFSX22RmnxcKdZq1tELCZZFNMeHolXkj74D+JRvy7MKDoolhpW4AizfLgXkdToJC
         plLj728rqyfquy8a+raH2VOdZfj17IizGe3u1hNkspDN2HpSqIP1iQhGFDwTIB+u9EcP
         7UbkblL4VVMcU+M3MDvzm2Np16AZ4rYgQMyDH49gjIF8e9Yl5hvQzRUxc/o665Q8+AOc
         QIt2QKhBEv25+9cw5oiLLHqB3x6UE7V9f8FCUh6KcVMMR6MU8x3WuoX6rKYe1ivUbofd
         b9SWxiV4Xsk1lx9k4/Zlj5O7OQTT5sQkJ01QFxAIeCObZONRhCX//4cE3vuJsFWjMQ44
         kNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8PL3njRMZwxs9uKSpCL5NJoIzl7l80qAcMLLGRwuXdY=;
        b=Ht22XDr9VNnL+NIthbSATkwjnvL84zAmAFS63ks+XfUJ2BSjSQOqIP8DHVdtyxEpD+
         y20M50aj3VM1OdKmaMGxQ4mDDScavcErqoDVHrXrV0iG4143rVN2bD+M1Zuvo+wzeQuh
         aZXYnCjVoddzOzKtNOzNnFKQHHh9v4j+yzEhl1AIfRc5txksKKVEx1ZuOBjoOy/u/rXS
         SpfPSS41YfP8vT7/f+nzHHAyebNXM+A1cjOxLNK3lI54ZdeQfTOxHoRTbOx9JvppGBTd
         YrFkJN1KZ1MnIkVgOEMRAi7/RqpZxrAqgB+1LOq21eA2iSDJYB0V93z58+GuowoTtbg4
         2UlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=URtAKKJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si9371370edy.95.2020.01.14.01.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 01:30:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=URtAKKJV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irIXG-0001x5-Hz
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 04:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irIUL-0006R6-A7
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:27:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irIUK-0006a9-6i
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:27:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34457
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irIUK-0006Zm-1f
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 04:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PL3njRMZwxs9uKSpCL5NJoIzl7l80qAcMLLGRwuXdY=;
 b=URtAKKJVfwjAFr7BcsB7aHHdbrqLEZlOrs/QKl/Xa6m71H1UFQrrDAk2b9yJNLeezPg2ce
 8c7PncoLg6zSgIrEeePfLB9+01kAwvNlsC6tl33FpYLm48q3VbO+clR09UentYG90kAH6K
 4vIsBuLKBq/4IN+gvwaMCcEOZcyORpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-V8m4RVr7NXyD9i9prgXVDg-1; Tue, 14 Jan 2020 04:27:50 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14E55801E6C;
 Tue, 14 Jan 2020 09:27:48 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E4B3384;
 Tue, 14 Jan 2020 09:27:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/29] migration: add savevm_state_handler_remove()
Date: Tue, 14 Jan 2020 10:25:49 +0100
Message-Id: <20200114092606.1761-13-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: V8m4RVr7NXyD9i9prgXVDg-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Scott Cheloha <cheloha@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yXKrYYMZosto

From: Scott Cheloha <cheloha@linux.vnet.ibm.com>

Create a function to abstract common logic needed when removing a
SaveStateEntry element from the savevm_state.handlers queue.

For now we just remove the element.  Soon it will involve additional
cleanup.

Signed-off-by: Scott Cheloha <cheloha@linux.vnet.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 59efc1981d..30d980caa2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -725,6 +725,11 @@ static void savevm_state_handler_insert(SaveStateEntry=
 *nse)
     }
 }
=20
+static void savevm_state_handler_remove(SaveStateEntry *se)
+{
+    QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
+}
+
 /* TODO: Individual devices generally have very little idea about the rest
    of the system, so instance_id should be removed/replaced.
    Meanwhile pass -1 as instance_id if you do not already have a clearly
@@ -777,7 +782,7 @@ void unregister_savevm(VMStateIf *obj, const char *idst=
r, void *opaque)
=20
     QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se) {
         if (strcmp(se->idstr, id) =3D=3D 0 && se->opaque =3D=3D opaque) {
-            QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
+            savevm_state_handler_remove(se);
             g_free(se->compat);
             g_free(se);
         }
@@ -841,7 +846,7 @@ void vmstate_unregister(VMStateIf *obj, const VMStateDe=
scription *vmsd,
=20
     QTAILQ_FOREACH_SAFE(se, &savevm_state.handlers, entry, new_se) {
         if (se->vmsd =3D=3D vmsd && se->opaque =3D=3D opaque) {
-            QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
+            savevm_state_handler_remove(se);
             g_free(se->compat);
             g_free(se);
         }
--=20
2.24.1

