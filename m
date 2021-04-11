Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3061880lfr;
        Sun, 11 Apr 2021 05:26:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9TAd+FSxjrAffzEnm2aVh0kfAOp0s2B2c+htJaa8YvspbVOyG4Oq7uytYCFSm0sWTMcSd
X-Received: by 2002:a05:620a:c0d:: with SMTP id l13mr22092644qki.234.1618144010988;
        Sun, 11 Apr 2021 05:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144010; cv=none;
        d=google.com; s=arc-20160816;
        b=LXA7wXcwxGNWDof8Umz+43GOiyOlaA+FEg4g/C5k5oyBoEuToXLGFv4DxP5+MGOv2t
         VbuBbsnF2IkM2LTCrzKCZtPdNv05nH7bl5Y03mdNRkQelZXBjeCi32NZPy3SOHGKenZT
         2RSbWFdjIfmUiFFOav5sPhDBgl/Y3+6Jv8XlVGfDNf2ccyKrqPf8zTtxUhsfJCfDDkdh
         UwiEsfxBrhdNUC6ePW9EhfgZXuxyei9NxsAcwAvuvsS17Vt4I2fKyAmk6o8y6jjp+8yH
         FxTnalNKomKUFPPxeDbXCg0kwyyZTxZ9kF5/ILDzMee0XAcoU9pU5hil6R3DKEd1DwEx
         i6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vzFFARhTRk7vbABRgAQy0KHnzfSy3mlZzdXETML+AE0=;
        b=DbT8JomoiCtAzkQ5HPn9GbcwwOsM0TGjarlKtARZY7nzcuUv0YfpkYrzeNDmrHA/nS
         dDh9tZPFEbD5PxxDTq5wCIco8TZMVsnQq2+pSmNBE2TwT018QtEpW1tycTdSISTyaMHt
         1yTEBb+obotgaSWXhrVvIcOPNHI8n7qK9bFFUldcq9PMQwrSGROVPMydC35HvZxAKeiJ
         1jcElOZIjaH8CV6QAV4P2ypedDLt+DZKwwYkllJNECfAPEu1zOko4RPTz3m5qics4TLL
         IhmNXoTDSrXS3f83ICeayAZfZFW1oebNulKzq5JGJ1H4PcdkTuKOXckszX732dD1/mzP
         ebyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UrK9CoCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si6804328qvt.151.2021.04.11.05.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:26:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UrK9CoCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZAw-0005El-92
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYwi-0001Nc-1N
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYwb-0003CN-CR
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vzFFARhTRk7vbABRgAQy0KHnzfSy3mlZzdXETML+AE0=;
 b=UrK9CoCU0j+hVoELCsFDvV61jYTzLiEzx8qaJczfb1x3M32XmtWMAgbiSOC0hmtqdG7ssS
 ouQROd3y46NwPYa9qpp9aLJq7mfIpUcxWpeYOefOk+A1eW66EtXfkFF+KjgEH4WtGyfsGB
 fle0/nrNPWZTr7L/hJk0FWaR4D+0I0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-oFsvFP7oOY2TsrM89r8BYw-1; Sun, 11 Apr 2021 08:11:58 -0400
X-MC-Unique: oFsvFP7oOY2TsrM89r8BYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF246107ACE8;
 Sun, 11 Apr 2021 12:11:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 622B310023B2;
 Sun, 11 Apr 2021 12:11:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 13/29] vfio: Introduce hostwin_from_range helper
Date: Sun, 11 Apr 2021 14:08:56 +0200
Message-Id: <20210411120912.15770-14-eric.auger@redhat.com>
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
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5t3zJZp6VRyn

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if none is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 30dc45df90..a8f835328e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -649,6 +649,19 @@ out:
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
@@ -658,7 +671,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
     Error *err = NULL;
 
     if (vfio_listener_skipped_section(section)) {
@@ -744,15 +756,8 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
2.26.3

