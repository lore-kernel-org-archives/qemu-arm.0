Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp245795lfg;
        Thu, 25 Feb 2021 03:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDb2BAefUNJIlzvUgmflpw6Ok4x524JYv320jevQn1FD5v9bM7VRPq3bYwaSJujHJQpBB6
X-Received: by 2002:a05:6638:3389:: with SMTP id h9mr2576912jav.65.1614251085242;
        Thu, 25 Feb 2021 03:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251085; cv=none;
        d=google.com; s=arc-20160816;
        b=BvxawwTxT39v7J8b4EvkKc3+SwNu9MvhIePJLqsZuhQiIA3EP88hsUosNuRI+zFt4m
         hQL5YRzlGMKSxRx7jOjtklKlc8S68zemWjdyAv4c+aUxsMO1II/QixtrMFCQwEHWowcI
         +lOXoVkceMeJvSSewhtoh/QaDJDUTV7aPWO4TwIiFoQ4c3K/znVF4AS/LgUOP8CGFN3d
         ZhbLyCiNjDA52+xd0rQT4BNaXApdR/J71TAbEMtBrtXWeQ4q+a9c3hBNaDGYB6eBehzl
         FI79lelpt0IUSBG2pNMvwxZjiRT6I+f04fo03nB6ZmwoQWJzbEwQl/yW3X+O671qNzOa
         vwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+fwNgmUDPwiTtrEKJwI2UcxLU6TRzhkx/m6f44PZAy0=;
        b=pcI+eFWiG2sS0AC8EtzGbOsPKS/bbi9G4vE/DrXyobfkvo/UdlgXLSPRKFWuvX2bRS
         9mKh07Tc7AW0Y7Gr3sPPZBVV3UcqVpVW1EQm1hXLlOwd4QxLxLC35hSLsmeV3CjJ/XKQ
         9fO+OdQiFrF/pjpHCperinycIXJRAjqsiDQ80NQE4kYAgaOR6UinFJumQ04pqk7iz/ha
         GSmT70bPIsV2LfQvEQYt+hXSlK+Wqv9shlJNmOuZnk3lbnzBN4f+Od2icKUyl9s3j1Ek
         9XK8HBoJKTwuzjeSmE+vwcinN3nbbzKsb5hVVRkY6emvPxGR8JcNd/TBL/qop3ZlSjqj
         5uOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wk+zOBno;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si5258814ile.47.2021.02.25.03.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wk+zOBno;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFERo-00047P-HL
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIm-00008M-Q3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:55:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEIl-0005em-4s
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fwNgmUDPwiTtrEKJwI2UcxLU6TRzhkx/m6f44PZAy0=;
 b=Wk+zOBnoMM0Go0E+TDNeA5k1dh1EGVOMjW2W/sCh093vSEJXIaRedt6qsHnLCkxrhO9sC3
 aBADm92GJTruDpMC0DsvGD+hmiGMmS9c6f4GU+U2s+DC4Oqp2GFIh5N1PStWUvL1IfmQqD
 x6Gs43JkE2XS1HonWkOdAxYBrAn472U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-ZQgUJbSzNUuchLzk4iBxSw-1; Thu, 25 Feb 2021 05:55:20 -0500
X-MC-Unique: ZQgUJbSzNUuchLzk4iBxSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989AD80402C;
 Thu, 25 Feb 2021 10:55:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09B485D9D7;
 Thu, 25 Feb 2021 10:55:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 12/28] vfio: Introduce hostwin_from_range helper
Date: Thu, 25 Feb 2021 11:52:17 +0100
Message-Id: <20210225105233.650545-13-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EYWhV3uG+gHO

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if none is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 04e5699ccf..7d3c35a0ed 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -654,6 +654,19 @@ out:
     rcu_read_unlock();
 }
 
+static VFIOHostDMAWindow *
+hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
+{
+    VFIOHostDMAWindow *hostwin;
+
+    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
+        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
+            return hostwin;
+        }
+    }
+    return NULL;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -663,7 +676,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
     Error *err = NULL;
 
     if (vfio_listener_skipped_section(section)) {
@@ -748,15 +760,8 @@ static void vfio_listener_region_add(MemoryListener *listener,
 #endif
     }
 
-    hostwin_found = false;
-    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
-            hostwin_found = true;
-            break;
-        }
-    }
-
-    if (!hostwin_found) {
+    hostwin = hostwin_from_range(container, iova, end);
+    if (!hostwin) {
         error_setg(&err, "Container %p can't map guest IOVA region"
                    " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
         goto fail;
@@ -937,16 +942,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
     if (memory_region_is_ram_device(section->mr)) {
         hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin;
-        bool hostwin_found = false;
+        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
 
-        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-            if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
-                hostwin_found = true;
-                break;
-            }
-        }
-        assert(hostwin_found); /* or region_add() would have failed */
+        assert(hostwin); /* or region_add() would have failed */
 
         pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
         try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
-- 
2.26.2

