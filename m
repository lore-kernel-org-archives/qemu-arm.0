Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739165ejb;
        Thu, 15 Feb 2024 10:04:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDzY4BhUJzPe5Vo+FNtaNC/Udw/nkLYJWF5L3uv0RhC3t7FKtzVZfVeOUXsVgOSKCXFu7CePe9uJGFO8w3UvMp0dBTWAv6
X-Google-Smtp-Source: AGHT+IFwmpYxUqXRyf9ydRkr+H58JsSEb6sm2DrratRnZDeVm3LV5DOFPsLEg2avU4t97UO+kA2q
X-Received: by 2002:a05:6102:3577:b0:46d:2b65:57bd with SMTP id bh23-20020a056102357700b0046d2b6557bdmr2596432vsb.28.1708020240836;
        Thu, 15 Feb 2024 10:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020240; cv=none;
        d=google.com; s=arc-20160816;
        b=czcmMmtS8FLZ2/Teyx3+U7tnTc7yEV3FvLWbsgmvnYvzsASCLdMlc9csezVHuzKYW5
         h7E0hLxCw+Fk1vzDHaz8M1tyuD+S8zrX7skt/EF7mjK05FBCcBc+flu5uXB76jNM0geb
         8W3Nya931wOucWR+Nw1VYWsUh8yXTpgmMu9PZT2Hz8Y1tLsSU4KzutN2+5e246eyqciA
         yNtsSGkaITixK+0QaPf4+ZmjJOPy+ifZNlRWIIZrvXDh+D66W+cz7NC0yM0CUN2q0dDU
         gXC+BtSubybk/qzhHs9HwglsppsD9e1v6d80dvkcp0H3vdW5VvcfaiNIULEeLfsCd10M
         C7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+HBz0BFjRQZpbPfXihx7764F0fJuLimkLS/XesyXUFE=;
        fh=z3ByCeFiHbO8woLX4oK5pbvp6I8EBq3buQoLsdnN698=;
        b=XrXhXgtJff7UeoWOSnQl2OviA3GzTHal7g6X4fg/kxy1A9XRlXWGRARc3zgxF0nUR4
         vycwG8SOSnudCNPQ9cRCqkGFjPUIO+C1T4x+IvolUA1K5WilWluT2a3pnNlJVNlJCiiU
         U2kwV9a9aoeVpHVq9hFAcij3ce+mMTKTQIHMtaMyqSULg04QvhsTyt4f7j52KpzTgY5d
         FM3nfGRWOSx8Y6wyowoAHq7HwfabNf4R6fICpKpkIBNEGp2bmNdPh2azMw+X9Q44DtNB
         tShAVLrres1JD6ZRBRXU20424wPQ/ElhBJ0lbC6UXIU/m8DRS5Q1/u3U+dadTyGAJuRr
         5xjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKiYRlPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if3-20020a0561022c8300b0046d1c5e397bsi407306vsb.320.2024.02.15.10.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKiYRlPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag4V-0007vW-MF; Thu, 15 Feb 2024 13:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4S-0007XD-AC
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:52 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4P-0002wv-4r
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33d066f8239so473329f8f.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020167; x=1708624967; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HBz0BFjRQZpbPfXihx7764F0fJuLimkLS/XesyXUFE=;
 b=mKiYRlPpADzQBmNc45OY9EOpJfg2T+u2OEIE9HllBb6vx6JXBI8LD/8vtXX4KHOzfP
 EJh4APbB8jiDMqhvdQD5xHU/tUFzmpYejE5eFQjAtnl/aWV/WMrNAepDeghAbXZurS2V
 TORvrts5V2gAhxmBsclx1G1Ojl3OzdgfSgX3QomShOqj4HhGmcoZydHK2R6vthNmC5pX
 g1vvXMoBrEwA7eQNxm1BRqV2RQ4hHDQZK/hyKOEPIvS+VUZkg/vEhK1K2eSmzFavVcau
 qZpP5/R5D1hoorKDEPd423Hk/PrCFuvFEphSBgZ7Dk+77nD5YnviJQEy2WErfxiBSpBc
 TeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020167; x=1708624967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HBz0BFjRQZpbPfXihx7764F0fJuLimkLS/XesyXUFE=;
 b=bWxob/XZ0i0HSSPAsayBu8Pcw27YY1jZkzpcX2pezRCMigP1uur81eMwe/suHil5C3
 iDqnhRt1Znl3oyJcAEBBC7XdF1sckyoX9bGsH/1cxoyT8sj+3MNVrgGdjz/tgkTIC87e
 M7wl+FMm51oT+SSguRQw6qXOvo4Yx3mMLuzBynqYTa0fY8XQuU9PcxJfE9pOKyO/xwgM
 bRwS4rOQ7dJkAuD1Uaf+7lI6fg5iE+fGfM+1fKmSMA66pVOwIBc8Ax0QgiCNRi+BmFEA
 OUJnT72VJHbxTTywdkNXja+aaqh1xO9tEj62XVoLnp73YNjwGE8U/Ocs025SG2p/9qBt
 4gtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD7ck5gAhTwbTcd+TeG6oblDOfEPpELkRIZbq1A5d8ZyDvq3dgGs+8hlbTRRV0rogOikDOAVp7AGUx7Ac7j81J+zmD
X-Gm-Message-State: AOJu0YyWWPrz50UFLNja96yYM0T10LHaNc0J8/rpP2p84ezwrvQ5a3Rf
 dgSlzlo+3LnP9XRswufu/Xz8iClj6Bnog8TPRJq6/d5g9oTfkCjIhpvYZzGdEBo=
X-Received: by 2002:a5d:6dad:0:b0:33b:13a8:81b with SMTP id
 u13-20020a5d6dad000000b0033b13a8081bmr2075908wrs.0.1708020167254; 
 Thu, 15 Feb 2024 10:02:47 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d51d0000000b0033cefb84b16sm2440537wrv.52.2024.02.15.10.02.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:02:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 43/56] hw/sparc/leon3: Initialize GPIO before realizing CPU
 devices
Date: Thu, 15 Feb 2024 18:57:37 +0100
Message-ID: <20240215175752.82828-44-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gAiolzZW4Rws

Inline cpu_create() in order to call qdev_init_gpio_in_named()
before the CPU is realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20240215144623.76233-4-philmd@linaro.org>
---
 hw/sparc/leon3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 44fca1487d..4873b59b6c 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -277,7 +277,10 @@ static void leon3_generic_hw_init(MachineState *machine)
 
     for (i = 0; i < machine->smp.cpus; i++) {
         /* Init CPU */
-        cpu = SPARC_CPU(cpu_create(machine->cpu_type));
+        cpu = SPARC_CPU(object_new(machine->cpu_type));
+        qdev_init_gpio_in_named(DEVICE(cpu), leon3_start_cpu, "start_cpu", 1);
+        qdev_init_gpio_in_named(DEVICE(cpu), leon3_set_pil_in, "pil", 1);
+        qdev_realize(DEVICE(cpu), NULL, &error_fatal);
         env = &cpu->env;
 
         cpu_sparc_set_id(env, i);
@@ -311,11 +314,9 @@ static void leon3_generic_hw_init(MachineState *machine)
     for (i = 0; i < machine->smp.cpus; i++) {
         cpu = reset_info->info[i].cpu;
         env = &cpu->env;
-        qdev_init_gpio_in_named(DEVICE(cpu), leon3_start_cpu, "start_cpu", 1);
         qdev_connect_gpio_out_named(irqmpdev, "grlib-start-cpu", i,
                                     qdev_get_gpio_in_named(DEVICE(cpu),
                                                            "start_cpu", 0));
-        qdev_init_gpio_in_named(DEVICE(cpu), leon3_set_pil_in, "pil", 1);
         qdev_connect_gpio_out_named(irqmpdev, "grlib-irq", i,
                                     qdev_get_gpio_in_named(DEVICE(cpu),
                                                            "pil", 0));
-- 
2.41.0

