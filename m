Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654835njc;
        Wed, 22 Jan 2025 01:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlCjWTJ0w6kEhbUSJ6ISJzdzmxIcVwh26G1zhTixEJcl1RQIMgoaBvLRMeEXb9H5PZIfCsjxzhcM2j1w==@linaro.org
X-Received: by 2002:a05:600c:1c83:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-438913be56bmr197915915e9.5.1737538258710;
        Wed, 22 Jan 2025 01:30:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538258; cv=none;
        d=google.com; s=arc-20240605;
        b=BnjBq3kH4ye/W86oFU7368+vPh3gSXeFqld2L5u1VedoVfrPIr99igYGiT6eXBHYcF
         WtISM4988Oz5R+CW8mrhGwXwq/b75Vf0XCBDAi2CQ9wOXt7OiUTvHApcMfrrWXvkA7b7
         xzd+Qsfs9aZQT27skBpL9KyPqEW7XeAwwScOD/MB5+yp1stY+dnxDnCwY7Pk7hniJcz7
         SwrtHWjQ0UOOorHGwqzOEIF6FQAiJzZtbUH3G7AfS6SYPAGOsTwrEKn952gl0lj3s+VG
         0zvyzWPF7HiExKb7BGSPAtP7E5yUz64uieebNj3ifIFrObYV8W5xhu3umA0bV/3HVs1C
         r7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GFH8+KHnxWyy8fn4eViNDfLZ8hXpurTe6Lr7eVv7UPs=;
        fh=UQvfzUg5hNvgWxmJsIwem5VJlj2I/T0tnnASJoXh1ak=;
        b=i+gMQc5wLOdOlTb9lbOwH+iCvbzsGUxuGsjwlvZGA8+t4eKPlPqjvW9kYk1nB42fh9
         TrlSXgvflRTBJoCsWEml6eZYZ62zsRNACWN68mNIVvGihrmoZXukIXvrNmAv4P6hvoLR
         ZyTxpz1ZRvaylppriYpOKnQ89yuP+KiKcu0ldWA5fICRvjkfePpFZgxdZhPXqZK+VCzu
         MdX6/M2KcyHLEK8p8YV4K0vM37n7f0hGPICGdWS+zSEFD8DlCnyvpzffQuBWBDHr4RnX
         fwzwSm9e38xWLTzWsWMkkRrF72oiypNIwp1Roe+Nbcmp6Cd2HAdiXMPDnlDi9CUR/F+b
         ZhIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztgBtpX9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389041d2e8sor52708355e9.4.2025.01.22.01.30.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztgBtpX9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538258; x=1738143058; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFH8+KHnxWyy8fn4eViNDfLZ8hXpurTe6Lr7eVv7UPs=;
        b=ztgBtpX9ACG4FVzUSN77jbUtzF1ye+E3/OsQ/et3+5kLUxhwUYInFu826IpMkvCpMp
         e3vmfh34dZOMze/QRMHuY+hpo9BPpNcsWwkyM+vvT70kV+Vv9Szt8Qewu8Dl5ywobwkW
         +4cgYCli+gyGFdYPmL6KmxWjXceR4aEZmLJS6xeBdCrEbyPeWIscP8REdLBTb0pQc/Xb
         9kIVl3EfwIsm5XPJQxC2tou4lSFp1whtlTaKAEHocR9aDgRfcQK9AWAHg4R4PR1u7vpS
         +yYu7qxIifwBpGAfO1LT44d0PpNbJVj2WkoqJ7J2wJHIXHVzDObzznfk8myOJf/4/oZY
         Zrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538258; x=1738143058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFH8+KHnxWyy8fn4eViNDfLZ8hXpurTe6Lr7eVv7UPs=;
        b=WSXevXnLe4k6WcKW57ywEn0rdvKs5gWtj4/GkE98V0q7GfePBfJUZJT+0qz4uPL/o9
         0cXxgY9Ig/R46cl+XUsBZ36NNs8eKymB9/RJIW+dcNDQAt326g/lTJr2IsAXdKp5zo1g
         JesCPFs7CM6m41sPx6asPci7jh35nEdKcmNZuT4ROVaxea/AUPEoVawrMx3KrcIgi41Z
         Tb8Igjuv+VGRdf5hx9c8d3bffFgerhJCzW7jQ2iHT1c7cNOeaQ3/I+1ZalRvrEvYgkxz
         Oe/WPIFgIOjWjN/QmsFKMc2cfwQtFgpzMMLIpFpMHrjhzjeSIaFRnYvysANRhxUroKjZ
         cgTw==
X-Forwarded-Encrypted: i=1; AJvYcCVQH/gV2gcLY79gmdy/YQAxL2mE1RDLDqaw7pWKfqjduYQQiz9Gy+WTWzBA9Zi9FDehknXBz+ktCJDVsQ==@linaro.org
X-Gm-Message-State: AOJu0YzP8LUE1EFWOG/Uzc7DloKj8xztR4g+wtDY6+0eSh+aPOXQCc/i
	CTt2zGcQlG8hGMyC8YIRSWRMMLYGzEHg1SAro1IP2S5rDn0s/yuV0iT8Q5uYmRHVnA==
X-Gm-Gg: ASbGncsChOkfUTMvgK489x7HL26SSo8LbLho/bQHp8E3Nab4wwhez+qF0/STQs5FFoa
	wtQBgD8bQAZgxXUN7RyhiPF8+tRjVSqd81VdhzREgKBxx1NIh++UmHGhlQvXR6nfa1M2AI8sux6
	KPOV1DnLtMfcC6zcxbwlpNT7AsV7dTCvHBYUuye91nPro+tcDBF/9c0xe2ZJwuczRegAaMD6TTD
	/Dd5oPDYzzdiVhkpUiDCvDfm70jzaCSdAbY56P9lmU41fZ8OYZHqyDnExt7XFZsh4Xchv6IoJnU
	/7YH5XiVsQbw3AKFWMe5Awqt+/Ovm/PTduxoRwid/pi6
X-Google-Smtp-Source: AGHT+IEhxajtTv3CRYfRljbKHFWTclhTo/t8qNAC8SrmWIAElc8vVmVt/qK+Dowl1CkKINeDdp8Lgg==
X-Received: by 2002:a05:600c:4743:b0:434:ff25:199f with SMTP id 5b1f17b1804b1-438914309a8mr154805895e9.26.1737538258152;
        Wed, 22 Jan 2025 01:30:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c004sm17475455e9.4.2025.01.22.01.30.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/10] user: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:24 +0100
Message-ID: <20250122093028.52416-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g+uG+p0T/TxH

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_proc.h | 2 +-
 bsd-user/signal.c              | 4 ++--
 linux-user/signal.c            | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/alpha/target_proc.h b/linux-user/alpha/target_proc.h
index dac37dffc9d..da437ee0e56 100644
--- a/linux-user/alpha/target_proc.h
+++ b/linux-user/alpha/target_proc.h
@@ -15,7 +15,7 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
     const char *p, *q;
     int t;
 
-    p = object_class_get_name(OBJECT_CLASS(CPU_GET_CLASS(env_cpu(cpu_env))));
+    p = object_class_get_name(OBJECT_CLASS(env_cpu(cpu_env)->cc));
     q = strchr(p, '-');
     t = q - p;
     assert(t < sizeof(model));
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index b4e1458237a..4e32cd64f18 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -1021,7 +1021,7 @@ void process_pending_signals(CPUArchState *env)
 void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
                            MMUAccessType access_type, bool maperr, uintptr_t ra)
 {
-    const TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 
     if (tcg_ops->record_sigsegv) {
         tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
@@ -1037,7 +1037,7 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
                           MMUAccessType access_type, uintptr_t ra)
 {
-    const TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 
     if (tcg_ops->record_sigbus) {
         tcg_ops->record_sigbus(cpu, addr, access_type, ra);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 087c4d270e4..53b40e82261 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -743,7 +743,7 @@ void force_sigsegv(int oldsig)
 void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
                            MMUAccessType access_type, bool maperr, uintptr_t ra)
 {
-    const TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 
     if (tcg_ops->record_sigsegv) {
         tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
@@ -759,7 +759,7 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
                           MMUAccessType access_type, uintptr_t ra)
 {
-    const TCGCPUOps *tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 
     if (tcg_ops->record_sigbus) {
         tcg_ops->record_sigbus(cpu, addr, access_type, ra);
-- 
2.47.1
