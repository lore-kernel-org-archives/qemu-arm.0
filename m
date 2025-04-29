Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22916njm;
        Mon, 28 Apr 2025 22:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfGbhDy69ni9LO5RrL050g6ci6cEN14pEohz9q5bXn3LkE/X4dm80NqbdVqMLYjcwuXicWEDDflRMdJw==@linaro.org
X-Received: by 2002:a17:903:2ce:b0:220:e5be:29c8 with SMTP id d9443c01a7336-22de6058a69mr34365665ad.32.1745902819614;
        Mon, 28 Apr 2025 22:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902819; cv=none;
        d=google.com; s=arc-20240605;
        b=Aawt2tC7RDVWQ0x4MuBMJV33dajJuyLwrIHzswrvv9QT+9U2NSTPXD701zi195aXVR
         EA9W9xHbOEvJKnOzXx8Y9ZLXw8hW22r6fYTiZyX2ITxL2Q8LTa0P65NCTun7B1ffpwAV
         9bLvn8sBjHSqjJ40HmCV9ehBZ8btIwiC6dS/N8hB4RGgdtLq7uDsssOdoJwk+z1vkZg/
         dFW0MXxgxPg6oZ4tYyd2Ok1TcEvZX6z21BoA9uXAetBKGa74Kgx+sT3k2lWklie85onP
         fs+KjHcjzkiJywkygVDv/EX5Wd3rzzRNtcPvaddwlk9J+65i9cd2hnTOau5yGqBD3U/J
         ZV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8aXdmB6f6CJf71wSR2HMNjOPhUhdvY7cV28foawZJTI=;
        fh=Je5Uzb8E87CATvoKmZLgJOBD6lsHf8xEzY1OfwGm/7M=;
        b=FWumLv4L87ksVzsriLOSABFbSdmJbQIvfaEyhog1U8193kOSaqf3gCe4bVd6SCL0J2
         AHf2fjM3wWEoyinoJNy0mAjsuZ/CODQo050Hs9TB1kIoe9bxQ63b1HxQb7p+LKzFvxMA
         OwFNl4uN6N2gjeurvGTWcQAreQEk+V8t//QkaWKu7eP/i9i7YHkGhMcKoSJpJH7Mrc+d
         /gNJBc+Kz9K/J7zVisdszejrwg4TAlVUbKCYUz8/QK2DYTMh4ST7e98lvFrYv5DgIil+
         TMTiFwtj6CoNcxTa+J5JVo+c2/EcSS01+G+TFW46T77kojkvK6R8lGnJWBXOMfFtFjBe
         CkbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uk6NiAz5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f4f48sor102631925ad.13.2025.04.28.22.00.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uk6NiAz5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902819; x=1746507619; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aXdmB6f6CJf71wSR2HMNjOPhUhdvY7cV28foawZJTI=;
        b=Uk6NiAz5fYblOc+HZPH6kh0Bm8dIenJkzNkNT4D1BaKH2Nsidw05igOPho0VQev+N2
         2GYcb29q5lAX/7kfPHULRhECPIgWKQ3CKpcE1zJV49tteL6vHI5iG3vVkdF80lpvr4k9
         tPG/XiliLeyI9WW9S5cxHPSpNT52ZzmLAhKXEysV6lkNXKiXmYrew9VnJNBtV61ZmYHP
         1KKbFyXLIqDk/EULEeCfRZqb4qDUOsmhi/NCJWIeKcW2i2zHC8WMDLecJBj8vwmVep/w
         Rwu0NSPK0vD4fJA2MEQgtIOj6xt3P9MT9dIoSoVCeGj9+YubCqsNxchq2OjVhnEo9S1i
         2TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902819; x=1746507619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aXdmB6f6CJf71wSR2HMNjOPhUhdvY7cV28foawZJTI=;
        b=ohM+9aT51yBp190I4PbicjhRKp+NofThKiw/80JynZOYajwA5+JPaDDvf5vptd8J9F
         KHd52T4ToPyl1W8NhQ8bfFPxfy0qJ7Sgberc4/kGBP+ztHyrDCHP1Au/BSLvVRgQD5Ro
         jRoD/x4GfCkC8/1X8F6rMMXvP7dyTDezRUHM70RgpyO8puX9egiNrrbTPMmIoESRsnO5
         9sYwjcP5yIc5MzioPQJVH6xM4RIEqZf03v+A8/tFKE1sFEzO7jl9FRcrXoIE365Ogh70
         c1qjmw0nq+a07wszja6rO02XnoxH8lW8SGf3KfdC7QwetRByLkCC5yNwEr2xY81USKKh
         0hvA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ88oKgW44jAddsBnoc5cAUPZe5+7lNXTIOnOPQu2XwhhdHiDoyzYTv0kiE3gavIYreDoGlc7lorEfkQ==@linaro.org
X-Gm-Message-State: AOJu0YxC72s85sNzeWfZBdp8YeSQYk+MfKtaT922Nwfm6e13yhvWHetW
	5NfS5HOahZ50k2urvWkHvkgQaeB1YxWs8U76fiDT7Sd5UwkTS/7simOzQDX8BqQVlQ==
X-Gm-Gg: ASbGncsIGS2aXSqOPy+kNBttDWjiCYpI0XkNpJmmkB6cQSDC2HFcVQOqlogNvWWXIJP
	CVgDqm0xOy6MtW2a/Mctci+cRfKIYWX4DnFzdRrk4D6ktBrdF3PFeGpqFiuPQo5kX3OwmCKRS3+
	FCpFBUBgkaCxQ2wAyX+9NF8dmF5l9fEebJTjkZO58CJ8pNzXMYVvZEVctff6kpTDphvsuY+q0It
	eEzbb5ossYFr5G+pTjNbBpl7S6/vIAFEYjG1JSIPjAjGlL3hkPAhQADlDtNk9WyKQCLJ5XzvjFO
	AdU8+eUUkDFYiJM2jkEbi486TMdJlVjCB4yjod32
X-Google-Smtp-Source: AGHT+IGeLffPwEfhTSFzcSgCxSnqORDeDooD8lNMMrUFiFJLyupXL0rE4ooCbBeJi10RUeob1yF/hA==
X-Received: by 2002:a17:902:e5c1:b0:223:377f:9795 with SMTP id d9443c01a7336-22de5debd13mr36357395ad.0.1745902819112;
        Mon, 28 Apr 2025 22:00:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 03/13] meson: add common libs for target and target_system
Date: Mon, 28 Apr 2025 22:00:00 -0700
Message-ID: <20250429050010.971128-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TSTxzfpn0oah

Following what we did for hw/, we need target specific common libraries
for target. We need 2 different libraries:
- code common to a base architecture
- system code common to a base architecture

For user code, it can stay compiled per target for now.

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
