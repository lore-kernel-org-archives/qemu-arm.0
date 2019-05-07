Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3833038wrh;
        Tue, 7 May 2019 09:35:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwX3jfZS1blOFT9EUlZe2tMR4nbh3Bx8xdMGUgeQMuF0p53J12EhMYYZQfduWMOXIV/8rHW
X-Received: by 2002:adf:f508:: with SMTP id q8mr5324475wro.225.1557246940851;
        Tue, 07 May 2019 09:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557246940; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+X49UBnWazFtryhjBoeiYeagLGxJB6Ass0QRGzRQ4e1rxIx9uNoZk7sXhYohbWv2m
         Zi/UEJKjf/X/MVr9z0YkWLSQOWp9W+MMf5Y1pzg+fIm9qbkXFoH+NN0JhUXq9glCPfpx
         nOs71p/94gTxN5+QUFX7Xa6YN1IY6ZDM+Fwg9igdMsWA+DI7PE5r/Q3ptS/jg1HZXkNh
         fje/w+Aee84+1k4hGw2S4JVlWN+9WKWS3wWGQ+EsmbXEN6UP5Q5t6JYIUyuq0kHd2R8q
         A/PlkY/nwlKnBkjLAda/K2j1W5HgSS6casokIRJAyX7pAGYm3w47joanquU7Tu1j3b+m
         I/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TKHKLqQ1vjMqPkNIpzyeaawVh6Vdr5BibekERPOguGg=;
        b=OBL+y6ikYDUXeoKN7LDvlDh8CvRdWUVK6T9buKwUAuR4+Lvq65LmgRvYV9O+WEK15O
         cxzWfGnfJntyahmeTcRFhLHmRLJQ1WAU+iNHPnhq5x+htsaB/oQhBf51GJ+EJ1l5ulVy
         FHH29hT2Ke/xAL9/QHvVKgWKzJZTdA0PRqs/YhjL2y9yZczmKcj/R5AcmTXwwAvn+YSH
         W/jv3ou4d1JGjX7rpZYBwUA1/yLRPwKIa75HrJwprOXpAhUsiRlY0MM8UZTlKr2XyMr6
         UUCyuidolN1dk6d+LINzoz8GcPs8Vw4Fc/VFn/wGVl8LJZvyNrYHSnxqK3dWK8KqBTtD
         Oc8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si9336545wmo.145.2019.05.07.09.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO347-0000lH-Oz
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:35:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33c-0000P9-OC
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO33a-0000xd-L4
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:35:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO33Y-0000v5-M7; Tue, 07 May 2019 12:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC04D81E1D;
	Tue,  7 May 2019 16:35:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8008160;
	Tue,  7 May 2019 16:34:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:02 +0200
Message-Id: <20190507163416.24647-3-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 May 2019 16:35:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 02/16] hw/misc/macio: Use
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
X-TUID: o66kITn4z8hi

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script
(with a bit of manual fix-up for overly long lines):

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
 hw/misc/macio/macio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 94da85c8d7d..b726c73022c 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -346,12 +346,12 @@ static void macio_newworld_realize(PCIDevice *d, Er=
ror **errp)
         object_property_set_bool(OBJECT(&ns->gpio), true, "realized", &e=
rr);
=20
         /* PMU */
-        object_initialize(&s->pmu, sizeof(s->pmu), TYPE_VIA_PMU);
+        object_initialize_child(OBJECT(s), "pmu", &s->pmu, sizeof(s->pmu=
),
+                                TYPE_VIA_PMU, &error_abort, NULL);
         object_property_set_link(OBJECT(&s->pmu), OBJECT(sysbus_dev), "g=
pio",
                                  &error_abort);
         qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
         qdev_set_parent_bus(DEVICE(&s->pmu), BUS(&s->macio_bus));
-        object_property_add_child(OBJECT(s), "pmu", OBJECT(&s->pmu), NUL=
L);
=20
         object_property_set_bool(OBJECT(&s->pmu), true, "realized", &err=
);
         if (err) {
@@ -365,9 +365,9 @@ static void macio_newworld_realize(PCIDevice *d, Erro=
r **errp)
                                     sysbus_mmio_get_region(sysbus_dev, 0=
));
     } else {
         /* CUDA */
-        object_initialize(&s->cuda, sizeof(s->cuda), TYPE_CUDA);
+        object_initialize_child(OBJECT(s), "cuda", &s->cuda, sizeof(s->c=
uda),
+                                TYPE_CUDA, &error_abort, NULL);
         qdev_set_parent_bus(DEVICE(&s->cuda), BUS(&s->macio_bus));
-        object_property_add_child(OBJECT(s), "cuda", OBJECT(&s->cuda), N=
ULL);
         qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
                              s->frequency);
=20
--=20
2.20.1

