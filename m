Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp183900njb;
        Thu, 30 Jan 2025 10:26:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMg5EugR1gaSlqCMC9d2dAkGlli+/OEcJ6WqrhD460TfcDLGBtU0v68x6kh8YIKbZ2WHyKk1P1OON/mA==@linaro.org
X-Google-Smtp-Source: AGHT+IE33ofjjxGKcYNiZBU8/PQvj4+M7RKa/DgPmskbi7hiVqGpr00ZTOCxgnserJ437c4njVBY
X-Received: by 2002:ac8:5a95:0:b0:466:9a61:273a with SMTP id d75a77b69052e-46fd0bbae27mr140841891cf.52.1738261610016;
        Thu, 30 Jan 2025 10:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261610; cv=none;
        d=google.com; s=arc-20240605;
        b=GX263S+089WFgQ0qV7EL68Xucp0XHqAkpdBfcAqux7duq9d9w8OMA8YEwnUFaumtdN
         kPxKmO70USr1eUIKo9kOw95P3702xh564XIsCb2MPte99KwVynQtyuVWvz9Z0Lisevkx
         mfv+ow5Q5/IDaV0NA8tWkSAuCQV7eMiX/ZLYiYa2WZDXh9flssSsSs+duU5+8P/mVRwD
         kNqQW+EUS8w8BVEa23jbTTe419qI6kI1DRU4ljB9hZao4EY90LPii/FSBZfOtf5E5luD
         ihlP5IupR1NgznNgf27ixBRvsy32d3ayUbCfiiOP7CXpesRENIds0+5vvi5l3NiwS5/P
         x9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Z3aEZJL4Zoy5jUwLn3/iNglhcvTDiQUnyONCdVRxkU=;
        fh=SthhPtpqdehNGJNgy7ndeFIc3MS4iW7BmkhpFgvGJVQ=;
        b=Vi21F2C7EYVgGGTGMTNIhVPwHwhQ+NZIzGk1OScILrpZHYiSbDKz4fky8ndrGx8Rh4
         ZDzqWZ/fzrLmIMUtQhNyxJYNB2P3cf/bbuOE6ofW/3V5X/F7rTLE5G91RMLBUNOvOuSa
         Z5x2q7Q5dvoRfOGUoXQcybPSnJGmgrD0OfAoGy3ycwK0jKbCXVLkBqly1MmweY9GO0gP
         hqVCS3V1xM3GjTG/y1gnidxRS8Y7Rz1aSA60IqUsB6zs5vTrQuuMn3dNWkmtUNZ2+vgv
         grNOjqd7E/PXcBJD/YhsY2CEMxMVJd8WEOFFHhEGOZD2ElAYvyIUj4GmMIh2k0kI1Pvs
         uVbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asK31Kya;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1dfd3bsi21714921cf.474.2025.01.30.10.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=asK31Kya;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tdZFS-0002Hl-C4; Thu, 30 Jan 2025 13:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZEk-0001Rw-Rv
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 13:26:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZEj-0001B6-4a
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 13:25:58 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso8583705e9.1
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2025 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738261555; x=1738866355; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Z3aEZJL4Zoy5jUwLn3/iNglhcvTDiQUnyONCdVRxkU=;
 b=asK31Kya/tBaoaeQLuAFOYHg/L+Pas2BLip/vANU0jpXeNvky+txTkWeUVWWY+APz4
 3s3f4cCRQTLlUW7h6us66FMzZyGytl6YZD+ql4LmP6tesPQfmfclq76G2e7Ry/ZIYvfZ
 RabVQxXJS7jWgW7Z2JLyHqnjXKKFkoAEeOidtIoC0hXQO4FhT8maikeA7GG/AQVhQsRq
 wHb99Qp77ree4muP9ySTzcJ8NyXxgn9rC5iuIniCsuI3e0sAUaPnl3qj8Tgpr4IbZTAs
 v+U1T892rx1p7+NTErBfo48a0U68ZpHsRqaifdDivFGy76Kc2WdIjsB/wbKCxA1R6qY3
 WCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261555; x=1738866355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Z3aEZJL4Zoy5jUwLn3/iNglhcvTDiQUnyONCdVRxkU=;
 b=uWYTWqrvv5tNGrF6bR718ftceIPZUTCs63/vi7RCr58f/xiQeG1bc+w8Yz5LdTtgNn
 V/X98nkdyzDSoqqBsXMLO+iXl2qitanZEBr8XFvEk9XxFfpspyqv4XbjbSqp7Qs6mIKJ
 2ozmTgQkD+07w3kdJ5tSvbEjNG0BKK94iWxMrp7YqafpjWxjaqNaf8UV9VUvkgMRCWxV
 spS5m4g1hIkImHTxbn0kmTLvN17Srkb9wDHX90E1lwowTA9By6A6sGqz03w7fu5Mu3W4
 II5IC17JYyMmwjrKojH1LOhez5RZQZXJNyFDqekCViXAC+8q/Mu1/bzImWkAvPNcAmE7
 kyBA==
X-Gm-Message-State: AOJu0YxV0T+E/QJ3fHyXeryoircjOVbLWSfhyn3vP7FquxFNEzpHlg14
 SfUZ7ngYdxJuhEz/DXtyfX1shbsFFwOgK2nMIiTxAaIFhn1qTwkbwSffDthRd70ASJxCXiFdA5S
 9s74=
X-Gm-Gg: ASbGnctL/EhmgZAzcvXxmKYwpoxmxcmN+AMYKFu0bwChE2EwbTQK2Z9kdpXAzDjU3Eg
 trswZQp50AOco89znQxd06BHBu7kvx7QGlIpfytz1kZkgQXWateL2q6HqifH/UCovDng4iHrKwE
 u/pZi3dKcnvZmSey6J13xBn0y7NYUAx9IkIH6Ui+NQIpuwJiqe+NJZ1bc6O4l9e34DJr/NcSwVk
 Lu9SCKf+jU1cjO+JDIriJgNA0mng1FEBYhlqQiSAn9HilnIhst8C1VaJ3vNfrUIM1jJiJkCRtvL
 iIj/vpo2fNI8dOfBTPqG9rGzDwORMXSb3gOXhdoA0qQNb7DxNsRZ8kt+3DO/M1Y8MQ==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id
 5b1f17b1804b1-438dc3a40d3mr86795265e9.5.1738261554878; 
 Thu, 30 Jan 2025 10:25:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2f17dsm66550335e9.23.2025.01.30.10.25.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 10:25:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] hw/arm/realview: Explicit number of GIC external IRQs
Date: Thu, 30 Jan 2025 19:24:36 +0100
Message-ID: <20250130182441.40480-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130182441.40480-1-philmd@linaro.org>
References: <20250130182441.40480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XG+p/lxjwb76

When not specified, Cortex-A9MP configures its GIC with 64 external
IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
configurable"). Add the GIC_EXT_IRQS definition (with a comment)
to make that explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 9900a98f3b8..4a62c83506b 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -35,6 +35,14 @@
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
 
+/*
+ * The Cortex-A9MP may have anything from 0 to 224 external interrupt
+ * IRQ lines (with another 32 internal). We default to 64+32, which
+ * is the number provided by the Cortex-A9MP test chip in the
+ * Realview PBX-A9 and Versatile Express A9 development boards.
+ */
+#define GIC_EXT_IRQS 64
+
 /* Board init.  */
 
 static struct arm_boot_info realview_binfo = {
@@ -185,7 +193,12 @@ static void realview_init(MachineState *machine,
     sysbus_mmio_map(SYS_BUS_DEVICE(sysctl), 0, 0x10000000);
 
     if (is_mpcore) {
-        dev = qdev_new(is_pb ? TYPE_A9MPCORE_PRIV : "realview_mpcore");
+        if (is_pb) {
+            dev = qdev_new(TYPE_A9MPCORE_PRIV);
+            qdev_prop_set_uint32(dev, "num-irq", GIC_EXT_IRQS + GIC_INTERNAL);
+        } else {
+            dev = qdev_new("realview_mpcore");
+        }
         qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
@@ -201,7 +214,7 @@ static void realview_init(MachineState *machine,
         /* For now just create the nIRQ GIC, and ignore the others.  */
         dev = sysbus_create_simple(TYPE_REALVIEW_GIC, gic_addr, cpu_irq[0]);
     }
-    for (n = 0; n < 64; n++) {
+    for (n = 0; n < GIC_EXT_IRQS; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-- 
2.47.1

