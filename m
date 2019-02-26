Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11490944wrx;
        Tue, 26 Feb 2019 12:48:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib2WtsJJ3uym/RRYyELs1FXjxjH72wrXVnts9YL2A5FtBDMNyqLMh/3lubu78CzEjbRDz5I
X-Received: by 2002:a81:b386:: with SMTP id r128mr20070569ywh.370.1551214092976;
        Tue, 26 Feb 2019 12:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214092; cv=none;
        d=google.com; s=arc-20160816;
        b=cj2Gm4/E8MFoCXV7ueidISqAqjeEYZl+DQjC7T1OkItk8FG3HMW29ZvqTRePEbDEHN
         HVqGiv+BTTH5qCJWLFb1LIrrhKKTsXfm3WYaskzXG8ZgO2QLl/3NAx2Kwf//T4sIG933
         dYzEOO6qgJoN4V/ZwwGOVcOiHCOtFgDzGnPMg3GghGMBFiW7N05Q3DQ1aw/MgrHY8bBZ
         e3LzRApNDwvahBf1dc3xf8axDpb4r963/rauvNrKDljstj+zcPDkCdQ7eDvAGiU5AOFD
         kNp8Wux+ihWZUKsFyNZRDA/ygPVRJwdwmTWY9E/pUmZGI50H3Fa3OZjdAbUqeGgc85XI
         hJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=tyXit8NmLkEhnnY3W1d0QFoJU3Ko7hayo3uNKlOBb9o=;
        b=eHYIFlrZsCXTC6I+6zDuw/pnZ77fNKxJdJWDvcT0Ey8aRIzgN1syddN4SJJIHV9H5O
         TsAIk/ID37m9a/wAmKWxtSscVXhKv1dNf10KRZepYMCRTdrwybozvJtS85ajPuK4Y+N9
         352bFBA5hceJRk7PVTgFh8kg4WMaCXs2HIwGDWCmJXt3dPpHkL/guwlJDpfMY2B6YIwy
         jcoNcH/8z4b1B/AS4+2z9Va/ae3URAvbyttwsN7rjMSYshFfgY3vZFYg78eo70I3F3Os
         9q6CK8GVvRmx+jbYPMBgjx4QPLwdnYZPUDFAC7utZ0eBeMNDHNrkz+1TArm0U18mwYS6
         NGrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r126si7780732ybf.246.2019.02.26.12.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:32934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyje8-0007Dr-AN
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjb4-0005aR-Vo
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 15:45:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjb4-0008Jp-3x
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 15:45:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjaz-0008GC-9q; Tue, 26 Feb 2019 15:44:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AD0630BD2A1;
	Tue, 26 Feb 2019 20:44:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 480EA5D6AA;
	Tue, 26 Feb 2019 20:44:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:22 +0100
Message-Id: <20190226204439.2296-2-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 26 Feb 2019 20:44:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v9 01/18] hw/arm/boot: introduce
 fdt_add_memory_node helper
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3YJiixEN4pEf

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

We introduce an helper to create a memory node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v7 -> v8:
- Added Igor's R-b

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

