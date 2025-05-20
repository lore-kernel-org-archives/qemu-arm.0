Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304561njc;
        Mon, 19 May 2025 23:43:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXh215K+gS4z7qYXW4ZVaC11WJlmN9qnHTkLu8FXudiGsA24Gf/VDUCs3imbYXDHpzdH4MRds1j6jKBCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGIsBJfDsWx8TCbK3EbRL0gLwYQUSkCILz2UDn90PGETKwA4VF233LnP+Hrl3pieCflbB0j
X-Received: by 2002:a05:6a20:6f8b:b0:1f5:86ce:126a with SMTP id adf61e73a8af0-21621a0a45emr27160082637.40.1747723412769;
        Mon, 19 May 2025 23:43:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723412; cv=pass;
        d=google.com; s=arc-20240605;
        b=PvrQlTh0WgSV73B/ZrdCbksrXtY78TsjfE/LnffDx0KeWKlzZ1w7F0mbK1xp/ZrSmi
         /lspySN0H+FGr3Rt++dYVCW3VmaoRk0Sv+LsUXTsPX0Fc1cxsN3YNt3Vi5XHhRaZ43P4
         k0WHDCG54kkuLWLScxTa0YLNNpEzQYbqfhaxSWGoYC7WBxegi+i/1pS75e/zG0Jl4rcq
         IWLH6dvHUJbDbgo7ecRJ1jXkjTXy1IRnizOH/pC7aju1H+3QrOcNv/p9Q9SyMlk+pn5W
         wmtNo7T2/ASSAHw4G8s/56L9XRriQPhKmVMhIuxKMM3vOrFKJytM2Jqevc6XhDiWxq80
         vuRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=jrU2yFLy8me+7DTzeJVBmZ52vRrfm88o6EH6AIgzR+4=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=Y2uPg54Xc0ljVaIkMFiw+6Ptde2NM2axg+KAScMQjq6IQH1C9cr6gAEzOA3nSbi8zo
         KrzsaKwpstK2z/eZnXkDAabn6FCnKPc13GA1kgSO/2tiOEr61jBGN3yWfU7PSFIAXALe
         LO0jGDt0WVKSiV6VypQj1Q6IT7bsl1iyX/TL0PSzE2qjDSj9jTqLRJxmz76u9qVBmp0s
         lCoX2x4WBUNPr9/SawJQjHNWvRxh+ihpOawvay63R8Q4kVBtsh2mH+pixkcx68uqZcxt
         N79wdF9YD7J5UPs9n+oz5KaeoZ7UgW52qZaQPhfp0WJAtHsCjphg/pR8lVqA9atwcHk2
         tHzQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KFyFFbkD;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655013-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655013-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655013-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b26eaf76d03si11109900a12.211.2025.05.19.23.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655013-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KFyFFbkD;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655013-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655013-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0923F7A95C0
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C7925EF99;
	Tue, 20 May 2025 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFyFFbkD"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787B325D1F3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=gZ+yDzVUaekxb/wv1czaocEExFisruyFE56J/HiwR8D0VRh0hT57IuMOhR/9NxpoM/pepViZrpLepbUcfZqORTJ0MBUW/uYHYKylj8acuhZESircd+1nWOKUl31k0JjlZx+qgisWBsYUB8+tPik2xPJR0CrOTsOxQg5DK6t8T2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=kaCIzeErmY4eufPDExw2g8MBUSN3U8gwnatWi++NEFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2GrdbIxXpnB2w+ppuczy3HUH+MAdIPB9uOubCf00Y3DTuBpwJjqVfMohsNSfrHZJ6FcAV0rP85cHr+jm3yrmf7w70oIuRZnkZg0N5F9kK3ytzUTvGZKNfC8GWURqyjaqOvn7xYa60xSQUUajJPn7qJ6v8Rv0JH6XyxCGyTefAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFyFFbkD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5976C4CEF3;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=kaCIzeErmY4eufPDExw2g8MBUSN3U8gwnatWi++NEFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KFyFFbkDJQRcMiip46dlR088j0P8ADPyEM5yFp91mpxrC6LZ0lXx8Z6o7t+RCNId2
	 7P/SxDSP7bs23+LIrNPub2fIkUrCc++BCWfI+xq85nhK7FeNEo0YaZMKLx7ffBkZ8m
	 oCHRDd2MAel5E0As6BXlohuSQ73/LdTSuf45sWdsHczPxef4BJFiQ4/qOobW7Xj/Uk
	 M2oL/CD7n76z5mctJ8+gWmkWVenDoTKpkI5eqbHdplfi1IEMj+rgt60aR2uOeSc5wn
	 X3wk1ANPI5MuliDlyshgewgFFtn7HOA4/uJ7ww1sZwy0yZM+U7Nvud982H82yuDusd
	 60UZknyIo4xWw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005qto-014i;
	Tue, 20 May 2025 08:41:54 +0200
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
Subject: [PATCH v9 13/20] acpi/generic_event_device: add an APEI error device
Date: Tue, 20 May 2025 08:41:32 +0200
Message-ID: <690ce6c9eed99913bd7d7dad829f209caba10665.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: o8RywxaerBuW

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
 hw/acpi/generic_event_device.c         | 13 +++++++++++++
 include/hw/acpi/acpi_dev_interface.h   |  1 +
 include/hw/acpi/aml-build.h            |  2 ++
 include/hw/acpi/generic_event_device.h |  1 +
 5 files changed, 27 insertions(+)

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
index 3cf9dab0d01a..620a1e0d6b01 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -26,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
     ACPI_GED_PWR_DOWN_EVT,
     ACPI_GED_NVDIMM_HOTPLUG_EVT,
     ACPI_GED_CPU_HOTPLUG_EVT,
+    ACPI_GED_ERROR_EVT,
 };
 
 /*
@@ -116,6 +117,16 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                            aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
                                       aml_int(0x80)));
                 break;
+            case ACPI_GED_ERROR_EVT:
+                /*
+                 * ACPI 5.0b: 5.6.6 Device Object Notifications
+                 * Table 5-135 Error Device Notification Values
+                 * Defines 0x80 as the value to be used on notifications
+                 */
+                aml_append(if_ctx,
+                           aml_notify(aml_name(ACPI_APEI_ERROR_DEVICE),
+                                      aml_int(0x80)));
+                break;
             case ACPI_GED_NVDIMM_HOTPLUG_EVT:
                 aml_append(if_ctx,
                            aml_notify(aml_name("\\_SB.NVDR"),
@@ -295,6 +306,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
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
2.49.0

