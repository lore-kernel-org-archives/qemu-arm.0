Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3933874lfb;
        Mon, 16 Nov 2020 10:22:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuuGCHQSX5LtADE1lWOaSCDOAX1aWbjq3L35UcSYLXj9s9t+sCNYmQ4j0ooB5iZtWVJ6wV
X-Received: by 2002:a25:7717:: with SMTP id s23mr24428513ybc.459.1605550930106;
        Mon, 16 Nov 2020 10:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550930; cv=none;
        d=google.com; s=arc-20160816;
        b=upZXNRicOuYI/hnOfKNMq3vNARPrNLw8KAqqrAz1H7DCyh71WMH/HafT+k1UXzhB3U
         txVyoqqp+503yPP9eeM5XzI+oIB40Pwr8XtLvTgMwjkZJlucOntQ4hkMD8oZQ2Es5Kp6
         xTmlTpmkzohy8yv9R+uVizOEqnNQL6y9nZlR5ntapG8kQIsKfV4cOdD5hao3YyoQLM9o
         ov6Buza6UG6l2mPKRet9Bc6/Qb0ZSinPhy9HpqmEYJ9f2b/h4cqslpTrJhJuvbYmcGhR
         nfsihENAqUwht3+wwdCVJHTfXTnyrYlroGg2IIcYpzPHdQmr70XOvUVIOI0lMN2LsFXC
         BzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N6FUJOFeFVmjyvgOrkQ0SdP5+HAU8FjRFCriN0nDhJo=;
        b=bYb/Bp8+u6YAN42BsnL6o4RMji8eVleksHV+rGjxXyfhnQFx3HpVROrl7KlnkrBLqu
         d2M6GXcocNDknM7Q+puDdnGHN2mU9svuCOIv53RRnHCQl2lLG5b1yourDQ4edflvlL2M
         aJ0ivLqVM8/Kc7lMRbzNH0Ami+oGPGNgGOztn3kHJ175tSC1zBkdgG0mehW1nHcOVyfP
         S+ad0tAxnW/ygqrdsCFMddyadXqqTF96LgI49dHuhS0ey4RuTVcBeR9Y/q3YBywXNCPj
         CLigLptQO4UcsjaihrKgg0L0ilXGlxqzrfx6y9QT+LZfAN0ApSMYBu8zbnsLidXXi6md
         aPjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OIgr3Dxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si8829426ybc.168.2020.11.16.10.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:22:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OIgr3Dxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej8j-0008TA-BZ
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej2k-0000gk-JL
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:15:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej2h-0001D0-HE
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6FUJOFeFVmjyvgOrkQ0SdP5+HAU8FjRFCriN0nDhJo=;
 b=OIgr3DxeT284ON2XvwXKd30RmgdNvHbhSyrnCJxCakbhW+/nufTmQi0mn5mBPemUW6QtnR
 Jy4od8K3XUcD4GViSXod/RKzjMdwWPuC0m2YruGUHnrCASgLMVeGSR+ZB9h/D/FfJ+IZ2O
 tymRp3P3BgFeDTf14tB+ZwijkznGRAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-r21mW5YgO3K06icuj_7_PA-1; Mon, 16 Nov 2020 13:15:50 -0500
X-MC-Unique: r21mW5YgO3K06icuj_7_PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2EFC1017DD3;
 Mon, 16 Nov 2020 18:15:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD1195C1CF;
 Mon, 16 Nov 2020 18:15:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 10/26] vfio: Introduce hostwin_from_range helper
Date: Mon, 16 Nov 2020 19:13:33 +0100
Message-Id: <20201116181349.11908-11-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /FHzlBbrLUBl

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if none is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 80c68c0446..18e8aa0d56 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -651,6 +651,19 @@ out:
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
@@ -660,7 +673,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
     Error *err = NULL;
 
     if (vfio_listener_skipped_section(section)) {
@@ -745,15 +757,8 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
@@ -934,16 +939,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
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
2.21.3

