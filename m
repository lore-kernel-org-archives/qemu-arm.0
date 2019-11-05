Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp454338wri;
        Tue, 5 Nov 2019 01:13:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbt5JhzkoEPlmlQqfhZEeXYf2XnPgD/vLkXE8se4vhy7Igh0sbwfah+czXyoUrPBbesRql
X-Received: by 2002:ac8:6757:: with SMTP id n23mr16557599qtp.345.1572945210935;
        Tue, 05 Nov 2019 01:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945210; cv=none;
        d=google.com; s=arc-20160816;
        b=o4ZYW+RuM//YVrvWJ36swhstpc2Wp7LZbdVPa6bnQg9s2qy0Y82ZbEKPEnlRaWHR5b
         I8XVtMvtlgIrLrieDCPIrSUREwSkyqmLf0i0M1Mq96imVJEdpcA06xqQ2HfVceN2zfoF
         IKrUVfOheEDc/9yAiB1nIiZ7QU2QkiT22GwBi/5aB60riq8EPQFL8p9A+O7eU2AbKQdf
         f1dV2u+AE7x+MdAO26nJ9VSSjDS8iYeYye/Q2ALs/QyRdvw+sxyzlVa7ye+/JmgfGDtd
         vzvIZnVE8nRCK8Ba3ypUsj54V/5lU4b5kWJ8xNH+jYqCNjipUhPKMIXEgr5EGnUkPyyt
         1gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=SjoE/EMlYSagZk96zKDXRypA5wqOc+x9KghfWfGsXlI=;
        b=zQFM4bpGUp3GnZjmbGYYDnv5zhclMyzFF4AFqFAyt7ddr/quegrxJCtVl4jIplvBBb
         GRzOzsQTk1SRE/RdgwpHwDL7KQzkX84ZCiV9Cbb5Zmhtp4tC+d0pcdUTJEG1EYj0v5lD
         75f798fn41JcrwQ5arQUio8o9sxclxdCP/4Czs3vQfF0jbVa74qAO88F72zCs4j/gML5
         JuIHLAvZ7cswNOYUqVYJzYuekNZQKDhn/jqRvQGXUmNC52Hn5OouhyXizkYTyrZPJEa6
         BCfNvovbp7Q+SOozkPbhCzrWJBfgvDaM5nLyMB+Co2awSGj0WGxu7NzMVab3NkYYGyWQ
         F1mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a53si14493529qtb.258.2019.11.05.01.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRuu1-0006I2-SS
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusw-00051p-Pz
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007lK-DU
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:22 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:52082 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007j4-1U; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2C00798C75144E635ABB;
 Tue,  5 Nov 2019 17:12:18 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:08 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 10/14] arm/sdei: add support to register interrupt bind
 notifier
Date: Tue, 5 Nov 2019 17:10:52 +0800
Message-ID: <20191105091056.9541-11-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 James Morse <james.morse@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hjIvMJhnnqR5

Other qemu modules related with the interrupt bind operation may want
to be notified when guest requests to bind interrupt to sdei event, so
we add register and unregister interfaces.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sdei.h | 17 +++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index 529a06c1f6..4cc68e4acf 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -48,6 +48,52 @@
=20
 static QemuSDEState *sde_state;
=20
+typedef struct QemuSDEIBindNotifyEntry {
+    QTAILQ_ENTRY(QemuSDEIBindNotifyEntry) entry;
+    QemuSDEIBindNotify *func;
+    void *opaque;
+    int irq;
+} QemuSDEIBindNotifyEntry;
+
+static QTAILQ_HEAD(, QemuSDEIBindNotifyEntry) bind_notifiers =3D
+    QTAILQ_HEAD_INITIALIZER(bind_notifiers);
+
+void qemu_register_sdei_bind_notifier(QemuSDEIBindNotify *func,
+                                      void *opaque, int irq)
+{
+    QemuSDEIBindNotifyEntry *be =3D g_new0(QemuSDEIBindNotifyEntry, 1);
+
+    be->func =3D func;
+    be->opaque =3D opaque;
+    be->irq =3D irq;
+    QTAILQ_INSERT_TAIL(&bind_notifiers, be, entry);
+}
+
+void qemu_unregister_sdei_bind_notifier(QemuSDEIBindNotify *func,
+                                        void *opaque, int irq)
+{
+    QemuSDEIBindNotifyEntry *be;
+
+    QTAILQ_FOREACH(be, &bind_notifiers, entry) {
+        if (be->func =3D=3D func && be->opaque =3D=3D opaque && be->irq =
=3D=3D irq) {
+            QTAILQ_REMOVE(&bind_notifiers, be, entry);
+            g_free(be);
+            return;
+        }
+    }
+}
+
+static void sdei_notify_bind(int irq, int32_t event, bool bind)
+{
+    QemuSDEIBindNotifyEntry *be, *nbe;
+
+    QTAILQ_FOREACH_SAFE(be, &bind_notifiers, entry, nbe) {
+        if (be->irq =3D=3D irq) {
+            be->func(be->opaque, irq, event, bind);
+        }
+    }
+}
+
 static void qemu_sde_prop_init(QemuSDEState *s)
 {
     QemuSDEProp *sde_props =3D s->sde_props_state;
@@ -529,6 +575,7 @@ static int32_t sdei_alloc_event_num(QemuSDEState *s, =
bool is_critical,
             sde_props[index].interrupt =3D intid;
             sde_props[index].is_shared =3D is_shared;
             sde_props[index].is_critical =3D is_critical;
+            sdei_notify_bind(intid, event, true);
             override_qemu_irq(s, event, intid);
             s->irq_map[intid] =3D event;
             qemu_mutex_unlock(&sde_props[index].lock);
@@ -547,6 +594,7 @@ static int32_t sdei_free_event_num_locked(QemuSDEStat=
e *s, QemuSDEProp *prop)
         return SDEI_DENIED;
     }
=20
+    sdei_notify_bind(prop->interrupt, prop->event_id, false);
     restore_qemu_irq(s, prop->event_id, prop->interrupt);
     s->irq_map[prop->interrupt] =3D SDEI_INVALID_EVENT_ID;
     prop->event_id =3D SDEI_INVALID_EVENT_ID;
diff --git a/target/arm/sdei.h b/target/arm/sdei.h
index 5ecc32d667..9c15cf3186 100644
--- a/target/arm/sdei.h
+++ b/target/arm/sdei.h
@@ -38,4 +38,21 @@ void sdei_handle_request(CPUState *cs, struct kvm_run =
*run);
  */
 bool trigger_sdei_by_irq(int cpu, int irq);
=20
+/*
+ * Notify callback prototype; the argument "bind" tells whether it is a =
bind
+ * operation or unbind one.
+ */
+typedef void QemuSDEIBindNotify(void *opaque, int irq,
+                                int32_t event, bool bind);
+/*
+ * Register a notify callback for a specific interrupt bind operation; t=
he
+ * client will be both notified by bind and unbind operation.
+ */
+void qemu_register_sdei_bind_notifier(QemuSDEIBindNotify *func,
+                                      void *opaque, int irq);
+/*
+ * Unregister a notify callback for a specific interrupt bind operation.
+ */
+void qemu_unregister_sdei_bind_notifier(QemuSDEIBindNotify *func,
+                                        void *opaque, int irq);
 #endif
--=20
2.19.1

