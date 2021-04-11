Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3061847lfr;
        Sun, 11 Apr 2021 05:26:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFz+HedhU95FF8TxEG6+T2FcvSj9SMcgGrEzIF0RAgLjvcNn4hUaIYFE5RaUV+W6s2R8W8
X-Received: by 2002:a05:6602:2b0a:: with SMTP id p10mr17202134iov.129.1618144006338;
        Sun, 11 Apr 2021 05:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144006; cv=none;
        d=google.com; s=arc-20160816;
        b=RPnHotmY6ZP0qYu6Jr1CfYB29aude+JWKds9+h8RaBLgrg+URb9zIXRIJjJYidSKzG
         u6zzwWh4x/DIFyX09CXLOmZXQdbQTUX1BhOGFfTX2x1RvRthMwyIS6HulQ+n0s3jFrfR
         xu+/iq9BbdMJw0kZ/y9UFXCuqLt1qOPj+QBU56I02+7GitA0+NHOVDAkHnTCzxMceFmK
         zBOWacfQAC9J/dShtFArJg51TTfGqtHRjV6yzU8Ga/+LinD7nGdFQWxQPs81ClSH/+Ct
         H076ckkSgWKVXlzvFJ6KW4n39VCkjHLmFD56OEF0ANu23gzmdrWiJl+IsPMaXYe40bIq
         Yw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UjmaWEEt7qlRMC3kWIqCQlxEZSlvg1EOeBnBLhPeB2Q=;
        b=Xd85JGdk196NXUQo4P6fM668F7D2paPkC4QUDV+46datcLyoJ2EyXjx6CYQUBHBh8i
         dvEy2N21H7fPc4fADX52LssJf59WRS9JJKPOD/l/Gef6e3SM6r64gLwMXb5pYkmbaumC
         ET/5wOVtJ9BzYXKCDTXijpRAB7ngpDjw61lXy5vdtXlrY8eQZ8bPlcgzp0Uds2/mrCSG
         hX3oFUlWgm7J5KOYmhvUgxHFfcnCd9QkybNLLAKT8BBpWrRn5LNzHky+1CPH7LsTrFPc
         HvliJTung1EE6LiDeq2j08bhqY9pTSOhQQ+OKJoJ2lJmoTvb+osqJsRbEuS2oU67M+BK
         Gv+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T1W3bg36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si9252721ild.147.2021.04.11.05.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:26:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T1W3bg36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZAr-00050V-MR
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYwb-0001L5-MU
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYwX-0003AT-CL
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjmaWEEt7qlRMC3kWIqCQlxEZSlvg1EOeBnBLhPeB2Q=;
 b=T1W3bg36D3ZIXm4Bq2b3J/b8+m4KaLouodCBLtfYpJqaMXa98gSEQtjHVson1c14wRWjjz
 LmCTKshw5V5e8VSeDzhe5UA7OZQl5313KPIVQV5RQ/WbAQq/X/hJDgITjavK88s0uSnTMb
 uiYEfAxtDOMZoAr2t5Nod+YbnT7qOyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-vZevjbb7OheHsy8Qzx2S8Q-1; Sun, 11 Apr 2021 08:11:52 -0400
X-MC-Unique: vZevjbb7OheHsy8Qzx2S8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2D0310053E8;
 Sun, 11 Apr 2021 12:11:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88FA4101E24A;
 Sun, 11 Apr 2021 12:11:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 12/29] vfio: Force nested if iommu requires it
Date: Sun, 11 Apr 2021 14:08:55 +0200
Message-Id: <20210411120912.15770-13-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zNKS3R7p3EqV

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
index a456455517..30dc45df90 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1579,27 +1579,38 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
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
@@ -1704,6 +1715,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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
 
@@ -1773,13 +1792,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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
2.26.3

