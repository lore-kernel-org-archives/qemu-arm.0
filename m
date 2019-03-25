Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711228wrx;
        Mon, 25 Mar 2019 04:02:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6c2fmxuMv0DwCpaK2FLeBMvrTclluJtwdffPOrNh97gQu23WucRxkSLrkvXsddafpXpBC
X-Received: by 2002:a25:d3c3:: with SMTP id e186mr19125623ybf.493.1553511772839;
        Mon, 25 Mar 2019 04:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511772; cv=none;
        d=google.com; s=arc-20160816;
        b=FVIDha3lG+hQq/+HqCoJjj7HT8+EB8UnNfgG5qLx54Spu26g07Dm5mJGWJtQYOckzk
         1kR9B6GLGZHFBa2c7erToc65EJIoZ3Am5RHVYqnaUiWpeOkghQsYonOXlGWSwVDPVWKF
         EnHWUWFrL7YcS6LBKq2W3saIElM3MZ2UV+X7ZFs9HtBtPjyH/u69isWGOoAYTjr0DZZK
         PqjwKSWl01hraChBpLOAMloxdy1AgYlfD/KXiqzRtM+KlxtGEKT51C0mQnAWCv6BP6SL
         INRUPAABTEaZ2w5FatydR6de452tawp6dXdvP+1rXO1Ul0ta54bIi0KMVN753jaC7Ebj
         rM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=u+3hNPCLda0UyQLHCWI204OoHeYfrp4M3Nw5g2TEBWk=;
        b=Z+yrOyoTvfrdaTpPUAccPpoT+1H91AwCvGkMPsn/BjXqcJa+0ovws7lhocWhhk64jT
         LceUCzDCuipOM+7GmQ0LnFfOe5iV0M/wpfzxoFDessVf+LYHXayzU5EXicRTDkFBjp5Y
         A785kGhuLYM3cxlz/NK0Ix5prSTf4L6tXORmHcmO4eRiZ3Ai5T5DoPEbqfI2XRfF6ZAK
         y4EeXKwxS9bVaxN1yDOyhJml+WLzUzyex698VHFMKEOt94GlaBvaoxrD+ss1eZk2zxEh
         VCLvre7dUf5oN2gnjDLmEhDyyXaKU4M02mdje3yZvzYX15c2mE7vNpg1URV14lPZu15r
         By2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DuvN68Z0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=agz82TQJ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=agz82TQJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si9312328ywd.144.2019.03.25.04.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DuvN68Z0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=agz82TQJ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=agz82TQJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNU-00057F-A1
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:02:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-00056l-TB
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN8-0007o4-8o
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:31 -0400
Received: from greensocs.com ([193.104.36.180]:38251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN7-0007kz-Jw; Mon, 25 Mar 2019 07:02:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5A6F47D78B3;
	Mon, 25 Mar 2019 12:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511743;
	bh=cBDNrVqzCnOtTlIzkEFIk84dWfLcrkL6ZiPFit50ywU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DuvN68Z0OY3tL9kAAMfiBo2WiFvMxtVYKDyIcQH3TREqDZ9XQs4FsEgGJen0/p57q
	EQ0GEKYLt+r9wR3LhD7d38g7bRvaHmmKHgaMvbOFfTdRHkOEKCWUaOQAddzzSYuPbM
	Qj0ImtB9cd+m4RDKUsTaBkhPw+4r3W/RmW2Kwxg8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=agz82TQJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=agz82TQJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6NtFbmKbgHQ; Mon, 25 Mar 2019 12:02:22 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 612377D788E; Mon, 25 Mar 2019 12:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511741;
	bh=cBDNrVqzCnOtTlIzkEFIk84dWfLcrkL6ZiPFit50ywU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=agz82TQJJzW0VqXNBnQTRbch5BntogXBurtTTH79j9LxOHny78kCqT8ptyla47RoX
	k8USRz3XisL3w4dDaW0gATWUWRB/IT4bR/PkQRkCYZw1fztMwm0b0o+4rnNIaJoI1z
	k2SGamHA4cWagVwK/2uCSEx0W9Tdcf3RpBYnd9DI=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E63377D7887;
	Mon, 25 Mar 2019 12:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511741;
	bh=cBDNrVqzCnOtTlIzkEFIk84dWfLcrkL6ZiPFit50ywU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=agz82TQJJzW0VqXNBnQTRbch5BntogXBurtTTH79j9LxOHny78kCqT8ptyla47RoX
	k8USRz3XisL3w4dDaW0gATWUWRB/IT4bR/PkQRkCYZw1fztMwm0b0o+4rnNIaJoI1z
	k2SGamHA4cWagVwK/2uCSEx0W9Tdcf3RpBYnd9DI=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:45 +0100
Message-Id: <60e1f016cfd490b733aa649bbdc8723cdd1fd6b1.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 02/17] Create the ResetDomain QOM object
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
X-TUID: QEdEI4XMwqj9

ResetDomain is an object implementing the Resettable interface.
It is a container of several other Resettable and therefore allows to con=
trol
reset operation over a group of Resettable.

Addition and removal in a ResetDomain is done using the functions
*reset_domain_register_object* and *reset_domain_unregister_object*

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/Makefile.objs     |   1 +
 hw/core/reset-domain.c    | 121 ++++++++++++++++++++++++++++++++++++++
 include/hw/reset-domain.h |  49 +++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 hw/core/reset-domain.c
 create mode 100644 include/hw/reset-domain.h

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 97007454a8..320f71707c 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -2,6 +2,7 @@
 common-obj-y +=3D qdev.o qdev-properties.o
 common-obj-y +=3D bus.o reset.o
 common-obj-y +=3D resettable.o
+common-obj-y +=3D reset-domain.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
 # irq.o needed for qdev GPIO handling:
diff --git a/hw/core/reset-domain.c b/hw/core/reset-domain.c
new file mode 100644
index 0000000000..b701eb5bdd
--- /dev/null
+++ b/hw/core/reset-domain.c
@@ -0,0 +1,121 @@
+/*
+ * Reset Domain object.
+ *
+ * Copyright (c) 2019 GreenSocs
+ *
+ * Authors:
+ *   Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "hw/reset-domain.h"
+
+void reset_domain_register_object(ResetDomain *domain, Object *obj)
+{
+    struct ResetDomainEntry *rde;
+
+    INTERFACE_CHECK(ResettableClass, obj, TYPE_RESETTABLE);
+
+    rde =3D g_malloc0(sizeof(*rde));
+    rde->obj =3D obj;
+    object_ref(obj);
+    QLIST_INSERT_HEAD(&domain->members, rde, node);
+}
+
+void reset_domain_unregister_object(ResetDomain *domain, Object *obj)
+{
+    struct ResetDomainEntry *rde;
+
+    INTERFACE_CHECK(ResettableClass, obj, TYPE_RESETTABLE);
+
+    QLIST_FOREACH(rde, &domain->members, node) {
+        if (rde->obj =3D=3D obj) {
+            QLIST_REMOVE(rde, node);
+            object_unref(rde->obj);
+            g_free(rde);
+            return;
+        }
+    }
+}
+
+static void reset_domain_init_phase(Object *obj, bool cold)
+{
+    struct ResetDomainEntry *rde;
+    ResetDomain *domain =3D RESET_DOMAIN(obj);
+
+    QLIST_FOREACH(rde, &domain->members, node) {
+        resettable_init_phase(rde->obj, cold);
+    }
+}
+
+static void reset_domain_hold_phase(Object *obj)
+{
+    struct ResetDomainEntry *rde;
+    ResetDomain *domain =3D RESET_DOMAIN(obj);
+
+    QLIST_FOREACH(rde, &domain->members, node) {
+        resettable_hold_phase(rde->obj);
+    }
+}
+
+static void reset_domain_exit_phase(Object *obj)
+{
+    struct ResetDomainEntry *rde;
+    ResetDomain *domain =3D RESET_DOMAIN(obj);
+
+    QLIST_FOREACH(rde, &domain->members, node) {
+        resettable_exit_phase(rde->obj);
+    }
+}
+
+static void reset_domain_init(Object *obj)
+{
+    ResetDomain *domain =3D RESET_DOMAIN(obj);
+
+    QLIST_INIT(&domain->members);
+}
+
+static void reset_domain_finalize(Object *obj)
+{
+    ResetDomain *domain =3D RESET_DOMAIN(obj);
+    struct ResetDomainEntry *rde, *nrde;
+
+    QLIST_FOREACH_SAFE(rde, &domain->members, node, nrde) {
+        QLIST_REMOVE(rde, node);
+        object_unref(rde->obj);
+        g_free(rde);
+    }
+}
+
+static void reset_domain_class_init(ObjectClass *class, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(class);
+
+    rc->phases.init =3D reset_domain_init_phase;
+    rc->phases.hold =3D reset_domain_hold_phase;
+    rc->phases.exit =3D reset_domain_exit_phase;
+}
+
+static const TypeInfo reset_domain_type_info =3D {
+    .name =3D TYPE_RESET_DOMAIN,
+    .parent =3D TYPE_OBJECT,
+    .instance_size =3D sizeof(ResetDomain),
+    .instance_init =3D reset_domain_init,
+    .instance_finalize =3D reset_domain_finalize,
+    .class_init =3D reset_domain_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_RESETTABLE },
+        { }
+    },
+};
+
+static void reset_register_types(void)
+{
+    type_register_static(&reset_domain_type_info);
+}
+
+type_init(reset_register_types)
diff --git a/include/hw/reset-domain.h b/include/hw/reset-domain.h
new file mode 100644
index 0000000000..03b3a981de
--- /dev/null
+++ b/include/hw/reset-domain.h
@@ -0,0 +1,49 @@
+#ifndef HW_RESET_DOMAIN_H
+#define HW_RESET_DOMAIN_H
+
+#include "resettable.h"
+#include "qemu/queue.h"
+
+#define TYPE_RESET_DOMAIN "reset-domain"
+
+#define RESET_DOMAIN(obj) OBJECT_CHECK(ResetDomain, (obj), TYPE_RESET_DO=
MAIN)
+
+/**
+ * ResetDomainClass:
+ * A ResetDomain holds several Resettable objects and implement the Rese=
ttable
+ * interface too.
+ * Doing a reset on it will also reset all objects it contained. Phases =
of
+ * every object will be executed in order: init_reset of all objects fir=
st, etc.
+ */
+typedef ObjectClass ResetDomainClass;
+
+/**
+ * ResetDomain:
+ * @members is a list of ResetDomainEntry. Every entry hold a pointer to=
 a
+ * Resettable object.
+ * To avoid object to disapear while in the ResetDomain, the ResetDomain
+ * increases the refcount.
+ */
+struct ResetDomainEntry {
+    Object *obj;
+    QLIST_ENTRY(ResetDomainEntry) node;
+};
+typedef struct ResetDomain {
+    Object parent_obj;
+
+    QLIST_HEAD(, ResetDomainEntry) members;
+} ResetDomain;
+
+/**
+ * reset_domain_register_objet:
+ * Register the Resettable object @obj into a ResetDomain @domain.
+ */
+void reset_domain_register_object(ResetDomain *domain, Object *obj);
+
+/**
+ * reset_domain_unregister_objet:
+ * Unregister the Resettable object @obj into a ResetDomain @domain.
+ */
+void reset_domain_unregister_object(ResetDomain *domain, Object *obj);
+
+#endif
--=20
2.21.0

