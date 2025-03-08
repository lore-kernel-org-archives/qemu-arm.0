Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp251731njc;
        Sat, 8 Mar 2025 11:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnQfvUSuc1anjkQHTajLLWWSmJnbxEk5WUPEjMiDVJUluFgR3CmOyrn6Zwg+cV73BIq0BgD5I6Q1xrZg==@linaro.org
X-Google-Smtp-Source: AGHT+IHCHdVr6wif5VZ0BfhtQYCiTEajVdH0HdgB863ZkkcZRPsJdNkbrvM47WR7eAuzF4s4Bhfd
X-Received: by 2002:a05:6214:250e:b0:6e8:f3c3:9806 with SMTP id 6a1803df08f44-6e9005bc9camr110777576d6.4.1741460594604;
        Sat, 08 Mar 2025 11:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460594; cv=none;
        d=google.com; s=arc-20240605;
        b=h5zsyXeewCblUC4+hysa9COYMXDxR4APltRycIpsdM1Mai0xTd77BC1TuDHdSD2LYY
         X6z2I6fHiG59X8qLDQerPSI3wDMkGidAVau0nUSsk030l6Fb1Tlkm9C6Q6uTjtdNmizF
         ZYaJzONHHhvQi+UD4/HvSYd+e7GQS2AiWOT1ZKgOxWz/+MmZrA0QIv2ljaBM4TKaIycP
         fkGwivSw2PmkwDuHYuK8cFY7kTwGbdRlafF688ZJSU9Pe0Ze3PdyfDyoUQyGEwVuOOLC
         67AUE0H4O6iO6OVrtkjk9FyMlDZ/Pv7HHu/V6mkpjlzjZTEl/6Xg4npRV6AqlgJIGdGW
         zKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rGeGYkd/RvTeD7MNw4buaroHbkJmR8tAE2eHN3vxKfs=;
        fh=QuB7c2Qlzqe37O5Zn2YtNFPLhlCjgi0cXdkTCgVcg6Y=;
        b=Y2KauvmbdUOZ9YWrl8c8oTEGC1q810qQHslfPngbSy9uyVf0FVEcjPZo1RdCR77sW9
         U6oe7uLXRmhL7R9sqe0ZszhJxNyRTZ9BkLu0bmiQ6BxC0+QxwDbQLMsxVi/JrmlMpy7I
         1BCFazJUVrPYPB3fqBeEOCNO6i0Xk7vtfuUr14nLO27lfuBjdlzhnfz4mdalaPby3/oh
         ifqfLYC39R9XF+aQdCF6zQrZKvE432Ns8szanymgzSkP89OAZ3ahHF7trF+mTvCECsMe
         FyOX5mvRruxC1+SnMkCbovOUJQ0aRcW7MVnmKcpdbA1QeESDg1H/1b9w5Vg6X9+nPRRD
         PgtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1o1VRyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7175fbfsi59815806d6.347.2025.03.08.11.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:03:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1o1VRyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzRy-000703-Vr; Sat, 08 Mar 2025 14:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRi-0006m1-NV
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:02:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRb-0003VD-Ou
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:02:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso346065f8f.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460562; x=1742065362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGeGYkd/RvTeD7MNw4buaroHbkJmR8tAE2eHN3vxKfs=;
 b=A1o1VRydyRsDAzvzUxpEwF3ebPzNa409/VY2s7KvKS5rr9X/c7rtlaQpQ3Jqs8mUAU
 Ety96WWOgZ3iPCOY6vWg0nSrBGpqU4q8eGNKRubXJP8WrjxOEEqhAYGf1jwCSMdyNoEH
 7BpB2zptxhuVbp8R7wtF+zPYGnDEwZSqxv/cKqLHnKOP+W0X3W+l8qr/oNSfjZ5BXAxR
 lDuWXQDSPBuXaxbUqdK/N+DSyVPm9IsMUw7WsHV1udbrasu9X9xBAOpSrFUh74ZIouon
 2LU5p92TsfcgdqAmYQnCyfyOZGlUHsB82WCz9MQjUIJ7FKtVwzlY5/cp/4KepmMFUXH5
 BayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460562; x=1742065362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGeGYkd/RvTeD7MNw4buaroHbkJmR8tAE2eHN3vxKfs=;
 b=SBvAtNHAoY5GeBTvW5IvvkHVejBmtVzKsSJPXTT/dkFx/5a90MiJ2TX46YDU8oqOto
 schspCN/U4ucQZSo99da+dZ1UDtXEpyL0OVwSYDEa3hVS3HIWZMlmFf+T4x0LhSa1ArU
 k4P1IjRrfWKZ971Bb0uHFd7ieFzy880f/l+zmyNDiaUXp4n0cso0twqaxogYAmdRjk8l
 u3zxsIhpD3Q4wVg9m3JSkfW68hXaEBt5lAmgj+2L4e3PqrnooXRo/ie0z75oneDNcbl3
 l5yTTpOtaBtEQRfLTzEObDqkXMfH1mI0AWC6e82Q0DWC6meN4hXQWpPboUBdvbP86jFH
 Mr3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7H6hh12/gYqNJyuwKnc5iSGn/iXMaI024sytf0LyQqdsg7luZfZLEi0w0DCIOJ57xP4lSOiSdVg==@nongnu.org
X-Gm-Message-State: AOJu0YzAEQ3AaoxYGYs69qfung86EO5gi22eEikiu0u86SYAFfFCaTo/
 p1Vtl6X8cZR1CYfadV25UBF1oskb2fRt4A2mVlDWbRy7raQonQFQQUkk7HRYeYw=
X-Gm-Gg: ASbGncv8+JTqVo4szb28hCMbc29+/3tHSyDo37cl/ENrsKF7+cetLr3CahwJVF0O72k
 2jEUJ87Wx+DVH1yzvzkathF3kq7/P4Y7SufIfusuFqgQ1qHVqF+H//bskE9h/YaMU7aBWr7wGyF
 AhYzNcTd88WC/qoez+4JtefUl56mYyvKkcolHXo6OJG8tSJdQYsYH8SbwmBqTUKAsTInqexoR4c
 lI1g8StugyQJgam8+l5LGKcL6TrMawsSBHv5NYPkq3gieRwTgZEWKlgxWtHGCz78D/uPkQ9JRV5
 DVkEvOGzLMVKvL2+PpwIVnWGgV8sxJzRh7NQ5aL8Rj4gmf6qKLUd9lXARAsG1oqNahScL5W9bHT
 EfNsDBbhcfbdMmY+cjLM=
X-Received: by 2002:a5d:6c6a:0:b0:38d:dc03:a3d6 with SMTP id
 ffacd0b85a97d-3913aed81aamr2276681f8f.4.1741460562232; 
 Sat, 08 Mar 2025 11:02:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce9f2d081sm27971865e9.21.2025.03.08.11.02.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:02:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/12] hw/sd/sdhci: Introduce SDHCIClass stub
Date: Sat,  8 Mar 2025 20:02:20 +0100
Message-ID: <20250308190230.7508-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R1sdFEaNb2z6

TYPE_SYSBUS_SDHCI is a bit odd because it uses an union
to work with both SysBus / PCI parent. As this is not a
normal use, introduce SDHCIClass in its own commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h | 9 +++++++++
 hw/sd/sdhci.c         | 1 +
 2 files changed, 10 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 48247e9a20f..c4b20db3877 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -107,6 +107,13 @@ struct SDHCIState {
 };
 typedef struct SDHCIState SDHCIState;
 
+typedef struct SDHCIClass {
+    union {
+        PCIDeviceClass pci_parent_class;
+        SysBusDeviceClass sbd_parent_class;
+    };
+} SDHCIClass;
+
 /*
  * Controller does not provide transfer-complete interrupt when not
  * busy.
@@ -123,6 +130,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
 #define TYPE_SYSBUS_SDHCI "generic-sdhci"
 DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
                          TYPE_SYSBUS_SDHCI)
+DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
+                       TYPE_SYSBUS_SDHCI)
 
 #define TYPE_IMX_USDHC "imx-usdhc"
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 149b748cbee..4917a9b3632 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1960,6 +1960,7 @@ static const TypeInfo sdhci_types[] = {
         .instance_size = sizeof(SDHCIState),
         .instance_init = sdhci_sysbus_init,
         .instance_finalize = sdhci_sysbus_finalize,
+        .class_size = sizeof(SDHCIClass),
         .class_init = sdhci_sysbus_class_init,
     },
     {
-- 
2.47.1

