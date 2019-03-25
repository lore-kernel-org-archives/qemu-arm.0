Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711364wrx;
        Mon, 25 Mar 2019 04:02:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKlqjW6vEiK8groyeAC3XWDQcr4R/krGhF8Z6BBjIJdDccTmWAVCQ4zMmFMUfznGbh3O/Q
X-Received: by 2002:a25:c947:: with SMTP id z68mr19210610ybf.522.1553511777983;
        Mon, 25 Mar 2019 04:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511777; cv=none;
        d=google.com; s=arc-20160816;
        b=SgBkf4m5XkZmuYAswYv2yq2/ruMoFECM/gsd8FDPrzDMhSTWlk0tCXjcIFW3ORWgJJ
         lai2AH/xM6B7i1sZDvJoVxSKufk+F9GApa3/e3ka/DzZyZYbwCKpC3OXZ8LocbLxx1TF
         zd6QJEjUz4nYKpl1QeTBWhF7GI57J+8LNKRTwXHCn0fEtt28IKS5JXYTy8noRgkSa2h9
         7AeOh3vOF53fFVKIB978aGnlUtkG8qYDfzSMHr0+g7wDgMBrg4QoXeYmRgIuSBIRwgJ5
         OjmRvjg1rsj8gEvOG6ep4oLqk2DGPn3kXfehwh/+H3QYg5IEVk8RcLMB5liuOgrep6AZ
         J2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=UCfv5rcv/5jHV2QitOR2d3yVis3CP2zjykLUiuoj+b8=;
        b=cy7wkuwZD6hvu03HuZRsoNhxIDfvVdFTZOk9YJOUaY1vTrrxjQVF1pGf1iUO7wjl/Q
         3q7uKuahwlIT6vEGtuM5QuGe1M14Hd5twAHaQnyx4x9pV7+GHea6xXii6/uIb/oqqUCx
         mF78ly8v5IpsfOq7KR8N5tFpHJNBOr1y1+b7R1yd7F9pVXqN/WgwtJaM1h23yFnRpZ8R
         JpctaONTo39+bo+5wQhwoRD+ROQV5CnWwIJLXsS/X+3KpCTu4mfTt47gQjvLwLBKRP0U
         hPhGxb6YuAnE0gBKLaaLQNGaW1g2EzIfRUP7gOPsNK5twfNOLVpY5totX9I8NuYj/3eq
         MvHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oZay1PBf;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oNI5k+ew;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=edE1SZal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q62si9627771ybc.112.2019.03.25.04.02.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:02:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oZay1PBf;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=oNI5k+ew;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=edE1SZal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNZ-00059Q-BL
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:02:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNB-00056t-2j
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-0007pI-8n
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:33 -0400
Received: from greensocs.com ([193.104.36.180]:38355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN8-0007oN-M9; Mon, 25 Mar 2019 07:02:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7CD2B7D78AD;
	Mon, 25 Mar 2019 12:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511748;
	bh=V2GiLuYeyXa93lsR6gIhPeq2caDfc8+2V/ubkHYglDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oZay1PBf4DS6ewVpa3tgHQDEJLfwd+cCZpOHMpbwmjZhVzc+JUT8R+I+OBy7KzEjZ
	01CYMphz/9HJSr0mvryc47SwVADep0HZaXay6riqU8X/Kt3U3C2158tecz6lP+1I/E
	1zlF7ixD3QboN8hf37DBPLJxgwL+oRXhRsyYyBAE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=oNI5k+ew;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=edE1SZal
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lv6IRTWW3-M4; Mon, 25 Mar 2019 12:02:27 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 0DA397D78AA; Mon, 25 Mar 2019 12:02:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511746;
	bh=V2GiLuYeyXa93lsR6gIhPeq2caDfc8+2V/ubkHYglDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oNI5k+ewWFH5gIfhOKDTe/aReS9Q8s1rlEcin5W/j7puhy8xjjHnvtq7FVgkEYBJt
	JC4+U4BG+n6JeN5OR+Qew3t4oYaG4Uc7gMkGMjMHhJuEP+R2PenzPAxuJx/N3gGhxL
	p4EbGd+BDqFlHY6IB9ini23gdG3JOuQHV+I9L1yE=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E04997D7887;
	Mon, 25 Mar 2019 12:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511745;
	bh=V2GiLuYeyXa93lsR6gIhPeq2caDfc8+2V/ubkHYglDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=edE1SZalbNgt/MuvGPTcJtIAxP+NVai2oeV9YFBospvcQJMXW40hC6G0t34WouRxs
	3leWGJ9gk6zQwmSs9yEUpERLgEAHFZw9qv8GQdklgXmLOrIjPVgwvxhOyiUrwEIauK
	5hau4PKcLhW46cJCLTbqFVk1VrUswTsQuBkga5cg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:51 +0100
Message-Id: <b57eb28b5573354f644d313780e66ce647705b0d.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 08/17] Add a global ResetDomain object for
 system emulation
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1mqBHz1DCaqn

All objects contained in this ResetDomain are cold-reset when calling
qemu_devices_reset.
Also add 2 functions to register/unregister object in this ResetDomain.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/reset.c        | 56 +++++++++++++++++++++++++++++++++++++++++-
 include/sysemu/reset.h | 47 +++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/hw/core/reset.c b/hw/core/reset.c
index 9c477f2bf5..d013c9feb9 100644
--- a/hw/core/reset.c
+++ b/hw/core/reset.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2003-2008 Fabrice Bellard
  * Copyright (c) 2016 Red Hat, Inc.
+ * Copyright (c) 2019 GreenSocs
  *
  * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
  * of this software and associated documentation files (the "Software"),=
 to deal
@@ -26,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "qemu/queue.h"
 #include "sysemu/reset.h"
+#include "hw/reset-domain.h"
=20
 /* reset/shutdown handler */
=20
@@ -38,6 +40,49 @@ typedef struct QEMUResetEntry {
 static QTAILQ_HEAD(, QEMUResetEntry) reset_handlers =3D
     QTAILQ_HEAD_INITIALIZER(reset_handlers);
=20
+/* global/system reset domain */
+static ResetDomain *reset_domain;
+
+static ResetDomain *get_reset_domain(void)
+{
+    if (reset_domain =3D=3D NULL) {
+        /*
+         * the ref to the object will be deleted by
+         * qemu_delete_system_reset_domain function below.
+         */
+        reset_domain =3D RESET_DOMAIN(object_new(TYPE_RESET_DOMAIN));
+    }
+    return reset_domain;
+}
+
+ResetDomain *qemu_get_system_reset_domain(void)
+{
+    return get_reset_domain();
+}
+
+void qemu_delete_system_reset_domain(void)
+{
+    /* unref the reset_domain object if it exists */
+    if (reset_domain !=3D NULL) {
+        object_unref(OBJECT(reset_domain));
+        reset_domain =3D NULL;
+    }
+}
+
+void qemu_register_system_reset_domain_object(Object *obj)
+{
+    ResetDomain *domain =3D get_reset_domain();
+
+    reset_domain_register_object(domain, obj);
+}
+
+void qemu_unregister_system_reset_domain_object(Object *obj)
+{
+    ResetDomain *domain =3D get_reset_domain();
+
+    reset_domain_unregister_object(domain, obj);
+}
+
 void qemu_register_reset(QEMUResetHandler *func, void *opaque)
 {
     QEMUResetEntry *re =3D g_malloc0(sizeof(QEMUResetEntry));
@@ -62,11 +107,20 @@ void qemu_unregister_reset(QEMUResetHandler *func, v=
oid *opaque)
=20
 void qemu_devices_reset(void)
 {
+    qemu_system_reset_domain_reset(true);
+}
+
+void qemu_system_reset_domain_reset(bool cold)
+{
+    ResetDomain *domain =3D get_reset_domain();
     QEMUResetEntry *re, *nre;
=20
-    /* reset all devices */
+    /* call function handlers first */
     QTAILQ_FOREACH_SAFE(re, &reset_handlers, entry, nre) {
         re->func(re->opaque);
     }
+
+    /* then handle the objects in the ResetDomain */
+    resettable_reset(OBJECT(domain), cold);
 }
=20
diff --git a/include/sysemu/reset.h b/include/sysemu/reset.h
index 0b0d6d7598..29843eca92 100644
--- a/include/sysemu/reset.h
+++ b/include/sysemu/reset.h
@@ -1,10 +1,57 @@
 #ifndef QEMU_SYSEMU_RESET_H
 #define QEMU_SYSEMU_RESET_H
=20
+#include "qom/object.h"
+#include "hw/reset-domain.h"
+
+/**
+ * qemu_get_system_reset_domain:
+ * Get the global system reset domain object
+ */
+ResetDomain *qemu_get_system_reset_domain(void);
+
+/**
+ * qemu_delete_system_reset_domain:
+ * Delete the global system reset domain object
+ */
+void qemu_delete_system_reset_domain(void);
+
+/**
+ * qemu_register_system_reset_domain_object:
+ * Register @obj in the system reset domain
+ */
+void qemu_register_system_reset_domain_object(Object *obj);
+
+/**
+ * qemu_unregister_system_reset_domain_object:
+ * Unregister @obj from the global reset domain
+ */
+void qemu_unregister_system_reset_domain_object(Object *obj);
+
+/**
+ * @qemu_system_reset_domain_reset:
+ * Do a cold or warm system reset based on @cold
+ */
+void qemu_system_reset_domain_reset(bool cold);
+
 typedef void QEMUResetHandler(void *opaque);
=20
+/**
+ * qemu_resgiter_reset:
+ * Register @func with @opaque in the global reset procedure.
+ */
 void qemu_register_reset(QEMUResetHandler *func, void *opaque);
+
+/**
+ * qemu_unregister_reset:
+ * Unregister @func with @opaque from the global reset procedure.
+ */
 void qemu_unregister_reset(QEMUResetHandler *func, void *opaque);
+
+/**
+ * qemu_devices_reset:
+ * Trigger a reset of registered handlers and objects.
+ */
 void qemu_devices_reset(void);
=20
 #endif
--=20
2.21.0

