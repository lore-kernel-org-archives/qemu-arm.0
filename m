Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361338ejb;
        Fri, 20 Oct 2023 09:38:50 -0700 (PDT)
X-Received: by 2002:a17:907:8693:b0:9bd:dfaa:3f2 with SMTP id qa19-20020a170907869300b009bddfaa03f2mr2067658ejc.6.1697819929927;
        Fri, 20 Oct 2023 09:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819929; cv=none;
        d=google.com; s=arc-20160816;
        b=VoCbWqKZYX33aIsCK73cSTPgbSPoClzRzbVPhYmYOKshQN1QZO0q9DaeKtSQ6+UE8I
         JksWrdpxn/tZOdgYzmpQTx6dA1+LXwnDusBHcfJC5BUR4Ab0ZztcHGpRynWvgnEnkFVN
         d4TEB+APrdfRPOTdp7o9UQfBOsIzSS/XHHwJ8I/6dbIV3tFKdihyq2skYLE9+uqPCCka
         Y1rvZqrMeV8KjA1d24Q8h19K2OOZDkV2GXENSuA7I0q0o4KaNrytlMlAQre9cXHhHoUy
         qt1SyKufe8YnnJTkzCTEQjoz0rptcZsAPdOMv/av+3KVR1urb/5rIC8Lf5JHaHV6IO/c
         2aNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1BNA9y4zfVXlb8HVquuGsJAgjqtZlJA+2+vEQrqSYx0=;
        fh=0+oAGzMSgE0nSXLTI/o4iFk9zal+DrpcgHB8fs9TnoY=;
        b=zdEpklw5XV2cqWHO3O3kfHqDJhiDP7w9TL/p9r6F7P4FIpWCOm6Mxut08BClVdpEe3
         IxGOI/YYJ2oykuPLf8n5rdt+6QDugvjFOqL45u91E2rQUxeW7Z4vZdFoHOHjWPdM9txh
         HFynwUSNLgWeFsEJEgUNrHQGBoW2IqsBARCKQY3ZjlvkdEmWh5F2Kmuc4BqTW1OS9Zbn
         +Nm7r7Gye8B4G41Ub8kHOGbl4r/MJOsXR4Ya3t3svsLCMS+C/C+C/VQ2XI2mjATWV3Xz
         ukf0EUkYJQq3R8vxiCuV3Md3oUL447VQGUMmAv6l3GVY0mfP/tmeMKh/dcQetqphbqax
         hZVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q6oOODm/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz26-20020a17090775fa00b009b2b42978adsor705129ejc.7.2023.10.20.09.38.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q6oOODm/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819929; x=1698424729; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BNA9y4zfVXlb8HVquuGsJAgjqtZlJA+2+vEQrqSYx0=;
        b=q6oOODm/zKlhEpuyWXA9AWnRFOrJ06vLkEEyYHmVG/SOieDNMR7AlYldmbE7Awyoog
         hafzYaDe0RYtlKesTbtCuf4wN/d5OcvsbbTHSYnekXJuBjep9VlAe4LMmy9Y5wOEllhJ
         +1FC+4XDQN5g+c1jqW6hH5v92cOcIKCqbFOCQ9jbXJyLvwM/oiDApkJQ6gnspBbUHFmR
         LL1cEeRbyGJBUmKPyyZDUs4mFcjIMpUiXzm/EHr3tn663gfWGuCh6lHH/w4cilCGmQZm
         AtjP4yyjsKRBuGWn5wuW/n0CyhqTn5zwN1IcCfgDWx0x9AXGxIvkBuP8oXq3N5E8Wcc3
         3lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819929; x=1698424729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BNA9y4zfVXlb8HVquuGsJAgjqtZlJA+2+vEQrqSYx0=;
        b=kkdn3B4NloUevuoC4xMWubLO56F2bc9RaymoY0ZPsm/1E4Q6igKinTSAAnRBcMZT7T
         jDMAaVeCysxA70pJJNN0fhWM/t19tTF3UNh8B97JSxpm2a1MVfqbVqMCL5QLOkTY98kN
         pMp/xKAbIYbk78UtZbKuE4e7tp0hgkSa+fr08sZpsYLfSDolbWt5+zYCxTwTzODxnqZt
         34lwnpFAesW3IsmzhLTFVbDHfe53KpCVlDRFISjq5Ahnus4kxggdHmP6gdNJulnQGijx
         VshohJD024nVpLRcpY6xTiz6QzbHW9CdIeYe4NyyNKIO657XuCx//KjKysojscoWJBSw
         3LCw==
X-Gm-Message-State: AOJu0YwN+ubG/hJUupKa1YUCQXYTzY/61xIhaakBiGzDy66zlfdxEIFP
	oY5N/dSRMcMhhBljKEaFGd3QZw6I
X-Google-Smtp-Source: AGHT+IE8pTnTm8kExFSHgwFwuE2r5IXOklMrkIbsOtRt5M7b3C9wUv/hea60CxUNlZq2FBxMZ8uDBQ==
X-Received: by 2002:a17:906:ee82:b0:9be:39a4:b440 with SMTP id wt2-20020a170906ee8200b009be39a4b440mr1971962ejb.76.1697819929604;
        Fri, 20 Oct 2023 09:38:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090607c200b009c6a4a5ac80sm1776806ejc.169.2023.10.20.09.38.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 16/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_TRICORE_CPU)
Date: Fri, 20 Oct 2023 18:36:38 +0200
Message-ID: <20231020163643.86105-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 09iVnCaGAvfa

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_TRICORE_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/tricore/triboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
index 4dba0259cd..1fe6692f97 100644
--- a/hw/tricore/triboard.c
+++ b/hw/tricore/triboard.c
@@ -46,7 +46,7 @@ static void tricore_load_kernel(const char *kernel_filename)
         error_report("no kernel file '%s'", kernel_filename);
         exit(1);
     }
-    cpu = TRICORE_CPU(first_cpu);
+    cpu = TRICORE_CPU(qemu_get_cpu(0, TYPE_TRICORE_CPU));
     env = &cpu->env;
     env->PC = entry;
 }
-- 
2.41.0
