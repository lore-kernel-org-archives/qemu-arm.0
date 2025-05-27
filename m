Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648168njc;
        Tue, 27 May 2025 00:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVL9ZPT51W2vm7PKWBo/jp0kGAF5bv61uxGmSOr/svUbwBPAcBBKErY7woIu8Dg2BfbvIaQ/WG5Gilmw==@linaro.org
X-Google-Smtp-Source: AGHT+IHf+mDgGdv6OjGQwyR1Kd8+fL395jYg3c+ymX1QnzALGWsKPOPrn6pNJAvaA5K36Q2wKt6T
X-Received: by 2002:a05:6214:1c4e:b0:6f8:9a2e:170a with SMTP id 6a1803df08f44-6fa9ce57405mr207899186d6.0.1748331862346;
        Tue, 27 May 2025 00:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331862; cv=none;
        d=google.com; s=arc-20240605;
        b=aDlBT5d3A9vEpmz5ldz9p0ySA5jIgTclcSss5Zs2sLmfJ6SSYkCgvOaxyuFPOSsCmx
         cb+2JCoKd64u8kDBIAdoIc3H3rqvl1Ynn0uTOJesladMWNnPsz+sN410KFScK9Q7vInY
         uUXkkgVcqQsdN8snz5Wq51TmsnqCCr0y1+uGiLsLnrABYOiGRrjh/XcsAcDUDfBfb7IN
         TtUCoQhGrfXUSrBreGYnym5zcyAqGxzSuGpl2wdAC1XXeOrYcYXgIsAWHu6mAAoWtoKr
         puAb+fGnXWIWu8z9uP3GCwvFEH7CKY6Gy4djeawNt1NqSXwLe+a7zUdTOM3+XC3EOO7D
         6IIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ENcWQhSiq/mDYXzO0B3NWUXB9XTPdOHL4+pzW85tp58=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=Nq3A51AmI7UWiyF4FbLvhjv26+/uXfp52kuNVGLecK29y5MxNfrOeXI392qIAc1QXY
         kbWeckiJ2wqm2fzBLhsPwOjyWt2oGmiG8Val8tz/X35tfV8jTRlbFTQ103Mz76frOwS6
         Sd4BumHDhOa5SXcSV2ZU9cr4+ebOO+OEMaFTeZzyZ26AVOl26Vox0kt6kvtndOb+n6xv
         +0AUUtMnm0/BeStvkxrXmAH/K96Xy793p5B/bm9ujT3dGNy/bg5gb9myA5MAOLyqMglS
         2S1uQMOMueXZnRKSo//JoqsbGW+7wV74IwNFdUuD+uaB43nbRVqy3edZJ70zkdWet4/J
         bdyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q+WSehmy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fab6e8adc2si2074846d6.478.2025.05.27.00.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q+WSehmy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENcWQhSiq/mDYXzO0B3NWUXB9XTPdOHL4+pzW85tp58=;
	b=Q+WSehmyI+KJvzwX5iPxcb2W2dKjDqa9IxGF+NBjQggLxcNogFBH4PqEJ2Z0ej/ecR/pEP
	stcAksfkv0uucVDV0TmT5Rm/jD9WRqfv+++PQ7w6U5XuTluwQBJOompaRvYk6kOFpZX9bR
	jXhLlpjc2nJZA4WUOTCtgjyFBn+GasQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-a-rKbac_PamK9NwcAtIGyw-1; Tue,
 27 May 2025 03:44:20 -0400
X-MC-Unique: a-rKbac_PamK9NwcAtIGyw-1
X-Mimecast-MFC-AGG-ID: a-rKbac_PamK9NwcAtIGyw_1748331859
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A1BF1955DAB;
	Tue, 27 May 2025 07:44:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 679C719560AA;
	Tue, 27 May 2025 07:44:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 21/25] hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
Date: Tue, 27 May 2025 09:40:23 +0200
Message-ID: <20250527074224.1197793-22-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Vqn2Fm9OH9Au

Some sysbus devices have conditionnal mmio regions. This
happens for instance with the hw/acpi/ged device. In that case
it becomes difficult to predict which index a specific MMIO
region corresponds to when one needs to mmio map the region.
Introduce a new helper that takes the name of the region instead
of its index. If the region is not found this returns -1.
Otherwise it maps the corresponding index and returns this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/sysbus.h |  1 +
 hw/core/sysbus.c    | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 7dc88aaa27..18fde8a7b4 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -82,6 +82,7 @@ void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
 bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
 qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
+int sysbus_mmio_map_name(SysBusDevice *dev, const char*name, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
 
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index e71367adfb..ec69e877a2 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -151,6 +151,17 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
     sysbus_mmio_map_common(dev, n, addr, false, 0);
 }
 
+int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
+{
+    for (int i = 0; i < dev->num_mmio; i++) {
+        if (!strcmp(dev->mmio[i].memory->name, name)) {
+            sysbus_mmio_map(dev, i, addr);
+            return i;
+        }
+    }
+    return -1;
+}
+
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority)
 {
-- 
2.49.0
