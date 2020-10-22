Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6377123lfa;
        Thu, 22 Oct 2020 01:30:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1oJLjZAFz8ZqXP/Fkio24MSVYz+v5mGyjD74plyXdND1r2OydBd8JJMFfnHYaReuKJczq
X-Received: by 2002:a05:6902:52d:: with SMTP id y13mr1535401ybs.364.1603355416908;
        Thu, 22 Oct 2020 01:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603355416; cv=none;
        d=google.com; s=arc-20160816;
        b=zlSRpF7Y+ATaYB0gDKueUeWPgGnPdb65Z/eBMxX4pN7Mpk4Zf22NxTfkpM3C+5cQ+5
         KSI6FT8EacagLXwScXoBdxp3ZWg+e+n43C1q/YR//aORkLcHTMbZQsYEwOnRe3TuVYfW
         7/rRwtXiAJmgeiqQ+cDIF31oe6pc/oX5BTNJ3P70I+DMA9biLJDJ81sPVe2xnb+iWRPT
         guE6ur1TlwCQp1xaLXRJJxB7E6HFt+QhtRAlPprw+cGyQijEVoMKbTzofe7g9a0y87rO
         EnYZ2jPi+jN4tN5U5fy+wL1rOVq6AeTtiSkeJG4kUQYUCnbrNNuyES2ydGSFFkOBkVvQ
         HckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=McEgxfLupcUsisyIkVt9vm0XuapJufKvR//mdzCdlyk=;
        b=J6B4SJ4jqeo9kmbcOWE/Pb5FgVPfYnRCZy/qCcXb6ekwWuBew1SaucbkKLGn2bxh0O
         syMB0UydjHf1llU4SEvO0ff9mhLb3vEQLTUkVucAe6XSObWTKGiEomq6hSoZzoqBFAao
         bL4hEDoWxafS0s+f41Ng9kNHSzNs0x7E/MfIutPShVbx6jThiX/lo68mqPn7ao9Vv6iL
         XbQ0l5/bH2oC1fkyf5W7GdCvqbYBrrawbHjI2Eh28/8h628XTpsmAa0oonh6B20JQ9+g
         4/4x5nVhULbZYiPASRgyDFJ70I7k4HRwmRj4/rHPKd1rmHOCjwhP5jDC/7bxaEyUKrWm
         2cPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=YQCxHhVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si152166ybp.133.2020.10.22.01.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 01:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=YQCxHhVt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVVzE-00010A-7b
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 04:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kVVuh-0004PY-3k; Thu, 22 Oct 2020 04:25:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kVVuf-0006BQ-0m; Thu, 22 Oct 2020 04:25:34 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M8OWbm008879;
 Thu, 22 Oct 2020 08:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=McEgxfLupcUsisyIkVt9vm0XuapJufKvR//mdzCdlyk=;
 b=YQCxHhVtBtxDwsWPbDAGVQkQb4+lRpEQWc6SzEW0Z6f15w99c8fWOZA94ZZjMYeYLdEu
 MPAxe1TnYXsjNWD6eIChf1rTK5yMYW0eRkJJyZqVxMwY0E8MofWI3LMqTHxI8CNfuwlr
 0HTPVfWzE5JknwwCK6DACa34q746eKxGqkaDpvRJl6jUPV4YxALl706ynbScw/aFCaXi
 vCfKVhzxVA0tHdbQHVu1OQIFOMleylanpBlYYH65f7yqMVDW4rbaR3bh4hEaTWC3WUFh
 p58KaSbopDUpym+Eprb4D7tunqptBZ75QHs+s6LD3/rshXGuHyyOkWZsSLRn3dU1/QIV hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34ak16mvt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Oct 2020 08:25:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M8G9a1095051;
 Thu, 22 Oct 2020 08:25:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 348a6qbcqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 08:25:29 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09M8PSug020707;
 Thu, 22 Oct 2020 08:25:28 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Oct 2020 01:25:28 -0700
From: Mihai Carabas <mihai.carabas@oracle.com>
To: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, mst@redhat.com,
 imammedo@redhat.com
Subject: [PATCH 4/8] hw/arm/virt: Use the pvpanic device
Date: Thu, 22 Oct 2020 10:42:52 +0300
Message-Id: <1603352576-21671-5-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
References: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=4 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=4 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220056
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=mihai.carabas@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 04:09:38
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, Peng Hao <peng.hao2@zte.com.cn>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OhHLtiq2PJQA

From: Peng Hao <peng.hao2@zte.com.cn>

Add pvpanic device in arm virt machine.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 hw/arm/virt.c         | 25 +++++++++++++++++++++++++
 include/hw/arm/virt.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e465a98..63f09a6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -78,6 +78,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/misc/pvpanic.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -152,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
+    [VIRT_PVPANIC] =            { 0x090b0000, 0x00000002 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -226,6 +228,27 @@ static void create_kaslr_seed(VirtMachineState *vms, const char *node)
     qemu_fdt_setprop_u64(vms->fdt, node, "kaslr-seed", seed);
 }
 
+static void create_pvpanic_device(const VirtMachineState *vms)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
+    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
+
+    if (!vms->pvpanic) {
+        return;
+    }
+    sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
+
+    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_string(vms->fdt, nodename,
+                            "compatible", "qemu,pvpanic-mmio");
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+
+    g_free(nodename);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -1957,6 +1980,8 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
+    create_pvpanic_device(vms);
+
     create_gic(vms);
 
     virt_cpu_post_init(vms, possible_cpus->len, sysmem);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aad6d69..e6410c3 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -69,6 +69,7 @@ enum {
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
     VIRT_SMMU,
+    VIRT_PVPANIC,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
@@ -139,6 +140,7 @@ struct VirtMachineState {
     bool highmem;
     bool highmem_ecam;
     bool its;
+    bool pvpanic;
     bool virt;
     bool ras;
     bool mte;
-- 
1.8.3.1

