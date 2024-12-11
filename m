Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4417664njb;
        Wed, 11 Dec 2024 15:05:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFvbm7JjCNMNjf9VTy16GRRjGryPWLAuN5LMUuLC0O0M14XPS4aFuvMCQyxBexKGS8OisAS4+Ct2gs+g==@linaro.org
X-Google-Smtp-Source: AGHT+IEpF7nOUIIVK7GOgQeg2MZ9yKwqKqxbSRwZ+WuwWWi1/koZJWaiXpP1Qh4BbYwZRbzTlx8g
X-Received: by 2002:a05:622a:1884:b0:467:8765:51bb with SMTP id d75a77b69052e-467962347a8mr23656491cf.37.1733958350218;
        Wed, 11 Dec 2024 15:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958350; cv=none;
        d=google.com; s=arc-20240605;
        b=aXJ39yX8ZvkHwm7B7pmgGGdRMmHXvQr0gj+1mzJ2v1m5toZ7ccwx9N+X1hzIPKjNG7
         QTnXfO7rOPDtMwB+PLNxarn93Djx3iHY4dQEjK3DSNpSjzpJ2eT1eQRUIUOOPbjtD1AC
         dQJSi/RQvD2qjrSvwqZ+9eW0+qBzJOH6eZ/sCpNybs6ygWpRKmllRrnn4QO2hIayH4Jm
         zyBuAm1RWeINlEK8yO9htaqvITjfUw1tcpCNRbNxO4wYRzSE+Umgyo1W1JDfihlyaTUF
         kMJxUta3VS39oAW5Uyh6sLG35e76eZNTjyUz3oGgOaBlASs0lh+NTRbNLVIfO3ndQ2Ul
         ZXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+71ZOpdVAG9B9l+7/FqsTNfCtOJJsIHhAT40qDCr+hM=;
        fh=g+LM22/OxUzgsY1H+OlhPrjS3b74OoahmZb4cDna2Lg=;
        b=QRZQRhd+GXMCf+5AK9F3MwcChxEej/HWrrMIFof0UG4ePuZJERATu8KrLhAesWNSKK
         ZuQYDGpVGhpais0JGdct17t+eNdTeAtxIh8kewjeNs7uBAiWEs2u6mZ2Ne91BIizvFxM
         J7Ut/lIQxY/62UL4unaupGwg10Lbo+6tm92ihWEPGNRmZz8w3ahmRUz7OM1UemU6WnuH
         C5/PSAxZmBZnSy+MEtpyBnDkrighGyZUq8nFYcyJzh0dNzYP8cko8yb8r0vYFu+E6GeC
         gCEfQCUcsfXxu47sfuBqp3onqIouYKc/bhHLDAefJcWqupDmAk09tjJi+uN2JGZTC0Jd
         GasA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p1ZWY7xk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4677c33650bsi24160481cf.113.2024.12.11.15.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p1ZWY7xk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVlK-0003Un-8i; Wed, 11 Dec 2024 18:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVl8-0003Kw-Fx
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:47 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVl6-0002Fa-U9
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so753116f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958283; x=1734563083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+71ZOpdVAG9B9l+7/FqsTNfCtOJJsIHhAT40qDCr+hM=;
 b=p1ZWY7xkla3DXjQ2g68P2igLCFqO3MLeBEFavRFoJGRHqyWYrJyNvdjO/8aVleAlt6
 /APUezHJ9mtF+7vQLRK0Evvo22DlLjJ0wISNzi9ED7CUQDfXN96VQO28GwkZGIKKD4Zg
 f7CDEw2Ing6WhvdpFj5kEkYKXgGOOdAJnSjKbGC7evsOyMl1qY2eX9CGuFlx2JleLN6I
 P9TNAhP1o1BtbuaSfm5tIg1buvkSsys5/IQNle8L+WKkATnqtFXVI8nJ12vCjlomp8Ez
 EHKZd8Z2tDxTM1+ryjVUIXSJsAmeAfpU9KblT0XTzDPjIUtiPYe8hRhx0jFrN2DT1hGt
 MBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958283; x=1734563083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+71ZOpdVAG9B9l+7/FqsTNfCtOJJsIHhAT40qDCr+hM=;
 b=tym4Y60Kfoe0A/cnSLGTHzsfdHbEhWE+8dxBA2qAO5McWgiURled7aLhkOLP4wwlxt
 ks2aSXWVERZs1u0PDyc5zgjsVFCiysdOyC+5O1+2WJX1l0pX5IHRuxHBb1r1oLfr47XO
 qZkYqsLNChM/6mGG6w8BulvCyCaf50N6mhQCcCMzbSKcJCvSVLcM8my6f+MkgGscPDTS
 /IpO1jbHxYsy5p0peYswwkvO1Ek2ihGEGUKlz3W1X5FVVnR3ZLwfkHh0NGC46WonZOoP
 ss9g+axARERHJpdKhysjTjQ8pClNaYVXeFAZ7kpMMqzQHZ7OnUNKTL37/BiUH7wMqdMf
 +ykw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfRDUgfZXNr4ZIUin8C9c1wMBlWUW7zwXKWW0/+VDkjin/AQBOlHNVt/Fg5ktPUi3U4px3yPQ71Q==@nongnu.org
X-Gm-Message-State: AOJu0YxHw9ZjK/dlmGXYn7GDigj1S4eNR+MySFRK8U3YVjmjldbqRVyT
 bmFbGDNWJrN72I4psbPoRe/5e30kgd54UAiJwJwD9GORVVc5ByOjOUll0itQTF0=
X-Gm-Gg: ASbGnctCWo7io6L7xoyt0Me5KKzE4Pd9iVK2vGMCwHn9Tg01k0/yzcA8Fii5wiQrNxu
 EubK1s9hRRczr3SiEPMofl0dzVd+nLxgFxvSyGaMKozVmFbKp8mDyLxlZ4ma8MR15+EXLS7LVLG
 ypiDgFI0dFyJt2OVe+zCWxE8D1s+Hb5VYPJfoqf5KGWr7KYW8JpBvn46QE5Z6NC0Ov9/p55boDZ
 tskkUDnFmpP4N1IiK9S9cQ/OtRLkEZcGy+kfqvQrEQwFJ62SvsPUYIK891TP9CHndsxL10jTVIh
 baG1OrXv4C2qZJl70Hnk8lzCkMwHtwx3jw==
X-Received: by 2002:a05:6000:a07:b0:385:e10a:4d97 with SMTP id
 ffacd0b85a97d-38788825765mr681479f8f.21.1733958282175; 
 Wed, 11 Dec 2024 15:04:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a4a25sm2330451f8f.27.2024.12.11.15.04.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 8/9] hw/xtensa: Include missing 'exec/tswap.h' header
Date: Thu, 12 Dec 2024 00:03:56 +0100
Message-ID: <20241211230357.97036-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: RmyAJshj9hig

Some files indirectly get "exec/tswap.h" declarations via
"exec/cpu-all.h". Include it directly to be able to remove
the former from the latter, otherwise we get:

  hw/xtensa/bootparam.h:40:16: error: call to undeclared function 'tswap16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     40 |         .tag = tswap16(tag),
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/bootparam.h | 1 +
 hw/xtensa/xtfpga.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/xtensa/bootparam.h b/hw/xtensa/bootparam.h
index f57ff850bcb..4418c78d5bb 100644
--- a/hw/xtensa/bootparam.h
+++ b/hw/xtensa/bootparam.h
@@ -2,6 +2,7 @@
 #define HW_XTENSA_BOOTPARAM_H
 
 #include "exec/cpu-common.h"
+#include "exec/tswap.h"
 
 #define BP_TAG_COMMAND_LINE     0x1001  /* command line (0-terminated string)*/
 #define BP_TAG_INITRD           0x1002  /* ramdisk addr and size (bp_meminfo) */
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 398e6256e1d..2e264c61988 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -35,6 +35,7 @@
 #include "hw/qdev-properties.h"
 #include "elf.h"
 #include "exec/memory.h"
+#include "exec/tswap.h"
 #include "hw/char/serial-mm.h"
 #include "net/net.h"
 #include "hw/sysbus.h"
-- 
2.45.2

