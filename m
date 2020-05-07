Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2021566lfb;
        Thu, 7 May 2020 07:33:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJkK6X1+DsrRTcjvAow66xyEHuZgKx6ttJ82abad+1rOu0gpATjiXgSXpmVPdNRJkT2rGQU
X-Received: by 2002:a0c:ed26:: with SMTP id u6mr13594057qvq.220.1588862037993;
        Thu, 07 May 2020 07:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588862037; cv=none;
        d=google.com; s=arc-20160816;
        b=f0ISZ5rt/1ad0oWxwnaqXCgjBJKtUVqQoUR7vZtt8XkRTPuujvkugmHtSIDJaV1Lci
         l7CRhU0hlkuC9DmGvxGP0fR0YPBtNW29bu6zxhYbHTD+YlPHCh91PpZtqfSiYNvH901f
         mtj1vgEag/teHCMpBIimbZESD1ZvYemHnzDY92ahS2QnIJ9ThuP1KEDA3g2hI7KgBnRx
         FSTXSWBVjdqumnaHhxJeDNLi3WIjxJKE+g9L+nh//w/7k/njGL9/BHIhFoYY5trjAb74
         eYNW0x4uLCGH+q+ITDiRJYWmpNmKrHPA0uJK/DYdJSug+A3RTESxViA/9wAiwpEPJ199
         97kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=025Liq6P9NfmWE+4xotssh0pHBJh/qQDTBn0yD+t2WE=;
        b=XcjV1Q68C7+j0Sd/shtY2WywA/sLtmF6SomTWpUPSZmjox3xQ7998HrYoExcTzXfp4
         5aYSZeDBX/M/YvzhCy6ENY8Pn+NK9XrlubEo8ih27IwT2MNd0Ea8JruULkRdpGrSByl0
         sD9bMZtx0FwBGMg8aTkjO0f1pK48HVvUYiWXoKJqi+YDX4J6eMhCwxITbkcPrqEsUQzU
         0df6DbnBDUQs1/BZiTjKaVE6Ldrs6v4hP9i//pkIvK38IcY/kWH68htnLrncw7rgtUPN
         x4HGGnIuTWe4V381Po3cECweHjjy6JfQfBGcJdLYJxs1Bmx2u+79RdahzlaclnPNcU40
         3zNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0jCI6jS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id n9si2766390qkg.143.2020.05.07.07.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 07:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i0jCI6jS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWhb3-0001uH-8C
	for alex.bennee@linaro.org; Thu, 07 May 2020 10:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZb-0000C9-Ef
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:32:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60041
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZY-0006Gq-J4
 for qemu-devel@nongnu.org; Thu, 07 May 2020 10:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=025Liq6P9NfmWE+4xotssh0pHBJh/qQDTBn0yD+t2WE=;
 b=i0jCI6jS8wG3NS6mvm6lPNoXzSoqa5MWT7fAj/oti+VwPC0GQttKBruXJBjNl2P6oZ6QKf
 4CSiBWGAj7Q3byCZRq0YEhghGLYWF9V1u9Xe3sk0RnBPFMF4mt63TJ5iUyaQKc/ntba/n5
 qdoH/OJqoBJzjXaLINS5tmToXP8yiUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-RBzoz-CuOeGuywLuSwoUCw-1; Thu, 07 May 2020 10:32:18 -0400
X-MC-Unique: RBzoz-CuOeGuywLuSwoUCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7380080058A;
 Thu,  7 May 2020 14:32:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BA5E7055D;
 Thu,  7 May 2020 14:32:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com, armbru@redhat.com
Subject: [PATCH 1/5] qdev: Introduce DEFINE_PROP_RESERVED_REGION
Date: Thu,  7 May 2020 16:31:57 +0200
Message-Id: <20200507143201.31080-2-eric.auger@redhat.com>
In-Reply-To: <20200507143201.31080-1-eric.auger@redhat.com>
References: <20200507143201.31080-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:15:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +YjSDE5J2ITM

Introduce a new property defining a reserved region:
<low address>, <high address>, <type>.

This will be used to encode reserved IOVA regions.

For instance, in virtio-iommu use case, reserved IOVA regions
will be passed by the machine code to the virtio-iommu-pci
device (an array of those). The type of the reserved region
will match the virtio_iommu_probe_resv_mem subtype value:
- VIRTIO_IOMMU_RESV_MEM_T_RESERVED (0)
- VIRTIO_IOMMU_RESV_MEM_T_MSI (1)

on PC/Q35 machine, this will be used to inform the
virtio-iommu-pci device it should bypass the MSI region.
The reserved region will be: 0xfee00000, 0xfeefffff, 1.

On ARM, we can declare the ITS MSI doorbell as an MSI
region to prevent MSIs from being mapped on guest side.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- rename into DEFINE_PROP_RESERVED_REGION
- do not use g_strsplit anymore, use endptr instead
- remove 0x references
---
 include/exec/memory.h        |  6 +++
 include/hw/qdev-properties.h |  3 ++
 include/qemu/typedefs.h      |  1 +
 hw/core/qdev-properties.c    | 89 ++++++++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e000bd2f97..7e47afabe8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -57,6 +57,12 @@ struct MemoryRegionMmio {
     CPUWriteMemoryFunc *write[3];
 };
=20
+struct ReservedRegion {
+    hwaddr low;
+    hwaddr high;
+    unsigned int type;
+};
+
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
=20
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index f161604fb6..03bf850a7e 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -19,6 +19,7 @@ extern const PropertyInfo qdev_prop_string;
 extern const PropertyInfo qdev_prop_chr;
 extern const PropertyInfo qdev_prop_tpm;
 extern const PropertyInfo qdev_prop_macaddr;
+extern const PropertyInfo qdev_prop_reserved_region;
 extern const PropertyInfo qdev_prop_on_off_auto;
 extern const PropertyInfo qdev_prop_multifd_compression;
 extern const PropertyInfo qdev_prop_losttickpolicy;
@@ -183,6 +184,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP(_n, _s, _f, qdev_prop_drive_iothread, BlockBackend *)
 #define DEFINE_PROP_MACADDR(_n, _s, _f)         \
     DEFINE_PROP(_n, _s, _f, qdev_prop_macaddr, MACAddr)
+#define DEFINE_PROP_RESERVED_REGION(_n, _s, _f)         \
+    DEFINE_PROP(_n, _s, _f, qdev_prop_reserved_region, ReservedRegion)
 #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
 #define DEFINE_PROP_MULTIFD_COMPRESSION(_n, _s, _f, _d) \
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index ecf3cde26c..85c4f891f4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -59,6 +59,7 @@ typedef struct ISABus ISABus;
 typedef struct ISADevice ISADevice;
 typedef struct IsaDma IsaDma;
 typedef struct MACAddr MACAddr;
+typedef struct ReservedRegion ReservedRegion;
 typedef struct MachineClass MachineClass;
 typedef struct MachineState MachineState;
 typedef struct MemoryListener MemoryListener;
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 2047114fca..c2e0cc7cda 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -14,6 +14,7 @@
 #include "qapi/visitor.h"
 #include "chardev/char.h"
 #include "qemu/uuid.h"
+#include "qemu/cutils.h"
=20
 void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
                                   Error **errp)
@@ -577,6 +578,94 @@ const PropertyInfo qdev_prop_macaddr =3D {
     .set   =3D set_mac,
 };
=20
+/* --- Reserved Region --- */
+
+/*
+ * accepted syntax version:
+ *   <low address>,<high address>,<type>
+ *   where low/high addresses are uint64_t in hexadecimal
+ *   and type is an unsigned integer in decimal
+ */
+static void get_reserved_region(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    DeviceState *dev =3D DEVICE(obj);
+    Property *prop =3D opaque;
+    ReservedRegion *rr =3D qdev_get_prop_ptr(dev, prop);
+    char buffer[64];
+    char *p =3D buffer;
+
+    snprintf(buffer, sizeof(buffer), "0x%"PRIx64",0x%"PRIx64",%u",
+             rr->low, rr->high, rr->type);
+
+    visit_type_str(v, name, &p, errp);
+}
+
+static void set_reserved_region(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    DeviceState *dev =3D DEVICE(obj);
+    Property *prop =3D opaque;
+    ReservedRegion *rr =3D qdev_get_prop_ptr(dev, prop);
+    Error *local_err =3D NULL;
+    const char *endptr;
+    char *str;
+    int ret;
+
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return;
+    }
+
+    visit_type_str(v, name, &str, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    ret =3D qemu_strtou64(str, &endptr, 16, &rr->low);
+    if (ret) {
+        error_setg(errp, "Failed to decode reserved region low addr");
+        error_append_hint(errp,
+                          "should be an address in hexadecimal\n");
+        goto out;
+    }
+    if (*endptr !=3D ',') {
+        goto separator_error;
+    }
+
+    ret =3D qemu_strtou64(endptr + 1, &endptr, 16, &rr->high);
+    if (ret) {
+        error_setg(errp, "Failed to decode reserved region high addr");
+        error_append_hint(errp,
+                          "should be an address in hexadecimal\n");
+        goto out;
+    }
+    if (*endptr !=3D ',') {
+        goto separator_error;
+    }
+
+    ret =3D qemu_strtoui(endptr + 1, &endptr, 10, &rr->type);
+    if (ret) {
+        error_setg(errp, "Failed to decode reserved region type");
+        error_append_hint(errp, "should be an unsigned integer in decimal\=
n");
+    }
+    goto out;
+
+separator_error:
+    error_setg(errp, "reserved region fields must be separated with commas=
");
+out:
+    g_free(str);
+    return;
+}
+
+const PropertyInfo qdev_prop_reserved_region =3D {
+    .name  =3D "reserved_region",
+    .description =3D "Reserved Region, example: 0xFEE00000,0xFEEFFFFF,0",
+    .get   =3D get_reserved_region,
+    .set   =3D set_reserved_region,
+};
+
 /* --- on/off/auto --- */
=20
 const PropertyInfo qdev_prop_on_off_auto =3D {
--=20
2.20.1

