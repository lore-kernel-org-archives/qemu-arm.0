Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2044306ejb;
        Thu, 7 Dec 2023 18:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7U0t0iBye9PUXKP7cWBR1PxAsJLi7j3jLSutyyBCP8rvqVUMjuaLgHXud1d690pM3DWBO
X-Received: by 2002:a0c:edae:0:b0:67a:a721:d768 with SMTP id h14-20020a0cedae000000b0067aa721d768mr3849271qvr.78.1702002812516;
        Thu, 07 Dec 2023 18:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002812; cv=none;
        d=google.com; s=arc-20160816;
        b=SN1GC1P/nhd0Zhbo8Mt8LXiQ7r1a4V5IEnlAPYwXBSUECMNL1/5V0EaAUlfZBJNYXF
         NHAKbQJRA64LXlu157hrXQzqTIQbJytu1FCKvuLtrUuEm/NgHGn9IJwDqyqJA/KFw3SC
         8LfcMiwGPWx7Xa993S+b6SsrmWDFfroeDIzh/Bft1/rP82BQYRPv8GYN/nyf9177SnkI
         g8ucThA8fs3/EP9btb0/G+ipUhrHE09YHPO3wkgXM/OSqrt8cPCmgpFrQrZBB8prGBcl
         gq7+u6CQtBe0NtRCGQysNyGfLsuHw9UxRIQhrGiKQhrnyNrItO8xHnNYVVGjkNaGFcZB
         NjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=EspR1318saxaBAdlDxRUEZXKcXepZCxZj9d7dSz30Vn1Av6xjVdcQ0MPi4WmTk88Ef
         LUTxBCiDrdpCZ2xVe5Cgl3S9H/jSt2ePVgJi4tHROXhH2iz9PYGanGBNYni3tz9tiRFY
         d3OXsoCwsiA/JmjJGw/+uNNf5b838lt70wicfBkH4NaZzkEPoyQMmIc2aoMAVHxqa7F3
         dEyoXl/6ag+TpB83JdzLqL43D0HV6AMvnEhUuTdDRpYPF3UMFgMGzutT5nKTrIQa8fKf
         9FpQav2U6h4V6Mxrh7j/8GLz3ZLkWqb5Q/75tQLePYQQkbjASU6oXQUHIDL4voDu5hHS
         QcCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=inuypUeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a0cf9c9000000b0067cc91ac13fsi1142999qvo.401.2023.12.07.18.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=inuypUeP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBQfS-0004AE-LS; Thu, 07 Dec 2023 21:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfR-00048e-N4; Thu, 07 Dec 2023 21:32:41 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfQ-0002TM-4O; Thu, 07 Dec 2023 21:32:41 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9f62fca3bso20101221fa.0; 
 Thu, 07 Dec 2023 18:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002758; x=1702607558; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
 b=inuypUePzjXih0Hj0aqS70yTrhIfH9pqsUFe20P0iDppW/pwu0HWoc5rvkEjqx9IGG
 AG2lbM2FJcd8FUhwKWhsehZrTWbMCGekSnFqpLK042czzPZBvIdFrzaK57HZhbPYG7y6
 SkbhqatTDYnds4xtHP48xop1hOYfbtqSo7crlj09qRqcPsDyTny5vapfk+jDIDr2G/xL
 uw65i2txoafWCGuMtNuogv+kNi6v78Le+6gj7l5/shpdoJJwrzud9i5afZDeoQ4NYuEs
 qHcvXaTPYdbyR4fWqpu1t4I6WDcjiU/c7vLFdkXam4L+Hwq9tmvfEWcfQGlsqx31IVgL
 ju7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002758; x=1702607558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVH9O9un+zwSeBPQSL0IeMDZWUWBtxU0cSyYzIJS41g=;
 b=N8VqUax/m7RlybO4iZbtk+HOtZausMthIq/b4W2x30Zu+eCmrFZdy0gJwkVD9D13p7
 keopnOjI9qpHiHMrMI3OJJ0j4JJkGV+BIalqDIXV/mUpbPQ6ah3Sp1YK2b/yH8bKdU34
 zVF6kiqQWhdOLHlesdHFgraz+r38YkU9mNFLhR1vtmiG9EiAMrXzWq5Du8hddiFOTKj/
 KbGKtM7nD34dSI1hZu5UNAeCjVk4MR25Z256YrORv6UAUkRk7EAWcWA1+uMBeFOkMlUx
 07dTPOiuSae2Bjq1CMydnvh4U7jQ3rRfdr51O2zJtYAfijQpBkLqXzrcgkX8+N3KZjih
 7AdQ==
X-Gm-Message-State: AOJu0YwbyOeH20Yeb436C7eBYtT8cZMLJyXEZNcKuxK4F/6UrF0+EY7W
 9EodzRbP9CJ90fjLWd4S3e65BEh+luA1lg==
X-Received: by 2002:a05:651c:10a3:b0:2ca:24cf:5b2d with SMTP id
 k3-20020a05651c10a300b002ca24cf5b2dmr1923011ljn.14.1702002757807; 
 Thu, 07 Dec 2023 18:32:37 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:32:37 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 13/45] Add memory region for BCM2837 RPiVid ASB
Date: Thu,  7 Dec 2023 20:31:13 -0600
Message-Id: <20231208023145.1385775-14-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iZkYWwouH3QE

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 3 +++
 include/hw/arm/bcm2838_peripherals.h | 3 ++-
 include/hw/arm/raspi_platform.h      | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 196fb890a2..d3b42cf25b 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -182,6 +182,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+
+    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
+    create_unimp(s_base, &s->asb, "bcm2838-asb", RPI4B_ASB_OFFSET, 0x24);
 }
 
 static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 0a87645e01..af085934c9 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -64,12 +64,13 @@ struct BCM2838PeripheralState {
     MemoryRegion mphi_mr_alias;
 
     SDHCIState emmc2;
-    UnimplementedDeviceState clkisp;
     BCM2838GpioState gpio;
 
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
     OrIRQState dma_9_10_irq_orgate;
+
+    UnimplementedDeviceState asb;
 };
 
 struct BCM2838PeripheralClass {
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 0db146e592..537fc6b4af 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -74,6 +74,7 @@ uint64_t board_ram_size(uint32_t board_rev);
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
 #define ARBA_OFFSET             0x9000
 #define BRDG_OFFSET             0xa000
+#define RPI4B_ASB_OFFSET        0xa000   /* BCM2838 (BCM2711) RPiVid ASB */
 #define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-- 
2.34.1

