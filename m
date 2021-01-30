Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1618917lfo;
        Fri, 29 Jan 2021 17:53:01 -0800 (PST)
X-Received: by 2002:adf:f90d:: with SMTP id b13mr118731wrr.198.1611971581630;
        Fri, 29 Jan 2021 17:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971581; cv=none;
        d=google.com; s=arc-20160816;
        b=JTFa/0HPbQ5YV8wxB78McjNQbFLttHYsqFlfqzBIM5f05zsexndGRCjXLVhfSihwea
         /4JIsNbdJSKHPXlZw8HhHxJpcW7lbVGNbzLAiiALeNl9YP2bXB9mRydQUYARkGh/rknu
         F/5zDvvnBE9mKB2TRWdfb88iWW2zEfW1PwDPw67QQnTT3aqDMDg2+2a99wVWvLIvYJ2p
         7liOqcbhM0SpYUKgnTzXguy8kKcVTC+5vleNAjDaoSsFcV5Y+zN9E+pGIT6Z9YIzPiMH
         1BxBSOVqXzmemBXs7mXxWdh+AcGdhdIUzniasib748SXFQHd/wItNrWspcIxQHs6Naxl
         TDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g1KU5IE9TGCZM/lU61E2LYHQF94GVZ2sjp5LehjcIJU=;
        b=aRvO1GlS/l06HuW2pDuf2DGs+dt8ruAZ9uDL8jeKSmVpbrsAu13CP2GODDSHZjR4gv
         nD5TvENYR208yTej9SkuHKPXHEWYAbXFoRyW13bIWINctCLzRonvvmEb2ObzhWxS/pgE
         7rRxvijJ5EHgn+0DTN/EZTouggCTSD2wzFX0hoFGRAXUD967r+Z9uwRxNM542kaS4teT
         QCHJ9LOTNXrKweTUTi00BA3QXlguiUrwEgZOHjw3vy7t3kKgnERh41JxSsgICZTl5Z0w
         HN1NFVNTYZp4lm49t+HgINR18PGdYnkDKwRVqqdzQRyjFtkc61MNsMs7l+dFwUTM5zu9
         Woag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mFXWLnEV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g15sor5413153wmq.8.2021.01.29.17.53.01
        (Google Transport Security);
        Fri, 29 Jan 2021 17:53:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mFXWLnEV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g1KU5IE9TGCZM/lU61E2LYHQF94GVZ2sjp5LehjcIJU=;
        b=mFXWLnEV2J7F5vMWemzgA7H5rDlvI6++w0fS0CrZkpYvnv+K+N3XgEO3GKqwwuaANV
         d0g2d43AkRHBIhnX13fL4uJHnEss03yuMlReAv0aU0IicAz94GcfWh5K7Snxt8N8VR2K
         m2+R3VOFvTNVyzdmxAUUMMumOrI7WSHzLPeDPs3BE1Awvg7fhIjOEoY+KbEEZ3F+6VdF
         6FPqa4w4nqQkxvEZACD/7lmP+n2g0PSuWwn57rp18al9fjHH4i5rs8wkEYgX4/S1vteX
         co1K1JfSZCh937LeyFh7KfxD9XXT2OfA3b5Ooc/YPg83R/j8K/T+OOmAzvb9jg4OXvX5
         t53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=g1KU5IE9TGCZM/lU61E2LYHQF94GVZ2sjp5LehjcIJU=;
        b=n4u5gMCmVRUjzV5cd1xzepSVhgYiohufs7L6KEBIAzxyqMf+rxzdHwAzpLpkWtUgwf
         5FMhT4G0YJLV7HLjfJ5DrYFMsZShf6gDlWyTeEzo8P72PL46PELL1J5vOV9DsBwjBTj+
         fEL/Qi8rhQjTVo6gVbRsBu3Wx24QKDZoTXdoQdVNnW704RzeicNNZArwxiwMtxl18PyR
         9HeZJkCgvtYTfNnOKPgiJNo80Cz5Xfb4taGo3BdqXyKY78G/UpAlB6A17SCqq+21eC0U
         o/yJuMB3vhp2riKBRq0sMztSPz5YI18StwJyP2w1jraMI8HJD7YpwkCJwiyMmaEZ2g0H
         Ng7A==
X-Gm-Message-State: AOAM5338sf0xLOEiYd/qYjBGeARN/+irAg7pUkjKRnm0IOdzKnX0p2HY
	AfVQvB1WynFwmI6r/pmntoo=
X-Google-Smtp-Source: ABdhPJyA4Coz/8piVvaPk4EIcoOTmtcPznXjAqGGyUN4FELubBKdNdl58zv0jN7k1O/K2eCj4Luk0Q==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr6103963wmf.151.1611971581368;
        Fri, 29 Jan 2021 17:53:01 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id w25sm12591514wmc.42.2021.01.29.17.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:53:00 -0800 (PST)
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
Subject: [PATCH v5 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:22 +0100
Message-Id: <20210130015227.4071332-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zCXupGqmpw63

A KVM-only build won't be able to run R-profile cpus.

Only enable the following ARMv7 R-Profile CPUs when TCG is available:

  - Cortex-R5
  - Cortex-R5F

The following machine is no more built when TCG is disabled:

  - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/aarch64-softmmu.mak | 1 -
 hw/arm/Kconfig                              | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index daab7081994..320428bf97e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -11,6 +11,11 @@ config ARM_V6
     depends on TCG
     select ARM_COMPATIBLE_SEMIHOSTING
 
+config ARM_V7R
+    bool
+    depends on TCG
+    select ARM_COMPATIBLE_SEMIHOSTING
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -377,8 +382,10 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG
     select AHCI
     select ARM_GIC
+    select ARM_V7R
     select CADENCE
     select DDC
     select DPCD
-- 
2.26.2
