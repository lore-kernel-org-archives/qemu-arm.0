Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778142njj;
        Mon, 5 May 2025 16:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ283cP2QHT+8sV6dLqLDhDXCBZiHBEmW9SDgztV4CBAiV/1D39euJsLM79sMHNH/SlEu79I1UdrGUtw==@linaro.org
X-Received: by 2002:a17:902:f551:b0:223:501c:7581 with SMTP id d9443c01a7336-22e35fdffb4mr10284445ad.16.1746487223800;
        Mon, 05 May 2025 16:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487223; cv=none;
        d=google.com; s=arc-20240605;
        b=T6LMNRBuFcYmXuwG9s9O49D/iXLEfD/T+QzM7MiCHSY0KJEXxsAPawMZAmbd8yzDg2
         oxMVMMy59TEk1qItOMSDT7UTFhiXHwS/0JrkSQjLZgnXjJ1PSmzMiIFNchnR+y79qCbW
         yqKqzOUwGAR5lVHnUwUPWRGdwYuAJEZgSgvxJ86Re31nEQEhqTAF7gsD8xziKi14hmWq
         lrmi1mMVdM9SbJ8poDErTMRrO9zUmLmErtkNgXbNpW0NRXYzZnw0q2DfQju1F3s0xrB8
         hXS7709m/B7MipJWePTG8Cabev9jm/dbRlwwrJIlzQRP1OHi1hCAE8J2kQhksHDuoEJ3
         SYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1mHjwLOmCSZb7+SiNUT87VRUe5PiKHdCHDdwE+42+GQ=;
        fh=Fzc2VfLI5yjftUehFKQEN/YogPMTU3QlHKPk9QY1kE8=;
        b=JtHdT3vB9B5B9eueyyeNvir6sOz0DwZW0vIcX07pVD8L1y7BtK9WLnne4OYRoPOaDu
         NpK4o5yT3LWjtDRX8eTcaA4sOaHQuZQVGsdiNAcQADnb6VEDl6G4EOZKpBf7ov1I5VZA
         ZL5Yi4LIme9qyqoRA4WjP1nre1US/zSa6WSU7YGhScemQ2RR8bh6J2F+xggkcHyKgR2S
         y//Q/ske108lcjVbm9Zgu9OFggM6JCUi2hig7rmPF2f0mLWIyrAf50UgU2TAC3fxKjC7
         GDmR/1RK71bsc5doalsRRSQmCtnemUdlPKgZsAom8i3JXkfhvm5+cDxDYs7uxmWQmuoI
         Og9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cB4NKdXV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb373a0sor79444495ad.9.2025.05.05.16.20.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cB4NKdXV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487223; x=1747092023; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mHjwLOmCSZb7+SiNUT87VRUe5PiKHdCHDdwE+42+GQ=;
        b=cB4NKdXVtlXgyBN7yBgSk7nz3ZCbzHCGy1x2gA+LTqdTh4/r3mOLT/X9tkTmmt1b51
         Sa3ygjP+cO33NIYPeUiEglVGTH754TU/pDZQqiebFCLjI6uY98deuyHET97j7aGVp72p
         gDNDBbxHnfCVTejjO7MpVRJreAPxMr9biyMhRcIMQLJ/od6bYfEawkYeRsfcXyha1r9I
         ZxVNv09sRamG3o2gkL5OYbBREF8awKA8jUEDzOFLa/kKTQtgGe5TKXKuJ/pe0b+prf6P
         qgwu1E6wcxwHqtU65pVVEuNcZsN4ehtnEvpXUZXTBN0x6jMEudmUhoU0N5yrQOWSk10l
         gz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487223; x=1747092023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mHjwLOmCSZb7+SiNUT87VRUe5PiKHdCHDdwE+42+GQ=;
        b=R8bFhHN0LCNFgHRDE8UjqULPg/CFNxCBkgfMoXeZhCicvZtZ1Y+Wdy+UosIf2V03IW
         KiGYPlMi7bX5El3YSYLYyDr/F+OhtH7een9NWBvK74XCPlJGDZgOr6naKQa2+LrOed7K
         b4n3ocswzvz+zSFNNDAb8nR18oCBeGkXfYZg/O9yV9pXVG5uVAl3jzisAGVWdB2VipUu
         LeLX+CSZ83njayzhA+ACiIO9GLQDiR0YRnNaWXgFK1ZDkPyl/Jus6QViUZkoMjPzHQcG
         KQIhNS+Ybc3VLe1bjsjZ/4ziM9E0ZSEzCIWiaLXx8AZ4rj6cnLmKIlfMuqaPrTv9EVIS
         YbIg==
X-Forwarded-Encrypted: i=1; AJvYcCVl2oVaGRkn1OAe/Aq/daTcZMgKjE4mDveIBy7wCAkrZF/L5wK90UkaHCMasPxaPH7ZBlpJjBmsRDORmA==@linaro.org
X-Gm-Message-State: AOJu0YxLX2SmFJDBWSk1pgooLAcSeDCvZU5fWP8jwMh192vn68GY17Qy
	zOFnaEWNEhQd4mbGfMaaI94dyYVqfGAzzJgjUKc6u/x1PiPWH8mkohpIiZj4ow/CHg==
X-Gm-Gg: ASbGncvsR4PXM0aLugIVW+zClV3lV4W8H4nFYWYBZXXjaVxB/fUIpAInXpcyaJAvJFi
	SM4lPD6yfsTL7ZW9ypBJT25OVcSr8qEr1TE/xxOgBbLiGQ6WDCoiTEML96Cjk5MS9of6QckxFzD
	GThCHt5jiVhhJKHHQwnI52vaQyj4nO4rbTuhg2QwT61mZVEU7bfKBApuOwrzd0wm8qJ4FG5lsHQ
	YszUCI0Iv5TmdgSVHW3Y8ogpxFp1oY8nf/VZgxWyTLWcOJ6eQSOtFZ+nq9Jy2wva+jTM7KyBzpK
	BoONsRxv2+cToZVpXLjDvb8mo/Y7pkpiLMn7/Ydp
X-Google-Smtp-Source: AGHT+IEtE934oujmV2pKBRwhDluY2PMtTrYzh17Tl99vZJ7tWXNrTSDKs/LD7LR96GjhlWfhH+B8Zg==
X-Received: by 2002:a17:90b:3e45:b0:301:98fc:9b5a with SMTP id 98e67ed59e1d1-30a7dac8b0dmr876783a91.6.1746487223333;
        Mon, 05 May 2025 16:20:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 03/50] meson: add common libs for target and target_system
Date: Mon,  5 May 2025 16:19:28 -0700
Message-ID: <20250505232015.130990-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xm46PnOuWrvY

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
index abdb2cc33ea..b2c79a7a928 100644
--- a/meson.build
+++ b/meson.build
@@ -3678,6 +3678,8 @@ target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
 hw_common_arch = {}
+target_common_arch = {}
+target_common_system_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4081,29 +4083,59 @@ common_all = static_library('common',
 
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
 
@@ -4276,12 +4308,24 @@ foreach target : target_dirs
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
