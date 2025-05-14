Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1338991njb;
        Wed, 14 May 2025 10:06:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXc7V/Ad92XPfpOQeKLRkJ7sCHc60fwGMOEnVPDg8arDWG4Am1I0VxffyOztEMnl8ycJf/WBeQ5lBhRxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHCIlQZV33U6uOHzpRlIAPkIxu2P3RoBZOztfPsIvA9qKf6ggzE6AoAQ7VtRl1tubize+ZM
X-Received: by 2002:ad4:4152:0:b0:6f8:9b75:a62f with SMTP id 6a1803df08f44-6f89b75a760mr24252776d6.24.1747242397888;
        Wed, 14 May 2025 10:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242397; cv=none;
        d=google.com; s=arc-20240605;
        b=Ghb3jmvphfliyibyfMOX81NOjwhpq4cOgxU0K04xsWyFCNMia+h83ygdHkDf7pN4yG
         +qhasPYqEhvc7cSqd2lj0iq2vqQGnIS1LgqOPGbzU/R8EOu59Xcrzft77FkDY9Tubw9d
         dVxwWIFbavPmRUU40pxtiSMBOGyRjO9Hf25vfCeWzoRjk8X9TbaRW1oL3ZLNY+pL3OMd
         yyjJ9kI4OY14YFRgc1DG0hixQ3fadwT1IiGNzdU8i640p1XECCvorwi8CgxG3ylx5Ija
         LDxDuOlYISBGEgeFCxCPGJMqYP3ksHMj6P5ztPOYStoqu7rjlG7pt6zmzu2HOGqeJ6Z6
         f8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VraubuY7LtlKwlqMt7drwNrB25LK0Y+Y/vZnqOYr4Ic=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=VB3TM6W7i+ghzTjtWGrzv6XadAW3z4DdxTHa1n+RrPnJk3USEzdtr74ynbYUHIJcAB
         7cLBG4J05Ja1Xe/Wou/iukCY/Z72yf/zUHebhO94AwrMU99pYbyxfOIapu0Jgcrc/Vdj
         zEP1LDIC23227czdQIbHUsx4oqwqqAQ1ZinX2ccip05EvUyP70Ul8yir6tMrtKn7ISTU
         kfg8gszR4RTI85wydQN6AJUhRTQ8Fu+Wb0pIHUXmdKox61JHuBJLY9hv605QfljvGqX7
         KS3/HBj+nGqI/0vrBe3q48L97uZMhMrubgiLZck4ldJpTwIUT07Nk3j2+q/9Ph2+a0My
         iWSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aLlKfUl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f7ad8si144780676d6.149.2025.05.14.10.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aLlKfUl1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFXL-0001G0-T6; Wed, 14 May 2025 13:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXK-0001FO-GL
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFXH-0007NB-Sd
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VraubuY7LtlKwlqMt7drwNrB25LK0Y+Y/vZnqOYr4Ic=;
 b=aLlKfUl1/iFVTEZ+cXvSDyyJTnTZMbWYek5Pv7PrViQvOXVqRsis6FAqZey1y5FrHEbx5x
 FjXQNgOb7dxvHAng2ipIF1S4kJ4n3KXoHuy/blmkyTjsehtEbAw7ImkUM4gbZCLNQqbvoe
 pQUMW879i9GAnxuwdARCqSghCFyvgwM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-Vjzv09LMPju_51rNoe0FUw-1; Wed,
 14 May 2025 13:04:47 -0400
X-MC-Unique: Vjzv09LMPju_51rNoe0FUw-1
X-Mimecast-MFC-AGG-ID: Vjzv09LMPju_51rNoe0FUw_1747242286
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A56F19560BB; Wed, 14 May 2025 17:04:46 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 01FFA30001B0; Wed, 14 May 2025 17:04:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 01/22] hw/i386/acpi-build: Make aml_pci_device_dsm() static
Date: Wed, 14 May 2025 19:00:48 +0200
Message-ID: <20250514170431.2786231-2-eric.auger@redhat.com>
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
X-TUID: 7iSnpkcDydVt

No need to export aml_pci_device_dsm() as it is only used
in hw/i386/acpi-build.c.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/acpi/pci.h | 1 -
 hw/i386/acpi-build.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 6359d574fd..ab0187a894 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -36,7 +36,6 @@ typedef struct AcpiMcfgInfo {
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
-Aml *aml_pci_device_dsm(void);
 
 void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
 void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f40ad062f9..9e584e69fd 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -338,7 +338,7 @@ build_facs(GArray *table_data)
     g_array_append_vals(table_data, reserved, 40); /* Reserved */
 }
 
-Aml *aml_pci_device_dsm(void)
+static Aml *aml_pci_device_dsm(void)
 {
     Aml *method;
 
-- 
2.49.0

