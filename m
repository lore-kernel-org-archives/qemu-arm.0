Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694640njb;
        Mon, 17 Mar 2025 21:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGHEZavvsh1kd6U4hII7WIFcmMU9FEJirvBeTT0V1slvSnUJMP35LsXGrgptTBVz++G8Q8dOavxOYRvg==@linaro.org
X-Received: by 2002:a05:6a00:181e:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-7372243e746mr17160162b3a.18.1742273504839;
        Mon, 17 Mar 2025 21:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273504; cv=none;
        d=google.com; s=arc-20240605;
        b=LPLNh4S/c2XxQpmev+/Vo5++1P4EgemngCNM64qyP41SGSPBTKmAABrULWNnf6alQr
         EemJk062ilkJK1sw38amoVzCLi7cdrstbwPI8n9YxaEUP7Z9NKIyyltm+JHAqe5+GnVz
         V6Bbsx/xpnNiZEUHBaGD3IS33N84cJpm8QjPbAdQrbJgbGigRZYpRM/Vskxu+I49bM7l
         WIky0RPa5cgEpoKYQmVnAdLDG2BRuiHt8e8si5sXCajYSzPbKgjxIuaTe2fTt259Y+cc
         fyy8DlPrtDuSB3Yz2ASBWG0/fi+tC8Mh8zMl6q82fbZSjaNhRXNzsapChOup0TJMgYcN
         Z3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ek8XPpj4hrtyNGDcqo+uXNBksQzSJC0Hy5Yo4DqMKUU=;
        fh=W+mntSYrNq7ln05sdo1eK0/5APCQ3ipeQuLGb0QxQWw=;
        b=GXuyLeraszFz98a7qrEUzAr9r5XIKmLQd7QPQ1wh5letn+yMvMFY0faTZ/aoDyPZd2
         odxarjf8IeDONqnff3BgflJx2cMMYqyPx1Ndzvq8ZRo5jm/tc0hl9+uKs+KoLjIyK6y3
         qq6/20oH95TaGhTEmKBpeiiX2/xB2sldk+csi+x9qUzYhr6SS20ogC/ktmhP7AQ7p/qq
         +Y81Nph9bTBgTeRNA20xhCpRKzPvm6uvICc+6E3Td5hIRo64cYbHvBwAGy1Q5TtSNz2Q
         zbIPoTM7Uvd2XST1cFkMBwKbODPDl2A5V5hKgGAWoQ0BTY6gqnbIqRnqsz7JKrtfkv0s
         lI7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQvg2xWf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73712bed668sor5428558b3a.7.2025.03.17.21.51.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQvg2xWf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273504; x=1742878304; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek8XPpj4hrtyNGDcqo+uXNBksQzSJC0Hy5Yo4DqMKUU=;
        b=IQvg2xWfsxlU2yWq35en+iuNumNfkVpak3D2iKpKllbymNRhycxJwhw93Zu0MH94ZT
         R1NQkDZLvJBzr8Cb6iC/T1fewZIu5ruYj4z898TK4DNR9Epew2XazCT/+TT5sYQVTloA
         jaffbZtXrR/pvr+1QBTAYGEIfrRgykLTo7ly48GrslP4WxgDpjoC3KTMlKWVJhYmTcYi
         XLkGAjA8XLBqVAtXeVClE9yG/YtHOJeoMNmhQ2nmKW426vjAf28FtA863eW2o7s3rV+g
         XS4yZK8+bsj7M9kVuTGDd+gIZZI/8ETs79oTLQglkvwycVPLJrZvrcfaVMYeEUfV0UTl
         MxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273504; x=1742878304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek8XPpj4hrtyNGDcqo+uXNBksQzSJC0Hy5Yo4DqMKUU=;
        b=ubdNyd+wAE8Y3fDhX+y3CX0kLOjKRrVwInF0AT/V4VSE/A6jdVGDWg77hCl7hiYYMx
         hxSwwDpdiBJoV6LvkBH5rW9PxBaNm5fUhCrm3pCnorBmFJhzqDkXotM/DQ1WbTcYjSJb
         Mgf/xl5vaUpN8wkt39vxFQfi3Q1xIYmEye3+MAjvxQcJ9MyD6T61Bmb2z4wPzB04K+KS
         HbfOT3c3YVyx8Srgjg7AhgIBRhs3CAxIcYzyj2NGw9M2ZbR7jGdX+GEdxYWWVj6ozTgY
         6Atxt6wzSY9LlLmJyjZXo23+QBNaszEhkVyOCy/UeJFDFpRFgEZYE/Yh4k6IdpN8nlBe
         56Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWD+ZX5RHQwHfmUi6EH6EHLua7wPnDlKv74uvlKFFGtdUw+E5SkFG1a2GQnqPdvG6ZehicM+D7rc7xUEA==@linaro.org
X-Gm-Message-State: AOJu0Yyq/l8CeaRtJYbGhhIjgBwp2N+hVWb/hasJ92F79kWXSuL6I8gV
	st9qvbPXOoseoG4MyBwi4Z/Lt6YlkmZEjuBPxArK3LoMg7zChRZz0F4cawmlhUHToA==
X-Gm-Gg: ASbGnctNj5nWLOo6xSO/UwMql0/891Srog7K+OQLdcxODinquDVLgELUWX4FeV0v7oR
	AycSSIalFnT6CShU9PVYzvIY/BXC5LcBAE3iy/jpbt7J36U60uRmu/xm1I3zGhmrgxH3LsGoq8J
	D9xU0sJk3CBnlaa6/YaeyXUz9owpplu/hUREGYOccNbVcc0wHTlWyaYdqN8+/ZTsA64gab1wCuB
	RUe9sJOsMhFMqiX0LlmUkalnsu8V2FD+bvGzjg/uPj+Pr32QHlDtSZ8VaJWeIXf96Fdc428eymL
	kT05BV8c4vBMZWLTfmoIl9/GpFZwzYheEFx+ky102yrs
X-Google-Smtp-Source: AGHT+IGT3hRB7cgRAOTfF6ymEpowIUFgQzMXE5GAC2ISpsBZy5NX8Js4RVALQRBZLAuQQLxc3QHe/w==
X-Received: by 2002:a05:6a21:68e:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-1f5c12098fcmr21810295637.20.1742273504481;
        Mon, 17 Mar 2025 21:51:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 12/13] meson: add common hw files
Date: Mon, 17 Mar 2025 21:51:24 -0700
Message-Id: <20250318045125.759259-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: e1YPEErETFqg

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
 meson.build | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 672a0f79d11..0dec7d9750e 100644
--- a/meson.build
+++ b/meson.build
@@ -3689,6 +3689,7 @@ hw_arch = {}
 target_arch = {}
 target_system_arch = {}
 target_user_arch = {}
+hw_common_arch = {}
 
 # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
 # that is filled in by qapi/.
@@ -4065,6 +4066,33 @@ common_all = static_library('common',
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
+    src = hw_common_arch[target_base_arch]
+    lib = static_library(
+      'hw_' + target_base_arch,
+      build_by_default: false,
+      sources: src.all_sources() + genh,
+      include_directories: common_user_inc,
+      implicit_include_directories: false,
+      # prevent common code to access cpu compile time
+      # definition, but still allow access to cpu.h
+      c_args: ['-DCPU_DEFS_H', '-DCONFIG_SOFTMMU'],
+      dependencies: src.all_dependencies())
+    hw_common_arch_libs += {target_base_arch: lib}
+  endif
+endforeach
+
 if have_rust
   # We would like to use --generate-cstr, but it is only available
   # starting with bindgen 0.66.0.  The oldest supported versions
@@ -4230,8 +4258,14 @@ foreach target : target_dirs
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
