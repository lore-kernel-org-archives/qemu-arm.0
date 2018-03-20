Received: by 10.28.91.67 with SMTP id p64csp3786248wmb;
        Tue, 20 Mar 2018 05:47:32 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuvwqoXSCfKWsZHNXC0EsdSknWdKogfuQ57iME8pyzx5e3pPnzvku5DpyEngGgRl42IlgTU
X-Received: by 10.200.14.205 with SMTP id w13mr23433804qti.284.1521550052167;
        Tue, 20 Mar 2018 05:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521550052; cv=none;
        d=google.com; s=arc-20160816;
        b=f2/I4zm8i+kKcxokBDEZbot2sBwWnI4xeqXrTtt+aoClL4ghQaxxcflJEsaPHkOoWA
         0lZCidrEpnSWzk+7cNHUyJ7sSp9nnBeVgP4GvFTvuMoPu9JoqUDV1TNr8CQnBZPcLtQk
         XaNe/Rdl48CHF/2IkcROMTp3+LJLIYczE87E5mJJlyRv0LEIBQoQa5TzZ9kQ2tjw2rhU
         8dBvYhyv3EVvjh72He66vogAbmE1RBb15ij9KQq7x+8jiVvUxQLgbNBxuqhyYVcT9FoH
         DRbu50I6GM9jUsyBKyhqEiXNzdaCWo/g2GgXKDDWF53QN50ruNF/ZVOhHCSNdfNPjPuv
         MqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=O8s4nSDEUPH8v/QQm6Xt0Rp3CqaYm9xH1wT77TVqV40=;
        b=shfFkymf/xkeZczpGJHnu4/SH3nnQjV2cDlEzuIW9+ESAqRZp7BVx8+lRNf7jJa4VF
         LBLG2sAtzroCBO8Yn7TJpQAB9kskqbsTv7TLSUBx8dQMwgzUhjl7y9JdW/gZVK1itZxc
         hMjzU1uU7MMS1hBI93rTx/yC7tryuyS8Jyh6DtwSL3sJvD7Ux/tvK1QbHHqJAvDSlcgD
         vNmnTlPYV/KVBMgf7Hxd6gosc/w+WP25Q8tGGiaNMPueTUu/NUZKUh8wzbSmDe92/5MX
         ji/2R9JBjw40+QgFeDI0nNzE3fM/zvYI4YMHi6jPH8Yho3BmFIsLuzSij/6QLFKBQD0Q
         X/tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g38si633036qte.282.2018.03.20.05.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGfr-0007N9-Mx
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXg-0008Lk-0x
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:39:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXc-0003sJ-4T
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:39:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43430 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGXb-0003rv-Va; Tue, 20 Mar 2018 08:39:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70A63EB71E;
	Tue, 20 Mar 2018 12:38:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 957BF76FB;
	Tue, 20 Mar 2018 12:38:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:36 +0100
Message-Id: <1521549456-14072-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 12:38:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 12:38:59 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 14/14] hw/arm/virt: Introduce the iommu option
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
X-TUID: 1EpHFvCI/C7U

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
index cf83712..1ca7baf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1557,6 +1557,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
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
@@ -1689,6 +1717,14 @@ static void virt_2_12_instance_init(Object *obj)
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

