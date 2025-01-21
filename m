Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24349njc;
        Tue, 21 Jan 2025 03:41:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwuaOYAFi67IZWosHOkVAodOgxqZwCaTj1cyM2lELBJ8y0O3M1pFT+cnRP0qE7vCa0K9dX1pGbMksTrQ==@linaro.org
X-Received: by 2002:a5d:438c:0:b0:38a:2b39:679d with SMTP id ffacd0b85a97d-38bf57a9d66mr11139833f8f.32.1737459677073;
        Tue, 21 Jan 2025 03:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459677; cv=none;
        d=google.com; s=arc-20240605;
        b=YEXzpI4J1VwIXkfTpI08rhXCOs+nsbAaLUvRPutIXJHDcvEcqC2ekUIOkdWty+rN39
         tYsAdRYh0WdNjrYGdLuw0pkkC2zGa5nDwEUcHTg7GP27nVTmR73dvsUzWCtxGZ+cUtLe
         tfUfMJ2mwEB15nuLXjVo4zUKAtQ6Bw2F10mk9eRYqQ2fsI1q3El8fILfsPNf3DYt84ct
         JpuENEgTXfJq6XKU8MpqEPYYvwd7AI0KdYZvcVSOi1lgEaCQ9QXpaAb+eZmApu7YkXh0
         WU1xqkEztZz5EBAQHlEmb9mYPdtkYOfpowyTyb7CT860wEDsoMVRI7DQenfwELVzn1Hf
         7Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UK2TrLeD2Zn1+uH64aqzpAn7UZ7ZT3zI/v5l0LjGSTY=;
        fh=w4nLoZucIkkA4r/0ZV5jaz3D3z/tDJTIHVyNRNcsWoU=;
        b=c0QzkpKmy+tJGp5gHiam9pGDlDm9MyXjPiasuuXJU1mjspVNzR3bZxSnuk7YR9HZv6
         WUENNpr6dcmdJbmlN9t5PDuNQRh6rc9MG+hqlefsTonKDGRbuorTcma92Pzslac2NlkK
         PTo8r/s26Q7x+h0vmPIB7qWK18QdkRNKNSdbXWdXh4QwzGa0h6fCvWR5aUMMHYgOLpyN
         U8gQ7HRGn6Djl3bA/vBz2QY1nfIylkila1Sl1Qy5+bTB+r0GoRmEV+gxUQOrU9zf4wQG
         JyPRtlC7OidljxkQOl63t6Mt9f8F3QnK911jK5P4gElsEtdhTiy+Hpqh7RHAnKKWn90G
         8OnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zWwmlEB/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38bf2fc6f21sor3454967f8f.0.2025.01.21.03.41.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zWwmlEB/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459676; x=1738064476; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK2TrLeD2Zn1+uH64aqzpAn7UZ7ZT3zI/v5l0LjGSTY=;
        b=zWwmlEB/VtyFWhPyg6JL5yfIa+sNqwm8wFOpDhLMdV8FD3rl1P/kSqJNY12h7eZnnC
         rr8KsDhCR4BB/Hq4hf3puK+bOGCdAzkAo94nNE5UsQiA9TatyhPNYtgrDpx8Gwvu9EQg
         ku+bJydMJy+w2RdGRK9wys9T7tMejnUcr5NF8ULPbYn25klITczK38me5+r60uf0bKf/
         JGFQNi5n+rIadQd59PqbFv9Ys4Vg9nIarnZh+RuupnCZ6ZuvEV0OVvocg2cAbwMaf8mG
         NKtm9t6us6xdIs4LEWY60MrnTxEiEiPMSL7XgfIbnUX375MeI86sq+zo3MYE9CymXBgC
         7cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459676; x=1738064476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK2TrLeD2Zn1+uH64aqzpAn7UZ7ZT3zI/v5l0LjGSTY=;
        b=QpJPNEHH0Kw0vU3KPDR9ZCtglZLGOUpAoeqcB17insupIlRGCZvZ5rf3oVX+fZLABW
         Yk1JPM0UqBWOwmQejPioWOc6Qs8oGn/NSgg+7NgRHIz9FoZ9QBqFCAjidBZNKwE5bSZl
         0s55aDbYEbuPVFyHPz5/g98a2ONIWzuOP+YE3UArH7XBkkN66iovKUO566Ea0UDTSznl
         tudOhuHwMSniWxV25XI3ItDXxGEIxIKA5BTZ7PDV4NlVJtZWne/JnHbq3XLHHlAYo6Nn
         SPqIThLJlkkRp/w4NB5krq91oMDH1vSEaNHwta5CRoeXamoYKl9IPZPIekjjbdFjgJyD
         AzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVITjnAwvkAM3h2pxXAJronWbxjas3IgVYwnu07I51GOlP32n/pXgJQdkxDvz1d+J8iHuNaibtokT0x8w==@linaro.org
X-Gm-Message-State: AOJu0YwMbU1/JsBtoxYaKERETFrAM3NtxCeZLWK13+mDmv97bEWdViBa
	CAsej+TQ3n25Q3BNrnlTvjWwD/2DlRFrZLMOkHYRmi/th2uMXdF4KhEJFSweTudKKErpVcP+H4z
	iG1znaA==
X-Gm-Gg: ASbGncv5gN8Ho2NMwb4ixqZuibXeiyQhX54rvuq5SVKPDO4GE1PmhU0ny1flErgo0c6
	gTthNU2hnJuQG6EsavQEjhBGFehaVy3eENofz/jCggy1RpVaZwX2TmM7qUMdWt6oT9AATgNuSYy
	0yZyCK8392YWQULJicpCUoEIuQ9n+CdFaD3jRhCQJ0ja71AHOGSnczoLhKCxglM9l4B58iZVjWX
	NugFA8qOYRjjqhamULGIO9JvqQxp6kGuPqU12+niXad9auGbaRCXsWBbmk5zYA+In8MjxJ4Yz9+
	MKEKtK7pBDVTrtisyIj1JZsGZAFT3S3dI4h//EDa9QUP
X-Google-Smtp-Source: AGHT+IEGMsuskHAZZ9w4pwzHFYH3HntWs1FX387Dlx0h/AuPPOB/Ktl0DAeXr4nCplNVVZ5CWeOAQQ==
X-Received: by 2002:a05:6000:2a7:b0:38a:615c:8225 with SMTP id ffacd0b85a97d-38bf577ff42mr16730772f8f.15.1737459676557;
        Tue, 21 Jan 2025 03:41:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327ded8sm12932429f8f.89.2025.01.21.03.41.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/11] user: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:49 +0100
Message-ID: <20250121114056.53949-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: H/V2oC+bpEJn

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
