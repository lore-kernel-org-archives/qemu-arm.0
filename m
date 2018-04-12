Received: by 10.28.71.155 with SMTP id m27csp1609377wmi;
        Thu, 12 Apr 2018 00:45:59 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/bJRTorH78hI/UJ5OSuNaLGQ/6gHTusrgOE/G6eId8cg425XT4GaM5tOYQT8ex+sx0Tb/n
X-Received: by 10.55.166.79 with SMTP id p76mr11153121qke.248.1523519159693;
        Thu, 12 Apr 2018 00:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523519159; cv=none;
        d=google.com; s=arc-20160816;
        b=kKUfzu9xH5m+arkS6A82QLgEV6yPBPyQLJioc6LcEU3EG3Bfo+QIDvjzt1M4/5IP+4
         shJoNvEVeJUNP3pzGeWbjW+ALBZNXDhUR9hNfyiQaVvWkRGpxxlVbWh3vvB+4PbFmm/Z
         ZiuKcOES5r9yKIPsqxzK1Y1Cz0p13I+RcBUIVBhk/cEaSWhR3vo8LdriK5VnjWU/oN+j
         bzXU3o/N2qncUkHAaslWiNrgFER0HxcZhR4o4m9y0AgicJiDJYLKqiB6ttOF8g/7stS8
         ggD8yw36ZeDWtx1MD3pCiOs0/Mi7n0FiNtiq6CJtnQF9JdtfpSiWk+HlHpoO5Q/JPuoq
         eUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gz7Xu4wXdjYwjJ9/WzEAZlrGsT3by+zt47LZ5fxsdIc=;
        b=ImsXV0O3EdjXZ1jedkRSdHoq2GHe/25TLGlGA6iHMhfEpuH7ewZMFF4N86oZxIiJBA
         LYXy5lC2/+9T9V//GZjfREx4drT/daZ7y3aJ8ETf+POzn5C2vc/w5xOaE7kY3GA3P41u
         ESgkwnUWGMB3KCXuW8s8Xz7HE0wew009DBNkTXMrIXsuXQGvkTyCVLnkNb+FqkVddTbr
         CUNBfA+7WHak1s9It6duec6mcELVrpAb930ftbS7l4KIBc1X9n4/jl44GK0foii6T3u3
         x0mIr5NwW/wsfy6gO3AP1t7b3g5Fn3OFhMqBqRIuJdqWX4DT99DwdSZQSb8x5a3WQB/T
         kqyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l66si2875771qkd.129.2018.04.12.00.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 00:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6Wvf-0005ag-4U
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 03:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6Wp0-00073t-VQ
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 03:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6Woz-0003PY-0X
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 03:39:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35648 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6Woy-0003P7-S9; Thu, 12 Apr 2018 03:39:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55B1281A88CD;
	Thu, 12 Apr 2018 07:39:04 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79704215CDC6;
	Thu, 12 Apr 2018 07:39:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Thu, 12 Apr 2018 09:38:05 +0200
Message-Id: <1523518688-26674-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 12 Apr 2018 07:39:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 12 Apr 2018 07:39:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v11 14/17] hw/arm/virt: Introduce the iommu option
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jHQ/5DGSQ74d

ARM virt machine now exposes a new "iommu" option.
The SMMUv3 IOMMU is instantiated using -machine virt,iommu=smmuv3.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---
v9 -> v10:
- remove no_iommu

v7 -> v8:
- Revert to machine option, now dubbed "iommu", preparing for virtio
  instantiation.

v5 -> v6: machine 2_11
---
 hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1799702..a3398d6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1560,6 +1560,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static char *virt_get_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    switch (vms->iommu) {
+    case VIRT_IOMMU_NONE:
+        return g_strdup("none");
+    case VIRT_IOMMU_SMMUV3:
+        return g_strdup("smmuv3");
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void virt_set_iommu(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    if (!strcmp(value, "smmuv3")) {
+        vms->iommu = VIRT_IOMMU_SMMUV3;
+    } else if (!strcmp(value, "none")) {
+        vms->iommu = VIRT_IOMMU_NONE;
+    } else {
+        error_setg(errp, "Invalid iommu value");
+        error_append_hint(errp, "Valid values are none, smmuv3.\n");
+    }
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1692,6 +1720,14 @@ static void virt_2_12_instance_init(Object *obj)
                                         NULL);
     }
 
+    /* Default disallows iommu instantiation */
+    vms->iommu = VIRT_IOMMU_NONE;
+    object_property_add_str(obj, "iommu", virt_get_iommu, virt_set_iommu, NULL);
+    object_property_set_description(obj, "iommu",
+                                    "Set the IOMMU model among "
+                                    "none, smmuv3 (default none)",
+                                    NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
-- 
2.5.5

