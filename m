Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1784020njb;
        Mon, 29 Jul 2024 06:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUgyY6qcQjJ4dAJyOZ7rDqfoxI5MD1KFScwbGCf7QiWl2p7pOgMNFGrZxdYFwLYokciLO89Bc//vPvSFjcTv9NJuJaTcThd
X-Google-Smtp-Source: AGHT+IERQq15zlSsoLbmCbUTI09QwETyWlzZaZAtySvr6P1g8uggeOGfSsWpdx5zZPYyr1eP5VLF
X-Received: by 2002:a17:90b:790:b0:2c9:8189:7b4f with SMTP id 98e67ed59e1d1-2cf7e5c143dmr5377603a91.32.1722259286614;
        Mon, 29 Jul 2024 06:21:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722259286; cv=pass;
        d=google.com; s=arc-20160816;
        b=ASv9jNnGKBk1+XOle7MoCiZc9ZrK6JFSr3mKPF+RERprtAgIzsNVZX+XEPh5c6YqeA
         cr4RRG5S1/Ldrc35gdGN61WvzpdNZhuKW0zcknBOlWp+sp6Jrf0Mqbtugd3DWugg2szO
         xqrs0Bc7hPqqv+4PR50UoiGQV7YDBp6zOC8ADWiqf45IKhgd2hzMkfQWYVpsXaVe2pMP
         Gy/KPjFE9jlA/AghjxZYoT9cTwvLbLQOvZxjzptLef8z4mrnX+qKi3y8KbNn5AiXp9hx
         9yGTwYEqxB/dYWbErKk5vrQHG1PxarlQV2Mp6Hr/Pcft/BGSL5Ne0zqkkkXiAEHNurwF
         XnRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=b0xYBI4DsCivQUfmHtAqKAIG1qelGdEfRAozfVNuSF8=;
        fh=1+GwgeeWHpUF7FYedvbaiDfvpf5TVKFs48cbY64gPd4=;
        b=NOo000G9LpQ21Ukr9OhZHhYNVkKBvYsQ9WLZ6XkhDTsRxcUgCySRbNZc3zBytJwc7x
         05z/ufKvrT69iUJcjCGAvjmiffbRoZj/5Jl7i9q43UycTHZDn7LXdlz2Lw8c2LOpYL6/
         GYiPIsCX2BHHnknJU4PobbW2p34EZp014RfT/JmWCKnLtjfLz7q8x/eQeZVbGyAd7rQc
         iZNqr/45xHhaxdHyXZxyJ+q+1EOz6xOGANMW5e364c3Pn5JX2kJL9H/TwcxyvhxjdqeS
         eYPAlxzc7fX1iBi2nnuV0XJ3I1wQ6DN2kxWZYK99VcGeUxFb5tzX2V+eEc3RMCu+we2H
         Msow==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=o4PyZdBg;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265832-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265832-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265832-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2cf28fd8181si10563448a91.80.2024.07.29.06.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265832-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=o4PyZdBg;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265832-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265832-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266EC2826B5
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7E7149DFD;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4PyZdBg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4BB148316
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259281; cv=none; b=c7Mt6YJI6DtR5cgX2SL083S0oZfZbPLGjCAQfvaxNtM8BgPiBe3/AqA6C4TrapnpQxBhhB0qEMIutacLEokcNBLvOHfz7ET2qwy1neqAUtKyn9fwFADY6j8/I/eCYW8AA+8mtFhLwAALIr1RRqNLI4LZ/IHIYy4aPFAHBq9yJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259281; c=relaxed/simple;
	bh=wmX5BOavDV5A0y4JGTIfwXXXDCYeYux2q4KKf6xw9vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyzpqBh9jsxj/s3CAv+2UypV3lrkuJh4+PkRtFxHqj+fJfq6PSFQDRoUhUbiuI6lqDSk92H+t6lyjT8Z2ZbVhk6Vmg0mxQuOaS2dcjT4IqO5DFDPhQJ4qyGch8hjEulKo4vdUEfergzrzu00K9oMmmWqE3OMAlwsQoovVyVAt88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4PyZdBg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1056DC4AF0C;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722259281;
	bh=wmX5BOavDV5A0y4JGTIfwXXXDCYeYux2q4KKf6xw9vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o4PyZdBgGpMneSb5gcEbFosIXh7r2vfuZOKvBP12tP6fSGmNrv8VgCXKCmnbPH0Yi
	 v8NYL/xImPGCLIo4Os3iBdYEmGj8jYJVG/b/tnDh1fbtOT21HNpkhQ3ITL94P2mH8s
	 n8Ir0fMV0jFv4dtUA+g2Aw8fibNPYnx76GTXFBslXEozcjG4Hj/IKVx1KHmJ2ojrWa
	 Cv1ersR2w9Ld/tl8hxVRkBpG931tCqUT+WKb1nSY0d0uS5mzrPz2JlPWt1Y/kM/J+s
	 /86vAPeB7WosmMvn/GdqFjgsEdKwwPGPb2V67YLHhHtuitprquuNJd/R5oRNOqJezm
	 7Q88ZGwqKWBSQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sYQJT-000000030VT-0I6f;
	Mon, 29 Jul 2024 15:21:19 +0200
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
Subject: [PATCH v4 1/6] arm/virt: place power button pin number on a define
Date: Mon, 29 Jul 2024 15:21:05 +0200
Message-ID: <e5afbbaf2836ebe22b48c455285eccef86db966b.1722259246.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722259246.git.mchehab+huawei@kernel.org>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 3GemTm7XW4jq

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

