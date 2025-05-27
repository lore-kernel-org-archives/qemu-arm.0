Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648303njc;
        Tue, 27 May 2025 00:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3SJ2Oiic8vCqfmLwU8NGPs8zZ3Vf1LCdhKc39tSEK+nHn6xDP0OdYVX5I0Mq5CY4g+fm+s7sD0IIb7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHA/PYJB/xIyDKIuiIsJ8s+7k7CWPM1zqDo5L8QeBKx9tPmj5nV72nH06rl+HMMsLWlnMzC
X-Received: by 2002:a05:6a00:3a0b:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-745fe079f2cmr19719679b3a.23.1748331885597;
        Tue, 27 May 2025 00:44:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331885; cv=none;
        d=google.com; s=arc-20240605;
        b=Tn7osEPLh2eplba/lxPi7U94rznr4L1J23/oE3bUmyYA7uD5sQrCB5rWrlEUQfhBJz
         8RUVcKlfx/poBHtegHaNPvNokaECXMuYPyixdDWuT/yzha9kuzKrhA5Mn2v4WQ8qw/lg
         mN/Y1pVj/m1JcGfLfMfNv9CRkm9vzMfYjKlSSf+SMtdrvrIaTPzZHLbOTnyrgU1ziSPA
         LNCLtb8PgF6AwasxH/6vLdB4dVZFEvCYbJAVMbJgRwhZLXFN2LtRLr4OGYzV0Ep3iDUQ
         7atRrxS7CuFVteUv+g3yyf7IMH+8/P1TaftX4vfmbqb6boMxK02/4lG1lOkhZ2kwzrbw
         wYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3t3U2LOaBy/tiJj8bvCKrzHqShBPoDyX9s6oNrgHj58=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=C97RgwDe0CMjRCBb7FXP6o19PkfBpuwUdFrDD/XhM7XH2PxHAMH0leXVeD+mfJnmMy
         a6fkhNMPf+AkrHJpr17rW8Zgu2vAi0vPpSmRHW5G7zZN2rzeGQH+qaMN4jPpSS9pHu6x
         YF8zLtGBDCWhrMhbgIDF9CW0/6FCdgFjvCiQyF3ioF8L3n26p2HCYmAf+s6s9VQh13Cd
         2abFXfUOruB2nKVH+6R+THSJFa8fguGymoD9RL1s0JR9TuP6DCrVF7KCvLoZ5ODqgErJ
         sz9g28pWnKDoQXfNYOJRXt5+VgZD7MliHCldoBlxNchVpi4j/gHaQzBo+6f5qtMimHOI
         lDjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S+uAOQX0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-742a97f49a7si30687410b3a.237.2025.05.27.00.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S+uAOQX0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3t3U2LOaBy/tiJj8bvCKrzHqShBPoDyX9s6oNrgHj58=;
	b=S+uAOQX0jOXImsoUt+BA3rXTQqD6taa881/ykQAbhv+hhSOcqpfcWjkoe8NZWgggaWPTBN
	UX468om5fhA5M3BBrHBdqVuMoHRKrkU1PnBWr6ywiubm/d4RudEl0csC62Q84P4SUpG1x0
	O/YaFI0h15S3nbqyPoJUI7Og+sKiRA8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-324-CWJUZvRlO8OvJ3Yiv9hSOA-1; Tue,
 27 May 2025 03:44:41 -0400
X-MC-Unique: CWJUZvRlO8OvJ3Yiv9hSOA-1
X-Mimecast-MFC-AGG-ID: CWJUZvRlO8OvJ3Yiv9hSOA_1748331879
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85E1218003FC;
	Tue, 27 May 2025 07:44:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 239641944A89;
	Tue, 27 May 2025 07:44:34 +0000 (UTC)
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
Subject: [PATCH v2 25/25] hw/arm/virt: Use ACPI PCI hotplug by default
Date: Tue, 27 May 2025 09:40:27 +0200
Message-ID: <20250527074224.1197793-26-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: QfIpBcR1jjhU

Now all the enablers are there for ACPI PCI hotplug support,
let's use it by default for 10.1 virt machine onwards.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index adb9422e14..f9ab6e2a90 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3432,8 +3432,8 @@ static void virt_instance_init(Object *obj)
         vms->tcg_its = true;
     }
 
-    /* default disallows ACPI PCI hotplug */
-    vms->acpi_pcihp = false;
+    /* default allows ACPI PCI hotplug */
+    vms->acpi_pcihp = true;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-- 
2.49.0
