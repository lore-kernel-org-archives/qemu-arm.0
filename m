Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509591dyb;
        Mon, 23 Jun 2025 05:19:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvhBwh9+H4HxYrV4jMt0Zd78Br9VvcS1UwwdmyFCkLPaeIuBKvB8eL2OQ8fjd0oA0gkc4o9gdvn+erBA==@linaro.org
X-Received: by 2002:a05:600c:1992:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-453660520aemr133807545e9.15.1750681174531;
        Mon, 23 Jun 2025 05:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681174; cv=none;
        d=google.com; s=arc-20240605;
        b=M+zH10VF1FfaPtnlaRMBxjkEnT+h2WJQAEAxCP0FQO6uOrUTHRESmoAukCwsd3yheM
         4vwL0xttqoX44MDVO7nOx/4ME+xWhji0URdjL8BWqqF1WbVSzOit6Eh16AF7owrhX7cT
         oxjAGkdAUCNzjIHyzXWE7KUZwDpuuqukwKskADIdWrLlABWSp9go5Uv4nx6m24cCMToj
         QEpavyBiyqh/+BY3tVvOqzAYsBow+1mdqvNTd0lBOltDg1JiE7dtrrcqZmtsI0oqX2sI
         JGsgArmOkr+5ymDGMUgT1mK1CBd59FCBajdcZT5Cw4raJUG5nVhOX+GXOHfJ2pdgS9hx
         JHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MgoMlu6luU8uPkDpvUPvEjZTODhHkmT/W4wpYdZo59E=;
        fh=Rf4YXGm9DdD3cEBzL7kDCcgoAHlVK0ecPKgyMw8jrLY=;
        b=LmMe/Cdlcb3I/4hxC5TuO7J2BhOj2GSOIHwvAD+Vs+j+U+igYZskMojF3fE4CEX/b/
         qoELSG8xSUbTrq/pkhDlLaeyiL0euF0M1Z5OyJmPuCSDfIW3Evi1hGy6jjifmMJGFuKx
         u+DwZ+N1Gi7h0UTDt7Ca3Xh4KJM2tAl+4cLa+2tZltANoJzhn2/2LBcV8i9IHZZPz9IJ
         PM+UANZHIY/6ZeiE2WmGXl63xt0MOvP4Wa3xWr/FQy9KmCIhu6b5qwgMnLvwVUSAdgEN
         9LpRpPq4yrNx3Yn5rx5T5ByVzZoWQSjNs2wMmX3RwtRYIIEnv+lVlnTXcqTLEZg5JEhN
         DzKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htJ2tz59;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45365af83f5sor22803295e9.7.2025.06.23.05.19.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htJ2tz59;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681174; x=1751285974; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgoMlu6luU8uPkDpvUPvEjZTODhHkmT/W4wpYdZo59E=;
        b=htJ2tz59+o0hhqGXZZYJIjvg3JXpvG7+YrGQatiUQj+AYkN/YYOlbmGDvJ+Ham+blg
         n+x/SKS23j7q0nfAcDFtXlJWjJa/t6zI/oEOBwDsU84zk7IepjtREjm3NI3TYIeuWhmw
         vQAYaZLSy3YRkErZofAdjXdfKNFqKmBXafNnOeo5UYVTnBcVs137tE4OUV/06VUnoXok
         AgBE1PAOyBRTxa/B7Tjl8wSQMITD0ltSLTVgnPMGXFp7ZVobk5UdJaLiiZaCrtSKr9wG
         /aa0T/YHHjp2mI5amIgMEHRmrV6pjaGewcGndFdztMNtN+a97hv3JCU4ux+ZBGV8vt+/
         u+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681174; x=1751285974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgoMlu6luU8uPkDpvUPvEjZTODhHkmT/W4wpYdZo59E=;
        b=hLPyNFj3UcizW7GiYL0/RkfFZEWqiYZIzISnCLf1ZA6M5vIQYH+7B/uCGdIcIWiZHK
         WevUsGaEzdy9kzjd7fmXbddlEInzG/kzJkWxRLJa0DKbK3DIK7R/kKMb9BbweOR1lq+o
         QBodyEXh4WwUX7EIUSg1TLHdzJ2lXQpXyuzMo/Bx2Ci2vjUjajVu+W3UPh+YiUDhH+Ae
         6o5E07lWsoA/wcyHVJRcH99r5GEGUiB7Tov1tHp4vIaT2pbEZuk9ffegi1GCu1ELghpm
         DN0jG2rpHQGVDEuuhU3sfVdydcqriGJQ3km701enqSe1mHSiXxzoZzJczZ2mVzT3Lrgm
         p4gA==
X-Forwarded-Encrypted: i=1; AJvYcCXgSJuR5r3ThHOeEpZswtbOTgOERyIo4X7p2WpmFXFcnDKtVY+fE4fFZcDHLDP4KWSaGbn90509FK3ikg==@linaro.org
X-Gm-Message-State: AOJu0YwzT3Vsn0hFbT4UwPMRXETkFqEDpGwKOUJjnoaaMLYL8fpK/ijB
	PMip6bkV1cwfeD+oD7OBtjuISiXCamf+3HeFDxZUJ76Wur2AVB3f1wizfK7TePMoPuMkng==
X-Gm-Gg: ASbGncvvCEXYnvG3qK08f1PH4XJWOiYztQIKE1X6zbR3YBYpUJemgyLYpKzNsHIFJeY
	2fP4J4Q92cq1IbBzFEqLYd262JrYbxmZydFRytiqMJjJIVu5xtMHr40mrpTmQQ/Cb1E0zIDmYuw
	RlF71ZZUxBT/peUcOOG6+L/PU+BnhiOPgKY8wBT/MRs937umxTDRjxbxD63ll+euIFPWsFM5LU1
	b74jOhGhLuO0TiRBVEBQH6ncD5Nu8vSy74wUTvJ5py1x1G2nPOOzeoL7NdF2Ttw+thtG3DHL4JH
	RPRYGrEIrfV8zEVIwAVESMSHvjzsSZf5cIVSDLPMljUDqgNMmZ9zG4kc6zm0gIX40AIIxdXFQJy
	yNggaNweE3giTEKHPyKKxTclh+JpqvzAnkfen
X-Google-Smtp-Source: AGHT+IH5nN0Buqju33OA312k0qD0vKiMOH8kEulBGzTvtfmPtg2jIEiKfCSnA60Z3UW/VHNqpVWLLw==
X-Received: by 2002:a5d:584c:0:b0:3a4:e6bb:2d32 with SMTP id ffacd0b85a97d-3a6d12a2416mr9606493f8f.22.1750681173855;
        Mon, 23 Jun 2025 05:19:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1054bsm9217868f8f.9.2025.06.23.05.19.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:33 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v3 09/26] target/arm: Correct KVM & HVF dtb_compatible value
Date: Mon, 23 Jun 2025 14:18:28 +0200
Message-ID: <20250623121845.7214-10-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aUnSgArDK8qr

Linux kernel knows how to parse "arm,armv8", not "arm,arm-v8".

See arch/arm64/boot/dts/foundation-v8.dts:

  https://github.com/torvalds/linux/commit/90556ca1ebdd

Cc: qemu-stable@nongnu.org
Fixes: 26861c7ce06 ("target-arm: Add minimal KVM AArch64 support")
Fixes: 585df85efea ("hvf: arm: Implement -cpu host")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 2 +-
 target/arm/kvm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d4c58516e8b..bf59b17dcb9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -879,7 +879,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_exit_t *exit;
     int i;
 
-    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->dtb_compatible = "arm,armv8";
     ahcf->features = (1ULL << ARM_FEATURE_V8) |
                      (1ULL << ARM_FEATURE_NEON) |
                      (1ULL << ARM_FEATURE_AARCH64) |
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 74fda8b8090..9a1b031556a 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -266,7 +266,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     ahcf->target = init.target;
-    ahcf->dtb_compatible = "arm,arm-v8";
+    ahcf->dtb_compatible = "arm,armv8";
 
     err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
                          ARM64_SYS_REG(3, 0, 0, 4, 0));
-- 
2.49.0
