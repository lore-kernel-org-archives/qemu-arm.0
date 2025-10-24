Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBF9CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:26:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNQN-0005B1-0L; Fri, 24 Oct 2025 15:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNQK-0005AH-7N
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:26:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNQI-0000fj-5n
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:26:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4711810948aso17661785e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333960; x=1761938760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GwqgehZVsbFB79GaS98pbRrXCd0QXF8i259SKWhblxM=;
 b=XYRepmdlGkijcOWBIfqpPxWxLb12s/vIWQPLqKDdKaqe2ZjZa2L6yuAutIpItVwap4
 1iuCRgAjSwrSoguNJVwUi7CbovCLZJmKPMKFb6XeHtfVf/eFw0BE94eLsFQqNWxGP+k3
 hdYFTcrrlNzoaJVJO9SsCNi1gl0Lvd/RbxVMUuTjhNAihIhewRVfN+CNytnHwWM3oVQV
 9O46uP2BX7FEJiOy0Jd4Jt7Wjy6bnRLpBCagxS34LHH3ZxFqzr2pQpvqLQMOa6dlI6PA
 B9XMW+9EProQ0IXJBdyP7H5f6zSpXbpAyv9OIzM5s1zgHY0A2aJTfW2uYLQndsELIxTb
 qEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333960; x=1761938760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwqgehZVsbFB79GaS98pbRrXCd0QXF8i259SKWhblxM=;
 b=kpN9NW6K1dET9nFkgRjOrqR+xahq7m42qWEd4O/gnc/a3VZTNAwrjawqheo6H8yW+7
 S/G9sOTIasmb4Tr8ioRV+GREaz7+3JctmwJHXUsRriZhcmRav6vkkw8QGGGTMA9+F8iG
 N7NIPMr/aP4A43QATDhB+Xv/NO1k+Eu4XYKegpKEdeXx9FU6G3juRyTB1oVU5j5ezJ/G
 zK6/Svqn44WqXIHmB4DKD7SGVTDBIMAQWCkSamI0bSKVw3HXIgXjZl1k2QsMkAVG2qCq
 hbiFqzv403FlJVXXHgO9ZqE4avxQi4/TyQOc6aBapSEwNtaSBgTW/z9RjH6rpKfI/jsw
 8lyw==
X-Gm-Message-State: AOJu0YyB4N5C847B73FWGynlZrt3Idf/Q8cIGJvUMPWClMikPTTl5U/4
 /LWejJSStoM+uP1odrApqVpbO0xcukwx7mvX+TNIItyGzvyi0cj3oUZJ2CttByZAvIDhZiz2JDY
 j/dOsuWA=
X-Gm-Gg: ASbGncvr234VB6Z8cIGkjMhkiOqnH24lQvd3iVJeuGP/vcIO/j+n6Epj0mrRVfP9ugP
 KvaM+LTSe4EcTCpKOCRvBXqf7QLLvkGoDQsddSIMsj0+1ggVY6ypjdbajQUokVlGXl04ttbdu+Y
 RuWiQrTcU18fczPcKlq5dmhs6BJrp/CEkCETUrOZ7c47lwpNmWlQQG+UWn+ktawtz0mQD4AZ1Vg
 oKcpGucMQm0X2q0ivjD4M/c0i8Bb4LLc2Zx990LApwlg+uvXT2axcHN8PdU0FSw16qFgFkHBe/U
 fJ/0Z+QzoUkGBrhZsedKOGegXHMSj77T80/0pgSmV7DNNkacIQYkmY3PKb2eums4NKA++7t6f/a
 ZWup2PHy4rrJ/ZvI4rzxatiQuMWQo/stYUd7m+yurGjKioinsa/g+cAvgFZ2PB5pi8GFKMP4VQ0
 WI96/58H6KaKGqGbMLRt1/z3eW4Lsb7R8O9mwFKqfl5rB7GFCsmGC4xkyLjWH+
X-Google-Smtp-Source: AGHT+IFv2AKaZqiIcY9hzI5VLODEXV7jQcDdGTX1gQrQKLDL7Dwnu/U9sRqTvNe4mwY4DfrAuB5tAQ==
X-Received: by 2002:a05:600c:3e07:b0:471:13fc:e356 with SMTP id
 5b1f17b1804b1-471178760f8mr225087775e9.3.1761333960082; 
 Fri, 24 Oct 2025 12:26:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429930e35casm1914582f8f.30.2025.10.24.12.25.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:25:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 14/27] hw/usb/imx: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:01 +0200
Message-ID: <20251024190416.8803-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  include/hw/usb/imx-usb-phy.h:49:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     49 |     MemoryRegion iomem;
        |                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/usb/imx-usb-phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/usb/imx-usb-phy.h b/include/hw/usb/imx-usb-phy.h
index d1e867b77a3..a267c03c7e1 100644
--- a/include/hw/usb/imx-usb-phy.h
+++ b/include/hw/usb/imx-usb-phy.h
@@ -4,6 +4,7 @@
 #include "hw/sysbus.h"
 #include "qemu/bitops.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 enum IMXUsbPhyRegisters {
     USBPHY_PWD,
-- 
2.51.0


