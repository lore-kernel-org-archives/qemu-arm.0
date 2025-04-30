Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004541njm;
        Wed, 30 Apr 2025 07:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV17h3FaSazH3CTV0YMCgnuSvsf5jU52DRBvc+XZHIRxM3ns3ckxIpkIMxoT1kxxNkx8rdYi/1CSuh70g==@linaro.org
X-Received: by 2002:a05:6a20:158f:b0:1f5:9024:324f with SMTP id adf61e73a8af0-20a8931a6e6mr4445424637.31.1746025133733;
        Wed, 30 Apr 2025 07:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025133; cv=none;
        d=google.com; s=arc-20240605;
        b=de4JPB5JEke6qP/QgnmTsrqwjbATXGh2qyD4IpDeF4QV2P8jS2W2PvDFkj/hOEx6qn
         4Av1j4Ktu7CUmTk0tVgyxpPpIxrnjkOrzSCBImck1e3nhuyU/f6QmCePBidoiGeVh6Aj
         uPM72j/jvMZnmShFX8hXLo/dC2jYVLkBsTo0yyRgntMlg+jPu7JdCvuGfyoPc5Lgz8y0
         B7FZegtDGONaXx8MiYDeRbvT7RwPV86OxrlkkohNBfG7hxoRKXZ7fBBq+yCV9Wa/Acg9
         Tc38oZhsgVTGeFOTXWqTgF45e1cx9vExMG4OuLOgxvmEoHgV01D8ZRE5m1wJFmPKZqJV
         tMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8aXdmB6f6CJf71wSR2HMNjOPhUhdvY7cV28foawZJTI=;
        fh=E00ChxsBwGLBYHJyDh8/qvlSh07j6remuUtHmVLAHhw=;
        b=VcvyOCrTS90Jpe3K20DUxRuQ/mS09sgAnVywRR9288czUoj3MdjjaB1fRC+Fv1qnHW
         ckUNccthscc27RDi6afWFIP/qxl7nHz64xFWVVCsFh49wLRbxL+onp0GoToVD/m28jg4
         4JOlCs0A96Pee+0QGyBDQErX+910VimCAYOwYp33H35Ps8jbkDEAKV4by8Ec1YM4E1er
         xAHHxVzOLr31SWLQAEIiUZT62z1VZJ2+vjFqGkuT0sZy1/Ryp7JgfkI//uXdglipdkrE
         GgZM9uIKjGuBXhomGMDDUnErSyg4NyJpRskjPd6FRouRucN4vA53dHakC7zIENB97bhl
         Oigg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyGw+GAK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b15f7dbc6dfsor11062505a12.2.2025.04.30.07.58.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fyGw+GAK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025133; x=1746629933; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aXdmB6f6CJf71wSR2HMNjOPhUhdvY7cV28foawZJTI=;
        b=fyGw+GAKRdOOYaTAp2RVtoOOoh6vgmnStWtScWZFbEXpfHTd89Z66DHLRXru/2xTv5
         lG1GBJbDtdYhM/OEjFfd6vi4Wumj1Wk6pg3HIm6sP62+vxuK2M4E4/tnThMAhsppmZbM
         06X0+WUVYmAbz+plMappwtQ0cVBqULYbjIgzBI24UNWbjGIZe+5NA2KfrgTx2Z9yopO2
         aXF/rmjjKWUOi2iu5gCtIub3UI4QKtikdi8COG6M6GXimsJoaL0yQhsJBVvcM3I9xQDb
         CuVCKTT5DoD8pszza24Fvebf/6wXTpfvJmI4ci2pC2QcKOCkC5LjJ/MLLv0vTBQzrh/h
         q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025133; x=1746629933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aXdmB6f6CJf71wSR2HMNjOPhUhdvY7cV28foawZJTI=;
        b=xB57qm92lcbR6wZU5Yjf7YJOMeABoq6LFc+xzfr3HhVEAk9cXGQyaYmUtiVYP3d7Ne
         Xy6eodlJabp2aCwYFRCXMR1mqjcfQesUHIRRUBDNg72YDhyyp6LG3Suam+x3zXEnUC75
         JhdqSJUlln4zpMgRer+300bbPNlF4v3VnC9zrtt1h09I3EvM6XjZn2xD0296OOSEujih
         EmsHmE/kJenz9GKXLA0IqDPDOXe0C/EtQhGQ9KvmdpHIaz5GnG9LY4NoaeJ02wEKImVC
         5mDljc76RdDPbN3U8kHkz/HcxD1VvCVN82ewv2lNiHJriweo7hjg9T2jlL/RTGco57wm
         c8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPQnlVxtfaytAlIQT2Ngu3o4K2oD+A5G4j1c2Z3uo+1QXAQVJwFs9xtw66/YyLvf872S2j6LzjjUiDAw==@linaro.org
X-Gm-Message-State: AOJu0YxyS9CWG3ezejRhXnwAMKizAEbFo64iR8HDOpVMbTfsaLS5y/8U
	r/WtnKHzvYVQVnk+kdbwBt5wrdhROqY0BXblRKVL8zTLbREEPw1TtBEXmi0WN2E2/A==
X-Gm-Gg: ASbGncvofPVNlSefWPte/Qa4y3kNnx+bWHaHPiorIeH/4ZnAGlk9lUTsUGBi9DGtllf
	sc6Ld1IRdMnYydtAYuvRUDzeRvdScMPCTlntgEmVOUP+eYR3A3K5RfnJT1LO7fsaQbRDLdlqYHs
	h40bCSfxzMgykfAB2YvwuQ7l5915/AGQKcaaR+PKHjK5EKIc03pnt4M86Z71P68XHsHvfTTtzio
	T3Tlalqxpi4RAjvESGGDGHvcQmH3LnTEd1HkkgMjJ4cUhNM4mcIw1qs1rW0SnwN5+9fj/+cmTYW
	InFMbTZ0hmpqX8EvU+44RZ0LXMqgrpilb149YvzF
X-Google-Smtp-Source: AGHT+IFpssHgsSSYtikIQu6tj8ir0gDcjk2YukXZRDxWJf/hcTFbtG7nZrI131KGmvNhHjq05d2fDQ==
X-Received: by 2002:a17:90b:5444:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-30a332d60b6mr5368225a91.2.1746025133341;
        Wed, 30 Apr 2025 07:58:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 03/12] meson: add common libs for target and target_system
Date: Wed, 30 Apr 2025 07:58:28 -0700
Message-ID: <20250430145838.1790471-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: N8ujaTP+HFHl

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
