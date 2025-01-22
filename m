Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865134njc;
        Wed, 22 Jan 2025 07:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWmxbebs6W9hxwMSeoyNJkMo3lin7mIyw2K6yGdhotg0B4tLmLJdRtHaK1ya5Uop3T4rnBxb86ug/pneA==@linaro.org
X-Google-Smtp-Source: AGHT+IFAC+cHPEloh61xr5UIE861FlU3PqOyh683c+/2HaH67bZy524oJEYXPvPxSkUlaxrq2Oep
X-Received: by 2002:ac8:57c2:0:b0:467:774b:f04b with SMTP id d75a77b69052e-46e12a93d06mr323396621cf.22.1737560804876;
        Wed, 22 Jan 2025 07:46:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560804; cv=pass;
        d=google.com; s=arc-20240605;
        b=d9jCz4P6z0Pv+d2AWEDXsRWZjMCKI46z5maqMeAoMTtnOWV2/rcbGOihOaZ0UHqj1J
         RFNVwFrPhyHmg5iMZP8pc34i8Ld9oYNBFtbro2s+cuzMRb6lMbrjjcQAWt7DNNnz8CcK
         bbwg/9+YF2JHj5iqEq1R8rVo7RoRLiUVSevcJyY+nxp7xXuagO4S+Q4miCGd91F6Mfab
         SkW0BXODWh2GGxRjOMjLK9fCy9h4SloKPP35BB3fFs34dC6Kw5kVSt2uyqF36AOCJr1K
         Do8Kw4b0wmDYthOklJ9mo5nRC+JU73WJb4ESQwwkrFnsqjFfGpfDSAALh73bzRDlynis
         xFmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=U/hrgy8+36sNUMrVKs/04YcrCGTgctx9r5b7OC3V++o=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=cS2iAYXLeQI7ZM2C0AOVAJAAXcpHCnGJ8z07USoht9BBBd8PXjDPoLEBjWU1oqMA9x
         WD0D8fZKG7KTUI6EMZ4FcdRH59oyn5XJU04C4FBZLTgjhIuwTHNw3JAsjIoc7Z9BjHwt
         LGvFmvhi/DnwYqptpxOmQHpd2CaaFqZ/fRAstntE40jZGFlUWzEVxb6DYQ2qjphPE+h8
         3gpfF7Bhn6+jDlb2WnKaqneBrj6KxOARzwM71ucoMQUecQuZyhdQHEowm+Y29J173cgR
         +8xRxNRwe/R459nUdpO78Pss7eqaTp+U5TZjCNtnAPHs6N//1geVUpNlmAWx6YzEcqwv
         gXmQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=pgiKLpo0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485591-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485591-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485591-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10488211si145466861cf.491.2025.01.22.07.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485591-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=pgiKLpo0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485591-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485591-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E45316130A
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5579F2147FE;
	Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgiKLpo0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5A4C9F
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=m69ywL5c6c26kcQfcwE9ZFQ8Z7466UA/Sik/i1oykh1JdgX6bv2B2hRF4WoXa26L4O+HUH+HtYDvU21BDyR7qjFX5MsB/As07RnZFKbaxkzloH2hE6d5YUbJ3w1fjs4ARhdVgKaCtYrer3Xk1CIbjEiJY6pJpCTjtEebxzq5hNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=tFI7o0AuinirOGC3zpJxmGsmNVeaqZwelEbX9SK+JLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJ6pXCinNj0FvtvrVpR1Goid/ywW0YUidFFUzmWRIj/X0BsIEz/w0MTN7ZYTSjWNrecYgcS+9uHmc1aylEZrYGxZm7bjlIbL5FsYrrG8bo/GTfPXGGrlJKG3KwQUxtzTRBUNGwlelpXn1j3q2RgkFnFzAM2yHR4u4xQHuKMF8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgiKLpo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A2BC4CEE3;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560799;
	bh=tFI7o0AuinirOGC3zpJxmGsmNVeaqZwelEbX9SK+JLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pgiKLpo08u4hii690+qAcBPHZVtlwYKNXYV93qKrVPt4vX7zNfQ6yS2uSKByk5syQ
	 vfeaSlMqYr6f8DDyypVpZ8zyqVyT4AvlV+LOf7HTuwb1krVD/axJCylmRSfEa9VmIQ
	 itmMLNNVxFz5+Z9VTLeb2QYXl90el4AC1jh19+ypHGmq9Ito+KUa10OECAMnd9S72M
	 agrB8E79ClTNqXIgLwfzeLjkf+0KwCLjTWgu0bFiM0c5rBTULtx7L9HpfQRZlhXJD4
	 EuIS0tIPUhzU5PjtcRnfuYzOTz0IiP5wLqZgwtOPn+TOYZ2h1OH8ESJ3A+Cl2zbsTn
	 sppRLoboIhG2A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogk-443F;
	Wed, 22 Jan 2025 16:46:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] acpi/generic_event_device: add an APEI error device
Date: Wed, 22 Jan 2025 16:46:25 +0100
Message-ID: <41b6846394154ddac4d00c3644cd2de577d10115.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: ByllAQij0rmg

Adds a generic error device to handle generic hardware error
events as specified at ACPI 6.5 specification at 18.3.2.7.2:
https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#event-notification-for-generic-error-sources
using HID PNP0C33.

The PNP0C33 device is used to report hardware errors to
the guest via ACPI APEI Generic Hardware Error Source (GHES).

Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c                    | 10 ++++++++++
 hw/acpi/generic_event_device.c         |  8 ++++++++
 include/hw/acpi/acpi_dev_interface.h   |  1 +
 include/hw/acpi/aml-build.h            |  2 ++
 include/hw/acpi/generic_event_device.h |  1 +
 5 files changed, 22 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f8f93a9f66c8..e4bd7b611372 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2614,3 +2614,13 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
 
     return var;
 }
+
+/* ACPI 5.0b: 18.3.2.6.2 Event Notification For Generic Error Sources */
+Aml *aml_error_device(void)
+{
+    Aml *dev = aml_device(ACPI_APEI_ERROR_DEVICE);
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C33")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    return dev;
+}
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index fe537ed05c66..ce00c80054f4 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -26,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
     ACPI_GED_CPU_HOTPLUG_EVT,
+    ACPI_GED_ERROR_EVT,
 };
 
 /*
@@ -116,6 +117,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                       aml_int(0x80)));
                 break;
+            case ACPI_GED_ERROR_EVT:
+                aml_append(if_ctx,
+                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
+                                      aml_int(0x80)));
+                break;
             case ACPI_GED_NVDIMM_HOTPLUG_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name("\\_SB.NVDR"),
@@ -295,6 +301,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
         sel = ACPI_GED_MEM_HOTPLUG_EVT;
     } else if (ev & ACPI_POWER_DOWN_STATUS) {
         sel = ACPI_GED_PWR_DOWN_EVT;
+    } else if (ev & ACPI_GENERIC_ERROR) {
+        sel = ACPI_GED_ERROR_EVT;
     } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
         sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
     } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 68d9d15f50aa..8294f8f0ccca 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -13,6 +13,7 @@ typedef enum {
     ACPI_NVDIMM_HOTPLUG_STATUS = 16,
     ACPI_VMGENID_CHANGE_STATUS = 32,
     ACPI_POWER_DOWN_STATUS = 64,
+    ACPI_GENERIC_ERROR = 128,
 } AcpiEventStatusBits;
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index c18f68134246..f38e12971932 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -252,6 +252,7 @@ struct CrsRangeSet {
 /* Consumer/Producer */
 #define AML_SERIAL_BUS_FLAG_CONSUME_ONLY        (1 << 1)
 
+#define ACPI_APEI_ERROR_DEVICE   "GEDD"
 /**
  * init_aml_allocator:
  *
@@ -382,6 +383,7 @@ Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
              uint8_t channel);
 Aml *aml_sleep(uint64_t msec);
 Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source);
+Aml *aml_error_device(void);
 
 /* Block AML object primitives */
 Aml *aml_scope(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index d2dac87b4a9f..1c18ac296fcb 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -101,6 +101,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 #define ACPI_GED_PWR_DOWN_EVT      0x2
 #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
 #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
+#define ACPI_GED_ERROR_EVT          0x10
 
 typedef struct GEDState {
     MemoryRegion evt;
-- 
2.48.1

