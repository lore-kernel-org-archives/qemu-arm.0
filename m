Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3616783njk;
        Wed, 29 Jan 2025 00:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUbiXKc7YDS/iazpXgWggkzHHEstUdyM3e8QIroZc3GzwYGeEyExyI8lOjJJl3Rd0o8EqkAf4sVHFvfjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF2JVKDvVDFC/yQF3BzSAW9NTJivJ6VndpPnIUCP5kJxkMp/OvEF1SxoBtzp3mBCNGra9YW
X-Received: by 2002:a05:6a20:c88b:b0:1e1:aba4:20ab with SMTP id adf61e73a8af0-1ed7a5b66ecmr3703675637.5.1738137877326;
        Wed, 29 Jan 2025 00:04:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137877; cv=pass;
        d=google.com; s=arc-20240605;
        b=f71dA8bDTNu5tnfmgGtGnURRa0lEK2HRfDRLa88/BGAVucVlNloqhoGC0u4TRY0Z9t
         Bx2dHeil0A+vcn98EhizOuE8sK8B1q9h2GBEGEPm6Q4ZgQ2U+mJqSNDl89SbqBgzgDBj
         r3ztnmbs8ACA/4ZGPJVTQEJtupcBQWsTOCBnsNkMzr2wrqFLKbalIIYAg4a1MWgT0Gp3
         ASVPK1nH2bzJ49bA92O4TUpT7GiDxVBs/s9VI1dnhD/Uy7VutMGoy6qtgL1t18n5qJ/b
         BeMmP2CpWpczT+QcFzsztZVchfASIycwVDiOd1g0GJ8H46ceWknEpz4B0I5hoXUpxHSw
         bFKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/FLpJzH+CgW1MR5HBQ3DSAj7xOmRuIV8G67k0BNkq5o=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=drF/+7bmvbAQ7kypQunfvOQUxuMZv62tdTowS7x2fDQoRYS4C/ZuVJ7X3wNtQ67Tm1
         706g0BlWI4+8l+Jcjs/ebNnr6e09D2S/8r3rUxzR0/yofswvZ18tXf9V8kyjZzZGvayO
         xw9GCmTIB5s2mDWNZLCmXEQK7o1lYdPktLFcVDx2jsUST8K/2e+TPT92Wn0uYJR0f3Bh
         mWnohvbn7ZNChRS215USash2TpT/U+oCMxmprHIYRG5/zxHanBu/r0JgwbESDZ/x68Rr
         6EFiLnF4WDSp4ni0M7NhQ56XC73VXZETTk4IXUjcjViiWVXtSgKNgGZjcVb4k4ER9Jxi
         CJog==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uV9C1NbA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492172-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492172-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492172-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-ac49621ffc4si14716952a12.276.2025.01.29.00.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492172-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=uV9C1NbA;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492172-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492172-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4A087A31C3
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8116A199EAD;
	Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uV9C1NbA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3872B18FC92
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=IVhl0bwSo2bFfJX/R2ItmAhDvIPcaHiG+Fe7ei6gFXqejmUvx/9S1hquxekgGnjOpBUIYzKOPB+PVMu8U+6Wl0XnsQddMSdL8HQXSgazIlQXyuLh/FTXpUOcqQkW6ayOA0jqnMIZPM0tNto0bfIqG2h3uyZ0kpLFID1kjmNzYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=4oMUaw0nZY/PBJTPbGHAcdSbKew0dgqGS7ij/VPuZiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zy5mVYELJOjMiIy420SXKdeOZ7mxM8oagyYNCcPhS5WbtUzMdU8vxhnLYT7IJjy8/uVec5m5aEcUGFmy3lTBAzCthixvTp5XiVhLAVSedDTXCYZDoN6bGbNb9G/IXeTizDnHaiY6yqm4ooSfFAOraiiBKv+ynT5U0AGcoaduCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uV9C1NbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A6BC4CEE6;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=4oMUaw0nZY/PBJTPbGHAcdSbKew0dgqGS7ij/VPuZiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uV9C1NbArjqk5bDtQW3xZv1/ogjMlCLkCRHSofdHO4bw0rNFoh3EY0CherG/JlHDA
	 WPHahWLpcyWp+CivF2TLqmbFmg09RyyqO2VAf+3fjvi20bMgJ/d3hyBd8x/tu5rmch
	 t0Hl+mPWN72ZSaSxGYnxXut3ienzzdCjytpEdbj6UxHxrOH8CU9dKGUdRyKxNt34OC
	 ApFTOzoL29YhgaePt2uR4vTKnaDWjafzBqlmAAgQ9eQ/bLE7pLyojLletR6U1SvF+y
	 c7f4S9E3HsNggI+C4FJHCYjhMM/XIQO/Hl/HhQWPNdoTcCR46IcUZUFyMqNlPgLgt0
	 ewyp6aRPSIUtw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DQ6-3iTN;
	Wed, 29 Jan 2025 09:04:24 +0100
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
Subject: [PATCH v2 09/13] acpi/generic_event_device: add an APEI error device
Date: Wed, 29 Jan 2025 09:04:15 +0100
Message-ID: <897c1eb4fcec527891301c9243ac8ce84a182187.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: WObwMZWC+ZNg

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
 hw/acpi/generic_event_device.c         | 14 ++++++++++++++
 include/hw/acpi/acpi_dev_interface.h   |  1 +
 include/hw/acpi/aml-build.h            |  2 ++
 include/hw/acpi/generic_event_device.h |  1 +
 5 files changed, 28 insertions(+)

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
index 70729b6238a5..50313ed7ee96 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -26,8 +26,15 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
     ACPI_GED_CPU_HOTPLUG_EVT,
+    ACPI_GED_ERROR_EVT,
 };
 
+/*
+ * ACPI 5.0b: 5.6.6 Device Object Notifications
+ * Table 5-135 Error Device Notification Values
+ */
+#define ERROR_DEVICE_NOTIFICATION   0x80
+
 /*
  * The ACPI Generic Event Device (GED) is a hardware-reduced specific
  * device[ACPI v6.1 Section 5.6.9] that handles all platform events,
@@ -116,6 +123,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                       aml_int(0x80)));
                 break;
+            case ACPI_GED_ERROR_EVT:
+                aml_append(if_ctx,
+                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
+                                      aml_int(ERROR_DEVICE_NOTIFICATION)));
+                break;
             case ACPI_GED_NVDIMM_HOTPLUG_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name("\\_SB.NVDR"),
@@ -295,6 +307,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
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

