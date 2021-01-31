Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599627lfo;
        Sun, 31 Jan 2021 03:50:59 -0800 (PST)
X-Received: by 2002:a5d:453b:: with SMTP id j27mr13463598wra.92.1612093859127;
        Sun, 31 Jan 2021 03:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093859; cv=none;
        d=google.com; s=arc-20160816;
        b=QO4RhHNB+tkCZM+IRCcqBnHjBHneRIsXWi7dVeivS48vxiJMpCnktn7gSeGuwm3DzG
         QshQYLmG9u+LjMYlcEiRrl5jZoj0clRlwuTXWzp9913qx1HG6Prb4dZx6g3ZrK+GQ+OZ
         sD3cSBxw5HfPK3nsEBT/f5xujWwn0+X1bA0Js5ewRguAJRc8NJ78VWpIlpvKYdOoSddK
         IyLlGSCWZC3w1J0K59ccrSstjiz61Q1D225ILv4k7o+3JnjkJkY5cA+aYey6eUlkCstF
         4yMXzreS6XU9UxwBnuy9jyJraFlnuhzjZJytIjR2qzzr2jcUqskFFOzC+O90DuB1SFvP
         zMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=55M93vKE1ahVgefWyZvIGcKvoJvAwdKqopFIoeHKkkA=;
        b=QAMbeQ3VKTn307nGQ3WeR0byDqHu/2IfE+jCQ7ZU75qwK1uWwWLPGCffOPrH5Le03r
         2JvjRWgJsdj4vCUDZYD6Vr1rCgHYnOMNYgmFQnhDI3inuaR5McWlPIGvIV6/EdAiq+l8
         oDQ3aDS936ddFnS6GPypltqUtTFtDH7XZUiYpKGYAi9uZBB2FMwqXkLb9pMTzzh9bl/y
         LO8x01eY5tLjOFSUfyusbo+U2p8ys1fjBt6wBp4oTBxBbGIaU4P3EwiRumSXwRcQN+Vy
         ik67IWTRuGiOef/OQxw3HZSGieLVEem5JmpthKs+1wFZtQKMzVAqihxBbi8iHerKqSu5
         dFZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=freBR3tI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g145sor6715756wmg.17.2021.01.31.03.50.59
        (Google Transport Security);
        Sun, 31 Jan 2021 03:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=freBR3tI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=55M93vKE1ahVgefWyZvIGcKvoJvAwdKqopFIoeHKkkA=;
        b=freBR3tIPtKMjI2+MuKbji7ZAmhWoqg3OKGAyKpW5xTZpNL67hf8t/x55QZPJTsMKz
         yEgpK6BA74aoPJ3neWrEuMTCkKXHqYvDm8EEuhQyQq+J9Qdipr6EZ9TB9ia301pTOoz9
         vv9A7BlPEvFHTRQ3M8w0tWlUePeXhLMgnZjd3JfMdtm30/IKP2UnSGsQS5fQkz5uSsxt
         ceUquXDjHUU1rTo7hKFajd/mUnA7Mi6K/dt+TtlgJYUl86XLQH7/EFyjqFqD7mwzCzQ0
         iT9EJe0qFQ90dsHDB1V8YvULyo5X3sBy5qnHmUGWDwe8TzgD3Z9yRx6ltBfOJRZHPZow
         zY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=55M93vKE1ahVgefWyZvIGcKvoJvAwdKqopFIoeHKkkA=;
        b=iy5EAZvsg/ikciliPIc/CeYswkmZOOHC8FxANbDdk04iibT6Wyl7ev+4CcC6YtSIHk
         q+tXLtkqz6uVUp0iahj4vHVVrcPKTqZ8PmN/NDuR748CRya5BqcJijF2oNu8WxniTf7I
         hxeFbs6WJDoHzQYUpnx742yTVwQQVTTR4vDwuUg1bnv2RfvaQtxotxYMNKRzloqh849T
         ycT8CTkcbcTXfvgNqr8ZI1fJn8TeUsS+p22CoXPFSQSrWsDqtkXkd5TLVBDvqS6lxH2q
         32PXagqWxTs6nF/EEmHbmKJ/s1i9+BBUQWfabBwgauNeqmJi8i8vZvGkn/ZMX1lxHwed
         SMMA==
X-Gm-Message-State: AOAM531TUHNPDv9OHXRkC2iS8yIliDphXinr5NYDD8P8P12RtPZVmI9B
	dR6/MUgniD/PH7RRCMxccwo=
X-Google-Smtp-Source: ABdhPJwJ9hes8lhe7OgVqiDeXshE4pGmaMbjuBMuK73ScXw3dz3Zg0MEOl283XRP7LZaLbEaQLBqZA==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr10935564wme.53.1612093858925;
        Sun, 31 Jan 2021 03:50:58 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id u5sm18602187wmg.9.2021.01.31.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:50:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG accel
Date: Sun, 31 Jan 2021 12:50:17 +0100
Message-Id: <20210131115022.242570-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: l/vbqguHcMfG

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

Beside, KVM only supports A-profile, thus won't be able to run
R-profile cpus.

Only enable the following ARMv7 R-Profile CPUs when TCG is available:

  - Cortex-R5
  - Cortex-R5F

The following machine is no more built when TCG is disabled:

  - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/aarch64-softmmu.mak | 1 -
 hw/arm/Kconfig                              | 2 ++
 target/arm/Kconfig                          | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-configs/devices/aarch64-softmmu.mak
index 958b1e08e40..a4202f56817 100644
--- a/default-configs/devices/aarch64-softmmu.mak
+++ b/default-configs/devices/aarch64-softmmu.mak
@@ -3,6 +3,5 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
 
-CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
 CONFIG_SBSA_REF=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6c4bce4d637..4baf1f97694 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -360,8 +360,10 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && ARM
     select AHCI
     select ARM_GIC
+    select ARM_V7R
     select CADENCE
     select DDC
     select DPCD
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index fbb7bba9018..4dc96c46520 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -18,6 +18,10 @@ config ARM_V6
     bool
     depends on TCG && ARM
 
+config ARM_V7R
+    bool
+    depends on TCG && ARM
+
 config ARM_V7M
     bool
     select PTIMER
-- 
2.26.2
