Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178743njj;
        Sun, 4 May 2025 18:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrsTcDL5hiJOjTyCHYNih9iXHjVqZ/XloTzFsq7BLcVGc7NZqMGkCyE/PjTiD3FM49Ruzj+QneZ2WRbw==@linaro.org
X-Received: by 2002:a05:6a00:f0a:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-7406f0ebf2amr8329749b3a.13.1746409955963;
        Sun, 04 May 2025 18:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409955; cv=none;
        d=google.com; s=arc-20240605;
        b=iGTmwXO6fUDUCRGvZGPwvdneWT50wd3ZbCaTSSv5JFdWeMVLX+9PbYbflI36/6WGlk
         8oY6kce8I6XCWavpDryfKlt9B7QADUL9nt297wvqL/EbA++ia9jV+BdXOEHq3u0mD2io
         0DyNpH50qjNN3o+gTctCPPA706Yh6+VMAgGxN5YGnpZOrGguBfAuu5EtTpBuqV1het1h
         DFiZIp8WCq8RklOHb+RbSlMfQYaFpu8gL0eOwWz0ySUa+yzl4QgRLYvup+pJydBSoYG2
         E9DalULXks/pUpu40n3+Rf9pOPYZZZgyiOmK7AHpXSflEJHBdU/V1zorBYOwuwhik9CF
         hpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        fh=thIwztKfQjVUnxvsRVrNl1ditdOT5groWpWqIT7leEo=;
        b=MN2WwuTccPvvIw+ma3VwhgCmKAKdqvri09QhIHTg8QNWXvYHQrkgBeSn40E65fG2KG
         GKezOgYr7/p+rZj8G6CwQOlbe0VyKwIGPvNJzAjrwqg30++2J5G/o4I2OKrULDZ6pI/u
         1hpQw9/E/SEXRAOC8yzKkG1z9bdL9ZpPGWBwklbkO01frkYJrgsMlgc0UtxlF5pzUFtz
         7zEoz5/aryzx+4gLJ4FhnaNWZ0QsXycaz0fyNA/Yln8c88cOBX0filPghUqwddmxW8HZ
         3ddNTwYVvtXFm6XqevtsZ6BCYaAQR645FGPGlsLMAjSY9uqp7NfPk8iNIoR74b48ZDFz
         HVtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwQPG0JI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e59f458sor5946171b3a.0.2025.05.04.18.52.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iwQPG0JI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409955; x=1747014755; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=iwQPG0JIDOHg85MZRuWYsosq8d7YitQ5Dn5rYXGt1djKFm/XHmOYo80mUjA2D1jCjO
         V7T23qxqUug8WjYGlCMh4qz0FaMiBmORVsKjEgM0SNhI1E5PUNeYw7LO3e6qiM5Yycej
         r+PE1E1/P1Kh0OkpbZrFm0k/0g/2e/gRF0KSEzI+dAWab32FJRBJ1TbjZD8IN28IrZbc
         hjNg/YX5acjvDDzSFEu0HJ2M1gFtERR7lm+U05k49P8E393gpjgA+/tpiEnZn06IzNIb
         ZhEy+CpjzAJatgVLzTnIqwpb0rea+QKfA+EoSYwQFQyk7m45mb7cF4EThDVKPODGsZFp
         mHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409955; x=1747014755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=nPPVZ2MqOt/gC5YdVIgVxlhX30PqpPXce0c477CtD0Cp1ioHTyWuJgerWiSW8+ALdt
         m6j5OW6slUs00/AZpksZziMjR58ZFAk65GRXFkJQC6OOua/AhMsPpvlJBuwcWRjIUBk5
         6TziHfDP7nkdd9Uyqtf83m0lHnhB2Jd1gSpBSSBxrlnhsJJCKPUWl97pOPc9wGH3bLqB
         ic3HafQbY5FAu5mqg9WRwVJfbwGOyM1k5z3zsC/jnInd2kWciDuDsZZZ2jBJoJ+If9Ng
         7DU5luvTYY3iYiU1OtmDb4MTEBTldB5+qJqGSa7Qjhqgr2kHR9xRdRt4mgz7Bx7h4kfb
         9Mzg==
X-Forwarded-Encrypted: i=1; AJvYcCXTMu9J0eVYTFrBU4dAWk6yPE3inZ8C1vjE3NilCcLrXl0OVOOLQdis7Tw1I24bvEBCPDHTqYukR8D52w==@linaro.org
X-Gm-Message-State: AOJu0Ywk3YMcxS2klloaJIgp0qIjXfJ5Xrhfh+IoErbV5PW8rTRQ41Ee
	7cK2x8JVxxbW2wZ0to6VgvPcDNGgATVdcCw2kZlrUq/UF8A4SlzIzjDaXh13AnR9UA==
X-Gm-Gg: ASbGncsLB75QApcJ0PcvTR7lFgw1l1nTSzL9HH0bp2FaYmLdA04LxtFJfiz+VGsZj4z
	GzNbsHnEpooQlCZ9tJrg+hsTbUvpC8LAWyv9zhPUZtofUP+8EMMA6cSy2t7+ZputizOB/33lzUM
	nlnNH/ArbO4pACjb4XrpoIgAmAfFR0kbysEZ0ZzLWy5T0v1IRpPepucGCPlgW9dbdnseGlih2br
	XVKA/DJ3YN0SC5PnzC0roIorquuoS5tMlaK5diTdeeM462RHkQDG7ZU/CPaH2p4bOQzr/jHwUjz
	skGdPNHHvCO9kUHwgUC5wx2N0q9BfKX1L1OERn7R
X-Google-Smtp-Source: AGHT+IG3mk4YchgUCP/a9nj/YMSOA0RTdRB6Fap1pC1sILKdC2nI/TnxlESmc9cZlPoV9aa77RPxEw==
X-Received: by 2002:a05:6a21:3a4a:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-20e966057a6mr6754727637.17.1746409955584;
        Sun, 04 May 2025 18:52:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:34 -0700 (PDT)
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
Subject: [PATCH v5 08/48] accel/hvf: add hvf_enabled() for common code
Date: Sun,  4 May 2025 18:51:43 -0700
Message-ID: <20250505015223.3895275-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: a5hfB8jQvY4i

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
