Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4247433lfi;
        Mon, 6 Apr 2020 11:00:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJEIex2F86W9b24JApyAQYws3q6HeyYc98+8iNVMzuWaQ64yNG6F20PP5YECwTx2OnU5Leg
X-Received: by 2002:a37:a2c8:: with SMTP id l191mr22958705qke.120.1586196028376;
        Mon, 06 Apr 2020 11:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586196028; cv=none;
        d=google.com; s=arc-20160816;
        b=0K0reG6EXJruIJgmPDG1KfOM2HfnUdBNp93P/51NEmNUsYxndRtzS+Afqo3WlqxGjx
         kHPxJ7Q9CiSgxSmRzYK/EEcletvmKicMRlgAZTT4rRjFDs+jnPFXW5b0YSPwL3gRpt5F
         J+5OsRLCEIY1M3NHeLrpldbel3HXK74YFnX1WPBUnlg1BNxX3xQiZ04qr0kYifvrCFni
         ZQn/kNFwD+ReF1tjI/L3PuhpK0fCT+H2Qqf1F9LEsTx1/O6ho/p5/R3YtR+FzChpbQjZ
         JJ25OeoceRnEjIWqy+S/rIwVLU9uwCau9d5DO7JJUFXOJ4GE+bYpNGKTfEEMroNelMit
         yYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=z9KZ6eY6DRrXTHj5N0HrtI0MTUlERzvy0/HLB/IrQH4=;
        b=XvWSlrTB7T1DHOJ/74yGpowkmASmwOb2cuCNKwXURnEduEXYeY90x4Sj3uFpu1s9f7
         yMHGhucnTEUEaZndt1OojKq1W41gmRVhyS+uMGk0SqdpAVlZV9LWA0SlvEZIX3J9UnGo
         b5NIZgQ2MTUSfW59fFiLiNke3OFXvVpyLtUQ8FlaSFFAKWhghMUdMQp9wpRgm4vpURBb
         ZS5zl1z5xpIVMABoHwtooN47w2IXx6MmHs8zE7mHRXuMVeTpEV34DC5pFKtKztdCF53l
         Isy3DIqlIdRM481erMWD0u2bIcv/78aZFNKFt6VH2bduih7DJ75YMRWW7QJlzRHqrUmN
         IUng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d6VmOd2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si217182qtm.300.2020.04.06.11.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 11:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d6VmOd2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLW2t-0007XP-OS
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 14:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrV-0002eB-T5
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrS-0003PA-VI
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 13:48:41 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35068)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrQ-0003ND-MG; Mon, 06 Apr 2020 13:48:36 -0400
Received: by mail-wm1-x344.google.com with SMTP id i19so336279wmb.0;
 Mon, 06 Apr 2020 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9KZ6eY6DRrXTHj5N0HrtI0MTUlERzvy0/HLB/IrQH4=;
 b=d6VmOd2kcrdWpMxDbDzEZcYd4jt/mmb6a2Y+psUh0gsZXzUwMEItJsZxVUvE/jfI5Q
 fjOSiZbkMjbmMC6nvigqiC7njn0iDcTP70+DWJTspTa3NcUewCP/wonU7MdYmYtOagsf
 vBfdvyG/meTrD72vWkpnS1sAPAF3mPeshUL1wm/DKJNixBPPuTCxxW2Ks38OA5J44wWA
 Ia1ols52s7j+qqBQ+wO6ovbr3XQ5zLY6syJxUx2hwo0xrVIuA3QqoqO1mITz0hZtT+Pl
 8SEtlOHw740BLWXLBWxdCdJjgoPaxYEK3vgMNGsJjqDqCoLhycHKFh90PxUssnSPyFw8
 s2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z9KZ6eY6DRrXTHj5N0HrtI0MTUlERzvy0/HLB/IrQH4=;
 b=Jt6YO76WXJEbuDWthi4Cqritljx5ve6pwWOaZo768sfTYN5xNSpa/zo0+3K37g0KWX
 iuG8zSYG7AArgKaf41KcSO1OASeVjPj044Avvbyu7nMCdNqbkAA7Iii/dESTH9/KtBW6
 GROLlEmpKJT7UMnH+IV7YK4TXWx4xjGYb5rtZZ/N+aDfyfwvDN1EwT2jHkK5osUHn2th
 uAsXG8ysJb1QWq/SoZn3foIyv+dgCP0ekf61ue9Xp6/nflqCZCs3WDy+xpsY+yc00ijd
 xA77bS666DszuEkuTOLbJxPezafcoA7VJN1MvSAtSORz1dW64+uRGw6SfG097rXPce6Z
 w/qA==
X-Gm-Message-State: AGi0PuaiIT+f7ZegqgRsGD2YQtPzW48Ekl5cOuX4UyfbJ10ne8eD/7wf
 TAWVQNPzQIQYcc1hzhPgTa4K35h6J0A=
X-Received: by 2002:a1c:8049:: with SMTP id b70mr57991wmd.162.1586195312599;
 Mon, 06 Apr 2020 10:48:32 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 34/54] hw/microblaze/xlnx-zynqmp-pmu: Add missing
 error-propagation code
Date: Mon,  6 Apr 2020 19:47:23 +0200
Message-Id: <20200406174743.16956-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Errkbkr2J+ih

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 2aa602cf85..4ecbea7fdc 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -123,7 +123,11 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
     /* Connect the IPI device */
     for (int i = 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
         object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized",
-                                 &error_abort);
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi[i]), 0,
                            qdev_get_gpio_in(DEVICE(&s->intc), ipi_irq[i]));
-- 
2.21.1

