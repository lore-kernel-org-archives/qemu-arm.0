Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741340njc;
        Mon, 16 Jun 2025 02:51:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhnXfT+Pyg5k8+s7UPRqSkkYTD2AeLge1g5eh+bq/l+KjjQ85CdEy9nVVe+cpjDfSz5Udgi3UpRTkEOw==@linaro.org
X-Google-Smtp-Source: AGHT+IEP41cdhQAVBHk/khTu+BTeXKjvThlBbONAx696Tg6WMgrbBokUWTsOqPnoP18GVwWeNLuf
X-Received: by 2002:a05:620a:2444:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7d3c6c0c701mr1283876885a.12.1750067460034;
        Mon, 16 Jun 2025 02:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067460; cv=none;
        d=google.com; s=arc-20240605;
        b=YR4RLf1Bcd1CMVHWIk6KgVPHWm9NFmaUflVgo/uREfByayWmLgTRr1O8+9IpR3kdU7
         f9KH2OymXaKhFjhMWfKP7QWWuGxvwLI6TEY+7ngz8Jw28XiO74t5bPBMTi5Dokos8ZGP
         5UcJcR0ft9EN60pq81qlQE/CtPGL6gq1+x9JieEp7JutPw7up3VNgnMM3NT5Sw7oJMc3
         dsvuR58hQwd1LBVDMDsJFhGDj0vHAJafwkU9WIHBtUIogLRPkSEbsly3gSnMjzWVCo7E
         9/7JdKxdx+fpzjHcZtsGJih5akpqPZUEUGdf9vsHMhuSCS5AYw6NLkt98g1thXn7JSbe
         E6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FPMKBQ7Bh3XzfBtBgCSvCljxg10sHFhGM5oEF+4d6eY=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=RzkoyyIc5essetHWnOAS4VqTJOv/62sPrm8y2VXjrGJHZKwwlfpQNjMso+I5q6m32f
         N/vpoVERUGIX0RAuwpf6AZXLKkYGI6qzKidXfNxh9MKTJpCtmXg0IhpUbIw/oLteWAs0
         xbe+JLWr18kYeyJie8LiPcMkxSmxHWSgyyUkj+0Z6PFysfmc7Ya0MUsRlMKQ5MKN/Xaa
         ivQ1SSVA1JGJUPTL1J976G7+rzBvKrBwY1DXv7lCtUJSo8pIHhBcGaHai8ZHmg8Dyd5a
         f68u+F2y3vjRQwa249atp2PvrDgxRcGAsxmJz/nMOSQpVDpWTDCOCvVRSqxv5GlbdKkv
         8leA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zb7TtKcL;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dffb94si935662385a.161.2025.06.16.02.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zb7TtKcL;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPMKBQ7Bh3XzfBtBgCSvCljxg10sHFhGM5oEF+4d6eY=;
	b=Zb7TtKcLBLN3SuTh0i44jqhmc7KiKfKrcQH4qlMSzy8F84V2stdSEVuzzkVKfga0eYDToG
	KK5YlV8dD8e5sPmRfQ2Qc+BmAWvBI8QrVyyAtWXmmMU0tYCoAtvtaCry9C27Vw7Zn6Rrzo
	XIwPff+mdZoNPBMsm+ssmLTXiayw9UA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-vJhcJfv6NlWUwJX2P5gi2A-1; Mon,
 16 Jun 2025 05:50:55 -0400
X-MC-Unique: vJhcJfv6NlWUwJX2P5gi2A-1
X-Mimecast-MFC-AGG-ID: vJhcJfv6NlWUwJX2P5gi2A_1750067454
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 756471800291;
	Mon, 16 Jun 2025 09:50:54 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9764A19560A7;
	Mon, 16 Jun 2025 09:50:49 +0000 (UTC)
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
Subject: [PATCH v3 19/29] hw/arm/virt: Pass the bus on the ged creation
Date: Mon, 16 Jun 2025 11:46:48 +0200
Message-ID: <20250616094903.885753-20-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 5xWmcY3dhOxH

The bus will be needed on ged realize for acpi pci hp setup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 08bd808499..2f34877716 100644
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
