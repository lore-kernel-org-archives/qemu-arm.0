Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1504360lfp;
        Thu, 13 Feb 2020 22:06:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSmwD6nE2eqfUPoayijjaBV4VIu6yVrXjhRYzS3WgiolgQr28qfu+mGJ740yT1jwn36gni
X-Received: by 2002:a05:620a:2119:: with SMTP id l25mr1085192qkl.248.1581660370102;
        Thu, 13 Feb 2020 22:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581660370; cv=none;
        d=google.com; s=arc-20160816;
        b=F3PHMaBagPNGbsUZDHG2LX16dcVeEE3OcAMSUiiK5lfE3X77KXXDhnn1PAoVtWoh94
         IfwzrOUSzacoU0e7MSPqhMmvEhOqeCrsVRtwRBn/wlYYOw80Eml8df9LNU86FpFxn8Qp
         OT9XZStE+zaB39s75OSzY1KKAak3TDeOJtmhQcWDTtOI4Bsb9f04xK4nxGqYi6yz2zkv
         xZtFEAau2mUUsYNFG+xejnI5Sqq8+JKR9eMuSVLqp2yE49krwglQAweP7GHqeZKLAQTV
         LBWN5ZhXyW3ShNtZVOLyOspyZrbbHCtEYmTC8iv+GjBv2MmlUqyWsAf67qGlregi1plr
         PveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ysOKWfZ4i4647Q8qI4abt59kZ1u1hiLhVP6Ipj7ZhwE=;
        b=YHfIPGYE4oOco+TMTp1MS8CyPsfR7Qfmoyj2E910FQR8wESqGoY9nOoBwnZL43ByLM
         EcskstY/GouV/dw1xXNtAwQ14KWu4Sq3cEN/HjjcIlRch/YaMdSNFMp5WoHnSMljsGa/
         dkYlv7DHYUgP2CBGAFJbvhwr2zc/3rVo0E5fDE4tz2OQLiwxjqUmRPIXIkF85ZzR/wrL
         o5xuIO6flSqI6fu7W44nj/q2Xbt+Yd//qRKvS8L06nPYE4RrQEMoauAqW34x4tjOoQV0
         uMZjpEPvNTwv24FlI5slPOz7rPuL7BqkMldTL5wXHgmxQ3/3bSHBoMdoNYmuGeSGvQZ4
         MPPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KOuUTcsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si1011307qvi.62.2020.02.13.22.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 22:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KOuUTcsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2U77-0003bb-GV
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 01:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2U6x-0003Y9-FR
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:06:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2U6s-0002FS-Ra
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 01:05:59 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39651)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2U6s-0002Do-Ls; Fri, 14 Feb 2020 01:05:54 -0500
Received: by mail-pg1-x542.google.com with SMTP id j15so4395726pgm.6;
 Thu, 13 Feb 2020 22:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ysOKWfZ4i4647Q8qI4abt59kZ1u1hiLhVP6Ipj7ZhwE=;
 b=KOuUTcsPQtZPqCjfPT/HikcmFuRbV1PsjIIPr1UrmZKRzuFZsdp34/7vSmjUhDJuYD
 x63h45XpfPCeZZC587wR6eexuuVilHJGpKy4kiCbh73BpLTTjqtQGFvSUbS6lw4F16V+
 0Girlcre6mgkGzx99Kh+OpYQ4VNoglC5gLn5zPechIvfF+gfwKn1QFaJiRc8CyOFYfik
 ExMYwl9y+JVMOKQHXqb/Bgy2Gyvpe8RtKffAL0kB2ADIG45GmFwrFQmMAeEb0stZjLnO
 Cp4wI6XQQRstxJlj3xRzF0GBUntVyqyWr5DcroqE9ztxiMc2sfYFm5vK7RsdCOJ794Jp
 tdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=ysOKWfZ4i4647Q8qI4abt59kZ1u1hiLhVP6Ipj7ZhwE=;
 b=aOagDiXAkHSJDNjP4U5WqLXWanz6yONf4Ye0dUVXaShdQDmZZWqo6FIs5qutiIn0Sp
 NcVibL3k5qpiugaL2kGhKjXlLR1Q95SgsSONHZ5pnjW3l4SjAvXGrWRBPQxJaG/3BEgl
 otjAo79awdFLixDKu8I55C9cZSuwBVeR2XwNN9e008ljBfRkEcgvZO9gk6JB5PRAg2Cb
 6egHivN/Swh/61ELNi9CMvy9W4qeowoxV3xEBEo4n7Ybs4atxGH4iR798W7QeWcqIMFo
 VkDOPKQ4D0zgW/jXXdfWggVwIClBwbiiQdiq8GPUQPCY0l7IxatVNd/GLAovdKNWh4Pr
 8usQ==
X-Gm-Message-State: APjAAAUvohRMtoWaHjHhoOOmvOLvsJ8fJmqoSGpE/oe9gTlhknKCuXxy
 DMUqZbDSWCztyxsqaziT9Ew=
X-Received: by 2002:a65:6405:: with SMTP id a5mr1764070pgv.284.1581660353721; 
 Thu, 13 Feb 2020 22:05:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l21sm5294565pgo.33.2020.02.13.22.05.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Feb 2020 22:05:53 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/2] hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,
 ps7-usb class
Date: Thu, 13 Feb 2020 22:05:48 -0800
Message-Id: <20200214060548.24939-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214060548.24939-1-linux@roeck-us.net>
References: <20200214060548.24939-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +rioPgaVU2Nm

Xilinx USB devices are now instantiated through TYPE_CHIPIDEA,
and xlnx support in the EHCI code is no longer needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/usb/hcd-ehci-sysbus.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 62612c9f5b..b5a014f968 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -114,22 +114,6 @@ static const TypeInfo ehci_platform_type_info = {
     .class_init    = ehci_platform_class_init,
 };
 
-static void ehci_xlnx_class_init(ObjectClass *oc, void *data)
-{
-    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    set_bit(DEVICE_CATEGORY_USB, dc->categories);
-    sec->capsbase = 0x100;
-    sec->opregbase = 0x140;
-}
-
-static const TypeInfo ehci_xlnx_type_info = {
-    .name          = "xlnx,ps7-usb",
-    .parent        = TYPE_SYS_BUS_EHCI,
-    .class_init    = ehci_xlnx_class_init,
-};
-
 static void ehci_exynos4210_class_init(ObjectClass *oc, void *data)
 {
     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
@@ -266,7 +250,6 @@ static void ehci_sysbus_register_types(void)
 {
     type_register_static(&ehci_type_info);
     type_register_static(&ehci_platform_type_info);
-    type_register_static(&ehci_xlnx_type_info);
     type_register_static(&ehci_exynos4210_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_ppc4xx_type_info);
-- 
2.17.1

