Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1675167ejc;
        Tue, 12 Mar 2024 01:25:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNggXoP9POYVXGZpllPgh+dyTt3Z2UYn3YCLGh4LFQxS9LYzIsJfKrcZnvBBa8esBU0HrY7U5U6WMsKsq1ODCU4EAq7Rxv
X-Google-Smtp-Source: AGHT+IFdfTSjR3kvzlRU6OFxAVZwBiuhiHhJnMHx7Sbcm7oAE+S3BdzbQasl0ICA/MPG7s623JfL
X-Received: by 2002:a05:6214:2629:b0:690:c568:8dad with SMTP id gv9-20020a056214262900b00690c5688dadmr13317660qvb.16.1710231931780;
        Tue, 12 Mar 2024 01:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231931; cv=none;
        d=google.com; s=arc-20160816;
        b=KQYnQMKXv8Xa89AZiZ1+KJpErnIBgcsxnnSrQf72jWK0sVAq2oSzH8ust7M9ZDF/WI
         E6o6KszVSXscppjddTXmbWnPjhjO+6cjMXdRNfD9/e5mLQLWtuU8vLHshQqCnT8sgVAU
         5bcjFgDlMymOx5FKYlUIama9hF7tilyyE+K+SrzfpeJHxWQOgRQ6Ir6H0k6PLw7+6XMI
         UvinQfqXpu3uiqc5gOF3seOu1Z5IlCdJmNEaXCz0GAimHoFYcT4qbIhfDn80YOwIIkM/
         kFwfkFCt5D6geudH+oN3HQYv7Dpm2+WttUjL50ShwOg0bVUfS73idMvd5CetUnV7CAnU
         P7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uETsEUNOz0/4CrmmYx0I6id+tmI4uW8xOvgnA3mXRG0=;
        fh=3zgKXu2sN2CZPleBiXLItgthsCBz7aKq46Ued4acRbE=;
        b=zW+EO57o+aP6NMhASLeUXZVpVNOyKzpLR0AHviepy+uuToeK4eGJ/e5KkgzZWBq9x9
         u+/kIUBdcP0El2//ghoRoQGWNCzk8SURJDWeEgGNSu+9kBBg68H5Oa7oRitsM8rW8eYY
         2IvN75+zT/KHp0wrpLDjWrSET4hQtFxB8C7ipPf4ozDCz9LdGiPhPr3ba6gAW5O+6bbW
         vxcbcKuBx4LUzV+jtlZMeM9FzLMXGzvV5YeJnWeV45RaFXM4k7o3iVzlpfbBluFF57+j
         vzwwhDoH+nQjWj4FAToubbRU0JCz3PAXVIXmYE8cfeZ3hcVIvOWWt+QkQochUYDpkaUi
         MYTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjQcJPKF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020ad45bcc000000b0068f70c5195bsi7008282qvt.614.2024.03.12.01.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjQcJPKF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rjxQA-0006L7-RB; Tue, 12 Mar 2024 04:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQ9-0006I2-Dl
 for qemu-devel@nongnu.org; Tue, 12 Mar 2024 04:23:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQ7-0001Df-5v
 for qemu-devel@nongnu.org; Tue, 12 Mar 2024 04:23:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4132a5b38fbso9387955e9.0
 for <qemu-devel@nongnu.org>; Tue, 12 Mar 2024 01:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231813; x=1710836613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uETsEUNOz0/4CrmmYx0I6id+tmI4uW8xOvgnA3mXRG0=;
 b=KjQcJPKFeRixgTaUntEcbKHzxuPYGelnIEoVcdyWOa1yZSoFlGRfze3FsDcCVWo0KL
 6Uy51D/odDLH1I9mK+wuLHSDf2y8IUDX47GUhF2/5FDf8u9fxerUM5EM8kj23sGf35IC
 cL0zZ9AVO4X9gGwKBF0ICUzjsZ2xpnMI9cGN6GSaiU9NG/FR2ifVnuIJT76KqXYkOBws
 Hr0+xaiAZbayC0CQLn3d46uKNgRTUCGGve+Xf4z0ooPGk5foKzwUqTNEsxKls8FGCQ5j
 VJ1XSHoUkttiUErv4uSBo5wa6bL2BvOGSXY5m8biPMXh044bi4Fw6zMLDPFJOLKRuD+U
 EyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231813; x=1710836613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uETsEUNOz0/4CrmmYx0I6id+tmI4uW8xOvgnA3mXRG0=;
 b=NyuDGtIOh8jOSw76HTZwUtp0geFbjc6u61Hbf4zTv7dDIGdc4ASmclr6xuBDY4h6se
 O7a1pJnFcCHa/NgdtjhDSxrN4cXq7l0vg7swBEjRrtd+vRfQsaXfW5YQtP6PHT3ZK3ei
 IYnWA+2Z/1j31D/Oj2z+7r8m0sIDVsAVUOtqfZS3lLd24D9MU4872jINNWcAuJ4gaVoa
 nB5Y8e6Bb/BYgjiA5cnix0hg2Rood08m8i34OgRi1qNL2Bql6Rg0PDC/Wyn6/9IXdg6d
 1E9Weo0Alw/Tog51xcA08VEDStq2XUkx12aGzotPeLM7aIZtn47VJEW8uHUeS+bTqik/
 5gjQ==
X-Gm-Message-State: AOJu0Yzz8VHo7zMXCxoD4FzQyd96Uga1FAgcMod5hUUKi757VPd/Aewt
 SnM4WU5z/k9QNs4pU0IGHdTVVPUhN5bGhXl/LGancSHqD1DgSxtUD1XyQbi5h7sH/1+V6BtJKHh
 K
X-Received: by 2002:a05:600c:6a1a:b0:413:1285:6e40 with SMTP id
 jj26-20020a05600c6a1a00b0041312856e40mr6633849wmb.20.1710231813577; 
 Tue, 12 Mar 2024 01:23:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c198d00b00412b0e51ef9sm11854370wmq.31.2024.03.12.01.23.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 08/13] hw/core: Cleanup unused included headers in cpu-common.c
Date: Tue, 12 Mar 2024 09:22:33 +0100
Message-ID: <20240312082239.69696-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ehchvTMjPFTe

From: Zhao Liu <zhao1.liu@intel.com>

Remove unused headers in cpu-common.c:
* qemu/notify.h
* exec/cpu-common.h
* qemu/error-report.h
* qemu/qemu-print.h

Tested by "./configure" and then "make".

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240311075621.3224684-2-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/cpu-common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 0108fb11db..4bd9c70a83 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -22,14 +22,10 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "sysemu/hw_accel.h"
-#include "qemu/notify.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "exec/log.h"
-#include "exec/cpu-common.h"
 #include "exec/gdbstub.h"
-#include "qemu/error-report.h"
-#include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
-- 
2.41.0

