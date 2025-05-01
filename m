Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19524njj;
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmGkQ5NgRYG6Tc+dfH6yyjUX0RSerL96xL2jx7LggMeyR9keZ0ydI0cCe953usKOhCBnKMBmYJV9Cj5Q==@linaro.org
X-Received: by 2002:a05:6a00:4fd1:b0:736:32d2:aa82 with SMTP id d2e1a72fcca58-7404927067fmr1904626b3a.23.1746080638123;
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080638; cv=none;
        d=google.com; s=arc-20240605;
        b=NHW9P2he0Z+r0JUZ8jTyWNfX+MOQsDcKNHDhYyW4ghtymMB8tkZD8EbyTJoEzHhdk4
         3ZKpLy2v4xtf3AbM/8tV+/Jvb9DE5RlT+ToxKBygLGsdeHrVTzbOkMF6vmhps9kpn6Ta
         OXb/LztFdgTJLi6FrV2bWQWYNTgKfO1jpJL+Q24yHVXkDi8M6VAsFnUQrKw88Rl3HKBc
         1LcpqcU6fmFr1cwvHEvvRvAIQdw8XzM6HnhkSVZpTZzaTuJARk0dvBbcTXwTcDzmYejI
         Ozt5Dfg8DOe6xS5WwmWGqr+fhKADVm8n+NEXcJ/S8Bv/JhqsTl8ghGO/SwEBnuzCXuA6
         44uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        fh=gNoxE82l+A7qF6MLeULgHtZb5hl9vQvilamtTAr8UA4=;
        b=S0dgo4CO+MycOo1JhOv0cm+vfDdOdrYFVRv0B9Chim6LqniZtFJDo3R1CHv+oS/AjV
         Jsy3fNcEDPlmRKGGEUBYTu3kGDvJ1Omnza6a5ovt4+gL+ANVFmIMiEJmBbSBQHzEcYai
         2vui7XgPxPue+EDZGbQbSX9i+7AXqi89rA93TZB6NuPW2OJZIWuAoXAnIZecEDW3FiVy
         iPj7ZfAlXXoHeA/eKbBQI0kJstNBmvTMnYVgVkXU303BY9NccpGjrhPnnY0oMc+GgTzP
         8jw6Bj4xxY8Yt1rhHvdxauOq7M01p3YWcDKRevdXW/E0oNU7dqgExgQR8lsmNVztwWiC
         zgWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9WnmLTl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17ca0sor86158b3a.3.2025.04.30.23.23.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9WnmLTl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080638; x=1746685438; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=e9WnmLTlfh0sz72XB6LAFEaYTZ/BfbQ4Wa/5JWv+qww+0EydHUeXtJWxopx/kfGCcy
         JXQIH21EnWWl6kQ4jRbYDMom5GN+2mWTyVZkjvK0CwaGVP3cjHlY4VM42oXwaAN+7imN
         zzDwS+xuEhvc07M7qt4D799pirYDCca3MMm+EZmU5hZFHXug3BHltw7SWDEVTKL2RUv5
         HZpjkKf6XJD5AW23nMQpK7tJ6XCK22rTS0gPwG4iHqo0SUYvJDzlxY0PYmdMcpUm1O40
         Ho60nZWp/fv6AsamcVhEFdIqPD/cFN3Ig6EytGaHYXSDfq/n6F7/seUizvtOO3Cm1uaH
         L1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080638; x=1746685438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=mvJHGPRVQQ6/ZnsXKyaTYuiZMb2L/POcgctMyvAKGhaHAlt7G89jdpp5iQElkg6hoU
         Emi5A8m+JM1IPgzCQPuOvTyuWxJGR6Va8mVB+kU9incmfN2WWTSnmPOB21ZJpxRH9RUU
         DeGkNxRBd5/PXl2qm5+cv3dCM9Jcv4rJOvcxOILOM1DEwFI61/e/h1KLr+GYqqmQhAEV
         HQlSwqOzApRsFt3dZ2XoZ4wICMDD603kiTDlmmIqA1Fup73Qx3+isSmlK/Jq5AuhxZkL
         A6BRFvGDCJ5L/ONlUrxXSJQodb+iG9M/wuTEtYOA8lqM9CaeoFY9aLpJgeLFMSTGe6Zt
         BLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJuoepteSl4tK4Vr0B9r+Tuc6THtfpcgUoFekeJcdt34lKAPu2nryDs+8fYSSAsByG3AUNOFx6ImrQqQ==@linaro.org
X-Gm-Message-State: AOJu0YyaPGtSjnx3kDUjca8tg2LL653r+Wk2y00TKkS7jVEhlAkAFRjl
	x/y0hpD9OIRAjMVKxXYuxQwqjCmulKz+3mb1YdW2cyecn0Fk/UaD/0dDaURFTjEPDA==
X-Gm-Gg: ASbGncvQid5fbycvNyngX86qgk1KKGivbGw9wTD3gTuElwBbj7DkjEvjTWKeVcnJVQs
	5pnV7FuNEP9fAaVZithf9W3HstMx7UOOJ/IFA77Gw6qxOJII7vSyz9CURx6Tm/1u+F/5joyk4IF
	8T99LJ/eUnl6La0Gb78W0W2j8N5QaNaeqfee0P/VaH0hrLgJR9KfraqOJoZATDhRidEfaDpi87b
	qoaec3mQues26QeX9VwEF/a4L5h5whsG87PTIqLkhdR6LYMhHkNdFvhR7vb4QvvjvQTikEVQadz
	q+5t2XHxxkhqvt3K94V0cwS29Fs9FzJ0ar7X3cLl
X-Google-Smtp-Source: AGHT+IH6J99jOhsc8o7g3sHqxpYwWEy99wbbi+relVHRPmsGkWpcQW3abDuw0wKNrlva7C0fJ5MztQ==
X-Received: by 2002:a05:6a20:d046:b0:1f5:520d:fb93 with SMTP id adf61e73a8af0-20bd6f4545cmr1904279637.24.1746080637671;
        Wed, 30 Apr 2025 23:23:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 07/33] accel/hvf: add hvf_enabled() for common code
Date: Wed, 30 Apr 2025 23:23:18 -0700
Message-ID: <20250501062344.2526061-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4/PJqRHmLIfR

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
