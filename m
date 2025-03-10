Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp842287njc;
        Sun, 9 Mar 2025 17:07:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJQkrVjE7IW1q/fUnDqc5dKHXhsGB5MYn9ZS3V6bYgPVavYnezsgvSq9F9OCgJ8ZPq1jGkeflcMxKAdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFhoLcZOkDJKH+LTBTT3KCk10A2kCI1Yc4Ba3jN0z2XUdpTX1R/3U8PVvh18QRwas2owcT8
X-Received: by 2002:a05:620a:6605:b0:7b1:3c0e:3289 with SMTP id af79cd13be357-7c53c8bfae2mr1201322685a.22.1741565238451;
        Sun, 09 Mar 2025 17:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565238; cv=none;
        d=google.com; s=arc-20240605;
        b=Fz+aKryVY/uBEqUfWYb1ZFzxTpBJ9K2zbdFZcvY3ktWTMgObHh2dTsLx95Ca9ndIwR
         qalpTlKaaQy1ru18GXMxWcUUIorE5cZ6/7zz+QAzqRCxeYQRio4gIb8LoizK9ITmOCH5
         Qks8qt81qfksesbk3haQZBZq/NnwkZ5GDRcrdv4FSdiVDbqZsZKKGsKIEzdlaMxXCO14
         5ER6buOB5JNROkf9HgJ37J3SxzoLdGjWFLH2jc2Thl2Fkwlka8U8HU6d63m18dajMEc/
         H3HuJ1JlK/adFzjCtcunDGBbfqpqO57HEn/C6iPADayQAfawgz+OMEfUAEaGKHx76lD+
         CtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WDbWzQ3TRhfqcCdGrWE6Ka+gW+QxOu8dbIYkiLZFWgQ=;
        fh=lh7dIkwM440QnFjjKL3HQS5yRP3Fd6VkR8LoXpSE+Sc=;
        b=X2Ji835RJMOuvQwZnrTq/RigNL3aPK8lAs0gRoPwC1sbFtI0/TIo05PLQ+DCo0WDat
         QGFxS7lv9gjif5H6joRxn+EKI4nex2Fxp0vixjcBjbbmlg7UpIQy46Ls+5AzwEMwTJgC
         ko9GyH715R9L+b77zuublr2H8w9ioRWM24mkfAWb3xnjFfroKbAkqG0jfw9d3f4jWHJG
         sBpq9lTLnbRVVQayhBKs60Iql3wfmVcBzb3Lp0zefQ+7dUKqnWDH+irpvLrbAODMZCOv
         Xld/tT1ueAwbDhFwVfjaRnyNRb5XjhBHGXshsL1BAYVswCIwkE0cehLUxdwhGTptmMBO
         z7Pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rwDxUUNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e551186bsi830828285a.366.2025.03.09.17.07.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:07:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rwDxUUNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQfF-0001ns-HU; Sun, 09 Mar 2025 20:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQfA-0001mQ-AG
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQf8-0007HH-K0
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:06:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso4984685e9.1
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565189; x=1742169989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDbWzQ3TRhfqcCdGrWE6Ka+gW+QxOu8dbIYkiLZFWgQ=;
 b=rwDxUUNhP9klUCNLQKYifXTQNLSCekAG0Z2mfQd4l5jHrbNQbHlBSN1X1a29+s88hl
 fTk/eO7fOwQdGkIxnydrlKS9BABWnB/y/mm4HyX8vbEttazWT1CavjT9wulK9+mGIvLo
 jlAZwDWl62IklOAyX+7a5bT5SPbL/OSHTevWi7NzK831sxzwK404DhWDe4gQRv3JvlzN
 juzPIrrpJnMQVQeLiA0W8m0ZK0TAM9CGhqPgcyXxwWBcb6EyxBDHuJPdb47cgT26NP2Z
 NlmwkZ3sidro1Za+ZGhtKzQ7xuXje3y5p/+ksd+nRGDFh0fqEYqDsJeYlFVlZsGT8jEo
 aPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565189; x=1742169989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDbWzQ3TRhfqcCdGrWE6Ka+gW+QxOu8dbIYkiLZFWgQ=;
 b=gNIfmgILCD40GbDSspH1g4aGonyF/ky0R3rVmt6b8w/LgHWvOleiQAz6a/3QQ9RN0y
 Wia3sm/0av/ZpZ1P8RWn+gFK18y1sRRPwC10kxUWbcT2XroAVh3sd9z83laWVLhOEIqM
 MEms29NhDChRLT5aW9EmdtQkpnStvlSpgGoj3stZdW4OfstNdwXNRPEw11iXnWaPUe4r
 Lee5e2felBmcr0ChvHHb8xZtqDaSYES1/cqVzS3VO0XQ3sIpa3y2kvt6rlYIFgGxQFlY
 eIgsm5SUDXV6I2LCYvQTxTd2oQ/OF7Dr98zNNP0h/0GwCWpLclyq3MjSHQpBPKJbbX/S
 mOUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5OFnr+/Es+cWj+ouk0QBsx16x0lXN3hWVDWNOm2DuZHM+XYY4rhk57AejASqpReQNFcHMbFUGQ==@nongnu.org
X-Gm-Message-State: AOJu0YzqnduNKrM5wQAayiysVSJNpjyXdleFvjXFNo/REERKM33j5Gr+
 iCKvlZLhnlfcHeKp0KIIMj1ZIgTtb3NAbwX/zsJvtzt7HW9sy3AxY9Wb5jFY/rU=
X-Gm-Gg: ASbGnctWzuoWMiuBSLqD2KvcLIj+rrNzi8fM2nvP2tcyDRAnwaT1gYg49DSPuhpY9ph
 0pZ8cj1GUgJ9/0K+528vN6iBWGmbzopInSLC4w7C72P/OxTejCIkIWNeT+L54kxb18TSRlHbfuJ
 AmomyAyAiVIzjQ0q5bhSEPLoea2VF4sQ5vVIbFmlrJs+dgIa6BKeTam5jcCeRyG1dO041QoVMTT
 KDP5dr1KXi3GhJEezq0BUh362fi83R2Rskgh427+QEhssYnBzQ5T85MBGcOksj99snkNcQJRbkj
 vFXKGRwN8KrRJFbdqVUM4e0BfollU0UAT5KnQS3qa6gZEc49eR9ksok2GvjPdNFLeHxb5MBdi63
 0wrj4Ohjlz2eQM+K4soI=
X-Received: by 2002:a05:6000:2c6:b0:391:31f2:b99e with SMTP id
 ffacd0b85a97d-39132d1fc45mr7670552f8f.2.1741565188972; 
 Sun, 09 Mar 2025 17:06:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cfbae50aasm4331045e9.8.2025.03.09.17.06.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:06:28 -0700 (PDT)
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
Subject: [PATCH v5 01/14] hw/qdev-properties-system: Include missing
 'qapi/qapi-types-common.h'
Date: Mon, 10 Mar 2025 01:06:07 +0100
Message-ID: <20250310000620.70120-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: aelyeTSRi9oa

DEFINE_PROP_ENDIAN_NODEFAULT() macro uses ENDIAN_MODE_UNSPECIFIED
which is defined in "qapi/qapi-types-common.h".

Fixes: 4ec96630f93 ("hw/qdev-properties-system: Introduce EndianMode QAPI enum")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/qdev-properties-system.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index b921392c525..49a3825eb46 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -1,6 +1,7 @@
 #ifndef HW_QDEV_PROPERTIES_SYSTEM_H
 #define HW_QDEV_PROPERTIES_SYSTEM_H
 
+#include "qapi/qapi-types-common.h"
 #include "hw/qdev-properties.h"
 
 bool qdev_prop_sanitize_s390x_loadparm(uint8_t *loadparm, const char *str,
-- 
2.47.1

