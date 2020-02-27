Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4976344lfg;
        Thu, 27 Feb 2020 14:02:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqyF71G7IELXPSeLRGGKKX4ktDIiSrOvm02GHpZQ7CC4sI/NcXwJAnfoNGSSlq0fn15cpaqC
X-Received: by 2002:a37:a496:: with SMTP id n144mr1677036qke.126.1582840937218;
        Thu, 27 Feb 2020 14:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582840937; cv=none;
        d=google.com; s=arc-20160816;
        b=mlir4LfJc/+Iufj0LUhkdZHQ+r2PHl5gTr1ryzcYN7xubJy+c2C7Tuu7Fcgtu8cBP5
         ZGsBBpP1QRikp3vGl8LMIFcdFMe8l0+j5wGD1ehKQ3nCaAhHi2+YXB07Z3PVBW8KAjA5
         wGX35NX8h/MAuOJrGxeSTo24GlLsi/2Rm2Aq2YMpArxNuF1hQJudmDdCt1GfidJBgkvD
         kGT6Vmlqvg0NQR/jimjgkm1Em8yL53b87pQyDW2YCxG9SDJSxAu4UWPZ9j1RiBo0ExGn
         2qyuq3bBHG2/MnDacpc0jZIu476PLIukL+Ad1u5sXoaKVgRXNktspQ3IDnyx9clHQB4J
         cR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=zZS79vliNn3E7I89zlAY0tg2EKwBR1ZC6u6n1nsEkUU=;
        b=SSMnrNLJNDD5eX7YUeoA71TNuwZ7H5ygzjhDIIfcGuMezC9tOhFSScHBEen0jwWTA7
         1yHItbKLFhFLIi5NCb154ZCox1017GW3LBxF/w/OiUwhk39ON/bhrlEG0vZjme5Y7Svj
         N9irTzaCEYI2PxMO9D4U7nm2jF64uGsi5zOEmY4b+NfoiFFZJFo1DgZR3mGRZnjOk70I
         Cb7grxZTJLmKOQWsu1Tde1mHWNTg8/AkZkJW/FnjEbD7+afAjiVWJ8tWm5zLU3VlwD9N
         +BArLsPJc2GjeHcj+nGxtsccLGS4h8VZSx5lAE6M3iWNINilRcCWKHjRE20ShecqObtW
         x2tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LCG+xv0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v123si341874qka.217.2020.02.27.14.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 14:02:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LCG+xv0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7REW-0001C4-Lr
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 17:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REL-00019J-AE
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 17:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REI-0003lR-R1
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 17:02:05 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38887)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j7REE-0003jz-IY; Thu, 27 Feb 2020 17:01:58 -0500
Received: by mail-wm1-x344.google.com with SMTP id a9so1106670wmj.3;
 Thu, 27 Feb 2020 14:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zZS79vliNn3E7I89zlAY0tg2EKwBR1ZC6u6n1nsEkUU=;
 b=LCG+xv0LPzhtZK/Yv0BWy/bhOzHLYl7LC+6NEIni3/gV1ZbTowfSj8riwYKHqVDLnf
 RO7hRGDt+PeM/fGE5l/R/tnvMrWAs2fwTFY4S+DZO/GznZKAZGL/AIxnDRBI2LY4Myra
 /my2IHlvj05hAyF/0fF8P/0+5Fw8QJS9W9U3TWfnqR7d/9F2Qj5myYCtR+cTtJBE9UAa
 St+tPNtinqHGFPn8Mdx66NFQyphtW2dHaeHrjJwGVTZH68ccpWk4QOy/d30q85X91bhQ
 ZV46fZSGU+IUpkw+S7hFr1y0o0clHOr1hMX7pOot152EH24sGVWPiouHiyYfkN9Cr6gK
 PbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zZS79vliNn3E7I89zlAY0tg2EKwBR1ZC6u6n1nsEkUU=;
 b=N7sU6RNk/xzxi8IzL4hy4dxInJqiUmD/5iN7Xa3gE2x2vpklV2lfXU+Oe7565WMx3p
 lOdrrVY+dHQ/apHF/Ueaaf9EsD8k9LPB9v936XHkohD3Lv70OlD2g7olESGE5TT5VkNV
 ZBTlr+1Qxy5aOTGXtSuu7xVursurufitZjRwohNsp+kLWWuxwRMdcuMkx9bvuTPZLMtq
 K2HY8lf0sVwNxvHV+CllACJlPr+pQnCTK+N1tm6/Gmtn1wVE2Kqvh5D2yfETuE0WUc9K
 hYD9DbOT9Xrw73si7Hzs7U9DGfD2PGu9xRkkyDc8pRCL3NFeGZ5pzl2Kfm3FDYMeyIVj
 sPRQ==
X-Gm-Message-State: APjAAAW3WP+nuSJ3xNJtCAwbqLy2RWE0JiZNzpOoCXuUnB8m3hDyYAkM
 XlpPbZL0Fxg1fLAyYInt+k2nILOK
X-Received: by 2002:a7b:c392:: with SMTP id s18mr806466wmj.169.1582840916604; 
 Thu, 27 Feb 2020 14:01:56 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id z14sm6447040wrg.76.2020.02.27.14.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 14:01:55 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/4] hw/arm/cubieboard: use ARM Cortex-A8 as the default
 CPU in machine definition
Date: Thu, 27 Feb 2020 23:01:46 +0100
Message-Id: <20200227220149.6845-2-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227220149.6845-1-nieklinnenbank@gmail.com>
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22YVtE821oce

The Cubieboard is a singleboard computer with an Allwinner A10 System-on-Chip [1].
As documented in the Allwinner A10 User Manual V1.5 [2], the SoC has an ARM
Cortex-A8 processor. Currently the Cubieboard machine definition specifies the
ARM Cortex-A9 in its description and as the default CPU.

This patch corrects the Cubieboard machine definition to use the ARM Cortex-A8.

 [1] http://docs.cubieboard.org/products/start#cubieboard1
 [2] https://linux-sunxi.org/File:Allwinner_A10_User_manual_V1.5.pdf

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/cubieboard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 089f9a30c1..0195925c73 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -68,8 +68,8 @@ static void cubieboard_init(MachineState *machine)
 
 static void cubieboard_machine_init(MachineClass *mc)
 {
-    mc->desc = "cubietech cubieboard (Cortex-A9)";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->desc = "cubietech cubieboard (Cortex-A8)";
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
     mc->init = cubieboard_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
-- 
2.17.1

