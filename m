Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22976njm;
        Mon, 28 Apr 2025 22:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0EKXDXZ+n6UmF2b7WKBo20WRnMyOwWYH3hUi0n5HW+KNCK+a0nShAEq1xjI6ViFpXYHY1imW7t12a5A==@linaro.org
X-Received: by 2002:a17:90b:514c:b0:306:b593:455e with SMTP id 98e67ed59e1d1-30a2244ac78mr2722255a91.1.1745902823851;
        Mon, 28 Apr 2025 22:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902823; cv=none;
        d=google.com; s=arc-20240605;
        b=DCC8SvuGL4So8rjLq793rG2X3A7jmMHuWOzxZF1ING7WspF+8hq1ox9DQMCKV8TH4m
         u3q9NctEVkBFDvrYm4FkAiPWycivNJgKVmC92VVk08+k1Gm6lJ9DXw//lkW4Vjp6SqDf
         sZaM53zSvlEMnSyxxYLnLqsyHUeJjFNZwC3eF2FfuQHmSRxybD/P8vcBjtXWYomep3Fz
         zKyOZKKa/8/oGP/Kige+HiBHW8De467Cl+l/Gl9OK3S5ufem7qEIx/nznMgfvJ5/5EuV
         7ViMMAPUKc+CK5IT+bI9SXAYpRy/TgkBhTwriHAbSHqwFKgMZYnjPWGm6GFqUjfk6cnt
         QlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gyyYrSBpMjZGqDtX9J3tyJffb7EP1/gzXVNNR0hz1h4=;
        fh=uAY6ezSkuFuoKu/MJVuaH8RhgrsfnmjfJYLQLEQuO74=;
        b=TsFFcNTCbpLZy0aJJSnZ14c2HHRgOglANVuH7PC9Z3ZNdbQyvTcwKiLap26oOAnDdr
         akkwL3O9F+XBubuunpGuOQrpGKTXLNqzWI3BioY0z4PYs9C5T7KfX5i8TUZpzPMeTmpz
         MsXLAT4sL7b32u3VyOEYMYMC8WW5ol7hoNc23w6p0f1LdcEk7+jTWzloXfpgshjyoLhF
         bygFxysrr+XS+W1S76WdPPy2Pq+DGoRP0GbkTzedyhIyA74+MBDkM1PHE/Ay6hcv5w95
         vJmOxMCvv8a31HRR8Z/+LogXIOooNQmJ5KepNrGFWq2DsBYZXajWJ9gJDXL49lUdj2TC
         JFqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dimu14AC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db51060cfsor56453295ad.8.2025.04.28.22.00.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dimu14AC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902823; x=1746507623; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyyYrSBpMjZGqDtX9J3tyJffb7EP1/gzXVNNR0hz1h4=;
        b=dimu14ACtUWXJeelbDxNuR1Gi8jf4eEm624fjaDvVcPFL9pJ3omNGr73OHe42+SKmY
         CRCoIvyh7ZNnEb+RG1+Hd1dEAA0MiKwb2cGLhFYdmwmbMO4Icgn3lForp35JzNcjTI9k
         QMcaQ6yLoQIEbjekN7VrYWYYJqA1OMX3e7LTbrHO6INAFWQLLjEUljICYMFUA5hlrhOE
         uKQCjBjSHEvqwdX3Q2kLvAXECpsjhpA5HTN/A8UPya7k5sfWnscwD+eBHfCBdotrVIlT
         FL/xPKI9PmsOAC0GcEwOwQvbMQGO4y8DYxmHQ8px93TOONopi+Qxt6kSLSVyscPdjtzV
         Dmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902823; x=1746507623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyyYrSBpMjZGqDtX9J3tyJffb7EP1/gzXVNNR0hz1h4=;
        b=Je/x4X4XPU8ExR5DUoa6T9W33Rq1hsDEKwq4cVyztV4ElCuKAh7Z7ILX/fPjmB9v0f
         hkxnLD2oy2MRlphQOJaVbKe/UctXd8zqzpZnOr9SY7+oKtBMUhboSOWhw5NCw8LCMdfE
         8a0tqJ8A9hS1ATuYZtUn5Q2sS1w7omhaAdenqdyqtbxbOUGcpmfWxpdJDuEM7fSwG8UP
         hHwqe+Mp7kQXXL34K2UysXGQX/qfvThltZcfehIJbSxRDzjT7aM+BN7foRgP5SwESVzQ
         nUqWZloAMukb3b4IwzycYMCsrpFdEJKFM7lwmoQn5TdLRSKkQCU+3zspEGukRECqqP5x
         S9rg==
X-Forwarded-Encrypted: i=1; AJvYcCWZx83iPiWXiN+nVUOsT7yh4Fo8mSTclHWK8i5t/6aWgQhvyeB1huoXPbg3YGttCGPuDJvvfVwoYT04mQ==@linaro.org
X-Gm-Message-State: AOJu0YxEtQwEW9J+BeabbBSFy3e2fhTFFHdtAVgQQy8X8u78GKH8gQa3
	gFf2oA2eaH9LAuWStBXDmQseYbBTxX9hAZHuQw3Pz6FgmfhG7kM7a0OZqSpSzjKj/g==
X-Gm-Gg: ASbGncsrg4z56dyTdfIwVQomzPDqLZSAZ0fVZKMppkTdvx0Ki3PJiUx6RCVwmM7PXeX
	euySuSYov4r1WO4uaubjVl/86N+g4vCi9QdXtVxHVTvLMQH51y51HXJ+pHYFc4yf9j1Vv/3X3HR
	qVHsXZQbQa4f46ROltTwPjCkHZ+g7jrLPABTnkkNc9cU+fCYO6XC/oHmXViiQTzvzQCisNCFSB6
	nNcL0CKIQ9c0llhck1om1BPOovXLOzY7WqY5IhkV1UON8iPagXjIXMYb/1kkTHzTUBQnp4hTwdQ
	aJTesQB6Hu4/LYvSj+6JmUItAsqfYNHJI1L0rq2m
X-Google-Smtp-Source: AGHT+IGe2Vt41jFcsiUP8gtDdpGA+OGNZ8jHnyxm346MtXJL2horun4dC7fIa/fI75EdFBPvs9YjeA==
X-Received: by 2002:a17:903:230a:b0:215:742e:5cff with SMTP id d9443c01a7336-22de6c1e39emr23981905ad.16.1745902823374;
        Mon, 28 Apr 2025 22:00:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:23 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/13] accel/hvf: add hvf_enabled() for common code
Date: Mon, 28 Apr 2025 22:00:05 -0700
Message-ID: <20250429050010.971128-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TtH8Qcee9HsB

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
