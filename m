Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506191dyc;
        Thu, 3 Jul 2025 05:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWADB8Vy8u9tMjqvz2WnNJx0yLIQziggPYMlCfT90thcdfKC1GUM8G3IhzB8HJGpQVxq7lR8zFTe0EZ2A==@linaro.org
X-Google-Smtp-Source: AGHT+IGQfIyKlt+5yZNC8vVAeO5+ClYGmuuvXSIx5d+KxvwSIu0YioXPeT/n/zTt6Br1NKSNV/Je
X-Received: by 2002:a05:6214:2aac:b0:6fa:c66b:8928 with SMTP id 6a1803df08f44-702b178fc09mr99195236d6.2.1751546392454;
        Thu, 03 Jul 2025 05:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546392; cv=none;
        d=google.com; s=arc-20240605;
        b=iZeqNGHMupy7lAkZng5i9HjL3MdvO7D0abZIE7iRHl+MmUbJ21963Ax0HjDbeezeGz
         8+MP3Gqkhmq6h8lj1UJSytwSZ50sTmhxQl4iX3gBeQByzjA4wPrJzBGYNY7W2nWJ+Uj2
         ALHhb7pYF/1JBFQZHCUDt83/ai9and5BEgGQC2qKg91piSDIZplLxVjxETmW0ovig+DX
         jrho4WYWr2cg1KGSQ0CSlmc5bWtCwyhK9gnHkHTl8s7Rla4recEu+cnLC3wggqwIa6QL
         gdnCaVFlOJDJJQXWLniu+T4+R3xFBWaYr7eYNUzHZ5FQrGkAM48Q+ZGCduc71EykZ3q8
         rJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VIeycjAWB5Y3e/OsAKShYgyRoeDu8FNvB+cY9/fz4GA=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=TbIYA5w56Iy1JLMfEVt5pUGUxpqGP9LS2mNTqFz9Z8nyOIqAANsRBpYHbdLW7eOgGJ
         iWLYyusbj8Zp0DDWeKjNLIkgi/CVWnCovUnTJlWESX0/EGfkrnsIrdpr4Uz6aYvZ/vrf
         NLDDu7IvYnrX1RB5utYQIY4HenDuLJja957tZBDxSjbzFnWziBsa3hNDtstwSw+B7QtW
         9wpqOv7FuBIXOYalNIV7INw5mmk0//2SHGeUlk7fJuy/UBN0FKT9VRiRACf4ath9ndWL
         nq2tBCmqT0Wifc46nn9+IFywWmp4TKwX5X8947YebGOiHdofgj3lGJN9VEam9a30RTQ6
         rLSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K7iRejc8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7738a2f2si168272186d6.387.2025.07.03.05.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K7iRejc8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIeycjAWB5Y3e/OsAKShYgyRoeDu8FNvB+cY9/fz4GA=;
	b=K7iRejc8Y9Ukc9NbgoDSzWb8LgKyU44Nb1nCwr8XaxjjcwBsb1ZhvJvII6AScPX7hM9dTL
	RYzOmJ96yFaZ2ahMCENSzq5KLcvdz4jDw1HJl/TWLJDVnpHKtiwlhbYnPA/vdDR7ejSm2l
	o46Wm1fBAHzJ1MPlbemHXTeqxI//83c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-Kr2yfSAtNgu7CS-346mANg-1; Thu,
 03 Jul 2025 08:39:49 -0400
X-MC-Unique: Kr2yfSAtNgu7CS-346mANg-1
X-Mimecast-MFC-AGG-ID: Kr2yfSAtNgu7CS-346mANg_1751546387
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BC9A1956077;
	Thu,  3 Jul 2025 12:39:47 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 07DC818046C3;
	Thu,  3 Jul 2025 12:39:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 25/36] hw/arm/virt: Pass the bus on the ged creation
Date: Thu,  3 Jul 2025 14:35:25 +0200
Message-ID: <20250703123728.414386-26-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: 4AVeuvGPzHXt

The bus will be needed on ged realize for acpi pci hp setup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8024a0b6b3..34a3831530 100644
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
