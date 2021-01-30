Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618888lfo;
        Fri, 29 Jan 2021 17:52:56 -0800 (PST)
X-Received: by 2002:adf:d0d2:: with SMTP id z18mr7663604wrh.70.1611971576048;
        Fri, 29 Jan 2021 17:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971576; cv=none;
        d=google.com; s=arc-20160816;
        b=dx8vh44uXn5XnfICUs5dRzGN0Z4VuwoSaDKJFiNtlMjrd5D7I93AxNfw2WmNxulA1O
         5hmYJiWVgOLi1k1vLtl4O4bAkPQpaqC7LQoorygDO3XO0kiuGMnEgzokbV8o/f1htpUH
         QAhDmIaR8z2tNR+ukN2M7bqGbLsReQauNk1GbfIZt7ryBwtPn4TgNf3Yp/12PYHcYsrH
         SqyIhy2PZpOikwAkjv19rMbAh8eEWDOY8LqV1EIXGFpGyuKuGTOrqgLOuWnawFYbOj0B
         Ka1iKuO98sb7oUazqfzvx3yYib+cFm5cBJnZTiaEhE7ZK6wgvEue6XPFTzIjsQJQ3l7t
         WXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=7FgMXEaeMqaVd+Y46GoSMFA7B1XefkRzbvqiN7p+wqE=;
        b=O6CATOHuiQdWY3LaP+gxSxor6DS8Fb0yzNecxem0rAHgi+mLmCo6hBKyhYnH445TE/
         ss+NnNYtV+5Fq/7h6p7tY3X3026W5V0WRUtpmvWhD4abu5pndvJlwGIQPOIUVYHgJflc
         QXbpU8YujL45YjZ8RB4FhRCO+kNGKfwFqnF1ApasaWsRGfBgYyzBBIWiMkyeSnQwwrF+
         ROQGjYmbr0Sdfe/j7BBQr5mD0QT6fFWjt179ACAmjJB9g/F/BKd+iGVUYoaPzQk0sY0E
         98TiqngOtvMP7rqtwD+ItPHtdW2oZrdp6HOijgyXfoPox1nZ/Jv8EhN2e94KmbNRqgNH
         WU/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="VxuQC/tg";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x4sor5437587wmc.23.2021.01.29.17.52.55
        (Google Transport Security);
        Fri, 29 Jan 2021 17:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="VxuQC/tg";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7FgMXEaeMqaVd+Y46GoSMFA7B1XefkRzbvqiN7p+wqE=;
        b=VxuQC/tgKHUMfQfr97MNiO38xSrcPNb3RCXXTu7K7defWmZ2lWCUz5+Kh6V8X7mpHw
         0J6VIbGesbLnIehvEqvJErp2aWJ4F9jmu0YuZ4mrhMFxU02SGvL9g1WbC0P0SuKVnxso
         /LPUPNIt4+waPa/XVjsYNRFNNYvVbFcz0fFJT5utW+ufusAk27lPQl1XxPqmQiiAd3pp
         qe/SQwRSLVYzQxU7AOIOiiOlk/8lF5orJ/TrtQhmsYHqAy1bmaYpH25ys4vl4Okyaj2T
         NZugbFH3h2ssWB+VpMEIt5tbGX3Imu86QimIhkHSRsdQGvfOz69XHVauBKz9wAiCgt85
         VVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=7FgMXEaeMqaVd+Y46GoSMFA7B1XefkRzbvqiN7p+wqE=;
        b=POL76v7A0Th9+B1Fi11qaMU8tywr+VUDYsE816X4CgqTAUrbVb1eapMe+1zNdsvDWK
         DKNtD9eaOhOCmAd//bzZI6pAoLlCFniy2/ImKFmr0+aEjfyziyIAo3cSLeS8eE2kT8l6
         ot8heyFwAdxot8VWZL7YEoQsR4u8IWFJIxATDkj8ZwAI85mT/Ls+BigHc/OWe9hjao1Z
         rCZIle0rNmxc6FOhuvpG+8zdFbcCSAZhqZudPsQRQMRYhGIyH0jePwv0MRTMzZqNH9xH
         7EnmGc2FKeUNh4hcVaHAm1JWzIFllMXiiET7/sa4jNDPhHJs3I9gGAlqn0vG4UYi8IWS
         IU6Q==
X-Gm-Message-State: AOAM530zMeyk31JQtGMUxhT9RCj9gwsydAbGSqDIwScIuRxt3p529ZUf
	xM7k81sPK7Npt31ovs658n4=
X-Google-Smtp-Source: ABdhPJxAsrG1xJpOA8SfzNM1/ozsjXKBF7jjRMH5K7BqGyRUpbGN9MIHDfPmoi4udW3y5o7qEUABGw==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr5942123wmc.103.1611971575878;
        Fri, 29 Jan 2021 17:52:55 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id g12sm11835695wmh.14.2021.01.29.17.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:52:55 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 05/11] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:21 +0100
Message-Id: <20210130015227.4071332-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hVy5iJtaVR7t

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv6 CPUs when TCG is available:

  - ARM1136
  - ARM1176
  - ARM11MPCore
  - Cortex-M0

The following machines are no more built when TCG is disabled:

  - kzm                  ARM KZM Emulation Baseboard (ARM1136)
  - microbit             BBC micro:bit (Cortex-M0)
  - n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
  - n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
  - realview-eb-mpcore   ARM RealView Emulation Baseboard (ARM11MPCore)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak |  2 --
 hw/arm/realview.c                       |  2 +-
 hw/arm/Kconfig                          | 11 +++++++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 5b25fafc9ab..ee80bf15150 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -10,9 +10,7 @@ CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
-CONFIG_FSL_IMX31=y
 CONFIG_MUSCA=y
-CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
 CONFIG_VEXPRESS=y
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index cd37b501287..57a37608e39 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -463,8 +463,8 @@ static void realview_machine_init(void)
 {
     if (tcg_enabled()) {
         type_register_static(&realview_eb_type);
+        type_register_static(&realview_eb_mpcore_type);
     }
-    type_register_static(&realview_eb_mpcore_type);
     type_register_static(&realview_pb_a8_type);
     type_register_static(&realview_pbx_a9_type);
 }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bdb8c63af7b..daab7081994 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,11 @@ config ARM_V5
     bool
     depends on TCG
 
+config ARM_V6
+    bool
+    depends on TCG
+    select ARM_COMPATIBLE_SEMIHOSTING
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -131,6 +136,8 @@ config NETDUINOPLUS2
 
 config NSERIES
     bool
+    default y if TCG
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -411,6 +418,8 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -488,11 +497,13 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG
     select NRF51_SOC
 
 config NRF51_SOC
     bool
     select I2C
+    select ARM_V6
     select ARM_V7M
     select UNIMP
 
-- 
2.26.2
