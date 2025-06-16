Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741142njc;
        Mon, 16 Jun 2025 02:50:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6WcfAyBvn7BTWZlNrVNvDvX2cScKZend09hwl5PPV5P3ym68wWSAeMai4QBhTpEYVU0IcIH4WPAVDPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNtCTq8QKsrWaaeFpTcOddnnMk948QuXU5LPKnBlpWc6kEC+wkLiXN8b5h54u1CckQJEdN
X-Received: by 2002:a05:620a:460e:b0:7ce:e010:88b9 with SMTP id af79cd13be357-7d3c6c1810emr1492785585a.13.1750067428957;
        Mon, 16 Jun 2025 02:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067428; cv=none;
        d=google.com; s=arc-20240605;
        b=XBl8Es1twqz3VynXYxdTY9DxKqC4aEHqZ4xhBi2uzDB5+p/qg8uy4y1fub8gOP3MS6
         vxdgsy2SyOW+54thDNeM9OWDa6PnJ+dTjviDEsdd7tOPgHwQg9fQmk8v3BCEJTptkPqk
         rj+9/TjhF1xovKC7o6PbvSbjZ31tx97c+tvKKhd4E/opQMTmsBVhezMAL8kPuR1CML53
         t1f+4Ilf3SyWU/QEOhAHdXlokCiF37AUic6zBVr7GDG7C0aKhNQobEnXe9lmP+GP1Nnn
         4pNXqXTW0QoqYEKGA7dvfErY3+X8ThCUSBwccyEM3r9PpKV6XqLbD02fSVb6CmPbHCjV
         gcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tLE4q1mfr/9ieLq5n0slV4E5BeVue7NjrO+KIKIEe6A=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=GEWjLsMVNcybDhZ6DRmM+DGYESiiPzz/Va0DoisrYaY7RObUOTDiuI+tQ8TNLBfN3N
         Hr8kHmA/x1Tn0ppWS+lq1jSMbtqW8tVlhx/l9mYiOWPOA/6bn++wHz5JbqaNXT2sFpPZ
         T9wDANS1cRAriFlVY4OP8caomo17qmpY1UU4Xs+botL8E9gJan59KYjQN99sRznpffyw
         bMudcTDyT5+W3RhEcpXlmu6WTmJe7479BYx4I/CGFEfinoxyZvXaZjCy2N79X2kYXvB3
         OHGx4eGdNKuYVEgsKhFhfZl7cBzEg/L6AItO9D0Mq+WPkbnwA05dDiul1TX6Pyx1K2B+
         Zrcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eGJRz8j0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f3f65fsi919587685a.580.2025.06.16.02.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eGJRz8j0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLE4q1mfr/9ieLq5n0slV4E5BeVue7NjrO+KIKIEe6A=;
	b=eGJRz8j0UoCj283YoznfZ8REiOsYM/zfsA1+NoEgc1aAxAU/aP9UeUmDPHeAPdtZnaFrob
	h3ExJLgl87AjteM8Xqk6ffjAzYk+SNc6XIKrUPmxrP7xeg4I75t67f5zxgqpcXdUx/q3m9
	4ysUnefAglKnIIYRlj1Kf2OROU8OizI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-jQ6aOY3_Pm6dTDtglLJVFA-1; Mon,
 16 Jun 2025 05:50:25 -0400
X-MC-Unique: jQ6aOY3_Pm6dTDtglLJVFA-1
X-Mimecast-MFC-AGG-ID: jQ6aOY3_Pm6dTDtglLJVFA_1750067423
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A40571800284;
	Mon, 16 Jun 2025 09:50:23 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4BB2719560A7;
	Mon, 16 Jun 2025 09:50:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 13/29] hw/i386/acpi-build: Move build_append_notification_callback to pcihp
Date: Mon, 16 Jun 2025 11:46:42 +0200
Message-ID: <20250616094903.885753-14-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: wYedkeOkRR6J

We plan to reuse build_append_notification_callback() on ARM
so let's move it to pcihp.c.

No functional change intended.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 include/hw/acpi/pcihp.h |  1 +
 hw/acpi/pcihp.c         | 58 +++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c    | 58 -----------------------------------------
 3 files changed, 59 insertions(+), 58 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 253ac6e483..f4fd44cb32 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -78,6 +78,7 @@ void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr);
 void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
 void build_append_pcihp_resources(Aml *table,
                                   uint64_t io_addr, uint64_t io_len);
+bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
 
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index e3cc57b954..333099b8ba 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -39,6 +39,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qom/qom-qobject.h"
+#include "qobject/qnum.h"
 #include "trace.h"
 
 #define ACPI_PCIHP_SIZE 0x0018
@@ -703,6 +704,63 @@ void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
     aml_append(scope, dev);
 }
 
+bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus)
+{
+    Aml *method;
+    PCIBus *sec;
+    QObject *bsel;
+    int nr_notifiers = 0;
+    GQueue *pcnt_bus_list = g_queue_new();
+
+    QLIST_FOREACH(sec, &bus->child, sibling) {
+        Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
+        if (pci_bus_is_root(sec)) {
+            continue;
+        }
+        nr_notifiers = nr_notifiers +
+                       build_append_notification_callback(br_scope, sec);
+        /*
+         * add new child scope to parent
+         * and keep track of bus that have PCNT,
+         * bus list is used later to call children PCNTs from this level PCNT
+         */
+        if (nr_notifiers) {
+            g_queue_push_tail(pcnt_bus_list, sec);
+            aml_append(parent_scope, br_scope);
+        }
+    }
+
+    /*
+     * Append PCNT method to notify about events on local and child buses.
+     * ps: hostbridge might not have hotplug (bsel) enabled but might have
+     * child bridges that do have bsel.
+     */
+    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
+
+    /* If bus supports hotplug select it and notify about local events */
+    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
+    if (bsel) {
+        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
+
+        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
+        aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
+                                     aml_int(1))); /* Device Check */
+        aml_append(method, aml_call2("DVNT", aml_name("PCID"),
+                                     aml_int(3))); /* Eject Request */
+        nr_notifiers++;
+    }
+
+    /* Notify about child bus events in any case */
+    while ((sec = g_queue_pop_head(pcnt_bus_list))) {
+        aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
+    }
+
+    aml_append(parent_scope, method);
+    qobject_unref(bsel);
+    g_queue_free(pcnt_bus_list);
+    return !!nr_notifiers;
+}
+
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6ca2b34ef8..3275675e60 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -563,64 +563,6 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     }
 }
 
-static bool build_append_notification_callback(Aml *parent_scope,
-                                               const PCIBus *bus)
-{
-    Aml *method;
-    PCIBus *sec;
-    QObject *bsel;
-    int nr_notifiers = 0;
-    GQueue *pcnt_bus_list = g_queue_new();
-
-    QLIST_FOREACH(sec, &bus->child, sibling) {
-        Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
-        if (pci_bus_is_root(sec)) {
-            continue;
-        }
-        nr_notifiers = nr_notifiers +
-                       build_append_notification_callback(br_scope, sec);
-        /*
-         * add new child scope to parent
-         * and keep track of bus that have PCNT,
-         * bus list is used later to call children PCNTs from this level PCNT
-         */
-        if (nr_notifiers) {
-            g_queue_push_tail(pcnt_bus_list, sec);
-            aml_append(parent_scope, br_scope);
-        }
-    }
-
-    /*
-     * Append PCNT method to notify about events on local and child buses.
-     * ps: hostbridge might not have hotplug (bsel) enabled but might have
-     * child bridges that do have bsel.
-     */
-    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
-
-    /* If bus supports hotplug select it and notify about local events */
-    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
-
-        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
-        aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
-                                     aml_int(1))); /* Device Check */
-        aml_append(method, aml_call2("DVNT", aml_name("PCID"),
-                                     aml_int(3))); /* Eject Request */
-        nr_notifiers++;
-    }
-
-    /* Notify about child bus events in any case */
-    while ((sec = g_queue_pop_head(pcnt_bus_list))) {
-        aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
-    }
-
-    aml_append(parent_scope, method);
-    qobject_unref(bsel);
-    g_queue_free(pcnt_bus_list);
-    return !!nr_notifiers;
-}
-
 /*
  * build_prt - Define interrupt routing rules
  *
-- 
2.49.0
