Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94238njb;
        Wed, 7 May 2025 16:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVovOL3ZFKp/rBAeqW6s6OoMXptdai3r9Ipx7Wxcs3Vh8MGC7iURHEu1GtaNL+6IPRF85mjeiM4a36dQw==@linaro.org
X-Received: by 2002:a17:902:ea09:b0:22e:3f1e:b8c8 with SMTP id d9443c01a7336-22e861d18c2mr17300115ad.15.1746661366493;
        Wed, 07 May 2025 16:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661366; cv=none;
        d=google.com; s=arc-20240605;
        b=LNOt3YsdecCyMwbU/s3e5+MhN0BqVMn3XaXYqTSaChcXXmXw+/1NLaV5+ARdb9Lo3M
         eA+qHJtO54v/HFkdCZx5XuPYmANIW2tgDnck9T3W4qX3Ss9pXkfyFgV7GRQJRJAdhgHK
         G9oWGNtlCeDqFHteAHvhPtT8zbVevigvTg5sC+g8VGW2S2hxW4GF7xi6ZYdzOZR4eRna
         i4j+xfiQP6q73DNNfynoGXFSajsZMV/D31dzvVh67gsBlx1d8Al7Gc2cr9SnxKzv2Hn7
         MvD2BIXOlZ/RFZuuKr7k3NYtPGGpJR07gogidmwKwcpkR0JI78ZBSJPgzatSoC7mcZR3
         WtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HNFwc4Kkoc5DDFWduHklRzCXnbc7NeJWvJ231SivMc0=;
        fh=YlW3w469Uqbs9/hLRJdpZSC+SH2zNjenRz+rb8fRTm4=;
        b=BR4L/S0ixlSvpzWbwjCxVj1IqpsuizXazXNXZeVUx/yX/kJ0aWGTR00SgVo2/KleYm
         DReVRjWn1m+cTNjNbK/QI/rg9nSIv1S3MCkc8TyfbjHgecL+BrA/xKqSe+wofllm8Aqr
         jBSWHMXxMULe2dtlbM+Bon7NjWclnQOkmD+aZ3K9d24Sgc+N+OfuIpFOeudrj5HAOnzO
         D8I1XeYa7uJraptD0bfy2mZBMt5XZGgxaARs3Yx3HuxEo5FL5cNCCFssUI/eRaikknZ8
         3445On6FhEtfFf7U/VKaFZS4KD9m3LJCCMFgQw5iD1cc6nmtLqPmEGuUtHx1VtdEMgCb
         OFpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iCXtDBNB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb2242esor120771655ad.8.2025.05.07.16.42.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iCXtDBNB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661366; x=1747266166; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNFwc4Kkoc5DDFWduHklRzCXnbc7NeJWvJ231SivMc0=;
        b=iCXtDBNBE0abAQHVSPkOpnKI/qAbgXq2qpJdOD0QRe8oPz8ONT2FBTLio1wk0Nk9H4
         2+0YaCHpxqjTlKh1In+IPhBvrTCZl5yNLXlqvWzcMgAletZwn+XhU86XJDL2bhqn4pZr
         8a68nSftBMyU1E80hJNYWe1iSFW3U5xwF+welhapAAVpqYCInQUX9DWx8qoRq2ioFKu6
         g2PCOV7pokp054dzRPpxlLK9HL8YCMV+IOIlpOtL4az0Cx4fD4Ai0uE1vf7mIv8jDmfc
         nyfUL2SS6cGc1jzFFJ/YlIE1SLRkvzQ8DKUf3vuERldQlZw2TeNFRah6Df2D63E0eDN0
         0RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661366; x=1747266166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNFwc4Kkoc5DDFWduHklRzCXnbc7NeJWvJ231SivMc0=;
        b=A3RnJOmYvpUvG1ikQ5N2vgOeat1mHu5G8ujBzvbBV3QAV/Y9d2X47BPv4ltEgWTjpm
         5GAN/4qP+yYhqX+QMFRPkKGgmNEMeyYv+AurIbwDb/oqG/gTH1aSOq7Q8aNTTJ6kP2Fc
         Jkc2hLmq29ZIdsjUCHS84CFVPjcVbEMRyhOKLZTYXGpLiuH9YvF33Se9o/cSGOMWiBHy
         yCu3MzJ+vghnJ2Cl6MAi91xvXtNT+F19N2x2i7L2IpexSIk73igpxi335GDkREGgJCaf
         NykmExT1ULT0Qg5c09jFWWSDQFlcf20T4kLRy3WASa4K0VylWdQD5YoKAzZVzw6rMqF+
         5dIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDi52I1vbvjHv6hoSfAeBfa/RSSI1xfB8G76jAb5+TZbGWkFWD5xqToFGdVEYeKr0AlyfLL3Z789JBMg==@linaro.org
X-Gm-Message-State: AOJu0YzJ2+c7lSQBpBfUMoRD2QOrPZk+gsG7MJPsMsH1UeSfZBEphksd
	OQQlmn2qjHOVN/HifQpbu3bedIB8J7Tpu+jdlMSidIrhEDxaOETzsg8niXEazXBGdw==
X-Gm-Gg: ASbGncsvVcd6UsZT1snzyrk5pPdhMsXPaTEYPsTX+eMiaSCxB6/O7BXroQRnMyhfsMZ
	B6c1A2RWIcJFqoc0rjNtx056kzidQle+jODp+EsBfgQ+fCVJOvOIiGyn3Ly68PnTOSgUqybC36m
	Ct40V88nQQG4nL7E1wTCdTK3PB0dDuuDgMPNzGMhWpjRimSdrQ5KFu+vGo83K7FCFGTwXoA7J7M
	7jtcFDlr9ShRPTADkpHsGNvQnCxWlUb/WASDPeQgWBtANkEFOgf7b8s61uuiQkCwZTFKYvtYJlO
	RA1zad2bNXEiMyFChY266TH4HnaVXLNsXW6QehRc
X-Google-Smtp-Source: AGHT+IGkYaVot3yx6bVb3HIKk6uS+ccBQnixYSZU5yTEECwQfzfBOngV8UcbQau9STJypaO4rTu2gw==
X-Received: by 2002:a17:902:f682:b0:224:13a4:d61e with SMTP id d9443c01a7336-22e9d1e2bf5mr15945275ad.51.1746661366112;
        Wed, 07 May 2025 16:42:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 03/49] meson: add common libs for target and target_system
Date: Wed,  7 May 2025 16:41:54 -0700
Message-ID: <20250507234241.957746-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sCsGMmtQr4wC

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
index 320dcb3da19..0609d586a74 100644
--- a/meson.build
+++ b/meson.build
@@ -3688,6 +3688,8 @@ target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
 hw_common_arch = {}
+target_common_arch = {}
+target_common_system_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4091,29 +4093,59 @@ common_all = static_library('common',
 
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
 
@@ -4286,12 +4318,24 @@ foreach target : target_dirs
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
