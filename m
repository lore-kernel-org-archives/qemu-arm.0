Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp255080njm;
        Tue, 29 Apr 2025 06:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfiSP7+uAbRELyQjILTIAOrOZ3/4jiWAXHXl7d4q723c0Iwk6vidLgeYKWT357MtE8jTQRoJhlyq3BCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGAl4UNGctMl5Tr6DIatmI8lMcp1Ev0S1qWD5NlQfx0CHxoRlNs6Ktpkc+aP7IFQrrkNfzt
X-Received: by 2002:a05:6214:240e:b0:6e4:4331:aae0 with SMTP id 6a1803df08f44-6f4f26d6f11mr38295216d6.1.1745933103833;
        Tue, 29 Apr 2025 06:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745933103; cv=none;
        d=google.com; s=arc-20240605;
        b=HjcDnan5z+BOk6hi83FKV4ZJonyWYfQ6yUczBBefsJbi+uFTF0Ss6OJCXfFOFCNPRM
         5zkgFTFoIfpzkzd0ItBWGb1hjjAYFjy3BO6yCS+0Agp3XUCFJqqjNe0wACtC/JG/AgkR
         dx0OZeh8dex4KCFckTWWJRVcorY06MFDAuSus+It9iU219watjT0+NDSTVIJhd2MEf7+
         ihUzx9l1WXyet7B8YuWO0scQdiKL5N2vgXt4PgFVLhOGjN/y9KAfViQBr1LRFsUEz8hS
         U2Pjq97UNmgSVcBiymiFV/zk+XJ/L5zOy4nOZKKmKHE3bCOJCjJ7OV13qxwYXE09qwAs
         d8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jry+P8FNPxXBYqdgMf1f9uotm9bgcJ4IEZiGTKV/sRU=;
        fh=IUJDqsqe7thKzGjg2tEzLm8ihsFAVxwlDscjrnqubNw=;
        b=EGfbRvjc8iwcuVADFYZ39j3eE/0XO8NDYzwDSWrVj1ACHeK+00nPgNQg32TbbZbSd6
         /OAMW+bmRNq+NCd6vyNKkdxz/aQq5fl8i8uObds/SDgOc/YFbcKeOZyLG6wwAduZmq77
         3ULE+RYluhOZ0nwz+FtpGFWY0gq+FGJAJbf6pjxDHEHB7uxDKJMGjF4WqLXAsi0QUOie
         QoE3euWA36swE27f1Pwa5YsGh8Y48VHS/fDxOK5oQ0JoZBF2kpAw6+c4HC7pXf1f25RS
         cIu9zx55VJwLLPmdVC5Pr2DT549vt4RD/jtINA/dUyoJ5UmR8XIGCvBp9/Wezo6xDJnf
         Id8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLcnheuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea0a17si1189442385a.365.2025.04.29.06.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 06:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLcnheuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9kvY-0005Hz-Id; Tue, 29 Apr 2025 09:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kuj-00056n-HD
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kud-0005cL-D5
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so6465870f8f.1
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745932923; x=1746537723; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jry+P8FNPxXBYqdgMf1f9uotm9bgcJ4IEZiGTKV/sRU=;
 b=RLcnheujz04RgOhqFjcdyGlDuzeEwbpWPG4Xp34V3L7LsIbhdcaOD/l4jZrkFdcdV+
 4NCkQ/MkTSYMVQc24C8yu9vAf6baHvYAO+L/gIXQjZkbz/Xg2G2As2UqIl4/mb71GeX1
 ya+boXEkfJBGxk7Fr/6hEEFTdirEbHwpyCu4jmDA5Du7cS7pOSpYVczglqg0pr4a2MM/
 +kMr7B9AYVN6OO7TCp5lGDKaH+K6GB47/3nWsvh+JHEVFcbYk1zU2i+UEJoe89WAO1ew
 Dv9KnjewRvvsHH9kIo/owAexCVrbetHHDT4C+UVdbfYffCYdiy9ZMQIlwbBf2eStMULQ
 +SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932923; x=1746537723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jry+P8FNPxXBYqdgMf1f9uotm9bgcJ4IEZiGTKV/sRU=;
 b=kmPhUnYI+JdobUBCQar0RrPXyl3JBZK4HhIh75cH+/mLHqkYPa5vT4XyYDFDWidPev
 8FDBc1YQCL8NCtno0DrXQeADqrc0dwSVT7JuxyaNbE4MqxaMcAArCxS95Jzw30DCi2Zk
 kb22owDZknoes4X9LnQAoJwSKy8J4tTJgQpuad67mPPLGGJwGWWAfoWhNVZ3Iyp5McuP
 TV95z1jdmb9mN3A1tQ2dz7oXIBLv+Cnk5jfVmBgeW/H3ctMyXap1nZ1/Az/W2C3Rk0p6
 0EdCLL9x9tAyy13/AkvP34U5ZuLtUV3oEG74VZsPgSspHFCm8LSR2yXpcMZi+W47zhBJ
 /SsA==
X-Gm-Message-State: AOJu0YzC5yyvrcp/rGJvEHAWFY8YHdJhVJ/dhDcoREbYrDDYajsiHH1n
 OaaxZJYluSvQO20n/Fb0Kbyd9I+SkvkKuudf3QZ4kSX63ZZrs5iHdr1Mtdf1dA6KksyQp8d0Z/J
 k
X-Gm-Gg: ASbGnctJtzijmsa9EezzV2fFB7E7eciURXV9C/K5DBDhWsvWUYDSmiaG+hfZDnj2Z8I
 JIHkapnmVFpAz8hUzLYOJBbFe2VJyOOXGZ52pOK689h6kP+yubsEAj/Rs5GqCG2DRQ0h/ij9XGm
 BVhzeJ53Mtbji89h0UaUKOZr8h7WIx0htyXsiiVc0gOfdR1Lk7zDLW/5UhMPJzI+CY/urJE3n0H
 JtLZgiQtLt3y7kZWiMHVIP+aK5115XAi/DZdFH7ukCv1wr34eh+174xCA0GrVwzzAFGfy1RuKvk
 yp/mIyzuSjN6tk7RdEnvDd47ShzT5EsnfxsYMuKVCZEPqyU=
X-Received: by 2002:a5d:4ec2:0:b0:3a0:83b5:f4c1 with SMTP id
 ffacd0b85a97d-3a0891b2dc7mr2372329f8f.24.1745932923467; 
 Tue, 29 Apr 2025 06:22:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5219sm13729371f8f.27.2025.04.29.06.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:22:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 1/7] target/microblaze: Use 'obj' in DEVICE() casts in
 mb_cpu_initfn()
Date: Tue, 29 Apr 2025 14:21:54 +0100
Message-ID: <20250429132200.605611-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429132200.605611-1-peter.maydell@linaro.org>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: GoVLLT8F35W3

We're about to make a change that removes the only other use
of the 'cpu' local variable in mb_cpu_initfn(); since the
DEVICE() casts work fine with the Object*, use that instead,
so that we can remove the local variable when we make the
following change.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/microblaze/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 00a2730de4d..d92a43191bd 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -333,11 +333,11 @@ static void mb_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     /* Inbound IRQ and FIR lines */
-    qdev_init_gpio_in(DEVICE(cpu), microblaze_cpu_set_irq, 2);
-    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dp, "ns_axi_dp", 1);
-    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ip, "ns_axi_ip", 1);
-    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_dc, "ns_axi_dc", 1);
-    qdev_init_gpio_in_named(DEVICE(cpu), mb_cpu_ns_axi_ic, "ns_axi_ic", 1);
+    qdev_init_gpio_in(DEVICE(obj), microblaze_cpu_set_irq, 2);
+    qdev_init_gpio_in_named(DEVICE(obj), mb_cpu_ns_axi_dp, "ns_axi_dp", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), mb_cpu_ns_axi_ip, "ns_axi_ip", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), mb_cpu_ns_axi_dc, "ns_axi_dc", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), mb_cpu_ns_axi_ic, "ns_axi_ic", 1);
 #endif
 
     /* Restricted 'endianness' property is equivalent of 'little-endian' */
-- 
2.43.0

