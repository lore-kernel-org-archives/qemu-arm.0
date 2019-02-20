Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5045785wrx;
        Wed, 20 Feb 2019 14:40:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaVpXA4TzbdxQrh2MOoi/EHs06XbgYyycvuK08RPYVhiaVsGEZI6ll1Lg7WFwM9hU22QRYJ
X-Received: by 2002:a81:5d82:: with SMTP id r124mr8557464ywb.109.1550702437284;
        Wed, 20 Feb 2019 14:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702437; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4tlgHtJf/5PDM7nHrtG/r9Lhw7r8RVD2wxROwQK3AD7i5ma6tBc8MtjnpBFH/41FB
         LfVroEkUFjbph/1GciuyPyy1LHA+0cCyjP4cuhuN2DADlHM4ggvSPkRFkaKN2fmga0aT
         6WJoq1DFdbBzYVHKLOLFUb+NPqE5yz6eOmYLCWlR2Sg+X5x646M8nqvH25umHBOwfv/Z
         WathvDtZxnqFE7kESKlfA/KBfTgtFPLpEazPr/Yz33TzZgH9DoM31gyNjr6Ns5B1x9DV
         85qJ99DcKdGwmu5VnPyiNCNGO9Uu2/7coMpUFTNIS1mJNFIF4q/4sXKWQy4wKZR3X6cO
         C+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5dPDWAx87Ze4hmStq03w9ozVPnbK9/T0lAVHWM9TvKM=;
        b=SxCQcEWlBt/0IdGaO/87GDUsE4yJFf0qklMQ0PdhYkkDcqIRnblwm2egI+GVtbzfAF
         xQvdn5cZhmtqrnVxQn5gLV3PDi60Oq6DSsFRNL3j1DDjKfDk/0wYxiNwYqgJUi0eoxu1
         qixCNJlQVm8sfRdqGLzxOwhcpwM/udaaD1xHfogYtu+OVYXS2eueJ+W3172ck7kteFrh
         9OrfFAC4kTQaHtskOTMo0CPhkcynr6oGiT01NF4xgvRKBYsxRq+sC9hVBWxpC/MYEn23
         +Y4usrTqk4rPH7FUztHvUbdGF3TMjh/4ztHdX3882k3XhtYKM8EvljYhrOVBm5jfRx+n
         IJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d187si9760779ywf.176.2019.02.20.14.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaXc-0003sG-IU
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:40:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXL-0003r9-0J
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXK-0008P6-0r
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXJ-0008Or-Mc; Wed, 20 Feb 2019 17:40:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8CB8368D0;
	Wed, 20 Feb 2019 22:40:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4ABF15D6B3;
	Wed, 20 Feb 2019 22:40:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:47 +0100
Message-Id: <20190220224003.4420-2-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 20 Feb 2019 22:40:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 01/17] hw/arm/boot: introduce
 fdt_add_memory_node helper
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QsQk4eFB+wK3

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

We introduce an helper to create a memory node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

---

v6 -> v7:
- msg error in the caller
- add comment about NUMA ID
---
 hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d90af2f17d..a830655e1a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -423,6 +423,32 @@ static void set_kernel_args_old(const struct arm_boo=
t_info *info,
     }
 }
=20
+static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_ba=
se,
+                               uint32_t scells, hwaddr mem_len,
+                               int numa_node_id)
+{
+    char *nodename;
+    int ret;
+
+    nodename =3D g_strdup_printf("/memory@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+    ret =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, m=
em_base,
+                                       scells, mem_len);
+    if (ret < 0) {
+        goto out;
+    }
+
+    /* only set the NUMA ID if it is specified */
+    if (numa_node_id >=3D 0) {
+        ret =3D qemu_fdt_setprop_cell(fdt, nodename,
+                                    "numa-node-id", numa_node_id);
+    }
+out:
+    g_free(nodename);
+    return ret;
+}
+
 static void fdt_add_psci_node(void *fdt)
 {
     uint32_t cpu_suspend_fn;
@@ -502,7 +528,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
     void *fdt =3D NULL;
     int size, rc, n =3D 0;
     uint32_t acells, scells;
-    char *nodename;
     unsigned int i;
     hwaddr mem_base, mem_len;
     char **node_path;
@@ -576,35 +601,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
         mem_base =3D binfo->loader_start;
         for (i =3D 0; i < nb_numa_nodes; i++) {
             mem_len =3D numa_info[i].node_mem;
-            nodename =3D g_strdup_printf("/memory@%" PRIx64, mem_base);
-            qemu_fdt_add_subnode(fdt, nodename);
-            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memor=
y");
-            rc =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                              acells, mem_base,
-                                              scells, mem_len);
+            rc =3D fdt_add_memory_node(fdt, acells, mem_base,
+                                     scells, mem_len, i);
             if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", nod=
ename,
-                        i);
+                fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
+                        mem_base);
                 goto fail;
             }
=20
-            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
             mem_base +=3D mem_len;
-            g_free(nodename);
         }
     } else {
-        nodename =3D g_strdup_printf("/memory@%" PRIx64, binfo->loader_s=
tart);
-        qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-
-        rc =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                          acells, binfo->loader_start,
-                                          scells, binfo->ram_size);
+        rc =3D fdt_add_memory_node(fdt, acells, binfo->loader_start,
+                                 scells, binfo->ram_size, -1);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set %s reg\n", nodename);
+            fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
+                    binfo->loader_start);
             goto fail;
         }
-        g_free(nodename);
     }
=20
     rc =3D fdt_path_offset(fdt, "/chosen");
--=20
2.20.1

