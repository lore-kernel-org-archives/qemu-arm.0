Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp523060wrt;
        Wed, 23 Jan 2019 02:22:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN78c6+WmEkCnYn9yH2DfXqgw17qra4f2pP7PPsz6+k65hnCuNtKyb4yJHCp+MQfVKKEWXT4
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr2141366wrt.227.1548238958353;
        Wed, 23 Jan 2019 02:22:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238958; cv=none;
        d=google.com; s=arc-20160816;
        b=Ur3wdcxeI/7Ur8fkOSYoV8ziHHU3EodvZKnYouh+2ff8K/hlnV3bnsgo/YWrgY+pao
         kumVQJzMMzuMCp/r6hDpbbs1FcKjbZH1K4vsh/MAeIYus/3Kordyjb6dNgOWv1fGPWt4
         4G0mZKlaUZiTjvZeHR+u3CCMXgJ6HK2m2/u8sKH/3NmZWYe0IWN/Nt/Uppqwn5rmOdvg
         +GnVdYo972GymZe3oIPPPYRUF78LfTyYDGW/U2XCPlCvHJVriHtG1rxfKgyGk+0QAhx3
         bD/sWgiTOIb72S9eEhMGxiyjoW/r5o5Oh9JtvBL1x0aiIFEasTN448KGURGcVoXW46fa
         xdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=NzUSZYvKwbAPCP2ohb42WMBvj7Tl0TXtbVEXqN0OrHo=;
        b=wLf4jdLNKfd2v63eyndXR7J1KJJSJBxwa4OplxfyxorJtR6Cddx5/VSb4EpcyepJ1B
         ihMwYSv/G2sIJR3Kw8NEl1uE61P0Gc+obqdl1bsrnaKIuEue9gFn9XNHFrJl/51YTU1p
         8kgVnhBTEA5UsifBjbYW1rZl4g5AAEP5paqyhxTrMsg39cf56bTnf5gh8oX10ed8c3KI
         R+8EqQ/tKU+RVTODLNPtk031/ldOTGj74SB93aeKtvI3ZX5AkbxlucQaOfep9VIiG4nL
         V4peSzJsoTKWlZ6WkmlNQgXuoxaR6jmQesd4bvgZvc3KDhtRiGFRfyma+zXRLU2WY/l5
         snjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si49691704wrs.326.2019.01.23.02.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:22:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFg5-0006pv-Ac
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFaU-0002Ji-PP
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFaT-0007qn-Pe
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFaT-0007pc-GN; Wed, 23 Jan 2019 05:16:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25A7112039;
	Wed, 23 Jan 2019 10:16:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9817D6046C;
	Wed, 23 Jan 2019 10:16:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:57 +0100
Message-Id: <20190123101458.12478-18-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 23 Jan 2019 10:16:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 17/18] hw/arm/boot: Expose the pmem nodes in
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
X-TUID: ElIZVIiTQpmp

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 15432bb895..8fbdc3ff00 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -454,6 +454,36 @@ out:
     return ret;
 }
=20
+static int fdt_add_pmem_node(void *fdt, uint32_t acells, hwaddr mem_base=
,
+                             uint32_t scells, hwaddr mem_len,
+                             int numa_node_id)
+{
+    char *nodename =3D NULL;
+    int ret;
+
+    nodename =3D g_strdup_printf("/pmem@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "pmem-region");
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
@@ -541,7 +571,8 @@ static int fdt_add_hotpluggable_memory_nodes(void *fd=
t,
         di =3D !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
=20
         if (is_nvdimm) {
-            ret =3D -ENOENT; /* NV-DIMM not yet supported */
+            ret =3D fdt_add_pmem_node(fdt, acells, di->addr,
+                                    scells, di->size, di->node);
         } else {
             ret =3D fdt_add_memory_node(fdt, acells, di->addr,
                                       scells, di->size, di->node);
--=20
2.20.1

