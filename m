Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3931410lfb;
        Mon, 16 Nov 2020 10:18:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7rZCOOk0VF8wBEjl+UYAAusd2n8NmSSOnW4giybiCnzlJQRLZ8/K8YaZ+Mv0zB5VRcMKE
X-Received: by 2002:a5b:74f:: with SMTP id s15mr20763094ybq.11.1605550738539;
        Mon, 16 Nov 2020 10:18:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550738; cv=none;
        d=google.com; s=arc-20160816;
        b=mFjW2CLI12xftFYM5oanUzHp77+pqfNMbvvn6ExYRuP4P6kOtd1IYZDuoJBqXmivPi
         G5upP6ONXx9LpuGiEkbW+HZqaE4WJT4c3K6XuayxtjE+SwFf6c2T1Qh3Etf5nAHQBV0r
         FfhzXD1MhSA6QNAAu0qKo985pjw14G9L7XVBI1zWO34Hv/QDXDnAuVLJ+q1UtVXbbinj
         Idx9hcBpFacF+p7mhaIRGlD53YqhWYHju2O7UZVYlIi9WB7PB20QCC4YTgbCJBkG+x1R
         W2QtvN4AHzH2DTrNIiSi5r6ck5E9YIgcislAkSnqE2DFb0a0D5um62fqd6Sim4OTqg7s
         sSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=86xeRISBElX6LZh7Ud5xSXELkhDu63Yaetysf8HUjm8=;
        b=URUA7qf6nFIEDTeX6acUBGCqdbshdl51UNuIw76sGNL5VviTEIPDigMLckzumwhC8z
         7x0gxigmse/9+o1B5cK6q7Oobd5v1rbm2URw83ZLE8wzIdqOskzFRfsAO7sE1h5GPH1T
         fkx6Jf01WQ5epvm0WtGh8g9n3JBrz64hTlL27mg/tmUJLENG4RZD8D03bbreuDMBgs6J
         ZYDGJNCr63iDpE0rfAv0grNJj3CFJE+ftd8XYaasuV8I5OQO6Ttl43mfLTe45+IJT0Ac
         NrepowDOY6TBBcQvhuHarSE0RJwo+wuhkilNGuPelxFD+Lh4kMyIKCsyY0heHmTSYipI
         lkVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pf3qeQo8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si8412388ybq.304.2020.11.16.10.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:18:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pf3qeQo8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej5d-0004I8-SP
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej2L-0000L5-0e
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:15:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej2I-00012R-Qs
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86xeRISBElX6LZh7Ud5xSXELkhDu63Yaetysf8HUjm8=;
 b=Pf3qeQo8eej6ztCIQDdbkYzCXSys7zTt0rSP5IKFpQnpZ5X1r3De89iYbUgn6oDKdeSWZp
 yUALA/NYILSczSO5aerIPGZzVmnGbPrqxT35zw1Byo7omyk0DfgSbupUueDLXGc09r5E+0
 SdWC3jd9WyLyK4xCyiu3AC27EUy509I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-jJohAIVFOMSQPp7JHi4mKA-1; Mon, 16 Nov 2020 13:15:28 -0500
X-MC-Unique: jJohAIVFOMSQPp7JHi4mKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F1F1882FA1;
 Mon, 16 Nov 2020 18:15:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEBE95C1CF;
 Mon, 16 Nov 2020 18:15:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 09/26] vfio: Force nested if iommu requires it
Date: Mon, 16 Nov 2020 19:13:32 +0100
Message-Id: <20201116181349.11908-10-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWcZApTWmH7a

In case we detect the address space is translated by
a virtual IOMMU which requires HW nested paging to
integrate with VFIO, let's set up the container with
the VFIO_TYPE1_NESTING_IOMMU iommu_type.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- fail immediatly if nested is wanted but not supported

v2 -> v3:
- add "nested only is selected if requested by @force_nested"
  comment in this patch
---
 hw/vfio/common.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c1fdbf17f2..80c68c0446 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1543,27 +1543,38 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
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
@@ -1668,6 +1679,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    IOMMUMemoryRegion *iommu_mr;
+    bool nested = false;
+
+    if (as != &address_space_memory && memory_region_is_iommu(as->root)) {
+        iommu_mr = IOMMU_MEMORY_REGION(as->root);
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&nested);
+    }
 
     space = vfio_get_address_space(as);
 
@@ -1735,12 +1754,13 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
 
-    ret = vfio_init_container(container, group->fd, errp);
+    ret = vfio_init_container(container, group->fd, nested, errp);
     if (ret) {
         goto free_container_exit;
     }
 
     switch (container->iommu_type) {
+    case VFIO_TYPE1_NESTING_IOMMU:
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
     {
-- 
2.21.3

