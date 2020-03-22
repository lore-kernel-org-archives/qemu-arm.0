Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp664575lfi;
        Sun, 22 Mar 2020 13:55:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvWNUxXbvigs6ARDs0OVllC2CA0bgvYfYrEVgRYoYZFiBGAkSn/MtcNIRIueOhOIAP0QYGS
X-Received: by 2002:ac8:6d01:: with SMTP id o1mr18829294qtt.246.1584910516092;
        Sun, 22 Mar 2020 13:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584910516; cv=none;
        d=google.com; s=arc-20160816;
        b=by5p2Gfj0SAAp8R4SbCptCPDyJfjwegynLytWsIoEk8TxSiO+5YgAWvy6+BEQklz7U
         wRt+MTCf7zxk2YNITpqpEqkU7p5Qzz0/waU4jiXEZ7fDENeJTu03UHaGMWIoDpiYDS2a
         Se343kv63a8f13XqSU8HBWoIY9kCKP/4nsSVisKv9YaXU0KCW0E6SeqCewwJRyFIdoCi
         t8ZIyy8cQyGiPseEALXny8dylTuagsOtj78eWD7fn4AC1bHLrO6ktdIs/V5ZlWkoxg6M
         9halrAb7NGGqqaIXQGvU3nyZGTMQqydJ6OSa4eDdprGOYsG3ZIH8F+qHV4iT6pP0i3ES
         3iGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=b+iEG6NgD+qJY3iETm1Vxe+CjvjfGQQXFzkKx5oalXs=;
        b=NIhW+FG2S7hlTbdcUKJsf4Tmu7bX4mdOMsMSqYKaU7AZsY1vrgbRMjcSuF9xKJ3m1K
         RVXTj6nJxfc8nxJrht7qX07z3lfiVROeCsA8fcOFqsApU7e2U2M2/e6osJ5dZ4wJqaio
         tIqvqZ6bQLfQj2aRgyCNKpTKDiIDoNE4PHf9fnBf3ISjfWAAjfUIbCJv4VOGgD9kSU15
         kBhQeJ6M8C4hB1Veqax9rYOhs+EGYcyeD1XVVFhZHkNgIxJHDcK18neOAuloq6k6Zg79
         rXzYEaiTpFtGIQDGToTE4AkGbFsNu2xtuqg5OIq6QI89yi1bcdQiFiQ771C4nbRhKw1W
         R3Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fL99Mj4i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si7422022qvy.27.2020.03.22.13.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 13:55:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fL99Mj4i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG7cp-0001Z4-F6
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 16:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jG7cN-0001Tg-O1
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 16:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jG7cM-00017y-N0
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 16:54:47 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38132)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jG7cM-00017c-F5; Sun, 22 Mar 2020 16:54:46 -0400
Received: by mail-wr1-x443.google.com with SMTP id s1so14434449wrv.5;
 Sun, 22 Mar 2020 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=b+iEG6NgD+qJY3iETm1Vxe+CjvjfGQQXFzkKx5oalXs=;
 b=fL99Mj4itHablf4yOqJowsf9KdMGkIcmSWuqgDR3gmi3BdOYcb66f30IAKjdK93A5+
 IUmA5FxiZ36oj1t51P76lQSGJn2kFRovvTg0Vn4hqEjiMqedoSt95RLE8Lx8JdAYlAvR
 MjnDdxGq7rCUW1QImwj0NwXwyygsN8kRO6xMnJit16m4YAIrTMUPMQeH3DoxOoXXw9Ir
 6iFXsySjeY8lvMtKdphbuDvzmvIxj0vIr+NLVqSe6+O90uET+Zll8wxpH9oPoft+XU9K
 960/FvqjzU2Rf9zPhC/s6u445CN4muGvFmyloqPm/1PCa6qqrYL5yF5KO/iC4c0vL1nr
 /Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=b+iEG6NgD+qJY3iETm1Vxe+CjvjfGQQXFzkKx5oalXs=;
 b=R/ALg+xXB9msm8Gzcvydunan3Kv/ynybZmUKzwzt7lKMX0ZL9UEL1Bs/enisTuGEpU
 Lsi7OQN9noe0wTgTwz8NUzcgveVx+kFgLeqMD2ZvrS/HNCtaG1LbrNh3dCJD3ayrGyHH
 wEyI6a5MmONa8bFhqQV816ZN6vIvm8e4oD1kquVL4pz53s34zEsASHZT8uZnoR/qLnxT
 alBPSeOy50JqtIFx+kX6HSiMZDTdUpYifmhMQ2xszE6xEJbObccTF9+hhuYvWyuW7x7w
 3Lrr5z+Pt0bM4bxESNGmkF+lCWipwp9NhbrDn+5PeoNpnsJ3LD6HAdfB0d8QLP1/SJac
 rKkQ==
X-Gm-Message-State: ANhLgQ37WOUq2s4AxZ2dLxwRS9WOQWOZMPx7bSz3lnQ5TpwzSi97D/XG
 ou54Y7XRAcKoH/RvNV7iQrSAP1C+
X-Received: by 2002:adf:dd86:: with SMTP id x6mr19047071wrl.169.1584910485010; 
 Sun, 22 Mar 2020 13:54:45 -0700 (PDT)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id w7sm21083875wrr.60.2020.03.22.13.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 13:54:44 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/orangepi: check for potential NULL pointer when
 calling blk_is_available
Date: Sun, 22 Mar 2020 21:54:38 +0100
Message-Id: <20200322205439.15231-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dAOFfuKV8324

The Orange Pi PC initialization function needs to verify that the SD card
block backend is usable before calling the Boot ROM setup routine. When
calling blk_is_available() the input parameter should not be NULL.
This commit ensures that blk_is_available is only called with non-NULL input.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/orangepi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 181f5badab..a9f64c5680 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -104,7 +104,7 @@ static void orangepi_init(MachineState *machine)
                                 machine->ram);
 
     /* Load target kernel or start using BootROM */
-    if (!machine->kernel_filename && blk_is_available(blk)) {
+    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
         /* Use Boot ROM to copy data from SD card to SRAM */
         allwinner_h3_bootrom_setup(h3, blk);
     }
-- 
2.17.1

