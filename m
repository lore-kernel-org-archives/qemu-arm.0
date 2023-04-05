Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480128ejb;
        Wed, 5 Apr 2023 09:05:27 -0700 (PDT)
X-Received: by 2002:a05:600c:2186:b0:3ed:5d41:f95c with SMTP id e6-20020a05600c218600b003ed5d41f95cmr5499282wme.11.1680710727164;
        Wed, 05 Apr 2023 09:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710727; cv=none;
        d=google.com; s=arc-20160816;
        b=H/EMP9NRtE9Hxx0+cT8DIbmyZqk9EQCkCyNfvA7pK+/Y5iQCuFJYQ6K/88pK+RUv8x
         adrGOz0YLeYTHQgrZonraBdVIlslfQbyTjmUCN6fgOT4jvHm5AN1RM3/5KK5PXvadIJY
         y6xmJbbp2zeuNSUkStys0txheH8SYD3tIPE2uPgkn6f5aZoHFM2T/dENoPMBbpnXg7Cm
         l1B+cf4KWRqTsACknT/z47lxCnkxS/XvitZQiUIWGvmdclEN7QFmSY7cYgWmPzH+uV+E
         lEWVNmXHIfJfeuCdxtLjesZCCb6ktpGbd52sb24zOQrwrTQv9PZhQwvQJ/l1O4pKVz3b
         xM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
        b=nd1v0RgDDbdDJ7mBEGa9Y6qMCdEi/AT6aYZQ4kydBqDwqqC7QTtd5jfxtHD3pAavMP
         sNpzniymcqR1VviZgvjJi3WJ4S9AAtR86lg/opwCZAiyJN7E30UTZweFXH1DA/YwXARL
         ecvI4Q+zhjkzBCNQoFoEK4nQO5uC2R81QHcUe2pgzd1Cu5MKnY6YzJ+cykMkG/vj4fOl
         sU7W9EwJxQj5VsySs1AtQhzu1xLCMpI1atgrqxgCOVp6HOw3ZmA1s7Cex6RgDuKR/Aar
         gIHt/Nn0KFwj8s4U5wOxTurdJKq7Y/ebI5B/ULmKtVsqnZ7MbHW34hnEmcKbm4x9gGoD
         /sHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnCYq5Dz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q11-20020a7bce8b000000b003ed21059ac5sor695688wmj.42.2023.04.05.09.05.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hnCYq5Dz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
        b=hnCYq5Dzl/7iLI0rQYbkc9CUi17FFpKYPMxOnHcemCexKvxTdFYuaru2TQEImK5o9e
         jTn4K6Pp9zXxdmmJsMb8gD9S2GQ92Q72Ifh8L6RxwgBOR83AYlvxa/V/6Fh3hPXQBoiV
         z9gKOGSH8bAn5zRrapQGO1yAInmO8o8qVZTpVMRyYOG1CV9m59KTFXQeJKBj8sjGVuru
         vuCXHX5KYhKDn13HSZVsP5Lq2Qz50f1zC2IoyROHSYrzPF6xJDEsucHmTbgNlZ1jt64p
         EjINJfxYuBjgAhCrq5BfDf3e2GoiGGEqH9e7WYG8IshZ6uH7iubAr54kkd/PnEXO2Hgf
         kVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
        b=DvgZvIrgAb+CEU3Mk0Jd5yv0zyH/n6hF2eVfT1gV774U4OefieVYHZpmOVfg0ment2
         kRPohiFB4K9nwaJmSlE3455ja7sdPbwwsFgvX8kp9m1SNVAC0Bl8X2ziHGPpQMQLzVrz
         vnN6/6tFNUwXaTCGpeBTSVCyzhtFAQUSLkVdYd9T6B55JfG1e6dY6W4nKM6fW5kihGVf
         jEWuimK7VzlbLS66jRpSdmdvc0v2FqIiHR+qxejPbUZblno6nO+AOhYngbLZgYZi44wm
         gI/2UgWTkIGDfnH1OSCAMMVx1+K9lBAul/L2GhCrLo58hBqRzZUGAC9XG/bVesbnu7CS
         turw==
X-Gm-Message-State: AAQBX9eiIgqFmh9KgS0BGT9d+W/Rzbr2LuwVZQuMC1BHJxsq4wCpU/Fq
	cHRi1/DrLhZXaX7KJFqelRetXxOv
X-Google-Smtp-Source: AKy350ZJ+dZx4arE1dDvn+93xqmfAgQekaQ5sdLBd5m5/mFFyw1t5hipklNUBAa6v3f8yS67ujRRZg==
X-Received: by 2002:a05:600c:253:b0:3eb:3f2d:f237 with SMTP id 19-20020a05600c025300b003eb3f2df237mr5280415wmj.6.1680710726924;
        Wed, 05 Apr 2023 09:05:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id y9-20020a1c4b09000000b003edf2dc7ca3sm2586415wma.34.2023.04.05.09.05.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH 05/10] hw/arm/sbsa-ref: Include missing 'sysemu/kvm.h' header
Date: Wed,  5 Apr 2023 18:04:49 +0200
Message-Id: <20230405160454.97436-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 62HujsJNXix/

"sysemu/kvm.h" is indirectly pulled in. Explicit its
inclusion to avoid when refactoring include/:

  hw/arm/sbsa-ref.c:693:9: error: implicit declaration of function 'kvm_enabled' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    if (kvm_enabled()) {
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 0b93558dde..7df4d7b712 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -26,6 +26,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
-- 
2.38.1
