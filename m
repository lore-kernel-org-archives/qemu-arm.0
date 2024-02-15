Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp736690ejb;
        Thu, 15 Feb 2024 10:01:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3PkW3opAHGd/CpOYWVjPRywfVmcoM84VSu9Rds5Ri1qCXaAV4YKWEum9eAvPD6YVHQoi2cKcvCaQ6R0uDazv6P1CES12u
X-Google-Smtp-Source: AGHT+IEUfRZLLSqx+OU+vkM/Cja6f6XRkpjVUS+e/Q9tAXcVzrjWvhHzXDuYk/OYWh2/bc88p6PD
X-Received: by 2002:a9d:7c82:0:b0:6e2:eb7f:1c3 with SMTP id q2-20020a9d7c82000000b006e2eb7f01c3mr2466660otn.16.1708020081725;
        Thu, 15 Feb 2024 10:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020081; cv=none;
        d=google.com; s=arc-20160816;
        b=zjlft0B5rVycJ1cf9rAv2GdN9KkHLGh8Z4uNOzVRqYPZpBEQHuERg97Anf5ejjbRID
         RIlnFhY5br7p4Bfiyrym0e/A+3/GzWP9s6Yf5Mbg4wAC+IOFbXjMq3ahRFaZv86FrGXL
         G43Ch5zwV5qP79x9a2n3ZryP6AZjrzEbJ+76VkyWWHGh0fSxdx8u/CgcVrQUbzP//+BN
         5jsQGLyzePGAHY5WqLT+M7ik70nMBmHYk40T2WkzmPzBVq+U9uRNeTeUuO3sTBPL92wR
         xvHPazqpfOx6JnWAsnJnQKGrClaZBqnBkY0j3muJPtShOc13bL8PlHUq7SQpu0H42rPw
         y4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g8Q7JMG8zjBMQCOseTC/pxZZVdCkiwcgzQoWO2YHIuA=;
        fh=lFbaFE9CCURXS2ZRFy5xEQEZPoERQGZgvMk0cqzTFRw=;
        b=Xmizers9ZkAQuHgFTjQKQsqSDi3MjqZvlH2rKpC/Zg4eEVkMNKxvHVHH43FTzPs+hi
         EkT/LINP1+pmlONge34gNpQtzmPXE6vyfeu7rx0rvb762K+MfLvm8LwyjV4hoEJY6RWK
         XKKwH8nEHzZRgbkV339+CHkX+U7JX0WwERyrGZuMYBjV25rPO7ncAh4kMU3mPad8Y6vR
         msKcE4behWYnKH67SC1Aaj202T+2bkzI55eOdiNPMo4k4bMeGEkvQaEmrY7AeYIS0qXk
         4bgBRwtV8sk/DqTOkHjhMHxyvJgPgewFbzCM3gU5YfMnaiYfd46T5mArVtoivL65xl5e
         +haQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iLO5hOgo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24-20020a67cd18000000b0046b1e00f417si319534vsl.613.2024.02.15.10.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iLO5hOgo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag0V-0002Nx-VR; Thu, 15 Feb 2024 12:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0T-0002Gh-IW
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 12:58:45 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0R-0001aU-GZ
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 12:58:45 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d1094b549cso16234121fa.3
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019921; x=1708624721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8Q7JMG8zjBMQCOseTC/pxZZVdCkiwcgzQoWO2YHIuA=;
 b=iLO5hOgoUCOpbTwFk1j/T5TF48CUbqBz1hEGjSNTN1CAQi0WbqRsOiL98u+4nZq2EA
 EpFeZH7ZJ1tnI7wgk4J/DmPGI5bHzd/yWJQLZc/ED6MYuaMK6tHg2stVZDumIYF4Lpb0
 zZfdXm2oadS6mEBHuQyjuAAOKaOI0e6ijcCyYvPfi7auhRHfndxwiBt41ZqVB5sXODGP
 Yrw0iT3qH7PY3Ufy4Lqv5407Dl4wgAc4ed9UxUjm0dH5PWuiumB0Kkci7W9vth9SvbpC
 syNZVEcaJfLvehkZdsqUxC7SLG+JmOhwPD45m6VoGlEBhe7fXMXJN7hIu+og8gglDWKK
 ChRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019921; x=1708624721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8Q7JMG8zjBMQCOseTC/pxZZVdCkiwcgzQoWO2YHIuA=;
 b=PbZSFFFe95FgbQfRhU+YMeiUG4JXWxsTLboUApjgMJ2dWujHlB+Z5wws5YmwizNvzk
 XKiXri+rMr6ovpbH1OOhRKn1j5EahV4NjpdVG8hvuK9jYIWwK8QqcihscCrbOIWWX2dc
 91xvpqHpjRDTHbo/Y2jyTfuWrCyo6XZdXAyaih6akhxJcMlPKQZKdJ5SXEzJV2Fn5Rvy
 1zIOPKXGxBcCjo3fYUpZUXb1ir/J8mekSwIIUzZKROb5Z7YFs7LlGHl5mKo9VMWk3Mrl
 lAjqhmewVyhxhzKFBeUa8JNYyQtmv6900zWxKThYMUVl5b8v05N5XguMb+NWfyPRXJtU
 laBQ==
X-Gm-Message-State: AOJu0YyF56RdiFm6aJsPj+qI1K9Bct6u8R7+fg0mDHBgSB0kCB0mr73W
 o79hISJX92KKqwoD1uwPY2wGgwITcrgOioO3TRPSYpuy1KnC6hHRrcqh5JFzKEGlC8ovbo6g9uS
 o2UY=
X-Received: by 2002:a2e:9dc5:0:b0:2d1:788:60ff with SMTP id
 x5-20020a2e9dc5000000b002d1078860ffmr1968176ljj.16.1708019921454; 
 Thu, 15 Feb 2024 09:58:41 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b00410bca333b7sm5913132wmq.27.2024.02.15.09.58.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:58:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 07/56] target/mips: Remove CPUMIPSState::saarp field
Date: Thu, 15 Feb 2024 18:57:01 +0100
Message-ID: <20240215175752.82828-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: LibdoKmmHKFz

This field is never set, so remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-5-philmd@linaro.org>
---
 target/mips/cpu.h  | 1 -
 hw/misc/mips_itu.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index d54e9a4a1c..ef1d9f279c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1174,7 +1174,6 @@ typedef struct CPUArchState {
     uint32_t CP0_Status_rw_bitmask; /* Read/write bits in CP0_Status */
     uint32_t CP0_TCStatus_rw_bitmask; /* Read/write bits in CP0_TCStatus */
     uint64_t insn_flags; /* Supported instruction set */
-    int saarp;
 
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index db1220f8e0..d259a88d22 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -516,7 +516,6 @@ static void mips_itu_init(Object *obj)
 static void mips_itu_realize(DeviceState *dev, Error **errp)
 {
     MIPSITUState *s = MIPS_ITU(dev);
-    CPUMIPSState *env;
 
     if (s->num_fifo > ITC_FIFO_NUM_MAX) {
         error_setg(errp, "Exceed maximum number of FIFO cells: %d",
@@ -533,11 +532,6 @@ static void mips_itu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    env = &MIPS_CPU(s->cpu0)->env;
-    if (env->saarp) {
-        s->saar = env->CP0_SAAR;
-    }
-
     s->cell = g_new(ITCStorageCell, get_num_cells(s));
 }
 
-- 
2.41.0

