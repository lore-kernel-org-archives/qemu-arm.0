Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741449njc;
        Mon, 16 Jun 2025 02:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvkIXSel8AgLL5uh8P5iUNQ+KfahFpY/zH1kUhv4ax1ZWNji1vMyvckUvcLkd2B1v7bNASxfiuVexmOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHvOv354VLs3BVqESeHkAWjzrinUSuKJBN91nwQdHnKbZLRLZmwmD4IxjGjDiMZ8gAs97eR
X-Received: by 2002:a05:622a:56:b0:4a3:d015:38be with SMTP id d75a77b69052e-4a73c5faf59mr127353131cf.25.1750067484797;
        Mon, 16 Jun 2025 02:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067484; cv=none;
        d=google.com; s=arc-20240605;
        b=Mxvk3tFHzULWF78DX37xCHKJBFG05R6XkF4K1GnF+zIG7Q20uHpJWbmOBRSTL+l9B7
         Zw/MN35NT2ciTU8bSLwcBdDduccjB268HgIeyXtoYO5+re/f10uIAfrnMW+E+D0wqCUT
         /DK1l2F38pHFkayhhE9QDQfhdhzI7ahS7Dj/cnvVHv+VWUWqz19OXPU6HKwJyS4ozSLN
         4bZDtxjnzFyTDRUgvmOBLuH0Ys7aYjUUYkRLzcJlUgkgA3hxJo9A9X/dZ6d77GPJVpaI
         uheY0LE1ms/F6xOi4vo4ngNiOngmGc7s53Gu3VqeXLUy+MuueSj6U4600ADdSSlZN5JR
         q0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jvMZHA/dTkfEnWx09eaKnTkC86MZFnhWkUQI52i2V1k=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=L7dmWz6YjBIZ1c1T0hCS0ppd3TIPE8IcDAaRqOsP/mifN3JciVqXCWZORPeoA80DGt
         iAXWr3kP8Pjkn2JH1pspzsYPX7/G1FT+1NsDhsngslRgULOnZ7OaizIG15GuHdO+y579
         xn6dKJWb/gE0YS0gzWKN2QZW+YnPZIVw3MITxsEYxUuH614uNABxa46mIAxTJSN3wQzB
         nttePj1I8mEslyoCfEoduCJQXspIR7BRfAOKLjMGS8I1xu5a45ZOCIWgNOCRC2JWXnKD
         yvKei8wrFALcUj0sg48cY9/1/FolmW3jyPC5DYRdaFlrWZIbIpayNAOiwL14AtLq0Oi5
         4daQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5gpuW66;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4d05f1si90460741cf.381.2025.06.16.02.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5gpuW66;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvMZHA/dTkfEnWx09eaKnTkC86MZFnhWkUQI52i2V1k=;
	b=N5gpuW66dqgKAac5rW0lcZxEiFcOX3mkSnfmSlSHtMJ3lxjx90bI/m+UO5/30aft3OUCM5
	D65J4l6i0GDe6MMv+Wb7lFXNO+hf0eprYQordJvZE7icRAv679XwMytnn3NXIC4MYJkrX2
	CatVgUA7FXb7fUUtqVu4mh68NhZPcwU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-g0b_qnXgObuzpOUQ8mNo3Q-1; Mon,
 16 Jun 2025 05:51:21 -0400
X-MC-Unique: g0b_qnXgObuzpOUQ8mNo3Q-1
X-Mimecast-MFC-AGG-ID: g0b_qnXgObuzpOUQ8mNo3Q_1750067479
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B57201955DCA;
	Mon, 16 Jun 2025 09:51:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5DE3719560A3;
	Mon, 16 Jun 2025 09:51:15 +0000 (UTC)
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
Subject: [PATCH v3 24/29] hw/arm/virt: Use a SysBusDevice variable in create_acpi_ged()
Date: Mon, 16 Jun 2025 11:46:53 +0200
Message-ID: <20250616094903.885753-25-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: qcn9Zh/BzzVN

Use an intermediate SysBusDevice variable in create_acpi_ged().
This allows to get rid of multiple SYS_BUS_DEVICE() casts.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2f34877716..41be8f6dbb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -683,6 +683,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 {
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
+    SysBusDevice *sbdev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
 
@@ -697,11 +698,12 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
     object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sbdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbdev, &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
+    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
+    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
 }
-- 
2.49.0
