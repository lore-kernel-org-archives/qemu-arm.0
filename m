Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778174njj;
        Mon, 5 May 2025 16:20:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUt10OjE1zAKM4FPE/Csr8l1shmJefXEgiHQHoWYk6dDiL5USOu+oIsPkHsTcovpIJvCEKyilpgjMw3Q==@linaro.org
X-Received: by 2002:a17:902:ef01:b0:224:26f5:9c1e with SMTP id d9443c01a7336-22e1e8ea15bmr142082225ad.2.1746487228113;
        Mon, 05 May 2025 16:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487228; cv=none;
        d=google.com; s=arc-20240605;
        b=UPVg8eyJhHs+Q3bCGhMSF4Kpmf4u0bndAUu21wBtoxqKiuC0KIApLUQ5OKwCC3vyCr
         tLalyW+fCFJNbMx6RSi8mNABylVqCSTZsr6IPO43Z4jSmTL8Rbqz9KmyA5R0e1KaxHFP
         yzQdw0v4rcF5q+ZzxOWt+BFB5n0qfidyEmqz3RErDh0YPXMw3+T4TcH3hixXuET9JAc/
         F8HaFTzwrLsMBJIgXWm0uGLVkr5WvWT9Tj5NUfc88xZa9x8IjBNaSIdAggAB1EkKHC8n
         s7tkXmDrmWCBaxLOurWJn/lGity2vHnzzzRRUnGE0pshOTokevo+G/elU3bkntNB9Cp8
         5UKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        fh=08TxHyJY+D3/Q5TjvmHC9o+pcKjuZvQkY23LxDARaAA=;
        b=d0sE0ngAvd2dSdlp67VVo9q7AtIqpbbpCQJ3nuB1gzRQXqPUp93edF9hDtr6Vom3PH
         MJXNBrnBSSJK24Wece/1SYBqpVYvJMCk5xw2m76Og7nVsngXGO4Ewh/WvSFZc1E47vfA
         aHMPy/ZPl988d8ZLMHvz3TXcGU4TPj+oV0v6Fo5ynjs5BgR5nZnx/KJUeEpkubwJ19kR
         NdIJ8f1OcYU5hYVWbx3+Fl4N95+PaLkD96xdsrlLnENmj3m+7ZM7K5YckmPDTKMA1Wl8
         gY8BYYwp2XY4xnAVaWD6kBizldWe31J0bR364Gb2mv8uPffGAW3qWmXODeXnIZvwGkbm
         M0fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqNLgttS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb10d3csor81399775ad.7.2025.05.05.16.20.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqNLgttS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487227; x=1747092027; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=CqNLgttSFF8HFI5XLX1Q7OZnSkMyVedpVKTJ8CIo3oG1vjo7E5UBL02BdSAhysLuF6
         S5yMsDffwFSll/1THb/KvBQHbZY//kS4H06hyEVHbsBggAirhOmLLyGk4cdWdbdVDuRr
         JrgLXc/XPiAXihoVT481N4etdi8PM5SQ/R4VXfOL4ZJQkQvTJW7fxg2omL909Qt83/y6
         FtHRRXKzYWN+lHMN/TSCHTMPdXCCzJumwwZCO+Vubobq8lHWfOHB2wzKd1dDunotY2Go
         6ARcMG7Eh9baMjZpzAjof8T9NFwL/3jKgS/64Ls8IEVrWM9rEaPZgCBd6TWibupPUK/x
         4dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487227; x=1747092027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=YBXrm+Q/+EyNW/SCp1GAMvOWjM34hpumLDddMa7+yciDOB56mSgKOxoKcp8CM67GrL
         Xy/PDamc+XjJc6+hYxs7dVdyq0H3cocp9ccqjNd47dLKT62YeVIMkCzilEoDOQ+Vnxvn
         dP5F6tvb9P7mKuf1eTROTXTZCXN2rNkUQGXEnSMADvvzab2Se6EvPcvjFm+8hzB37kmU
         1nResgxgJwzwg9AjmtoK4VQBcq9aGOcEVSfVlSHBXNKkNrdOxgW7LanWOOJDQsrDinjj
         NswBw6tPAZyoF4daJS5jjeDPT8XOzBoT7lMrJImhXSxCcOjyGpyrI5VbhaZy1truABI/
         NQjg==
X-Forwarded-Encrypted: i=1; AJvYcCVLSUjkCNAdwwjJW8oLUvscwy2o9S/PBdhz41V28YE10O5Ua0N/PgCYBxO5OM7hIIXY6CbYAeOAnYYT4Q==@linaro.org
X-Gm-Message-State: AOJu0YyPhMlgNwx3M4qKnPaH/pJLtTs4HlrhDK+D3gcyEN5euMEcWoZR
	JfOWDcC/kS1hsj26KbG0epRQr0JGjiDaY8sLk1TD3JcAQ4N25deUuyM7mkVHebOt7w==
X-Gm-Gg: ASbGncuJkmvwILGUxztss9fVDi91FVNABAW6HWChlyM3gbdnYcqPzVicxUMmeme2eB8
	rVZAceGQjJ/bnepGArkAiORL3rExh+QNqM6N2cUh7Eg4d0MzsNadBH01mi815Zkjp/xkjBX1gA2
	kAv8CccnmK26UzYa+/EIPvlPjYnhjAjsaodgltmeX58acuiSRhhMNu4btA7ViIc9iZ/vTsEqFWS
	RNI+r9EEWeHI94FMb8J8eIhVWF7VdT4BV2WUF+EjeRA4cVn6+EMwZlZP8VKxnRv+HExWpuGlvkn
	evEFffaGR3JuAR4WY3Y5o7Nh6o2yqWyz6OxtGdCp
X-Google-Smtp-Source: AGHT+IGzyc/8Sb9h770V9rBwJkj1A3Giv8Wxa9MDiPTqoA6+WmVYt/2QSnM+Kx0pqTa/ImdxPtTbSQ==
X-Received: by 2002:a17:902:cf42:b0:227:e709:f71 with SMTP id d9443c01a7336-22e1ea822aemr155051315ad.29.1746487227703;
        Mon, 05 May 2025 16:20:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:27 -0700 (PDT)
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
Subject: [PATCH v6 08/50] accel/hvf: add hvf_enabled() for common code
Date: Mon,  5 May 2025 16:19:33 -0700
Message-ID: <20250505232015.130990-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ura+ChREnXZK

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
