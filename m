Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178715njj;
        Sun, 4 May 2025 18:52:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/treIVLXaFuh04SmyU50Anxznxt9JSkXQxJB7nemvGafopp/N0y2/4DkvSYESvLNe1NmQe25b2lwEjQ==@linaro.org
X-Received: by 2002:a05:6a21:1698:b0:203:bac4:c6d4 with SMTP id adf61e73a8af0-20e97abe423mr8510310637.29.1746409951444;
        Sun, 04 May 2025 18:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409951; cv=none;
        d=google.com; s=arc-20240605;
        b=YqvO6fJEq5Ulv2e5x9F8FJ6DJ3vWxQuBVTZceOq0MO7W6Kukiy3WOeAJUtlEF6Eb2Y
         mwtyUsFrE7YFtnvPcl6Bo1Y6Ut0nmuU0D7lrAkcF2d896Z1h58psYatUdSdj2xa8rm5y
         3cT547k8QTMdwn/glU+1KUbf2+LtdBNIezTZrWVTfvFq5E/zOGCRlASi8+4qZyzyTaqL
         u6ES3pK0tFSdfhseGgtWelSLU9f8NxejGkj0roJFra36J3/UFLZx0p/XTmVuLXGVOp8x
         ggABJAxyllgUWNlxCuI/q5A2xGfbw/hL934eRssTBu7xmf/xTcw27YLX68Yru+GxAoR2
         sT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+insc5JF0LDgOcxml+QzIIv4GANFmGAhKwH/cRPIB3k=;
        fh=OJRmQ2WfLM2lGfnNsusRGre74OO1PC+AqeR3olx8K9c=;
        b=bm+dgSBAoWEhx2npQkfbjDkEQ7lbSz8/gyjuEQxKPBlKEyO0uy+v62tQD+H9Qh8X8a
         PVcWcHbfs66m4Npp98lMeS6SKomUua7etxegIjampiY8SaBNFARqoDrs+XBgmurYoivj
         8rqM8MH1qeFhIbWl5Zd4EMnGBgxM5EAX+WHBdO6cPUT1t5flZLri6jX4bj1MUsOppSTy
         s21zVdv6FdtP2TNeTE2WLSYSyML36qGoizTFR1DxHe0Ify+/7YkG/BKi8XZIwQsVTwrk
         WXPydJjBHvd5pEv7sBwwvpCTNUf71IZB0UAINuoQofMEijiqdSwfN1P1sz+AfmaU36R/
         tNgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tqo4hWjE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea59e6sor3552478b3a.1.2025.05.04.18.52.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tqo4hWjE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409951; x=1747014751; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+insc5JF0LDgOcxml+QzIIv4GANFmGAhKwH/cRPIB3k=;
        b=Tqo4hWjEPHzWFP+4UP0T2x3HlfF3qTxZ+4i8r4UfMo8ywsNYfDa3Wa0KmVVtDcVcdL
         P7D8O4iPcTbnqxc0cgT2JYgq120FkJpRMQLV3R2FXb3ciROUMbA/y+HoHXPfMVaBYieP
         oRlBa5X1JReXvuB+R9uYCvi1lY315ytByvz9kKiPqAAkDji4NmGml50b0beW38juf9Jc
         TfyUu4ZxSKUe6Id8rReGBZsJt7efEuQrbD+wJpi9rXkyDB7vKNDeVAXHD4LHmBS5df8r
         AoZeTMhXMs8cOP4W1Eu5v96Hh0nNO13MuKAy5EETlaZR1d1+5kI6PZAn4WwTl0oCZnTo
         p2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409951; x=1747014751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+insc5JF0LDgOcxml+QzIIv4GANFmGAhKwH/cRPIB3k=;
        b=Squ8U1LFmPb/TARoex7F98cnfpSpjfHZQspPrcxrYNQ60vdUUo2sj1P0Tw0uDcnk4+
         9G24o9P2g0Rlg87y2ENr/7d30GUPvTJdxtp83B8znGe49k/ivwyIr1LhBHz7v7rOwwl7
         mN2ghpxyuNSi7lINmkff4YpNlXf1SKgGgsI6+98Bq+1zSqPYxZdi6YMcuJYfObeoL5wu
         8MAMBsU+H3F7CRot20Ft2NIFQ628ptYoO32lWziPMAzp7yFR2EX7gXleTsLd7lVvwujs
         42dcS9QTCDRrwuwbEh4iC7tuIQ3mqufvPVC9qPfBM7ftLnAOwcUmeMGEmP+qk6bWznII
         EX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYdQ9V39EjeuNsRwsrlxN9+kUb4Eg4iZWsGUj29bs93bMnIJghXuoi6iCOb/Z+kHMBEB8D2JTTChYUoQ==@linaro.org
X-Gm-Message-State: AOJu0Yy1agAov/1EZT0otwUzzlx7OX4ie20j7q9FGYTbBcLukuxahHAu
	H3HzxQUfnZML5Y6i+HF0d2CMmlw8ZYdwISlVNwP4SqqPhxmY2T8Gmd9MheSdLgBukw==
X-Gm-Gg: ASbGncuAbSi5CuZ5R8iBuGItL5sttZxliybdHrZS1dRj64upEYN8rdCb7yHjQWc5BpW
	+eW5nKY3d8r9pb8JeiN1Cq01ANWCk/yRWILE9KMupDOMpwhQqjF9CkLc9HX30so/0BTCEW0fm7J
	N5mSwu1gEYRJPgZFVH7Y1CcZQqR/2mNBfrD1vFgZ/Jqxxwsuveb1D4mmB4bLU7Z38lPV34HJun1
	NtCFQfOaKSOtFk0NQBCJHvjhEfQsXSKy+NzjXrKePdy+AZt2oBT0fzzRTGzXF5VIGPXzBcj0/4P
	0BEoCmcOC5R9zg9fcC6U+nDPmj6uz0XFT0UC59L8UwlVrLUwTrI=
X-Google-Smtp-Source: AGHT+IE8QIMP7OfGkKKt3trPX6lPSRIjp3VYA8PxD/ZDYRx4dMoMuOmuOKmsaz6Im0Gy3fu/ZCT8rw==
X-Received: by 2002:a05:6a21:3405:b0:1f5:7710:fd18 with SMTP id adf61e73a8af0-20e9660883emr6877505637.17.1746409951002;
        Sun, 04 May 2025 18:52:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:30 -0700 (PDT)
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
Subject: [PATCH v5 04/48] meson: apply target config for picking files from libsystem and libuser
Date: Sun,  4 May 2025 18:51:39 -0700
Message-ID: <20250505015223.3895275-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UXFrZCxTR0NL

semihosting code needs to be included only if CONFIG_SEMIHOSTING is set.
However, this is a target configuration, so we need to apply it to the
libsystem libuser source sets.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 meson.build | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index b2c79a7a928..1b365dcae17 100644
--- a/meson.build
+++ b/meson.build
@@ -4049,27 +4049,19 @@ common_ss.add(qom, qemuutil)
 common_ss.add_all(when: 'CONFIG_SYSTEM_ONLY', if_true: [system_ss])
 common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
 
-libuser_ss = libuser_ss.apply({})
 libuser = static_library('user',
-                         libuser_ss.sources() + genh,
+                         libuser_ss.all_sources() + genh,
                          c_args: ['-DCONFIG_USER_ONLY',
                                   '-DCOMPILING_SYSTEM_VS_USER'],
-                         dependencies: libuser_ss.dependencies(),
+                         dependencies: libuser_ss.all_dependencies(),
                          build_by_default: false)
-libuser = declare_dependency(objects: libuser.extract_all_objects(recursive: false),
-                             dependencies: libuser_ss.dependencies())
-common_ss.add(when: 'CONFIG_USER_ONLY', if_true: libuser)
 
-libsystem_ss = libsystem_ss.apply({})
 libsystem = static_library('system',
-                           libsystem_ss.sources() + genh,
+                           libsystem_ss.all_sources() + genh,
                            c_args: ['-DCONFIG_SOFTMMU',
                                     '-DCOMPILING_SYSTEM_VS_USER'],
-                           dependencies: libsystem_ss.dependencies(),
+                           dependencies: libsystem_ss.all_dependencies(),
                            build_by_default: false)
-libsystem = declare_dependency(objects: libsystem.extract_all_objects(recursive: false),
-                               dependencies: libsystem_ss.dependencies())
-common_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: libsystem)
 
 # Note that this library is never used directly (only through extract_objects)
 # and is not built by default; therefore, source files not used by the build
@@ -4308,6 +4300,16 @@ foreach target : target_dirs
   target_common = common_ss.apply(config_target, strict: false)
   objects = [common_all.extract_objects(target_common.sources())]
   arch_deps += target_common.dependencies()
+  if target_type == 'system'
+    src = libsystem_ss.apply(config_target, strict: false)
+    objects += libsystem.extract_objects(src.sources())
+    arch_deps += src.dependencies()
+  endif
+  if target_type == 'user'
+    src = libuser_ss.apply(config_target, strict: false)
+    objects += libuser.extract_objects(src.sources())
+    arch_deps += src.dependencies()
+  endif
   if target_base_arch in target_common_arch_libs
     src = target_common_arch[target_base_arch].apply(config_target, strict: false)
     lib = target_common_arch_libs[target_base_arch]
-- 
2.47.2
