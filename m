Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp580552wrw;
        Fri, 9 Nov 2018 03:45:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5cJQ90uT+W7KBHuITbFDUuDHDSa0eSeIVUFArPQmwIGyNXOMcrsIrCIEFkhfyXY8xAeQTQa
X-Received: by 2002:a0c:c927:: with SMTP id r36mr8557924qvj.51.1541763959249;
        Fri, 09 Nov 2018 03:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763959; cv=none;
        d=google.com; s=arc-20160816;
        b=M11bc3wn9pBQnk0BOJrnziZMoZh1Tjb+AQXnNPf2DzsFwTgE8rhMc2Wf4/E+1OopE7
         0bCk8CIvBnUDmIzzJz41Pg9Eg7QqfOaB4TSnnwrj7SlPVoK6yC40wnkUjdzvXe+0ZcNI
         pImDWy8RMgZ3vp3daXlS1rJTaScvkNJK8GjQz8QWxPr7OVNgjxoiigzI7YVSKBP82ul2
         9bm6i+7KEl2vB9mev83yYiUk57x/7LjzPyj0grkJPUh1AtQRxa+JuQWFIEIvBnaa6hGL
         ezcp4GhgsnBVSP1Nd7F0830xRjRSwiIdGqF6dTs6YTq77HxXpwAEfkSQhT4wSHC5scJi
         IBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=8XcW+Wo/nM1qFahuLwpNFrA720iekMJi+CPCK5ZAA8Y=;
        b=cNIBjAHdMgbv7NmEmvbSOGW3Gv7aY8N/vB9RheFXrtvdH9E9RKzacn4uSLaafzngI7
         SU8kFPeroaHJ4deyQnOEs6GIpvqy6Ybbc0syA0Cfs0qsqsrH8P5Amq5WhD2HKz7iiB+O
         l0kIZbxl27s+vY/4qtKQaFspnbq4Xcuusa6bI4zAg7Asz53DIXF7cOe1cqEp598Ew89+
         Vff4wRwl3lvSo2stZZ29Y4eSX34TB4L+lWvhygRYmgaxengkzkJ5mJXikEPJb6PEi6a5
         IU2Tfbtz2Y5Wvuu0r2P5VnBJiBWUPby3SiD0aAcjZ7Dwomr2KW3YGjmjci8jBfSEEivp
         y4gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y1si2581724qta.312.2018.11.09.03.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL5Ec-0007Al-NW
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:45:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50y-0007Op-Ne
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 06:31:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50t-00051p-J1
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 06:31:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46038)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL50Y-0003Pj-Sz; Fri, 09 Nov 2018 06:31:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F629307CDC9;
	Fri,  9 Nov 2018 11:31:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC9255C21F;
	Fri,  9 Nov 2018 11:31:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:57 +0100
Message-Id: <20181109112957.10067-19-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 09 Nov 2018 11:31:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v8 18/18] hw/arm/virt: Allow virtio-iommu
 instantiation
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ssK0+UkOgjb9

The virtio-iommu now can be instantiated by adding the virt
machine option "-M virt,iommu=virtio"

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f2994c4359..d2080a1ba9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1710,6 +1710,8 @@ static char *virt_get_iommu(Object *obj, Error **errp)
         return g_strdup("none");
     case VIRT_IOMMU_SMMUV3:
         return g_strdup("smmuv3");
+    case VIRT_IOMMU_VIRTIO:
+        return g_strdup("virtio");
     default:
         g_assert_not_reached();
     }
@@ -1721,11 +1723,13 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
 
     if (!strcmp(value, "smmuv3")) {
         vms->iommu = VIRT_IOMMU_SMMUV3;
+    } else if (!strcmp(value, "virtio")) {
+        vms->iommu = VIRT_IOMMU_VIRTIO;
     } else if (!strcmp(value, "none")) {
         vms->iommu = VIRT_IOMMU_NONE;
     } else {
         error_setg(errp, "Invalid iommu value");
-        error_append_hint(errp, "Valid values are none, smmuv3.\n");
+        error_append_hint(errp, "Valid values are none, smmuv3, virtio.\n");
     }
 }
 
@@ -1901,7 +1905,7 @@ static void virt_3_1_instance_init(Object *obj)
     object_property_add_str(obj, "iommu", virt_get_iommu, virt_set_iommu, NULL);
     object_property_set_description(obj, "iommu",
                                     "Set the IOMMU type. "
-                                    "Valid values are none and smmuv3",
+                                    "Valid values are none, smmuv3, virtio",
                                     NULL);
 
     vms->memmap = a15memmap;
-- 
2.17.2

