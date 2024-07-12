Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp789494nji;
        Fri, 12 Jul 2024 06:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVVvOTUE07RPYuLKwu178td1IZ6cqlD7JXRXySQM/rM6Mmh7r2/eCRlkFMO+gxe645rnaLQQOuHENECtW9rsWFEzOAJhfat
X-Google-Smtp-Source: AGHT+IF7SQ1dz5saR/soga0r5t2WouHr96oa4lr1KvfzCHtf1s9yC477eqek20TNHln2Lu77lqHc
X-Received: by 2002:a17:902:f790:b0:1fa:13fc:33ea with SMTP id d9443c01a7336-1fbb6d3d10cmr92883225ad.16.1720790140978;
        Fri, 12 Jul 2024 06:15:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720790140; cv=pass;
        d=google.com; s=arc-20160816;
        b=ASiS0AK11Tr6kWZEc2GKqp81CoiFHcfaKjq+4hmmNm10Enqxr/fJWTM3suFr7GOVuH
         DG91XbMU3Yfp273g4eZ4Z5lyDo64aEjIiQN2xn+fvnuxfYsmaqwrGKzBT/QwIRu3xapW
         DBwDVmPTimCTozPLzLnM1UGeCoy+LF/k5ENpwiiRyutZXs8WFrABGarWNI1P3Ipu+YXK
         H8+I3yQrVj+gQjf6Hq+vSQJY6kNJf8iMD6MK3bUD28tfWme8HoevlJlLgr41mfJvOjwY
         mub69CpaAUYJPP8gavAUa9VhLgF8zJgf48zoKj0N8vnY+iST5iEBbFMnvSyn28G+hscb
         jvzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=ka+4oeTPiwnTA3X/R+AAKuQfhq/v0h+91ooJAqfgLA4=;
        fh=G8nBe3Ll/b0FKkECXCYeSL8URMgcnoojwgn0egszeCQ=;
        b=Gu9Le6iETY5nIPCDLjBAg/Wh81hxp7SoV6xUsnUVmurzGOE8vHfeBFu2PfnyxzzzVs
         lgbB7mxbbmfsjucM782EvR7HQpd4hD+Dy/YFqknhCHob6FnkBkAjeuRyz2EOytt4mmg/
         EVkQAOpmpzRhmoMuX8ZLFlWQUQfwaQjfyz1woFq2gVCi7XFS4r9UxbqsMkw3W2f4uxCD
         3EkbacpEjn5Jc+dz7rYqeccs0M+BzxXMkp7XcBDaKEdugcxI/NSRFW2dxlqrnCIJ7uOL
         6twnrp0AmlgUJutVko7bLeLNxJxVkqRJMm+1b7Z7x1DZI1r1u5pUgvEI+ixbrOkutvsj
         MMXA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AJIRJKxw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-250675-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-250675-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-250675-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-1fbb6a287c0si85627125ad.179.2024.07.12.06.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-250675-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AJIRJKxw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-250675-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-250675-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FD5B2849B9
	for <alex.bennee@linaro.org>; Fri, 12 Jul 2024 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5DA17106C;
	Fri, 12 Jul 2024 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJIRJKxw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABCA16EB7B;
	Fri, 12 Jul 2024 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720790122; cv=none; b=nqRQPcJ+sD+wBHMJ/muj8UktHP6fw+oYYBeAPTD8meXGH1w4Vnty9hl5aRzIQjbkWm5z+TukC7WcawZeZ5nj7CKRXbuFksq0BabfFONngiMBU0nXXx3a6GjGgQI9sIMun7xIGxBqOr8d5exd5xON0316S6iqm9PJ/8jFbOlF84Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720790122; c=relaxed/simple;
	bh=raCX3FLzfIuotLZqJ3wF6jjKTcaaKJ8KCg82aZWFMgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/ALLh4srO7+00bA6Rgod3BAylyYtAIqFFRP1iKzMRBVr+6YeN77b8R/AB5kRWLtR9vEKoKYKL7X9apGGcc/EOcKPQAf7cgJ4Ju9Jah7ohTB2L5s4jr7gDAIq5aquNB6clmw0KmwpS7UOv0oLsMgX4IP8ACQP0O9hzMXImSFaUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJIRJKxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75DC4AF0E;
	Fri, 12 Jul 2024 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720790122;
	bh=raCX3FLzfIuotLZqJ3wF6jjKTcaaKJ8KCg82aZWFMgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJIRJKxwF3Al8DHIp0C6poetpPMQ937gL6rxbyAZGsO1ZgiNFlru29F5jCXXXebSB
	 dYQlKMUXTwtx2oZtKmfh+NPPoBUhtbX26Zu8SLxC4FJhSetA0SVTpsUKddo96GMlhh
	 llpBV7GbJ8sSF+OQ/7ONKPZhgaXkohzuBl/wb6da7CI5t5+MN6fP//uYyc3kONhSe2
	 tI0dxH3qWoYqFS6o2bhFFx11VN3WRKGZq+x4P1yPRQ4LZ/0XbG5wdp7pw/YKXQhyzq
	 jLZ2SyMBKEqDj3lz5rlJIkVSunGBPTPGWhxyG866ZZiUkDk0sWa5mo8e2v9MzeIZuC
	 ctU2w1nKd7CDA==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sSG7K-00000003iDx-130C;
	Fri, 12 Jul 2024 15:15:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Shiju Jose" <shiju.jose@huawei.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] arm/virt: place power button pin number on a define
Date: Fri, 12 Jul 2024 15:15:08 +0200
Message-ID: <88fcd8947095ec6dff8ea709c8ceffa72b16f686.1720789921.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720789921.git.mchehab+huawei@kernel.org>
References: <cover.1720789921.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: WMejDuaX+gaO

Having magic numbers inside the code is not a good idea, as it
is error-prone. So, instead, create a macro with the number
definition.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/arm/virt-acpi-build.c | 6 +++---
 hw/arm/virt.c            | 3 ++-
 include/hw/arm/virt.h    | 3 +++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e10cad86dd73..ad0a0bcec310 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -154,10 +154,10 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(dev, aml_name_decl("_CRS", crs));
 
     Aml *aei = aml_resource_template();
-    /* Pin 3 for power button */
-    const uint32_t pin_list[1] = {3};
+    /* Pin for power button */
+    const uint32_t pin = GPIO_PIN_POWER_BUTTON;
     aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
+                                 AML_EXCLUSIVE, AML_PULL_UP, 0, &pin, 1,
                                  "GPO0", NULL, 0));
     aml_append(dev, aml_name_decl("_AEI", aei));
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0c68d66a345..7b886f3477b6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1013,7 +1013,8 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
-                                        qdev_get_gpio_in(pl061_dev, 3));
+                                        qdev_get_gpio_in(pl061_dev,
+                                                         GPIO_PIN_POWER_BUTTON));
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
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

