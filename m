Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1459884lff;
        Tue, 10 Aug 2021 09:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi8QluLAhcbU0B5b2gJ68yet3jpfnYqRosbknXUTVM8JzL+LkgKPFTNIW8yHby+oXEDJuT
X-Received: by 2002:a05:600c:4f0d:: with SMTP id l13mr23166319wmq.18.1628611514535;
        Tue, 10 Aug 2021 09:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628611514; cv=none;
        d=google.com; s=arc-20160816;
        b=zz9OMybQPulKgdSYsX8Hwuq6vdnldfUT/4yUyq2ZSnXnOmf1LiyUaoU8U1jbO48OM1
         197I0ds1XKCGk61+aNnauki+UXB6eve/w9ROfTMhwD9ipAFwUPLgBPFz5dUC126gJ+I/
         tXwHTOKd68k+Yr6OTjA+2jBllJq7fuWjpwzVhrGHDal9vF8BKOsJjRVHx2EkLutW4sDr
         B4jK5kBj03AiUJUXFxpIE9sxEL6s4IRxFZl8oPStSvOkDFD2F+H1yJQvOxOPi1JAXFyG
         2uFjNqADfc2vxGkDG/23LTYcJHmJ6c/k8lKUbFouGqiZtfObvstZja/Xny+DUW6CQgEE
         pzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xyO2D/PGYKw4LKuX/0kARbomBM1j7i+nlR1wL+84fmU=;
        b=YWp6XwRjwHLzNfYLNpbTBioiboK5MjTuQ/fuPMIfNCLJXsJAEMt6iMbuAP2Cf4Ts0R
         vEA1kxfWP/OZPRqsF1yFvWfbpsF/V1C0qI1V1W3esmsxpsRtRxArrLRbkqDBdP/DiD0x
         /uDvEaQUCt7sLJvR1RbrwAa6fSsQkqfbtmCClNGom6qXqBcbC6auTGM/Z5HmkD75AB+6
         JDANFVvvKjANYZdNA7uf+yV7S0lcMOHfYFjFewXQlRpRE43zV8OPy6QnD+3arBG7HzSo
         q5MaZEdfIVORnOfUqZpeNno1iqYKww9oIrhG/l36NeTQM4v/2zyX6rDrt/3ee5cS73Ky
         R0Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uOGMM8UJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si4357469wmg.209.2021.08.10.09.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 09:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uOGMM8UJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDUFd-0003wC-IN
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 12:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDUE6-00022S-K3; Tue, 10 Aug 2021 12:03:38 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDUE4-0000j5-Lg; Tue, 10 Aug 2021 12:03:38 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 108-20020a9d01750000b029050e5cc11ae3so2263657otu.5; 
 Tue, 10 Aug 2021 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xyO2D/PGYKw4LKuX/0kARbomBM1j7i+nlR1wL+84fmU=;
 b=uOGMM8UJXjDzyWoHRATuvJzoW/CFegYVUZcK5txGVRE3gqMNhZBVNTufmHldIF/pJJ
 Wo/9J3E49NQ++CnI4Z1zz+KJrtXqPjH2VF7kOCzRsPSv6rF4Fq+ngN6lLJ+RdKvwqNRz
 ikCCNRGk06Z79NpAyV5uCIJOp8VsIoMlU0GS2ei1CPfwJONgxplh125MXaNlCAITsjbN
 zPHwC8f2df+T1ziHHP4p8tIEGArA7d6gCcsuTgi+OlEYkUQjMLWlucDAQpiBZEByuFSZ
 sbJvrpL8iUcrfKY2IIzGeyqQ/JUT1/S4zM/SqVwe6mG3ONOceUHiyPi/uHCLGK7kzKsU
 pN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xyO2D/PGYKw4LKuX/0kARbomBM1j7i+nlR1wL+84fmU=;
 b=D59jTMJSWzLXGrG3iGVRKWZpMt5BWakqDPC8GwcF/IwVTRed5ZfjTvA7DIneENY0w7
 uS34n6kjdcjGXtsJohpto5PJCS/7dYUIiJON95h3KJ0/335aTV2kTxnuFaQfVe276aVx
 wIpeDuR4Js++pjD1VYXH3wnrPkpzmmHwCbyKQ1PZo2gUzJkIu72vuQ7UEe/kbMlp5blC
 Gq0R/MH9m+1PF+0/pejRb7YgcA/4Vgllv3KYcUIk1JZlOPoiA0dW0xea9nNY2MF7DFgF
 R4sGCkJBfsCMKJLdyOoU1OOBgUnJ+HddgaH+6KAkxUE5fD9J72UW3fkYjnLDOooC/WzP
 FjZg==
X-Gm-Message-State: AOAM532ItUUuyjPzyjjoBiFsVud9fSOJXx3cR8EShxIfE0+mhK5/6mC7
 rQMe9ON6F0Gp9e4TP6tefbk=
X-Received: by 2002:a9d:175:: with SMTP id 108mr3174289otu.366.1628611414972; 
 Tue, 10 Aug 2021 09:03:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b11sm556745ooi.0.2021.08.10.09.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 09:03:34 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as unimplemented
 devices
Date: Tue, 10 Aug 2021 09:03:18 -0700
Message-Id: <20210810160318.87376-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hoceuAQaxC9W

Instantiate SAI1/2/3 and ASRC as unimplemented devices to avoid random
Linux kernel crashes, such as

Unhandled fault: external abort on non-linefetch (0x808) at 0xd1580010^M
pgd = (ptrval)^M
[d1580010] *pgd=8231b811, *pte=02034653, *ppte=02034453^M
Internal error: : 808 [#1] SMP ARM^M
...
[<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)^M
[<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)^M
[<c09580f4>] (_regmap_write) from [<c095837c>] (_regmap_update_bits+0xe4/0xec)^M
[<c095837c>] (_regmap_update_bits) from [<c09599b4>] (regmap_update_bits_base+0x50/0x74)^M
[<c09599b4>] (regmap_update_bits_base) from [<c0d3e9e4>] (fsl_asrc_runtime_resume+0x1e4/0x21c)^M
[<c0d3e9e4>] (fsl_asrc_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)^M
[<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)^M
[<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)^M
[<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)^M
[<c0942dfc>] (__pm_runtime_resume) from [<c0d3ecc4>] (fsl_asrc_probe+0x2a8/0x708)^M
[<c0d3ecc4>] (fsl_asrc_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)^M
[<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)^M
[<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)^M
[<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)^M
[<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)^M
[<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)^M
[<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)^M
[<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)^M
[<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)^M
[<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)^M
[<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)^M
[<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)^M

or

Unhandled fault: external abort on non-linefetch (0x808) at 0xd19b0000^M
pgd = (ptrval)^M
[d19b0000] *pgd=82711811, *pte=308a0653, *ppte=308a0453^M
Internal error: : 808 [#1] SMP ARM^M
...
[<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)^M
[<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)^M
[<c09580f4>] (_regmap_write) from [<c0959b28>] (regmap_write+0x3c/0x60)^M
[<c0959b28>] (regmap_write) from [<c0d41130>] (fsl_sai_runtime_resume+0x9c/0x1ec)^M
[<c0d41130>] (fsl_sai_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)^M
[<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)^M
[<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)^M
[<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)^M
[<c0942dfc>] (__pm_runtime_resume) from [<c0d4231c>] (fsl_sai_probe+0x2b8/0x65c)^M
[<c0d4231c>] (fsl_sai_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)^M
[<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)^M
[<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)^M
[<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)^M
[<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)^M
[<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)^M
[<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)^M
[<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)^M
[<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)^M
[<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)^M
[<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)^M
[<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)^M

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Updated description to include tracebacks and to use the term 'instantiate'
    Added inline comments describing devices in more detail
    Added Philippe's Reviewed-by: tag

 hw/arm/fsl-imx6ul.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e0128d7316..1d1a708dd9 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -534,6 +534,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("sdma", FSL_IMX6UL_SDMA_ADDR, 0x4000);
 
+    /*
+     * SAI (Audio SSI (Synchronous Serial Interface))
+     */
+    create_unimplemented_device("sai1", FSL_IMX6UL_SAI1_ADDR, 0x4000);
+    create_unimplemented_device("sai2", FSL_IMX6UL_SAI2_ADDR, 0x4000);
+    create_unimplemented_device("sai3", FSL_IMX6UL_SAI3_ADDR, 0x4000);
+
     /*
      * PWM
      */
@@ -542,6 +549,11 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
     create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
 
+    /*
+     * Audio ASRC (asynchronous sample rate converter)
+     */
+    create_unimplemented_device("asrc", FSL_IMX6UL_ASRC_ADDR, 0x4000);
+
     /*
      * CAN
      */
-- 
2.25.1

