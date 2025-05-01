Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19618njj;
        Wed, 30 Apr 2025 23:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXug3zY/120W6hANGxvvNlz8jUT+3PKL3V+Bn9JnBBwBcy4nd/x7sR/qgl8Qqgw1i90hWXI6iudHm5DQA==@linaro.org
X-Received: by 2002:a05:6a00:10d0:b0:73e:b65:bc47 with SMTP id d2e1a72fcca58-74047901264mr2439141b3a.17.1746080648841;
        Wed, 30 Apr 2025 23:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080648; cv=none;
        d=google.com; s=arc-20240605;
        b=C8eU8IeXlt3esWIE/MD5iudwaKQn94pY22pwsCCcSD0MWBLQMzlg9G2GtcUY5wu7II
         sU87vJFJrsZRz+HOdNh+kXcaFNHLmHppwmRPUrZJLo487geh1XSZHc9/XlBJKgQJIib9
         QDGFrYQeChJ4cahgWoB1YFQG+iDN7AqDa1UgUQbl1ZMpnGFbmd5IaSdNV8uVIjG2/bvx
         RaOW266Rc61Od/grfM81N/MrOJHfEki+MFdGmmNoMHJWBCJn5mCEIfqeGqHntP1yoYmj
         D1zh8jQItSGtYZtc+zcUhEaHtc1K/+N7nyDI//j4KfIiPN3fcgmxdrWfvljQkWdQk0AB
         T6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V8qwK/HCEw1i46saViqejeACvzUpjG6Ezmpbs5eELYY=;
        fh=F+/2d/q+m5ijDRGuCGd+gRYZA141tYRQjX37EQSyYlk=;
        b=D1zx6T4jE0Rata9h1PRrQQ3ESHww1sQ3lQ6zxsnkD+6lm1x6o6ERGfauojsc4so5Zk
         FGAxm0Kkfqqa8ChF9rtk1Dr0LrmxqOCNe75IVeoPPRvsqzUy/1B26B4LxrJBiFGUK7DP
         vJFGcqNwY0gjHilEKu157Rk2MRzijiojXhXJvYK6zRq1Miyzs6mUNmJS5Jhy0U0KMnI+
         6AAXfDANZGJ/efzh5SKq7qz62hMHqnU3JVkgGk/vsoJnPdOIAwBH1ud86E3ewGxPdd7D
         pRKN9ue5Np/HCSxk3CV9bTbAIolGpIGQ+fj5tXnIG6B3pmoAbAsdZxOUgi8w9j7Oo+rb
         8vGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vS3iS1yD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5ab54bsor127076b3a.0.2025.04.30.23.24.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vS3iS1yD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080648; x=1746685448; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8qwK/HCEw1i46saViqejeACvzUpjG6Ezmpbs5eELYY=;
        b=vS3iS1yDT3jghCyle1GtKm4zXTBdlpwVm2Lrbt9/95xQxaIFT7gBzlJkC72l5yHUh/
         fF28cgdeylbiB3pbHXEU3gRJpmahLrW9d4ZUTt4REGzu2n148KXQQIe4Y49jOjzwjPeM
         6pen3UX6T7JLrmnQgYeAF9C6ioKPuyGI1qzlkd3bfsSf0pLVt++b/ef2/hDr6lr//eUF
         ZoNmbFPnSAakDsBFBF+cTtYgTrYZRtV2ImvPdGH7HTNbOld/OVzKubN/GqvjoI/T0CWs
         Bum3i2x9DMigKQCOQBuRqfTQCjZNgzzyUzQRYIJkLxtnHo/yYfX51qfkpW+g/bYXnSUR
         svxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080648; x=1746685448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8qwK/HCEw1i46saViqejeACvzUpjG6Ezmpbs5eELYY=;
        b=JLWmXNSD/g3hHLwIBKVopIoDzlZEWRxg5CQOQtauWxINfB/JOhhwFpqTVFQNtXdwwn
         Exwyz4rI88eD0LIXt3DGqXFgb7EVDaHNCPHfOlMnP3kC6vpVmKt0b3TDYBsI4gSWY1qi
         TPalAndR96UIVgujeDuqr8LVp08b+M1nP8AL1Gppq/yMww+KLQ3dITbVE8/l/KKfJVdA
         Fqf7LJp0I7ww0Av6PDEbnZQSf/vV6heu3ytwKR3MFgbUjNrjIOmZ+vJjaSu8K7Ls8HDC
         rTPQIdLzHj2UBKDPZOX8i1lsHyJZz/vklVilQR9OSBpY3X2PAaND7JYZQ2BdzBR7/8BG
         93FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzsW3mcovsRSXBCR8S2O8Vf3q3Duc5CEwHro4HlgQGYSEN+yJz3bInHzjUTHOFUELB5T8gpGNysfP2Ew==@linaro.org
X-Gm-Message-State: AOJu0YwjTFHoB6m+ruzGYxVnvIxCW6TGz+yJDKmp07uYbhRDszj+/MPZ
	ZBYTlbzYhXARg/N2RzvGv+5ww1ofYVfAxRGtkuJRKTVdJJIe+j1AkLI/Blwcudv4Mw==
X-Gm-Gg: ASbGnctyKfolGXBVE/eWpdn4xOYfJJH0U11ehK5pX3s7KzXlhstgItiHyquyXvaGgVt
	dEfyjHlUYNsKpTsXvG/Otgs8KLr1abA5PtO4xi2/ya4iDvmyyD9tynWICoAUwW5rlVCisIWXdyw
	yBXeVtpodlWbWuocXqd6WGcTmuaPFd1C6QfFlICtkn/uKqeOmZkl0u2D2MU8g6AUUiazVGoMKz8
	xPliDh6DxeNylZGRPQ7CzaYttLYkEEhi/gamBo/w2ci17648tezVOfmHWu3R6cY1nW1pGcJwngH
	ivZYCpwddN6f2o9xKuPbHW5kGLkvCg0bJr8dkKxo
X-Google-Smtp-Source: AGHT+IGrgUKmcCRVBMb5krJnI6qBInswBqP/CfMh/qvXh475gMhq7CTc84gIms6BVmzHce7FJGFwGg==
X-Received: by 2002:a05:6a00:2e9a:b0:736:457b:9858 with SMTP id d2e1a72fcca58-7404777fa13mr2551923b3a.10.1746080648457;
        Wed, 30 Apr 2025 23:24:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:08 -0700 (PDT)
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
Subject: [PATCH v3 19/33] target/arm/helper: restrict include to common helpers
Date: Wed, 30 Apr 2025 23:23:30 -0700
Message-ID: <20250501062344.2526061-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2/fAi/qjl9H3

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 257b1ba5270..085c1656027 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "qemu/main-loop.h"
@@ -36,6 +35,9 @@
 #include "target/arm/gtimer.h"
 #include "qemu/plugin.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 static void switch_mode(CPUARMState *env, int mode);
-- 
2.47.2
