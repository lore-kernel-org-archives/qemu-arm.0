Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1548875lff;
        Tue, 10 Aug 2021 10:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk8wodZ/AbtMaOkeUfgzB8w5P4rQfV076XIERIRC0JTH+SLFv//S9dsZjtzL6j+Y7q3HLA
X-Received: by 2002:a05:622a:610:: with SMTP id z16mr26320772qta.99.1628618222621;
        Tue, 10 Aug 2021 10:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628618222; cv=none;
        d=google.com; s=arc-20160816;
        b=SIJ0Xz9lyoP5ouQlOKps3zcz7nsTNRn9Vf2S16ALGxqCOZOo5vXW4d56w427o90wPK
         SZ5JiYpp3nfySb+zPupfY3doVzrzuyITNmh2J3xD3095utO3q09bkLOFo0Ov1u0MP16y
         2IrSAR1QNQ1E6SOasX6LPB2z6ZMn0Dw8XGXUOliT1nJOdDEbRoAFGGPjALfWzTbKPfXe
         qcnqWq0zvfuqyXwArkUoAB6iJLxM9ZoMEWDPBP+c3glrU1b2IDqO178EVb/r8U7IPe3b
         lSevbP9yYuz78lV8Tew4qdEnrgrXtH8HRXHk3imZGZxBjlHxfYo5miIoULdm1YS7CFDa
         PkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qS/22leVWfTTilKCAwDu9JaM+8d73K/CskvFmLZ/x2o=;
        b=PkwUUFFus8RH08tC8D+9A6254CKLMcWX4evwtk0/0UcuUv82Q5a1fYxb4oAOa7781r
         Vofk1qGkShQB66L760JI13knj839kMizISWWIYoImHhh6BJcrZXa68Sc+pgPf3SrImiH
         kqhXVAxuhZBYASFWYI2ppDp9Xju2r0hge2G4MBP6lKMLDT40GBmwkKeJrq2FywBQM8Gp
         X0b16Ne4Eupt0BsN8N1CX5r+TF2Ek9nJ381dHpK/aXIPcKLd/fyy4Gs/waYQyUMPUc68
         4FI8MISl5e/JeXGieHXnntL1KtKg4okXZX7WZR4maG3D8dqEEfYUUBPIxof1dddCnI5J
         UZfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tRcutMaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si4312748qtm.224.2021.08.10.10.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 10:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tRcutMaz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDVzq-0005DS-3F
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 13:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDVz3-0004Is-ET; Tue, 10 Aug 2021 13:56:13 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDVz1-0006tM-Oi; Tue, 10 Aug 2021 13:56:13 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 r16-20020a0568304190b02904f26cead745so33771otu.10; 
 Tue, 10 Aug 2021 10:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qS/22leVWfTTilKCAwDu9JaM+8d73K/CskvFmLZ/x2o=;
 b=tRcutMazKZq/76aJ6+IiJrAcTR6ufedTzc40tj25timU4JI1snepvR+r/QNm5xmCt7
 LRkHlAVF3ITPUhms8fkWWB//UhmCs82CfoXMYkEAnEdd/eDPfysivXCiNTDCJLG7BiyX
 JJARqH3YkAdJkSS8x8g7aPYFVSgP1yyMEjoZ6FMuOyL2rGQSZHQJQLFSj46nmp0slu/E
 fncYMB7VejQ7Qug/Hp1iNyUI/LA4OCNaWb8hkebcM8wlR7ED7a7Z7YxebdJ8JW5pAqEw
 HWdFR+7NjvylpMrHqM10fnEGl8TGjpowUfkkojF9Wg5TAjNBptVqUxuN0dDdzQi6f09y
 mAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qS/22leVWfTTilKCAwDu9JaM+8d73K/CskvFmLZ/x2o=;
 b=XHSA7oT53C7bQRuQWh4hTYrXu6dgi9EE29z3XnBELFcsaPa1Gxq5qb5AqNwIy7eJfC
 bypPswE4V6V3ej/4l0TEwiBA+fg05QE4V6UA0HoTamDB6Rt/1DdkDvfcqNe7AhkHrKPE
 zkuYQPukUBvjnjemWCHIIVJIao6h9s/FLkz9W2obvUOOMEHB1b2/F8KPAGOCRwfUrVq5
 bhW3o/c5nTVTGxilOXd6vxGT3+nTKgeUnBiMBHKlue4GXXqPZ+8CG3FabDl42uIZ3oYr
 HcoBI3Ozrq7KSJYX9oV+SXq6JdkfLy2eKX6l1AGLYAJW1YxsasPJ33lU7b7rYu1QZ05+
 0Xiw==
X-Gm-Message-State: AOAM533s/ld6L1Bb6LxmIPTv2BE4jWLplDmPkXjP7iWyzNIbMwDJVe5v
 P/lYkKNlXuEGrfkRqyDFMH0=
X-Received: by 2002:a9d:1c85:: with SMTP id l5mr17138262ota.5.1628618170398;
 Tue, 10 Aug 2021 10:56:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e3sm3427270oow.34.2021.08.10.10.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 10:56:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
Date: Tue, 10 Aug 2021 10:56:07 -0700
Message-Id: <20210810175607.538090-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32f.google.com
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aJ1Ro8NIHeUX

Instantiate SAI1/2/3 as unimplemented devices to avoid Linux kernel crashes
such as the following.

Unhandled fault: external abort on non-linefetch (0x808) at 0xd19b0000
pgd = (ptrval)
[d19b0000] *pgd=82711811, *pte=308a0653, *ppte=308a0453
Internal error: : 808 [#1] SMP ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc5 #1
...
[<c095e974>] (regmap_mmio_write32le) from [<c095eb48>] (regmap_mmio_write+0x3c/0x54)
[<c095eb48>] (regmap_mmio_write) from [<c09580f4>] (_regmap_write+0x4c/0x1f0)
[<c09580f4>] (_regmap_write) from [<c0959b28>] (regmap_write+0x3c/0x60)
[<c0959b28>] (regmap_write) from [<c0d41130>] (fsl_sai_runtime_resume+0x9c/0x1ec)
[<c0d41130>] (fsl_sai_runtime_resume) from [<c0942464>] (__rpm_callback+0x3c/0x108)
[<c0942464>] (__rpm_callback) from [<c0942590>] (rpm_callback+0x60/0x64)
[<c0942590>] (rpm_callback) from [<c0942b60>] (rpm_resume+0x5cc/0x808)
[<c0942b60>] (rpm_resume) from [<c0942dfc>] (__pm_runtime_resume+0x60/0xa0)
[<c0942dfc>] (__pm_runtime_resume) from [<c0d4231c>] (fsl_sai_probe+0x2b8/0x65c)
[<c0d4231c>] (fsl_sai_probe) from [<c0935b08>] (platform_probe+0x58/0xb8)
[<c0935b08>] (platform_probe) from [<c0933264>] (really_probe.part.0+0x9c/0x334)
[<c0933264>] (really_probe.part.0) from [<c093359c>] (__driver_probe_device+0xa0/0x138)
[<c093359c>] (__driver_probe_device) from [<c0933664>] (driver_probe_device+0x30/0xc8)
[<c0933664>] (driver_probe_device) from [<c0933c88>] (__driver_attach+0x90/0x130)
[<c0933c88>] (__driver_attach) from [<c0931060>] (bus_for_each_dev+0x78/0xb8)
[<c0931060>] (bus_for_each_dev) from [<c093254c>] (bus_add_driver+0xf0/0x1d8)
[<c093254c>] (bus_add_driver) from [<c0934a30>] (driver_register+0x88/0x118)
[<c0934a30>] (driver_register) from [<c01022c0>] (do_one_initcall+0x7c/0x3a4)
[<c01022c0>] (do_one_initcall) from [<c1601204>] (kernel_init_freeable+0x198/0x22c)
[<c1601204>] (kernel_init_freeable) from [<c0f5ff2c>] (kernel_init+0x10/0x128)
[<c0f5ff2c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx7.c         | 7 +++++++
 include/hw/arm/fsl-imx7.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 908aa6ca8a..81daac7747 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -483,6 +483,13 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("can1", FSL_IMX7_CAN1_ADDR, FSL_IMX7_CANn_SIZE);
     create_unimplemented_device("can2", FSL_IMX7_CAN2_ADDR, FSL_IMX7_CANn_SIZE);
 
+    /*
+     * SAI (Audio SSI (Synchronous Serial Interface))
+     */
+    create_unimplemented_device("sai1", FSL_IMX7_SAI1_ADDR, FSL_IMX7_SAIn_SIZE);
+    create_unimplemented_device("sai2", FSL_IMX7_SAI2_ADDR, FSL_IMX7_SAIn_SIZE);
+    create_unimplemented_device("sai2", FSL_IMX7_SAI3_ADDR, FSL_IMX7_SAIn_SIZE);
+
     /*
      * OCOTP
      */
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 6cc5752457..e8d963b6fb 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -175,6 +175,11 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_UART6_ADDR           = 0x30A80000,
     FSL_IMX7_UART7_ADDR           = 0x30A90000,
 
+    FSL_IMX7_SAI1_ADDR            = 0x308A0000,
+    FSL_IMX7_SAI2_ADDR            = 0x308B0000,
+    FSL_IMX7_SAI3_ADDR            = 0x308C0000,
+    FSL_IMX7_SAIn_SIZE            = 0x10000,
+
     FSL_IMX7_ENET1_ADDR           = 0x30BE0000,
     FSL_IMX7_ENET2_ADDR           = 0x30BF0000,
 
-- 
2.25.1

