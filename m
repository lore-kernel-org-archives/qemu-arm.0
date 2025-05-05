Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178705njj;
        Sun, 4 May 2025 18:52:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCoTiQ8PYVtRepZokP6Ahk/P48ZiLwsvHwSzeqwvV1NSkEGBzCXf6XFvUp1JcjMsGeXixR6XONvaTWcw==@linaro.org
X-Received: by 2002:aa7:9a84:0:b0:736:3979:369e with SMTP id d2e1a72fcca58-7406f0b0e9fmr7377513b3a.9.1746409950543;
        Sun, 04 May 2025 18:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409950; cv=none;
        d=google.com; s=arc-20240605;
        b=h0nUTp3YDegxH+f/HnZJ8wk3qwmjCLY8p8OZWujjkWbGZINlu/IAqtqtuVvwjL3Vfp
         YuwoQPTKzsAQUVqJlrmilqrOocHgdo6XF4UlZ+c0SSAa24m8H++Gw8pCMqCtr7evJpdE
         HwZ/IyjHTbJOUfwTvCXp6gAOzRRFY0XG0kNgx7vKnr25/pIMeweTyvz8PRivtayjM1BI
         FfBD1vauOSNgH6FExEtBh2Kvyf+JwTbqbouvPv1kFfpqRBsHSowSUhIrAtEgBzlt9lik
         fgnc2Nf82TY29HHLWjMTBGCtS0mfZgWb9rQn6NooFIqa3QBXB0oWNwD3C/aRRj49HJI9
         Xvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1mHjwLOmCSZb7+SiNUT87VRUe5PiKHdCHDdwE+42+GQ=;
        fh=ZPmbzEd9tPtCmLMh9H4/E/1/8PMsn8aLbyjL6LkRX0g=;
        b=exYsELfVwBmD4iswTXDQYAxFmxXu+fsJN1loubbr+FrCmBrpasYHCAHXJJWzNll0hf
         ZWKukKeN0QfO5S4yufTTanzS++3evUgDMe1ONzCIuemlzod2/6p2B5ZlNIs+B0sezO1L
         gO5udXa5IbNa46JGrSxeIog9WL2IK7hXxz0w5EvgMjUbItsH66mqkjsa7vWtLS8dIRoW
         KSfIR07ScrHLEoATx77D39PqQP96htTdtUNRWho+gqwZPYNwPzbtBlkiCnJ8SVgac+Ef
         hDmY3dzv4SxqlNbcG72BB9S/2RxPmrhvZpUWh9q5Dbs5EysuraIKI3OwGxBTomzSZEGm
         hCRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W3zB2fsU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7ba0edsor4196312b3a.6.2025.05.04.18.52.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W3zB2fsU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409950; x=1747014750; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mHjwLOmCSZb7+SiNUT87VRUe5PiKHdCHDdwE+42+GQ=;
        b=W3zB2fsU6K6rJR/MaRc1nuxlRmilY8Rw7YBtlPfpmV1O7Nq0DSegTEIs+KOX64cQxC
         dPdW7iav8cXX26eeA9Nb+VSFNEawgVzmrN/IRMYDrt5C6vd5Yz3uJnKwJ+c6eZkXqJ5s
         jPifcbjrLlGT+TCKGZBWz5iuoqMMQFJOfyW1wbbpotqIDa73fC1Z22jWjp9M58Afvx9N
         dtYLJRv8epoAWVVJTE7JrSccytLq0mDRb1RWDpbJG6KP+KM/y7lZn756g4zQ8UdqdJuh
         n0qiWZl/6eYTWl+UyF5nABZrhNUjQOXhjvOj2gU/3ELjvG135JvtHpThyaxw7W2Rg/q7
         9SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409950; x=1747014750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mHjwLOmCSZb7+SiNUT87VRUe5PiKHdCHDdwE+42+GQ=;
        b=iJmi1VPe2wWjDlHqJQSuU7fxJ3Ye1Knmr3mt3CxSVtmU6JZrbuoyVs2NbLuOleRUWc
         kT06cNfJPQXp1YjI3NazHvgIjR+3Joh9DYp1ZpYfJ50v1/XfGpZCmaSob9HoikQRP3r9
         AB27Wndnl6MKwgA/zSauEJPYZrLkDvljYMphrTdb2++IEGYSypNxRuloQQYQ5qwzjREE
         7QbjmSI8kCaMBsTEciXMRvqF8HOLSTXM8dHnixODRWujNPZPyjdY1Dqa4UZUJHlADq9k
         9nq7uYoR8lR4pzm/3B93h9x20Sl4UQ2pFLeDQ9+ZkrXGe7eNeoLD30+9SBSOwcsJKSbd
         4vPA==
X-Forwarded-Encrypted: i=1; AJvYcCU3b91Oa0u1aOKh7udm+oDi5KSzBwOTmalYRknnrHWvbycwRmWHvZOBHrSE2QYvCqVi2B6F+DcCK7XDww==@linaro.org
X-Gm-Message-State: AOJu0YzyOXzrUblJ7z7oJnB77TpCg+XmDGTri23MlZXdKiiG6NGEfc79
	4QfX/UYjkukbxqHH6ksiKRkmlyWog78HyTuHcnosVSWkBnxU2Kujz/WlwqGXu/EsvQ==
X-Gm-Gg: ASbGncs8nyck/ysh+32PgWsRFWeGpiyiGC2C4kMk4GjpgGuIoZXx+/yWchcyNmkC32X
	u69UzcIcWfmyA2LAVm/m/KbZZe6/4oEVXqe7MwF1GSyrCXPcIrgo3u5aJpXrNS+KAwaZrSpxPJQ
	SiPflE2U1Bdv+apOinr/1t975SjWwdNu2vp/Oob8cPaWHx2uJsZbx3TcmLEA8+csyAEKENAjC4M
	3iCKAbpxR96BMe8MuuuY3186QEXxT4f8KKkJJeTXfJ5LpsrEJEFB9dUdR9HD9rVRKZds7glS962
	Uo3YeKwfx6aILzc0ifty0fP4ZHIICFe4TSX85cYw
X-Google-Smtp-Source: AGHT+IEnw8VfECoK5fXq9FFAAhr8guvZNgIjGdAHEKIO0OBZTov/PyOJGomE9HYGIk9r8C+GFvgmiQ==
X-Received: by 2002:a05:6a21:1743:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-20e97ea68fbmr8446109637.37.1746409950025;
        Sun, 04 May 2025 18:52:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 03/48] meson: add common libs for target and target_system
Date: Sun,  4 May 2025 18:51:38 -0700
Message-ID: <20250505015223.3895275-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QjqwLIQwQ7o+

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
