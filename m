Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872C9C9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJKB-0008Jb-VG; Mon, 12 Jan 2026 09:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJk-0007lv-Ky
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:52 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJg-0001Zc-JZ
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:52 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-64b7a38f07eso10016049a12.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229687; x=1768834487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gfNu2eoKafa2xTyp6cd5sW3VFdprV5NhfouBXm89iM=;
 b=E/zjSJM/oS2PNakdyy89VuZet8g9kqDDElUqwiQeM6hvWPofTKWmc69de2D+pMV92k
 hCqjBqukwcG5WEPtqcGzbdfiu83zYvJRNDAHvmu3yBVxQaWELOpkssBgTTunONocQiJ6
 yZufXcnjntKbG2GBeZw0UNyAW5OLnmgTxfHvHxborUYshhvvnliBsZLBXsStxrKg3HgY
 5v24ppISyOxBLPdA22b6PyzyMjjGIOHKIo+JuIOWwdf49T1b2xtjV7egLC4NlNVauvcB
 pR9dwmZN0I9I/bil0kcdCfbMM6Tz18w/lBrOAH+q9SIBS3+WVyg8m8S4Cns89J0r5YNR
 ZI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229687; x=1768834487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3gfNu2eoKafa2xTyp6cd5sW3VFdprV5NhfouBXm89iM=;
 b=PafNhZ6QkXefY25v795fcW/vx3asIoWNQUZ0gHdVlwa21c1//tkBDiXA+GG5ojDnDT
 Yz2ys/4Li4L3qgHi9pj92hqs3vNtk3GxxMtg4hF46f0bmnaS2WPROcCNmxB1OlTwy7Ze
 i3T59F3eC6oIMVQeGK5IryPH0qvguJilsp/QZ/CYR4/U6EnoPM2mFIXYGrjtFPFAhL5q
 8WpDlCc99NG6l9JBP3ueAmIUv3+wpjJPNKK19Cv1CS7nCwuWYeYDhiTtslEZ5cVjTazh
 QMVxj9kLGFH1h1kTEmjKjGE731ngQ9TAAuIivR/exuT3kTUwqgckwuK8ZiwvZmiDQgdx
 gQlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy8xOC6fOQUEC6c/gXcsrL4X3pds608SJizESG0CaH0d4P7oosx8yE6whlx8UrhHbBsv7gGci9vw==@nongnu.org
X-Gm-Message-State: AOJu0YxB+UGdTDpHGgfiqzJtJHrVwbYkm1idQl72ZUhDnXrYRswVq71u
 zcjb8zCWz6CcreS4X506seMFSeltocabDv6Oc893Nkros01MhfP0NMY6
X-Gm-Gg: AY/fxX6Po4eJQwqM+TGEXO7KRbncBOIRBebh2BCfQZYEzjEBgX9edM8qtr2QFYn98aF
 LCWf48kUL2U5EeQf/Nu4th7G7rV1XSMK8AX0+U5Gut9vQHO6t0omKzjORLCU58LGRnWyWhjnEeI
 ubxS3NZAbAeUZTFH/2e/ltAxC5II4caBsgfOi9Ej+GiQfh0moC2U4rf76UDcXcJQbNTI6uTsCtp
 53gN//LCV3kjgsq49cSk2nzMW0Hdq6fYKf9LnTRYWiDXCdoKBZjk3xfblSL1UoD/W4jnN7SQ3uk
 aqn973ReFwMcHBeCpGMYu2vVR1kQop1KsuFpXLV6e0lAYm0TDxClc3XC7BSf+RI2edVt5F1IGgq
 aDNEmyf6mjUD8vdC0ihVcgomlG41KQPTYH6g7Ln+7iVL9qBYWWvASh0ccWfwlnZMyYUntfU8jRb
 iobHXbgCylEOfSA7qzUcoPJtv/d8kfynFksbeBCyUvzv/5UGkpkoubJdxk9KWz5ZdBcgUUpFd3
X-Google-Smtp-Source: AGHT+IFMIamXqw+EdfYyEpkguAEuYIlm9cWOuuK8QI923kT+LufonieaG7Q2PHX051hmXg91Mi2TVw==
X-Received: by 2002:a17:906:ef0c:b0:b83:246c:c514 with SMTP id
 a640c23a62f3a-b8444fce93fmr1824040566b.51.1768229687024; 
 Mon, 12 Jan 2026 06:54:47 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 09/14] hw/ppc/e500: Use TYPE_FSL_ESDHC_BE
Date: Mon, 12 Jan 2026 15:54:13 +0100
Message-ID: <20260112145418.220506-10-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

TYPE_FSL_ESDHC_BE maches real hardware more closely by reusing code of
TYPE_IMX_USDHC. For example, it fixes Linux to flood the guest console with
"mmc0: Internal clock never stabilised" messages in the QEMU advent calendar
2018 day 19 image.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index eb0d3a418e..d6ca2e8563 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1036,15 +1036,7 @@ void ppce500_init(MachineState *machine)
         memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
                                     sysbus_mmio_get_region(s, 0));
 
-        /*
-         * Compatible with:
-         * - SD Host Controller Specification Version 2.0 Part A2
-         * (See MPC8569E Reference Manual)
-         */
-        dev = qdev_new(TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
-        qdev_prop_set_uint8(dev, "endianness", DEVICE_BIG_ENDIAN);
-        qdev_prop_set_uint8(dev, "vendor", SDHCI_VENDOR_FSL);
+        dev = qdev_new(TYPE_FSL_ESDHC_BE);
         s = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(s, &error_fatal);
         sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
-- 
2.52.0


