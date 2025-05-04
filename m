Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756082njj;
        Sat, 3 May 2025 22:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwS532CKdMTxE1Zwwh37ny7ztajdcS4//qkONuKzSJ+CYhBW7WUueF8kKpPkcwMLHzqHWv4YxG1ZL+xA==@linaro.org
X-Received: by 2002:a05:6a00:aa05:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-7406f0ad1f8mr3639467b3a.9.1746336564607;
        Sat, 03 May 2025 22:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336564; cv=none;
        d=google.com; s=arc-20240605;
        b=BzXGQxiRSIZWGxHlgJp4U4InEOP6zWvEPpoxlLmIWMAiLcm9lj5ow+/PEztjIiNDr2
         CnYV6E70BWaMJ6DRmjwD68b2fvnXHL9Al1h9YW3X+XomM5XzmRrYjI4fQlV3srW2s0OH
         AwISjRcAvVMBB4ibEJAQnPNI3suslSl6nqNaVUhB6J/mRy6MdtrtbpY/Jbu2Fq2MnoOo
         t5oNCqGDSe9pOAAEipZKl2D/k3YVCkNXQ0tI8kJBS8Run146z73iKBUe39q+43Z6BSpu
         C6UGJ5wN6FxcOktjBAEnm+lc4IWAdEcRPz6cbzuexyEoEddUISITlq3GYlI/b16d498M
         HMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hPUzfDhhl74FQ921XpGJdIiei13N9+1r4RBflBlQkuA=;
        fh=BvH28gK01Jf+AH87NcqCFJrSiFgj1teE7NJqchSZuxU=;
        b=OBkXGAMYFcqpZffT/6e0FLosMdvgzOwQw7yPbc3iAIpgGrnEry4vgHz9zI9Ue/RM1W
         rie33r22fp0FcwKucaLfnuR7fhXh4xw9bcKWQzhTyK93KqGjbWHcN8/wxkPv7o4cRhfo
         voF8q4s+jaEXZoR5VfR6X8tK4GHS5ZIn5Q9yhZuUMzuuely+Reh9cyZzBJ7l+9bumuRs
         wUY8e2xM1j2TYgksjQLw+m01bjMVUnK+oA4svBjIrNRKvWMBVBZIUM5loG4QcrCoXwBg
         vk6htWkoDugWUSSMjq/xrTFRJc9DkwJTTbW9Rwu/T2scwCjjpCG+x6AbZ/5v9ayT4ruT
         MePA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQCSOmzK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea59fesor3103181b3a.2.2025.05.03.22.29.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQCSOmzK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336564; x=1746941364; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPUzfDhhl74FQ921XpGJdIiei13N9+1r4RBflBlQkuA=;
        b=KQCSOmzK9QcFUp6BG1z3oxtOXmweYwjY12D533noATVo2286DSbVy5SKKcO3Ya9ewO
         /zYgSQMx5jErzAWVu0iODeAfsuO23hvODPJpMgMhUfJ7iwjcht2DdJeByDRxP9XvHkw3
         RyzMjv8gXpAY3CYAf1iGcxAgnEqJDD16/xTmzebRqsB4irO5CecXKNAtk5hRvikge3P7
         k5SYzU9cS92Olo82Waq1zoBE1ut3rEJDuKBkw1C6NUWZ9ekylMeQVTLc0cHZE++/8Naw
         mGOn/KytTBiqjQgeRyF7qhEMBCwxNxczMJBEaK+cwMfNC+KcPfo4qBoOKNzyLYeNPT8I
         Y29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336564; x=1746941364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPUzfDhhl74FQ921XpGJdIiei13N9+1r4RBflBlQkuA=;
        b=Y1zjOAyuV4eNDSNv+kapleRfqX2cGlIf7ql9DpX0K9wTnf27wYiELocC1V7a+i4QTf
         1a8gL3xQZaytnpHcHBKcK7teOIj4Gru8Qz8aDJ8cSIowC9udAVWbHltvgn+IOKSe1IfD
         H5HeINg23K4Fzvq1PQJLO4K8Cs2GTLYgoptQXMU6jntaccwWuummRFqWTh1vIFmXNGFd
         37P+se4wDDHHXJmsxR9E04c2bp0DBQ1EUsVyMgKVIhEfNhHtTeuec1UWMBIKsf5Q2BWA
         uYr9nlKrpSBjjCnK5O6hQFTTQCR0++6kODG4aG0ubYFYhq6EIdiMFIqyGk+Di7knjbgz
         gN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrd5uda/8lXeVtrKln3LrMOPva5E42o2sbROjDh9tenm9EVAVFe1bO7Ng2l+330uhXS5hBoTpgF2mVYg==@linaro.org
X-Gm-Message-State: AOJu0Yw29lXQOrT+uSqXrQReONmCw8FF91SbzABkLx6ZOTRWoZ9s7Jcv
	jsxeBzhvUdWYzlhVjgfVVRvT+1OL1ovIRUBvlVqviNQTm+BsFRO7n++Hi4RrhsFNPw==
X-Gm-Gg: ASbGnctW2rilWWxe7T4ddd1H6c6A87OCr1Z8YHwVQTj+uAMnnXPrSUw0JYzhnI2Ih8V
	fIuBR0VJSdDEgHJ6WXWsxMg2BVg+pwg47YYonz9+QujHYbBIbl5METlZH4VEuAzqa870DAo2/j+
	oAk+sl4YpTo/tTddKmggakqFHMyvGb4G9cMyb0JMClmxHmNQrIjr2J57ReNFe4QfviE1RvFcncT
	JH/JjApDwwdgljCVJGG03ulwMrQev2C9FRVS37n6I9S8b6bkS8+lVq15BPVSXzGRFEV2InxH1LX
	9Qox71CesrJ8A3VTPtv5ecpcqFcSIJs4Ubs3sujO
X-Google-Smtp-Source: AGHT+IF6fi7TCVQkX+/SReePQP66TObCTTPRskSVKzeExfBKNEWQDe0rnw6/GqhpugwJflD0L6wMsg==
X-Received: by 2002:a05:6a00:ac0b:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-7406f1a4357mr4097937b3a.21.1746336564105;
        Sat, 03 May 2025 22:29:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:23 -0700 (PDT)
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
Subject: [PATCH v4 04/40] meson: apply target config for picking files from libsystem and libuser
Date: Sat,  3 May 2025 22:28:38 -0700
Message-ID: <20250504052914.3525365-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /kmTBE6FxWyh

semihosting code needs to be included only if CONFIG_SEMIHOSTING is set.
However, this is a target configuration, so we need to apply it to the
libsystem libuser source sets.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 meson.build | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/meson.build b/meson.build
index 6f4129826af..59c520de359 100644
--- a/meson.build
+++ b/meson.build
@@ -4056,27 +4056,19 @@ common_ss.add(qom, qemuutil)
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
@@ -4315,6 +4307,16 @@ foreach target : target_dirs
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
