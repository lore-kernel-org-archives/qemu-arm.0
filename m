Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506459dyc;
        Thu, 3 Jul 2025 05:40:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV22GFJQ/jaLBYevYyluBOdS0eZCXInkwI1G+6cyTnE2T+7IpL28Fw2FKkesA58/EDWwO6g4rlsuiDLIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFeRsOigfhL0IEmHyyCinu5EnsSSXfpxk1YLyVNFdAgRokkWqSRbKiBnNUnv/XzjqSTZh06
X-Received: by 2002:a05:6a00:b49:b0:74b:f639:33a6 with SMTP id d2e1a72fcca58-74c997da26emr4195320b3a.2.1751546420861;
        Thu, 03 Jul 2025 05:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546420; cv=none;
        d=google.com; s=arc-20240605;
        b=MDKLaOR7D/kj8pBbpT850NyS3nXMLltS3kaVs2T1Q5SLEfQTwJajn5PeJt7HtD9d9z
         s6Q+dok7DR+eWiz3mtBPe7T2nyMx5eYl548gr0K0qN5uLIpBD9Bqnin2Nav1Mkb7ns7P
         Vz0oBeqla8pRP57NF6EX+a8ZYeEN3+CLxS5OzwiiTMUrfh39nYqNfeO7eV0OtW3uQWRN
         NDlG/oOFUaIgRAv1CHmIOLbPk6+WYTZNTIf0xXvewK15OrpQQav+AVd2e8DtgP+JyDVf
         dWbiEy28g3jCytVt6VAxdaHW3YkKLhzYDirme8SMYGZ/8cBjhswCRUMjpo+OwirgD1dN
         P4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pzj2MFtdQnbxUAQCssC7SV9aCXwj2DU+ao42ErCzUmI=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=Fp98v2TUtxSLD7g1TRatW4haMSH3UIoHgg9zFWjn++obaqwoONt6B9kt/uQIve4pXI
         Y8g2/DcZk6aLZNOfzKBUdnRA7/AJP8BTOAxyO2t2U97BzaamBjE9E55WnqZ7NfL9WZ4o
         1gjcGSyxUh38D+V1/aLiZ9puFSYj0aOziwLWtkrNrfedjf/Ffe8NkWKJIUZioMbLuFPr
         dQvsvF8EtX5ZanZfLBciG3pe1HskXGOB9N/u+hbSs0UZeHJdABi8IIBkI9jFz1zAsXxD
         ZHHlgBwi7ukCXvnKp4gcw2bRhF5jkzNrL3WfiKP8cbvKbSFacyNCF7pKrCYsWoHnOER4
         niKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E9fATnFz;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-74af54159fdsi19556988b3a.11.2025.07.03.05.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E9fATnFz;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pzj2MFtdQnbxUAQCssC7SV9aCXwj2DU+ao42ErCzUmI=;
	b=E9fATnFzTZbV8WbJqBTemHiAb3wnBHSH0/zLkrz5CNLcQ1Rbg4+u2Wxo6sWseTnkKqg2Sp
	E6S0sM6iKPwPsf3g8kwtNf7MuDUEQUMbD29yRrOSzc1akT1EMxobKcRKfSd6leMCM1zk1o
	q6VD4KepwipZtyXEwWAWgAXFkGRIku8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-578-M3q2el7SM5-bNxbbMYkp3g-1; Thu,
 03 Jul 2025 08:40:15 -0400
X-MC-Unique: M3q2el7SM5-bNxbbMYkp3g-1
X-Mimecast-MFC-AGG-ID: M3q2el7SM5-bNxbbMYkp3g_1751546414
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F387180034E;
	Thu,  3 Jul 2025 12:40:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92192180045B;
	Thu,  3 Jul 2025 12:40:09 +0000 (UTC)
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
Subject: [PATCH v5 30/36] hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
Date: Thu,  3 Jul 2025 14:35:30 +0200
Message-ID: <20250703123728.414386-31-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: kaHXKrJUG8m9

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
