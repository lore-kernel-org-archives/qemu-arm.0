Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004570njm;
        Wed, 30 Apr 2025 07:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmLDgiq7k0TZMnloRyggz0vb1fH03mD+hPACFy8jsJL+jfsnqGUaZa1z+/QPskn8KSpWryp0mq1ABvBg==@linaro.org
X-Received: by 2002:a17:90a:d610:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-30a332e9d4cmr5274489a91.14.1746025137237;
        Wed, 30 Apr 2025 07:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025137; cv=none;
        d=google.com; s=arc-20240605;
        b=aZw4hADQPhiKgXGdcDwWztkbl7tAVck7uVfdl4u2t4/vB+NKz5xNado/QxljaW5w9j
         6d/3R3ibMGL9qLuep4RLUKbreJOeR/LZE6wRlCxqnMEvxJpy/ZkO96+tN0emwY8kLrQj
         tPI2SaVRA2Z59poSkrbjsAoKv+XO37Ji3pHWkh8mFTzcIx3t9ozl4ZL/H6R3Y5cxeL/A
         AS7hIoBWfswc1cbGVm/lNk0izza13JararSUlsN3A1QNtmmOgWFSjqptbSJOsvnn5zEl
         Us3Bdx+fDASu5wZP1ibqabD67mqIGQpFImTA54/ijuL7qdg7oNczAgYbef9k0He9ZxAr
         rC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gyyYrSBpMjZGqDtX9J3tyJffb7EP1/gzXVNNR0hz1h4=;
        fh=CxoA7ByraBzbgjxGvehWcF7vhcZfqvB4YnWqi0iURZQ=;
        b=MP5zhBfaA1MloIChL03RmY24j2TjWqwaKbMyeyMxdqmuWIEjTzdmlPJbG5jXtB4504
         IU38/8XuC1aTj62LcFF0nMJgKYAbPS1YbWrqykwBSbOjQ+omlvFBvHuPrHsSDAkqdiqz
         1YC+MPExkKJ578HiYZ2EyOL/mMbN/hAx8gnc88TMWggZf3zUzt/LX6VlDK+8uojcxTgy
         nqfazTU2q0hbkkISznLhYMUayp6Y/ZvBQDkChh1pN6/cTSNLG1DNzFfI7cwio6XQ6jQX
         kRjsl6ooH78OfW3nxNzH3Mkearz3rLGa/L+vE89NF80CmJP3E+A5GaKThC5JWJ9+8dYB
         HNgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ug19QDer;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee84dbffsor12028934a91.8.2025.04.30.07.58.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ug19QDer;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025137; x=1746629937; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyyYrSBpMjZGqDtX9J3tyJffb7EP1/gzXVNNR0hz1h4=;
        b=Ug19QDerDoX9rNJL2P1ASPrVBTeoiAIVPCkykQwX8vJ1Tc6Z3Ai974LtjApt169zXA
         2pnqnz8/M99fkROTaUZD0SjS/y6PX9Y5ciMFi8XPdtaWhmSbZL3xIHPYQ0weE8N6qf+/
         Gfzzl6F88JVTJGS1Ec4WlMoZlaGWeiRgbyq9uZgj2NKJSt33rDmKkn71z/0dHzdHmACj
         5Mh5XkFxQMU8iRtGNa7mXX6GlFKc+vGZ34TLjzgtptyylRD3EMIJoLUERWLfHikw8qd+
         SX64sXWzkssTftNNaNC7N3mgY5hlzSSYqqDxohTggj0QuPRFsooQp/9AeADgsAE3xpT8
         rQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025137; x=1746629937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyyYrSBpMjZGqDtX9J3tyJffb7EP1/gzXVNNR0hz1h4=;
        b=G3kxDGjnPj62WrxZIu6UI8stG6Vs7AcJZg63oCPmwgX2rnJZn76VtSpGKwuISLvMhH
         e9GLVaC4FWbvTeTWJYH/FG2DjB8Ax7rpt9dpLSsQTk+9fsWs8kt18TOkUfEBikSYwEK0
         iIzDgw7yKryHrTkw/nTdvjpje/1zsbgrJ6qNEh4o7O3/ocwLBqM2bDY85Zt3vlhNgb60
         cTwYo4Pr5dYOaHzDgaJU5bNME3PMf2zb8A48rKNaAne6df4DGdV6E1we4mo5Df3YoD9b
         WeYKKAx1+X0gkgCS0SOMa75BmUuiY/M0iErZaCxXcx/+IUpt8PUSNj4xgLZHO/I62zJq
         JtqA==
X-Forwarded-Encrypted: i=1; AJvYcCUjTspiKX8hbNH3C/UILnpYiKv/rbUP4lCy11vP0LipQsozAtIWhoNg6VVWFRgFeZe6STqcAKn9c2fo5w==@linaro.org
X-Gm-Message-State: AOJu0YyT5oYknaHbwmIAi8duEPVcyHAiOGyEZPx05kqoRSpqvUs19D9U
	2LHGHnULj8sVsuQ5fknjB4ug8UYrlUzxONANj39tLH2A+DYi97x6U3RaD6Exci4uHA==
X-Gm-Gg: ASbGncuiyfgw7ugy+NKM3ux5ndO75WGXGXKwbDLyB6w4a66Iqy23pi5GJOvBlKfgSOT
	Ue3Dv7Sey8lnahaoRavZ55eBI5kD4aR9A1WbN2D6D53YhY2rBv4YaHN6+fjYrl+kcdrAcrR5WNs
	/3Aet86ObpWzpwfJYs4sxQ8DnnDuVI62n35PgjibV5NRrMmfM1u2W0tsU90GHnb2JCCEWZUrfvf
	SwOKSGUz9wr5RWzNKtuy6UzOkm0i3Yw2KFHs26gKX185ckRRJ6xEG4Gq0vcQWIVG6SsYX6yV6QS
	7Q3LFFENkDEl0uJf3rxejfa2Cwoov+OiOfdDKABU
X-Google-Smtp-Source: AGHT+IEvk2/k61FiGJWqrBdSZmySJhG8AGUsfK2QYU6mePeCcDxMGSFr3zXKpTA2K1BLZ1Ge2SZ7Yg==
X-Received: by 2002:a17:90b:1346:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-30a333530c8mr5040805a91.28.1746025136746;
        Wed, 30 Apr 2025 07:58:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 07/12] accel/hvf: add hvf_enabled() for common code
Date: Wed, 30 Apr 2025 07:58:32 -0700
Message-ID: <20250430145838.1790471-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MyoOxSTG+iY0

Other accelerators define a CONFIG_{accel}_IS_POSSIBLE when
COMPILING_PER_TARGET is not defined, except hvf.

Without this change, target/arm/cpu.c can't find hvf_enabled.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h  | 14 +++++++++-----
 accel/hvf/hvf-stub.c  |  3 +++
 accel/hvf/meson.build |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)
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
index 00000000000..22e2f50c01d
--- /dev/null
+++ b/accel/hvf/hvf-stub.c
@@ -0,0 +1,3 @@
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
