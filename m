Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24389njc;
        Tue, 21 Jan 2025 03:41:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWi08DcRi2zuzqHViXpwjbGUKJIFeTbM21lxHp192i+OVUhfcW+1KGHJ98TXw9SXxj4nkRY1wq7czr4wA==@linaro.org
X-Received: by 2002:a05:600c:3556:b0:436:2155:be54 with SMTP id 5b1f17b1804b1-437c6ae9cbdmr216647035e9.1.1737459681630;
        Tue, 21 Jan 2025 03:41:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459681; cv=none;
        d=google.com; s=arc-20240605;
        b=jwhNG8/CLmOgWLvYI0vnM2tZ1+HLKQNx+Gwk57IkXsgbixJhro7AFyj9enAcWA+cqv
         n8wxAcVY4gkuot9JksipmgEkgqmkB6tMLMQA8xzlTY8Bm3WH0hGf/v5AwvL0In4hGEo8
         bMJA5LD8yUIDmYDhAU1IHkPRh3K8RVB5elJSRketVAJekxx/C4GTuy3lRnIYm2leoR+l
         ckv2/2xkxr0E6ct/jWw7U3OOA8TxLcjS2aToJn9w7E839yeuFQGVnYKrPuEzrHw5aOZC
         lG4RO6Gp8ROPaUqJTTDzwj3tZiottknaPNQFP2qwGhxWZPA6lvsZbsRWQO7Vdyq7J2jM
         Amgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZpYqX6c238IVN8ObNqaQEL0twXm4e68BH00WB9vFFrA=;
        fh=864+WQhDdB/fdYW/C6EAQd5biDXNDQ+K8iJWdbsW7c8=;
        b=G3Q76h7kPYSTUrw9KFJyk9JBYUfZrFws7DMt7ntgAJgi1Ym4W0vCzMZ03YKMuSSuGR
         QUYPVYVAs8peDE1/PnngLTY360rknRO1tyjseyfoa56aR8xx1iCShiq961rPmwC8cabz
         4Gw8f7O1ZpRQVsMrKjSrzVFulw5eWid+Yx4W9xOC7BcAbpzc90qrHHGecKgNt0qtiibp
         Ebnsozo76q17e6f4sbqmc+r1HvjERx3gbAQ9u+CDlL2ox25DO3W4SloXi+kx03LkNxF3
         X9QjYam0bQnDdkolZHJ7I2e2Nx4J+c0SSPgrPfsCKwDTnXxlifBEhMX0/hlMWfQvYAZn
         uJKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/MRKG4x";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-437c757cab3sor37771425e9.4.2025.01.21.03.41.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/MRKG4x";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459681; x=1738064481; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpYqX6c238IVN8ObNqaQEL0twXm4e68BH00WB9vFFrA=;
        b=I/MRKG4xPym1twoDZ2EEfZIiQBdv1L63p44nsG4wuXQDroWWbGzM9bNM96O0PWMpXe
         hmDWjXArxuDQl7OCfsjuBXUFEX7BiyAKYNbNadCgZjiyWNgnOi9YyFMGsPLyLmNEx0+Q
         1VDzfG2dxPyHUv3bQh7Vjewo6Op/nTrb9cizDPU9TYQ7oUCA2LDFneTrdRCO2sH4LLR1
         NBd0Xz4p1Gggr3/jpjxftJbzwxtbKv40J/hDDjH8yhpVuV01xROyVyYviIhaZHmCJ9cP
         t/JIVPYnhrBfvyQSVi8QzmBZPWtWl85hn47ia5kcLqDusQAAwxKfvHeYKzBK3tmMPIhr
         Rkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459681; x=1738064481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpYqX6c238IVN8ObNqaQEL0twXm4e68BH00WB9vFFrA=;
        b=TnGl5srqhJ3wElAZKvJUWoKZPPHuXxY60IUYDLAUuCmeTi72onQJ0nsaTOlOPAzKsC
         sxd1B3CGbBH5vPnCp4GyPHRSNV+Ksgrdvu/CSajfpZUNn9FRmntNxZ2KVZ+frC4Q9+YA
         DkAT2NHGM7wa0j4OFkti3uDe7/vdJ2IZb0gSp8vsGs2LuC2kRRRelD8WyJpaqYct0CXR
         w10klU/xkix/+Q0nm+L6+VQCkgZFdl9N5qDlRuup4dSIDdL3rmIzmLER/SrAQjXQqKQW
         eNzcQGBnA+RluRCWv4GeS7ExSDd2bcAciIp9Pv8CjgOw7DxJhr2gvco1kY8q9GSpHW4X
         ZRww==
X-Forwarded-Encrypted: i=1; AJvYcCVSx3koSvKhtQpU/OVG1P3NaOixd+1No4o70Vs3PVDizfnBiElcwY8Fp1HyTZ9kpT6xOlqSSmM98iemRw==@linaro.org
X-Gm-Message-State: AOJu0YzDzdchbwMBh4YZzVRuHXcxL/DhFRgt1l0PiRhPQayQlhVv463O
	qtjdvh/WPo6ijaf0MXkKZDRu7KqjkyujqiDM80Ma04AXjETwA4neFawLJoOyNSw9Xw==
X-Gm-Gg: ASbGnctsBsSxJrNX55v7xzIDDlFgVx/XtfHYWEJziPZCXc9lF/kO8/5F/BY4kKQbQqL
	k2AF47kXe2Q5vBQA25B7j1CsigzjFf2DTnZ85F4V/XmdClLIZO3XtZVr74AjTwcfZBpRHxeKi4e
	AfGHsU2BCvezxkYFiQvIgnOtXDmS/lUUJ9W0F8bK5sTKAhlZIF1pwmAqipMu+VF/aWYirymaCS5
	AMb1tprYLW7SltsmYR/PSnnGylN8OmfowABYg0QJKLTT7lN5LWiyuHXXspij3fHlQVHlxZPAoIP
	UwjOYfZzY5TiiwQ7t8pApS19EnoWJ9mL6mFIjDPMMEVH
X-Google-Smtp-Source: AGHT+IECj/AjCUgw1aODfaV1DbdsklgNdgfzkjy2bPPCeT2mx7sdBBOvETv2hoHFNOd/sSopUJmBqw==
X-Received: by 2002:a05:600c:4f53:b0:434:fa73:a906 with SMTP id 5b1f17b1804b1-438918c5d0fmr139458315e9.4.1737459681114;
        Tue, 21 Jan 2025 03:41:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499b28sm245220405e9.8.2025.01.21.03.41.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/11] disas: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:50 +0100
Message-ID: <20250121114056.53949-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M2X6sCepM33t

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/disas-common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/disas/disas-common.c b/disas/disas-common.c
index de61f6d8a12..57505823cb7 100644
--- a/disas/disas-common.c
+++ b/disas/disas-common.c
@@ -67,9 +67,8 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
         s->info.endian =  BFD_ENDIAN_LITTLE;
     }
 
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    if (cc->disas_set_info) {
-        cc->disas_set_info(cpu, &s->info);
+    if (cpu->cc->disas_set_info) {
+        cpu->cc->disas_set_info(cpu, &s->info);
     }
 }
 
-- 
2.47.1
