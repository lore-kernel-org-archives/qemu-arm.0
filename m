Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1281086ejb;
        Thu, 25 Apr 2024 04:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjhsnSKEZ5ogyDSTBQgqhewvL6kGEX3aNsI1Lx/Wf3QbT6d7pzUTfjp9KAQb+Awgt9H5fwLIKA7sGQBfr6xSun/ZdO0n8Y
X-Google-Smtp-Source: AGHT+IHpFQcA87zDgBlby/EnFynBw4Mn5PWu9c0vB+74bLsNI5BtZQni+0ArxxdYAQ7gFgzNytoN
X-Received: by 2002:a05:690c:dc1:b0:61a:e4ef:51d with SMTP id db1-20020a05690c0dc100b0061ae4ef051dmr6359196ywb.9.1714043197499;
        Thu, 25 Apr 2024 04:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043197; cv=none;
        d=google.com; s=arc-20160816;
        b=iMpIlAfAQoQwx9bD7pB4Qbhj0kyfOZ4VQeT2eF1lNncE1o4yiwRFdQ7GtrCB5h5geN
         hBP9C5CeI6anNsLb0nMA+biq9KIa51zLyAy+O/TBBw2EBZ4j4sKMluXw5y1tXAhuAQfq
         5k5tpih6A1TB8jLSIWTETLlCMG96MmNNidT9Tru1ChaPoPG8P3LokHtiu21HwoeNrF7F
         bOadXY0jngemJk3DtIc0Z3nH0T+Zzs82ToKELkhaEKfKaGEjWYAhz3kOYYQ+x4knAf7U
         fIaipjrcYBMR8b7H+OguuwGR1saR+JoUdXTOeVM5x8YcoL8Uo+hk5nJR0Fr3i58U5wgx
         MjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2PQHJ5tsa1+Iw7rGUJbqHRL8DwWj2o26FTHLneT25lU=;
        fh=PAuXY+p/vqZWNl0QBzvfyGSYUtfS4HDPPRwkjz4g+IA=;
        b=ekaeIQpkTWtckGUxOTwc2xKHrSAzNppDuzG9IbUqFfBl2meZoGZ9kHjQY3mIpTMXYU
         wppZmdSdCTJpi4A98fcR5RJlevUj3xnHwqWOjDnY15ALmPy6VC2Jsq1d82ERi3FhiVi5
         qa3pQFmlslNhfhiCVAZwPCWrB8aE3NRtFq+CdcGVLqA964PTByLlJhB0N39Zn9hwpoqr
         rWvCOaPO2dvKivXWQjsmjHH4m/jSnhKUh54oJyWpe9RBbYpV1e7y5lfIYYdzJPoK+AHi
         Xc95avPSiP95cBonKcrj3O5sw+lutf0HnBVfohnetR+tM+MFZjwdtFKbpC2R6VJTNesC
         G1kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qF5vPcOk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id et11-20020a0561302e0b00b007e3a1ebebc9si2711846uab.225.2024.04.25.04.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qF5vPcOk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwu2-0002Cc-L3; Thu, 25 Apr 2024 07:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtM-0000Di-M0
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:04:03 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtD-0000Hz-N6
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:03:46 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso11307961fa.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714043011; x=1714647811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PQHJ5tsa1+Iw7rGUJbqHRL8DwWj2o26FTHLneT25lU=;
 b=qF5vPcOkQSHZM1NLwAfCBQMhgKN/jwiR9NQS6Ch89FK9VZIjHtD/ZTHN1U1oybFX9/
 j8km1Ge599RgH2hYhdMMQ/9FzK9rsJHIXk5WHMmT8xx79+NQvbvqp5RLY1B27ZBbLhsR
 E45oDsbfz2XHLQloCcYrmAb5HSOCzmCIUypH5bGamARXwIYgz02OqGSD6sFYcSxnIu0O
 nFAApaf1RT58vkwUKnTcdFQ4dEHldFNiO4Kffc2BISTerJOpHnHPdnFE0AyaIa4UhO5/
 x7u5Jrz2uRTFxoE08ZqEIvE44frv9LSbx6Wd1fQU6PgRYJbq817/YvCTEYUE8sXv3918
 GWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714043011; x=1714647811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PQHJ5tsa1+Iw7rGUJbqHRL8DwWj2o26FTHLneT25lU=;
 b=PanOV6qFlxCBnspG7BhKOGJm/UM/g0eqoOjTsztetNpK4wnTsbPafr61x1XmRU6dbD
 gGDd7RHaqnK1y95ot1adFbc4LYrvGLptCIcN4NGovzE7vOc0szeQ22PYe5CTmON+nAwM
 tFUFuHReHxbgkerpdSz4w3Gd+Ck8XqKX/fFKlJSGPyOEf+DAxgycXPesZBij4zryfigz
 ZAW3TuRFnQTifp4HmK9CDNsk9xZH//EeBdwbsOmk8XWPrLOctLauikBo3v+mZ8QS5b8G
 y5+jp1mRStbhq3zDZElX4LDMFPMzj1AWP8mBe/WcHLHhfqQXidmoyKVbMwBVJ3VX4IZg
 84kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwOFHGjWj75LRbNXglWXJIHwq/+aFL24TWQolXb1y9ih3UDGVosdL2QN5uKksFe6sddvT5YEET+nPM91lxnuceBaRR
X-Gm-Message-State: AOJu0YwHpXuqzuJdWY1scH6+eM9PDqjWPci2YQngf9M00chIeLP2jNpQ
 CzWMAL32JZACDKmjP3mNxl/bT72YD/enBxQquUuvWSlCgV9yB4ilv4aACRY4FGo=
X-Received: by 2002:a2e:b353:0:b0:2d8:3e07:5651 with SMTP id
 q19-20020a2eb353000000b002d83e075651mr4356960lja.34.1714043011391; 
 Thu, 25 Apr 2024 04:03:31 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 bd25-20020a05600c1f1900b00419f7d6879dsm18832137wmb.8.2024.04.25.04.03.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 16/22] hw/xtensa: Include missing 'exec/cpu-common.h' in
 'bootparam.h'
Date: Thu, 25 Apr 2024 13:01:49 +0200
Message-ID: <20240425110157.20328-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: Hqh8N9HNgu77

cpu_physical_memory_write() is declared in "exec/cpu-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20240418192525.97451-21-philmd@linaro.org>
---
 hw/xtensa/bootparam.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/xtensa/bootparam.h b/hw/xtensa/bootparam.h
index ade7891ec5..f57ff850bc 100644
--- a/hw/xtensa/bootparam.h
+++ b/hw/xtensa/bootparam.h
@@ -1,6 +1,8 @@
 #ifndef HW_XTENSA_BOOTPARAM_H
 #define HW_XTENSA_BOOTPARAM_H
 
+#include "exec/cpu-common.h"
+
 #define BP_TAG_COMMAND_LINE     0x1001  /* command line (0-terminated string)*/
 #define BP_TAG_INITRD           0x1002  /* ramdisk addr and size (bp_meminfo) */
 #define BP_TAG_MEMORY           0x1003  /* memory addr and size (bp_meminfo) */
-- 
2.41.0

