Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp261011lfg;
        Thu, 25 Feb 2021 03:25:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt2/1+oau0qhzE3zDFSaHwL+IyBY8eYjVWV9k86VvWh9q7t+Gl/JOGg8MXRmgIgoOelNX+
X-Received: by 2002:a05:6e02:2196:: with SMTP id j22mr2040719ila.64.1614252340532;
        Thu, 25 Feb 2021 03:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614252340; cv=none;
        d=google.com; s=arc-20160816;
        b=cSVIFnXeKKe0uvWfIRdUWULvQeisIk+tjjF2YBnT48blL7yRJSXf2l0BaWUk5+o5aB
         1S91rZOKCIOg2J1p4drR3OoA0mfIaA+vLoP31YxWNhkSm2NxOCA9je8ACl+pwLB45VCZ
         ic4+hKxe4VnN++Kr9bdSYRWd4xydCgbqxdCW6rEVzkBSZQKdG1cNupr9KY0+Dm8QM6pL
         ElN5DzVpCBQ9HlTK1JF7cMrqHRjLIH+TxcJvM65R115yAfHJHTyP8z+kJRpSTewZRjCw
         u8qM5BHW2r09h8eSVZn2/rKpUpiZNOZxbzIiojSaeZMjZFl8RZ5ey+mo7Ywu8UpjjHhT
         11YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=68SIX7vSpqajc9v6uhioAym7OJ2G0vlwTFl/KMwt4FQ=;
        b=0IhfTuHIw2ntxH/NuiLH4mo9aXZAFQmQy8LJCfxuNsrNCrswEa1NxyTd1zQQd/OpG1
         eO46mSbIbaW7VB4AlFZYFU0IYwunhuUcyQv3xWki2+X+jxpsCzPeCuMqlKmsWQjoPZ8Z
         j4C2+GHSB8yq4QSBg5APEJJdSydhoeu72kj/apYc/GLGzbLQgtk/VfnOyH3Q7QCpgdpq
         bTPltXIB2pNJpHYL/h8UW02jkU1McjWirM9upPfUAIDAGzf63Jm5xiV5zf96RBuoC03r
         SO4/hCreLqLrLJiSfvFgWsybGaD14ss9a/1ohJcG53vMyDEwFCiS4H4ODnWh5EgB9rxx
         8wWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q9rQIVr8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si4141166ilj.34.2021.02.25.03.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q9rQIVr8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEm3-0000zh-SL
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIV-00080w-Ir
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIT-0005YE-Qv
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68SIX7vSpqajc9v6uhioAym7OJ2G0vlwTFl/KMwt4FQ=;
 b=Q9rQIVr80xSR0qq0CdP+u7FAjHX1whDCkq+oUTxzxk5PGTKq4R9FPYNC1wnWRxVGK9t0dq
 jeiO/JxpTmFf0x1RiUJanvxC82d1q7TddBExgbB2HpKettXiacPhXDQhohCg6Ldw4dw2hX
 AhPWrfCCTK0qfKJoM4CRUhYTZiIDtRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-wdj5JS5OMqi-029LCfYRnQ-1; Thu, 25 Feb 2021 05:55:03 -0500
X-MC-Unique: wdj5JS5OMqi-029LCfYRnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C44B1E1C;
 Thu, 25 Feb 2021 10:55:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C82B15D9D7;
 Thu, 25 Feb 2021 10:54:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 11/28] vfio: Force nested if iommu requires it
Date: Thu, 25 Feb 2021 11:52:16 +0100
Message-Id: <20210225105233.650545-12-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VjOrWxkGwih5

In case we detect the address space is translated by
a virtual IOMMU which requires HW nested paging to
integrate with VFIO, let's set up the container with
the VFIO_TYPE1_NESTING_IOMMU iommu_type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8
- remove as != &address_space_memory as
  memory_region_is_iommu(as->root) is sufficient [Kunkun]

v4 -> v5:
- fail immediatly if nested is wanted but not supported

v2 -> v3:
- add "nested only is selected if requested by @force_nested"
  comment in this patch
---
 hw/vfio/common.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fcf2c5049f..04e5699ccf 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1546,27 +1546,38 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
  * vfio_get_iommu_type - selects the richest iommu_type (v2 first)
  */
 static int vfio_get_iommu_type(VFIOContainer *container,
+                               bool want_nested,
                                Error **errp)
 {
-    int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
+    int iommu_types[] = { VFIO_TYPE1_NESTING_IOMMU,
+                          VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
                           VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU };
-    int i;
+    int i, ret = -EINVAL;
 
     for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
         if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
-            return iommu_types[i];
+            if (iommu_types[i] == VFIO_TYPE1_NESTING_IOMMU && !want_nested) {
+                continue;
+            }
+            ret = iommu_types[i];
+            break;
         }
     }
-    error_setg(errp, "No available IOMMU models");
-    return -EINVAL;
+    if (ret < 0) {
+        error_setg(errp, "No available IOMMU models");
+    } else if (want_nested && ret != VFIO_TYPE1_NESTING_IOMMU) {
+        error_setg(errp, "Nested mode requested but not supported");
+        ret = -EINVAL;
+    }
+    return ret;
 }
 
 static int vfio_init_container(VFIOContainer *container, int group_fd,
-                               Error **errp)
+                               bool want_nested, Error **errp)
 {
     int iommu_type, ret;
 
-    iommu_type = vfio_get_iommu_type(container, errp);
+    iommu_type = vfio_get_iommu_type(container, want_nested, errp);
     if (iommu_type < 0) {
         return iommu_type;
     }
@@ -1671,6 +1682,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    IOMMUMemoryRegion *iommu_mr;
+    bool nested = false;
+
+    if (memory_region_is_iommu(as->root)) {
+        iommu_mr = IOMMU_MEMORY_REGION(as->root);
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&nested);
+    }
 
     space = vfio_get_address_space(as);
 
@@ -1740,13 +1759,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
 
-    ret = vfio_init_container(container, group->fd, errp);
+    ret = vfio_init_container(container, group->fd, nested, errp);
     if (ret) {
         goto free_container_exit;
     }
     trace_vfio_connect_new_container(group->groupid, container->fd);
 
     switch (container->iommu_type) {
+    case VFIO_TYPE1_NESTING_IOMMU:
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
-- 
2.26.2

