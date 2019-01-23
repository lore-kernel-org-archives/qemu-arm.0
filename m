Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp519059wrt;
        Wed, 23 Jan 2019 02:17:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5RUbxzPvd1Z7CCq9sGZnh6keFvO1ZjAAkG4PXaDLN3sQ8DBlXdQwDk+q1NLiOQ9EZsCyOa
X-Received: by 2002:adf:ba05:: with SMTP id o5mr1909544wrg.325.1548238668240;
        Wed, 23 Jan 2019 02:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238668; cv=none;
        d=google.com; s=arc-20160816;
        b=HXntRwPu/E58HdE6NLuhIxwlCJXiNr77lm6+h3A37cY5BqWqFYR+VkWpcXhXfMD9xL
         kZ7NQORjKuMz1r+zSjtAQ9PY9YdaxsUOiAWXLESXypwKhW9mxMH1dHChdq4k1oOrE1qS
         mn7QEj5lhfWpCmonQ+lpu84s6OSevcZ2evSSWXv5BsrjOXJJ9N4ULu6lMB3aEnvzj74J
         WTIIj5hKrNdYz7FWh3ONVfZ+PqBNMwB6MKHDqGyEsXrmv3jOk3JLdIs9pebfF7RJQL48
         dyVvdn1tYPFXQAGdyh176Y96jXjypcgpILDyVbIdfZUj23fS9xPtr2k99l4rdhVYVGKN
         qIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fSqV2DL6BhrH3Uam/u95JZJVE0J1JsbTp4LpC2gybhY=;
        b=U4UU3ZubFOS4ja6Xsak2bEsnnAXpscqNM5I79sSKdVpvY9DkAo5Xab1J6A5AWEN3pH
         vpopKIj98uihHpwkby0YpKUDjW1cooR0u9VoFsQjjYrx/1QGtEa5GuC1QwGKnMikDXz8
         fecflsHg6Xz0BuN/LHkJZlwqTOGufMRy6Qlz7XlzGNN7tiMODKs+/vu7G4XWCmwxMEaH
         L5z90qt7L6ftYQBfwgOImDECW4EzbqpG1JnecaLqcncyo5qY3H+zfFX5EF6OEnRbZtb1
         7jI2MNesCv+1RDqLoSDIU19ssZSXQ8wyutM7TQJZ3CqD3JAHYGh/c/oS0bNkwuAFrBNt
         pyaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g185si37581265wmd.156.2019.01.23.02.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFbP-0002hm-9x
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZY-0001WW-7d
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 05:15:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZT-0007Iz-TO
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 05:15:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZL-00075b-16; Wed, 23 Jan 2019 05:15:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1D4FC050061;
	Wed, 23 Jan 2019 10:15:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0AF96013C;
	Wed, 23 Jan 2019 10:15:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:43 +0100
Message-Id: <20190123101458.12478-4-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 10:15:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 03/18] hw/arm/boot: introduce
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hTPGWcJB9DH2

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

We introduce an helper to create a memory node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c7a67af7a9..16f5da02fb 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -423,6 +423,36 @@ static void set_kernel_args_old(const struct arm_boo=
t_info *info,
     }
 }
=20
+static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_ba=
se,
+                               uint32_t scells, hwaddr mem_len,
+                               int numa_node_id)
+{
+    char *nodename =3D NULL;
+    int ret;
+
+    nodename =3D g_strdup_printf("/memory@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+    ret =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, m=
em_base,
+                                       scells, mem_len);
+    if (ret < 0) {
+        fprintf(stderr, "couldn't set %s/reg\n", nodename);
+        goto out;
+    }
+    if (numa_node_id < 0) {
+        goto out;
+    }
+
+    ret =3D qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_no=
de_id);
+    if (ret < 0) {
+        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
+    }
+
+out:
+    g_free(nodename);
+    return ret;
+}
+
 static void fdt_add_psci_node(void *fdt)
 {
     uint32_t cpu_suspend_fn;
@@ -502,7 +532,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
     void *fdt =3D NULL;
     int size, rc, n =3D 0;
     uint32_t acells, scells;
-    char *nodename;
     unsigned int i;
     hwaddr mem_base, mem_len;
     char **node_path;
@@ -576,35 +605,20 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
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
             goto fail;
         }
-        g_free(nodename);
     }
=20
     rc =3D fdt_path_offset(fdt, "/chosen");
--=20
2.20.1

