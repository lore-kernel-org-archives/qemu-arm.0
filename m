Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788220dye;
        Fri, 27 Jun 2025 02:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAjA0kYOQu3QWTt3IPdtoJ8FbrjviatSPr4LZv1E8N5hOlrWJTRK0R85t8mDGDUBkL5HqfI+uLFcJUEw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+xorohPcCjGUFtEe8yxQLADE7cra8qO4v+U9UbaYdSFfTcPxQdYxyLZkiQZsPMwF0YJYd
X-Received: by 2002:a05:6214:2523:b0:6f2:d45c:4a35 with SMTP id 6a1803df08f44-7001422b95bmr45488286d6.37.1751018305893;
        Fri, 27 Jun 2025 02:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018305; cv=none;
        d=google.com; s=arc-20240605;
        b=XZQKZEVFcw8am1sYfT/+l9VWc99YEZHTdgUcY+yjgg6JyRM3ihahNnwnYWOI/SNfxq
         hVF0svjtotgkd/vc3u4375Q+Z9uGwXugot9mos5oVkYynr4dqqCgyfqDe7HhHaKto4rB
         pgCjzrGFwtTm8QmUtapwpkTE3BaGLIBZwt4t7k1j8lOrci/MqsKhHWapGgkf8Bd4tmZq
         9PnWYWv9h3NmKAeQlKaNezAlggpfHZatvGqR5f74RLzVuV8uFb0+9Z82Wu5Jiafwz3zZ
         nDi4oZNcoVMO/PZ95usl7oVJG7eR1/y5ZzEGflb0rYZ2MriWX52rBNaRQbgmZ8fQdMTU
         aIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t7OtfIY9A14AE0VFKJKpfIrTUOOhkBYfB/44Wc7ZGyk=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=iSdXcHOH8OaaonFm9biN5bBJZsZW1oMhl+eO1BjA1fU5cbBniLfo5R4Cd68PwOcqAZ
         zDO+glswRlTyr6MrEusFhi9pBUKLisGKdOTWsr0t206R2jYyyVFbFS6GMn+aLggAd/rM
         g24ATt0VSIgezx4F4XzXi1CJsIaf38k6foOY9q2SBoZct85f3cbXLFMjANNu6LAvV59m
         I932cJzTQ/Vise/rtXPbfT5wlB3vZAdgHnMGR5/yX/MGb3bSKtPA+h8xOWpnawB8fP9w
         sH/etQ7UZEK8uKuJw5I38NX2ziCv9V3ijimzd1HbFD2dFG4wbOTtJNr760vpwHkjWQ21
         6ITQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KByJ+pdx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44323bbedsi188783885a.320.2025.06.27.02.58.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KByJ+pdx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7OtfIY9A14AE0VFKJKpfIrTUOOhkBYfB/44Wc7ZGyk=;
	b=KByJ+pdxvON/sep5bXrGTeINRzybOHByAPSdMonf+AWT+Qy5MA6ZqdnmqyKJ1mnDvjPFo0
	0R9+r0+3TxcDv+U9H7qAyCdwhuOuL1QE+t8H5Uci1yJMTeSCsb+FAqe0CG6H82XTGKa8Js
	k6bPq2SgXN3NhU+O/SEAkdMry8qcSaE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-QSzAsYGzOdmdzCzRnlU0Ag-1; Fri,
 27 Jun 2025 05:58:21 -0400
X-MC-Unique: QSzAsYGzOdmdzCzRnlU0Ag-1
X-Mimecast-MFC-AGG-ID: QSzAsYGzOdmdzCzRnlU0Ag_1751018299
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A3ACB1956061;
	Fri, 27 Jun 2025 09:58:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80F8C19560A7;
	Fri, 27 Jun 2025 09:58:14 +0000 (UTC)
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
Subject: [PATCH v4 22/32] hw/arm/virt: Pass the bus on the ged creation
Date: Fri, 27 Jun 2025 11:55:11 +0200
Message-ID: <20250627095620.3300028-23-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Hqxq8FVosRZw

The bus will be needed on ged realize for acpi pci hp setup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d4e671617a..2b0814888a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -696,6 +696,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
+    object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
-- 
2.49.0
