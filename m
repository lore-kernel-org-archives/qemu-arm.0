Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp424813ejb;
        Sun, 18 Feb 2024 17:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuiu3N0wfxM/oO3L34fosua+4H8latqOTrA5k6qSQz7CMgrfP5pmG2W4YxwjpbjFf5l79x0keQbeZH8uIwzkyLSuIUEt3L
X-Google-Smtp-Source: AGHT+IHOAxQJ8qPlx6Src1XjclOWbH/M87C2YFqLGGKkkJpYUr+hF+MGAgs/sR9DLR26lHm7dOBX
X-Received: by 2002:a25:dc92:0:b0:dc7:46e7:7aea with SMTP id y140-20020a25dc92000000b00dc746e77aeamr9041363ybe.47.1708305793558;
        Sun, 18 Feb 2024 17:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708305793; cv=none;
        d=google.com; s=arc-20160816;
        b=UD1q8G8ChMsKMjIQFS8F+KntO4UP9B14zI6nyQ45Crm69tA0bD+8WrANmHl2HyAkcx
         57RKzsVbIiXkp0TE7LIPp5wWU6NTyuotrpMXNelkeGQV9eGaCeM071RnjEHoio//9i7v
         fMfG4G/reLUF/yfx07JAGD2PhgDk+X4bL+L8kmfT/HvK5tHg4cB9+ThLt2LRb52oiBA9
         prWfyAA83l3UOo+/115g5qB+c68hvs3okSa1CjLApN4ervKR0OX1htmcfGTamoR+uacx
         bxhkGFCE1dWywwJBNpGTcKIrJ6QwKfwLESMYu1AKIgG5yMPqJXKPcc0mViyx1AYhNK7Q
         Idfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HgvAf3Bny28gbzls8qX3hW1W5UZnJ79IBUeZtScB5YE=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=kqo0WEEIMMm4RAZY3SaKwj47pVUV9VlPo40kBZW7dRdpGkuFeVOtxqd6zkVupjsZa8
         OA3QM92JNn1uFZF1KtQ3kdoYOMATxsp1x0akFs+ZJoPLYtvDPwWhBFIAW0Y0MppsT6Zm
         VT6nMdVsgAgU7POBbSVppWXC+M+blpj2WHF7JLZniCI5vqJTgP5eR2aJMpvGC2tFY8MW
         BmjpNKRy78o07a0FfA8JBchOIxtrqDfAyTzgTrHXRcp9nr5jBPoawXJgXMBOJIhG/8qy
         r1QD97iizbyJxJE9f132CRxDuuzrW6WIHxyBZNYt8hNVs8jdQ3vH39yMlsYT9TJ4jAXn
         AqyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=freXttGz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br42-20020a05620a462a00b007862d19342esi5957230qkb.779.2024.02.18.17.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Feb 2024 17:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=freXttGz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rbsIJ-0003LH-Rc; Sun, 18 Feb 2024 20:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIH-0003K7-G4; Sun, 18 Feb 2024 20:18:06 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rbsIF-0004GC-QF; Sun, 18 Feb 2024 20:18:05 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-60821136c5aso3790267b3.1; 
 Sun, 18 Feb 2024 17:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708305482; x=1708910282; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HgvAf3Bny28gbzls8qX3hW1W5UZnJ79IBUeZtScB5YE=;
 b=freXttGzS8UBciBIB89f0ptv64aY7d/9w6olA13uV7CWLqAZeveqXGy9Y/KnYw1Q5l
 VvF2f0L3hTpWQDHvxCJVQvKcXxVNra4Br9iKSsRhlB9hGO2+P2uEw0HPTnyHCfVf6orD
 L0iQpc5K8Ts7Umdb2iioLumI55sm48wBfnYGkJEElUSYebu/oEGU/ZBGCpUEmcaaHCZ3
 Xj8EpnLyQkxDXWpS1v/Vw2RwvRo2KAOfo/Qo1DtZoGAVMdnfxa9/xP+4KPlXU5zyV0NB
 l7cnO2jBbIZiL1k+qfYJXuCjw01zyuaTzKFCok3NM451qkkxYWrtASJBGRBj+CzCgOaU
 hwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708305482; x=1708910282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HgvAf3Bny28gbzls8qX3hW1W5UZnJ79IBUeZtScB5YE=;
 b=D7QZhVzRD4R2woXuW++EigzMlMr3o+QDhdyogJpOXLzEnc7TItFTnCFio37rzEn33m
 HAcGHPSzebg7bIHfZvR+PbzKUN3X1jLIFOjSCRAdvN2G6XoHs+83U5MrV4O5lk0zqnhB
 lAR5C1hJgGqiWKuNjgjd5PkhbL6lecKSGp5kvnNx80/FyPjOnS7LPQ59Se0iR0Dpf00z
 yPPKSD2vpWkxw7Oz95/Gv0wUmNY/TvbgzcacCeYnjMAtwfX2q5yOWnri+Zc2BJGBIL0s
 W4ToOHLBFDTmlHpFoGid5kNNdM9tR9TVoNVZgKZQYqYlcxUOBw9dB1gq3CEtOBBKL6KO
 p21g==
X-Gm-Message-State: AOJu0YzOQmti3i69vtLtdnbjNk1Pdlu8UkK1B2EvNv0RMHu76OJowrct
 9I/CybUQ+4/EJP0OKfNty/VgZnnQKHe3GuDjD+qAFY6oiFX4RowDOyfGTPBp2Xw=
X-Received: by 2002:a0d:d5d7:0:b0:607:d285:4d7a with SMTP id
 x206-20020a0dd5d7000000b00607d2854d7amr9762550ywd.52.1708305482194; 
 Sun, 18 Feb 2024 17:18:02 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a819e0c000000b00607ff905ed3sm1204704ywj.58.2024.02.18.17.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 17:18:01 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v5 12/41] Add memory region for BCM2837 RPiVid ASB
Date: Sun, 18 Feb 2024 19:17:10 -0600
Message-Id: <20240219011739.2316619-13-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 09a5QQ3Lkcas

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 3 +++
 include/hw/arm/bcm2838_peripherals.h | 2 ++
 include/hw/arm/raspi_platform.h      | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 55ae56733f..ca2f37b260 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -185,6 +185,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+
+    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
+    create_unimp(s_base, &s->asb, "bcm2838-asb", BRDG_OFFSET, 0x24);
 }
 
 static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 86b0d96944..af085934c9 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -69,6 +69,8 @@ struct BCM2838PeripheralState {
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
     OrIRQState dma_9_10_irq_orgate;
+
+    UnimplementedDeviceState asb;
 };
 
 struct BCM2838PeripheralClass {
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 0db146e592..7bc4807fa5 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -73,7 +73,7 @@ uint64_t board_ram_size(uint32_t board_rev);
 #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
 #define ARBA_OFFSET             0x9000
-#define BRDG_OFFSET             0xa000
+#define BRDG_OFFSET             0xa000   /* RPiVid ASB for BCM2838 (BCM2711) */
 #define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-- 
2.34.1

