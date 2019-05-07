Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3844085wrh;
        Tue, 7 May 2019 09:46:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwUZY9HAtXFGzzVWpESzW9LTq8unC4+hCWqfAdJ2vDvkQjF2q3FHMK2ibiiAfkp7gmyniA
X-Received: by 2002:a5d:5189:: with SMTP id k9mr8549292wrv.90.1557247616703;
        Tue, 07 May 2019 09:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247616; cv=none;
        d=google.com; s=arc-20160816;
        b=Vbxv0sXPmepKOoDswK5/S3fiW5QSxpz/JF0r1SGhuHxKaIQxEUwpXIv3oMLCoUxtW7
         JLDHw3Dd8VEUdMugoqZL2xghJHLQNncHpHSxpKHDpK/aUl9TqM5vzcHkFL91xw/Ece1y
         PtG2JuIpT2lbA0THsvlfURMhmMAdpVXENwn/kYyHhIvPVi7GccpfWxrta5HoswK+2gYf
         UAywIo/A3XWi6S7S7/X6pgpafT7zRSYeRSzkVMdXWtdDc+oREsE7/3Hqd8PcfPZiUhhr
         +Pr8fQH3NWI+9OfF7aalxOS+QazZ0ZaSlpeF16RCIiCro44gwMFcNkkwyD2RxAO5ahDY
         a2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=q/VPKec57oEaBdO6HR1bX1GAL/AvIQNw2lkKC6lyZDo=;
        b=nTTHe27yHQ6OGkD8zq0qD3VCTc3bYNJUZYh/MI2CaOKp+Y5mtplUmy249vm28ywRPU
         ZucYpe4RyhejEsH14hCtuDrCp9I+BSjXJGdgGyVeXXKXAZ/s1kQ9bClinfFnoZcin5Z0
         jIlesHWC6UV1sbiStytHxREb8RbkOBNkopJb9SdNzPbP0vlTVHnXmZnFSm6fXMfaPJ11
         +TmgsANRvXVDQQxTqWsmsszqiZzBeDoYvJodAMqtPUcdCnRUpG++a74mrpkk0FknBvF0
         zhrdy7pmqf6Xe0TiBCV5Cl8kADhCy+f3+meq0Y/F/U7COAzgb+LcZwYKAi/SukEx0uY2
         Qm2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si7406834wrr.151.2019.05.07.09.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO3F1-0003rQ-Mp
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:46:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO37M-0004iJ-0o
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO37K-0005oS-V0
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:38:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO37K-0005nZ-NB; Tue, 07 May 2019 12:38:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE518301989A;
	Tue,  7 May 2019 16:38:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 157FC8160;
	Tue,  7 May 2019 16:38:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:16 +0200
Message-Id: <20190507163416.24647-17-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 07 May 2019 16:38:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 16/16] hw/intc/nvic: Use
 object_initialize_child for correct reference counting
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
X-TUID: O1ogHgr5Q9NE

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script:

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

We let NVIC adopt the SysTick timer.

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
 hw/intc/armv7m_nvic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index fff6e694e60..2334fe51426 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2568,9 +2568,9 @@ static void armv7m_nvic_realize(DeviceState *dev, E=
rror **errp)
          * as we didn't know then if the CPU had the security extensions=
;
          * so we have to do it here.
          */
-        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_=
S]),
-                          TYPE_SYSTICK);
-        qdev_set_parent_bus(DEVICE(&s->systick[M_REG_S]), sysbus_get_def=
ault());
+        sysbus_init_child_obj(OBJECT(dev), "systick-reg-s",
+                              &s->systick[M_REG_S],
+                              sizeof(s->systick[M_REG_S]), TYPE_SYSTICK)=
;
=20
         object_property_set_bool(OBJECT(&s->systick[M_REG_S]), true,
                                  "realized", &err);
--=20
2.20.1

