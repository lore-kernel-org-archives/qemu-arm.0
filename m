Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp86381ejo;
        Thu, 4 Jan 2024 05:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjAPZg7GhJC7pp8PIK4PzpoaGLx3cooiMhIp/9jb40GXpcEQ812rUMm7sFaweHrXn55oRq
X-Received: by 2002:a05:6214:246e:b0:67a:bce4:e2e3 with SMTP id im14-20020a056214246e00b0067abce4e2e3mr689863qvb.5.1704375452636;
        Thu, 04 Jan 2024 05:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704375452; cv=none;
        d=google.com; s=arc-20160816;
        b=FCV4uMqhG1ebTWDsk/rhHQE9FPBtZBQ6OyVezcBTyroXfYl/cWUlgOGsB/VNlEKpvf
         Fa60ic++o+vst4PRb//vNzVD0bWyvZbo53dMpda+rgcgfXNLnThUaOJOCHOtvRsZH/Ci
         pVAn7Fd30CIzilM86noFLLAdkVgDqn02CdnDlso6lHZkrCxFJksfWJN2AYUlKtH9J4mI
         GTuZTFXd8lzClPzaHsL9PmwoZ84AID2GBa5X7eNFo8O0PREhRMKBTDxzSKAcdXxYa1mB
         TpG8ZinOp0z1Hxbd7dsYwglWjAvvrcoOy5eDiir2pfSi+0Z6kqVA/9ligfNzyRmzScUN
         6fZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=f+GEATtftaLC4WRJy+IobLm2QXvjmUhmkXYdWfYQTzc=;
        fh=Y98vLtoQ1R6DuMvmlkazmynPky9qI3IEmfm0XWQMsbI=;
        b=FyYOvXyLCflHmiasA/+61YDlNYE3XrNvzbbKW55WYm24uiw6e1xo/yqeDGkifHQUhW
         oVRv/1LtWtEOQH/AYt7twm/BdUi7wa/c/qoqN4fBlIKGLaOMuxPQMgrTa6eZR2UHyyvS
         Iv5JydNHnJgOoej8dqgDk0Zb4503K8H3sNbRXTs2VXsUU6Aq2EgAqSrNA3vhLzJKrhUY
         2rv6SYHfeWo2mrKFAa+1ZpuquRFoUL8Z3kHX4PFAz2Iy6S80fKyCu9K7sKDiBq6AVHIK
         FV05OlK6VbFtZ4jbJYRKFp1zNLBBtAigrH99jvvs2o1ITX4YYYdQ1sugl+hdmzh07mXU
         JNbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pF29Func;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a37ef0e000000b00781b2d54711si10441022qkk.452.2024.01.04.05.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:37:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pF29Func;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNuU-0006B0-Gk; Thu, 04 Jan 2024 08:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNuS-000698-Fg
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:37:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNuP-0006Bz-5Q
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:37:20 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d89105365so4402835e9.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704375435; x=1704980235; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+GEATtftaLC4WRJy+IobLm2QXvjmUhmkXYdWfYQTzc=;
 b=pF29FuncikzI/iJh0FEQizx6HmXvPSzLGOx8zCI/4CHem6LfpyCzC1Bx2yxHr5yX1P
 K+QFIK8CGjUP/T72yc+s4+sdLMeo8T8wCrUWxyeihWOWwgk55CybhCqOHht95/DxSQyQ
 zfjVX7jVVbez9fjJC8thyCA0z4tKwYW9Q/eZib+ZPl+9jyACQiMOWKfIKfruC0iPaDne
 yvRLNEi/F7ieUWofD6rs9OSfMEf9Vf1LVZFOUlBBs2uYmrhfiHQXcnZOFd1u5PIWxaLb
 P0oixMc2ffhycH5xbYPf5FaPcSiDiVqmH/P2DNEQZlM0pW1BMbgsmJTAEuHLVCUVjihS
 AYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704375435; x=1704980235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f+GEATtftaLC4WRJy+IobLm2QXvjmUhmkXYdWfYQTzc=;
 b=ILFKvNcCZoxqtAwQLTC6SUdR52Ox9YrYBrC5sedCa+cerRHBOcVXJO5VScaQxVEb/x
 CnkrzVGrwr1PJ5dMAoJ5TnRJT54j4rZgUaPNpHV4BasF92hTs6WzlD2zUM1rvb9bYwzp
 hZn9mH0fkEh/WBY4BmLWRWwOL5GE5K67VKIG7WpJeH3oTIUduQgQLqSgunXTGoPES+sJ
 MHQldJeaUmN+n2fs99XTDh7ry16pdIFzImnZyGuptWHpe2aO201BBHM3L04mR5C7+Y8J
 2xjCffnkezLxFfWrDBc8r+/O3T6jFU7x2sNkk6zL5+iB/KzvK4pHC4rPJn7WIxPnTYqW
 TU4w==
X-Gm-Message-State: AOJu0Yzom+UI1QeVOkaXKlSRV9STO1tFlRhsmc0FScqvotvWpdW0kXPK
 kosYLZaPx4B4gLmHyhV0I6KiL+2Ps+1neA==
X-Received: by 2002:a05:600c:84ce:b0:40c:2b01:e09e with SMTP id
 er14-20020a05600c84ce00b0040c2b01e09emr315806wmb.47.1704375435040; 
 Thu, 04 Jan 2024 05:37:15 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b0040d5c58c41dsm5733869wmb.24.2024.01.04.05.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:37:14 -0800 (PST)
Message-ID: <f69286a2-cedf-428a-9c9f-a4b94d787507@linaro.org>
Date: Thu, 4 Jan 2024 14:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] tests/qtest: Add STM32L4x5 SYSCFG QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20231229164915.133199-1-ines.varhol@telecom-paris.fr>
 <20231229164915.133199-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231229164915.133199-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: BY59hph6bEQ5

On 29/12/23 17:47, Inès Varhol wrote:
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/meson.build             |   3 +-
>   tests/qtest/stm32l4x5_syscfg-test.c | 408 ++++++++++++++++++++++++++++
>   2 files changed, 410 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/stm32l4x5_syscfg-test.c

Helper suggestion to ease readability:

static void syscfg_set_irq(int num, int level)
{
    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg",
                     NULL, num, level);
}

When the SoC is parented to the machine, this patch needs:

-- >8 --
diff --git a/tests/qtest/stm32l4x5_syscfg-test.c 
b/tests/qtest/stm32l4x5_syscfg-test.c
index 3edd13b222..272ba91055 100644
--- a/tests/qtest/stm32l4x5_syscfg-test.c
+++ b/tests/qtest/stm32l4x5_syscfg-test.c
@@ -240,3 +240,3 @@ static void test_interrupt(void)
       */
-    qtest_irq_intercept_in(global_qtest, 
"/machine/unattached/device[0]/exti");
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");
      /* Enable interrupt on rising edge of GPIO PA[0] */
@@ -245,4 +245,3 @@ static void test_interrupt(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 1);

@@ -254,4 +253,3 @@ static void test_interrupt(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 15, 1);

@@ -264,4 +262,3 @@ static void test_interrupt(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 17, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 17, 1);

@@ -271,8 +268,5 @@ static void test_interrupt(void)
      syscfg_writel(SYSCFG_EXTICR1, 0x00000000);
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 0);
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 17, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 15, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 17, 0);
  }
@@ -285,3 +279,3 @@ static void test_irq_pin_multiplexer(void)

-    qtest_irq_intercept_in(global_qtest, 
"/machine/unattached/device[0]/exti");
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");

@@ -291,4 +285,3 @@ static void test_irq_pin_multiplexer(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 1);

@@ -299,4 +292,3 @@ static void test_irq_pin_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 0);

@@ -306,4 +298,3 @@ static void test_irq_pin_multiplexer(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 15, 1);

@@ -314,4 +305,3 @@ static void test_irq_pin_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 15, 0);
  }
@@ -324,3 +314,3 @@ static void test_irq_gpio_multiplexer(void)

-    qtest_irq_intercept_in(global_qtest, 
"/machine/unattached/device[0]/exti");
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");

@@ -331,4 +321,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Check that setting rising pin GPIOA[0] generates an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 1);

@@ -337,8 +326,6 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 0);

      /* Check that setting rising pin GPIOB[0] doesn't generate an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 16, 1);

@@ -347,4 +334,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 16, 0);

@@ -356,4 +342,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Check that setting rising pin GPIOA[0] doesn't generate an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 1);

@@ -362,8 +347,6 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 0, 0);

      /* Check that setting rising pin GPIOB[0] generates an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 1);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 16, 1);

@@ -372,4 +355,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 0);
+    qtest_set_irq_in(global_qtest, "/machine/soc/syscfg", NULL, 16, 0);
      syscfg_writel(SYSCFG_EXTICR1, 0x00000000);
---

With the helper included (since I tested it):

-- >8 --
diff --git a/tests/qtest/stm32l4x5_syscfg-test.c 
b/tests/qtest/stm32l4x5_syscfg-test.c
index 3edd13b222..19a5f83ebe 100644
--- a/tests/qtest/stm32l4x5_syscfg-test.c
+++ b/tests/qtest/stm32l4x5_syscfg-test.c
@@ -47,2 +47,8 @@ static void exti_writel(unsigned int offset, uint32_t 
value)

+static void syscfg_set_irq(int num, int level)
+{
+   qtest_set_irq_in(global_qtest, "/machine/soc/syscfg",
+                    NULL, num, level);
+}
+
  static void system_reset(void)
@@ -240,3 +246,3 @@ static void test_interrupt(void)
       */
-    qtest_irq_intercept_in(global_qtest, 
"/machine/unattached/device[0]/exti");
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");
      /* Enable interrupt on rising edge of GPIO PA[0] */
@@ -245,4 +251,3 @@ static void test_interrupt(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    syscfg_set_irq(0, 1);

@@ -254,4 +259,3 @@ static void test_interrupt(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 1);
+    syscfg_set_irq(15, 1);

@@ -264,4 +268,3 @@ static void test_interrupt(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 17, 1);
+    syscfg_set_irq(17, 1);

@@ -271,8 +274,5 @@ static void test_interrupt(void)
      syscfg_writel(SYSCFG_EXTICR1, 0x00000000);
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 0);
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 17, 0);
+    syscfg_set_irq(0, 0);
+    syscfg_set_irq(15, 0);
+    syscfg_set_irq(17, 0);
  }
@@ -285,3 +285,3 @@ static void test_irq_pin_multiplexer(void)

-    qtest_irq_intercept_in(global_qtest, 
"/machine/unattached/device[0]/exti");
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");

@@ -291,4 +291,3 @@ static void test_irq_pin_multiplexer(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    syscfg_set_irq(0, 1);

@@ -299,4 +298,3 @@ static void test_irq_pin_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
+    syscfg_set_irq(0, 0);

@@ -306,4 +304,3 @@ static void test_irq_pin_multiplexer(void)

-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 1);
+    syscfg_set_irq(15, 1);

@@ -314,4 +311,3 @@ static void test_irq_pin_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 15, 0);
+    syscfg_set_irq(15, 0);
  }
@@ -324,3 +320,3 @@ static void test_irq_gpio_multiplexer(void)

-    qtest_irq_intercept_in(global_qtest, 
"/machine/unattached/device[0]/exti");
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/exti");

@@ -331,4 +327,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Check that setting rising pin GPIOA[0] generates an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    syscfg_set_irq(0, 1);

@@ -337,8 +332,6 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
+    syscfg_set_irq(0, 0);

      /* Check that setting rising pin GPIOB[0] doesn't generate an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 1);
+    syscfg_set_irq(16, 1);

@@ -347,4 +340,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 0);
+    syscfg_set_irq(16, 0);

@@ -356,4 +348,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Check that setting rising pin GPIOA[0] doesn't generate an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 1);
+    syscfg_set_irq(0, 1);

@@ -362,8 +353,6 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 0, 0);
+    syscfg_set_irq(0, 0);

      /* Check that setting rising pin GPIOB[0] generates an irq */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 1);
+    syscfg_set_irq(16, 1);

@@ -372,4 +361,3 @@ static void test_irq_gpio_multiplexer(void)
      /* Clean the test */
-    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/syscfg",
-                     NULL, 16, 0);
+    syscfg_set_irq(16, 0);
      syscfg_writel(SYSCFG_EXTICR1, 0x00000000);
---

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Regards,

Phil.
