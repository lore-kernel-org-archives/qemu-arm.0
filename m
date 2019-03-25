Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711822wrx;
        Mon, 25 Mar 2019 04:03:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztlVZsAKzTmg43Gu7iW6/e1GDbtaIdmnyyVxSJSVhg1QkXwVlYSQSW4K2MGONjnL0V0XQF
X-Received: by 2002:a25:10c5:: with SMTP id 188mr5351404ybq.304.1553511801481;
        Mon, 25 Mar 2019 04:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511801; cv=none;
        d=google.com; s=arc-20160816;
        b=xOIuoU9D0907UJNDgRg8YphE7tsPYm/FTLZ1rnCPtFCG0irGrStjJNBl4DBYciFQsr
         AalFs+zym3jBHc/d5oISNBDAWt/taQqHU2/UgVEBixXu7JJXrgHBB5lvQkNOyyONXzDd
         JlYWKSTKzBY16zeua1iPpmaPbVYWhqM3Zjyso76HLyqRtkrIVNJm9IEQsHcad/82/SPE
         tPa57IcMkIeYGZefoaE45msmPyDLJY5StNak3IjAbSCYu+J8DUMuuPIIw40kbzq3PKvO
         sfryinFQDbnGoHPVaew5DFPXEZU7qwo6XM1JWDIWLVUmQ2JtefpUbPG3AFC8YVJ767HQ
         Rn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=G9u+9Afh4GDzfzIDgzCeuUJJxhFhlicGiYkrnZrbBf4=;
        b=EWa+khzsuuWWR/d+2fbm/5u2S686mPQkvmQVB2ECRbChXYGQJ4OVvYwLk5IfHFd8ZP
         k4zWcEWzlZ5KwH/oF+h7gCuq5fncNyEM8Q3ovqawe/gWlSrfFBFtz1ix5Y9MTEOVVkc+
         hHWc6AmR0vdn7fqVhr+Uoc39Hr6CUaYNzIxAi5kttt2pSLsh/GLkjGJsjqfD8t1NYxIi
         6ck4PQE/Uwpoc9HRuGf/CmBZJ/3NKeHkWH7GYo1UXyurW19jUnGIJv8ORAT22u7hZd/B
         3z5/umuZBUATzgKpsmkfuKUEXACtkBYG2PRutIoBAoKLIvM6KaOKwUi5CSeQTY8E1jK8
         +lCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=W15xGIGX;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LaTHN+u5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LaTHN+u5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j186si8970433ywa.432.2019.03.25.04.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=W15xGIGX;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LaTHN+u5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LaTHN+u5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNx-0005S0-0A
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNB-00056u-7o
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-0007pN-9w
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:33 -0400
Received: from greensocs.com ([193.104.36.180]:38356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN8-0007oU-Ov; Mon, 25 Mar 2019 07:02:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E0C597D78AA;
	Mon, 25 Mar 2019 12:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511748;
	bh=Rj9t1gwEPvCQXgaespa0NYSplGJUEexyiDC/4aJcJ80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W15xGIGXx3R5Grz8Gqpb+yNEKDmKc5otio0GT0Ucp6oAsSth0ZLsWNj/+VHajmeyR
	nZqOpLyQDqmAuPruEA4xrmmya/pzOwcnA4zigx2nY+va16Jpt1uZ82pI4KDste/2Q2
	nB+jXJwxDNtTusFuoYA2unDA0DcnPP/M6Jl1/RfE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LaTHN+u5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LaTHN+u5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mvtDrcgxWGg; Mon, 25 Mar 2019 12:02:28 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id D86B47D7887; Mon, 25 Mar 2019 12:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511746;
	bh=Rj9t1gwEPvCQXgaespa0NYSplGJUEexyiDC/4aJcJ80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LaTHN+u54Lo0ZaOByfK49EXd93FHs0TeHuuq7ZgEEfBYnvJdsZTw6GOAiNWSmWyhp
	Gmds46e9A7bNhg1jSIg5dps7DwyiWqZUWlTpeUPHTLg95ty1nSKnpN/hKze5wLI963
	E1EsIqBk5ic5g7uVEuIax/in3FbV/DnDo3BhzeOE=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0A2167D78A5;
	Mon, 25 Mar 2019 12:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511746;
	bh=Rj9t1gwEPvCQXgaespa0NYSplGJUEexyiDC/4aJcJ80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LaTHN+u54Lo0ZaOByfK49EXd93FHs0TeHuuq7ZgEEfBYnvJdsZTw6GOAiNWSmWyhp
	Gmds46e9A7bNhg1jSIg5dps7DwyiWqZUWlTpeUPHTLg95ty1nSKnpN/hKze5wLI963
	E1EsIqBk5ic5g7uVEuIax/in3FbV/DnDo3BhzeOE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:52 +0100
Message-Id: <1229faf2e82151a54b915d167f2071af36aceb5f.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 09/17] global ResetDomain support for legacy
 reset handlers
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
X-TUID: mm9hpMvU/ip3

INIT phase of the global ResetDomain now triggers the legacy reset
handlers.
*qemu_devices_reset* is now equivalent to do a cold reset of the global
ResetDomain.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/reset.c | 109 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 95 insertions(+), 14 deletions(-)

diff --git a/hw/core/reset.c b/hw/core/reset.c
index d013c9feb9..1b25f9c8f8 100644
--- a/hw/core/reset.c
+++ b/hw/core/reset.c
@@ -26,9 +26,31 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/queue.h"
+#include "qemu/module.h"
 #include "sysemu/reset.h"
 #include "hw/reset-domain.h"
=20
+#define TYPE_SYSTEM_RESET_DOMAIN "system-reset-domain"
+#define SYSTEM_RESET_DOMAIN(obj) \
+    OBJECT_CHECK(SystemResetDomain, (obj), TYPE_SYSTEM_RESET_DOMAIN)
+#define SYSTEM_RESET_DOMAIN_CLASS(class) \
+    OBJECT_CLASS_CHECK(SystemResetDomainClass, (class), \
+                       TYPE_SYSTEM_RESET_DOMAIN)
+#define SYSTEM_RESET_DOMAIN_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SystemResetDomainClass, (obj), \
+                     TYPE_SYSTEM_RESET_DOMAIN)
+
+/**
+ * SystemResetDomainClass:
+ * Class to hold the global reset domain and handlers
+ * @parent_init_phase hold parent init_phase method
+ */
+typedef struct SystemResetDomainClass {
+    ResetDomainClass parent_class;
+
+    ResettableInitPhase parent_init_phase;
+} SystemResetDomainClass;
+
 /* reset/shutdown handler */
=20
 typedef struct QEMUResetEntry {
@@ -37,27 +59,35 @@ typedef struct QEMUResetEntry {
     void *opaque;
 } QEMUResetEntry;
=20
-static QTAILQ_HEAD(, QEMUResetEntry) reset_handlers =3D
-    QTAILQ_HEAD_INITIALIZER(reset_handlers);
+/**
+ * SystemResetDomain:
+ * @reset_handlers list of legacy reset handlers
+ */
+typedef struct SystemResetDomain {
+    ResetDomain parent_obj;
+
+    QTAILQ_HEAD(, QEMUResetEntry) reset_handlers;
+} SystemResetDomain;
=20
 /* global/system reset domain */
-static ResetDomain *reset_domain;
+static SystemResetDomain *reset_domain;
=20
-static ResetDomain *get_reset_domain(void)
+static SystemResetDomain *get_reset_domain(void)
 {
     if (reset_domain =3D=3D NULL) {
+        Object *obj =3D object_new(TYPE_SYSTEM_RESET_DOMAIN);
         /*
          * the ref to the object will be deleted by
          * qemu_delete_system_reset_domain function below.
          */
-        reset_domain =3D RESET_DOMAIN(object_new(TYPE_RESET_DOMAIN));
+        reset_domain =3D SYSTEM_RESET_DOMAIN(obj);
     }
     return reset_domain;
 }
=20
 ResetDomain *qemu_get_system_reset_domain(void)
 {
-    return get_reset_domain();
+    return RESET_DOMAIN(get_reset_domain());
 }
=20
 void qemu_delete_system_reset_domain(void)
@@ -71,34 +101,36 @@ void qemu_delete_system_reset_domain(void)
=20
 void qemu_register_system_reset_domain_object(Object *obj)
 {
-    ResetDomain *domain =3D get_reset_domain();
+    ResetDomain *domain =3D RESET_DOMAIN(get_reset_domain());
=20
     reset_domain_register_object(domain, obj);
 }
=20
 void qemu_unregister_system_reset_domain_object(Object *obj)
 {
-    ResetDomain *domain =3D get_reset_domain();
+    ResetDomain *domain =3D RESET_DOMAIN(get_reset_domain());
=20
     reset_domain_unregister_object(domain, obj);
 }
=20
 void qemu_register_reset(QEMUResetHandler *func, void *opaque)
 {
+    SystemResetDomain *domain =3D get_reset_domain();
     QEMUResetEntry *re =3D g_malloc0(sizeof(QEMUResetEntry));
=20
     re->func =3D func;
     re->opaque =3D opaque;
-    QTAILQ_INSERT_TAIL(&reset_handlers, re, entry);
+    QTAILQ_INSERT_TAIL(&domain->reset_handlers, re, entry);
 }
=20
 void qemu_unregister_reset(QEMUResetHandler *func, void *opaque)
 {
+    SystemResetDomain *domain =3D get_reset_domain();
     QEMUResetEntry *re;
=20
-    QTAILQ_FOREACH(re, &reset_handlers, entry) {
+    QTAILQ_FOREACH(re, &domain->reset_handlers, entry) {
         if (re->func =3D=3D func && re->opaque =3D=3D opaque) {
-            QTAILQ_REMOVE(&reset_handlers, re, entry);
+            QTAILQ_REMOVE(&domain->reset_handlers, re, entry);
             g_free(re);
             return;
         }
@@ -112,15 +144,64 @@ void qemu_devices_reset(void)
=20
 void qemu_system_reset_domain_reset(bool cold)
 {
-    ResetDomain *domain =3D get_reset_domain();
+    resettable_reset(OBJECT(get_reset_domain()), cold);
+}
+
+static void system_reset_domain_init_phase(Object *obj, bool cold)
+{
+    SystemResetDomain *domain =3D SYSTEM_RESET_DOMAIN(obj);
+    SystemResetDomainClass *srdc =3D SYSTEM_RESET_DOMAIN_GET_CLASS(obj);
     QEMUResetEntry *re, *nre;
=20
     /* call function handlers first */
-    QTAILQ_FOREACH_SAFE(re, &reset_handlers, entry, nre) {
+    QTAILQ_FOREACH_SAFE(re, &domain->reset_handlers, entry, nre) {
         re->func(re->opaque);
     }
=20
     /* then handle the objects in the ResetDomain */
-    resettable_reset(OBJECT(domain), cold);
+    srdc->parent_init_phase(OBJECT(domain), cold);
+}
+
+static void system_reset_domain_init(Object *obj)
+{
+    SystemResetDomain *domain =3D SYSTEM_RESET_DOMAIN(obj);
+
+    QTAILQ_INIT(&domain->reset_handlers);
+}
+
+static void system_reset_domain_finalize(Object *obj)
+{
+    SystemResetDomain *domain =3D SYSTEM_RESET_DOMAIN(obj);
+    QEMUResetEntry *re, *nre;
+
+    QTAILQ_FOREACH_SAFE(re, &domain->reset_handlers, entry, nre) {
+        QTAILQ_REMOVE(&domain->reset_handlers, re, entry);
+        g_free(re);
+    }
+}
+
+static void system_reset_domain_class_init(ObjectClass *class, void *dat=
a)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(class);
+    SystemResetDomainClass *srdc =3D SYSTEM_RESET_DOMAIN_CLASS(class);
+
+    srdc->parent_init_phase =3D rc->phases.init;
+    rc->phases.init =3D system_reset_domain_init_phase;
+}
+
+static const TypeInfo system_reset_domain_type_info =3D {
+    .name =3D TYPE_SYSTEM_RESET_DOMAIN,
+    .parent =3D TYPE_RESET_DOMAIN,
+    .instance_size =3D sizeof(SystemResetDomain),
+    .instance_init =3D system_reset_domain_init,
+    .instance_finalize =3D system_reset_domain_finalize,
+    .class_init =3D system_reset_domain_class_init,
+    .class_size =3D sizeof(SystemResetDomainClass),
+};
+
+static void system_reset_register_types(void)
+{
+    type_register_static(&system_reset_domain_type_info);
 }
=20
+type_init(system_reset_register_types)
--=20
2.21.0

