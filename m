Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278984njc;
        Thu, 20 Mar 2025 15:30:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHUPRNKeYMCZGg8qgEVVvIWtxVDagck/vxjkeGP2qqDTW8fmK0yV+Tjc1U9yTnnrTIwjWygVGsipJF+g==@linaro.org
X-Received: by 2002:a17:903:22c7:b0:221:85:f384 with SMTP id d9443c01a7336-22780c7bf9bmr14674125ad.16.1742509827132;
        Thu, 20 Mar 2025 15:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509827; cv=none;
        d=google.com; s=arc-20240605;
        b=NmJrKbiaJ8q2SJm2vd24u1UuLVCxKK14Yp5T4nW1cOYonh/mnRlD7OQ3l7FyO8IcPg
         mazWEWt9E415vbvpNRC6IuLrXY3746BTQLRDQDzYxefjeCQMnsCfgKhpJkOd1mGT/QBK
         srhYxIDbipzO5SOar3E6rSSYWP8wn1IbqdQDzM9XAad6NXze4QehfCi5oXU9s6YRQGHe
         rv4HgP1G/N1yNX6en2bFyczSiVVKV7KKftebGMCp5xkfj5L/4aakFqhWnABrYXo3WUvX
         QFd3UWXAEwmGBgePe8HMfJxBw3rgHmzpG3FNEVLAz6jiP7b/cg6oWlz7An5FkVuBz+Ue
         lacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z/4XryTOWm6w/MZRVd6kifOMES+Py2IKRoyOKSLgV8g=;
        fh=kz9kCxy0MvZY1Eaqn9Xi94lLEPJF5nespzPSEdoDKo4=;
        b=PipsYw5CISVgHP+2x9s2lJ6nsPM8O9DzEX9LuN4PDo1PMyRJF0Cqh9ladb2s6Uf750
         Mzz7GVfHRRCmdULi1QqzQcmbaIsZ+3ON5PeErvkrgPx6UQZrPvLQLiZAeHvm4rSr7YSl
         GC7az+71FK5Kp3ITCUj7PsG4f8vtwbjLaJAPy5pnCvjZyCBcwEmKeTgU4F6g+eONawst
         uEPSisxqq9A1GjVekfMrfrSHT3+fEsWAX7zLyRO7yb3laa8O27xUTg5xgNjSuI/IcZuh
         NzZt3Zj+tg4QnEgthmv/Zl2pBf/NkR9jEd+2gWUszmQLlTxq9H0uYTWGLZ659dm114Ex
         7qrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oYFRXz4E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f0b1f4sor3633785ad.5.2025.03.20.15.30.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oYFRXz4E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509827; x=1743114627; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/4XryTOWm6w/MZRVd6kifOMES+Py2IKRoyOKSLgV8g=;
        b=oYFRXz4EXQ3Bi9mKcTOqn6UBKt2gFMB2YTo+Chr8yHz90uIYWffsGD2yCjDkQiGwxT
         3ctMR5jU5D5NUw+jQgjjKx7rBeJj2zaqTbqsGux8SEW9Kj6YsAZPhNsT+p6OhDMHvmFS
         FuIZsILA30Y8iD1F4JAO1ujSpPQ+qKIh/E3sUmnrJvZinDtXG6uo/EVsKSsLtQVHRtrP
         yRjEPk1w565JidNODwCRKT5+2H1wtNv9swzDQpNvH3sIQshAFyxShAZ/eWGGzDtMkWya
         azXvik2d1uw/hcBkItFm/9CwCLaUXgr2vNqYai9d4rvqR09tWX4v3PL3W+g0u3VhdXJj
         xekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509827; x=1743114627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/4XryTOWm6w/MZRVd6kifOMES+Py2IKRoyOKSLgV8g=;
        b=ILVQ+050VhikEuaBQ+gNzN28JOCJ9yqAwo4PMwGOSxtW04qmwz7xi0jFTGQruhKdkp
         DD+uxjjJpGn9ylsKb4h3qf8baq/TAy4hyHcvrvE9rqlEuGbWPliLli46av8xJmiet+av
         GddTO981/6IVg09aw+HcpnLbHoiw1dXQy1wSOZ63Nf0/Ab8H1/B5g1QB0JnooqnXMOXk
         zYyvXdAvpzaF4vgxaWhVFtjHkGXPLvSCdcp/NhUuu7ih37dwBOeSGS+cb55jZX3Esm8L
         6GVBbwegBkw6BPrILD3ik+hNBG9bMoPn22FO0QPjRwDe5hmM04jxt+TjgaQXsJCx92eb
         HSJA==
X-Forwarded-Encrypted: i=1; AJvYcCUlomt6KIU1u/JKDoXXDumu/+fL1sd/FojGAwqNnauUMYdUyQRESaXsKTEvtynL/bcx28zx5b3hg7sXQQ==@linaro.org
X-Gm-Message-State: AOJu0YzykTTPsELWeHJ6U2geMbAM4N3yg99aImEik5yBG8cWoXtx5OVL
	xUIaVP61I/fqqHcf6Tk9s1URRW2Rt48NCv9J6i9SYzVGQXdB8e2SZfTNSxbgpap1Cw==
X-Gm-Gg: ASbGnctxFCVvTMU97Kndckk5Nq1A0F2Y/YA6d0ufeJjbK46kgXfEr3nDzeLLN7xF8qM
	i/SV4XUJ0cgGEZyC1fJMxhhxih5TFaDcUOyaNZBB8aXdJuItFnddeY3pl0M92TZDQD5UNLzQ1cD
	wlCNC8HNFd+pM3kLn6WFPSPinPo4EWE0fdpX5oW5j/1Z98mxGShJHL5zVa1aym6C/DDlgKhfwTA
	PGIoRe1CUgN5rYJGzwt7pnFtaLOKP89JPNP9813UxKXI3Jb+keCATxjJrFDiEVsq/2JleiYMsIc
	zsi7NvT+sbkvc7jkPGIYIFoPjVKtMs382bO+hivDx9h5
X-Google-Smtp-Source: AGHT+IEsmAbnRKeqDLb8Obh57hU4D8dne9W2d0POjgz1H5aMyJvN3a79EMmmYiR7WIxM0NHx2HlH/A==
X-Received: by 2002:a17:903:41c6:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22780c7ab87mr14047555ad.13.1742509826750;
        Thu, 20 Mar 2025 15:30:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:26 -0700 (PDT)
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
Subject: [PATCH v2 14/30] exec/cpu-all: remove cpu include
Date: Thu, 20 Mar 2025 15:29:46 -0700
Message-Id: <20250320223002.2915728-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: heLJCWQMG31R

Now we made sure important defines are included using their direct
path, we can remove cpu.h from cpu-all.h.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 accel/tcg/cpu-exec.c   | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d4d05d82315..da8f5dd10c5 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -21,6 +21,4 @@
 
 #include "exec/cpu-common.h"
 
-#include "cpu.h"
-
 #endif /* CPU_ALL_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 207416e0212..813113c51ea 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -36,6 +36,7 @@
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #include "exec/cpu-all.h"
+#include "cpu.h"
 #include "exec/icount.h"
 #include "exec/replay-core.h"
 #include "system/tcg.h"
-- 
2.39.5
