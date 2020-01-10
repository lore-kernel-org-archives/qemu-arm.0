Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp990582lff;
        Fri, 10 Jan 2020 09:38:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnHwlVohNPzJymrMPzmp186biUKGkWQeU6glvXOVCX3X4VuQ1YbrOLsuikRYhUFjw8/Mp+
X-Received: by 2002:a37:a348:: with SMTP id m69mr4053827qke.343.1578677906236;
        Fri, 10 Jan 2020 09:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578677906; cv=none;
        d=google.com; s=arc-20160816;
        b=h+pxSbTaqwJYnbuUOSSzMne89hTrQs6QRB5PlxlMHYh7KhW6ZsZ40UMgCF/bujbm6F
         v1dsZxEnKwK4ydFkaCq2PcGVjrJaWC4CLAGZchqVXxr6gJ+m+puQSk/GS57tj9AVJDxY
         8yXum9+gUJQVGMRZZBeyvsoygpYNrveXQbO3P3Lond6TRr4k5EBE956L3RQaFU8Muli0
         pbBtxUiLMocUI069Uqc/b5QFr8XfENLNgCuklSR5bS49+tC5rtfUg4v7eOInFlO/ZXaL
         6NOVkUJsBAKur/AkrXKOMmb8C0S89DNTTvQHDlgiiAy+cvQVQ7irKIDOBSeCikl1ryxE
         O7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8PL3njRMZwxs9uKSpCL5NJoIzl7l80qAcMLLGRwuXdY=;
        b=llZNOrWI/Whao9XVTcngZZRFdhJ37C+UG9djtGgx+ujmWzDPXnfQW1FnQsEUCNA+Zg
         FDuu41/u//FkNzj5z8qs5NWuvo98SfkFvjjVR21TfH6jsGVlGcYWQn2GZoUVRssajbQm
         snWcfB2kdBIF2/Ug682KfXph2OrqckOfcMK1XM0mHYObnXGHIUIVaxXQGLFakZUkzyKw
         kvwW/C4698VnP28zKl7bqDpfDgAVi029z6lUfJOEiK4y4P2tpGIDGYlwvqNomW+VjzsR
         OXXzhUGn48CeI/V+4E6iV659Ljg+KexMEnpNj4F1yW1L2gWmNxKpdbrE18Z53DQSVhXI
         T7GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NwK1yPpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si1622909qkj.256.2020.01.10.09.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NwK1yPpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyEq-0001tf-PA
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyAe-0004k7-42
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:34:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyAc-0003Wp-W2
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:34:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33099
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyAc-0003VW-R7
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PL3njRMZwxs9uKSpCL5NJoIzl7l80qAcMLLGRwuXdY=;
 b=NwK1yPpPDZEzJ9/tMG0pdU6R/BCkPcDo8O3RScWQ/vK+I5/AJw3fopOv5IHrMncerD8A4t
 b+AedvadqG8+HSACovFcnVkVf76DgcfvCw+id3C2b/T9y6M+AYa2dsKFXmk5AZ5DcpcFO5
 qlQ5wi6VZbyZ6CXsxy6dmZgyaxiDnZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-syCVE1FMMziir2jLA5ncog-1; Fri, 10 Jan 2020 12:34:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB91593AF;
 Fri, 10 Jan 2020 17:33:58 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE0DC19C4F;
 Fri, 10 Jan 2020 17:33:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] migration: add savevm_state_handler_remove()
Date: Fri, 10 Jan 2020 18:31:59 +0100
Message-Id: <20200110173215.3865-13-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: syCVE1FMMziir2jLA5ncog-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Scott Cheloha <cheloha@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRuZJGzLb4sc

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

