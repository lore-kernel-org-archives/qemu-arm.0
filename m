Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279099njc;
        Thu, 20 Mar 2025 15:30:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQJrsdExws2QIRhEXQOHgVbwhbXPrZf+sapjkxB96G/kZTTTN5uJjGM8ibkwvcMR6yTDFfspweNZ6b0g==@linaro.org
X-Received: by 2002:a17:902:e887:b0:224:1074:6393 with SMTP id d9443c01a7336-22780e1fab8mr15502575ad.43.1742509835776;
        Thu, 20 Mar 2025 15:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509835; cv=none;
        d=google.com; s=arc-20240605;
        b=P+kJ6NdJHairZ1PA61nfhn4E0WfdjJiRzrSPyWPJEMrNjY6eBf4E+xfFMTeRf5itLa
         VfVfiil+qQmKzPaKMDwOJBru74Y7DO2rXAmWDHcdwTCtuJTPMNP84vY3sGg9MYXrdERc
         GPPsmZ8qFFH92bWEosfmOw548psHKd7mCUTnHf3BDe3WtllEOmczBzXtK5NWr8mLsuk0
         rc22b4lJsMNwoSY2TWnmn4m/5NTJ/wJCMWBuBAltkDa869uNY/+M1e7X8NAaqUMTGOB6
         vR2lm4cefsFjwQNX/d77PCQXV3ZoNzvshmLZBCmptCyo8y0JETBMUsaSq/Q9LtL7YdDz
         Eq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Fni5tdTWafvZot1y+akur3pFHYiAMm3JM0mRyhC4D90=;
        fh=Sbev/DAnYBRbZjNftq+L1sI7oLz5PnmHoF308hJnwwY=;
        b=H9HC96eWTNhSisyYkpD0MxrXfrHbC5nmeLAQNRuEseuqoqf1S5bdljxha+TOAwjgX1
         dzZidQA0u+IylxOUK6+7KxVE9DMCoVCSOA6ggb4fUdzGyb1ypEC9J/tuUxyvtU6I6pQP
         /q8IS83OdbUaKHbaBHlFdh9TcIe75XxYn9ZK8qIdp7yGM+h3MmoU2bjIMonmb6VdpkI0
         WxyF9ZtIXHwXpgz1LLY1GOQ5NsWqmnn9Duf3R4XLL/tzuOkze22s0FNOh0BCRxruGj/e
         ksEokGJP1YTKR80pRWnZEd+GhXFjGCd+DANITrpbV358m/nDkWY1QCVw45u6d3YS3VfS
         6jGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBpJFy+r;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780ee9a57sor3781775ad.4.2025.03.20.15.30.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBpJFy+r;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509835; x=1743114635; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fni5tdTWafvZot1y+akur3pFHYiAMm3JM0mRyhC4D90=;
        b=qBpJFy+rbZTDBJuOF7eDfMkESFuQg7DLJvJji3Kne602Kp3CfGysarG3vg1hPdaAIh
         Dx6e5pOwYBiKvDlpLUFdg60yxTtVgY3RS8+0h9bQ4SSXmYwVXt2F8PQcH8He2fN8l7fF
         vPYO2wmgUiV67+Kh3oqmqqWjXz4bIbd9moV6TxtkUvZHEws+KjCcN8wSOXB14KE6e7S1
         tSMSZpDK0efzDZjhU/I7Z8BCJyRptSVhNWLpMu5nVspKzG3aIpBqk1Zljmn9SbvgSaZg
         hLqGCulpGZ1OaHgwOti9QASIV0KlVMJ+WUpywsF3b462MbbjbKn2EOHXIaReIgFUGJ4v
         lijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509835; x=1743114635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fni5tdTWafvZot1y+akur3pFHYiAMm3JM0mRyhC4D90=;
        b=eMkgbkki8BR6Drtrr1WkrDe9iHI298iTwS5RecrYiMk8ifWxdN1SEytcq/uL7vNyF1
         13TJer+MqwoIgTza6ttWPWACwPAegY+oNrcdErPlBr0rbVRLQyZx6x9TrTrm7ngZXiMD
         1TDLovZlcjtXRcYhHAr7Z+rezpOYrLsHYvWHwAIEFE7f3KzGVvKEnqy0QPLVLeCQoo3f
         IJVguvSToWD+WuxM8s3JfmzMdURr4tuAxZuSAwqaTwbmE59O1qDfUotXQ6dGKcH2jV0x
         duQPqCDWVUZV4brvRiMhXZWT2M5JC4roOTUVNFC2YTbg44SXZFMG6Ht34fp7drofUc0t
         25Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUYV551Ugv+GBmhV8uwnPUQRBvBXMjj/5GxoSOKPYQcJq66kBp4wU+/m7HM6qg6kfsekYkHmDAdG1Vg==@linaro.org
X-Gm-Message-State: AOJu0Yxgw7dHuZAhGithSWKnhqHwhaAJ0GvjiK0I5HAC2bW3RU7ZHulh
	E7jMhr+FErFIwMHWvu63zuq9ckaN10+X72zZBr2aS+NyJ7G6AphQNwh9EB2lLeGPBw==
X-Gm-Gg: ASbGncu0dt8dril2PttEaPPGHABnnlnab17HHuWmLnaR8yRyyegI96YHyr/7w0qZ9yj
	AKDSQ998uZYxmkAGKOCnApiApVHTCz4tjjMAM6kmiRmJ93lTM9O7t1WwLTA38gk1zeF+bZ+03FU
	nJDjlhKgLdgaPth6l3VCaQ+0ic/7DB0L5MQGo8SPwk5zGKW4APYDBwKBveRXhg57LG3GUzjgAZt
	kH+Uc0PJ8of857N7szkHdluAVnSKM9rhhI1IUuCfBhPlB4a8w01lbk105Aqo8+j0wUPzHCCjPpU
	el0TTEyaUknna0BYTZK8Hvpv33sBQ3m1+hkZh3xjFVXa
X-Google-Smtp-Source: AGHT+IEDnR46Jwg3e0H5vN3WKKFSDOwpObSW/kBf7o+0T2zwRq7UNU9x9J0cLoc6huCy1CQ8GPGUhQ==
X-Received: by 2002:a17:902:ccc2:b0:224:a79:5fe4 with SMTP id d9443c01a7336-22780c54d58mr15290515ad.2.1742509835392;
        Thu, 20 Mar 2025 15:30:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 24/30] meson: add common hw files
Date: Thu, 20 Mar 2025 15:29:56 -0700
Message-Id: <20250320223002.2915728-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4tc2leKGV2tS

Those files will be compiled once per base architecture ("arm" in this
case), instead of being compiled for every variant/bitness of
architecture.

We make sure to not include target cpu definitions (exec/cpu-defs.h) by
defining header guard directly. This way, a given compilation unit can
access a specific cpu definition, but not access to compile time defines
associated.

Previous commits took care to clean up some headers to not rely on
cpu-defs.h content.

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
