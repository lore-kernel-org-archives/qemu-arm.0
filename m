Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6560976njk;
        Fri, 27 Dec 2024 12:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW92FsR9K98vMrXp1wA8VG3L7v8brY/s9Y5ODixw1DW/FK4tVbwM3P7OdueLc0x6CLbJttPbX6WhcmkOg==@linaro.org
X-Google-Smtp-Source: AGHT+IFBCc8BYAsCtScAiQZEB+0q2iNPYeuAll2gdf4GPjcGPq7SrmLZJXDvTvwETDuJCwNxhPcz
X-Received: by 2002:a05:620a:470a:b0:7b6:ece3:825d with SMTP id af79cd13be357-7b9ba716a6emr4759950085a.12.1735331111769;
        Fri, 27 Dec 2024 12:25:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735331111; cv=none;
        d=google.com; s=arc-20240605;
        b=cm+rmCX5TJ+Pr5pUxpsQN6D4UcTV11seXR0Q3iqh4Rt6722pjvHe+ti4DJpfaejmzF
         Fi1xvFVQHOHJfUVgQrxPrZLOVhWZuTFLs5LaKRtRiGL8iDnfYqTWJvW0ccA9/5UEWizX
         XHXWwZEEOu1ZvWjCmy8L/OgtMKYBaWivGTFwwyomLfr0f8DTi0KdvxqWfViA8o7eV2+w
         cBsqMHZkcpAB1GxvoavUTP6QheLmnYCWHkEWxEe2yZ+EfydfwhmJlDFbigoY6RTgg1yX
         UOYItP+TEVqA5quY408meC0w03G3alVZ/4Gj3BQGyxXlZqnYVx22iZPP7OsiimiQG5Cv
         3vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xe+vcyPZJWzPRyHwRPCh0MVBHckAA2MYIwBQH2GfQr0=;
        fh=wU7ubns6AwGScgw6zwJsQeh9xmzYD7A4gau6gmG2Kmc=;
        b=LFHWDRQY+oML5rwWftbNhISdjAbcU8QmeN6FkyuFvqOGFXCiZB3fFazlmT6zdb5AP5
         VovWLoRK1HCadzmISS+yNfZ5f75V+4YZq5UXvqDUxBYTQlUUMlcp+FNAdqZm79dmhm0N
         mzaIj9xd9V1RLUgLyOFaV3Abx1BKCajbMUF3gFG5/XTygQj5BadzELRGgtzfkFEaTjpq
         F5KHFXUkBAxeob7uoVxBQwBZr38FwTZ2X/L0EMHeIn4GjEBVls5gM6MWKLgH4zkx5W0c
         5vzmRToG/yyfmQ/gcaRQuwpDZ3orcHg7QMdjkIO9IC/86VSxREcJbPpKX1Hbw6N+m0Lt
         y+Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEsaKvVV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4ccb99si2237899685a.367.2024.12.27.12.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 12:25:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEsaKvVV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tRGt6-0004Fy-B1; Fri, 27 Dec 2024 15:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRGt4-0004FV-L6
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:24:46 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRGt2-0004zt-QD
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:24:46 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862d161947so3522564f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Dec 2024 12:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735331082; x=1735935882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xe+vcyPZJWzPRyHwRPCh0MVBHckAA2MYIwBQH2GfQr0=;
 b=bEsaKvVVe5X8+bFImiTQ5fJ176p49Mn8ZOjBz0MUb8IHhAStE+qse74pde9gJnBV8b
 qHpLxPImek/wzwJ2y7E0rONjpzgZUqUd3YjB5TySGskX8ishBHFXGaW9TAV5eK1om1IZ
 H0cjlEzh1cfttaKJ1aoNPuoB6kWiihr2t0Pky07UHhWjPbqjvg2HVZU7rZh5oJjQdgFG
 K/yOcjOe/HdzBtm5l945L9Tmo82YDRsvdkfPCGm+9dYGD85bpwCuxbU9esoaGMsplK8z
 vFWn3JnakBh1Lm0+kZ4GmKf/8Hm1XV00yzSTb6BlS+FSjcmLOKojDmyh8ZkCZMn2BYao
 UMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735331082; x=1735935882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xe+vcyPZJWzPRyHwRPCh0MVBHckAA2MYIwBQH2GfQr0=;
 b=PF/x/HmUIq4uEjjqmjytwK/bmel+uUu4QQqNGLU7DuHoj+VqUegLeg1B1t2ccOJX3l
 VEcS0F9QwOq8/bfMXehfhBfUSp5q2E/MrN0pVFBPp5dR1IJjFnIMBMcAFB5CwZQoyjVv
 FOzt0nkmdzwdkRJtM0liYOGYT3jEXSEr0/oAd6FCe8tIt/UuX7mgh1P1mXesLwvc2/Pr
 5xc4XmwL7RluAJ6l6tUSeBSG2QY24FlAlRUVHj9grfg1cJCKA7hUu/e9FzlU5SghVfeR
 oCJZR1X7BwLFn/aubqeCgSSu+58xmYFw41xbpft1nz6Jw0Mz/+HC5LoFdkstoanPAqmG
 giaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcC2E5BjZT1/CuUVW5vjRWRxRFTz+j+JXluAi0aJ6yHFyQgL3jnqlIqny4EQM8V44y39RZEr93wA==@nongnu.org
X-Gm-Message-State: AOJu0YzCCqZlgX3bXLDqLow5ar6RQBHdzqEzwVJzQs3Pw/xciOOMElvN
 ckzEih+WrRkEzi6hYBqEsv6tj44RcK8Okb9Uwutd06X197BNCEWIj0m+H+45UJ8=
X-Gm-Gg: ASbGncvyXr2cgqe2P/nUB8swhUfRS4QjdkY2FLwAe1oexFXsJVYA1sMQwjP9U2RHYsu
 j9Lj0QOqqtQ/orqXqCyl4p/UY1uN7ywe0UvzufipNLOrpf7l4MLOmCMME4Ak2cCllFi4Rhn+BEk
 Lu33BLD8zdg/O22wVY8UgfORfOVZFGoxMjCbFdjen0Mq1oil1/LgguVzR6JmNcG53Pu47ebaDph
 q+W7F+VC7kE1uXIw7UMkx65db/ByS5yn37UPht4pS1TyBlKz8nuxLorXVnPCgrr7Va8tvuJQ4ry
 NLVLKr/qSKWINBiSK6hqu7TB1m5+2HQ=
X-Received: by 2002:a5d:588b:0:b0:385:f573:1f78 with SMTP id
 ffacd0b85a97d-38a221f2042mr24720949f8f.24.1735331082158; 
 Fri, 27 Dec 2024 12:24:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm22713871f8f.105.2024.12.27.12.24.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Dec 2024 12:24:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/intc: Remove TCG dependency on ARM_GICV3
Date: Fri, 27 Dec 2024 21:24:34 +0100
Message-ID: <20241227202435.48055-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227202435.48055-1-philmd@linaro.org>
References: <20241227202435.48055-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: zgz9CGUdMG88

The TYPE_ARM_GICV3 model doesn't have any particular
dependency on TCG, remove it. Rename the Kconfig selector
ARM_GICV3_TCG -> ARM_GICV3.

Fixes: a8a5546798c ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/Kconfig     | 6 +++---
 hw/intc/meson.build | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index dd405bdb5d2..7547528f2c2 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -23,13 +23,13 @@ config APIC
 
 config ARM_GIC
     bool
-    select ARM_GICV3_TCG if TCG
+    select ARM_GICV3 if TCG
     select ARM_GIC_KVM if KVM
     select MSI_NONBROKEN
 
-config ARM_GICV3_TCG
+config ARM_GICV3
     bool
-    depends on ARM_GIC && TCG
+    depends on ARM_GIC
 
 config ARM_GIC_KVM
     bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 510fdfb6886..602da304b02 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -6,7 +6,7 @@ system_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gicv3_common.c',
   'arm_gicv3_its_common.c',
 ))
-system_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
+system_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files(
   'arm_gicv3.c',
   'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
@@ -39,7 +39,7 @@ endif
 
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
+specific_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-- 
2.47.1

