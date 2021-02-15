Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5554330lfc;
        Mon, 15 Feb 2021 03:56:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFFEWpxLC4k8HKkwv2A/RjkGxqYH5Ms7ix1sazJvhRYSA5ojAVn6qRPyAXk2avFagHsptA
X-Received: by 2002:a25:7693:: with SMTP id r141mr21476497ybc.49.1613390186770;
        Mon, 15 Feb 2021 03:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390186; cv=none;
        d=google.com; s=arc-20160816;
        b=elmjGHUH/Q7m42hkUrxaC4NTwPsr7BKpVJGuhRqqeOdYD7l54wGYaBpq9wC5snWDkr
         liYgL6H5QmdJBsRIcTABsHlcNOGv83n4pA1S5AQXV7SmR1ODzhBncO3h+85wgW/LbZdZ
         3tSxDHCNrN4aTc2BYht5vrrRvZVoTxTcDUkhZu6x01lAs0ClbF1CiodR0gnYlVqXAuXF
         W0aQCPY44J2IP7tGQcTgRd6eMGa5kI7lgIzQ32j8x/6dWE61sUUeqwMTdO+oZgq4yJkU
         NKNpGyeD8QB5stGujZynRVngGrj+bpd5WMjgcIIFBaKZEUEMxjpbmQwCw6cLSvH3PqCY
         Ohcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tA+5uc5Diq05XqZ8Xpisz6igJKvX27QKXQ3Zpt1aydo=;
        b=Adv+ac1gWgeh77ftN6w53gduIxbI59c94v571rT3GLbNGm1h8sLHxOeu5EScU07W41
         oh4BCPHy54xAtF8JgaLa7o/Gd4UcwPN18y39Ug4LkcbyUFdG5M8O+RqYXTh38a5E/pAc
         yXUyVclHXNn8doTwbIC0orT8wfr/HzjnzjPSB7HEWmkBohJdmqOnZ+AmVzOwWQzAxWyE
         dwUyxgKLWx0EKDNcuMDevflqSS48ZgIoUL8MhkXGJ2td6+ppuyWhAm4lXNlgVQYYn2BU
         H/vOYvckdaSafka+5vdvDWyHCqTRndlpE3diwffZ36kGJkLMF+V5vCC0KDx52+6bWipO
         SgmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zkVbAipd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d203si9675204ybh.272.2021.02.15.03.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zkVbAipd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcUM-0005AA-58
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQi-000887-RO
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQh-000468-Cm
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id w4so5946858wmi.4
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tA+5uc5Diq05XqZ8Xpisz6igJKvX27QKXQ3Zpt1aydo=;
 b=zkVbAipdtWQpfRIaeIRnDAQirG99XLbu53KEPIqb8+Yv+iZELfMPizTiopv1mtFR/c
 semmmsEhWi8YNs8m7/6luUNl0vrKRNsXqKjlaPE2Tkiw1GCGFEeGk18/vLKEPkhsRiDv
 3ulgYKAYfeuqs/a/DPl6HVvunykNcPD2PLVn5GCZRrdy/+wFmnkkTykBy+IYSvf++3Hb
 vk4Mqf4joii03R2lmg8cFm/QVWoquAAHvYNM84iACib77Obb3RzuB3IjwGiVgSrWQJWS
 Xey7KYUvHsksyu6WiWy1gdLM4lG3iEnhthvh3mT9cKG5UyuqLWBXxK9sbWoukOIgmlqc
 fYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tA+5uc5Diq05XqZ8Xpisz6igJKvX27QKXQ3Zpt1aydo=;
 b=qrpF1YlKWoUwddVpzmoko1BiR1GjX94oa0oDIvK3I2tA5ET7ztyk8so9pylQy04yeY
 f+OaWFZhq8QX2yCqcXnPUFjxwAHqo9S1HWXpurjxF5Nz4aqy7JW3kgYeuryELJomJWpY
 RG58rIsoJlch7P0/H2CISmWoD/P9vQD7up+3DSu5GUjzVnMFIw0zk+qsvmIk/oXL1CxU
 FoKGpWJXBkaNjSpDnr+M/eIr3QpPvZfcUlTZB/HZ9cl9uSVvxmCqXg9sTbVWsuhOTofN
 uhY8CoV8AVgPzAAJJIsR2pz7esZEg2mkUww5YaO26w897O6cZpONEqmUzww6QhAiiS3l
 sZ0A==
X-Gm-Message-State: AOAM532wHHuavNMJq0pRd2io9yFQbYmeViqJs2bzmrnmZEqGPbx5AECM
 EZAd3wUkR+0tuIYJB0G2OU1xieGcIbK0PQ==
X-Received: by 2002:a1c:9d81:: with SMTP id
 g123mr14288028wme.139.1613389958114; 
 Mon, 15 Feb 2021 03:52:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/24] hw/arm/mps2-tz: Size the uart-irq-orgate based on
 the number of UARTs
Date: Mon, 15 Feb 2021 11:51:28 +0000
Message-Id: <20210215115138.20465-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: swlIYKF4W5Ap

We create an OR gate to wire together the overflow IRQs for all the
UARTs on the board; this has to have twice the number of inputs as
there are UARTs, since each UART feeds it a TX overflow and an RX
overflow interrupt line.  Replace the hardcoded '10' with a
calculation based on the size of the uart[] array in the
MPS2TZMachineState.  (We rely on OR gate inputs that are never wired
up or asserted being treated as always-zero.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 014ba775783..f1a9c5f65a5 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -516,13 +516,18 @@ static void mps2tz_common_init(MachineState *machine)
      */
     memory_region_add_subregion(system_memory, 0x80000000, machine->ram);
 
-    /* The overflow IRQs for all UARTs are ORed together.
+    /*
+     * The overflow IRQs for all UARTs are ORed together.
      * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
-     * Create the OR gate for this.
+     * Create the OR gate for this: it has one input for the TX overflow
+     * and one for the RX overflow for each UART we might have.
+     * (If the board has fewer than the maximum possible number of UARTs
+     * those inputs are never wired up and are treated as always-zero.)
      */
     object_initialize_child(OBJECT(mms), "uart-irq-orgate",
                             &mms->uart_irq_orgate, TYPE_OR_IRQ);
-    object_property_set_int(OBJECT(&mms->uart_irq_orgate), "num-lines", 10,
+    object_property_set_int(OBJECT(&mms->uart_irq_orgate), "num-lines",
+                            2 * ARRAY_SIZE(mms->uart),
                             &error_fatal);
     qdev_realize(DEVICE(&mms->uart_irq_orgate), NULL, &error_fatal);
     qdev_connect_gpio_out(DEVICE(&mms->uart_irq_orgate), 0,
-- 
2.20.1

