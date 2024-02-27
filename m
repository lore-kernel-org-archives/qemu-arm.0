Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2544487ejf;
        Tue, 27 Feb 2024 00:44:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqigB7lhEO0Y2WKV8LhzowOBhF2QC88RJQH8tapPiCFw+f4hnX+BX5f/5Yf0d2amXC5n3wyy3h1FOazdy5P/0aUiZswjwr
X-Google-Smtp-Source: AGHT+IHC834U5PDwfvWjHPw/AFZtHOMH2WO6ZBCy4fhPK7MRE2sQlF4zt4vWdvjbeyOtTCvVCdqW
X-Received: by 2002:a05:6214:1311:b0:68f:8c72:b89a with SMTP id pn17-20020a056214131100b0068f8c72b89amr2099145qvb.54.1709023485597;
        Tue, 27 Feb 2024 00:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023485; cv=none;
        d=google.com; s=arc-20160816;
        b=YAAbG/MD59QRHiXr0LsOInFQbsS547YXmFWKJQKrjqs6XIkfqzjPQCsRJ6xH9eUVmO
         v10rJHXuAfC/TyUqGPmv9UDmz0JN73iG4N8RjRylsJFEOSn9RG6JZ4NpfDVZsDnmXxvJ
         wCVlRp1JQOlzh/DmgPQo4k6NM+iWRs0YGwC0aKQg96KmhDK4HotlY7HPL50isFmftHAn
         utzj0Kn3Qpyykpkmz77NcEl7syxaWpvVjt+5RXnEeBerhk9RKIy5FHm/gmdXdZ84cj08
         DiJ45apsCFb8K6DA6YQfmYmGg6r+aIteMr0UMSLJYYJWg1yBnMqsFwEWReoohbl/3zJ6
         28fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=scR0cVRlUQ+FFZFfcolEQrGBOQjFaxkZH3KxNR75t0E=;
        fh=T3SVFvi8BDTicq1fBXSZih6y7gb6GQ2f3Ziu1XVDE+g=;
        b=GpGoMCL7A6DbepyAZ1ZGQ2rgLVqVj9B3oMwhelMJ1NqwBxkp2Q4/2kyN9T3YG8ATLC
         wnv8r+S5vWeU5LKeIMmQDq9zhP+6cBaHd8TND17Ms6LlnyJtAJdVxNA3wFql+Qtk9CpE
         GPHNsD6WuVpAV4Wnm1GOnFlhqa3Gj80BLBO6ozPp3H3zuV/7uVvAXQZCUp+873seTqJl
         f7K32YWTlWC6Zzu47LM8UjN9shTOiUTw7exVIINnLkk3fKv6Ys5J5H2yv1i3AfDTO5EB
         DOiDZegTI/OIyNNKvopyOuDDcwykaI7FfUpkoE0/U6V/xq0nea/RZgNq7hkqWc5Eg93u
         P84g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JfKiBKhv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a056214194200b0068fe5e2d4easi7657172qvk.558.2024.02.27.00.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JfKiBKhv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret3D-0006GQ-BP; Tue, 27 Feb 2024 03:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret3C-00066L-05
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:58 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret3A-00005f-D3
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:57 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412af574501so873445e9.2
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023374; x=1709628174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=scR0cVRlUQ+FFZFfcolEQrGBOQjFaxkZH3KxNR75t0E=;
 b=JfKiBKhvAIxJUB1Vl1vpD0KgcYBHw49OT6Q+K5+nfbK04tzUPHdqWYtPYAH9P+OPrA
 WfUAG4QYHaTpMia8IGl1ZGQt4c92+3o3getzEgmOVUJlB05ecvAzX5NwD4RN0JTBoFR6
 EBAmTXkxB/W7qEAXNn6k5EAtu/7e4whQDuvXLtgE+Ld3OEVVhlQX93ZLl7lYgf2hBO92
 9UeymH7HCQ9l59SnijxA9jQeVJqo9Drm8hZCsmabE5w2BcaWRsOJxpNJoDind5QCLlm7
 L5DIgbfyAI9V82hAnuLvgm3s3qD/T+foTmZsOc1kSvcHhsMDrdN/CLDaKBEFBFA52Zja
 Fwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023374; x=1709628174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=scR0cVRlUQ+FFZFfcolEQrGBOQjFaxkZH3KxNR75t0E=;
 b=W81cPcQB2Z8o3gQSNIt1XqTZJHl9i2zGFWAf+7S1C5YRrXqFnlXGWJkB25WW2nFBR1
 Sa2ObU3CDHJWkTtFuCEgf7W7l2KUo1GtVyinGv3PCsR9jEdyjHaen+LLAwUQMc87gQkw
 DuXScrmni23DlomA7rwIM1F9iPp2Rq+5zs9JwQ/WY1rGFeoN/cl9/e/QLngeohosuSCO
 84pR1ioYiCAwWGJ2DYmYmxVS0ii9Dm4NqBuhWBzc5+zzzz9PtXq6NX/14v1socyk4Spm
 +/KDS7MTQuLQCwLWvCz/Kf0IdwF/CY0bhhVeYmjXuae+qBhCqyJjjQ1HqozjUWbCWnS6
 aZPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsv3TXsAzbZZuj3a0wHntcLvz/IM+u/KoQLOc7oCrfNzAwF71ao2APDgfHoJ4b8vkcNvVNHlsWbdvZmsy9hdUpCozJ
X-Gm-Message-State: AOJu0YzgtbEdtpWjVf1EukQYcQkSxVfTkCxCILHMU2dBRyeA9GsiffJd
 1A2w4nPhkf+Jp+H3XxYDaDOp8sX4WjTSuIu6m2ldUTtH172CZanp4UTZoweuh74=
X-Received: by 2002:a05:600c:3490:b0:412:acf1:29a7 with SMTP id
 a16-20020a05600c349000b00412acf129a7mr726180wmq.20.1709023374029; 
 Tue, 27 Feb 2024 00:42:54 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c211000b004126732390asm14316282wml.37.2024.02.27.00.42.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:42:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 29/30] hw/ide: Remove last two uses of ide/internal.h outside
 of hw/ide/
Date: Tue, 27 Feb 2024 09:39:45 +0100
Message-ID: <20240227083948.5427-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: DZ/todjU+tI6

From: BALATON Zoltan <balaton@eik.bme.hu>

Remove last two includes of hw/ide/intarnal.h outside of hw/ide and
replace them with newly added public header to allow moving internal.h
into hw/ide to really stop exposing it.

Fixes: a11f439a0e (hw/ide: Stop exposing internal.h to non-IDE files)
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240223142633.933694E6004@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 {include/hw => hw}/ide/internal.h | 0
 include/hw/misc/macio/macio.h     | 2 +-
 hw/arm/sbsa-ref.c                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename {include/hw => hw}/ide/internal.h (100%)

diff --git a/include/hw/ide/internal.h b/hw/ide/internal.h
similarity index 100%
rename from include/hw/ide/internal.h
rename to hw/ide/internal.h
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 86df2c2b60..2b54da6b31 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -28,7 +28,7 @@
 
 #include "hw/char/escc.h"
 #include "hw/pci/pci_device.h"
-#include "hw/ide/internal.h"
+#include "hw/ide/ide-bus.h"
 #include "hw/intc/heathrow_pic.h"
 #include "hw/misc/macio/cuda.h"
 #include "hw/misc/macio/gpio.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4a59e2fd37..13dde50cba 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -36,7 +36,7 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
-#include "hw/ide/internal.h"
+#include "hw/ide/ide-bus.h"
 #include "hw/ide/ahci-sysbus.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
-- 
2.41.0

