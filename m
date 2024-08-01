Received: by 2002:a05:7022:fe04:b0:85:21:bd5b with SMTP id vc4csp987196dlb;
        Thu, 1 Aug 2024 07:47:24 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXSIFP63hFZIhfeOK3Ak5kNzBx64i89r3DgFbpGD6D4w2b+EskiqEDaGEnNsKQ7G42rMeqxIKVN4I++wtM0oAgqBkZQbDVJ
X-Google-Smtp-Source: AGHT+IG5z1sCMm352uKkhScENzLIXJoaOB0132jvmyD7oVoWme5TLVqudnMgz1+IEADpdC/6p+JX
X-Received: by 2002:a17:907:980f:b0:a7a:abd8:77dd with SMTP id a640c23a62f3a-a7dc509ff73mr31655066b.59.1722523644387;
        Thu, 01 Aug 2024 07:47:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722523644; cv=pass;
        d=google.com; s=arc-20160816;
        b=QhzK5XM4IFh0VHFTDrfRg7DrBytY8gna63Fo3Jzz1w+w/VycRQZIPz4y3L/wuIOf/R
         Mh6vjWFqwzKTkTSEoPMvi2YIjuMdSgL8OPXGrmew14B9iCZOjwJzR0Ff3LmyjQcCkGHV
         OycN9C+sDWVYwI5GB3ppzJSSDGpDg9cTB85KntKDFZq2PaV7T8Mar+1V0S523r/5FpRZ
         7YAXbUHbRNgkBTuSwTxUU80c8jK6ARoVhc9WqXgns60EBr4redzeLG2Y9MdqYMlgBhXI
         /tPAVYKoKx67S8ceuPZUEGby/l1nRlRC+CErkaA86ol5odMFrZP/g3FWH06uTDN5Coq4
         mIDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=b0xYBI4DsCivQUfmHtAqKAIG1qelGdEfRAozfVNuSF8=;
        fh=1+GwgeeWHpUF7FYedvbaiDfvpf5TVKFs48cbY64gPd4=;
        b=xGqY/vNxHD3zckOIVLXPtgT9NdIiWO6PMHLWEW3oQFUQpcrBT+lHW2/tRbti/alevM
         TnHFn7VxBQM3Fie1H7KN52lXgBzMqU3lJNH0Mcv3EuS+xi039GFCJocJQ2+ytZK01hAW
         57HyG96CbyUGi5p4sLRu5qmN5BPgh8XftnabuVgJ2Ptx1rL8gShSy+9rYuPEMje338Og
         ZsAj9dSKJZxJqsM5/uhb+d+UOpEKriVWGRcLGFs8gTMeu6qmeNwQxJD0Wn1DSoInXRBw
         7FMxo40+jt0l5RThJ2uob9e/2Ho54wCe0lVFerFPy9vOPx3Xk8Lwg2RbnDpInTFOtHZS
         l8NA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XEiVgpxR;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271450-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271450-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-271450-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7acab3e007si1076819466b.293.2024.08.01.07.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 07:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-271450-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=XEiVgpxR;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-271450-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-271450-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9BB31F249FD
	for <alex.bennee@linaro.org>; Thu,  1 Aug 2024 14:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A03D1A76A1;
	Thu,  1 Aug 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEiVgpxR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8471EB4BF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Aug 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523638; cv=none; b=RCEYHi7bUAY+yU1+Z3Rq8ecRI2nVd3L5N0MKs7EAFCPvJQsFyP9eCsvcprqV0GiDKaWmN6avHxWtVtOZ5r3Nh8o7GF8FAL858FWAKLha7KWM2qloMh3MhJnKz2539R9ygKfu67aI8FTI7bC3G/7WcllY4PoTV76gCfoe8gWOvD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523638; c=relaxed/simple;
	bh=wmX5BOavDV5A0y4JGTIfwXXXDCYeYux2q4KKf6xw9vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/x7bzM3WEkIO2IbEl21BDCICv4OD723fi4N2U+866K/o6tZDXMzmK3Ap/tqiAfw2T3kyfCAFBsz0RmYVoKu0qqma5DwP2eYhtdpVTfkCWbZme1ZdkuLfonnvDXNllJ2MKQzfBlsWRV8zX42H35874cfUuoBeP1OLt3aQ0S4WT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEiVgpxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E211C4AF0F;
	Thu,  1 Aug 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722523637;
	bh=wmX5BOavDV5A0y4JGTIfwXXXDCYeYux2q4KKf6xw9vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEiVgpxRD5QuvI2aa7eSeynvkq9I/k9VUg7fXPfxYcnSAT6CBRMyz3bNwuEATzv9Z
	 cpdb/WkMG9CvS7af3RiJRP7aNAHw6i3TkOwS3LL9EboTKkOrg0j2qXq8uhzuw4qGWv
	 uoVX1iW3cQckjEyjBOh5C5SvJIBuJK1nnj6pDzU3K0q0cH0Y+ltEcJmlNiQqhTdR2p
	 G0CPpxya5vTC+9Cce0C9J9O4F2tyoSN1cIcAUEOCFCPFWUGDsYJXH/yrxB5Uz1wQlD
	 fA1X/oAA9KC5284Eya4YzLoDvowI4ZKDW+ky3vnc/GmlkrkpfbOPAudbJjALTMTRfx
	 sGXUdrNcI981A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sZX5H-00000001WCT-2os4;
	Thu, 01 Aug 2024 16:47:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] arm/virt: place power button pin number on a define
Date: Thu,  1 Aug 2024 16:47:04 +0200
Message-ID: <e5afbbaf2836ebe22b48c455285eccef86db966b.1722523312.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722523312.git.mchehab+huawei@kernel.org>
References: <cover.1722523312.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: lzfQNMIgd8QB

Having magic numbers inside the code is not a good idea, as it
is error-prone. So, instead, create a macro with the number
definition.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

