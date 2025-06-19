Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253395njc;
        Thu, 19 Jun 2025 06:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmgBL8vmEc+vhYQ8p9G7LjihbDkh1J5Hcnh2gJ3M8tP3R62ceb4fG9ab16o1F160B+0wz9DKihhJO3pA==@linaro.org
X-Received: by 2002:a05:6000:26cd:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a572e79674mr15170101f8f.41.1750338898142;
        Thu, 19 Jun 2025 06:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338898; cv=none;
        d=google.com; s=arc-20240605;
        b=jx8VFsWR5HsTkMa981GgP22kHEdz8D4VJ/tf9FeSHMs59TyeBMeuhRxomlHeEKa1us
         FFdPJAPzqA8NkA/iHrJO6VOqm7FYmX4mP+DdaIBFNARoZnxoa4oEBmV61HZOMeJvq+Zh
         MwvH9m9m3hJvnOgbTqHa2+2jT7PXLzZC3AvDoCO3DcsAX8Y89D3iW789n0YdRXeDMqyV
         OZmh+oeScExVsuTlVPo/Trcw/CXVx1+CB77+4hb5r5k0+HAJl06WgBnXThube1i47CBC
         Gd09wAKC6AjETMCEsfsLJCDsjQ/9LHBb5/b2SSR6cgONsoPPf+a7BiMaLAnGbsNlayMU
         3i2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y5LZcCqNpH4GazYoT4HEePjvcf7hcAUKrr97H91/oS0=;
        fh=34W7qk2TmvwyQhcYlUE/0xWwPhtCQ70I9LgLT68LHmk=;
        b=U0XBUJMSSUC+qKf/Vn+i+P8iBoHz9AYpgh8A9AJQmTLI9jpqEbStGvPA6PHkCzR4Vy
         WlYL+6kWhOw0ZTjyVYupn7iRkMe50HwFGsQgOeiuQJbz1xrcmoAiVaUwdOxj2xJv1bFe
         eEHt5my60tb6kfXGt4opFZ5NPv4u7R4kJS7dBYd0lws8JzFTsIamY//D++UosRXyP0iT
         fotlargS17kCDNM3uZY/tn3f41/uoxfiGsxQbcMWlQ5UwD1zX3NIIs2SBpgQpztuPujx
         KxL4aLLp85CooBFwLyuap+1u50eZR+pDL4y3AQix8kHpLLfUoov+fasadsKHL0/au4eV
         31Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oqqz8ugD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a561975b09sor5961437f8f.2.2025.06.19.06.14.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oqqz8ugD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338897; x=1750943697; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5LZcCqNpH4GazYoT4HEePjvcf7hcAUKrr97H91/oS0=;
        b=oqqz8ugDhW9QPj0ZWaZPAMF4/bXC3+ksnYH6dq1iVwnq5hn3aTvC0Zhwj5PaErycpV
         eL0hOdYp0Vvvt4Mw4ZNX7f4+jlpqgtklQs+1v1oXY6MrqVpIrLIScbJGvrc9WcTf3qts
         ef3VA9OcJByPFy2PYyAeVdgWFz4CZNDbOl+C3nSbBUC9skkqlCk6DqU55gyWh4oricah
         OjHwoZx3AZN1WszEKeE6c6F6ySnyXpzXxnqgqjhIJhkJhus+0IVZmPPjIR5iy1ybUYiK
         p2F6UNC8XGlttTBBZgy+fMws4Dah60ZGU0o5fPAwUS539kCVxpzs+CRetREWrlaICOzy
         YBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338897; x=1750943697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5LZcCqNpH4GazYoT4HEePjvcf7hcAUKrr97H91/oS0=;
        b=QT4AYuoASk95YvdX83IZVzazIFhZO4J2QnAOmpVz6t1l+rTzXvj3Re1NwzoUJkegX7
         zZQ83jwjRVaz0uKEkke2DUix+MRYr/WZFuKuU0MmHQR5Mijrivmwy9jejcIoV2fI2MlJ
         ICRAPvJV3hWpSPUZ2+jP6kjevKBo185G6w20RpxVKNOGatu3EXY1/OQJbQTJSjkfsFix
         gehP/X1wksCOaBNETJPVEHBH5qxM1yEI3VySmZj4kT1ZsNW/spbOLm9WSnAXJnEw261P
         tsluQd1XBirjoKTv7qcGUOCu4A0tITyaAt5hnQ1xd7i26z9mUPfswFPZnTvidll4zb9e
         K26A==
X-Forwarded-Encrypted: i=1; AJvYcCV6vHPhUGRfZXoRYiy0RYkkNhy2T/bCVNHAKsVKK+nA/e6Nj9kdAuBork6PNFXct1yDlNay4b2yfMPDLQ==@linaro.org
X-Gm-Message-State: AOJu0YxwrXHuuRnEJpJ9f90ny29T4uCjs8R73lTw4KwLw4nqJsa+8uxW
	v1gi9TPO3A+1SQ5eKoIVS9q68Ih/oUW+1UH0/8dUAYYwddfGkya1V+BvOVvS0za/USKbvA==
X-Gm-Gg: ASbGncs3tLRF/RMx5X0DX1iPGiPTS5VBU6LXU0p9se7OagA6XNYocXiG6WxGy93gYvI
	xIJGOp7nf+uj7eqfT+5fZwVF0jeck17R2hqbvZk4ZDChdXe+smLJtpuY78s/GiJBeaU4xHQ8T1I
	Ox4B2BfVa2F7ZYC5fptVKhpNCCdEsMqFX2SXSRUYq8MXZ97A8y8oYbjdNre53rYzt/9t1Yq4olY
	3ICsDivaeZDW9u8ZnLzT4qtWqXmhTXhUxVf4tMttKF3BUW+jffvy5Qw1cVOw58ZrGXwb3zNWga+
	pYNsMtcx5YrE5P3S0vBarOlPH+dMeplGnKubAEjKNDsyWRNHXCwIoX1dyttLGnD7iL7Y4IkOiai
	Bc8wyFJjL7NIneAd0gEubeqZcLW6DFyN7F5dR
X-Google-Smtp-Source: AGHT+IGSPxsi1o1FNjNRdOKa4gLP4CvK5BiNLtp11Lll7xjWxOONtOoutqWpAjesn+xGjJ2lNdFzIQ==
X-Received: by 2002:a05:6000:65b:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3a588cf4d3cmr9235335f8f.48.1750338897594;
        Thu, 19 Jun 2025 06:14:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a6078csm19176121f8f.21.2025.06.19.06.14.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 18/20] hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
Date: Thu, 19 Jun 2025 15:13:17 +0200
Message-ID: <20250619131319.47301-19-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w3pIzKo+EaDH

QDev uses _post_init() during instance creation, before being
realized. Since here both vCPUs and GIC are REALIZED, rename
as virt_post_cpus_gic_realized() for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
