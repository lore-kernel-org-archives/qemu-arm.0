Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2806113njc;
        Tue, 5 Nov 2024 05:05:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUR2FgOCGPtiTc6LrAmyCXkuVfJANtKdpgEQuIk8nIJTSuoieWUjXvkUYnQVYKVk4gzhTgyg1KzL27PaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHnjkyVmkC/5e4OP4zW2qGLBe5Tq+FBDZN9tFEvAWuorTj8A4i1y60Jy8MZSHaw0I4ob4fc
X-Received: by 2002:a05:6214:3bc3:b0:6cb:ee73:6932 with SMTP id 6a1803df08f44-6d351ad3fbfmr284186246d6.28.1730811936453;
        Tue, 05 Nov 2024 05:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811936; cv=none;
        d=google.com; s=arc-20240605;
        b=Zb7ZJl6f3Gd5f4+L3nWBY9qEzRtutXuBf2lL4VkYxI88k/t4JnWRe2fsgFAzPo6r4H
         V45d2R6SAGGxjN+nJKuBhrcw9PqcgQSmYXA2urVvGlWIe4pzhti8LYeC8GXQbfmaQJg7
         A8JuZ74sqxNcewEAxvc2XfX+reOC6xOiFw1wBMGUFGXWxbEg4I5IdyVLWjCeM0KI8SEd
         vMp4Y3QtPmmQ9DWfd/I7xftZowh5pWmSJFrh1X0qlb1kaE6MX29aJw4E+O3AzCf5AHUi
         IMbaalK7LiswDA1OMdXf6ve3VurOUP4IwfChJ+M1n/CCz8JqXGgU0bamnw/d0gM5urvk
         V74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0d0MdOdBk05YfkTKMh9QebQk9C1dE5Lu0NYo5nI56TA=;
        fh=stvr4qpmcvuoeDwBOTepZYFSkqSBi5iARi5I8Gw0rUU=;
        b=YY1rZAczNMst5WLW4mdU8wxbc7RT39dfuwT2K0RZ8y0uPEYwaJqaU0KLiTKklMm8lj
         O4AK/V+LAcvFafuq3dDAph5d/Fuc5oKwzmMNwNu95/eZQpgW2bZCR7rjooXi4DW28mFQ
         FxWo8XhDzFKnFxxAvthpXdI+SiO6G9zVbFPmBe8LamddnU2VKnWZ13anftnipAa8G16f
         /OX9nTo8XMAqzNTohaIgMhKCyqvYnbute8oWHFh8DSCtCjNu2uayifJneZzhvIUzSg2z
         y6RUsZjng7kQOn9VpYksHi1+XfGtV84ZcYmerWWpjb9tQwXQMib4tTiFmmXI/yJqYJ4u
         e8Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jr9NeVr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fcfed6si132705366d6.152.2024.11.05.05.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:05:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jr9NeVr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JEo-00014p-En; Tue, 05 Nov 2024 08:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JEl-00014K-MS
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:04:47 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JEf-00029Y-J0
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:04:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso46123385e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811879; x=1731416679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0d0MdOdBk05YfkTKMh9QebQk9C1dE5Lu0NYo5nI56TA=;
 b=jr9NeVr3Png5Fo9XrNwrhUrLfYWuvpRAQ8dglGrLXPQ36CyU3l/X1eHvIfE9eRp5E6
 512NPsphIiSvwfnO3BBTc+Kc9LcThRBM/I02ZfbTvg6TSOkZzWwyYsjMwHyCcYqw+qYO
 C05CXrxBFMGcCBPBGJFsWQYr39GDwHoRG8QTREIgX9IJiYzc08TegNGcRi5m1H0W9fKf
 k/kQl6Xt1ItTMe8P6M0RIHe+ncMboNCP52/rgaS0xi5ynL/ps37wFY5BjWwLvYD5TgMg
 NbgUHz/A4EUxrkX1rsA7S0FXSfboBQf0A671+m5Ja3rPTiEb/NEAdCnW01HVoKKI3BsM
 gzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811879; x=1731416679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0d0MdOdBk05YfkTKMh9QebQk9C1dE5Lu0NYo5nI56TA=;
 b=WxljgBFnQPhz//v37nhFfeo/Uzr9XiH09gqQB13HNWO2rxSmH8kRMzrfuo47sNTg0r
 VJrBGPGpeCQ86R/KtM4TTTkMmlGMdYbToPW/kXg0TAz5rWypK+rbk8wasb2AJ3zyrgpf
 jTzN5L/7gA5YIcQMauXpGz91wVa1aMGHJSnD0slRrf7EjDjSYRjjFfG0PaKC9F2zcJy3
 WY2JXuyw6aCDF/iz76lR7h46moa8vocQlB6+KjTSqT1VBxPBb8k5/h8+QBsVyJtWTUDd
 x8S5KynaLaE3Fl6s8MrE904KJNqnW+HwUeVAU+UhTUhv+2Q3DJO9zmTQk5WTm551xiM8
 RiRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa/LnnF9ncy7DeEEV5YRMpfBYKiMjxDuTYVRowhFgI0T/Sv2i/D+RmwlGGqHX6WmTVKPxshRTykQ==@nongnu.org
X-Gm-Message-State: AOJu0YycR5ImcQqyYSVCkxW/0lOWLqvEvnV3HD8gtsE05yNSh7tGJ5V3
 zvH4U/hdPBCpJ22LxGM8haIAQ3utE35EJugycJF/jDKifuFka2i8AFxnJv2d0TU=
X-Received: by 2002:a05:600c:5492:b0:431:251a:9dc9 with SMTP id
 5b1f17b1804b1-4328328481dmr143793185e9.25.1730811879052; 
 Tue, 05 Nov 2024 05:04:39 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d6983b7sm186005865e9.43.2024.11.05.05.04.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:04:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/19] hw/microblaze: Allow running cross-endian vCPUs
Date: Tue,  5 Nov 2024 14:04:12 +0100
Message-ID: <20241105130431.22564-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: LpCtpy+9NG+o

Make machines endianness-agnostic, allowing to run a big-endian vCPU
on the little-endian 'qemu-system-microblazeel' binary, and a little
endian one on the big-endian 'qemu-system-microblaze' binary.

Tests added, following combinations covered:
- little-endian vCPU using little-endian binary (in-tree)
- little-endian vCPU using big-endian binary (new)
- big-endian vCPU using little-endian binary (new)
- big-endian vCPU using big-endian binary (in-tree)

Deprecate untested big-endian machines, likely build on the big
endian binary by mistake:
- petalogix-ml605
- xlnx-zynqmp-pmu

To make a target endian-agnostic we need to remove the MO_TE uses.
In order to do that, we propagate the MemOp from earlier in the
call stack, or we extract it from the vCPU env (on MicroBlaze the
CPU endianness is exposed by the 'ENDI' bit).

Note, since vCPU can run in any endianness, the
MemoryRegionOps::endianness should not be DEVICE_NATIVE_ENDIAN
anymore, because this definition expand to the binary endianness,
swapping data regardless how the vcpu access it.
See adjust_endianness() -> devend_memop(). Something to keep in
mind, possibly requiring further work and optimizations (avoid
double-swap).

Next step: Look at unifying binaries.

Please review,

Phil.

Philippe Mathieu-Daudé (19):
  target/microblaze: Rename CPU endianness property as 'little-endian'
  hw/microblaze: Deprecate big-endian petalogix-ml605 & xlnx-zynqmp-pmu
  hw/microblaze/s3adsp1800: Explicit CPU endianness
  hw/microblaze/s3adsp1800: Rename unimplemented MMIO region as xps_gpio
  hw/microblaze/s3adsp1800: Declare machine type using DEFINE_TYPES
    macro
  hw/microblaze: Fix MemoryRegionOps coding style
  hw/microblaze: Restrict MemoryRegionOps are implemented as 32-bit
  hw/microblaze: Propagate CPU endianness to microblaze_load_kernel()
  hw/intc/xilinx_intc: Only expect big-endian accesses
  hw/timer/xilinx_timer: Only expect big-endian accesses
  hw/timer/xilinx_timer: Allow down to 8-bit memory access
  hw/net/xilinx_ethlite: Only expect big-endian accesses
  target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
  target/microblaze: Set MO_TE once in do_load() / do_store()
  target/microblaze: Introduce mo_endian() helper
  target/microblaze: Consider endianness while translating code
  hw/microblaze: Support various endianness for s3adsp1800 machines
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Add microblaze cross-endianness tests

 docs/about/deprecated.rst                     |  6 ++
 .../devices/microblaze-softmmu/default.mak    |  2 -
 .../devices/microblazeel-softmmu/default.mak  |  5 +-
 hw/microblaze/boot.h                          |  4 +-
 target/microblaze/cpu.h                       |  7 ++
 hw/char/xilinx_uartlite.c                     |  8 ++-
 hw/intc/xilinx_intc.c                         | 23 +++++--
 hw/microblaze/boot.c                          |  8 +--
 hw/microblaze/petalogix_ml605_mmu.c           | 11 ++-
 hw/microblaze/petalogix_s3adsp1800_mmu.c      | 67 +++++++++++++++++--
 hw/microblaze/xlnx-zynqmp-pmu.c               | 12 ++--
 hw/net/xilinx_ethlite.c                       | 28 ++++++--
 hw/timer/xilinx_timer.c                       | 15 +++--
 target/microblaze/cpu.c                       |  2 +-
 target/microblaze/translate.c                 | 49 ++++++++------
 .../functional/test_microblaze_s3adsp1800.py  | 27 +++++++-
 .../test_microblazeel_s3adsp1800.py           | 25 ++++++-
 17 files changed, 236 insertions(+), 63 deletions(-)

-- 
2.45.2

