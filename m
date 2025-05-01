Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19493njj;
        Wed, 30 Apr 2025 23:23:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPghTZ/MAnZULfo2uuuOZ6s0WMvmtJD6R6rqraQa9NeJRTLFGJ7rte6/OFjK8q+lYgA1R/llZn2EUHUw==@linaro.org
X-Received: by 2002:a05:6a00:a06:b0:73e:359:1c86 with SMTP id d2e1a72fcca58-7403a807e58mr9245200b3a.18.1746080634522;
        Wed, 30 Apr 2025 23:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080634; cv=none;
        d=google.com; s=arc-20240605;
        b=IktTBosXud8nTzIgkO4xMgDwiLR15o8QqICgmZL9Safs3YRBw/4EZkVqj4loi4c21y
         Ob2cSnNRAm77TbGlwLHzbzaxgv2pHr7mCT0CtxJYzICpymDUYGmAfhv+HYU5PXHpg7aT
         lhsUxw3Z0Q/sXAT9Hwpn+a7ueR82ATLx8korIhc3hZa+BZ3O1IGyawKRyv5XCEFJImSZ
         d7k6K57xUn7FC5jx/69fGYJqN+AlJ0UpMUEon8bqAWo6NQsddh9QyYPptGdVsSQD7tdN
         retED3DQvhjod+cs/H1AajN3Wz5lq/Psbld0VmubxGRZ5a5nj2D9WpyGsw2PU7xQAoKe
         ND0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wRQcX2zj5rKRmJl38W94XdQVe0UW4OEH2J5EM4DWdNo=;
        fh=LkB+1BzcmNqHV4p36Ba/fmVdpBxhlt4aU+8xZEPy9aQ=;
        b=e8ogEk/jiAPC3+TvWJ30rvwjkQdoX0QXd8Y1AG3nPmWFcnEYx6i2EhyLAkIu4O/JFX
         SR2ua2QRFDYC6WzDXI0uPRWWzO1Lrr7EY0SWD3jKJ8Zr3S03bh074fSycRMinCmntKaB
         lMjIcpbuUJwwTDJ3H4P1Ne3k7Otk+DQfH8ZMJvK1lsP21efv3dmGpClJQ3130QzLRG7K
         Vngq7CrOHaoeeq6+BJaQGrURhTGR0eVvKIOqDEy5Goja617Fx8w84z2A47c/8yQu5JLB
         hSsXapGLJLGNyOmuq+wZfNukajZm3rLN939a9P8od/0Qo5NieshX/ekDmfGCbcXsU+hD
         W0Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sVekWkQC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5ab6casor127383b3a.0.2025.04.30.23.23.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sVekWkQC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080634; x=1746685434; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRQcX2zj5rKRmJl38W94XdQVe0UW4OEH2J5EM4DWdNo=;
        b=sVekWkQCbEeSUGx0XSXFxDKrpVokThkm13N9ZFt2VVR06WCsyG0zBvU9ctX6xh3NAo
         ZUAQLwqDMWF1+HQ5DixlQHB7AihH/stqgBNzQnMXeCeWpcctgypfkJ+Bm0r5RBnu6xfl
         ospE4nYszoWV1TeCp5ah+9fmMbPPnS+dvfLKzUQYEsLt5Jeh1uoZPNc8W3IxyQ8cYwgH
         6Zq4euQgBHghGxVrMbi7wSDD7cDbdXlAvvYpTcdGsudho4HxNEMc3LrJyD8fvYJkPEQX
         v3g5bstsI0vxXqA/BuwVexI+WMsk1pnIKb+++VOyq8FMe4zspICem/P5+kb4h7+kcQX3
         DL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080634; x=1746685434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRQcX2zj5rKRmJl38W94XdQVe0UW4OEH2J5EM4DWdNo=;
        b=KPsvsRCXeHavBZ0AAhYpqSeIAkLJazo5W+RmfaZ4jtZ5ziqGgTusrTKb0jBlUbdMMg
         O7oks3rBWVPfaBERMHaRdsLA1nACH9GmxQb/s6VFWfKjJQrADQJXjD/Mg/fPuq5JlSjB
         YIc2s/prnYtUXC0IDM8OwKIo+2ZuhbpODvHf23YdDgUz8GxnkiUtMkjBbfSnN+lAnUbB
         dQ9wlEUxcolIiEUS1ccwgC6Lp3VBE/9rQAW0lanhA6KYpt2u+lZpg8c1YIaOE/AlyZZy
         RW+0QT0N4V2ikPYHfFsREZ3bh6b6LHEqUCti61p5PE8Tug0ITQO+z+TlQKgBkJAWT7t/
         kFvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6HVakuVMf/ufRSulajH5L/vTQ4KqCYA81roQ8HOuVTTaKNpbDnfr+weNlnmkDjIPbwLDU/DNn3HGB+g==@linaro.org
X-Gm-Message-State: AOJu0YzAchq7MDpNcPMFk8AEkuDQhfjdaMaIJpVEj87E7nhHlfVhszMQ
	VML6UmoDV0Ijva2tdwRZB2QQUVXhKP/Ls1+LkfGO7vToGUmNptS/0rPQ/MU6i+lpgg==
X-Gm-Gg: ASbGncs4A3GC4DscblosZwxlByhNdT/BeHhyVmGpP6Hfu72PqGHXOfrHDJwtxZ4+FIV
	lzCBeuc3QkUmbx1x3+MsM/UhCrJbQE88kuYx/FQsskX3i2A42sK7+clOsa3MEm9KGnrg5TWOXNz
	c7kNA/zhfa4Du8I70JTzJg3tTOV0a/U3ltDl+Gam0ynlJOqwcyoZj+rQKMV/Osc9M0Vq/9W6AtN
	PSRva53jQsha20eP74Fwtpcqu/TWhWDfH0dZqT/ovU78icGpLTlOC3GpgOvKGZTxcGP6sTGBmoL
	G20XymSEFanByFpxaIQDPxJiIp8oG6q3K43qt+rT
X-Google-Smtp-Source: AGHT+IHKWHJJEyntNtUOURmqxwObv8CnYTNyX1sITXamA4/jKCZTWAekB5bBp7ZEISulZ7JhHIow3Q==
X-Received: by 2002:a05:6a21:1788:b0:1f5:837b:1868 with SMTP id adf61e73a8af0-20aa4380499mr9068562637.29.1746080634113;
        Wed, 30 Apr 2025 23:23:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:53 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 03/33] meson: add common libs for target and target_system
Date: Wed, 30 Apr 2025 23:23:14 -0700
Message-ID: <20250501062344.2526061-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: he8RK1PMk7qr

Following what we did for hw/, we need target specific common libraries
for target. We need 2 different libraries:
- code common to a base architecture
- system code common to a base architecture

For user code, it can stay compiled per target for now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 meson.build | 78 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 17 deletions(-)

diff --git a/meson.build b/meson.build
index 68d36ac140f..7b2cf3cd7d1 100644
--- a/meson.build
+++ b/meson.build
@@ -3684,6 +3684,8 @@ target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
 hw_common_arch = {}
+target_common_arch = {}
+target_common_system_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4087,29 +4089,59 @@ common_all = static_library('common',
 
 # construct common libraries per base architecture
 hw_common_arch_libs = {}
+target_common_arch_libs = {}
+target_common_system_arch_libs = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_base_arch = config_target['TARGET_BASE_ARCH']
+  target_inc = [include_directories('target' / target_base_arch)]
+  inc = [common_user_inc + target_inc]
 
-  # check if already generated
-  if target_base_arch in hw_common_arch_libs
-    continue
-  endif
+  # prevent common code to access cpu compile time definition,
+  # but still allow access to cpu.h
+  target_c_args = ['-DCPU_DEFS_H']
+  target_system_c_args = target_c_args + ['-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU']
 
   if target_base_arch in hw_common_arch
-    target_inc = [include_directories('target' / target_base_arch)]
-    src = hw_common_arch[target_base_arch]
-    lib = static_library(
-      'hw_' + target_base_arch,
-      build_by_default: false,
-      sources: src.all_sources() + genh,
-      include_directories: common_user_inc + target_inc,
-      implicit_include_directories: false,
-      # prevent common code to access cpu compile time
-      # definition, but still allow access to cpu.h
-      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],
-      dependencies: src.all_dependencies())
-    hw_common_arch_libs += {target_base_arch: lib}
+    if target_base_arch not in hw_common_arch_libs
+      src = hw_common_arch[target_base_arch]
+      lib = static_library(
+        'hw_' + target_base_arch,
+        build_by_default: false,
+        sources: src.all_sources() + genh,
+        include_directories: inc,
+        c_args: target_system_c_args,
+        dependencies: src.all_dependencies())
+      hw_common_arch_libs += {target_base_arch: lib}
+    endif
+  endif
+
+  if target_base_arch in target_common_arch
+    if target_base_arch not in target_common_arch_libs
+      src = target_common_arch[target_base_arch]
+      lib = static_library(
+        'target_' + target_base_arch,
+        build_by_default: false,
+        sources: src.all_sources() + genh,
+        include_directories: inc,
+        c_args: target_c_args,
+        dependencies: src.all_dependencies())
+      target_common_arch_libs += {target_base_arch: lib}
+    endif
+  endif
+
+  if target_base_arch in target_common_system_arch
+    if target_base_arch not in target_common_system_arch_libs
+      src = target_common_system_arch[target_base_arch]
+      lib = static_library(
+        'target_system_' + target_base_arch,
+        build_by_default: false,
+        sources: src.all_sources() + genh,
+        include_directories: inc,
+        c_args: target_system_c_args,
+        dependencies: src.all_dependencies())
+      target_common_system_arch_libs += {target_base_arch: lib}
+    endif
   endif
 endforeach
 
@@ -4282,12 +4314,24 @@ foreach target : target_dirs
   target_common = common_ss.apply(config_target, strict: false)
   objects = [common_all.extract_objects(target_common.sources())]
   arch_deps += target_common.dependencies()
+  if target_base_arch in target_common_arch_libs
+    src = target_common_arch[target_base_arch].apply(config_target, strict: false)
+    lib = target_common_arch_libs[target_base_arch]
+    objects += lib.extract_objects(src.sources())
+    arch_deps += src.dependencies()
+  endif
   if target_type == 'system' and target_base_arch in hw_common_arch_libs
     src = hw_common_arch[target_base_arch].apply(config_target, strict: false)
     lib = hw_common_arch_libs[target_base_arch]
     objects += lib.extract_objects(src.sources())
     arch_deps += src.dependencies()
   endif
+  if target_type == 'system' and target_base_arch in target_common_system_arch_libs
+    src = target_common_system_arch[target_base_arch].apply(config_target, strict: false)
+    lib = target_common_system_arch_libs[target_base_arch]
+    objects += lib.extract_objects(src.sources())
+    arch_deps += src.dependencies()
+  endif
 
   target_specific = specific_ss.apply(config_target, strict: false)
   arch_srcs += target_specific.sources()
-- 
2.47.2
