Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779771njj;
        Mon, 5 May 2025 16:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm/YrVPRzIXwXcOiQt5fFvNueIsjdKsz+Dzn4t7QaeCBf6GkSJRGuV9HHrs5BktVcySTS5qjtF7r/GCQ==@linaro.org
X-Received: by 2002:a17:903:8c4:b0:220:ce37:e31f with SMTP id d9443c01a7336-22e361e43f5mr11804215ad.17.1746487451344;
        Mon, 05 May 2025 16:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487451; cv=none;
        d=google.com; s=arc-20240605;
        b=dyIromZ3nNCpi9KvAiTexj6VzukSHDqq3ZeONY6DCe3X5LXfC9FnMIwGr7Xj2OFvzX
         jUkmtNbmw781z6scTacFF6O0bw5QkhkiqSnxarMenmEp5vsKGubInTN4d7QZDiOIXttE
         fQWPrENr+QyJ65PphasEz8GlneKFUUWHCVXWQtZH/PjdXdrrXEO2v7GSHptM3Idgr5ay
         Uyym+RbiR+mhN8xyIsmjwhGgWFn/EPpPF92nPGcyszbsMeQFL57dCx4xhg8X5Mwxl3Zb
         NyBfxuyZAahCBXfBrCZWO08T+cwu6TQ04jEtkcV2xa3Jy8/ttP5WODncm0yYYqTG8BMJ
         nuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wE+ks75IW4zuYyzk7c3HX2M0GM7VkI4W6D0uip1dkOg=;
        fh=tTHUU7TPlJq8GX/hFz9/x1iL3KCefTym3IkTur0ky8U=;
        b=OZwgH9mG+KCe/9ldYe4FUo1pbp3evRQR7t6XOJErYaAIsRcsv4m8aX9IGCpOPhN6J1
         iFYJc4+QbsImKTeINV9d/rSC7qMZqeQM/J5AqUK4pEFcp272q9bqhKWNojP4wedYjmHZ
         7QyvS16mHItZtbcYr4T6D+ye3eL987EB8zCT3+FbpznTiCS2tIIL7bLPgWcCLaSgAHKY
         v3CiX8hUl8PzHgqKozvL31Sa+L0BAq7gA3pbIlFmsDFCHXK2OC37db4LAl8O9IDRECOC
         inbaTTj9q1boPV1GztUOCpRWhf9Ljk6rcmjDK+nPpau0mZuzy5mrUxH544fTcEo/sTP1
         DLag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g4tAM6k5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb25d8fsor57208525ad.8.2025.05.05.16.24.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g4tAM6k5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487451; x=1747092251; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE+ks75IW4zuYyzk7c3HX2M0GM7VkI4W6D0uip1dkOg=;
        b=g4tAM6k5ZnCDzVhGQF0AO0e/WPGxUnKaQsDHzC3Elimfq0HLP5reiq0TzwNBi/C3ME
         Dfz/vKOKHPgciK5T9X5OCpBE+o7bUJBbRMepMVf2qTa98ARoQ3ga6M1OQ/ZgLAvpME2X
         zf3vOX6XVQYl80mNXBEX1xXzSw9IsuvYoDlGFZV/ErfrA2gIiPWq2gVnY9IiucDQ3Z4J
         USu1VDYjmSc8zMXTFy2XbF2YdWb5eBu1YLVhe1qH8iifIY2VMaEgUnkMjcQMTUEulvKJ
         3zxKzKLrxmTe8vz+KMnO8QOzx1mMZHhNNJZh0iiM+w/hfnFn88rCWA2ohbekVRdEoTe5
         HbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487451; x=1747092251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE+ks75IW4zuYyzk7c3HX2M0GM7VkI4W6D0uip1dkOg=;
        b=lZsAZE3OD1YjAjxvJ+uFvxfX5qpPqDgboPni//MSWD2Y4TTVyzutMgrVLGPJbcu2Sl
         VBMyAbSOG+AAq7Qg5gpqANubXs0iTnYVyQ1uvPjqBQ2z3jDGjWZT3R3DKPKDm013+F9z
         g/Z6k6hPhdGTEqv9PGSFzN1P788yV0ccHvhvkmxeUgyfnaCz+eFxTlJFQIFf/gPefuMU
         4lTbq1DotcJrhMWGbkvjRrk+MDcTLMqD4h6RojZT+zob2srXZA7igl4LKPzQiRTzMK1O
         OPZw+EqXyWU2U1NcBZnXFwi8vvZH1DGhRUTOQSNnfTYm9yImHf466KdpXtannPoraI8P
         0y8g==
X-Forwarded-Encrypted: i=1; AJvYcCWB4fM9ZZuqoBvUbCAkFJQROk2+1DIQWMQuwArE/TGgqJVjrxN5nyQUb7raTLRABBpgCwxKueCazK9aHg==@linaro.org
X-Gm-Message-State: AOJu0Yy/5CqJzGUgqzT4CSgBQzz76UtdBQieXd41OyCmlHyqBAPC94C/
	qRjX5sussW/0JPykKZ86MF9oIEQfYqDACHlVRyZ3IfoG7zARX5le2Quy1VlVOte7/w==
X-Gm-Gg: ASbGncsKGi6MHoUAnlBmJDYZurmfDkDgc6VMN1KJNjXLwPCt21xUVKjSfFnLEbpNLKN
	rFzy9BcndlaShMaFnIbW5E5qEu5Oocc6PDb0KjxBm9Am+GeiPCy7fWxW/FdBy79426bSHCMjXUW
	WtM0/W5DUGNM8ClVRk51mLnfGmJO/BFVfV5RPlhajSrax7G3unzxOuFVkPpKUfXR2jmXjexPcMg
	mxn3xuHZZ/rgNVOckxYf8wZvHd30Y414vAZoTYsVDV4a+lG0yK9nm2B8Sya0Qz+F2h3CXM3gbGa
	3ed67nVK1vy1oim1g/IlATQj6e2HdQGT+4ANu6NhbJ7x3ERN9tE=
X-Google-Smtp-Source: AGHT+IHFYgo3dGI6oymiueOZq/2WBNSFS6bNBMqt9jfge9pyyjbKnOcspVMZnv8e5GSJtvTzFP61hg==
X-Received: by 2002:a17:902:e80a:b0:220:c813:dfce with SMTP id d9443c01a7336-22e363ac721mr10768215ad.39.1746487450836;
        Mon, 05 May 2025 16:24:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:10 -0700 (PDT)
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
Subject: [PATCH v6 43/50] target/arm/tcg/hflags: compile file twice (system, user)
Date: Mon,  5 May 2025 16:20:08 -0700
Message-ID: <20250505232015.130990-44-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YeDvplB9fuR7

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/hflags.c    | 4 +++-
 target/arm/tcg/meson.build | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index e51d9f7b159..9fdc18d5ccb 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -9,9 +9,11 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "cpregs.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 static inline bool fgt_svc(CPUARMState *env, int el)
 {
     /*
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 2f73eefe383..cee00b24cda 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-  'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
@@ -66,3 +65,10 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 arm_common_ss.add(files(
   'crypto_helper.c',
 ))
+
+arm_common_system_ss.add(files(
+  'hflags.c',
+))
+arm_user_ss.add(files(
+  'hflags.c',
+))
-- 
2.47.2
