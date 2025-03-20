Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279110njc;
        Thu, 20 Mar 2025 15:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXPHBNwM/V9sZNG2aD9OToxKpLeyZEb4pOAgDhTvLFkTkpbj5kLNUHUs/pVQD152xxM6QPo7FqgBlAtg==@linaro.org
X-Received: by 2002:a17:902:f54a:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-22780e19646mr14645625ad.45.1742509836679;
        Thu, 20 Mar 2025 15:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509836; cv=none;
        d=google.com; s=arc-20240605;
        b=Mjs1HOtANgLnRfBoN73TagCZRbME5cWWCOLBpKVpLzbfH8z+6uEnE8mzIZAFqq25bh
         HHgBTN+Go24jO7sBXNA86Hd3wHlZ2VQ6IxRLa4nGe4jQiQf8pKHGEwIUBJCz4ed2SaaR
         cV5R7lQ6KINeVblNX3y6oUDRdb1h1NTQ7qgFROc2fYlUTv6d4DqL0Mdg+0PP/JMzoNBN
         1u1IvqbEeNn4a9wXK7dRTzr9gogS09Ng76zHlxVgUj6Ch1eJMUpKq7RZ2IVIytGvVYJk
         AToZOyS1CHQI0Pp+DOflYY7GfpruBaG5lGkhPLDJSkqqcWQqOArBjwXovEWcu9XUx5Fz
         fgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fL3ZYVUJJ3Fd0+aNoGxPeRJrA53EVcQamm5mrQ+p0v0=;
        fh=OipNoOQr6Lxhm3+kbdZdWxKhgB0BSd0zq64aQs0v/cE=;
        b=BFYGqH4X5J9K2r8pupsyx0Z6NuMok9vxo60sW1cyX+e7JcunVJEjXbq48gkxL08XG+
         /azBo/26xNxsFMPyNqQJO03SrG9Ly6IINHTZSoeE9JQfZkl44mXT/MpxgEaCbgt+CVuh
         I/M97ggTbMWynT97Su2E+XTeX3/jE4NNln005IkA7FZ/jrZB1rsbHuCaqGltEAlsyLwJ
         Hm6BFMc8WomvvrkC0Py0MrUVq7nqx1trYXuhERMc+gL30cvZi7/dkTprJeo491GU9/8r
         K4sAafDMZ1dAh5w6/YkIOe+ptrirCAZ/tyJC0qH9F9Nfm9nqLK5p5KT+Hv4zxyZ/YKBw
         TcNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BajJcC4A;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811df836sor3906205ad.17.2025.03.20.15.30.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BajJcC4A;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509836; x=1743114636; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL3ZYVUJJ3Fd0+aNoGxPeRJrA53EVcQamm5mrQ+p0v0=;
        b=BajJcC4AnSAwwT5X/SoB+HSS/Wyk0m8ICpXbwD+16tdFlBO1uJy52jwPeobnWEL1dZ
         D0ElnVqQWeQIrfVxbhwCQUT13X0/12o+8KNVqt2ts+ZNaP6fq1BANUYqcImuxi5VMwaB
         NtAUO9GzaF2Qap2W/+jmo3lBX0fW4hhG33wHJtMl2TLSI5SkHtgpKqDFtj6v6yJyKX7B
         IPVJiccVl0hbqgFDvXgeg/FrsWOqWQk9vI3HMXH5jwyU4BMyWnfbTCbN9anGxXPlosvl
         ISHSVj11IIt0PlBGPiSPYnBVPql5igozCPxXgCMA43zz039CjcijhjznitovYJz7wIXk
         1DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509836; x=1743114636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL3ZYVUJJ3Fd0+aNoGxPeRJrA53EVcQamm5mrQ+p0v0=;
        b=D42bsZqUtS8odeHXFIvs9JFrmaYkeqEzaSHLQVC4z1BI3oxMq7yBu8E1lIs9C/yaZ6
         +Bn15kX05+fJbuAZLVG6ijxaelbw8wyJTRJRbvQM2tb4FmcAYktpXE5kvt5iPvHH2cWb
         b+UtrzRISQTbbimJ70WRHtztgld/TXyw9ddKDVdUCPkEXSVMFcXG3VRzODLBtZkR+jP8
         SV0DXOiz+Mec4I6x9KPQh00EMQ2Se5JWr3LwJL+ECIx6idGxaGVPlhp+ARGKN7z4XrxA
         l3AH+RgrmyMk3jt3/W6/yeXSHMPaGm/06jnZIy8esNQIZbui3Jg4mHaQjEQNoQZuAU+o
         xDVw==
X-Forwarded-Encrypted: i=1; AJvYcCUDtVA6Ujdw2URj2FWynvLXimJzSorSHo4qdtE4b34EG6qny1XJ9qVvHxrEiokZyB8sZ7xsnhX6vmkrkw==@linaro.org
X-Gm-Message-State: AOJu0Yzi1v3XaPZ1v0ZtwOy5y7BRToUECojXLxtlunDMclY0O3N0l+Iq
	0VKuAnzr5FDuVUQbgmUVDPpifVwcxj3xlxmF/DeSTworvl66C2f1lqFT6T3dGOGh3g==
X-Gm-Gg: ASbGnctBERitxG1y74vsf9xM/Rj1X9pke/sFXStaDwrJx/P+d02iaVnCAKedglxDjRs
	CwmxEqUq6AZ1CF6q+A1PQ8U3EA2FMDj1haLPx3t7ffCF5+En37C9OUTIhUpobwYD47/NmQeAtiS
	3mGLj8uzHYskC3hUwHh5g6PsONIF6m9rvugvvN6z8Mx2D1Zi8ltwKxElDVsT02t13B9mejwal+S
	HmOfC+itmPM3VQwyAuFqCwvVxrikM0pRfc+4xxnCyP4B1vnmJx5IukhBRaoVwCbd2UViFcRwJMI
	aMwJJUyQ8rKj6tN+aQpg4dRkUg4c90XqQjrhY8YTHJt0
X-Google-Smtp-Source: AGHT+IFSTCeT7YVoPbAHuUe991xoUWlgfGrS/bDdF4/Ez/lU2sHP5ScxJ+1FSK8cU5+QipVe/utZzg==
X-Received: by 2002:a17:903:250:b0:223:635d:3e38 with SMTP id d9443c01a7336-22780c76135mr18937465ad.15.1742509836244;
        Thu, 20 Mar 2025 15:30:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 25/30] hw/arm/boot: make compilation unit hw common
Date: Thu, 20 Mar 2025 15:29:57 -0700
Message-Id: <20250320223002.2915728-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PT0sTlSN8mit

Now we eliminated poisoned identifiers from headers, this file can now
be compiled once for all arm targets.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/boot.c      | 1 +
 hw/arm/meson.build | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d3811b896fd..f94b940bc31 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -14,6 +14,7 @@
 #include <libfdt.h>
 #include "hw/arm/boot.h"
 #include "hw/arm/linux-boot-if.h"
+#include "cpu.h"
 #include "exec/target_page.h"
 #include "system/kvm.h"
 #include "system/tcg.h"
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index ac473ce7cda..9e8c96059eb 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,5 +1,5 @@
 arm_ss = ss.source_set()
-arm_ss.add(files('boot.c'))
+arm_common_ss = ss.source_set()
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
@@ -75,4 +75,7 @@ system_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 system_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 system_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
+arm_common_ss.add(fdt, files('boot.c'))
+
 hw_arch += {'arm': arm_ss}
+hw_common_arch += {'arm': arm_common_ss}
-- 
2.39.5
