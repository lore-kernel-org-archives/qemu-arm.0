Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42597njb;
        Mon, 12 May 2025 11:05:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3UKI77vDc4T8juGUPYY2TWAVU3es9sJdfZmIzapWV/p6NBgd9o7sspBWAREMxa+tUHJ9sA8Uedux7fA==@linaro.org
X-Received: by 2002:a17:903:4043:b0:22e:3d2e:d94f with SMTP id d9443c01a7336-2317c41c093mr4703705ad.0.1747073119537;
        Mon, 12 May 2025 11:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073119; cv=none;
        d=google.com; s=arc-20240605;
        b=C3AXLQ+aeK+kV1SB0wXZlStFixTr2RaDRagQdW/92/hphjdEHOKl3XQcOwbtrUEboq
         BGzwnVICdXMpmhLwDNnbxlUn92ks/u8WDfXtKRV6zW5YGHepysgs9hj4aIDXJdkU/tq0
         n5fHoQFIx0MqDHOQij+KBBoFdRrDjBq7T9oD47EY0zAdEeDuWM2MPZZAolgsrcESss8u
         aug4SzlquJl917k2nvpIQkMt8HgYPux9NFWobY0hkxKEguezfQlQXwdQEmneexkZJXEc
         qPBE/4WHV6vs5SClQd7TeqMORrcP9qJuj5cjpk48+oZNqlLIG9ii0VlbGgutH7yr7d/5
         y1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eeLa55SzX7Awe9dK4zRdJwFSzsCeJiaBfVkd4m0OHRI=;
        fh=V8zwhYRLcCMdra2wXMri+6zIfiJoWO008tdBsaG5FDU=;
        b=eYHLrGsMHR7y6DLpawdLKySF6xMoV/m87EPhlyjlv4tOTJVr49YhdkoDU/9hzibwTX
         eXZkTExHz4adtFr5fhYIbZExvkIyNQZm7Z4Ad3tTKHxC0TZT++yiN9zVL49CeEtYMlSR
         VwxruFn999j7865QrcD6qXE7PdU4JnGSRGqq7XvoAymuSohU5WIgZR1mX0slk2FZCql1
         ERmyFA+Cu4hjSKkrI+p38lFv6BO6xs8se4aZ2mtN/ltJwZg/Rl6B+lEg4W4iz8vkIfHl
         TTMlB8P8F/z7cPvB9ZX8zygK0bLi+6BKN/K8PmQGKyUpGWM+49UJPwIBMObUoasSHqWo
         kAfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHlZPWYv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5827f8dsor34035695ad.1.2025.05.12.11.05.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHlZPWYv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073119; x=1747677919; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeLa55SzX7Awe9dK4zRdJwFSzsCeJiaBfVkd4m0OHRI=;
        b=DHlZPWYvZVYi0A8Y3DSYgqv5iFE+F63M7FIRNzabqmGXSFlpxc2pga/o6rSVN/1NmN
         ntkwMgPPBuxiF7F8GHyNP51R/Nr4gu2m8yj20R74BCK+qVwe3txjuTPybPg2dcj9olPa
         mWAy6oECBHhTrQzQgb7nTtN0zNyBqZBaE36KkeB9WOXhZ9a+G+gn/1gBAHH4lrv+MQ8F
         acGxPf8Ac1StFowScNNj94kTJeISes4RRUcZ4UFYeK9QJT8Z/cZEnsOyaVFxjzrCpW5X
         R3sE4HUGfJH2TKFiou0RnpUxHiHA7/JvnNw11CChNNqgkY5lMZaSM7ZY71fQavHyHDx2
         NpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073119; x=1747677919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeLa55SzX7Awe9dK4zRdJwFSzsCeJiaBfVkd4m0OHRI=;
        b=tmPOxjiS+QRC4L59DLDGyjbuRwJPHUNqVf5lk+nAUo/o/dzYPsDmlKU0yQUNDL4TjU
         38xfJUVyaHjgRmlM/A8bTqXuFujDHy2UuNqR/CwOAWkJauDr9thAxV66iqQUMcLkyNRa
         VnKvHyBrMq94XGaafpcSVGgOXoaMrnasaFsyvifbgujzoS83te9VE8LPWG+V6SrrU48p
         cLI5wfH8aLoG9XQNDrLeyyaPwIzNBv5tY9Y1LkQKVRZgg2p2itE5bw1eJyU4p5FkyXcv
         QjNHbKmd3c2dVs3sF1yfLEnl3HMTtY9/zB030iUs0aSq0AtAfFhzgyKMeTK/BpOEIW2B
         /1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5lMdviYwk8eHI1LEjdBMdHVk+9KRs+GxGnKA3suNC0tSBOMWWbNldHn/HEOTG21WuMEypj3bOeAPp1Q==@linaro.org
X-Gm-Message-State: AOJu0YzK9EheS6BgakUHTdBYb2AEB23tDWX7/aEzYxpexSowXzjCq6gY
	FX3+X00VB9Ne7m73q/jHKU6LeyKcWVUvjwzbjWJxK3/ADutIh53DY4WL30LiA4xDkA==
X-Gm-Gg: ASbGncvabRTgvRhjOLlh77tXvuQ+X1ut+H/GkIye2aPC8d3lqitGEF86qqMrm/7Aeo7
	KydLiTwG7uPoR3Tt6Rw+ZBkCN4HUjGLaLKHhj+vb8C23Ya4DKvsBl8aFmhtaubvJ0PHYEzCJfUS
	LBGcH40MMkEmHHJfp3Emdz7gu5lu+BNqIByk2TRnVT5zytXyQvp9ca2Kd0xDUyZSwidvDSe4yHl
	0Kfr4MTy8zAmUssxManccEMK6fvbAmdos57HIQQH4up/SLfg3oJ3ruQMHI2QIZzWwF6nBbSQjis
	hXty2fyGdJ/ea6FpYfUr39iRG6LmaB0pZTHd8W1JkkDy2Yhtypo=
X-Google-Smtp-Source: AGHT+IF87iJk/TA43x3Co0c2zSLHfscJBqgiiHN6Ikhb88yHzL0ezxJVCrI5abT+ctobEAvuJ/KsMg==
X-Received: by 2002:a17:902:d4d0:b0:221:1356:10c5 with SMTP id d9443c01a7336-2317caf3186mr6221335ad.9.1747073119092;
        Mon, 12 May 2025 11:05:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 08/48] target/arm/cpu: remove TARGET_AARCH64 around aarch64_cpu_dump_state common
Date: Mon, 12 May 2025 11:04:22 -0700
Message-ID: <20250512180502.2395029-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: V8YOCB3Ui3kA

Call is guarded by is_a64(env), so it's safe to expose without needing
to assert anything.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b0eb02c88ba..b97746faa87 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1182,8 +1182,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 #endif
 }
 
-#ifdef TARGET_AARCH64
-
 static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1341,15 +1339,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-#else
-
-static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.2
