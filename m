Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp735405ejb;
        Thu, 15 Feb 2024 09:59:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXQDqffLXjWdx2nw1oG6j1/GbolN2say10k8rXIQS91214K/JEnftf/rH34kJfbXQxp6ivB3h3Q9+3cVWV7+CVAn5cfEtM
X-Google-Smtp-Source: AGHT+IH+nhbIAaOGv+AHKFjGARLRnTXkoe+rv+GiDR/0MNWUFzeTa2Xa8dWKNiv5i9sGZ/DGU8X/
X-Received: by 2002:a05:6808:9a5:b0:3c0:4960:ad80 with SMTP id e5-20020a05680809a500b003c04960ad80mr2460914oig.19.1708019992534;
        Thu, 15 Feb 2024 09:59:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019992; cv=none;
        d=google.com; s=arc-20160816;
        b=CBi+9RuHlVrMmpvMsk9yHax+WdotsoH6dJuUDvVy3nfGeBro3GWq9uLfaZMIcJ6X+f
         fDuEtYOOiHL+HvQe0gs6rB40EOGVqK8yhj8WUI2fMm8SCQETAi8s4gyiTwsFs/yBCxN4
         RUC7HvdJ8p2ksaS1Z74b6v//V7+7MpkO1nPr14RM0h3umUunzyh0IT+ZZk5FUzCTMAtX
         hgI7ZWzVwRuCzVdNd5G5Pv8j1VrI/yOV9/PZaO7fY6bW8cJ/F3//S8+v8ET7513c15/i
         nvEOGoCnV2GJILFLxAOSO/jU9Hdn0vNiGiDVvU9a/5u4BnTYFm1xZdSGl3Qc1mgeNLKh
         ZaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+yletPVGxCa3h+9fKZJUuwx/+JgKNE8xagr9A+vDkAQ=;
        fh=Go/IiZDu6iFIiqD7iVT8TiRX6d/l4ta2Ni0Cix971Xg=;
        b=iXUo3wqZiCVxJHhIna8ppu2xOcIGOrd3VeDcwMWMdqQQsPk0MXPSynmR+rirWOx/nP
         KOcK+SIyuZqmc83NjWlMH0zJg/zs+Ws4c4iyojKRtkAsyDNFNTtqAUOdWf763+ix7DWj
         WgedSdTiD9X2pnPwfuPr9TBXkpbyDZLCaCVqEqlp6TK6QHICjHzuuBo7SFAbqFpGrWnV
         7jilQueU0gJqi0UMHjEYz1ieCC0S1c97OgoEBx+CyvCFjuqxjkvGGfi4g+MeDTYzDgu6
         GsHLL2EC1C9PMTIaAmP6sL4uw2C5CXtWX4NY/sGDFgi7Ok3n2GEWDfJz46MYcIWnNt1K
         dM6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXcj+rQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn11-20020ad45d6b000000b0068ca70ec311si1965664qvb.167.2024.02.15.09.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:59:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXcj+rQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag1S-00057O-LP; Thu, 15 Feb 2024 12:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1P-0004tw-7z
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:44 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1N-0001of-MU
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:43 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d0d95e8133so14611911fa.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019979; x=1708624779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yletPVGxCa3h+9fKZJUuwx/+JgKNE8xagr9A+vDkAQ=;
 b=nXcj+rQMG6vw+E98opsk+Hg+m0ph7Y5vJ78Z88k50ciCUvb3ckWc8bgYIQYGeInMg1
 8sJgMYPM+1I2mTviW0A19IRVSXnGynd8CmN7pWVmUlaINhyGkJz7GnMjERNCZfeePLkb
 iA/6BpqjdJ8o/LEQaPnjW+/LNKRNy3n+Ud9jFWAREWKmfCmakaquvsFWvM9zYzQzSyxu
 ka6wyQtn4BXFB3D5UPtPAm2WSxRJi2PycXhJMJV8nGffX4DYsFrrHeb6ceH+X9dvgdJI
 ikY4E6f3zwDiQuHaFppf8PZsc9No30OUelFpltwPicGzRoSgIwUSel5z/76UycGxjpP7
 OrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019979; x=1708624779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yletPVGxCa3h+9fKZJUuwx/+JgKNE8xagr9A+vDkAQ=;
 b=kqhDROUu63guLG49zvap8nEk6RDM2kuttBSXHfDVr2x0XWBEIuWeC6bhDcl3wGgS9X
 9HpelyGLmVh4AukqMx+2JN/s/6KfuigyO1NeGMitqrStrZyaiCXHCBFMGgoJ5BhFyW9+
 RGSiZdKizaECI1igsmHQMmstdB6iamqiSwGg1AxIPvZrytpTbuycLLwh/x57eNOJ+T1d
 Nd0U4OPsYQO4cRx8Tf3W1DST0TJmenl7ll4xYh66XcL5cwMPiYOn7pwyCy8l4+4gONUc
 kl7YLCNYnZ21yToYjF3HGuPPtmTRasT6bs6NpK90vDTgSelcp76hTP8EAx7Y6GlW1UtI
 IELQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRj4jZSgqpwP6/X61JH9bWtyKWYoDU4rsYI0L4Y/R+KbwV1UllDvcwrbb8FkVMNYgrPSrDYgXsvy5+0sE4JX7Zi+Bc
X-Gm-Message-State: AOJu0YzFGjGfk5Bka7iaMMIDbm7IDyeT86kilb20LMFdXOvNPqBtRk3a
 Yb02yg96X3AcXjHCC7WzVFxvut3JQ9gRE38HkcGuDd/ZkrukbZcpC/SXqvmxEmw=
X-Received: by 2002:a2e:7e0e:0:b0:2d0:9902:16 with SMTP id
 z14-20020a2e7e0e000000b002d099020016mr1744614ljc.17.1708019979263; 
 Thu, 15 Feb 2024 09:59:39 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a05600c4e1400b00411a595d56bsm2868021wmq.14.2024.02.15.09.59.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:59:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 16/56] hw/mips/Kconfig: Remove ISA dependencies from MIPSsim
 board
Date: Thu, 15 Feb 2024 18:57:10 +0100
Message-ID: <20240215175752.82828-17-philmd@linaro.org>
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
X-TUID: 8WqnnbI4g5V2

From: Bernhard Beschow <shentey@gmail.com>

The board doesn't have a working ISA bus, only some I/O space.
Selecting ISA_BUS and including hw/isa/isa.h is not necessary.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-ID: <20230109204124.102592-3-shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240213155005.109954-4-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/mipssim.c | 7 +++++--
 hw/mips/Kconfig   | 3 +--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 16af31648e..a12427b6c8 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -31,7 +31,6 @@
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
 #include "hw/char/serial.h"
-#include "hw/isa/isa.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -206,7 +205,11 @@ mips_mipssim_init(MachineState *machine)
     cpu_mips_irq_init_cpu(cpu);
     cpu_mips_clock_init(cpu);
 
-    /* Register 64 KB of ISA IO space at 0x1fd00000. */
+    /*
+     * Register 64 KB of ISA IO space at 0x1fd00000.  But without interrupts
+     * (except for the hardcoded serial port interrupt) -device cannot work,
+     * so do not expose the ISA bus to the user.
+     */
     memory_region_init_alias(isa, NULL, "isa_mmio",
                              get_system_io(), 0, 0x00010000);
     memory_region_add_subregion(get_system_memory(), 0x1fd00000, isa);
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index ab61af209a..afcfb2b8ec 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -6,8 +6,7 @@ config MALTA
 
 config MIPSSIM
     bool
-    select ISA_BUS
-    select SERIAL_ISA
+    select SERIAL
     select MIPSNET
 
 config JAZZ
-- 
2.41.0

