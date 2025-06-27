Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788356dye;
        Fri, 27 Jun 2025 02:58:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWsQoWm2E7CxoqZ+69evF6E1+6w6YPmwh+LAJ7qaQSFm+RhGP4pjE8PihRIdMroXsmDAG9LPF9VfwkEw==@linaro.org
X-Google-Smtp-Source: AGHT+IEe7zYvc2JGyCu2csWs05HOWUwnkXwlRJhi4AYhOeGVFA8/bELipIh2zcbRN7+vsBHYyafw
X-Received: by 2002:a05:6a20:6a26:b0:21f:543f:f124 with SMTP id adf61e73a8af0-220a16b5314mr4090425637.24.1751018330913;
        Fri, 27 Jun 2025 02:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018330; cv=none;
        d=google.com; s=arc-20240605;
        b=B92CsDP7v3u00sO7tnRHRYtpciLorDp/uS0w/6wSm2C1Qdh0qwbyc2OGqmZMOSzv+g
         WnnUR3VX3N/MkqAphZykSUubLYc+P8EdNnNhpwWHHsLcXzNzAwbDOmDwIFsCAGyUMHp3
         J5ax7uP1MQxO6px/saU1Shuo661ye/vnm5+AkJ9sIzAFSGlS2Gwf1Lt730GHYiSIbqM9
         bNky1AbFokioocQ4sUMKAgm0dqkXEDxIzr2ZZ4XVLPwr3rHco5mky13rw8oCcuXstDKr
         3wAlCGw9pPYyCovl+SBY21lxOWBFVoY6b3rLLbGFqupbOkfnADBFYne6oR5qu7cuYVEJ
         2okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pzj2MFtdQnbxUAQCssC7SV9aCXwj2DU+ao42ErCzUmI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=HViC8RN2HN/ncoEUYkL8Qm6uh/tpY59UJhNVjpUMeTe3bPhVIKgr1SVHMab1yd8nkE
         Y+CYEkWhnxidSawJXHxC01vytNp4opZaYAPjiy7Ih4yv/GGVhQRk4pTCNOLm8+RTd6Ej
         yHZXUlh9zeqnADijoFPti4u2XNgvi/ISwXSzpLbDvnwNqq3uu+6XPsrs/mlNUZ0mhTnW
         gNMCwxwTvLg8SFxw7EqaeEdAfgrelYNOUtMwV5iY5zjFpN/SvyQAId7WXK57i3VOeTd1
         QW/d3wCVSpzIuP5Y9o7V3KB8qPd6ddeOyf3Jas2tbRwP3uQLeKIGiARA+wvx1pJuT/4S
         hNAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AEEVFuVg;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b34e32175cbsi1597604a12.362.2025.06.27.02.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AEEVFuVg;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pzj2MFtdQnbxUAQCssC7SV9aCXwj2DU+ao42ErCzUmI=;
	b=AEEVFuVgXtEs9AMII08Ryp9030CsoWN7Q0v/wpP3b3Rtx5vfrfkwmbVnBgpFKmc6uUuP2D
	MV2xO+4HiO/S/opf+YsFtC9iu+3FrXYzs1W1WEuSSmRNFHbeBXSZxE4cRzJ8Ac9GsnGUhh
	kkyj/cOLeSMvCNdamw6Su5VO+ymAW+A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56--U1Zb2YANHGPAtYiXBlMDw-1; Fri,
 27 Jun 2025 05:58:46 -0400
X-MC-Unique: -U1Zb2YANHGPAtYiXBlMDw-1
X-Mimecast-MFC-AGG-ID: -U1Zb2YANHGPAtYiXBlMDw_1751018325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4ED8180120E;
	Fri, 27 Jun 2025 09:58:44 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7712A19560AF;
	Fri, 27 Jun 2025 09:58:40 +0000 (UTC)
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
Subject: [PATCH v4 27/32] hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
Date: Fri, 27 Jun 2025 11:55:16 +0200
Message-ID: <20250627095620.3300028-28-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 00MCWzB5YLWO

Some sysbus devices have conditional mmio regions. This
happens for instance with the hw/acpi/ged device. In that case
it becomes difficult to predict which index a specific MMIO
region corresponds to when one needs to mmio map the region.
Introduce a new helper that takes the name of the region instead
of its index. If the region is not found this returns -1.
Otherwise it maps the corresponding index and returns this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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
