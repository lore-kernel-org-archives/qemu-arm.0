Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2730241qvm;
        Mon, 20 Jan 2020 02:41:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyx6Rb6VX1FnSiXmlmUZJ3WU1J5PEE9wtU0OAEPARj+gLmTsz0IXwUJd80n4KMO3tBXlBlJ
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr19259049qvs.150.1579516863928;
        Mon, 20 Jan 2020 02:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579516863; cv=none;
        d=google.com; s=arc-20160816;
        b=yVfaxFufkUu7lU3TTBUYeC5w1LczeDPL0szZ6PzbnhHcylEZu7+FE4QNa35WawSm2V
         4irCDQMIiHPHdA7UXRn2m3zbxvG3liibBeew6BiOCkdSX2c26f8HKdEuO2+4Jl6KyaHX
         WbMEFx++V3FHVekKkYGBYFwnsOsmdkPSP83NwvZmPZF/MLI6wZWJ1FXsez+FQdUw0MTx
         E7M+fM3IO69YH3BkC3e0Id/BViECghaY0VNxaaDMbMeiZchECcb9c6WgQ2d8EjydyG08
         OnDsfsUUmPbrHJif39Z7IX0lvMZNZGij3hNwqtApUOSslP7jtd5zAJLuFJhbximUmExt
         aDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8PL3njRMZwxs9uKSpCL5NJoIzl7l80qAcMLLGRwuXdY=;
        b=UVdFP8B3ejHQY3jEjhldAYM5RZEfJp3zzc1klbB6rFRagOJbeN95hbH4m/xzj0pvZh
         YY5nbi5PayhKz0HpdDKY3vQnd1J+422dmvk5oJiij47LqtMyxBGzbYV7TjJscqzSeL9r
         GuwU6G+cDtGEgMqMSd0oZDEgSnyukle5vAvwql3kYTp5kzUpwbL1v6FIBO+yStuD3sP0
         4Ne0suXhT0f3EQ6pKvphrI7W2aaMRJfeiBtRhfhFyn+Edhd31+4/crJhOQMVEOsoZMjL
         WDCCO8NX0lDAILfi9RDCizE4dHag5x5YVoBCL8T6UmR8u0ZcsFUG9kwi8Czmxl8Xlz+M
         azgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gpgTWqyM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si21041471qkh.51.2020.01.20.02.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gpgTWqyM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itUUQ-00048l-Rk
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 05:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUP1-0005CH-8u
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUP0-0002ED-4F
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:35:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35432
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUP0-0002Dw-0A
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PL3njRMZwxs9uKSpCL5NJoIzl7l80qAcMLLGRwuXdY=;
 b=gpgTWqyMHCfePoDwrKja/5XoVtCEK7sPyt1rPDVkja+GKiI0ImWWeYrm4jxzL9L+KpQJkw
 IXsZxRtcm8SE6kOlM0XCVNBhCdV/ccb/qLMYE/FpVk6uZ8etVWisVbHA0j51dSujRJFXoO
 t5/vZBY0ywizER/2ie6J1MJvswAdpPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-IjRE8Qg0PvCHyd91ildYEw-1; Mon, 20 Jan 2020 05:35:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E45328010DA;
 Mon, 20 Jan 2020 10:35:21 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F3AF860E5;
 Mon, 20 Jan 2020 10:35:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/29] migration: add savevm_state_handler_remove()
Date: Mon, 20 Jan 2020 11:33:22 +0100
Message-Id: <20200120103340.25118-12-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: IjRE8Qg0PvCHyd91ildYEw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Scott Cheloha <cheloha@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h8uIG76kaJXy

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

