Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1230039njm;
        Mon, 1 Jul 2024 01:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1uNqZHzP2N8mXugGzVa8vZ0J53qOHyaL4+BciE9kQGTLwpcean22XMLFx10+UndirAvRm5hutZ86zARFV2Fmf2+VwSELU
X-Google-Smtp-Source: AGHT+IFIuoCmfPJK4zHZ7IFSsdOkkzp5f9FQGLTVdc/38scVPO9XWQhma4bNUjETyeiFl+HHUJXA
X-Received: by 2002:a05:620a:2fa:b0:79d:780d:ae32 with SMTP id af79cd13be357-79d7b9fd773mr465833785a.35.1719823993249;
        Mon, 01 Jul 2024 01:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719823993; cv=none;
        d=google.com; s=arc-20160816;
        b=h/1ahIcBpQ9X0YOf0YAGW4i0NgaDYmpcIbgLxHigw7wGWBNFIPvyRwyWlg16K9ZfER
         Chb5npIX3K83fZJflv3OqZq2DOh6xuJ4tFW8ZU7pTv8GNYZNQbEmIBg+g1Xg583+UsiJ
         6tbgfFJvBPhi+wYSzc1hHtT0FEZpTvJYjOI4x1ZclKFAX0TS+c/ZmgKiJlQje0Xiecpx
         Up3xtfQDKwHypRYEp7IHDpccsGQv5re+QSW+q9DrrsSvIoOUoZ3HqvxKHuL0foppgzvO
         QfKWfSpsfhDwjOgSDaC8g9+8uqpL05nHVG57gn8PuPP+Yx7hZ2FErXxDqG6O2V22fKGG
         2EiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FLOs2MLWeFfGVRFiNyOnYfkh03vw78pTCpOtytRgy10=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=QZQdiytYvY3oR32wlt4FyUQ+a8hmaUmggfe0kUlhJ67BK+S20m+sWlf2ppX74UYHRw
         co1zQ/m84dWqmwIzfEznNfcHHoxXHJ+o9n6Te8FE0fK0/7AeGzJh+v9QEb/F/WkuABw6
         dZB3E0a4nRN5NVfKZuKVwh3ihyZM+JVN1TERjRwxuLgfxg9+fCwKp7oLSVm4f86scSje
         yh28yHYZrG+Afb30UxZZnyVqIgyR/moB88c61py3os+8GSZAxMO37fGiqJOgr0dAVubl
         IYYjTsYKDElKsNhEQ+Lv8DilmynYQgRHLHwUjojELwaOS4Qd3G0S70+32KzW2PdCVKeO
         qa7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IXjY1dSJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69260d4asi727750885a.76.2024.07.01.01.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 01:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IXjY1dSJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOClm-00061D-Fh; Mon, 01 Jul 2024 04:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCkG-0003oT-KY
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 04:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCkD-0005ak-Rt
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 04:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719823840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLOs2MLWeFfGVRFiNyOnYfkh03vw78pTCpOtytRgy10=;
 b=IXjY1dSJcWDTHUzc+IcrjktsmkOKWl5ZHpe6o4NdUjgEGVXYLZ4UfjAO7fiwrx/uNepsgu
 Hdl/M4hz4WmKMpesMeF4qUcIFCPzZV+EaT2WQ70KoCd1owhQTE++PdpWdV8DkpiqMV+8r1
 FiMbRYEUGZaNbcMYdLkbiR5j8inWrcs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-pGNGqp9TO1CkJC1Yzj2Yow-1; Mon,
 01 Jul 2024 04:50:37 -0400
X-MC-Unique: pGNGqp9TO1CkJC1Yzj2Yow-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 70105196CDCA; Mon,  1 Jul 2024 08:50:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.22.9.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 48F951956089; Mon,  1 Jul 2024 08:50:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH v2 7/7] virtio-iommu: Revert transient enablement of IOMMU MR
 in bypass mode
Date: Mon,  1 Jul 2024 10:48:59 +0200
Message-ID: <20240701084957.1567641-8-eric.auger@redhat.com>
In-Reply-To: <20240701084957.1567641-1-eric.auger@redhat.com>
References: <20240701084957.1567641-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f8NMD/9aWSXu

In 94df5b2180d6 ("virtio-iommu: Fix 64kB host page size VFIO device
assignment"), in case of bypass mode, we transiently enabled the
IOMMU MR to allow the set_page_size_mask() to be called and pass
information about the page size mask constraint of cold plugged
VFIO devices. Now we do not use the IOMMU MR callback anymore, we
can just get rid of this hack.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index dc337a6805..72011d2d11 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1387,18 +1387,6 @@ static void virtio_iommu_freeze_granule(Notifier *notifier, void *data)
     VirtIOIOMMU *s = container_of(notifier, VirtIOIOMMU, machine_done);
     int granule;
 
-    if (likely(s->config.bypass)) {
-        /*
-         * Transient IOMMU MR enable to collect page_size_mask requirements
-         * through memory_region_iommu_set_page_size_mask() called by
-         * VFIO region_add() callback
-         */
-         s->config.bypass = false;
-         virtio_iommu_switch_address_space_all(s);
-         /* restore default */
-         s->config.bypass = true;
-         virtio_iommu_switch_address_space_all(s);
-    }
     s->granule_frozen = true;
     granule = ctz64(s->config.page_size_mask);
     trace_virtio_iommu_freeze_granule(BIT_ULL(granule));
-- 
2.41.0

