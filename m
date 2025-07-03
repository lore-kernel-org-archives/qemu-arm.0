Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp450394dyc;
        Thu, 3 Jul 2025 03:59:51 -0700 (PDT)
X-Received: by 2002:a5d:5e8b:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3b1fe5c067dmr4895671f8f.16.1751540391436;
        Thu, 03 Jul 2025 03:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751540391; cv=none;
        d=google.com; s=arc-20240605;
        b=CN0rcPAfL4esg9i1ePBL2H0f7U6AL2AuAJd0ub7IO2/dNYaBQAh6m0DJFrkPmlmkel
         I37izJ80G43D+S/WV0TNgDfljYXA7QfEENrRkCG8YenPyvfSx/j0+Tp03OD+nwc+NKQj
         nxqf0PL1rlFdshs7GjjAAKqbDwXl1BeboBLHgaL5hmRihPJllVF5ZZOzzAYuVOiYFSSG
         DpNWsWr0BEw8sfMSF4kz0oGPnNHTNHtRrFJcC7dMO68mrRkPSQzxwimTNLnRhz/P7LpZ
         mgRWhWokIz1I7ZCoPh7JMxYxgZzAT/+VIWsH/M/KUihvQsd0WqYevq30Sir8uoIDf/zj
         UGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m+WutgSqJXFykFHZTQaYKZd8VkTwajJGbTU9Mch4jWg=;
        fh=sXud4kcolF0eOmzhbtS2wTSN8FEObAEGaazVgc2vePw=;
        b=J+aiIO7WESi5QZwKyUCBToV9LYE6mTx5g2MCNwqLGaBwuuq0l8x325YtDNbOEGIaag
         w1ixkHGKuRrcn/ygj2Q5cP7BnqhJ6qC18qV5XTcR6hQSvPwVPa9VeYgMeVzLNDlWgfGh
         n/cDC03XVNiOUehDGQnoNizqAnGsYQee9nrQWY67+OwDedsT8F/wZI2AFjiazMO/DahS
         JJlBcqISFPSs6tMhhMFzOK6gNhnRE4Wj/Jq/R2iNUtHamyiLCfz/Kyd+WGKVVZ19Vquf
         iGZbD4pu23Nx9wDnc9bu0wx4oUj58JrtPN3uitRZ4qwCFQYlqCEvB5RN9rBdrgwOHGH1
         /FWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LuIwgnMo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-454b05b471asor525615e9.6.2025.07.03.03.59.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 03:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LuIwgnMo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540391; x=1752145191; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+WutgSqJXFykFHZTQaYKZd8VkTwajJGbTU9Mch4jWg=;
        b=LuIwgnMo5Jz7Np2gLv1bOOLpm4Y/2v1yS+p/2fcQ476kojHA3vgSnvfWT1g+dbL6Wf
         EBXBGBtc23ia2ozm98Bgmm7/xHqTk7kgMHL1bbghCyuYz+Sp4LoB8pN/J21/xkGe+grs
         IT7pqloMxYfi6/73Yr5RJ6uiOL6jNbhETPzeIVmM3JtiJnp0uszX38lcHAgq8qHXI5wO
         PcOupBa7cRUt2wGSsdU5uMsEDTJyEe7JnXFxgkiLLP0O/3EgjJctFROoCQjESDfJgrhk
         r6lB6z4UPXPiVm8ngP4Bl7uvl2URp3HzCDBi8YwUDw01fWloSi9/C8PxpU4UAaLUIsaT
         NAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540391; x=1752145191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+WutgSqJXFykFHZTQaYKZd8VkTwajJGbTU9Mch4jWg=;
        b=s8Z+xalp0QdCM2huQoyo7Vea/4y4/xhmNNI2V6B+4hNFEFgEP9n9pBDyk+ONbgqGOz
         ut0fJ3PJ+IJ6o9Cz0ABPOiyR1+DchCBTF2S2FBHDlSxS0mutGvKgPqMe0bwnpeC26V6M
         2tSR6xioIJofb5lDIPV7oRI8wvIA1QcyL966/rgmNajsub3wCtTMqlQObsgK9MMkb0R6
         ikCCCCLeLvz5IIIDp/6ay/CWguzTfGrSfy2Spjk8IaTqQU9DLexiDzpm+GmDvwn6kSC/
         /lCbKED2zrFFHfdrWXP+DtttACc5kUp5bHhUT3hUvyWjusKIOullgdf1a+Npbq5rRjVX
         +9yQ==
X-Gm-Message-State: AOJu0YwD+rQEuxEJ3JabknVKWwlrhMa9SOyzzy1HTjoiCHv2sclZhl9S
	WVOq2JKViQ09VQeETcL9nY/KEnI5mQ903N2MaD+yr5ry5Xiq3BA3ecr0jKymMXAoAOPRXg==
X-Gm-Gg: ASbGnctyDyjQ3uwlmqHC2BkhQLhwDUqDPN76BacFXjMhV21axp6ygo5oWbIwo3fC/XD
	Akw/cYdFaT4Bgu42m7GPMqhPm7kwTy7ULUTdJ+VwRTPalJHYd3lYFKR1SgLPSSAV70DNiAsXRBx
	UY6jHRvy3/WUiqX6tMHlNd2xbSXkAIoLUb31tDRIUqxxGmOgb+ZyD95W9lwPlWr8bSGYCKbp75K
	Cv2QWjowyb92N3JaKqqPjNnLMKTGOWgkeFXOL9UsLMeahpiNtr9qYhVvCjoLKxcrbTyoVhJNRK1
	B9moah3cV5aeoAMFkcHslJ7GQon76+DTAcA9ApRMoDsjCwxMScHrcKB35xFzRwJjgML++fTf7Fm
	5bZEc2jtX72c=
X-Google-Smtp-Source: AGHT+IFkJTWECY2pugXbhxGY6HjeCgJxFNGAomzZaEG1B6sFjMYNKg+pM1wp3bta32pi3CVqInJhiA==
X-Received: by 2002:a05:600c:6792:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-454a370308cmr75309655e9.18.1751540390713;
        Thu, 03 Jul 2025 03:59:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([83.247.137.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989423sm23583475e9.19.2025.07.03.03.59.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 03:59:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 47/69] target/arm: Use generic hwaccel_enabled() to check 'host' cpu type
Date: Thu,  3 Jul 2025 12:55:13 +0200
Message-ID: <20250703105540.67664-48-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pfnUzrd6828f

We should be able to use the 'host' CPU with any hardware accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 5 +++--
 target/arm/cpu.c          | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index cefd2352638..ee5eb1bac9f 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -30,6 +30,7 @@
 #include "qapi/qapi-commands-misc-arm.h"
 #include "qobject/qdict.h"
 #include "qom/qom-qobject.h"
+#include "system/hw_accel.h"
 #include "cpu.h"
 
 static GICCapability *gic_cap_new(int version)
@@ -116,8 +117,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         return NULL;
     }
 
-    if (!kvm_enabled() && !strcmp(model->name, "host")) {
-        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU type 'host' requires hardware accelerator");
         return NULL;
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ebac86f70d3..e37376dbd2d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1978,8 +1978,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled() && !hvf_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
+        if (!hwaccel_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with "
+                             "hardware accelator such KVM/HVF");
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
-- 
2.49.0
