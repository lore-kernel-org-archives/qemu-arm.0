Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397132njc;
        Mon, 24 Mar 2025 21:59:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC0yXcG9ztILxiu/m0W3KKIwdMYanDufqvWpI/S/t80FNBDZs1hbKomJRaLNP5Fpo+oZtJEjpAqzACRQ==@linaro.org
X-Received: by 2002:a17:90b:4d08:b0:2fe:ac91:4667 with SMTP id 98e67ed59e1d1-3030ff06de7mr20355204a91.29.1742878784343;
        Mon, 24 Mar 2025 21:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878784; cv=none;
        d=google.com; s=arc-20240605;
        b=BvyuOKILKfjg/GY4V0zkORHw5tlDApaDgPKh6XOHIHuoLjVrjhCMMI1TU6rKXLbVFN
         SBXiFqKsR9Hwv3cJtSO37RIpO79UbWASvUjxk4VgsxO1F8DH1yD5cZ1HWST6VlRO0RbC
         VSo16rdqX89nXTPs1wt7Kc1jpFGGj+mqD97VAvJ19tVKZ4KcQbcWsvemgmeMT6l3LZpi
         dDUZk+Ut5Dmg703J3KyI4JCxh4ApLAWTbN+LLCTQE9fE0oE3r0SzAkfQpW2SVHr8er1Z
         eb7THYUXx+a++g1oKwCuyNeHgwYwNRwwU1DqCTwM9vjU26KLtV6f9XI4Vv6T6kaatVm2
         nK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kI6HALsdQGcYyIHmM8Ppnw0EYvYwjf9AgyEFGP9MumA=;
        fh=zU5vjQieqS16A/PGkV8MA2KJBItIVaKAacAHdduybUI=;
        b=CtcaH+rfjdkw1SfrfqGJcdn9hAo6Uj3NyvWmkRmJ90oVVuRpWgQvk4HjogJhZd6WsO
         CD+zF1GjFEyJoLTuNovmQNAlMj6tv24FwDyjDa8CjdfzsG399sPGRyZkxdX86Vw/g9Ie
         D2fJ2XvNeDfJ7hVEZ848/sUf4S92Lzy5aoaI2RREkGAC+tRmKdLFPWTxlYShKVpU+jMM
         NJog8H/xZMWBc/mzAI1f9ZCdLpMoFAj3Be+PZJhtg6XC8jrB2D0AHoD9VYyfCXkVpVAU
         BdEF29hcobV+EJsXnNi/z1YVD1kcRhzpurOKpxzbjKUA/Q87B8cMHTRn8IktXCJaGB5x
         FnGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E66+5nnY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f66f2b2sor7035057a91.4.2025.03.24.21.59.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E66+5nnY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878784; x=1743483584; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI6HALsdQGcYyIHmM8Ppnw0EYvYwjf9AgyEFGP9MumA=;
        b=E66+5nnYTAj79BqapS8fsSwmRLZ+5Sxg+v3KBPykUX5IqTvACU8ekpzTD4aac1D+q5
         AwEjPxjM7JlZP0+uoDGElX4dTE3qLfWFxhyw4/+v+lzx39mTELWG/bmVvr6UeOmpWTRY
         blDsYJ+oFfACnUkmxYXExFTn5AWAbEO6EUWwinTUDu7uu3a9M607/qRyLVgct+S6D+Gv
         KaGyZN+V0J+9ZlvoXEQCsIe9SzMIR+qglvsg4dwzmvl0u6MLBu1xS3e00NjywPw5oI6l
         e7ognih4EcgQ4gcGImn6Wk48ZzcT8bVa7JZvQNSSRu/QuDSYAFoj9F3lHo7S9IG6jyfx
         zIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878784; x=1743483584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kI6HALsdQGcYyIHmM8Ppnw0EYvYwjf9AgyEFGP9MumA=;
        b=k7U5DUJjmJwuoGb6iar/4FU8iHNJOxjK1GfrDfNASOm6gSYazdRD6MA3wt59luXLZZ
         Zo/OHE7ZGYSyuILk5w3trhukfTRe0Syo6ABtCtGEseQDWlN1EnnTUs9cPastkwIHa5j0
         fKm3xGk+i6yEmDD8ju2TBMEc2NelJLoYKcj+4BvtG2TM4/qngQNYs0dw6UEuRvGJ1aVq
         OsuYgglzgwZ1j+Yes0vQb6tkW6d3qsRIFTRAqTV6qxdNe91P6sOak3MC8YdIAVXyDWAy
         nxRZ9EqxLsDcPfoMDDF8xcaU0up3hNlaZixpNUgYpVRc0m832M64XQt0b4G82ezSnKbM
         nQRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv4PdLAHMQtM112KHX5bjg2JRoZktFWVc4m6+vN9M8b3Kd+7yezZQQAVlZ/xjyqK+EwMMbii32Zs/4VA==@linaro.org
X-Gm-Message-State: AOJu0YxFwxEnEbgz+ZBOI8ErRQ/Y+qXY3hJD6sCwzQMJAwRVtkuF2+uQ
	ZsUiCImP6ClpArfhTZ57tFl4EK5bCV6ahQk00FkQnzyLPrXjSZlhekuHeiWRur07Qw==
X-Gm-Gg: ASbGncu7j99DaYme8q1ojY+jPkxPsBji1vhAvTmI1ue8gev2P4ea8NOXYa3kl9ylpzD
	7qioPT3pAOpVVspFoz4yWqVy7yS1UN7xL77/FQ+ZcHf9KFYanLuHGf/hSYbFIzUaApsWnhOdQOK
	RWs2FN1TFOxIHtQlXdYBMNnIH8senkV+EkAoNzAbTPPRgAlhu3+FOt8TjyA4ccmd9Z8FHzvfS35
	IG3p8Ucf9xnHgmVZL8joAWqqwLgyWioU3T0wtZ7y8Xg6p0g5/INX7cYKg7wAAnvZ5WyXNo4x9fU
	ow1Wi7rpVdIpFvGhJRkN7E27kwOIFweGbtotEzLL18t5
X-Google-Smtp-Source: AGHT+IEViWj0HXthzkisCL6XXxnNrY9f+XJAj3XYkE+svRDw8yixLHab1+2GgLUvE4lRjRG8yLIalg==
X-Received: by 2002:a17:90b:3847:b0:2ff:79ca:24b7 with SMTP id 98e67ed59e1d1-3030fe9804emr16981073a91.21.1742878783768;
        Mon, 24 Mar 2025 21:59:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:43 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 23/29] meson: add common hw files
Date: Mon, 24 Mar 2025 21:59:08 -0700
Message-Id: <20250325045915.994760-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PdrL0XKyOLUG

Those files will be compiled once per base architecture ("arm" in this
case), instead of being compiled for every variant/bitness of
architecture.

We make sure to not include target cpu definitions (exec/cpu-defs.h) by
defining header guard directly. This way, a given compilation unit can
access a specific cpu definition, but not access to compile time defines
associated.

Previous commits took care to clean up some headers to not rely on
cpu-defs.h content.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 meson.build | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index c21974020dd..994d3e5d536 100644
--- a/meson.build
+++ b/meson.build
@@ -3691,6 +3691,7 @@ hw_arch = {}
 target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
+hw_common_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4089,6 +4090,34 @@ common_all = static_library('common',
                             implicit_include_directories: false,
                             dependencies: common_ss.all_dependencies())
 
+# construct common libraries per base architecture
+hw_common_arch_libs = {}
+foreach target : target_dirs
+  config_target = config_target_mak[target]
+  target_base_arch = config_target['TARGET_BASE_ARCH']
+
+  # check if already generated
+  if target_base_arch in hw_common_arch_libs
+    continue
+  endif
+
+  if target_base_arch in hw_common_arch
+    target_inc = [include_directories('target' / target_base_arch)]
+    src = hw_common_arch[target_base_arch]
+    lib = static_library(
+      'hw_' + target_base_arch,
+      build_by_default: false,
+      sources: src.all_sources() + genh,
+      include_directories: common_user_inc + target_inc,
+      implicit_include_directories: false,
+      # prevent common code to access cpu compile time
+      # definition, but still allow access to cpu.h
+      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
+      dependencies: src.all_dependencies())
+    hw_common_arch_libs += {target_base_arch: lib}
+  endif
+endforeach
+
 if have_rust
   # We would like to use --generate-cstr, but it is only available
   # starting with bindgen 0.66.0.  The oldest supported versions
@@ -4254,8 +4283,14 @@ foreach target : target_dirs
   arch_deps += t.dependencies()
 
   target_common = common_ss.apply(config_target, strict: false)
-  objects = common_all.extract_objects(target_common.sources())
+  objects = [common_all.extract_objects(target_common.sources())]
   arch_deps += target_common.dependencies()
+  if target_type == 'system' and target_base_arch in hw_common_arch_libs
+    src = hw_common_arch[target_base_arch].apply(config_target, strict: false)
+    lib = hw_common_arch_libs[target_base_arch]
+    objects += lib.extract_objects(src.sources())
+    arch_deps += src.dependencies()
+  endif
 
   target_specific = specific_ss.apply(config_target, strict: false)
   arch_srcs += target_specific.sources()
-- 
2.39.5
