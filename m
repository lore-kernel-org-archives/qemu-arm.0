Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317302ejc;
        Tue, 10 Jan 2023 08:45:21 -0800 (PST)
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id bi10-20020a05600c3d8a00b003d344068a37mr49829444wmb.41.1673369121532;
        Tue, 10 Jan 2023 08:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369121; cv=none;
        d=google.com; s=arc-20160816;
        b=mmaUTv69UkFAfzMBoZYr0YGkoQXxbShP27AlZ9yYMnrS18K7wmxJXY05a8zUgXRUw4
         BjSF/X6sUMdmBytDYTv6T4JDb5EIBYALuz1BPLkAaOZ12Zzj+3goIbg6YTOV7xEfjqMR
         ZYJagejYtr0NlRGdt2uDXqqxlPJWxeAtiK1J/i2LYBK5jchMKG76U+wjt67sy9sTYfGy
         Tytj/jWcMBZYc9jIXUqEUWXuSZJi5S7PF3x15KmZDz5XzJxjvOoDfuc6atoUOt0FvRcp
         bTuCrD66Z9wyG2AlIE8KPQbS0VbqkGyYfouFnaQO3FzrrRICAl2ur9pAIPNud/tmnh7a
         r8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VTv4zhjLtgWy27v5YJ49QUS2Dfxk6kg6iG3duW6+mRk=;
        b=SGLJKf/qWCN+4Esm7V70zfst0/IDvTRDx5ZH5U3KeIds5H/2dwxNIqFxhKWmetU483
         2cs/JLEdqM0+iidukw6F3aynvWrn5zhzIa1REraRPKXRuNBSqZ94LZwmMnwocSdIHYbH
         ZIXUvi2Rmq+XfwNL7lIh/yf3jRkCYDnrf5qZnCfGLU2OLapyq5ET3LrjQHjuxHwqDwFY
         OyFovaJ0Il3LPEtqn0jZZHON8xOy1FPB48zrpKBEiX1db83OMzaAFzmRauaDJ196Piop
         APkGCVsiDWz/d+f9JX0kEjm5DoapJ5DuiteDnb71N3LgjZ+NpG2KgK4siVHbQibV+jiD
         D//A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGhuu+hE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 1-20020a05600c230100b003d9f55a6217sor1766214wmo.38.2023.01.10.08.45.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BGhuu+hE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTv4zhjLtgWy27v5YJ49QUS2Dfxk6kg6iG3duW6+mRk=;
        b=BGhuu+hEBOQPQcQJopXaGJ2bQ1E28gAy+cfnk/bn1+9bsgLL1w4woE/NnZyqtgOPMt
         e8oXSmwo9HLLqImD+9TYmshwNS3BIDgPOkY7JxCj+240OiCZh5mHuVXmfZrw3Gyx+otf
         lVa2/8BxEGy8GPNpwl4ZBcioY7CoDUXlvcto45kQYkwE8rhUZXIT4Po39R8gSVb9s8+W
         ICXrOuIRafvMucYc1+qIGJ8cpx1KgalbzUVI5qGCPaIqP5XGk5DoLPYfEg2suJUtX/b3
         9Af4VMQ7DHgmSHZnF4GGx2LJMQiZiT1Je9aXkG/x0KU/KHOPN1kbaWtSeASdkiF27W6z
         z9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTv4zhjLtgWy27v5YJ49QUS2Dfxk6kg6iG3duW6+mRk=;
        b=KzSF9kP2INfKjLUD8l76BuLOCzxST7LEiy2pE1/4P32KAaRss/g8Lt33heoSxvhWBU
         FMNKmqKRePQIAopxz94Brv3PmPR2ZERTtXXF6JLlSd493lWT93qc03GGhBQhBheQri84
         JaczrmUFQ0mqspUOst7tszEH17S79qalzWHWDL8aX1LlSggSgws/XJOpNcV3eaGB07TC
         yrwn+Jf/L6kv74t8UR3vpsnjY9br2BDMKHzcAEYkzC8/mFj7g2GAmx/I0Qk53TjC32iA
         NjopbYcB1JejJ8m2ekGWq7e5eqB77mmMapbcxLcA802qV4fZnRC6WSb49A2YzkPC7nZ9
         Oo0g==
X-Gm-Message-State: AFqh2kqCAzMJTn4Ax7JUeMegvpfjeAgAJ+fHM/8gzq8CqMTec8gL7Gfr
	Luy3sRwpLix3XS8L7ZV9PngxfRfK
X-Google-Smtp-Source: AMrXdXsWprTpfV2IKkFQ19ps3zSVJI0uuaMTl1M3Dt4Pt353mtCuLHNIc2oOqbiMR8N7D4AZKQqXyg==
X-Received: by 2002:a05:600c:3507:b0:3d9:f8a1:710d with SMTP id h7-20020a05600c350700b003d9f8a1710dmr2385004wmq.6.1673369121356;
        Tue, 10 Jan 2023 08:45:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c00d000b003cf4eac8e80sm18621531wmm.23.2023.01.10.08.45.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 13/18] hw/arm/fsl-imx: Correct GPIO/GPT index in QOM tree
Date: Tue, 10 Jan 2023 17:44:01 +0100
Message-Id: <20230110164406.94366-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B5U0p4+aMLHd

GPT and GPIO are numbered from #1.

Fixes: 757282ada8 ("i.MX: Add i.MX7 SOC.")
Fixes: 31cbf933f0 ("i.MX: Add i.MX6UL SOC")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6ul.c | 4 ++--
 hw/arm/fsl-imx7.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index d88d6cc1c5..568317117c 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -72,7 +72,7 @@ static void fsl_imx6ul_init(Object *obj)
      * GPIOs 1 to 5
      */
     for (i = 0; i < FSL_IMX6UL_NUM_GPIOS; i++) {
-        snprintf(name, NAME_SIZE, "gpio%d", i);
+        snprintf(name, NAME_SIZE, "gpio%d", i + 1);
         object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
     }
 
@@ -80,7 +80,7 @@ static void fsl_imx6ul_init(Object *obj)
      * GPT 1, 2
      */
     for (i = 0; i < FSL_IMX6UL_NUM_GPTS; i++) {
-        snprintf(name, NAME_SIZE, "gpt%d", i);
+        snprintf(name, NAME_SIZE, "gpt%d", i + 1);
         object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX6UL_GPT);
     }
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index afc7480799..6115677d43 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -52,7 +52,7 @@ static void fsl_imx7_init(Object *obj)
      * GPIOs 1 to 7
      */
     for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
-        snprintf(name, NAME_SIZE, "gpio%d", i);
+        snprintf(name, NAME_SIZE, "gpio%d", i + 1);
         object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
     }
 
@@ -60,7 +60,7 @@ static void fsl_imx7_init(Object *obj)
      * GPT1, 2, 3, 4
      */
     for (i = 0; i < FSL_IMX7_NUM_GPTS; i++) {
-        snprintf(name, NAME_SIZE, "gpt%d", i);
+        snprintf(name, NAME_SIZE, "gpt%d", i + 1);
         object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX7_GPT);
     }
 
-- 
2.38.1
