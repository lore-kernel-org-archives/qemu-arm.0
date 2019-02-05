Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5055658wrt;
        Tue, 5 Feb 2019 10:09:52 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaAG8ACTnDdrhmOZVA54AgdZWDvAMBCWO5Y8yUKGggagWxwtsy6IIJQHUsVyHzLP6Akg86L
X-Received: by 2002:a25:3885:: with SMTP id f127mr5157617yba.10.1549390192773;
        Tue, 05 Feb 2019 10:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549390192; cv=none;
        d=google.com; s=arc-20160816;
        b=LwGjdBZlOAL0dryNmdE2GyuNjsbuonZK+a+J7JouSFTJt+P+LQccUpx7edqNfoKhTt
         7uCWQyFbG945Wjj9yNtq2r0Rh0XmMBRe38MAORlmeGsJJcSMwCRBMDTOwhHRUAk9nOLw
         b9lWI5T1D6Hug587G6AmP4c8kH7VhY4PzPylTvrUky/78xWl+1ha/a8EdeKpMonGkXou
         i7suI0X/95JCHuDffVE4buGyShemPIobX7fopS0wfDWQGRmILWamQ2fUJTy5i5f+3j1J
         WsCQ2Zcub/NW6/BNfZuobm9d02IpTyigbjSLw41yUeozreLwRnylnPlXZGe9JZVtYJbb
         I92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QVhrilWsfpQs3wVEFCZLtyNoE+h0TULThnIFEQJ+j0g=;
        b=fo62wYOm2dbbM+K92Y6JNXCU5ntMXDBWC9kNM6t1JhnY+roJ5w0fSwzhCSACM6CUC2
         cAHY2EdfvYYR3VXb6/3UnNiaLrgwYOAuRPYwcEu5cHS8Gr4MMV/49GUb5HeGk+EwvPUJ
         4GxaF26YXijC8gwPf2wVGVoQHa0yhi8+A7KRld3fVTZ4/XPC+pBuN6SM35qcDNMeMF+Z
         7kaTu12UBl6XJcqyRAlrKdz7PgFX1D1bC2LOW2sneAEwiL3fr3eZI3unIIX2GVq14OO9
         X07iuXNaBHThZhSQBiZrW8keC1hKxyvDa4mpj3iNysIWVj3cBNj9w8OL/Q9CowWDUfZ7
         N7iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si2534468ywh.263.2019.02.05.10.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr5AO-0004Uz-44
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4cc-00013r-PB
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4cb-0004oB-3J
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4cV-0004bX-VB; Tue, 05 Feb 2019 12:34:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49E98E6A7D;
	Tue,  5 Feb 2019 17:34:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A949183EA;
	Tue,  5 Feb 2019 17:34:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:33:05 +0100
Message-Id: <20190205173306.20483-18-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 05 Feb 2019 17:34:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 17/18] hw/arm/boot: Expose the pmem nodes in
 the DT
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
X-TUID: HJd28+EB2ZiL

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 2a70e8aa82..b1aa866f07 100644
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

