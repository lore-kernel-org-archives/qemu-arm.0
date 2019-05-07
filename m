Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3843019wrh;
        Tue, 7 May 2019 09:45:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEI3v4/rXM2TgE6b8I6bNEPWgKO+6F5MeS6NgMeLIaH4/ciYMKP40nqHJVqjWnyKJJiO3N
X-Received: by 2002:adf:f10f:: with SMTP id r15mr13931492wro.274.1557247548326;
        Tue, 07 May 2019 09:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247548; cv=none;
        d=google.com; s=arc-20160816;
        b=c1aydwKmbcLFZa56Wvx69BvsJXQqopZfQLr4gZ5Wi8Gh+GP4SnipSle8zdDqgI+pOO
         Hm9nyVa/PZN25WzXfXMxxWtt5ys6PKX0b1e89A5xsZErTwJOtYBfj8EbR/TuMEzqXTSp
         Duh+K99oYe6428Fl7Wzt5BDMcDZdJWoDraGexmUNBVQhL9U8wutC1HvPe2tWqTnmjdID
         iBr74b/6IThUyIbVaGXKfi5rAC+csWHooEHR+BcJxXSF4eHOWpBFf8ICgRrz5xQKbDDS
         4M+hNjlIoTUldHvbZFgF01NT7BMF2AmxaQRjL8MXdbWDuPbrOOtxkr3ysKoKpZ6g2l8l
         kZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dhP3bVNyMWW+2QvCV16Ux4PeAeem5nmsDM3/Xbk/AYU=;
        b=fYWFz7uNkJ3mvPH+AbnlQpB9X5ixn+ARhsNuIBk+jv9Oo0tLlXPVDH8tMSi5pj2KlJ
         dKHYXraxG5nTZdV29I3ql7yZMfhygS5D8uA0V9lmIJFJ51KNmRZvdVpGLvCtDqiY6Ay/
         tdqnUuoN8IhYRr0Qt3n8hy7+J1xce/E9RA3tXupXTvyy8XiDDniCOvZrr7IybWVBJ//u
         gOe9VlmhIF5rbIO/vFyQGTqX3sXgrUn12wwlZCPJoJvdsJSVOG4MXJnHgZFhj/a/uPOg
         ZBqZGeglCZA7ctzVqwyCtgBsy+QVCAfLpLZVTJh/9XV/16pscxBQvf/ONlmilO+gspT2
         4gtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17si10327247wri.445.2019.05.07.09.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO3Dr-0002wm-ND
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:45:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO36R-0003qr-3V
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:38:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO36Q-0004r8-45
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:38:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO36P-0004qP-Sv; Tue, 07 May 2019 12:38:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F05FE83F3C;
	Tue,  7 May 2019 16:37:58 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABCEB8162;
	Tue,  7 May 2019 16:37:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:13 +0200
Message-Id: <20190507163416.24647-14-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 07 May 2019 16:38:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 13/16] hw/microblaze/zynqmp: Use
 object_initialize_child for correct ref. counting
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
X-TUID: cHjtX3x8J1Et

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script
(then manually modified to use numbered IPI name)

 @use_sysbus_init_child_obj_missing_parent@
 expression child_ptr;
 expression child_type;
 expression child_size;
 @@
 -   object_initialize(child_ptr, child_size, child_type);
     ...
 -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
     ...
 ?-  object_unref(OBJECT(child_ptr));
 +   sysbus_init_child_obj(OBJECT(PARENT_OBJ), "CHILD_NAME", child_ptr,
 +                         child_size, child_type);

We let the SoC adopt the IPI children.

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.
This choice also matches when using sysbus_init_child_obj(),
since its code is:

  void sysbus_init_child_obj(Object *parent,
                             const char *childname, void *child,
                             size_t childsize, const char *childtype)
  {
      object_initialize_child(parent, childname, child, childsize,
                              childtype, &error_abort, NULL);

      qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
  }

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
index 20e973edf5f..0948b1fd5f2 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -71,9 +71,10 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
=20
     /* Create the IPI device */
     for (int i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
-        object_initialize(&s->ipi[i], sizeof(XlnxZynqMPIPI),
-                          TYPE_XLNX_ZYNQMP_IPI);
-        qdev_set_parent_bus(DEVICE(&s->ipi[i]), sysbus_get_default());
+        char *name =3D g_strdup_printf("ipi%d", i);
+        sysbus_init_child_obj(obj, name, &s->ipi[i],
+                              sizeof(XlnxZynqMPIPI), TYPE_XLNX_ZYNQMP_IP=
I);
+        g_free(name);
     }
 }
=20
--=20
2.20.1

