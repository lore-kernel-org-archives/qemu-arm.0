Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778147njj;
        Mon, 5 May 2025 16:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXg0op8VLHR1qptRvm24udvY90ACwf2Td2nrbSiILcYfqlyB7nPR5okRxE5kFg/6vPrpWfCJ/xDok4OhQ==@linaro.org
X-Received: by 2002:a17:903:2f4d:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22e32756795mr17462855ad.8.1746487224616;
        Mon, 05 May 2025 16:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487224; cv=none;
        d=google.com; s=arc-20240605;
        b=FUwJBfv7eVH+XnEBVz2KQ/fFc/6ulkTWs3Aq5el0v4gwGRp6ab3Ihc1hZrelbRNAOR
         9huclnalUJISp7A8/lC1WjtwHQRADWIrktS9SuB3lJTad+lIR6nNFLE9OcOaoqFh2/ht
         m65BU7ILQ8t3D1EFXzINVQnmacXOW3aSF4bKRtCjq0oNbgpgjHSwHPLiQPUlb/CG2y7B
         p8e8lgTZ96RsVFeNzrluATmZb73DGKmVGeWzfNcD5DmOLZMV/M6wx135K0fI20/6zumT
         34+c8qH1nL9XsL34SPK1vJCyAZs6eYQCZ75B5nJ4gHX1ogKdg2g7PmQ847s31pWnfhzV
         of2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oMNeg3Y4FuUndpYOZQCJwSPCGo/Nsl7SC/sGcqIL57A=;
        fh=Q0vhaSQssZmnBx5CZNOi5gBKMTsXfBKbtgMtjIqlM0U=;
        b=gcIgKkC99nweMRowFeiVg+n8iza/xhDfrJBUHEeZXVq4+oDLlkE1uive0zL7W9Jrsq
         aMfo3knhr4/eScppXnv3E9vC6s+9p6wdQxSqddp1swHYyhGFYSb9j7tbZwaIs5HybNlK
         bCUQaSfmViItdySPJ26BHeawLguSNsl71WBLeg3GWScBfgvJd9xHxDW7NSiX56Y+ORgI
         O8P5Zqe2w0/1cmmh+17hWFGZHsy9jri0rJrrwxecFJy6nAB9RyFIUT55q0i/ylafv6Qh
         LIjjuufaUBVRQtxNZzwLLcWUXPZxUCnv/Y7lGs8b2ip8mFZsW+ae+kI2xuW+jk3Vnd2d
         2+FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTU27O7E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba7f6cbsor45421455ad.0.2025.05.05.16.20.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTU27O7E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487224; x=1747092024; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMNeg3Y4FuUndpYOZQCJwSPCGo/Nsl7SC/sGcqIL57A=;
        b=KTU27O7Ew6m1wJLXxDFpi1o5ozSBPIeGVm3d62BZ0Npnw0PNIgeLUoL/ywEnuOdjgn
         3nPbwmL6sXX5G4HvRzebXh2kjvZIAKfLyibZx/bHm4F/mxs5UI9yMDPM533ZUuOSgRuz
         rOa9W8wMbex4bLdvKEupahltqLR52aIn7/rsgoGwYWcP6xlDOOFcFQggR3FEG2sCpetS
         zXFbRrW7ALgEHj990ipgsf2CSoe9prwOJOodIG/IDT13VD0GErDnipHnGxr+XlQUu4Ov
         9AQgL9IWWYf9kKh3UOKu324rIzbkJI2eplXDiGjXOvw6+T4lykNsvCdxS01I0TrhHgYf
         LQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487224; x=1747092024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMNeg3Y4FuUndpYOZQCJwSPCGo/Nsl7SC/sGcqIL57A=;
        b=XctUt3nhh3C58OOYJ9+bNSUu3UbN5sEMxJtfn10ZSHvAH4RUkV5zp3Zvo2gbc5uies
         ozfdMPJv5GaDznTdcM9te6xE4ICnLY9Z9vOZHnbdR/qD2Dhc90x+KjSg/whS2fICRBDS
         qe1xkvtlgrhttvE0PKyBB3hmqn1e2vnMP7/BkGibi/DyhMiU5cHIPtjH3qsfCl3jn8MT
         g3jmjkENsecf66AyABn64VZ6VLykgcrVEcwA/GM+hskM7UPPf1wB5kO7d5oqKrD054xc
         vqWihFl+coe7IxFHAo2YxAk0c1FD/5Gm9u+fvj47a1H345t2uxBX+fm4QoOIFDhq7DYS
         BHtw==
X-Forwarded-Encrypted: i=1; AJvYcCV93LGS3v6CyQjrh2PPQyBU4LopJuUsI7a0lH/NqyGaWWD4L01rjxtZAtx16YHF3+d5nQWjhVdJoakFQg==@linaro.org
X-Gm-Message-State: AOJu0YwUWHvgqiXWa9jnPC+UAt4x8Za+wtAcBzd5B6rwEt7d5zNgrmg1
	GiYHQLKM0ASO99HV045caqOoFxCODu598Dmi5FgNdcHO2AIeMnWSDWbJ4ksnKwXtiw==
X-Gm-Gg: ASbGnct7UkpSfS/fjSBJ3yOFLkHX/InFAsCEvvGFLrrslWTIs05WHJucOuoyqcSrARe
	HDLoDreuoZP/3QDoV4NCxz+MRuuKGco+gx8bRmZ3YW8BAIN474gKIsxs/XGcDTHroSwfSFgRj4v
	5xrfpMW41L6ZcizMnxxwoVSSPjI/U1pmemC+gftd4sGyMYTABuxTBA4oUh5M51eAW/qpIN8ctkM
	hzulJTX2nXwaDLauGGIMnwbrpW4REXdVinX5OUfp9jTAYWvWTE3ed9YP46g46erzBPLRjK1RbNl
	vX2YGqKDuo+Sd+JnRTkr7a+Dxh7LSAqpczeBnnHz
X-Google-Smtp-Source: AGHT+IHoFN+rr8Lwq19Sx2mB1Yb2Gf6GH5Yb4OTaXFvREpHxBgl5rUjVxpoL1Lsyqn6N2c59nXy8cg==
X-Received: by 2002:a17:902:daca:b0:224:3d:2ffd with SMTP id d9443c01a7336-22e3285f134mr16144225ad.17.1746487224186;
        Mon, 05 May 2025 16:20:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:23 -0700 (PDT)
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
Subject: [PATCH v6 04/50] meson: apply target config for picking files from libsystem and libuser
Date: Mon,  5 May 2025 16:19:29 -0700
Message-ID: <20250505232015.130990-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7iCHI0aoa1CF

semihosting code needs to be included only if CONFIG_SEMIHOSTING is set.
However, this is a target configuration, so we need to apply it to the
libsystem libuser source sets.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
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
