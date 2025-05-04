Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756077njj;
        Sat, 3 May 2025 22:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNFsItUvDVBaohAxrzbzqKtLSU4ofoYwkhngpQRvBbayTVrRBlVaZiUYyS1cYWTJWkya5M55WLeqZ0ug==@linaro.org
X-Received: by 2002:a05:6a00:e10:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-74058a238c3mr13597896b3a.8.1746336563764;
        Sat, 03 May 2025 22:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336563; cv=none;
        d=google.com; s=arc-20240605;
        b=beG5+CYlAUM/nvB0psj4kgebF+Gzkkm5Ji87nZNYFm9hQ43lophhMLVHNkfrm+rgPd
         z0wULMWGQG9b2GpzbVUo8b/3R3MDlcC1C13pCO0lzsv1Tr4EIAGpII6tpos1Wg4WzHyE
         WYqyxumiwNbGdZmqo+ssfmB2Alvd6gu0LVBV61VtK3b/05dX3RzJ3TnY/8dl5JFaquHe
         7ILlVTMCwbCOq9Wf0l7tG4zQZ/Nquz29e6j7VW/MlaOrcdl4vyDxYfJYGSEMg2SYmhrx
         wxuASQWZgvVOBXXcOxGpP9lAFd6/dLlwFxYkbC5omAFMH7/aDyUbQAoc4KZI376pUc6L
         lW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ACKFwyyWU6WsI3NK/C2B6+xTRZ3tXBLAzhxDpMaoiR4=;
        fh=a4SQK9nk53UQUnNb0uuZVIYAe2kW4NUvC0kdNiATC3g=;
        b=OlhxGZhdpdCLJ2B9fygDWuFsr3ti7LG+gWyDqHq9DrGckKnnhQXj+0SzHyMPFqvd5u
         kW+hm3G/phXRXQC+iPxSyAz/k1I4USTH1BYvYtda+wWu63Fwp13HPhe2Lzv18R3S7bXt
         oqhrO1uTH4dpOPIuKstoXx+J0fiFOx7xh5+fSV+nwKdEi/djZQmAYIEKfnCYF4tP8qqZ
         Oc2iu3/5EgwYwxJfl43BFOTGhkV+kPf/pbf2alC+sATJlyVR6TZSYyjWNPUI87iQSlqI
         Y/CJO194mqZFJiLEncaZVRVhyTvQNmVj/3QuXJAJ1Yz+kr6M5232dCq+8kuClva9XDkx
         +OXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpnoaOtR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0c0b3sor3372882b3a.9.2025.05.03.22.29.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpnoaOtR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336563; x=1746941363; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACKFwyyWU6WsI3NK/C2B6+xTRZ3tXBLAzhxDpMaoiR4=;
        b=GpnoaOtRH2/km13/4zI5vIWUvrj2xbCtWjTo+qmHpHinamgTmDaqhhixgi2vgxA1xx
         R3S159S+BJLuOv1+ZjS6CcwdpS5Qpd2dkIf51lfhHeT2ifiZL4Q4ATkWeWWwZIGTfjk9
         JeQN6S5e2bCZWm26MtE4pmgE7D+hhhYXLfxux//pP05aDqXbY1CCdU3ElgR+TXDK3GGk
         78WSZUVgVLvj1XZK2K8w2f0qPFys9WqwMJptAKVLPzoPf0GUYQa5xLZspO2da/eqIfAv
         p2QwkYVbH8gw/rwGhDIq9FAeh05LZxN9DmWbCfsYWz7/48NJ/QLZ8dv+AHv5Nzfz2d/2
         ez8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336563; x=1746941363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACKFwyyWU6WsI3NK/C2B6+xTRZ3tXBLAzhxDpMaoiR4=;
        b=JesNDnNqeyVOLHX3NJcMeBnx9gTmJObQF6FBe7Zx9XQxVwB3tGTL0tNndR1wsqdU2P
         0esGib6ciFfX8WOVVuHxoym8jBtseXLYjVt0a7fiG26HN4odV7cpIJksDCK8ZE5oRsJk
         wmA4QkBJIfPM3z18iipN4rfsLoZm6rQWoMr4UdS0f1J1LBEvEtCGSfFRV3OFXT/CjvgH
         QPFtpRyQisQv1hem/Y4hBU0553+IqyH+VC2ds0T8lhOoaI57CO3CuitVKNddO91ZWP+c
         3sM9zY0czkwQhnXn91bJepELd6lVm+TyU5EFF06m4zi/fJO71Lzaj2jGl28q/4oiWZoq
         iu9A==
X-Forwarded-Encrypted: i=1; AJvYcCVeEmr+M4BKfgQFwrmW8xv3Px9UIE8YnwIwXUTVebkVLTCo3bLaPB0bkKkJ/P73sQImBIopP5UD/2X9Ig==@linaro.org
X-Gm-Message-State: AOJu0YxtyDb4PQRjEyUrmCfyNxP/DpsIN9yOOinIWbxwXKA2u6G7b6Ea
	JORYHyfNGDlJ4Kht40gMbgEU24y0QiNP6kB5k4aAQNXOzAKue+vRnTWqDHy0QB2q4A==
X-Gm-Gg: ASbGncvyCr/I49IxW/I1FcKshA5c2M+kYfpyV9tS4PlU5gDboGmvSThzkfYuLv5TeE9
	LB4FSqm6oTqVP29HcZeGcAaGFTyXAV7Vd6/w1a7Wg6CvtyI7tQPu+J0jO+BBzss5qt+0KuXX70o
	zbJfmhCLPHRiJRDDqTV2JDM8djUASrvuSAJJ0Xy9HxYztTSCcbKUW/ln2kzfURcHUJKx5mTZaDa
	wQzdvqiHH4FjSb0F1Ig8J9LeLqphRPz7xv79JVI+aMxkOX9cfp6mIyv4Rw8vSbjtU5UCK4HIkcN
	DGOmnWemU3GRVAAYaQQ6By8IzbRJB47Nulz8q9C7
X-Google-Smtp-Source: AGHT+IGjACNX5uAUyFCHGk3bklz89ji8zZKeOyLS4Gcm5HJgZXwpRju3I7foEuYzZHYmB77R6TjtjQ==
X-Received: by 2002:a05:6a00:6ca1:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-740589050bdmr13949906b3a.3.1746336563237;
        Sat, 03 May 2025 22:29:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 03/40] meson: add common libs for target and target_system
Date: Sat,  3 May 2025 22:28:37 -0700
Message-ID: <20250504052914.3525365-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RE9FPLACRvXK

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
index 64778edeb2c..6f4129826af 100644
--- a/meson.build
+++ b/meson.build
@@ -3685,6 +3685,8 @@ target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
 hw_common_arch = {}
+target_common_arch = {}
+target_common_system_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4088,29 +4090,59 @@ common_all = static_library('common',
 
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
 
@@ -4283,12 +4315,24 @@ foreach target : target_dirs
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
