Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp532780ejx;
        Wed, 22 Nov 2023 10:31:02 -0800 (PST)
X-Received: by 2002:a2e:83c5:0:b0:2c8:7224:b988 with SMTP id s5-20020a2e83c5000000b002c87224b988mr1700415ljh.44.1700677862290;
        Wed, 22 Nov 2023 10:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677862; cv=none;
        d=google.com; s=arc-20160816;
        b=EhbNkj9nbx68GW+dxRDciFTPOKFWWUUkofCCXb3cc8RBuK63NhJ04qK5zSY+f+hn8b
         rYogV5X5cim/QzIudI5dYkjweFfvUr8J5LasOQXfaAYb3336LkZjT99o55NQ02PpNCZd
         ALstYjFhLglYpQn4jGwf6/W1t4KHGrLISOqmPFk6WemvKPSwHbtrtfyIarAmO99grmju
         vnu8cRscP6SK/7iUg8I8bzBC0x3UsuylctaFa//o5R9KZXaQAVQ66JtDiYs376UtrTxL
         SXqAHg+6RiB9SIa7b33PSWJqR7IbkXaoBufrDT+haIEfVpzRbSDK+SGoYh5qAGtu2e+R
         OHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E7103XOFxT5bJSMqrbJRnaAZtCqt8Oh3G3I/DOAsQEM=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=Pd0BUec+UQfb5jVQuDw45zo4ryVu99Uh4GSYSlxhkT+ZtXAfa1wp/LPE5h1BL4qcWT
         ZP7aJsDpRhhxRJ1r/PkD15crdIamEWf+IQYUst/ykYqvRH46oQ7JYlLlYEehamuFZfRN
         Y+UUjBIxhehK0wSYZYVQH9KrgZo1vH6d5CjW2GfUgoEuOPsx3KbfMuXclBDNY1ZwIyIG
         zNZI1LkYtSN/LEqJKFMc+JYSif4pTFNv44ZnQrAXUBQkay5Nat3a0rb/qyD55jTE+BZW
         rebmHIzc35psSUgJ9tt5mDFIyrIUbsdg1I11yOY9hrPp+f/FleJB7d8cdqaZaMwqwVTz
         3BRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlAhd93U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10-20020a2eb6ca000000b002c6edf0a87fsor38746ljo.4.2023.11.22.10.31.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlAhd93U;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677862; x=1701282662; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7103XOFxT5bJSMqrbJRnaAZtCqt8Oh3G3I/DOAsQEM=;
        b=QlAhd93UA1R7Rn+UG8FmMDtagUB9GaUc4/AbjpzztE0phLsGg+K8usohPQaS6jyCGg
         NKjEDBN1hJGayvkI0BGKmjVrHEahzjRk3lWbjRSY17p/u/E9yYsAbq4+NjvknoUXAhYG
         hXST6WCoh+mhFzvGyTnnrwXefy8XjYiQEnsi31TSxYaZBHnXaH00OYL/hmCf61r/TEM8
         IYCKTYeg4NS/Nf435xddtb5cTYYAQ4SpCJ3y5Xvr51/bmSavVraIFcFoDo/RosQd8RVJ
         JN8namriMxJ33456mWIoS1p8cx2ultCJrtFWFGvBmmnaMC/R9JVwv39WO8vgV0rvzmFE
         cg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677862; x=1701282662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7103XOFxT5bJSMqrbJRnaAZtCqt8Oh3G3I/DOAsQEM=;
        b=Wbjb1cnRwlUN8C1bDKgkYClV8pbgAxPSP5Kbom95WfwuFv4DJ0NwQVfnuqopV/Bt4g
         sdhmuSJE7k+lS2ZjnMq55ukNVHUwt0VUryzzsxGpZ7bO5YZMeG1NxXkrX+unX6b3InrV
         O9P7OMqvOlscUtWGTJ80oQ+l5Zc2lWchBg3BWdpiOzQXY55bZtTRtMUC5SljXy5ClQpb
         Xty03RP/BliRCPXnG7GAa9A+j051Hq8YS0chKK2Zhae0+uuf9+1hO26LkENshmzMUVzk
         poi1kjZBBRcfKvg/kzl/h+tvY6WH4SlKp0i0t1EZMJ0P9ipw52U8Vo5HWNNcvyool+I0
         l8tg==
X-Gm-Message-State: AOJu0YyK6yVpmtI38NuD79GzYqlvIV0SnNRzlbSNb5M4wJqDwDKeTe2Z
	KfehutpStzlyXomVzrTqdHwG9AMe
X-Google-Smtp-Source: AGHT+IHIV10IErfFC07Es1yMjpQsHxoU13Fz1+eiamPARf56zp7ZGthltp+wH8DZLOe8g00EO/RHvQ==
X-Received: by 2002:a05:651c:21a:b0:2c8:7c22:97e2 with SMTP id y26-20020a05651c021a00b002c87c2297e2mr2064877ljn.45.1700677861838;
        Wed, 22 Nov 2023 10:31:01 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id f3-20020a05600c43c300b003fc0505be19sm176312wmn.37.2023.11.22.10.31.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH-for-9.0 02/11] target/arm: Add target_aarch64_available() helper
Date: Wed, 22 Nov 2023 19:30:38 +0100
Message-ID: <20231122183048.17150-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VqPIWtSi+KTf

We want to build HW models once, but don't want to
register types when all prerequisites are satisfied. Add
the target_aarch64_available() to know at runtime whether
TARGET_AARCH64 is built-in.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-qom.h | 2 ++
 target/arm/cpu.c     | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 02b914c876..bf6b3604ed 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -33,4 +33,6 @@ typedef struct AArch64CPUClass AArch64CPUClass;
 DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
                        TYPE_AARCH64_CPU)
 
+bool target_aarch64_available(void);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 25e9d2ae7b..1990c04089 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2548,3 +2548,12 @@ static void arm_cpu_register_types(void)
 }
 
 type_init(arm_cpu_register_types)
+
+bool target_aarch64_available(void)
+{
+#ifdef TARGET_AARCH64
+    return true;
+#else
+    return false;
+#endif
+}
-- 
2.41.0
