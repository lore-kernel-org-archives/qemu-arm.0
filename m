Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3322352lfq;
        Sun, 20 Sep 2020 10:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAgaRXwRpAWOG2v7ws1ZgBEIiEH5C1meQheUblv3EIe01VzOx+86ZzmCU8wVDtRcLyORYl
X-Received: by 2002:a25:e4c6:: with SMTP id b189mr57796188ybh.503.1600624750136;
        Sun, 20 Sep 2020 10:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600624750; cv=none;
        d=google.com; s=arc-20160816;
        b=zqpfhHkXGKABl4X0/9a7gxlBudPezKqtXn8cvMZ4H0kX2ry6KQBQj03Mu5ImFqFFt7
         vJ4r8TTzb29pXmduCpOxDxp62swKPu/0XH5PtZ8CkWKs0ugIH9DudEKiLds78yFVTEsG
         HGY5bnVHWXhrJ5hDGcjlZMvYHm4vNUlhhL3gPc0j8BjANac906Z3fkSnfkDZ92P945TL
         gJc/5MFm/mdYjyx4mJcqaVft745LgshRm+I+OplUBk7w8HvM1nZzL2i2K4OlI/QX4sno
         3v5oEfFqt6kdkyTHp7rzH3HsgmJWdIAw98kt/xpEJtlJ1kNkOZ1HdF6TM4AjvbSQqeZN
         OUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=exASe8riCxZfialHMwQ4chenzKGKS91MOy7C7us9oAE=;
        b=kuL6FjSQZ4dS3Ir4yAycjqw444LLve9OGHzUar1PomJmHKvMZ5s8AA/pBXOnZj6iVm
         mbb5b821+YwTZHBmc+EkknMkL41sN+cj/aMZYZApHzpcIPrvokYacXMiztDrDBT/GIR3
         4Qa6twhmHJLAxathYjVxCYmDu6nqdVcxL5t0s79lGmRbGlXOZc1R/AdmdV63K3imqkQz
         XWY6eOd1JWQ99R//rscPQxaTWpGNpeCe5GdOvud5EpmzugAFO3trWAFwOx1+BxJqCPAB
         ASFJTx8PmVBPU34pdW+VzS0PKliyH01B1uWe5S7GGNY4Ylu3uooEF6GdJjYuUGk781wb
         lqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aB9ikbhA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si9959138ybf.178.2020.09.20.10.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 10:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aB9ikbhA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kK3cD-0002PQ-IQ
	for alex.bennee@linaro.org; Sun, 20 Sep 2020 13:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3bd-0001tb-Of; Sun, 20 Sep 2020 13:58:34 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3bc-00030I-5W; Sun, 20 Sep 2020 13:58:33 -0400
Received: by mail-wr1-x444.google.com with SMTP id w5so10431944wrp.8;
 Sun, 20 Sep 2020 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exASe8riCxZfialHMwQ4chenzKGKS91MOy7C7us9oAE=;
 b=aB9ikbhA1WxIY00RVeYkATZZwVwF9rr9FdbyV+XjSVrBSII4FeZQMvyiR71cSphkTN
 4XTo1rQ9aWcQMkKOLpbfWtkaGk4097Y0Kaq8nCPZ1VYVyGX3zgzUjlZtfZhBZZZ/PGpQ
 6swYwb9453TbiwzYvfRHh0ZTszsM/J7m9TXuryI3apcRAsSHuZvMrd9kCzVbMXC953wZ
 L/WslWDk2Gk7KB7s8Yo3SE7l8z+UwaP+Dkg1KBDNv+Xhfu2OZGujqLfqhQAfVk0l98ct
 GsZ8XGyaTOcpetncJGKpxAnqV0drPkSej3ksFUHoPx0Cc7xaWepK2tOHNPEt0gdq42AD
 HDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=exASe8riCxZfialHMwQ4chenzKGKS91MOy7C7us9oAE=;
 b=iJziOsc4KD9k3ZJvw+XFovNeSDF1OTdChMwO+5uQxJY5VKdNzej6ybTEOP/VfS3ejf
 voKzERXQn5gRcZTPvRpUAN0ldvkvr8x4ZSkEGDhoY+nOPgFrFJrs6FWhJtOjUSgABXRM
 8sP3C1/3sIi4K0l2kPatiH25TJHLxN0gzhaNzlijdtvQV3Rowwz7rQ1v/yneVCVqDZUs
 oI2mhDj+EFlPlaIYZat9MjnkgRSzZkzCap93fm7hMFvUQQP5lgXqxO4iCoy2q34ngvTL
 SbF+pdxMJ5F6PeKItCd3NLwHGsCa+u1JUd7eaPRwx2+/yqAifXMco0XMjfuJ0Bc5W7Hp
 WPoA==
X-Gm-Message-State: AOAM5334MS7JxBEAhHj5PvZJLv66hOJFsu1GrZpnbOtiaOMqApyvg4BA
 RRsdxMlbIwK5f01HyRRj2mhZEJoE8ys=
X-Received: by 2002:adf:ea01:: with SMTP id q1mr46406039wrm.97.1600624710298; 
 Sun, 20 Sep 2020 10:58:30 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u66sm15675781wme.12.2020.09.20.10.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 10:58:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] hw/arm/bcm2835: Add more unimplemented peripherals
Date: Sun, 20 Sep 2020 19:58:20 +0200
Message-Id: <20200920175825.417680-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920175825.417680-1-f4bug@amsat.org>
References: <20200920175825.417680-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NjPcTqwyFlTS

The bcm2835-v3d is used since Linux 4.7, see commit
49ac67e0c39c ("ARM: bcm2835: Add VC4 to the device tree"),
and the bcm2835-txp since Linux 4.19, see commit
b7dd29b401f5 ("ARM: dts: bcm283x: Add Transposer block").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/bcm2835_peripherals.h | 2 ++
 hw/arm/bcm2835_peripherals.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index b4d3ae121ac..8af8e78f67a 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -47,6 +47,7 @@ struct BCM2835PeripheralState {
 
     BCM2835SystemTimerState systmr;
     BCM2835MphiState mphi;
+    UnimplementedDeviceState tpx;
     UnimplementedDeviceState armtmr;
     UnimplementedDeviceState cprman;
     UnimplementedDeviceState a2w;
@@ -68,6 +69,7 @@ struct BCM2835PeripheralState {
     UnimplementedDeviceState otp;
     UnimplementedDeviceState dbus;
     UnimplementedDeviceState ave0;
+    UnimplementedDeviceState v3d;
     UnimplementedDeviceState bscsl;
     UnimplementedDeviceState smi;
     DWC2State dwc2;
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index a9d7f53f6e9..4e6c678aa99 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -343,6 +343,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_USB));
 
+    create_unimp(s, &s->tpx, "bcm2835-tpx", TPX_OFFSET, 0x1000);
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
@@ -356,6 +357,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
+    create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x1000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
 
-- 
2.26.2

