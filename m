Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360271ejb;
        Fri, 20 Oct 2023 09:37:22 -0700 (PDT)
X-Received: by 2002:a05:6402:5245:b0:53e:81f6:8060 with SMTP id t5-20020a056402524500b0053e81f68060mr2002360edd.14.1697819841837;
        Fri, 20 Oct 2023 09:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819841; cv=none;
        d=google.com; s=arc-20160816;
        b=ffa6SElVOWO4c2FmJvsenMDS3gTfrxnDAkQr3YptlP8T0vp2UXEmFWrVxeDvQvhbLz
         DbJJCQ6Iz4ClxTR0CEpSunu99oXrLzyiHC2ugxfCP8fJAo7cNmVEpWYUeAEHd9Au4owv
         EM33VhHBXNT1kAl74nGBAUka6fj1tlCoANwCpxMHmAZCxykjmvndyRvDrDdjU0tzFEgu
         tQ76YnhxGc4PThBeHoUpdcy4KHsE+k29PlF+kyRHCXLFnSFaYemM2I305YJs+YSjyGQk
         NEhwALDDKjS5B2coC/tWMAQDzowDiRkB2brSS2I53xxHoI8dBs0VsIstojSAfUbOS/gI
         FL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zp11byryPsUZ+4H8wFI4Zq/E/xqbK9hz7sAlcv7KVqc=;
        fh=YykxacOnBx+desRKZtA/DkfVhI7YzzJSxK9pg0zyy9Y=;
        b=aE2a4n+5N+2lfqZhkStTL+QRxMdFC8gCWGeZmo3CxvK4FiRlITjYXfyJDL2zjsdmP0
         OWv0d7TKCxDSpl0Ec1Ydxz1eEst83qJj60xzJpSjnuBxDe196i1gmKNfv8+GTiY9YJSo
         DbEqi2MWdvDyqzSs93jjUQdBWQ05UsqMSHgwX3qV3XWZgLCRK4dvo3L54g3y0QZxw3mx
         yB6wFIa1IzUQYTMLRvE+OopcyNyi6waPViK9KOKT7tAFNBf44+6gF7/O1hMRG66eg2FB
         UEKPximVA2a+2oGoMGq/GrAi4Z/Z4RtLto57JD+I/q35SvsgBwDDqH+YV7jb19gUYmWS
         /bww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvEOAOV4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p1-20020a50cd81000000b0053e79a2d1e1sor743116edi.3.2023.10.20.09.37.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvEOAOV4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819841; x=1698424641; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zp11byryPsUZ+4H8wFI4Zq/E/xqbK9hz7sAlcv7KVqc=;
        b=mvEOAOV4qerdOmrlfjHox+B0ATSBtGSqBWjKuCk68sRBeMhdDXea+DAJvR7kt7/Kd1
         8bYU3NL/gsY258jYGfEFnvQpyOkRv+xhZbenPJfMkuVGtXqxCu4XpJ5h8p0dIIJEVOqj
         0YKxYblrLWrh88Cw3Wn3qbwf3ErWDg3n+NvfgbbU7xJuJN7ZYHhn1u8T3SRcHfXewtXs
         kfDEof6okFcXbr/QbJATmadW/kpl6qcM7E4nUMA8tOTEE7C9uH4ghYyF77c7n6hLzWEz
         LRSCOinxeeg4A+h7fvUBknjqJxoh4QIXNHOMntjwHa5mjAGcvMij3BlrK589y6bUm9YU
         +3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819841; x=1698424641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zp11byryPsUZ+4H8wFI4Zq/E/xqbK9hz7sAlcv7KVqc=;
        b=ckByXghJNCk+/7DEnBgfJVPoLKCTtJEVBrAAfNSdoNNWqA9dR9ZlbkplWOsAcFskPX
         oVn8f5v714kDbcEvD/7BYt7kw8K9l9PzLfLjpCU/MW8Rta1NRKjiy1yK4AYhKby8D4L0
         joKSnhLw/7uaNTB0iFnS9OomNZR5MqGiYljImmKH4TIFukE8eFAPHs/wT3gpmdCFOAhB
         0aKyK1NMbXrzfJTMmqSSwdYEF+kJhuIRtIyR3PfzOeaDNsuMB8hZYJUgbBZ8C1vE/Suo
         x4jPVkFiXT2JqUcqkCtBLQ8GoGCyuVg/vMTsFOmY1B9jxz+7RPN1HWUio3OC3xW+lQw6
         v4/Q==
X-Gm-Message-State: AOJu0YxeOZ/Z9MpSZty5hgVloII2cFifOIZ5tebNxJjSMPQjZ/BYgoag
	b9hOaWPpWXBjXRPEGVuDccv9E4tu
X-Google-Smtp-Source: AGHT+IEiQRd93j6ORFqt6LLksrDvAtJ4jFmSOqwmG0w/kRCYG+YCyMIOK8p9iSZNmwu/QJv5BPBqFg==
X-Received: by 2002:a50:d542:0:b0:53f:a4f7:7bfb with SMTP id f2-20020a50d542000000b0053fa4f77bfbmr1827246edj.17.1697819841503;
        Fri, 20 Oct 2023 09:37:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id n15-20020aa7c68f000000b0053eb9af1e15sm1738773edq.77.2023.10.20.09.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:21 -0700 (PDT)
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
	Song Gao <gaosong@loongson.cn>
Subject: [PATCH 04/19] cpus: Filter for target specific CPU (loongarch)
Date: Fri, 20 Oct 2023 18:36:26 +0200
Message-ID: <20231020163643.86105-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D9lNCIEuZENU

Enforce qemu_get_cpu() to return LoongArch CPUs in LoongArch
specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_LOONGARCH_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/loongarch/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 902e32a3e3..83ca7d6b98 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -560,7 +560,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
      * +--------+ +---------+ +---------+
      */
     for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
-        cpu_state = qemu_get_cpu(cpu, NULL);
+        cpu_state = qemu_get_cpu(cpu, TYPE_LOONGARCH_CPU);
         cpudev = DEVICE(cpu_state);
         lacpu = LOONGARCH_CPU(cpu_state);
         env = &(lacpu->env);
@@ -594,7 +594,7 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
      * cpu_pin[9:2] <= intc_pin[7:0]
      */
     for (cpu = 0; cpu < MIN(ms->smp.cpus, EXTIOI_CPUS); cpu++) {
-        cpudev = DEVICE(qemu_get_cpu(cpu, NULL));
+        cpudev = DEVICE(qemu_get_cpu(cpu, TYPE_LOONGARCH_CPU));
         for (pin = 0; pin < LS3A_INTC_IP; pin++) {
             qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
                                   qdev_get_gpio_in(cpudev, pin + 2));
-- 
2.41.0
