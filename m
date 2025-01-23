Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485079njk;
        Thu, 23 Jan 2025 15:44:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSMEOKd/xWzxw/pcZENmVj4gStDcw7nmx9AxLNbKZ0C4ljo54OU/JbERoYYt7SW2n3DEKQF97kB4OmQg==@linaro.org
X-Received: by 2002:a05:600c:1391:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-438b88603femr46864955e9.14.1737675884551;
        Thu, 23 Jan 2025 15:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675884; cv=none;
        d=google.com; s=arc-20240605;
        b=P3FSnXAWevCyUzhBZr1lthozxgTMsxpeCi7ZZOJeMtAxFXhFX2eNeSc3E8SrOLInAQ
         n+zK3XpIxWZJZ8XxYP7ezmpYnzY9zj0mMyPt4LAt1+MSWuZ2ZBtaxXHUKlnYuV57mwv/
         4RQ2w0USZd8b6VYeujl5EcVBhmX4aZe+em/sUgy4qut2mu+sz1QDCFtUPy2Ry9aTFgGy
         FEpXJuTulkavpczAR5fJzcdeH3BBDKT6FI1LtT5CaB3Ql4EFkM6AHj5W0R5yzwWejK0D
         edFY41inL7v8oGAYb+GfJsHBShyovTC5XqOsy2JcJs3XmH2w9WTfYRNYTIB5ny/zYE6T
         PP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
        fh=T6b8VdlgYHQ7RrGoxgHG/AEYxhKfti+uN3lo8RZ4Lc4=;
        b=gXl9wNTXPb9cmP5qEwCv2ActYNY309EkQ3c0E+rQI2AyZ13SP4mpMwbXPByrBy8qIA
         J1367qgmaU0et9z29dGZmUyxqyOClNzomFimQ2g7HcuRVmI7T1gxICueJbIamQb8a2vl
         NhQUYWrGczAAhbgbADgRbChrZxpMfVMQwO4Eum84gDY0pGyAoCmOXrpTpQPh2LwgOAJJ
         bqYxYw9x6ceybK4eJjkb8cmdGCm3EEs4HjonzYbfNFmHRMyA+LJRmQMNGeotrS4Qrh1n
         8aVrvSCjVo31y+/ErqlgPlSLjCrNUAW6eeEO16Si78Tghik50jBGQ0VChredBvSK8Yem
         OkKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qzM/wijL";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438b31d9311sor13990755e9.3.2025.01.23.15.44.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qzM/wijL";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675884; x=1738280684; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
        b=qzM/wijLor/2ru1CbW9AfjWlOn2OIEu1CDy93o9blWCxh502UBH8xmmWng3dxxwfrG
         Pntpjz+TC9AhFGAC1T94Wngy4MCKKkfC7LW8DVW4XmAX80wjS/kKp/jvMMQwnp9CZh4I
         zwWLWbYR+yOECKmUL02yjKZCSdkn6l+1cKz87e69Q4P/SpelzFLVOCO1ZPa66ZRrjc4k
         EqjkmgrQkVEzULuC4U7lR3KTsxu2O5NpN1EFU7kza3o0Ax9ZKM1cuWPzcoNmW4pEPfQw
         Y1jj4WUt5eEpFtS3EYXROgnJ/L0pDxD6+I67SMYglh+dRKLyXJkujy9/S8voU2QY/7N1
         12vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675884; x=1738280684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
        b=U/blaPyflcNFlS01jo5f7mHjtXXjjCcwmB7ccCwmCZBHnkVpE3EWNezLm8k+FKRisD
         71eB3rYrAUIA7PlhJFrIPjd3V7PsED4mGzaY/y6cBHxavXUtWYpp35DF9OQkPFoFeDA8
         P+zjEknTf9ubNN1z7QNRr1/Z7peDWGV6S/411qbrpMn9wjswy5eiToDWYRLKo8F/y+yU
         dm8tZ/n5EZaAJKD7YzPwkOT8xBu6b66U2QM6y5MDTf2gTK4d9GEMrXzoPWvWPibiyU92
         7ZUOc9A7ZLFUSnCog8TQLLi4ZsFOo96GBdvIk2kEm6czfnMmaUvySVM65XFdTDJ10r21
         88Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWnZBwSTuXeNgV28DqA9K1uMO8bJipXdYYJb94gsRM0bAQ24W7g5qf3dL+qUrUfIlkEWyEAsXwMM7Q7/A==@linaro.org
X-Gm-Message-State: AOJu0Yw83TsO2wgON19A1pMWiYujcyyhaEDrhzfTRhj7WuT+euktjA6U
	ioFN8ZYgphFPqO06evKO+FSCnujyeNzp/XpPtk4pwCAylRSOqJ2inlHkCtgtS8+reg==
X-Gm-Gg: ASbGncuJw+II/ERr2UUAKfhCkZ1gsYmcU7xCxUnGe1PIl4kDTfE7ESLR39kh+YQPOKW
	uamRQW3wn7RsFtwbCRxOFK41joOjZ9EO0zEqJSFhOs6e3hul+Latp6XfniBEVXqO/HRMOhMxhcO
	XEwW8jy8NrUW2JyuEe3DOGJnWFC8Rb6OcVJKf6XOlG9DRI0mx4aqhHnI9Kvkmz0RQQ6+vQjIQST
	GvXrba1aZyWxKtn1dMl03Shs+yomxUk17g8DNfRHfgSgZzZcBUGz2a2pUUPFJQ7/wHYwnc7nmHa
	K8ShTEzqaityPmpVXTalgG96cveuH7gTa9UA/pdy83jExLTQSZB4EnU=
X-Google-Smtp-Source: AGHT+IHfcp2D5aSm8Sn0VT4IidLdBYhD/KSzWcZHka724j1qpNfMP/dVIsxPCprx8nPoBb5TgAtEpw==
X-Received: by 2002:a05:6000:1fa9:b0:38b:f4dc:44ad with SMTP id ffacd0b85a97d-38c2b65ebf8mr997845f8f.5.1737675884076;
        Thu, 23 Jan 2025 15:44:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d29cesm6991745e9.35.2025.01.23.15.44.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/20] cpus: Keep default fields initialization in cpu_common_initfn()
Date: Fri, 24 Jan 2025 00:43:59 +0100
Message-ID: <20250123234415.59850-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1MG7ZA/oMYcZ

cpu_common_initfn() is our target agnostic initializer,
while cpu_exec_initfn() is the target specific one.

The %as and %num_ases fields are not target specific,
so initialize them in the common helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c         | 3 ---
 hw/core/cpu-common.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 89874496a41..75501a909df 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -234,9 +234,6 @@ void cpu_class_init_props(DeviceClass *dc)
 
 void cpu_exec_initfn(CPUState *cpu)
 {
-    cpu->as = NULL;
-    cpu->num_ases = 0;
-
 #ifndef CONFIG_USER_ONLY
     cpu->memory = get_system_memory();
     object_ref(OBJECT(cpu->memory));
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ff605059c15..71425cb7422 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -244,6 +244,8 @@ static void cpu_common_initfn(Object *obj)
     gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
+    cpu->as = NULL;
+    cpu->num_ases = 0;
     /* user-mode doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for system-mode */
     cpu->nr_threads = 1;
-- 
2.47.1
