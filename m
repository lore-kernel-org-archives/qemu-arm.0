Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510140dyb;
        Mon, 23 Jun 2025 05:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSOqkhSWNzlohvcPpFja4BxxfOPQMYdLEOg/HBuGHvvfH//uepCDU8cVHLV9foMYf4JQguSmUznYrX/w==@linaro.org
X-Received: by 2002:a05:6000:2889:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3a6d12e6912mr10346828f8f.54.1750681230484;
        Mon, 23 Jun 2025 05:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681230; cv=none;
        d=google.com; s=arc-20240605;
        b=O00GavIOBlcoXbm2PHu6PIC/Coxtk7zUtvFx7lbq8m8o72foPoit85gzHKMS1NcV23
         w7L7zyWborlE1DxZX2I3B/jle/xzj2ClWLiyOlgw0gXHU48/qJnrlzdtw3MmJLDd8CX1
         dRf7lvC09dmDF7aLsjhw4TTfMHsushgEgTSVBnchMhGityO3iEzW8nFC42R4mkU2/f55
         81NgxuTKOwf/iAe0wFSEG3xBrryGMwNC3gh22a6AK2SeE1R5Y3BcBdUzqStQt7EkK6Pw
         Bp08UBH5fO+uwwy/mxusSDraAOzKwtk+3DpOvEvq9sV2hDswzEPy+X3qDY8Vj9NvmnCL
         Sfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fvGV0OwfNAMYe1Mulybvoaq3k7G7T7tR2QdHLx3eR4k=;
        fh=jVWTiMN6Axo/b82nqIvaEqmQjOns+sRfopsL2Y0hTTo=;
        b=h25hx2/Il0XbQ0hgFH73x04DcRj1bMkERZ/IwSATiIGXcQXhWuX75uUTFZp+cQSuM5
         H6071gpSTVdaBjdxeNkvnSHnEEJ5NRqDBvo6pJ6cHLy43ZyBK3EsrL59xbZc3OkD1t7m
         9Xejaz0XVHgScxSMRsxeHT94Gf+IXB79nu1C5EcKdPpSXgVoS36XXzAciBVhNVEHfZ1e
         PYrDmJ/MI2kG+DG3WKjLSLKVc1uzqjCLPjs9C4CTNpLa2ytdUaiSPZW1+AqchKFwJJ87
         2HcwpMQxaWt2OhiON3wgj3wP43/ofDDzlPD0B6MZ6btgW6XK1V/LiBE37s2EGLNFyACi
         F3Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCry8fFH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d143b01bsor1775090f8f.4.2025.06.23.05.20.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCry8fFH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681230; x=1751286030; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvGV0OwfNAMYe1Mulybvoaq3k7G7T7tR2QdHLx3eR4k=;
        b=VCry8fFHLnf9881kf0WjssXjWRVidJQL+IC1no8uRdzS4kfJdCHXp/0FOGEBJS4yr7
         7d6LcQkQnQ2ktXa8UIDdTtM0nRtC3JYZD1B6sXcho4JT2geTau+JDW4SEwNhJTarEhdm
         j2TdVzHgl4Zeiah2LHZ8lgCZKlfohD5vR4ZM6Y/IuEYnbxuOOiMXXsm9kLm+xHQZdRcb
         PRSoGYoQgsaxOLcYlvbw5MNRTfQq2sSj5oCan3wYPbVyPr4KbCmDTsb0iPhNTlPEkqeH
         N/bh+MegE28cF40ncauA6Ti3TxbWp+BRznwQVFX1Ge1Vs2hUQq9nI5VBBiVdLNf2EX8K
         DCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681230; x=1751286030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvGV0OwfNAMYe1Mulybvoaq3k7G7T7tR2QdHLx3eR4k=;
        b=UzswjTMrhlf+ysQ2nadQLcaznPQ7Ttt4jqpg1xct/9/OexC6mrM2d7gCusIiXhS3Oh
         vynRaYk7P8uiTShzJt2aCbEeIrw9DlMe8RKUnE38lZ9igBUaWWWksfZj2Li45x046z2Q
         IZ3oCD4JIgpvGS6cLwlnd7WLuY2C6Nk9su+SnuAbTRpAlN6rQ9XN6GV37m5JOhi/V9DC
         S7ja6DrlAJ439XVcbmgovk2kYINx0iK6hGcg6PclYQwzpIrYppezK+D+hK8xwHYwrH1U
         1j3OUT7XDBAga9cYx/jQpBS8Nw36LTAsZ6CiqkWQ0Jcrgb1aKP0LGfExMJ7ZkEYZZfHR
         Wcdw==
X-Forwarded-Encrypted: i=1; AJvYcCURq9Rkt/BP1AB7LO6ft5boGyFY1NMvk3DqSBgUB6QOOpSOzxpmjYxUcFYaKOz2JGg0esB0fTY8c8wwoQ==@linaro.org
X-Gm-Message-State: AOJu0YyDGL5SkqG1peJ+linyCMqykQ+f7eHQyQgDUPM9itBwmApFBgn/
	4rWu0n0gfbCkL7xxZZV9aV9TQkQO9xCFJ0Dq0ehF4eKsi9BajBmqV+gAksxBi/mPhcrmcQ==
X-Gm-Gg: ASbGncve06mSIOp5P9DAxJw6tnQNc28qvMSvwijwyCrMiHSXFfFbdtfNIq+aCdJmcqt
	5cdz4Mek/ZvHXpkBzDfvlHqOsXj0HskWeZtsoTzkiUGUAI7CyFGb1CfHWLzXwW/QxqEC1OXO7ZM
	bRYfoWm5b8YshOTtiGRUi3vIi3cOFG65lBM8lytmaof3Xr92vzFdjgPZ4m3m9VHtVl+dV5E+Wro
	mMitWBEMuAvgWSEAmhMOF7Szw9lPeS3KIT9HMkHD3CWlkfppjY/lBlZ7mznrOcSRpByLLF7x+PD
	dCVaUOyVO1Opm1N8/IQHMppqXeuraY0NFIjEuMOYjrLFcFUbGpuEAeFztI88q0m8ftSYLhmNjoI
	tIqWdgpIVPpnYnYPrNEbePP5955wh93wYz04h
X-Google-Smtp-Source: AGHT+IFHvPu69hvLV8v46JK3gDouHS/oh+Msk1ox8QgY0quFrYsKcRStqL+fYhN7WRhsh7mvIZOwqg==
X-Received: by 2002:a05:6000:3c5:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a6d11910bdmr10782043f8f.4.1750681229837;
        Mon, 23 Jun 2025 05:20:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19b30sm9525253f8f.37.2025.06.23.05.20.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 20/26] hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
Date: Mon, 23 Jun 2025 14:18:39 +0200
Message-ID: <20250623121845.7214-21-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KVufKf+3Kih/

QDev uses _post_init() during instance creation, before being
realized. Since here both vCPUs and GIC are REALIZED, rename
as virt_post_cpus_gic_realized() for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9099570faa..da453768cce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2032,7 +2032,8 @@ static void finalize_gic_version(VirtMachineState *vms)
  * virt_cpu_post_init() must be called after the CPUs have
  * been realized and the GIC has been created.
  */
-static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
+static void virt_post_cpus_gic_realized(VirtMachineState *vms,
+                                        MemoryRegion *sysmem)
 {
     int max_cpus = MACHINE(vms)->smp.max_cpus;
     bool aarch64, pmu, steal_time;
@@ -2349,7 +2350,7 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms, sysmem);
 
-    virt_cpu_post_init(vms, sysmem);
+    virt_post_cpus_gic_realized(vms, sysmem);
 
     fdt_add_pmu_nodes(vms);
 
-- 
2.49.0
