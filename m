Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp842511njc;
        Sun, 9 Mar 2025 17:07:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwoW9GiW02hBrEjC+DCyas30iGvFF6lTKgz+VHX7T6tXd0Uxyl5NdpRU4ji2RNBDElNsJnPSKo1rQSiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGrjfe8Q8+GOwSSyN5zju0azucM4SgSGU/2dJObmMsueOPpTGGy6JlR7L0Jt1KYf9gZtmS+
X-Received: by 2002:a05:620a:26a5:b0:7c5:3ae8:4d6 with SMTP id af79cd13be357-7c53ae81201mr1044238885a.51.1741565272332;
        Sun, 09 Mar 2025 17:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565272; cv=none;
        d=google.com; s=arc-20240605;
        b=X1B5Z2ABqhX6d8oFpLLxDYFqmyHbg8W5ObeDlgrVjWDWfXv7ycNGmSV//IuEr276qu
         yV3OyCI+3D9rJ3V4e0C/siM772PO/VS/AaqHiycZyxPER04rTALrY5rvBgmLDhXHyXbF
         ybjdJUp0z0pMRF8UCeywI6TB2mrK1imoXYfLpduA3bfdTCbz6rB6LTHxBNktLlBfdQo9
         13Lf2flpKTJwkosQoHwaC1JXQuZYadAkIsP/EY/b9rE3sR/yMPrLcrHWs0sNVZANua8C
         ibiFHGogHG5byWoej5AlFX5Ga/ufihWH/c3pz0pPm04eYAGjhgG4xIsf9AVVuSAVBP/W
         zmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nrSyjlqQLxIdz5EnxNr6LHBBkoV7ANv7WOr2ucCNGYM=;
        fh=rjXVVhS4zJ3BLcGD+gbl0ReNDGWJSaPdLfAT1jq/UdA=;
        b=PdSDWpxoi050L9pXvk71ocF9Raeuc4IcQ/QePwFZzpVIj8YBrBFAkVYFC8Ywzoh/rn
         Oy6iyjWOUXLHH4jbyT8PvU2QA0M8R9Bxsrpk5La3cXQEMKkzCzTusT+65DpSkva35lYU
         LWh7RSBCXHHv6r6ukmjvRXwsHPZXrgiHmlWg13zxG7S8Hz6MfGVMIJcyxBkkecv1XhNX
         FM/RvG9K7BusQH5qAPMFnZUItAoMkLKoeyz6n9C9LQCawm2Bt89+QxXSkTEDBxYCU2kq
         4rzp0OU+yqWJOktTj8bYPKXsPW6cwaNeV7ICTm2TPDg/ENmvM/xeupq+xDzh1qL46Lwh
         mMew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=io3IZVhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53c13fdb7si455838385a.583.2025.03.09.17.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=io3IZVhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfk-000290-El; Sun, 09 Mar 2025 20:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfh-000287-I2
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQff-0007OD-Vk
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43948021a45so31330485e9.1
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565222; x=1742170022; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nrSyjlqQLxIdz5EnxNr6LHBBkoV7ANv7WOr2ucCNGYM=;
 b=io3IZVhJOyKBeVHK9/jJU+7iU6yvP9QrIxS+r43oHKyQ43BIA1aSsDnuJVO9pivJDQ
 Vws15/9C8YmtAmGh85qKqZZAX0jqGTxiNB1qxzgcFrwo3KKW3l+P5/XIWZfLifQUqOnb
 E+hor9F/l8wcv9z9Lk1r4UU9esRGYjMvA5iQx/6JApI4uAOr3G+cKRrvr5WkPTgZepi8
 Ujxe+UvgvEEnkOnE101oJdQBBckvu11hl7LyJ5Je1Vgz7tZDXtGqxYxJ+dksIrjShOBk
 5IIdGtJdoMDZKSjVZHvTV00BocVUSu2J2wcO+J42qohaOVaGnxq5Gb9g+mDyB/iUYsnS
 d3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565222; x=1742170022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrSyjlqQLxIdz5EnxNr6LHBBkoV7ANv7WOr2ucCNGYM=;
 b=mR86BlMh7yeZ2a7+zW+st6kSmsoVr8nl0nDV+8kLxArEt4EQw/bCERNU3C8/c2jIJT
 HSVDMO+jq4IAEP49WZrwunsw+jvWKpiMDjLTYIEvbeIZLBeoCLbvXzclgrN+FkBwNPsJ
 6fw9qcs8X3vkzNbpLuZPo1dFJYjresF7zKNITzMYyn/a6qJOJwIEzGXSIVaW7nIR3cuq
 bPLkIi18lkbhFAAo04X6WPPqwBoRNQlJW1uWbCsHLKQzouVWtXqQhe7uNd4q9OuFEBFx
 2KfVwkOjgMR+MMIrzOzwiFsLMgaBD+VfBGzRUVn7Q2UJRVnBusmni1v45QIBZjC2GX8J
 g/ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOIdCSR4qsGTZB1Z/fDTSlITJvagqJpLQMQCoGBXn54CrUD0s/Zd/pifGdrn/yf9l5inP6kXP4qg==@nongnu.org
X-Gm-Message-State: AOJu0YzAko+/0bM32hrKVaQ7Z5nRwCqAusgDNu3J5vvywixXZ8DPSnTR
 w62v/j+H8w7sB8d2n2Jpd72p6VuqXtYb/idOFDuKnN1O1gRFKiptGlTLdtTHNd8=
X-Gm-Gg: ASbGncvOgt7nWC2+Ou/OqKxFDDCr/UOVMGoFCJQnocq4t5zM12FGvMr5gfjqHYaCmsL
 NVRBSGp0q7Yl9NZY9fzxSmOYOcTyHukGZZMMGqBomJMSw1XrAmwXc+j+lHQtiXB+VwvaWSKfOEv
 1K3NpBmDDsq3KNcy4/fi/FkR8OQR5ahFtZM5JWmiiqeAJnQovwzEoQWstJpxY5hoSlf6UbjjKKu
 xDRt1KFEm5g1FftypOFU6iEzzlMxs4TAUynMg8y+DAv/A23M2exDFvEWdp23NmF6FcQ4gSfHFPf
 FmeT8fMoYZVqX45Zgz2+Cc/R3peRZHEtsoenvzd876FGxbk8ANxw2Zq0Ze/TCr1sia0FE7q3Z1t
 TnuvyjKC+JEMk1UYEWyw=
X-Received: by 2002:a05:600c:4687:b0:43c:efae:a73 with SMTP id
 5b1f17b1804b1-43cefae1393mr24142295e9.10.1741565220740; 
 Sun, 09 Mar 2025 17:07:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf7b88494sm20159685e9.0.2025.03.09.17.06.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:07:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 07/14] hw/sd/sdhci: Make quirks a class property
Date: Mon, 10 Mar 2025 01:06:13 +0100
Message-ID: <20250310000620.70120-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: L6rjfjKQo99D

Allow to enforce implementations quirks by the class.

All TYPE_IMX_USDHC instances use the quirk: move it
to the class layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index c42aeab6848..ee1e7ef4b10 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -116,6 +116,8 @@ struct SDHCIClass {
         PCIDeviceClass pci_parent_class;
         SysBusDeviceClass sbd_parent_class;
     };
+
+    uint32_t quirks;
 };
 
 /*
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 176bee6b8f5..570d825d130 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1427,6 +1427,7 @@ void sdhci_initfn(SDHCIState *s)
                                    sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                      sdhci_data_transfer, s);
+    s->quirks = s->sc->quirks;
 
     s->io_ops = &sdhci_mmio_le_ops;
 }
@@ -1888,7 +1889,15 @@ static void imx_usdhc_init(Object *obj)
     SDHCIState *s = SYSBUS_SDHCI(obj);
 
     s->io_ops = &usdhc_mmio_ops;
-    s->quirks = BIT(SDHCI_QUIRK_NO_BUSY_IRQ);
+}
+
+static void imx_usdhc_class_init(ObjectClass *oc, void *data)
+{
+    SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
+
+    sc->quirks = BIT(SDHCI_QUIRK_NO_BUSY_IRQ);
+
+    sdhci_common_class_init(oc, data);
 }
 
 /* --- qdev Samsung s3c --- */
@@ -1969,6 +1978,7 @@ static const TypeInfo sdhci_types[] = {
         .name = TYPE_IMX_USDHC,
         .parent = TYPE_SYSBUS_SDHCI,
         .instance_init = imx_usdhc_init,
+        .class_init = imx_usdhc_class_init,
     },
     {
         .name = TYPE_S3C_SDHCI,
-- 
2.47.1

