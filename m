Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3833401wrh;
        Tue, 7 May 2019 09:35:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw84j5wPY1ARjnhghHk2j+H8g+6oibAwrw60RJy5BIoVAhtluA6OnzPwluFSRH+J3VTjSHA
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr22378636wrw.167.1557246959290;
        Tue, 07 May 2019 09:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557246959; cv=none;
        d=google.com; s=arc-20160816;
        b=J3n0zxWCMwYvFeyU1GU+Q/RLOMPeynh9Ga1g1ycRaexSbbLowWx1j3zS7Mmh3BD7EY
         XTeGUDByd5rAcILZEilt9jsRZcUq4bum2DLCoEkpmGCfQ4zEkBdRcoHhUPBqMnmYyS3d
         5KxwbRxirkg811fSE3K8+lX1Vix4eVxLToSyGhKvnPNmPtCJkyYlDGUhRoe2JZnL1BJ/
         vUmpVy4h6vRbLv2iVRpe/buZ67RvPmIu/AA8z2RoUtBxzqkV3cPfgt6CaOgh8PeJ8ewR
         v+/eV3BdPdPJlOx6pgaSjXE80VhBNLudE/6scEf/kOhqjHED6lW+uyeDIffzZ6n5WiuV
         HacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dhzoBQGLP/V6cvvKFvr0YUBVPualQmgEmoMLAJhCWtE=;
        b=OKbpZqOJFjtst+ntqOwh4luqyxbmia2kmOm/s5n/VkvF292cOsWUVB1Vfnyxus/nOK
         ng5TbbHoTP8yBF+FSuJtBE2KySTumlHc9sfpEvSB4oOKt80nkHWthDhh8ffvE1k0VpBI
         xTLipDtLqYiG2iVGP5tYxNsOFVOTcKDOtj+ILvxxVA5dZxHmBFDxeXDcBjmyKgyIXU+o
         lCFuW+9N5I/WO9Uxp9c5lJJjQ88KTM0TRNKNSGosLqXc/7+CNt6JDnyV/aJmu29YfVOv
         mbOSfD1l5qgYVEpWUkPZJvZs9CoScDvKjzdKkRMS5/NZd9z8VOtnSVX/H2/swlRoiNMf
         Q2iA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si9810700wrs.219.2019.05.07.09.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO34Q-000198-87
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:35:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33l-0000gZ-PS
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33j-0001BT-UT
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:35:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO33j-00018W-Mf; Tue, 07 May 2019 12:35:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46E2C3082E57;
	Tue,  7 May 2019 16:35:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B2898162;
	Tue,  7 May 2019 16:35:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:03 +0200
Message-Id: <20190507163416.24647-4-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 07 May 2019 16:35:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 03/16] hw/virtio: Use object_initialize_child
 for correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vcs6XFgJxzjq

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script:

 @use_object_initialize_child@
 expression parent_obj;
 expression child_ptr;
 expression child_name;
 expression child_type;
 expression child_size;
 expression errp;
 @@
 (
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                           child_type, &error_abort, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 NULL);
     ...
 ?-  object_unref(OBJECT(child_ptr));
 |
 -   object_initialize(child_ptr, child_size, child_type);
 +   object_initialize_child(parent_obj, child_name,  child_ptr, child_si=
ze,
 +                            child_type, errp, NULL);
     ... when !=3D parent_obj
 -   object_property_add_child(parent_obj, child_name, OBJECT(child_ptr),=
 errp);
     ...
 ?-  object_unref(OBJECT(child_ptr));
 )

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/virtio/virtio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 2626a895cbb..f2462ce0152 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2267,9 +2267,8 @@ void virtio_instance_init_common(Object *proxy_obj,=
 void *data,
 {
     DeviceState *vdev =3D data;
=20
-    object_initialize(vdev, vdev_size, vdev_name);
-    object_property_add_child(proxy_obj, "virtio-backend", OBJECT(vdev),=
 NULL);
-    object_unref(OBJECT(vdev));
+    object_initialize_child(proxy_obj, "virtio-backend", vdev, vdev_size=
,
+                            vdev_name, &error_abort, NULL);
     qdev_alias_all_properties(vdev, proxy_obj);
 }
=20
--=20
2.20.1

