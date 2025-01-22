Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654728njc;
        Wed, 22 Jan 2025 01:30:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1X13H8qLG52/7KCDbhsHRkLyDgJDzNF8Ik11BCrI+tk4W+AiVh/MD1pGOjhQCLVq8yocyy3reCMXXUg==@linaro.org
X-Received: by 2002:a05:600c:1c84:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-4389144fa26mr178093795e9.28.1737538244949;
        Wed, 22 Jan 2025 01:30:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538244; cv=none;
        d=google.com; s=arc-20240605;
        b=Vx5iVHHfpG89t21UI27/Rg2ndJNu/tLJey9VDTOLH14Z1tOmz31xhtYvzIUxSdoVV/
         SBqbSg7/yiSmi3M4p5PqUEZplDqksGJGP5XkHja9BaLj665uYiizBdxL7e0MKSQjyYMW
         6fG+bmK0mbhBvNvS6Rehwd+wvWjXsrTn0sD1nsV/n4xAeQ3Io1LyfDbzczQetS+YN0hV
         Utf6F3qmTESFN8lobKr0QYwch2x2WZsBsogn0BbN27P1Xpz243F6SwXeDpB22lTKYeM3
         pYfXEw3MRib42ubGs/YhcAQW//g4NK6HY10ZKaYgszXe2FNDkhZFBCA+iph71DzjyYs+
         lr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        fh=/sbfIYPlWyeQ+fIauZ0j1N9fKbwPpGRulxlp3Kw3p48=;
        b=hQsf1omcx4n/lhYk/A2MQ5FRMBNR9XAETrO16gptVVIcvZQjzKCpwbhV+QWTWYhi78
         DF5eHYOoLYTcj6iYs2jc0FrDjnHXogi9HwVsWM8a5XSbsRw+14cX0HLyH0Lv8ucKBpvz
         0K6elQynyQ9+b6DaDgBYsvbxEwF+UG/VBRHKXxvoqVIVEFwx5Wfids8OsU3xB3JleZCl
         ubH7fZTnNDv4X6vfpBJscFqff3K2E2VEnLkCYSGY6MlImr5Cv9VEP3iHGAn+nUCAlCfr
         owj438PhzPIvEilEKTzkMGPA6Z5wYBxleRDrcu5RMbnRUn+i0UXDdI/jNvVgJvMpYE35
         gtsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSDsduj9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389046f7e2sor51510805e9.7.2025.01.22.01.30.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSDsduj9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538244; x=1738143044; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        b=QSDsduj9va0/5eCGAjYWvqm7OpbC5dS8LSl5+9GS4rtNWH+QVbNA71einzfoHrglKG
         FkFzaz0xb6L0UoHyBcmTfTj5uaGzzXHSDMfys7IemFyJnl5qt3x1s5BM7VM1LUS0lpel
         zzRvA+dm9dKYCGrMBgWaV2q2zBz/EjlA80CePWvc1AfQthmeVkYt4EolDdiGGBMOFKo7
         RejjWrq8Dh6GWPiv4dMYZoCSHjHG7QHQlL5VmG5FkPnhU0zgs+fRdPmb9PscWSnlm95C
         qfc4bUCCx4YNtRosUiYRvuIv7KY2IfbiDtZdTB2yWDJbM6q5wqVNklZcLoxHf4VY9Tha
         TOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538244; x=1738143044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        b=gYZKpZzJ+XZ4OCSDKOznU+py8ujYRZqBs87Fgin2DRMpp5khHGs+IUmGCjoFVaHjt/
         LRgKWLbULKFo8XUp1uqWr/LfqOsmAgINzsw9Iv7YGkmKYS+n9Du2OXHgP5L14GXouBRL
         9M6s261ZDmrbG1hGRYWmz5KaNO71i0kMb+jPdTrDo0bCx60/exHZVeJDjM53pxGDVgaM
         urFyNzU9UiuFnkRW8rUYi91CTXc2zzfQLdfxnz1x2fOjTqegKWaDX1wzGgR6/EanKKtj
         ziC+S/jTSIfVNOxpJn4ZJya7lTHoojdPGlnZNtL0fbnTk1c29K5SH9YJNIJD5XCoV8bP
         9veA==
X-Forwarded-Encrypted: i=1; AJvYcCVr9jfe2kNIQcXvnKtrrSAsBQKtCo1HWvLaNGuZQpe4N6tEKJbZpoxitiCaPM4bYDTnHYfjFvIt8XJDDQ==@linaro.org
X-Gm-Message-State: AOJu0YzU+oC7WTkITSE/32olkACQl4IHvhTGvZmfHJHBE5aonPUXv6o0
	y3MKXfeQBlkfTUFdrXb05dgo3Ijz+p29iB+V/MLhyQk4pjaFOD12nprTaRr45z0XFavHyT2Rev5
	2j1ILIw==
X-Gm-Gg: ASbGnctutRpnrDe5S/PxxslPeHOwBTyvQ2EmxXgCVZtF8EvYYvRAn9BRhF85Nx0eZwX
	kVqW+fJ88kFpngjlbQ0zjis/1ezRRwVy8d5/VJJpgL8Vdd7u90hoNqU8t6OuIKDPPF+Q/hV9AQM
	zAPzAHc737p+PbMmuu37gXyahTc96++TThKrkpeJk7I0RgAYnLk3fnPaPm1on+SYDLqLtrakwTn
	yIctKnghU8BrvGqqHPzc5B4QlcCHvt/xjYYzN90loJD41iWblRDTCPcmC+g/Y/9FPT7AecM7Yqe
	IazwXpsOjinHvxezBauHHqSiMBwcPh3abMOpz5SoLWwb
X-Google-Smtp-Source: AGHT+IHiUZIdO9A6w16zxh/DaE5cD8lYprARYeJQ+U96OYFnahGVEXjmjwj0vMVEtFkeOyFPL/1N+w==
X-Received: by 2002:a05:600c:3593:b0:431:5632:448b with SMTP id 5b1f17b1804b1-4389144eed4mr166894525e9.25.1737538244298;
        Wed, 22 Jan 2025 01:30:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31a1e7fsm17313825e9.10.2025.01.22.01.30.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/10] cpus: Cache CPUClass early in instance_init() handler
Date: Wed, 22 Jan 2025 10:30:21 +0100
Message-ID: <20250122093028.52416-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BOby5zEH7T0T

Cache CPUClass as early as possible, when the instance
is initialized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu-target.c         | 3 ---
 hw/core/cpu-common.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 667688332c9..89874496a41 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -134,9 +134,6 @@ const VMStateDescription vmstate_cpu_common = {
 
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
-    /* cache the cpu class for the hotpath */
-    cpu->cc = CPU_GET_CLASS(cpu);
-
     if (!accel_cpu_common_realize(cpu, errp)) {
         return false;
     }
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index cb79566cc51..ff605059c15 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -238,6 +238,9 @@ static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    /* cache the cpu class for the hotpath */
+    cpu->cc = CPU_GET_CLASS(cpu);
+
     gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
-- 
2.47.1
