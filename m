Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp493541njc;
        Thu, 8 Aug 2024 05:55:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWQLzM320L/wgjtYo04VDkxxqhuegFKuDQvSTUnXtzi0Ir43wRwQXn1rdDRdQLujDtoTC/RCMivjlW801dR4R/Dl/L7nUYI
X-Google-Smtp-Source: AGHT+IFsqLuekwjav3dtuKg9fs1+f9vuen0q+X9Eqm+EPVk1rOaE37VCeKd/0GrtXOIOn3Q+xQl9
X-Received: by 2002:a05:6102:3e18:b0:493:c1f0:d46f with SMTP id ada2fe7eead31-495c5bd37c1mr2798843137.22.1723121711170;
        Thu, 08 Aug 2024 05:55:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723121711; cv=pass;
        d=google.com; s=arc-20160816;
        b=U7bEf6F8WVbJZ1B1qREvBSCutbIBjvBwYoR/CQCq+vv1rQHSWTp8A4DsRSdpoSNacJ
         g7dwEisNEaGnhEru4AejzlMHFGblAk3jQWCDzGT6NcPEmroxhN6Nfns2l6TLzH8Vd+Pu
         q9tPxhz1B5fPRuONRQDI+DtQP9ck6j2aJnSZIYXB07/9q/ms9TMPK/U8cVBf6kzsdsCR
         Ko5Q435JXeBB7ZaouZdUKRo+ZlAgCjCCDXrVldmzQLGf/YXXV+auvqqIO16qBiNLAjnx
         G/6qfStOGC8PZH/iRbOYonvJyCS9eKe0Nam2sdg4VUqGJAU7VsaU5niyaiEOdfPHsJ54
         TtuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t0jcLwEfTdHclX8Gis7U/b7oV7i73oelgsKM/6/9iBc=;
        fh=ThkOQg+uB8lbrO/6Cr05pp4rvR6kbC8y4iqg4TVstBM=;
        b=vdYGF/l2M3guO7PAq6IThRPVJmZPehjXU1H+8BU2NFQOfH29zp6tNeXo8/Ki3LUjwE
         F56JO5vQCFe5sNvPDYIQUIX3taoatGID8Zfsd+28V2wkU0M8c7SBVibigjGliQIjhc6h
         bvNv9Q5tK3aPbpU5nDVMAfcYfNMVkG/aadpxJxwLiPzNU+4L8NPBw8v9prNdTEdv0XYr
         /t2CuOJz3SmWMHNDiMWb9f2RC8jMxkgKAMrk6soGkBMdbW2q6fgqM9a4MOTv0hH/4fNw
         aJwz/WaSgDPiLJ3DTU3enYDkSAujEGdW/2iXJOMqLQwvOnYU7vP/Xl9EBqjohk3H7lQ/
         3P7g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=I2PAofOx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-279498-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279498-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-279498-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb83d91esi44602926d6.178.2024.08.08.05.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:55:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-279498-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=I2PAofOx;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-279498-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-279498-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9D5F1C228CC
	for <alex.bennee@linaro.org>; Thu,  8 Aug 2024 12:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E78918C357;
	Thu,  8 Aug 2024 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2PAofOx"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18C149DFA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Aug 2024 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723121708; cv=none; b=P7uqumllrz0C5Cdk8PmSaDivmVp/CJYK9xEnP5pNApJdzouajPWcW6xWGjXg1ms1hLFbTbpXxiODcRZn6O6adIj5Ztn7W8tINzb5klGn+KJU++jZwLJxsXkBDZCA0I/+QLZptPLaPEZ4njkMV0JCPJXpki9znQINRMkHVDipMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723121708; c=relaxed/simple;
	bh=SvK/+TGJjFXnGJoS3EcQ8H/clkUTFMgPlchoA47WW6w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YB00ARePd4ntTDiVMeUYhm6nwtPusmyd8aA7GtWWzVMYebTD3P7a4U+FIoN1M4zgvQCo1sqps+pYH67kY/CrzUeUod8E+QVpiAT2Tm5ut1WBZ/AV6qQiWo2yj21aBMgVjI6qrRoRR4g8mG5GWu38KbB0eUCMLVpL5gVe7TzIsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2PAofOx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C77C32782;
	Thu,  8 Aug 2024 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723121707;
	bh=SvK/+TGJjFXnGJoS3EcQ8H/clkUTFMgPlchoA47WW6w=;
	h=From:To:Cc:Subject:Date:From;
	b=I2PAofOxtVJc6MV8JD20r0Bw/uGR60EcCGBU+wBF3aeOgxm1G+xGQ0iYrLyde7mvL
	 HCnkNAFCN1rzD2RRQTWaPsf/dne/804s5owEmXxhNzFaaZxJDmdqDd8i/FreVKBQ/8
	 gBpVEQAvnptVaV73gxInEMgNBQ3y6rdficg6JDb1yOrlQ0dqka6gXGuSTfIIHjv5so
	 sdV6wCnmDZsAJMWSY1867hQxjExsTW9UnOHMVeZ1goS9dlVNOnZPYel6uUktSJgKto
	 /IKygVyDGDBGahgdWt26+sFpT+x6x5HVu20XKrZMEtgXMifBK6EECW16LmAvhgTFu+
	 H3/cUIzZR502w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sc2fZ-00000000pDx-2RcE;
	Thu, 08 Aug 2024 14:55:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] arm/virt: place power button pin number on a define
Date: Thu,  8 Aug 2024 14:54:52 +0200
Message-ID: <ef0e7f5fca6cd94eda415ecee670c3028c671b74.1723121692.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: OnQrxKNIMt/M

Having magic numbers inside the code is not a good idea, as it
is error-prone. So, instead, create a macro with the number
definition.

Link: https://lore.kernel.org/qemu-devel/CAFEAcA-PYnZ-32MRX+PgvzhnoAV80zBKMYg61j2f=oHaGfwSsg@mail.gmail.com/

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 6 +++---
 hw/arm/virt.c            | 7 ++++---
 include/hw/arm/virt.h    | 3 +++
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e10cad86dd73..f76fb117adff 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -154,10 +154,10 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(dev, aml_name_decl("_CRS", crs));
 
     Aml *aei = aml_resource_template();
-    /* Pin 3 for power button */
-    const uint32_t pin_list[1] = {3};
+
+    const uint32_t pin = GPIO_PIN_POWER_BUTTON;
     aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
+                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
                                  "GPO0", NULL, 0));
     aml_append(dev, aml_name_decl("_AEI", aei));
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 719e83e6a1e7..687fe0bb8bc9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1004,7 +1004,7 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     if (s->acpi_dev) {
         acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
     } else {
-        /* use gpio Pin 3 for power button event */
+        /* use gpio Pin for power button event */
         qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
     }
 }
@@ -1013,7 +1013,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
-                                        qdev_get_gpio_in(pl061_dev, 3));
+                                        qdev_get_gpio_in(pl061_dev,
+                                                         GPIO_PIN_POWER_BUTTON));
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
@@ -1024,7 +1025,7 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
     qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
                           KEY_POWER);
     qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
-                           "gpios", phandle, 3, 0);
+                           "gpios", phandle, GPIO_PIN_POWER_BUTTON, 0);
 }
 
 #define SECURE_GPIO_POWEROFF 0
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ab961bb6a9b8..a4d937ed45ac 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -47,6 +47,9 @@
 /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
 #define PVTIME_SIZE_PER_CPU 64
 
+/* GPIO pins */
+#define GPIO_PIN_POWER_BUTTON  3
+
 enum {
     VIRT_FLASH,
     VIRT_MEM,
-- 
2.45.2

