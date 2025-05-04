Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756218njj;
        Sat, 3 May 2025 22:29:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1j7MtDrON8wPphWGEJuv+QbskazhRjex5gD8Eij1pDIsqtTtF0ogGGXydBP6MsDhaIIfaj8kVHhcgvA==@linaro.org
X-Received: by 2002:a17:90b:2f0e:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30a6198e0f0mr4452110a91.13.1746336591171;
        Sat, 03 May 2025 22:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336591; cv=none;
        d=google.com; s=arc-20240605;
        b=JBaxQpAqN5pKolQoJFXs9chDHAtysEayI6g0o0+k4HEd6xYOSMfZtTPFKHF8JVvGoq
         UyxtgweLg1pWhneulIXeSAZda1ZRnLA8+gEknBJCRA8BR2AG/fgLiA5OdX64Rz0ySSsJ
         xhEAMpMFj2oNAKPCEtzLX7NO3xwTVlKzO2V9ov4EHDEbtRHNRn50XQhLTUH08/qGdob9
         9vBd682VdNxFbbG1lOMoQJ/Oo1VBltNuf1JPw1RyRsvzk8ZFE0qwfBFSiMaFTObMHkkT
         l9GJ+iJHMgIRLAx9C4IArP3hRGlXZ2tMzFNXTMnMXGVgjORV+v1naviQCU7jR3PJHG2r
         DpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        fh=9GEZJ8Y8zJX0Zv7jLcvxmYhRW5ltzzerrukUDxtN89s=;
        b=dx9M7zwLi4yUiFvZMqlciGUfNQL+goXId9xPLNlBANrU8qJ2Px/Kv0X46pvMGlsQmY
         0IAWVjdE6LLHehH/xqp/rKhxxVMn3y/ITiHuSrkMFtReDHEbpESa+jARZeXTY0krcs+p
         soN4e5DV3Pc8Ng6NgNWcly+qEZ5GieP504o9EYTgDFJnuwR9ZM1SA/Rm+2GH9XuZw48p
         6d6TkrFaT1KMbKA5HQ9/7rFmwKb49+iV/JN4SvkQLXEnpiZbuDvh37PZQmr8x7fi+guk
         95BHfb2gN313gDM8o79QsMsLHDRCFtE1QPP8lPXqicKoim0XrI4FDJtVTXyGWJx/r23t
         uaeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmvjNLcP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7f740sor39624385ad.16.2025.05.03.22.29.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmvjNLcP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336591; x=1746941391; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=XmvjNLcPIoRkQNesQbojJg27w8OIWSWyRK0A3Ij+mDxVrcAGQFm2sEzJbBPNCc+BAC
         2eRc8AQoS3PYygL0VzdglBBQ5H8KXd0B5VmIs89N2nOfOK+Pk0stiYHG4jm/dCinqoQr
         9fkZHItnbgGF4uG4ETtKWJqRfzTdGQrMdYZmEMMQMi950XpEsEdpa/RadIzwpkaxP0YL
         0cJz6HEjZ8sDl2F6II9KJr3qcStwmYwDYI1CNffTWMl//w2Cbe3kXxIoHgd0PesiDWab
         xG9z/eOZfOBrgc6TcrIHU7PEhyXlsjKExLqqYWMEoHhA7fqVzDl3OIYZcepjUl6xY0wv
         kACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336591; x=1746941391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=nuxkD/IB0VwdowVzDBKVkNHyvTIgVxROn9Wy4RuH66X3a6juZ4ESmAufEmjysXRojB
         6g5fyhmTe6N2kZU/DqD3g3D5/QOC0lUTrRO4bKZboTq237p4Y0YPXt7pDdfCx0E42pkc
         oFCqRORropF6sBpTYDgrJF6o21JinIqigEvKpbIb1BG0YdFSgYiTyPxxl7AXqS8fvHyw
         TN4FKTH858Ro5cV8zkXNfolnfoiyLXOUT344juYO5loMT1D65p7W041LgGvw9fYvGuYF
         MmWXj2sOvSHAb4x1sEaUfBeA3n2tIUlVzI/T7qJX99kxaczsNaObgQyZKxO5YcthDSzs
         FEYw==
X-Forwarded-Encrypted: i=1; AJvYcCVqoCPSUvOjuaXLqTA1KkxRupzVdGc4CbDckMMekP4X0LX6O1UoyGNxbEjQMhkwFEHBYiuFWpHcOvthyQ==@linaro.org
X-Gm-Message-State: AOJu0YzJfkXEwqGIPa/0xfJuh6dtKpoX78+sUDkTzIFrG9h5pf1lxquk
	n2KJ+MsXqa8QgQVzGcV0oekNQ+kvkHkmgkr3+VtbHmsxpqwqvO+gWLVaiHByEwpyvQ==
X-Gm-Gg: ASbGncu9LDRd3R+QuTJQz+66DNcweXbhSq+ypkMAz7QWnv1UGw7IsbOdaTu+haZWFE5
	tDzRuGuYQHzeCBnWTX5d0GS4Tu/bCw+pvjdRHf77VH1E/rvT0S0/CCl8dTUB0p46s5Oklsby7i2
	eVpWFJhz7fOEVwN5zGIEpAqXdfxDjZME1sGNJZ+tzUwzI6wvASgWnGfGpE8wwazVOnVKj6nKhv7
	OfIgusss9E07tXsYgC5wUtKlrtoLflG+7feqKCygzjjVZafeBbzaX1xcMwbMbtUKQatenan3beF
	e2qAoGnEBl1GDHaAFyV9cDy0evBrA7063XjkOEsK
X-Google-Smtp-Source: AGHT+IEw7LdFolSK1L01aWRSXu0ZYhSFBV06ZwXjbG/l61w2CauR9M4H+Y+brnPiGKAodZUYp8tXtg==
X-Received: by 2002:a17:903:19eb:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22e1ec3e7c7mr45995215ad.53.1746336590793;
        Sat, 03 May 2025 22:29:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:50 -0700 (PDT)
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
Subject: [PATCH v4 35/40] target/arm/kvm-stub: compile file once (system)
Date: Sat,  3 May 2025 22:29:09 -0700
Message-ID: <20250504052914.3525365-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pNbfFs/frYtu

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 29a36fb3c5e..bb1c09676d5 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,7 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
@@ -32,6 +32,7 @@ arm_user_ss.add(files(
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
-- 
2.47.2
