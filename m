Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741434njc;
        Mon, 16 Jun 2025 02:51:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkphr77exIiqMpUw0jSq4F9i0NcPxGJt/p9u9D4PBEXcd5uYw8ApRbg6X+T9YiJyUKgNnX+io/gljnXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGcFBqaO69dOTDn5ymtCGFrJHJNm6gt2kTtwj5/373Z73AnebUpULhKzj5qUlI+DoqFzC2h
X-Received: by 2002:a17:902:c40f:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-2366ae6ff03mr147732995ad.25.1750067480876;
        Mon, 16 Jun 2025 02:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067480; cv=none;
        d=google.com; s=arc-20240605;
        b=kVOnX5ZIKRPxHLuK987ByfWFsAESAY5yIzjCI1FIGDUKF6GPbcLFygzFHVSa0hI3lF
         7OM8/E0BKz3BuMFOFDW8BXUU+z/AZgW1VGnmMJjy3oBiZeQHUpJ5lFOyEAzXGvtPqGOm
         DhL5Qkscecm3DiLwTxOOcS61XFONRKay+M55JL0qNY34B8ERhn58KVJCaqQkueN2Lsnb
         kHfgrny3p5xvHvSZsfCZ1Q4z/fjKc0s8CaCAF6QARZn2tKMt9AjvE5EVEm5NTrYh/451
         DzPGLRc3cwHTic2lVvqdimYE8rR67IGey8VO93CoCVf9g1SAPay9P0765cqQmmZehpGA
         sSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ENcWQhSiq/mDYXzO0B3NWUXB9XTPdOHL4+pzW85tp58=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=SDVBOaFXC0/r26mZJwdvS8VZKeGpjLcdoMafciy9xU2fIwhIhte8tRuQAaSBY9Bpje
         QSEcj+/bERfEVpwMwzRUuIao4C2qTgVJSS/88eJjkD+S25Mnjp/IQVl3N59ewToU24dq
         nYzY3Q3n0nGmmLzJ3ntU6n7hC6ZuVJ/8pSu+XhYG3euME/z9G//3h7ButwvOvhFN879A
         5Qd/ogmtcMcp8NUzD4yh2aj5oJsAeXDm8dnLa8ZbS8qKqiRGE4/qW1Y+vk/BEfgCRgF3
         p1oHJXKZegBYyc+yaRAWuJ1+73nbsdmuT2RsiXZgDdGNAoWj/CpQkREIvRp7Rz2AXPXi
         tlMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hDyTpShL;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-2365de95617si97901645ad.314.2025.06.16.02.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hDyTpShL;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENcWQhSiq/mDYXzO0B3NWUXB9XTPdOHL4+pzW85tp58=;
	b=hDyTpShL77PmbFB3MECSXr+Qz4mDEeEepiooxD9i52N41CKcJnLtiVIw/IcC+Yru15+OPh
	qNnja/KUWy/aOchdv+q2XA8uKk+ntJnQVAQYEP/GWy0LS0MXzeHMIIl2t2abXk2z6EMlPJ
	BflsJ4peUPBJbzBmnj+jc5o1p37ICJg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-76xb6vKTNZ2Gkf0i8pHCCA-1; Mon,
 16 Jun 2025 05:51:16 -0400
X-MC-Unique: 76xb6vKTNZ2Gkf0i8pHCCA-1
X-Mimecast-MFC-AGG-ID: 76xb6vKTNZ2Gkf0i8pHCCA_1750067474
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0D4418002ED;
	Mon, 16 Jun 2025 09:51:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7912A19560A3;
	Mon, 16 Jun 2025 09:51:10 +0000 (UTC)
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
Subject: [PATCH v3 23/29] hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
Date: Mon, 16 Jun 2025 11:46:52 +0200
Message-ID: <20250616094903.885753-24-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: i3w8WK/PaI6X

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
