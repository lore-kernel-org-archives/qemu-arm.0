Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1276772lfq;
        Fri, 25 Sep 2020 06:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxweKRS85F1bNXpYXWAtqm2+YDMY8iXMdqwi43fWg8x7hXrfMrH73kD9qYC3wnsqXlaVSy8
X-Received: by 2002:a25:3146:: with SMTP id x67mr5703523ybx.381.1601041863645;
        Fri, 25 Sep 2020 06:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601041863; cv=none;
        d=google.com; s=arc-20160816;
        b=xtIppqy91NVKe762McqUBjNsvpbsij0KPtMNA8xctyquzO7cIV/Dbs77zqKDn7D5ff
         9o/cMaHoN06wI3ziBcPCgN8Y8hSHUAuAuT3IXZCCv3Z4SkQ+33adn8QRfXgDA+GxY1B+
         WPQGiBl0f4+CqlWeC6uB1Dk0CG4UGZt2R604HPNB6Peavxl3cIABz8KKVmg+keSlIh+h
         7OegEzHDFrkKUqG8zMsd7RGTGbWPCXCANZnzE3LvbQb/6A+XWhbPnsDfT38tV74s525J
         0imIerXv5BH+HwETH/18UawM6KO8bbTO6/8H59oVGVVNbtkSK9oWILxy0FuRsDoAsxlA
         4P9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MhsjaAvcc2A8rxRwS3aD1ncZ7PrT1QP4PmosGTDO3t8=;
        b=N5DvaFW1ZCmbxZYdeu3YyOw5Fno7APm2Ki1L+r2b7R+Cy00E1LNJBEyVR9eNk40Mvz
         o33P84CnAW0xSFQsq03Oor4u/982FOj/EedcOgVWHdnjCrOEfim0tTemk7iYkOC8f3kp
         pM/oRJ+Nu4B9QNewCc/huafE/EkTxrzdvdFQQGsQuxfM2z1XwCLq6oP9yzqpt3Kw+ElF
         GHyws0hNVCe035+g3g/JcWWXQUJ/9yO7nAEsYoxcLNVfuWPg+JaCdAuJuCQxLxrCuUSk
         Ms+HOP1fEeSMGq/ayG5cTDdZ1TvyqRdfZJ03jR03CGi8EvFu21AhOBSaRVb4DWSkjutE
         VKgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MfHEKkxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si3287628ybc.225.2020.09.25.06.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 06:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MfHEKkxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLo7r-0004Xk-28
	for alex.bennee@linaro.org; Fri, 25 Sep 2020 09:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLo69-0002ZQ-NB
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 09:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLo67-0000l8-Iq
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 09:49:17 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601041751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhsjaAvcc2A8rxRwS3aD1ncZ7PrT1QP4PmosGTDO3t8=;
 b=MfHEKkxNkuLrZve9tO+3ivk5KhVeSqle9Fe7Wvn+AF4Edy5MgJLG+jAkm5Ba7W3p8r1LIc
 dunyc3GlgvrXOIeL3XQXsuobTYccYWJuBUT2et4tz4mSJGeGNue81ZfKE3z3braO2qc+3y
 z5UvHkFRv56gU1QPP+Dr9kIA0jRjUvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-eiyasU3IM82UTT2iBI4_eA-1; Fri, 25 Sep 2020 09:49:10 -0400
X-MC-Unique: eiyasU3IM82UTT2iBI4_eA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2417881F00F;
 Fri, 25 Sep 2020 13:49:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF625D9DC;
 Fri, 25 Sep 2020 13:49:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [RFC 2/3] util/vfio-helpers: Dynamically compute the min/max IOVA
Date: Fri, 25 Sep 2020 15:48:44 +0200
Message-Id: <20200925134845.21053-3-eric.auger@redhat.com>
In-Reply-To: <20200925134845.21053-1-eric.auger@redhat.com>
References: <20200925134845.21053-1-eric.auger@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:07:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, kwolf@redhat.com, cohuck@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GGq6ekpeGLuy

Currently the min/max IOVA are hardcoded to [0x10000, 1 << 39].
Now we dynamically fetch the info from VFIO, if the kernel supports
it, let's use the dynamically retrieved value.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 util/vfio-helpers.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 8e91beba95..567bcf1ded 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -26,11 +26,11 @@
 
 #define QEMU_VFIO_DEBUG 0
 
+/*
+ * Min/Max IOVA addresses, only used if VFIO does not report
+ * the usable IOVA ranges
+ */
 #define QEMU_VFIO_IOVA_MIN 0x10000ULL
-/* XXX: Once VFIO exposes the iova bit width in the IOMMU capability interface,
- * we can use a runtime limit; alternatively it's also possible to do platform
- * specific detection by reading sysfs entries. Until then, 39 is a safe bet.
- **/
 #define QEMU_VFIO_IOVA_MAX (1ULL << 39)
 
 typedef struct {
@@ -56,6 +56,8 @@ struct QEMUVFIOState {
     struct vfio_region_info config_region_info, bar_region_info[6];
     struct IOVARange *usable_iova_ranges;
     uint8_t nb_iova_ranges;
+    uint64_t max_iova;
+    uint64_t min_iova;
 
     /* These fields are protected by @lock */
     /* VFIO's IO virtual address space is managed by splitting into a few
@@ -63,7 +65,7 @@ struct QEMUVFIOState {
      *
      * ---------------       <= 0
      * |xxxxxxxxxxxxx|
-     * |-------------|       <= QEMU_VFIO_IOVA_MIN
+     * |-------------|       <= min_iova
      * |             |
      * |    Fixed    |
      * |             |
@@ -75,20 +77,20 @@ struct QEMUVFIOState {
      * |             |
      * |    Temp     |
      * |             |
-     * |-------------|       <= QEMU_VFIO_IOVA_MAX
+     * |-------------|       <= max_iova
      * |xxxxxxxxxxxxx|
      * |xxxxxxxxxxxxx|
      * ---------------
      *
-     * - Addresses lower than QEMU_VFIO_IOVA_MIN are reserved as invalid;
+     * - Addresses lower than min_iova are reserved as invalid;
      *
      * - Fixed mappings of HVAs are assigned "low" IOVAs in the range of
-     *   [QEMU_VFIO_IOVA_MIN, low_water_mark).  Once allocated they will not be
+     *   [min_iova, low_water_mark).  Once allocated they will not be
      *   reclaimed - low_water_mark never shrinks;
      *
      * - IOVAs in range [low_water_mark, high_water_mark) are free;
      *
-     * - IOVAs in range [high_water_mark, QEMU_VFIO_IOVA_MAX) are volatile
+     * - IOVAs in range [high_water_mark, max_iova) are volatile
      *   mappings. At each qemu_vfio_dma_reset_temporary() call, the whole area
      *   is recycled. The caller should make sure I/O's depending on these
      *   mappings are completed before calling.
@@ -271,6 +273,8 @@ static void collect_usable_iova_ranges(QEMUVFIOState *s, void *first_cap)
         s->usable_iova_ranges[i].start = cap_iova_range->iova_ranges[i].start;
         s->usable_iova_ranges[i].end = cap_iova_range->iova_ranges[i].end;
     }
+    s->min_iova = s->usable_iova_ranges[0].start;
+    s->max_iova = s->usable_iova_ranges[i - 1].end + 1;
 }
 
 static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
@@ -362,12 +366,14 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
 
     /*
      * if the kernel does not report usable IOVA regions, choose
-     * the legacy [QEMU_VFIO_IOVA_MIN, QEMU_VFIO_IOVA_MAX -1] region
+     * the legacy [QEMU_VFIO_IOVA_MIN, QEMU_VFIO_IOVA_MAX - 1] region
      */
     s->nb_iova_ranges = 1;
     s->usable_iova_ranges = g_new0(struct IOVARange, 1);
     s->usable_iova_ranges[0].start = QEMU_VFIO_IOVA_MIN;
     s->usable_iova_ranges[0].end = QEMU_VFIO_IOVA_MAX - 1;
+    s->min_iova = QEMU_VFIO_IOVA_MIN;
+    s->max_iova = QEMU_VFIO_IOVA_MAX;
 
     if (iommu_info->argsz > iommu_info_size) {
         void *first_cap;
@@ -484,8 +490,8 @@ static void qemu_vfio_open_common(QEMUVFIOState *s)
     s->ram_notifier.ram_block_added = qemu_vfio_ram_block_added;
     s->ram_notifier.ram_block_removed = qemu_vfio_ram_block_removed;
     ram_block_notifier_add(&s->ram_notifier);
-    s->low_water_mark = QEMU_VFIO_IOVA_MIN;
-    s->high_water_mark = QEMU_VFIO_IOVA_MAX;
+    s->low_water_mark = s->min_iova;
+    s->high_water_mark = s->max_iova;
     qemu_ram_foreach_block(qemu_vfio_init_ramblock, s);
 }
 
@@ -734,7 +740,7 @@ int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s)
         .argsz = sizeof(unmap),
         .flags = 0,
         .iova = s->high_water_mark,
-        .size = QEMU_VFIO_IOVA_MAX - s->high_water_mark,
+        .size = s->max_iova - s->high_water_mark,
     };
     trace_qemu_vfio_dma_reset_temporary(s);
     QEMU_LOCK_GUARD(&s->lock);
@@ -742,7 +748,7 @@ int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s)
         error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
         return -errno;
     }
-    s->high_water_mark = QEMU_VFIO_IOVA_MAX;
+    s->high_water_mark = s->max_iova;
     return 0;
 }
 
-- 
2.21.3

