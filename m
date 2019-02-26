Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11499428wrx;
        Tue, 26 Feb 2019 12:59:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaEpBiacF6RNND/XvttoVZ5F1wzdhUSVcewBuCLZzNxQTZMQnaY50i0YyPwSebjauFrUv3M
X-Received: by 2002:a25:3604:: with SMTP id d4mr13681558yba.466.1551214794706;
        Tue, 26 Feb 2019 12:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214794; cv=none;
        d=google.com; s=arc-20160816;
        b=fDG68bmn1GKxJMj67rvv/vu/eBmTshQtGnG9wTe9MYYd79TV9NLQHEPFdmDAgd735H
         gl8CeTMj+JTGuoeEck1O9Yq5JWmCudUjrQrifZd3YAa2nxS0rHTm1n5JR5zjmamGLnWo
         8bAINjqPZ61jTPyAjgItqSv6J5V2DV38AhceK135bseb/VPJWxR86uo4ajzjSiEfsIYe
         BVZT/Ztsaw89g8dYSV3XAjGpjYR63mkU5w8nEsHFDGS3kHDVf6KvhsktxzxJBg3SzTPk
         eoRHZqAfpZwdSL8FI1Z9aaRaVOVGq/Q3DPXVj1xByyje1GLADOK1uG15qrjSBLkFTUgs
         L6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MOL46xuFKg/jDFB9hzjRJVsgtMwR7+QurQCrZfSW7eE=;
        b=SnIEmeFZSck6q/OYc0XvOvbU9n4Px33Kf9AqMEUGYp+ykcuYpmM0zg9clx4pgazBUW
         3ZP3UN+PyGWnhikwsGeY8oZpx9gFD9aD15cKsnZURPtDIrLj2VEbDRUk+Gz6nQwpP6iN
         y35+riQeY0fGllk2PIbw22FKfPHr9wgQRRUz9p4c9UUL6NckS6vdHkBcChFja7rJ65ei
         cyJJegmR8exao4QEgeMblwHkMx6qWFznbrqSCilGxBUVkRBsC2MevjbkjHlKDnCl/jYG
         DtmHUUcDiPHxdtCN7i+ZrmBuyq9WjQo7dXHjDFQ7/ruUUgx6Irx7JnNVqGrdoUYy4kVE
         kzkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si6295323ybm.318.2019.02.26.12.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjpS-0000Om-4Y
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:59:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjcZ-0006nG-Uz
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjcR-00012L-Ov
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjcK-0000x7-CB; Tue, 26 Feb 2019 15:46:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40F937DCEB;
	Tue, 26 Feb 2019 20:46:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29C535D6A6;
	Tue, 26 Feb 2019 20:46:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:38 +0100
Message-Id: <20190226204439.2296-18-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 26 Feb 2019 20:46:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v9 17/18] hw/arm/boot: Expose the pmem nodes in
 the DT
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZgqRQ2HBdAXA

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7
- does the same rework as for fdt_add_memory_node
---
 hw/arm/boot.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 4caaf91583..45e29b7b4a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -450,6 +450,32 @@ out:
     return ret;
 }
=20
+static int fdt_add_pmem_node(void *fdt, uint32_t acells, hwaddr mem_base=
,
+                             uint32_t scells, hwaddr mem_len,
+                             int numa_node_id)
+{
+    char *nodename;
+    int ret;
+
+    nodename =3D g_strdup_printf("/pmem@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "pmem-region");
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
@@ -546,6 +572,20 @@ static int fdt_add_hotpluggable_memory_nodes(void *f=
dt,
             }
             break;
         }
+        case MEMORY_DEVICE_INFO_KIND_NVDIMM:
+        {
+            PCDIMMDeviceInfo *di =3D mi->u.nvdimm.data;
+
+            ret =3D fdt_add_pmem_node(fdt, acells, di->addr,
+                                    scells, di->size, di->node);
+            if (ret) {
+                fprintf(stderr,
+                        "couldn't add NVDIMM /memory@%"PRIx64" node\n",
+                        di->addr);
+                goto out;
+            }
+            break;
+        }
         default:
             fprintf(stderr, "%s memory nodes are not yet supported\n",
                     MemoryDeviceInfoKind_str(mi->type));
--=20
2.20.1

