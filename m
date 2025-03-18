Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694647njb;
        Mon, 17 Mar 2025 21:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhOQJ6EafWJWT+rqrllWhIRTRoWyf0GYhDTv5cEpN5qQ5dJfxa3rsLsCOzQ2N9rknIGr/Hm7eweq8KPg==@linaro.org
X-Received: by 2002:a05:6a00:2e84:b0:736:476b:fccc with SMTP id d2e1a72fcca58-737577c60dcmr3222789b3a.8.1742273505810;
        Mon, 17 Mar 2025 21:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273505; cv=none;
        d=google.com; s=arc-20240605;
        b=UkLcVnY0coFsAPyy7Cz954MAmMdmyY7ioluVGcHG/9Jiw3dJ2c6k8d1y4WfFbemq6M
         +cXMQUGyO0DvY1M14Rh2nn0S+mNBpxp9aWp3KvZtaGdWIKi1QfsDmmk6UN7mKRF6AxqX
         trmQCycgcq3/dbgBGZa4Zd7dBzO+LoXfHwZ576kwcRZXGVbUUOSMQVhE5rZQCEM5BDRy
         ayxqn/OnUMntUnUjYwnkLEYJNkIa/5aFyr3fkuO2MxQhIwSiOGMv9JqXaUboMN09vmxw
         1o/oGxgHKri/UuLE4r1azVdwxUnKmwZazyFi3a0bWxhVfeh9xAr6zGb2OIKxNEBweJVi
         p0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TJs8jpuU5VHY7crNqDB8k9WdWD2PL+VSpwoAKAzM9C8=;
        fh=u/VsTlvX1PcfxzNAVIQiDT8to84oRjYUGqzL1MLWE8Q=;
        b=T0EiyKo05YrsgJxYa1kbFMdpwidCvGBkj2FaZQHrSKTCt/3GGbdgRSZjDMYtWRfexH
         rjfvmI26zpUVRLG9jafkhFsipGdA75B8gg7IxTwgt9GzFeMc2QAOaXvav0A/cBFnaWiR
         ODGYYOsd0zxvU1DY80q/JYwsmKC7JpbKRAZ18C9ioSgND/K/F4Rbie315soxNOI47QQD
         XNbiLOF8tvd2r+fzdhl0oOf0QAc36bdbz9OlQ7anH2+6aT4GZaQ5I3xiHorrY8U4ODlh
         SmHJJcId1yqMw3qpyz9Vn/UYcF3njICDCA7ItwHKhIWp0MWXm4K8Ij5ShQNAcTE1jSfy
         O5Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JV2pM+1f;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73711525dd1sor5434868b3a.1.2025.03.17.21.51.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JV2pM+1f;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273505; x=1742878305; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJs8jpuU5VHY7crNqDB8k9WdWD2PL+VSpwoAKAzM9C8=;
        b=JV2pM+1fH46r+AayEIOnNV/K1Q1H8Urm36UM+2Budh+0hTd7555HzsGnSQzzvwJRzJ
         jiI24VwCLOMrALJDgLEXG6oxzwyKquHce2PdZMV/C/LyR1r9QyvBol2d3EeXsEigsVH9
         8XiBQKLFiugVTLZXS1S0VGVzcK8oDWnGl8lNpJdcAjqqwzhG/Mk+kY6qE0qgWEE9FV03
         SM0FU7wtI5yVDx21K0KQ4AxH+MOFU6jdKQFD60aT1di0+s0dONv5XBAussmpNE/WmE73
         V8tZjwmRkU9/t83JjyRZv6BcwIIn1cajEZt5GAJZRTVHkZKwwCQf427pG7Sz0kbwZja1
         /LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273505; x=1742878305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJs8jpuU5VHY7crNqDB8k9WdWD2PL+VSpwoAKAzM9C8=;
        b=siFgtUxMDtmnubk7gXrI+AgczrnB/Q9sJtFaBs3VcV7fszX9T0usBfBAd9mXWjBIUO
         SrMNIN0ZbUmR8ISq28nksRjxRXDZ8OAgagwUvGjN4jbnPuZlMrPG2mE169jRO9gcVBwh
         DutABlraZMAUvOdUcdmu2twzu2VHBwGG6JrH3t0nIhx0+ErvZh+s4VdtaIhS4ZFWwi6h
         VmBV7MrC26Op8OONcXDx0syssLw6AeYTRwiopKSfj693SI4Ulv+vcZVB7R+/0RiJ48M3
         TT0lC6kf9H33gCzHue0F9gTwdBVF/Bo21gqG8kpIOZxb/gsXI7gV+IjD64q8Vsn5DqjZ
         4+NA==
X-Forwarded-Encrypted: i=1; AJvYcCUaLNPxZ5qkn9F3s+G+06BMRxeRhPYG0ZI2N3w02gk/3UElfZkO1OM3E9O/TgnxqMDhnLeJXz5sMWDpCA==@linaro.org
X-Gm-Message-State: AOJu0YwCioJeTDuz2ekweQJY5+Whb6CYm+ifTA7MUIJx0o4bgJ5WHHMv
	ki14GBm0AWjX4L7SLPcyH4NwPASy0rimGLdBd4eFve32TSp/FNw81WTL0oHKQ+t2Qw==
X-Gm-Gg: ASbGncukzGIZG/c1CyTA3oEBnjE4rm3aE3GunjcnYXgPPQal/oLji1dm9Onkg9isApj
	NZQ+xpf4YpG3V9SmMoX28uoeZf/ClTLpAv65n4Yzwzg2NyD5y5Xt5whgraRfhbamSqTAyLv0W9z
	BIbG1zFnXgVH4de/8Dkgm8tz8qloWR4rUDhzQiyrc3jWxGfCJtYpNdo+c59SAF7yL7b2YO2mGIE
	WwJv6POqyRRrT3fwov8p9SIzHlasBNrvVV34Z6a6m8IFlsI8rEEGJMZ/cyQWI6U9aDU+BZOAkWa
	WmJIRMGtAr9mULFAAkWyRaRSmgIymsl+qkeZj3lk/K8G2pSwfA0/1Ks=
X-Google-Smtp-Source: AGHT+IHEmBiDYdH8DpN4X2712XG3vEXoAh58XN6VBOwchF+ihZ4rs3b8Wb2Qrcz+iN/AtHC1fq47cw==
X-Received: by 2002:a05:6a21:1fc1:b0:1ee:a410:4aa5 with SMTP id adf61e73a8af0-1fa50bd891emr2581469637.17.1742273505380;
        Mon, 17 Mar 2025 21:51:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 13/13] hw/arm/boot: make compilation unit hw common
Date: Mon, 17 Mar 2025 21:51:25 -0700
Message-Id: <20250318045125.759259-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: umrQVLYHzbr3

Now we eliminated poisoned identifiers from headers, this file can now
be compiled once for all arm targets.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/boot.c      | 1 +
 hw/arm/meson.build | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e296b62fa12..639f737aefe 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -23,6 +23,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "system/device_tree.h"
+#include "target/arm/cpu.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
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
