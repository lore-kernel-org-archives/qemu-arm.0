Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42545njb;
        Mon, 12 May 2025 11:05:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqegbKdxdyCNLfuSgcnkEw4Qi7ENrKTOmUB21mLNtyWo9oCRAkvMOAxwymZJ1qPJbX4MFcUz/VmppNfA==@linaro.org
X-Received: by 2002:a17:902:d486:b0:22e:53a2:5551 with SMTP id d9443c01a7336-22fc9188fa4mr225754005ad.43.1747073114953;
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073114; cv=none;
        d=google.com; s=arc-20240605;
        b=QhR/ruC0bf7c4bKk+SFN7BwAJrEwgUGaOsckJ9cTF4Dki/eWxbX46EE9UUcs/7nUln
         slhlIjuErxLKXytckV9rDeWYWWcPIr6GnF1W2bz/uhCE5BX3tBNVlNTO6yGZ/XyqkMFi
         n9Ak9uGfKiHhj8slrj0vl3/WxAAq7lh7/meSGkAeOYR0GRjruNzv/mbOMm6RMA6JoWcA
         66p8gGP0qTjcIecP8XQIPXb6/dxBzSwvUyhZqMPWvimnzrL0JXBj3ZrvtQXYwpyEp4DT
         daEEkKPp2FSihTwf4GMkzc7/aeAxPGnTthyAQNqkh6G2TnaP8w7sMo7LpGkoEj6flJOj
         FUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6FGLSZTqO/KSoe45Th2y1VHmRd/kN2aH8D38tKOyoXc=;
        fh=UhwPdgJHsC2QZuY1S+FA7Qubw5112bnBb06YcUU/SsI=;
        b=CUbcFwQhOIYSEOQq/FKO0npL3jEHSkRNPqTVnB+smZkEUdOoBQatvKI61ISmPGi+4C
         Z9mrwVMZvTOIG2UmUgH9AJoiECU/+dqBwSHxnbt3+nEqADpFwFEo3j+evSPVWdvRGuti
         utWdB9MnE7x9WfPQOwWEjiQ+TQu3c8geRNUmN5gTuwp5hPG/tWE3WSxVpAZKJ9SXQWc6
         sz15R67HRvKkB0Ulc0ykKzjfwHUS+PWZrpuSC2JDCW8d4YLEUTSSHXdyAFPo+1ffSu1I
         zdzl+BHk94bnxuGYjdPP0z/ZmqJXPpEeOX8siOqd2m5JCUG/PTrL0BdW2DvTLYTIBdSi
         mDbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwhOLOQ2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6b002c8sor59981165ad.11.2025.05.12.11.05.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwhOLOQ2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073114; x=1747677914; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FGLSZTqO/KSoe45Th2y1VHmRd/kN2aH8D38tKOyoXc=;
        b=IwhOLOQ26Upl8/Bo3uMwSrGHvR37rn+RokqVD92WQon3kMgnVqyKh4DDnz3Ycr8Wjo
         A0OQpw4gAuxiUObwrr9hmHwJtXRJWuDxhEqp7eK6Yg3pR5Cz2YECwLfX9YhqoQpNyonf
         mL6kMHkJLRbQZAxxeG0M66m0vt9oSsHCixvyGBcn0XCqpfCxCqwl/Gpk4JoMd8CbITpd
         bm/FVrU3Rj4QO0uqp/J4K7BHKqbiRkGeuFmTAXOvdVDiIG9UK4/Opy9aj5u02GAueg/r
         zi1lmbKVL53F/AZ1xl5UL+pB7OwRQWTvabwWB+lD+DhRyxB/sVXVjKS2j7FZBUwKGBBP
         BVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073114; x=1747677914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FGLSZTqO/KSoe45Th2y1VHmRd/kN2aH8D38tKOyoXc=;
        b=mp6mEcpbgh6kZHmiC/ABKen8VjsjkgzXZ5w7S0zYAkbZgrZzCPtV+jj2Kp1b9E/iPn
         kALl5ap+4a682H8hWlsuuWC1KYfihGFt8HytCK/fTMvq5F3wLg4pPrveBE8CmoPlWd15
         3LbL9u/Mf6x0TGZhRhQ8f/QdVN/VqnUnv49t5FQUx2V3+Vjso0lKJIjgI7d5ZTgv3wMi
         gdwcMyar7440SEGmZ7UeEDTRoTfte8rgvC5FyNeuJJnzx9ch14V7jGCPxYmysqsCTZbr
         Mz4h8DkPtSPONmN4kQ29fqU4i1PcvNYpU9I4qeXBMw37UfbwTsgnXkOBi3JQZSDtlDHC
         D1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWlvtcsC9aw9txRriXaGBu/rvaCGls2bS9FF9gYAG0HhSAYR2t1yJlt3wr+RX3iZXVxFDaOqb0rx3qakQ==@linaro.org
X-Gm-Message-State: AOJu0Yz+kdNBpkwSvkK6UP7OY+2V6DeI74yD/KkVtWJF8vUkxG6yLJhE
	/7od4VcWQiqzNdZS5u/QCTshhU+UiY3w19n6imFCcLhNe7AIiZpDo9WW0o8cIcbmLg==
X-Gm-Gg: ASbGncvPbsqFj4I/JkSrUmgNELJCO7I+YI5mNSfcudJMJWp5roZtHKkrIj1uNxs0frQ
	uA0DWjCSijphlLf9bNp5D5ZncZ2NpyzUcldoBGc0lR4oHSl2+1YKC3bbpLTPq6w4CTNbO2yW+DK
	wfq17srcz+m0Zri/hovTgqGIqN5xs7WJReN9ekmO6j5wwhkwcZTFv+VNndEB72P17L9nF9Eoz46
	amQenPCVyNqpBjDYBoa1QvIeSlcYa52Wcgr4juaZImAq0afVToSGYTJrmzrbTTe04Y0RM5vKUHD
	dipJV8TfmTh9l5bINOPPHyQdF6+FTjmSfenqvBsA8HFU+6aZtVlMAj0ESnbY0w==
X-Google-Smtp-Source: AGHT+IFmXHZOtSdCdLVo7meuSiXO0630xCPLqApSephMacKWL+WSH3IS2ya1Tkuv7qwGub+XyjrxZg==
X-Received: by 2002:a17:903:98c:b0:22f:9f6a:7cf with SMTP id d9443c01a7336-22fc91a8c92mr188920805ad.52.1747073114488;
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 03/48] meson: add common libs for target and target_system
Date: Mon, 12 May 2025 11:04:17 -0700
Message-ID: <20250512180502.2395029-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ajRkUZ2KXpcV

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
index bbcba3a84a1..bdcde9746c1 100644
--- a/meson.build
+++ b/meson.build
@@ -3706,6 +3706,8 @@ target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
 hw_common_arch = {}
+target_common_arch = {}
+target_common_system_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4111,29 +4113,59 @@ common_all = static_library('common',
 
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
 
@@ -4306,12 +4338,24 @@ foreach target : target_dirs
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
