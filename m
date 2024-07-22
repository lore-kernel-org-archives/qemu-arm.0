Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1739538njc;
        Sun, 21 Jul 2024 23:46:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUXdd7AhpY7df8K2ieHfCID9Q9iUkDXDd3risevAaSpXdpSclE53ctJOChzoaASP5ufIuCEUe+Cb3MrcXI3iD6YwYO4TP6t
X-Google-Smtp-Source: AGHT+IHc0/054zRODLizc0r8NcsP3bG+LuuAHmRI8f7C4I2CzetIIrpLnlHL906m+Rau8aILqULW
X-Received: by 2002:a05:6820:1a05:b0:5c4:7b18:b8eb with SMTP id 006d021491bc7-5d564e23ed1mr8274717eaf.2.1721630785590;
        Sun, 21 Jul 2024 23:46:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721630785; cv=pass;
        d=google.com; s=arc-20160816;
        b=MTlQpukJK+F8l6izy03QlmWA6RdhDfukdGz7u4eL9HhSyz8abPI2jH+XM8bCIYI1tm
         UPMWgQnXYcNuhZ+1xiNvrxAnG2+HSkgro3A7jLXQ1JaITJ/i6FAXSJ3jIIKzGqgVUtMA
         YWsNKkAWBVY90EBUDv29AzMtKBLy0pVz9XPgyytwggZwux33O9JBbumDFsujuzLhUnNB
         d+7RNc9ZXuf6YFkDv5ZJ3ZaU6jCntOvJwV2Krr7DIHyH3RVwAKbRpRxpC49/G/yiujxm
         MyRs/zLPze3fTf6j8dqr37hQ244bcRyLGpfe+03h59OHPkbr3cOVhJAEro+NUrVxwCl8
         ObCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/TD1EaUaZYWWJJT+An494dlLL+ANDaeT9MysCKqhTfw=;
        fh=1+GwgeeWHpUF7FYedvbaiDfvpf5TVKFs48cbY64gPd4=;
        b=eL+gPQNeIOli2o0MMHnrkF3Aq5ozYZodjvPO6fjDTUVID0n2y7zay4IWxglgN9y1bk
         jOAZXj3IA2uuZCF9ErMw534Omb+M5Ss81RK9+Fbay9M1RJAQQnDICfZrR6KUn2iIZ7Rs
         qKHP8CJ7xH8x8+hxnMqEdW7gNCgsvXbeK17/meFvpy5RKeis+hmHAmKHe1+pksbmztu/
         tQaEDo4NqFu6cynXZjM0QcbUlNBuE9wIJ3xULRUDpWSEpF9g444WjaV3tbbrMwSRcB7i
         rNZRRoLl4tZIgDeBlfIICyzS42iC9gom8R/r+4ymSWwHG2efkto1jgAsfRtDpbXP0EVO
         dGtQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UEdxjxKv;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258514-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258514-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-258514-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a2fdc7888fsi975165a12.207.2024.07.21.23.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-258514-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=UEdxjxKv;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258514-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258514-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A160B20D01
	for <alex.bennee@linaro.org>; Mon, 22 Jul 2024 06:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE48418638;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEdxjxKv"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0317BD5
	for <linux-kernel@vger.kernel.org>; Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721630776; cv=none; b=Mo0p6bbFovrH7QIUGB+R1xMbDqigmD853yy5IBJiKmjUjDYml+u2lSbhNL4w7JoP0w7ptJpvqEEMgpmnKTlNXt31S+0Amg58GcLaMPUhx/HVXAijl6oPKZbbtUGxWwMNv37OqKNqIVC+AQyDXVLyT+1LW/C9NJWLW+w6P7FaBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721630776; c=relaxed/simple;
	bh=XsNqpMUJB0O6cj3yT/NeTaj5tNxcpWbVl6wxYyGWgio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TR8ZEvTxM2daz38dd0++EUouZn2ix6P6wAsjwiwctXBGPE8TeuO1jmmffjfaSMmtpv7ng5MHi/dlFZaFR5USV4s4spakywZBSyjl2NLhN5susyjliR41sNiWjXrZVABD5Gur6l4DZqy0vxIplvbkZvDw2NB1M+Rw3L9pB41H9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEdxjxKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E95C116B1;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721630776;
	bh=XsNqpMUJB0O6cj3yT/NeTaj5tNxcpWbVl6wxYyGWgio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEdxjxKvHvqJG9nY5yYMVZS5k1A8R0r0CgsbhkqHHaLTaGUD8V/UFTeKmWf2O9lYD
	 Fu7CVBD2UTQYKgihYIBTBVHLTf4lvDxZpmxzq0RS2imdQg8uXlvSq7zpaOiTJPp97l
	 KL1koWTU+jiJK2Pt26yofkCSA+7Xp4dxIVmz9IME8/pbhNwkxx77JxNBSz+8oBshXW
	 q4HfyqDFBHIVM/qvk5ah6kRn9uE/i3z8Elyo2jBjtD/Ze+wZrBvLkUNyCJzIRi216U
	 GrI2iR2qZkViHRE1X8ifOU2F3AHSzsbtQ8/OCrVOe48yqruK4gataRLwh+krS3Ui1u
	 dNSnIHSCbghwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sVmoI-00000000WQi-0oQV;
	Mon, 22 Jul 2024 08:46:14 +0200
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
Subject: [PATCH v3 1/7] arm/virt: place power button pin number on a define
Date: Mon, 22 Jul 2024 08:45:53 +0200
Message-ID: <bf8367bddfdc95e378b5725c732533c3ba20d388.1721630625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: Q3qVzCkTTXio

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
index b0c68d66a345..c99c8b1713c6 100644
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

