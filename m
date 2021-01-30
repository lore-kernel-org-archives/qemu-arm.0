Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618824lfo;
        Fri, 29 Jan 2021 17:52:46 -0800 (PST)
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr7510486wrd.33.1611971566074;
        Fri, 29 Jan 2021 17:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971566; cv=none;
        d=google.com; s=arc-20160816;
        b=peopwBPXayChSQXbrjA82Lyjwp4FngaO/bVNxHLPVRCAl/ZmuvQC9MitIj7zk/H28m
         k38TZ+/zEnTfis9t25DazgSB3DUDlL9+eOEYlhhIyHoRLNRSERjHobkcCkhORUiRVzdM
         FEf4x4MPCtXjnCJs4e8zmmisTR3Lx+Ryz0uTQBm2Dr8ljl+SSsDmlDu6ly/AAWQb1ZZK
         M74OsGfHeUjwbKcbgHhAfRGkkgHHGijTmbGFC7v06gMmTeQVxj97x8aLSNYiiuyn4U5h
         TgxP7fokfh6cp0Xh59nSxFeWcvQ1VbxMICrv54pEFSjIszhzENIJwS4jgiyFYXokjDAW
         v/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vcCVSF3XdYkCqqZi7utKwViQKx4YjOvtKjolDPxsZVA=;
        b=G9rv0Bq6yRPKaSjitqThlneSV59O96IeIsLqkxQL1yOCHRyosPNkljMytE7Ms/k5qC
         viWyLrM6dxSNh6NMBEhnzW9uJ6/L52AAspx+5E83rSjlSYPamncg7O8umTGwGy8/eCGH
         ZxGC0nne4jv/0Hien/SFdzC2IfMNgx9d9HZtIN4fL6PbFxOatCwNCYDdIzFWqUaFIRbN
         E+LPLN1juCEQ4F1QNbXMwUp0DYVWOTWEiA2fmc45VmZNJ3BWYlxR5umcg5IfLHUs97bJ
         /PM8EtjnLNDhIhka6uXS5vjeKiZpnLjt0VefegpCrtUF2RyppwbHAFMX7Y3UxrNekBlQ
         mI8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uuOQE2bV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g145sor5351994wmg.17.2021.01.29.17.52.46
        (Google Transport Security);
        Fri, 29 Jan 2021 17:52:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uuOQE2bV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vcCVSF3XdYkCqqZi7utKwViQKx4YjOvtKjolDPxsZVA=;
        b=uuOQE2bVc/AXhQEPhQ6gdsToWOMtR7/LcnPqZ5MlFP7kxA9NkXZRlPLIuIGcDAICaH
         ssfdEX74NQKHWvbMKF1O0arKgDrgBDsd8FqdoI/5wNZzzclE5eRj9Kpm6bGoGr5+cZdI
         Jg5zG6cmCMmNVfGLW3zUisi7sd7SUqp60e7Hpum16Q1olADlzRwBFv2K8f8X18j8D47y
         58iyx4+nB5prF66v4obJKkL3bwkP1u0ZTkyuBYVj1LfX8505z2oyoDPPp1zNI+EnKisD
         o5O/sJHYTlK/TxPX7i+7nbbtSy/f7B6U9/cTk8WL2l7kXtk/9VzZhNismcBX99UrM8es
         TVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=vcCVSF3XdYkCqqZi7utKwViQKx4YjOvtKjolDPxsZVA=;
        b=oAl1zKp6f5hdkm4M7I/VoeflnmRtlIScWF/bIXZDgP6gQNS1ilbyUWsqzuB0xAWSFV
         H6VP/SCFnPDsSFY/9jA8MmH8x1/LdVGEbyxmR8A6kKOu2eF2jtpeds4Z2+n2Ngvr7a8v
         MnZSq8rcA8SRVmN0oGGmMEfpwC2SvAeqYclLRGttgE9el0mwahULEuCWgpueaYu/XCPd
         Pc1apbGLyN5O9Kukpq++McEGgHeVreET1PYzS4XW1iUz5Uot+9XF55E5xAtYz+2IYhyW
         HF57+ZXMEogTWtJHcGIlDURWVhsnlS4EJDoJuC1rQuGZbe9eSVgxjSPT9LY1LhMZ2IUh
         tUEQ==
X-Gm-Message-State: AOAM5305QoLy/JdlsT5HYwwNhTTdVz4zivuYSrKucF6Z1RZgb4dlc8Dp
	PfAvF7SrnVV7njTs5VQ2ZV4=
X-Google-Smtp-Source: ABdhPJxjjNgvntexhnAMkjHR5dHZDBe4a6Ehpw1OZ8B2xG9qLvuQMF7WDg1InhxkhCshzCAD0AspzA==
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr6167686wmg.46.1611971565884;
        Fri, 29 Jan 2021 17:52:45 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id b4sm15215041wrn.12.2021.01.29.17.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:52:45 -0800 (PST)
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
Subject: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:19 +0100
Message-Id: <20210130015227.4071332-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E7fZlOGIq8jo

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv4 CPUs when TCG is available:

  - StrongARM (SA1100/1110)
  - OMAP1510 (TI925T)

The following machines are no more built when TCG is disabled:

  - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
  - sx1                  Siemens SX1 (OMAP310) V2
  - sx1-v1               Siemens SX1 (OMAP310) V1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 2 --
 hw/arm/Kconfig                          | 8 ++++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 341d439de6f..8a53e637d23 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
 CONFIG_FSL_IMX31=y
 CONFIG_MUSICPAL=y
 CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 223016bb4e8..7126d82f6ce 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,3 +1,7 @@
+config ARM_V4
+    bool
+    depends on TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -31,6 +35,8 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG
+    select ARM_V4
     select OMAP
     select TSC210X
 
@@ -249,6 +255,8 @@ config COLLIE
 
 config SX1
     bool
+    default y if TCG
+    select ARM_V4
     select OMAP
 
 config VERSATILE
-- 
2.26.2
