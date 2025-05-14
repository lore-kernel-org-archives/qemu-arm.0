Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1340791njb;
        Wed, 14 May 2025 10:08:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmDr7blXjPD1oDxAcLmjy/KSkLU6QBiZq2s7RuhY0laz0JRLMds783XRkOR3ICuLe0dw0FX8mfg+GPNA==@linaro.org
X-Google-Smtp-Source: AGHT+IFjZgpNJCCB417euYCklXfBGFWvGmrrttDe6z6UHpu8LqvFp/gCJY9JcTw0gKttpHcR8FGX
X-Received: by 2002:a67:e713:0:b0:4c3:64bd:5405 with SMTP id ada2fe7eead31-4df7dc90df3mr4432255137.9.1747242527154;
        Wed, 14 May 2025 10:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242527; cv=none;
        d=google.com; s=arc-20240605;
        b=hzp9A089/gyUbEpUhz8hH33Y5pCgdwZv6vf10zS5QS7HfjHtnVmZkxCCt0empd8LAW
         U/LYMze6l0DCfapYaRku9m5N19O8/XRMCKqAJ9RdHCv79FaADf+lrpu3CVPes9gl46uf
         P5UrG7xC1l4hco3BN24X2Gj5BFF4BJrHmV2rjg2ShH2e69tlZEA/L8jqFiqNDxlK542e
         /iDhwLBaXRMC/hurwmGjH2xEvXkb8LbT+snAMGyucyPQnV13fh23LWKazVkjTjQaWBwU
         Ab+oUIkqj4ZCw80svUqeTnnANHf/Y/NggBPb6JuSIauK20IIPCsvbD1kxSkrtLipwFuf
         uJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KMtdSCM6wDJrux4T58qx1vCOMvxu7dUR7P3i9jspQ1E=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=QS4PLrooUK/aJSUqXX2YE/eOMqwSJ5n3Bj01SsjR6wfMvfson9aJVIN31r/BeOtR6u
         EjHgkCifxEhKDyB2Z+12/sU4mMXXv+RLgZsKPH06Tm13MlI8QJoKY+cxhbN1ea6sMa9t
         TYhnyIXudia0vsEfrOVyXU465NbrTQihVgzSs/xgcalVtY0uiJn1w1KfMQaRcG/O8i5d
         Vps1tqQ0YaYrc24G+G0d5EdWrJKMQTmrez+n0zpheuprDESlRl4utCnE55nyMTwtDJ1X
         n+ZhlcGM8x4HPut1kB995xhc8xOjrwQYuJSbLebpampRRJU/I3bFaqoy/1u3YFqdO+cv
         u0wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6UjbueJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb204c0c0si5417421137.650.2025.05.14.10.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A6UjbueJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFaG-0005tf-RB; Wed, 14 May 2025 13:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFZ0-0003cy-2a
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYx-0007vF-O8
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMtdSCM6wDJrux4T58qx1vCOMvxu7dUR7P3i9jspQ1E=;
 b=A6UjbueJKcg2wiawCY69z5iZxTf7LwYu6r5f06E1ZBH8zb4ttNb4hOmbpRHIrtBPzRwTYQ
 wW/BjMU7EIxcikjKymOkPvaIPU0teOFZ/oBlXJRJehe6tsnrCpiiCZ8HwRICZ2bJa0yPZ0
 jFpuPpICpHN8panfzaY5jGlaqUAICwc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-emcRijE3Ny6TT6tPBYS2ZQ-1; Wed,
 14 May 2025 13:06:31 -0400
X-MC-Unique: emcRijE3Ny6TT6tPBYS2ZQ-1
X-Mimecast-MFC-AGG-ID: emcRijE3Ny6TT6tPBYS2ZQ_1747242390
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 60E3019560AF; Wed, 14 May 2025 17:06:30 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F39E330001B1; Wed, 14 May 2025 17:06:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 22/22] hw/arm/virt: Use ACPI PCI hotplug by default
Date: Wed, 14 May 2025 19:01:09 +0200
Message-ID: <20250514170431.2786231-23-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KKeGn6h/+NqI

Now all the enablers are there for ACPI PCI hotplug support,
let's use it by default for 10.1 virt machine onwards.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ecbcc2200a..abb0743af8 100644
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

