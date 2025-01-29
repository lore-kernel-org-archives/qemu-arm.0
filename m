Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3617219njk;
        Wed, 29 Jan 2025 00:05:40 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCURoR88PHQM3732edcafZsf0pgDnpA6ki2GDI8/+19TX1VBWwm9toEbDPxR8BxB6gc1dwLkXoAXWJ3k8w==@linaro.org
X-Google-Smtp-Source: AGHT+IGYz2TJfNS1l99pJi+djA4VcFi3snTSf9iTHcmyUJLbXFhSnFZg871UFCuoF1s6v4klk4RP
X-Received: by 2002:a05:622a:289:b0:46e:25ed:1601 with SMTP id d75a77b69052e-46fd0a9dbcbmr37699401cf.14.1738137940700;
        Wed, 29 Jan 2025 00:05:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137940; cv=pass;
        d=google.com; s=arc-20240605;
        b=AykzycWppCYqthZNhxoBibb7rAe2iOGxw7Z49P6XqPkskbBrlpvPp21L5nRRo9xTsS
         GBKE/sjOb2qWPqAt3rSaIxZzpWP3X1Llt/5DkdubN4vL9NtT9JFeFXmlGiZelXiPPaED
         1etcC9PbnCsDwNIb3zsstPZWCxTbX9XPmwRsOkZrj16ELBs5vHCEXrlziscrfa5sS0PU
         dm4eRlclgUsBONql+XcehKZTmTnZFXFX3ZPoAr09hfEb8od5dp3f8mu/tpKWUXTkyyRa
         b3BZhWilf+UT0QV/EvrAc7IAdznqI5diM9kvnnoW68V1Lf4DsvKSgVcLCPHinyFMm7Ci
         7SRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3fSp+gz3cU/dmNYZPYhvU3CSOfdQpQACG8vc3Sfduss=;
        fh=wyBY0joL2rFkghWGWNuqy9C8j0XMPMxVS1FMK51a+qA=;
        b=UaGi8fvydwXQ3QsuuQ/SvqRhHwGlJPLDy+GwwfMVUBzn+9ztOKoHQple72AKm/wcKQ
         F2YYBPhdKwEBiUJUqMjbOWWiedYYvmRHr7CAr3N57qu8kw+mPTiCG0o7p8UjHaDxqXFu
         ip4gKSzR7Wn0WD5xF37GJb+jzHnl8QWiAv4PD9ru+ZpeFZx0sasV8DojTfBM59QVKhrF
         cbWD/JJerxcMq8za5KCMYIQnbxXh24PDG1ucX+YXDKywo+/gVpjx2GOJnaU/e5Z01CBQ
         ozFmJG5Mg4/l7uVumb5LVMfjyiEcdosvTE7NwyyTLahA4zCFhEQA7ybCITp2ISywukJX
         WRDQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="U7O/YoAl";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492175-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492175-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492175-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b690c5si137481371cf.296.2025.01.29.00.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:05:40 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492175-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="U7O/YoAl";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492175-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492175-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A072916702D
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750561ABEDF;
	Wed, 29 Jan 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7O/YoAl"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643161990D9
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=Pi+M/kC+30H1U2AmfXqOlk/e2SIOzShnRVIHfVyXrOAjLS7gE5bzzaU7VXXI2sAI38sUuUucWr2tM/pMK0bgS5ZwQfVfefYyo2OqjFC2vurTOVxohjzKIlcVpewRcHx90oKH64jXB3ZjH7EHnPYFu8x3YUR6nF0fp9oZmCWGJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=KClVuwy0IQaUTb+SNKkMoDTWWkneqfRohVCkFRVwUCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyzaSH6x0rkVZxZ5EKzVKFNSepz10dl1mYyLnFrdjhDRrWwNazsKHC4n/xRkfE3x6wIXH9xyepWarXoumkZTPYHRJb/e65dITbzG64cwYuQLgUWmldk7zXv6+0m6S2+ZdO5IkLJTqUE6I0Fs9xzSUY0FgHPCFkshRBwOKUYfPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7O/YoAl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D8DC4AF0B;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=KClVuwy0IQaUTb+SNKkMoDTWWkneqfRohVCkFRVwUCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7O/YoAlkAOAy2n7M9vn5twJqaRsQDiTByIa0x/q5slQ9lsyNDl6Oq2uX5MMN1THz
	 OynIE2OVHZmdaTtwxSAuemQ6zUWtehgXqHkJ2QSaUqxvQr+M9KzZKo6hOV5elZyhfN
	 Sid+o/djYS0Xtrfotjl4brOHbk5uZDigTkr12Y7GhSECCLvZV6oIexFwIYTBA0yhVe
	 eiCexdoO3ZBO/zTc2jk5JHDGoR4JN/bliMfCGDZmlqJkXBoA9oulUqu/Z39qXZHna8
	 EmDUPPSMxkLI2RRBN2COxCB8quQajBQ7lrJNeaqyBHhFagi+V+gbkuy2heWnUx9YiV
	 BEWD9y05cQ6XA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DQA-3pkG;
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
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] arm/virt: Wire up a GED error device for ACPI / GHES
Date: Wed, 29 Jan 2025 09:04:16 +0100
Message-ID: <9927237264e6cd4bbfd3fd01546551653f3f4161.1738137123.git.mchehab+huawei@kernel.org>
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
X-TUID: 2qVOIAnb7U3q

Adds support to ARM virtualization to allow handling
generic error ACPI Event via GED & error source device.

It is aligned with Linux Kernel patch:
https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/

Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>

---

Changes from v8:

- Added a call to the function that produces GHES generic
  records, as this is now added earlier in this series.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 12 +++++++++++-
 include/hw/arm/virt.h    |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index be1e51e0bb29..af8588330103 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -861,6 +861,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    aml_append(scope, aml_error_device());
 #ifdef CONFIG_TPM
     acpi_dsdt_add_tpm(scope, vms);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c55..e272b35ea114 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -678,7 +678,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -1010,6 +1010,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
+static void virt_generic_error_req(Notifier *n, void *opaque)
+{
+    VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
+
+    acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
+}
+
 static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
@@ -2404,6 +2411,9 @@ static void machvirt_init(MachineState *machine)
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
+        vms->generic_error_notifier.notify = virt_generic_error_req;
+        notifier_list_add(&acpi_generic_error_notifiers,
+                          &vms->generic_error_notifier);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aedc9..f3cf28436770 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -176,6 +176,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    Notifier generic_error_notifier;
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
-- 
2.48.1

