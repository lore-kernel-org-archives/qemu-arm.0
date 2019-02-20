Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5048251wrx;
        Wed, 20 Feb 2019 14:44:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZa3UP4olPQsZNqVvEPpYT+/weV6u872kwvC25b5iq2C3dgHgzB/S77YX6h+QXqKKbwfEw+
X-Received: by 2002:a81:1d44:: with SMTP id d65mr30421295ywd.483.1550702676453;
        Wed, 20 Feb 2019 14:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702676; cv=none;
        d=google.com; s=arc-20160816;
        b=Bu4fZSBUdfLkxcEet/AsZZ63DRoJflFNEgROp0z0CXi6M3orAJQkFezx+6ZfIboaey
         vgpvmNYlbUo2k/qtkDhJQ4s4Z8wG+zRNcf+TxXmlniVh3LDwvblBdKXN6/v1wn0AjKxZ
         sf+IYmdmAQqczP981MqMaLsfC7dTXoKHgf0zwSwfZ0IE5JOFF8JPGewSHGjdt0EtEKCy
         iNKY/XOeeySTxcCZDkS6lYvU4/B8fuJbMJefCJr2U/JeF3gWTjjZkcwlpFRcYhDRJ95H
         JGT/1dwa01cIbxFF/RkqYzicG8WTDjUWc8fFN3Dl84hCZxvdjg9CPUUXRmRxDc0q1RsD
         o12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=c0GtwCB+X9rfUMA0kB2xUB+YKdcIxsS/f4mUN/fYOmc=;
        b=z80Grei6xv+PvkgrYXCBdI2A48UC1SGF31JmGYCqHFwV31lwpjuNSjIxoSzAKv+e3k
         QycXP09NviA70S0uBm0AY5UP0XP0GNjIIpkGvMjNa0/9y1WO/3PnIhG/WI0HXFDMsZG2
         Rt5NrVfq/RUizg85N/MbLBdvvfNC4qKpakE7+kx9x0GOK5RcbEVmn3Urz6ONEARNGF8p
         uG9tKNBWLgMLKiI9giI0YeI2Zc88qNhj6UnpWUjT09J5uWHX4sU2tKPMaGvvacgwlwAt
         vaA59Lo/Zo5UfEjb0V63lBIokd0JL8h3BIRkf371zBbqdt7KHs2uAojqoaQCNvaxANw/
         uTTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si11413757ybx.217.2019.02.20.14.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwabT-0007BK-QS
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaYF-0004Wn-UM
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaYF-0000pI-8g
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:23691)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaYE-0000hc-TX; Wed, 20 Feb 2019 17:41:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91DC9308A967;
	Wed, 20 Feb 2019 22:41:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03E0A5D6AA;
	Wed, 20 Feb 2019 22:41:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:40:02 +0100
Message-Id: <20190220224003.4420-17-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 20 Feb 2019 22:41:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 16/17] hw/arm/boot: Expose the pmem nodes in
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uuv/gyc0zOzA

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7
- does the same rework as for fdt_add_memory_node
---
 hw/arm/boot.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 255aaca0cf..66caf005e5 100644
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

