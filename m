Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567184dyb;
        Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXasDnaSfsnpUzRTxuNOqsk2Q5qkgB4680k9ZYC46ga01X6gZ4HY/1mZG4jdBinCN6/Xxu+D9gkZmc4rA==@linaro.org
X-Received: by 2002:a05:6a00:3d4e:b0:748:9d26:bb0a with SMTP id d2e1a72fcca58-7490d748cdcmr17525348b3a.18.1750687114144;
        Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687114; cv=none;
        d=google.com; s=arc-20240605;
        b=LT8ad7wnnT/76mhAKJNIoHVNGrUSYwsiCukvGLSPY5YeeAGpVuDm88OZiktigrY4JL
         Y/OVxb2rhPyS4bdjbDO3G6L4a1ycAvGDYzqqtUmKStlCTugvpanTXRIH0cn0J6l3DznO
         2TP5/jcEq8VnuQsAuKbro/x2H69uTuUKqhv6gdMBceTH/nEMEOX6x/lSSAwKRRxvuIfY
         3d2JfzMalm05SYy1lb9Rs434s1A3LhvLyokn6J+IpfSYkCsFuUQGI7CGxYQIty9pyv/E
         HqCHdtAfdwkarZaSMQ77bHDh3XbDBb/evtk+U7u1rioDeHaLhQolgCEWW3fWgTd8G7It
         +fVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+KCO4Ulw21w48TY/8gHQVa7B2eOfuj0N7B3tO1GbSlc=;
        fh=yhvmI25wlLmRV7Id7kvZgQpXKMjqcTkI6KwtUcoiT2E=;
        b=Gpbv2sS84HlnEpSqMyAgQ7aecpPeKwXeQSsdqa0dF4zadFxD5bmjmef05NfUDxZZZr
         We+9UePqJTH7sZQ46c0sz8xYZ1mCgUO3FCnpnBBgYy2+ZWBaSMZCcRskhkbteSUdYAWM
         04iGYs/PmMxet6gN9ufafnW8OQPR/6P1AWn39ZfIqpKy5rdlxz+sjfTNKEeOXTGRNqmn
         C2GEt56l7i/5/ubX/r8wLtAA6zoO4BeJPHbX+did+UjmsewdGkate7L20vppFxvilRt0
         1+flLvcFoYxVzwZVfv1PTeGupRW2z3M6Mu65M/U90Mat7fvR/Poj7NHGYK2dkPE337nt
         QQVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L4QuUuDf;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a68a151sor4145194b3a.10.2025.06.23.06.58.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L4QuUuDf;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687114; x=1751291914; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KCO4Ulw21w48TY/8gHQVa7B2eOfuj0N7B3tO1GbSlc=;
        b=L4QuUuDf7KalsZ5Wae1m1oyHMTKLZX693Ygwrn5SMnodej5yZkXXRxojfLLlW40eW3
         etC5IUl1ba4ekSu888lHxTxKC9AaxHrfNsMvEp2FL7qrKU//nyI2NQwrRUPVcY+f3PWe
         1o0gik2mmSVwYMnzOXQHOTqocYCdwHHuN2aRIgadS7Uk1hxDI60hiwDlXZkL6wJMusem
         hbe0X9CkXS8DX0vK9HD1863zJHYmzfvhkyAJw9Z+hsaXyOwltjoe2sSviQbE69bAafF2
         MSASGPTe/ONAJd9SstAgic6Yt1L0a9K6vqJ+uqLSr2+vsJSmjTRvUesmHj/dbXN1r2Dn
         e8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687114; x=1751291914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KCO4Ulw21w48TY/8gHQVa7B2eOfuj0N7B3tO1GbSlc=;
        b=riW2uYreIKPT26WYrJyGBogFBCiHLQDxU8mw/4taBMBCdFQctBJ0FmZJcExRoYSyyO
         cp0mVKQmiuKDPKCIUqD3HgZ/0pTV/qF3/I0WW0DrOlF0H6j6ju5RR+KcyuwQCKMVkFXG
         gDbDU4+FNLhY0WsUYb2bcftd1a07+Cafw3IR6Q8LkTNMoUjx/bIVwc1V0VEzUN9/Ga0C
         TtZDE/1OLv9E8ZhKN7/AvHBD8jzpm7bLmrMdqcOMyRTGtzL+CB1axlOOkfROr2W6gLoN
         D0B4zFydFlrMDimq0LZnfxH39XHFoIOBlMt997qjeFGMagjiLwbAsYRmObZd7NmTyjI6
         225w==
X-Forwarded-Encrypted: i=1; AJvYcCUFS7rglaGgQNXVpEVNiGpj1REOQd8oZxilKnxSY4++IkkjfW+HUGegluRLLdSOD0nRsi5V5Of4DJvADg==@linaro.org
X-Gm-Message-State: AOJu0YxGVkwgCWLsdirLOstf2JmsTfxpJi1zIxAyf4w4I7tmAr/1P6Cq
	kLFPe2KM+Hab3pCK5nKBEMv0TPYHeypV5wqjuR0ECbaXB8ClHSQrxrFSfKmkpoLP4oCGAA==
X-Gm-Gg: ASbGncv65w48RIo2olCQykBKEyJtM5cEhrKcbCBkUu/DwFD5GfMFN2nuFLMK4RrlEBa
	9hyQHYAaAXdRtIk2/gImGLlS/ACO1tiCAK7az4qmGGmFxQF8OoioVE1QNHBZ7UKsyjjSSRSlsvS
	N6V0IlC1a1uvBxlqBnwXumrg2lp7LyUSeHjN22stm8Y87j6g6uddpSv3K8++4bOu8g14xW0WnEX
	7qE5aieWtXuIEdCUTO+Ea5LtT7C0K0Jhj3XKOdLeuCuJelwWxat7/PEXvkOudU/RjVjRkDxo2V+
	k/72tAIbAdTOJV9Pxr7ctnNVYQGwzv/syIKdtMV1QqLkSMWYAJUTqAktA+IdZGyiSeE=
X-Google-Smtp-Source: AGHT+IFjQAm59TTKInxOZjJuXB8hdE+jbTwwM+gqUvzv9UPWZ6u/2k9EzU7681DoI3yXvDXyaxvJhA==
X-Received: by 2002:a05:6a20:a108:b0:216:1476:f71 with SMTP id adf61e73a8af0-22026f13166mr19283222637.39.1750687113626;
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com,
	philmd@linaro.org,
	mst@redhat.com
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	udo@hypervisor.org,
	ajones@ventanamicro.com,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	anisinha@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 3/9] hw/arm/virt: Simplify create_its()
Date: Mon, 23 Jun 2025 13:57:43 +0000
Message-Id: <20250623135749.691137-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623135749.691137-1-gustavo.romero@linaro.org>
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XYLwbHaIv3V9

From: Philippe Mathieu-Daudé <philmd@linaro.org>

No need to strstr() check the class name when we can use
kvm_irqchip_in_kernel() to check if the ITS from the host can be used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 19f85d0abf..96a09c3eac 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -705,21 +705,18 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
 static void create_its(VirtMachineState *vms)
 {
-    const char *itsclass = its_class_name();
     DeviceState *dev;
 
-    if (!strcmp(itsclass, "arm-gicv3-its")) {
-        if (!vms->tcg_its) {
-            itsclass = NULL;
-        }
-    }
-
-    if (!itsclass) {
-        /* Do nothing if not supported */
+    assert(vms->its);
+    if (!kvm_irqchip_in_kernel() && !vms->tcg_its) {
+        /*
+         * Do nothing if ITS is neither supported by the host nor emulated by
+         * the machine.
+         */
         return;
     }
 
-    dev = qdev_new(itsclass);
+    dev = qdev_new(its_class_name());
 
     object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
                              &error_abort);
-- 
2.34.1
