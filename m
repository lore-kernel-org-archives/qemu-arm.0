Received: by 10.28.4.212 with SMTP id 203csp886098wme;
        Wed, 25 Apr 2018 07:29:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZonVP0nNUzssLQsOBvJNu/t8D2zrZ2HPujLk0a0zQqhyd53lb2D49oEW2BNm9VAwmDdcyoL
X-Received: by 10.55.176.129 with SMTP id z123mr19442967qke.51.1524666581519;
        Wed, 25 Apr 2018 07:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666581; cv=none;
        d=google.com; s=arc-20160816;
        b=Jm7zwFD+wv3s2D+fU7UiDZeFeXDBe+HhRxxb3R/SzZHdMiwK4YzDjyfmjFwRv76Koa
         y1F5B6vCezA1OtgFYIwab1NQnnLJGl87m1N3HPcW+FpOBIg5SSvmmQeUhHJ5phtEcL3B
         u8wX+f8FMeWHESyIZJbg3ZO6asr3zWcejCRpbEr4CbBNLtZBLmkVgT9z7jYGckeJy5NU
         jDyPy+ze/1LEe5JC/2U0bVmhJ1wCwdMdVs86tjRiy4DCISvhlj87AomjKXhWcChJU3Ye
         ziaDnmIEch1HFmYR5klMJ3QPtqBAwCmRTIsXJ1+8aUAf5YTT6zJF8NKgMxEOCCREm5wx
         tTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CqoWRIBNnbUOAICigDiNH27+E/ZffhQTfJDUBYueK5o=;
        b=rS+x57DI8dzzBif0ZKMSJ7gDQN8tjQKB+gCwthE/5hxTdrnU8dU8vnsONgOEhq83QG
         KABxEwkpHIxrVJppHdkZ8zf3lPUdufTI2zbZClsbMuVfi6kE4Wkyw/yDbj30r4v+angc
         T+EcBqVcBDpGjz3PSjoPFxAwFkKszAdx3m9Fr9Jtdn3zfKi8YIqQ/omOGLpj07Ee/P5k
         69PqdaP3W+RAxv9U4eKXxo8g78gIJh2glvBUqjc3Nu/5GgbnrMkj5cln8GIpCR5kb69C
         ZKzz/1lCugL+Gccrk6O0OFxhAup5/C2sZk4uWqjk9S2t2ounolUBwSdc/VGhA7kWowOa
         o04g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7-v6si5024604qtd.381.2018.04.25.07.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLQT-00022h-0U
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:29:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEC-0000xQ-F1
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEB-0006AI-GB
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:17:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54190 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLE6-00067z-Hl; Wed, 25 Apr 2018 10:16:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27CAA40201A2;
	Wed, 25 Apr 2018 14:16:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77CA92023239;
	Wed, 25 Apr 2018 14:16:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:59 +0200
Message-Id: <1524665762-31355-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 25 Apr 2018 14:16:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 25 Apr 2018 14:16:54 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v12 14/17] hw/arm/virt: Introduce the iommu
 option
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UoAq2ZvdbI2u

ARM virt machine now exposes a new "iommu" option.
The SMMUv3 IOMMU is instantiated using -machine virt,iommu=smmuv3.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v11 -> v12:
- change the property description
- add Peter's R-b

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
index 1799702..c6e77b5 100644
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
+                                    "Set the IOMMU type. "
+                                    "Valid values are none and smmuv3",
+                                    NULL);
+
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
 }
-- 
2.5.5

