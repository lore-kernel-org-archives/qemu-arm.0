Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756097njj;
        Sat, 3 May 2025 22:29:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8GZj7SNYuqHUPA2da8iuA67P2n8Qah3yjTum3v1TEZxfiQa+GCGZpZYaqFyuQ5BwBdxD6iLn1M50nOg==@linaro.org
X-Received: by 2002:a05:6a00:4090:b0:740:595b:bc43 with SMTP id d2e1a72fcca58-7406f08bd7emr4530668b3a.3.1746336567872;
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336567; cv=none;
        d=google.com; s=arc-20240605;
        b=WswbbF72hdGj5U7I/o7oWnfuF08tA6JubI4n3b/n/oJVL7MW37fa7YrYHglAKpx62W
         65RdthZeAK5qOGyAtvucqz1A2wAYHUnv9HlKkD1rVxGUfnMMwZ6t/MUJ4SI3DVBeZkoW
         NfNoEGrIA32uV3JTLvWXKlTgWMq4kQik8XngcSR+u3L/XXM2bFVfl0UKFweLV2ksope9
         w3oaCzUG4/TGmVzODGasipB/ITstUIE1oNLNK4ga+M25XiqKkvBJYzSvR1Z2ekdNE+RL
         aLE/CQp9IKU6kXKulrUFhOkzjQoREzt0WMycKutUdBSV43uo10u9azNC1KruOe+lgp1F
         Z2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        fh=dNhlko+wTGHiwLDZ8/GJuBCSBlMd8zyOHl/qyIZjbYM=;
        b=fdWv2pcYeLzO/TYZdMyQU1v7Zgt+++io+N9i+lDxgYhseLhE4Q1heIePm/JPuaEJ1w
         1aw1zacn3af9HKhQH3KOl2y8rO7VOibjmb4GGBTVkKqaKy/6l1YvXT4D657SawRBIF59
         qLGpLphFF9Pi2s70BQbipesr6hth/J6RmqzEHIoxQ8yEAL4phovE8taRzaRaUOlpoByF
         wOkKcEloQ/JovpwQq3PxsUsa5iZveMyV4Gyc3nAW7T8jIPDrF0on1qzFW86PYQskEzwH
         Ae/Fn/6N+Jjii838KquqCBQaslc8l4iDktcocpA14MJmzvuleXcyVplQwqPgbdnQ31z0
         hKPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLIQFsmt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5a2ebdsor2788339b3a.0.2025.05.03.22.29.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLIQFsmt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336567; x=1746941367; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=sLIQFsmtJA4vVpEgQCy2fTKeukMxvnZHKe5nXWWItdtTLQnUBlNMVVLf/vO7yU6OM2
         7DrIL67vchZ5BjO8xbv6lIQtlk0jFe7TnIlHNR2NveAR++q/yXpCwsLcbWjJ9gwMDCif
         TpM2I0T0zeq495c0nU4zLxkKibrr64A9w+sdztUnFecrkMR/GFcjQtZEdZgdR/M+ro2j
         9ZHL3WFBcEYGRWgKD4mcJAZwfv6ku19BVQtPUsyyzSmrD/p0yVMPGLMeUt3EQOmNcqpi
         0Sn7/1PXtFKqr7VBbJ2zFO0ML/2UAjcX9CesDt7Sqp9umI032QxNA9UShM2mrtJCWdp1
         OaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336567; x=1746941367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=GrtrlkQyw/YbSB1YqQCvawahhfrkGmfLGO34Rbnx+nhmdbKgMkTx6drbigPePiFK3i
         cYpoPq7HrTMriposiVFFNMyse09CFK/Wyo9x/wJEKt8RZe3FVONQtb7VZn35Hf83q0kK
         CI7ROujed2Q9vLHuYZ0Dmewd9hQUDXAJru31/ypG4Xs0zV34kDCwTdeDhvckgKN4EPSy
         S1cUeqT0VUPhcw+k6ZzjIpEqqDbUG8fcOZVQeInyS1P30Gha8SXtlw3WBEimFNplONjg
         7JrLcThBhDfj261RdhuGCpl32MH8G2rsOPE+rHLDmBlpSKIKKgdz5/cwt4ZbolsQFE6K
         YqFg==
X-Forwarded-Encrypted: i=1; AJvYcCVbA6blVIjKyDBuWkpOPObbbk8paWLdooXOcF0WW8CZDwtSZ4d3tXBxORjPRYneCiOiZlOcI/HucdcDBg==@linaro.org
X-Gm-Message-State: AOJu0Yw5jUAnoO0Nxoqm6i6LnbYI2XdMdScISmjbJgD51EL2X1pwhMPq
	C5QJcX9dYMfD2pHXIDeXMQz2Sr5CdojOA0h0YDc/6Sll3VkehbOdMevtlrt67OjrvQ==
X-Gm-Gg: ASbGncv3IOFjBOvgp7jKHQt7WTxKJb8fB1FhOsguKVJRmQuwXMINoevFw2dATKfJywF
	uTQVsLvaBKCjp3r5FlLkbkwEOHWOGzE40CyyZJ9XZbwRdpV6zLMcnN3O4+E2uGebfKWYo/wRI1M
	CE3Idi6+EftEkgB/GKq8IOrjKlx3BZfPvgVbpUV94r+ImRnEs+t1oazAFL9BY5WY5GrMEhWkla/
	e7E73L3CVaBB3bLkz3IUod9Ul1j06c+Et96sUiVY/1QhJy6Qajq/Gcv7geSxD+2vJl7+HyVPxtL
	oU8lEBhQU0o675gz/ymqPJoynMqWPh1BPqQti0bA
X-Google-Smtp-Source: AGHT+IGXuGRVL3Kp8Tbnh2lq0xrBRJpVKeq6VuZp/yqp7m4DrchYSA4CAHT6B8T4OdtYK0I45HTlWA==
X-Received: by 2002:a05:6a21:158a:b0:1ee:d06c:cddc with SMTP id adf61e73a8af0-20e979c95eamr4856736637.30.1746336567495;
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:27 -0700 (PDT)
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
Subject: [PATCH v4 08/40] accel/hvf: add hvf_enabled() for common code
Date: Sat,  3 May 2025 22:28:42 -0700
Message-ID: <20250504052914.3525365-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WWWXFQHStjAq

Other accelerators define a CONFIG_{accel}_IS_POSSIBLE when
COMPILING_PER_TARGET is not defined, except hvf.

Without this change, target/arm/cpu.c can't find hvf_enabled.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h  | 14 +++++++++-----
 accel/hvf/hvf-stub.c  |  5 +++++
 accel/hvf/meson.build |  1 +
 3 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 accel/hvf/hvf-stub.c

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 356fced63e3..1ee2a4177d9 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -19,15 +19,19 @@
 
 #ifdef COMPILING_PER_TARGET
 #include "cpu.h"
+# ifdef CONFIG_HVF
+#  define CONFIG_HVF_IS_POSSIBLE
+# endif
+#else
+# define CONFIG_HVF_IS_POSSIBLE
+#endif
 
-#ifdef CONFIG_HVF
+#ifdef CONFIG_HVF_IS_POSSIBLE
 extern bool hvf_allowed;
 #define hvf_enabled() (hvf_allowed)
-#else /* !CONFIG_HVF */
+#else
 #define hvf_enabled() 0
-#endif /* !CONFIG_HVF */
-
-#endif /* COMPILING_PER_TARGET */
+#endif /* CONFIG_HVF_IS_POSSIBLE */
 
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
diff --git a/accel/hvf/hvf-stub.c b/accel/hvf/hvf-stub.c
new file mode 100644
index 00000000000..7f8eaa59099
--- /dev/null
+++ b/accel/hvf/hvf-stub.c
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+
+bool hvf_allowed;
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index fc52cb78433..7745b94e50f 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -5,3 +5,4 @@ hvf_ss.add(files(
 ))
 
 specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
+common_ss.add(when: 'CONFIG_HVF', if_false: files('hvf-stub.c'))
-- 
2.47.2
