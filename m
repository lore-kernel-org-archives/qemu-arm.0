Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3068234lfh;
        Sun, 22 May 2022 11:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQpai1R9b7h3d83PRFrZM1iDUtS3Rd6463apww9qzIKUCPqdW/Zx5Nxqn/c9qFvCrK3Ud5
X-Received: by 2002:ac8:5943:0:b0:2f9:1629:a8ab with SMTP id 3-20020ac85943000000b002f91629a8abmr11817220qtz.269.1653244633587;
        Sun, 22 May 2022 11:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244633; cv=none;
        d=google.com; s=arc-20160816;
        b=FggsrspgC4UYC30DT/+9t82UM41oHhmiAyMZEfi2Z+QqxOj2gIt0HEN4UgaLjGjGzi
         GI+JeRwMns+04Co5Ap/bkNCkGfKn8a0pbksn9W2oYdb9Z2+Q46d1tRIfSLjWrej3YddZ
         d9H9DNnKiOUT6+sj7X44YrLR36RHc/1qnSVlM6gYoj9QB06mT4Y+gI0JUvRzykPtvmlV
         90qr+ezT4fnKzikD4RmofsqnG2hXlGGilgkK7LGU1x/Pkf8wIUJPJR9d8QyGRDBbeUoP
         Ky/sqaVzlDF+HicTDj0uD66WTYwaObn7bKaA1GpXXuVT9CXEk9u0LvEWjxF96dCP6hGT
         RF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4369/+BRUuRdx7Ea5h7jsV2hi+E/Iuo2IKmZnun7sfo=;
        b=xy+uAdO10ZI2b+5v7wYFzg5qZcqhQl4VfCNfkgbizFG8FuNul+An4E0CBgEa8KKbM0
         2lXPhXWsfCgEsxBJeUdpNHVC/rznwXTDwRbM2JqV8FstDErm2HW3PeNppTkTBdDlfWJs
         ne7oXyulkyzqtZk2WfjjdqPEIf1ZrzerQUU13xWlsLKWDlT9w3UaVUVg822udbLRf/tz
         J7e4BiCp7kSUYHzFyxqfx6VxpJa2AKjhGnTAN77odwehNR+g+xHrJ4BT2fu+KvGtM3L9
         wLBOq0WSkf+u9gXFRl3ePWbuKDOGz3vMRf5e1XKkZjnWm92sWr4jGat+CtvaS9OHlSM3
         xk+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=p9hWrRDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05622a164a00b002f12dadaa45si1994572qtj.612.2022.05.22.11.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=p9hWrRDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqS1-0001KD-2f
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC9-0008UB-Lf; Sun, 22 May 2022 14:20:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0003tR-0T; Sun, 22 May 2022 14:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4369/+BRUuRdx7Ea5h7jsV2hi+E/Iuo2IKmZnun7sfo=; b=p9hWrRDdD5Uq0Ld3CtGXWqTnTz
 isFDeNcO4t2OcRI8EcfLupEIWB2KUjkEKg7QDoNbSzElLvcsa7ol/P0MxWhD9d9Ek2QJeIJIsqh3u
 7yspq9dU1x1qCoiHQ2Q/geFQBldS12kJnd/sjpe+Sk8mBibbrS4zM3LeUXgAa3rIJ03DDvfzQUE6b
 p+5/BG5O2zo828pZxALAwxF8m1Qowrte3M0hTQiRi6+91LVHEKtOtPVvNq32bvSwc/h/55D33L75W
 RppwX9UEnysxHKW/9PEMXIddW01gDRVKYOvrADovTrmOVh4F/+4ZWV927nZmyjTrOlt5a97zfv/Q/
 IxxCOTX0XEnRkJWb0Z05Vln/JtFf00aeOyA9joR1cC/6+HXW73+iZcxQ5c2OKKEHikqC9AAcMKltw
 WwsrWualrSR7BsAosm3D2n7fjOdwc1NMNkqIvwtmd/U3DzjuEhQt47AxsQA/T1l5OnmLRNKY++P4C
 kONl/zuEoSW3ZC9Bns6S1RfLfWPBtCcsvP72ouZ/gtnVCyigyMeXcYmUz7XCaDqK7ddzs3dDns+2L
 brprqXbra0UOlcibeW2epe5hLv+s592KOA9ZPuACHZZNiY+Wp0fbXPCCnqLyAKqpzgIKfJvdUgCiv
 u7vR0EMatAcUr2d3x8EpCMF9QgUQeWyFFlOBSuuk4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAe-0007pH-32; Sun, 22 May 2022 19:19:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:25 +0100
Message-Id: <20220522181836.864-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 39/50] lasips2: rename lasips2_init() to lasips2_initfn() and
 update it to return the LASIPS2 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ev1OopsLpIw4

When QOMifying a device it is typical to use _init() as the suffix for an
instance_init function, however this name is already in use by the legacy LASIPS2
wrapper function. Eventually the wrapper function will be removed, but for now
rename it to lasips2_initfn() to avoid a naming collision.

At the same time update lasips2_initfn() return the LASIPS2 device so that it
can later be accessed using qdev APIs by the HPPA machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/machine.c          | 4 ++--
 hw/input/lasips2.c         | 6 ++++--
 include/hw/input/lasips2.h | 3 ++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index d1e174b1f4..1fceaf2072 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -286,8 +286,8 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* PS/2 Keyboard/Mouse */
-    lasips2_init(addr_space, LASI_PS2KBD_HPA,
-                 qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
+    lasips2_initfn(addr_space, LASI_PS2KBD_HPA,
+                   qdev_get_gpio_in(lasi_dev, LASI_IRQ_PS2KBD_HPA));
 
     /* register power switch emulation */
     qemu_register_powerdown_notifier(&hppa_system_powerdown_notifier);
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 2caa80bd3c..85da4081e3 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,8 +245,8 @@ static void lasips2_port_set_irq(void *opaque, int level)
     lasips2_update_irq(port->parent);
 }
 
-void lasips2_init(MemoryRegion *address_space,
-                  hwaddr base, qemu_irq irq)
+LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
+                             hwaddr base, qemu_irq irq)
 {
     LASIPS2State *s;
     DeviceState *dev;
@@ -272,6 +272,8 @@ void lasips2_init(MemoryRegion *address_space,
     memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
                           "lasips2-mouse", 0x100);
     memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
+
+    return s;
 }
 
 static const TypeInfo lasips2_info = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index ddcea74c14..5a35c22f73 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -33,6 +33,7 @@ struct LASIPS2State {
 #define TYPE_LASIPS2 "lasips2"
 OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
+LASIPS2State *lasips2_initfn(MemoryRegion *address_space, hwaddr base,
+                             qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.20.1

