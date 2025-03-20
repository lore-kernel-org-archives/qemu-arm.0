Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278881njc;
        Thu, 20 Mar 2025 15:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWg9160iRhRb/dMKc2wYfi2FQQJ5gxYQZw+iJ3mgx6Whj9F1Lhd27HTwd8NaAU8ZazJcsNG9VH4HnZp7A==@linaro.org
X-Received: by 2002:a17:903:230e:b0:223:5645:8e26 with SMTP id d9443c01a7336-22780d7fb17mr14627775ad.20.1742509818238;
        Thu, 20 Mar 2025 15:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509818; cv=none;
        d=google.com; s=arc-20240605;
        b=El4vR7JKM/A0vymzEuEzrUVRKZT7U2AbmJpT2KDXaUdnFgA9/trxeciHF9n73QGDE0
         YoksG358e92KPoEV86OD2rsSkPYQAcTvxazfRJwLJqtRnVL7ORHdNtTVCJFcyfUcSnQM
         tiUEHHug6B3AVxqWZ7mAyUabjMnjpEnozA8STWuwdGwxCBKcgXR7byvcRsRbKuy7U5YV
         ce9K14ZfUMyZqF+0MR/FF9WdWAq3Fza4Br9rw+nLIUpARbWFUBnS+zMED+xJL6VMsmpo
         r5ga3JOma9oOox2LE6G7ZsMIIGQuVJxc69p09qIdezQUCJKL5G4qBsSw0gMpyDPhu5Eh
         TcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6HMVcutgyuXMGRqprNJQ4jtFGs2OPO1Jy4KbSNXvsaY=;
        fh=COQPc8v7idGl30uydFNzxMkdDNMJv+AV4MmCticDr+A=;
        b=KpKB4WH6p+T/tCuO6bfRb9yWpUYcQrVj+LTS5pKN0xKU7lTMWrxymU18zpjSbTn+w8
         Xo6uRlLBFE2TDkdIGZF/UoUFq/Rm5xQgW4P4xmXLa8riOTE2F2AWNpmNhAzgU+FIY2un
         hGEEP3TUFnCeEmUA57wLRDATYzgxx9bFXOnawHXqYGEH8+qjP48e/rp8fxsyYlTf+PLC
         4GNqCSRr4927scVum3w0gTBDHX8oDpUKI6c9U/WGFarcFiqYTLyrfR+7xTeuOyGYWlL6
         iBBsMJAIG9xxSxtEpC1ptkpny7w5KtyxV8PxOYLhzu0nPN5CwSMEaRfpDp0VD5EWXK8Y
         CPqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCn3Hor2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f59abcsor3783185ad.7.2025.03.20.15.30.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCn3Hor2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509818; x=1743114618; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HMVcutgyuXMGRqprNJQ4jtFGs2OPO1Jy4KbSNXvsaY=;
        b=xCn3Hor27KvBkzyFpBOGnryHPkJj01xXcfedcaN2xDnQY+Gc8SZge8xsBVsxlFxaaD
         /ADHuH7V9PdNppZaXtQcYB4lgIqZny/kPVljchXl0j7gA5Zgsam+QXhH6Ad0UAtECwwv
         v81YY+T3AMhOGY9LqbF9O0dpTgMWVtXmEgdaplfwJ5CsaPkY0l2rFDXkBegpnFXHCkNP
         Z0PdMsQSH7RytZWruekwUvjOH7Y9bAbG2GkPDyGkg+QTAFQ1SwUeWHz4OPUFTVV91MTv
         m31chM9uelAi2pTQ5xYgZv2VUoscHAbyHudNlBhx4UOyMAB+CSWzlQMLNlndt8pdWsBJ
         +V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509818; x=1743114618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HMVcutgyuXMGRqprNJQ4jtFGs2OPO1Jy4KbSNXvsaY=;
        b=FpZ0VGF+UiV3Ivp4X1FRYhYG4rewNE0CoZcyJp46lwY8nKP9XjwJlR46KOrmTCl8YQ
         3jUVZj+DhXC2G6yjhcONTN7C3kdYOUNjCUpwthkYxyIdd4yFs2AMCtw7G4c5LycM+S06
         kHi63xL443abf6aw8iy6u+g3T6cV0i78K7sP1fCnF7leKR1SZMKTXBkrJIFAbTniysJ/
         NYLbQ5yv/GL3P4XIuaiZ9LS9Jttmn19ZxigMAlvwoA9j2C8KzCVjwb6IFi7oYIpq/O7T
         UDjk3TbmyTE+qhILYKgg6/9BQ46UXPON78ViUtM+DMfQwBsFC1WZQUuTjVrWp67zAlcl
         DOnw==
X-Forwarded-Encrypted: i=1; AJvYcCXQK1jr0F6SzXyE5nYe35KI0ndCSVBh3USVlCUKPoYjrvkbq733jt42IahDuLeWKd8/qfQH21gv4EefQQ==@linaro.org
X-Gm-Message-State: AOJu0YxYd/5QoJRkBGmVxpJUkaFQyV0Z9lu7hoUWzN0u3oslaNs5H53n
	qKF9hzh105oavPU0QKX76D7Mnd+Poh+yMVGZumOXdHVuAfRcJ1fIZANdNEIEJ7cv0Q==
X-Gm-Gg: ASbGncvlxY0KLiB2DCkFsbsqbXO7E1DGB+pHfBekVKNpyWECPIJMiOGmZKQxBSlSlne
	kE/kGbsB0Vf9oA5JY2IenSOZl0/9Bibf6Z/Fxubx6tPJp9lBrBWkbXaF0LFg9wEXsBiPl9HtF0A
	TQRVSocXHDxk4aege8OrldZrLrK0AJxdDBOFrxdHUyCo0FUt7jRrRjrW80hj32wR3a05xQAH57W
	yM6bKOwjkdZ+hyegWb2ZtziX0lxpKChG5vdB9XfnQDebTdUgcdOi/F+hdkRf8a8onKg6tcG+oxw
	zq+O/QlMex3m5dV46qP0rp/ZVcyYnSp78paaf21+sq7F
X-Google-Smtp-Source: AGHT+IG6+hbG0wVW/t6Amtifybw7dZc7IOQNafgewk+tDppyXQ5h9nASpMX/jqywf9Wi/q7Dg4LTxQ==
X-Received: by 2002:a17:902:fc4b:b0:226:38ff:1d6a with SMTP id d9443c01a7336-22780c68a1amr17451725ad.7.1742509817869;
        Thu, 20 Mar 2025 15:30:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 04/30] include/exec/cpu-all: move compile time check for CPUArchState to cpu-target.c
Date: Thu, 20 Mar 2025 15:29:36 -0700
Message-Id: <20250320223002.2915728-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Kk3sWyL6okp8

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 4 ----
 cpu-target.c           | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 74017a5ce7c..b1067259e6b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -34,8 +34,4 @@
 
 #include "cpu.h"
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 #endif /* CPU_ALL_H */
diff --git a/cpu-target.c b/cpu-target.c
index 519b0f89005..587f24b34e5 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -29,6 +29,10 @@
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 
+/* Validate correct placement of CPUArchState. */
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
+
 char *cpu_model_from_type(const char *typename)
 {
     const char *suffix = "-" CPU_RESOLVING_TYPE;
-- 
2.39.5
