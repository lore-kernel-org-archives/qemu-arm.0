Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569270njc;
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWe1Trds82pAoZ+yal08290w33qidIfRqy90KsRGknPji+5YtTEb9KHrLdfapMghxQne/1d8OcQqyayOA==@linaro.org
X-Received: by 2002:a05:600c:5805:b0:432:a36b:d896 with SMTP id 5b1f17b1804b1-434872f56a9mr103419425e9.26.1732564768020;
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564768; cv=none;
        d=google.com; s=arc-20240605;
        b=HGPDHbFc/UtmMoezQSOa2GbaIQGgJ94yQYFvp5nbJZCr5xrOO0HwnsDuBDuWl4azB+
         VVKqMVBGgtP6R0Yjh4ge1hCjfx3JdEEStSjts7TlHsOY+qPRa9xTJa5Rp5qnnE2m+Sud
         LtbwJFl8isKJphXphyLaHaYdsoBpZ9F5sGN4ZGq/U41PQCBxToH8iTkBM4SYrwJ+Yc3K
         v5aGf/Nc9IXeibTu5kerProBY2BmOUojqqeh2BkkLE6OK2kXtjIb7WRfwqYOAmtLrMae
         xYBYgB44tVz7aMSQl9IjqOLoLJSLdlmENabDthPwHpMcA83XmVL0wSB0yhToR0GC5VMY
         CfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eWjtUwTz+qxGQM43m+Z3dIisqsvdUtxVeJqucaNK404=;
        fh=IBkcCaxWCvmE6gGKwuyUH8n7P+laOwk0NNjp3PXyD/E=;
        b=PjHN1xbVEun+bcqVxuysNNPX/wiKHPNTfqYUkHgOgupvvpglECAimLu/e07WPUenjr
         zZcOPwXxtqatfweJ+pgZSC8OYT30Rr7acdTSGbeko7DgYzxG3TSk3jpux41GIXVudFSc
         RoGBOQbIB+qFpf7OtsULU0N3dHo9vkOJY9lEnyop0TSK3ujYjaShMVJHMuVdknY6LKGL
         vE5/iqoQMNrKeYZneqmc7maMSV6kxetI5i0t0Tf+NVZAKQ9iGVAkeee9KJQu31hPf13B
         jZRjdsSEjy+qTNhdoeOu3yYhMv1gOuTpsLu/2eSkR9Ftdu4RXaL057D8jJ3MET8kKOgY
         1wAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nQOnQhJA;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a0515a5fsor12163775e9.4.2024.11.25.11.59.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nQOnQhJA;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564767; x=1733169567; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWjtUwTz+qxGQM43m+Z3dIisqsvdUtxVeJqucaNK404=;
        b=nQOnQhJAeJxnDQYlAMCc/Ltk6xW3bByL3+j7lzuQyopGMuXL7fRg25up6dKangBysm
         /TzGnf+b/x5yDq8t8yj9x76cCFc8IhqvHf0aQsVEZUoofLWVC2HNRJa8CQ0Ji7nDA/u6
         eAZz2ft/uizcWubxzOabqomHiF5742gvGlIfxyHWD15d98rNM0aa3xORqch8c9LoBUSC
         nVyq9Zwu7hdLbnk1CtI44sMaX2qchifrEx0x7DyNkCegpnHiP/ruw+LB9Ue8VMj37FQw
         b3/n488QOTWqNDoORFpM7uzC/z+9EAnJj0GhtSPf+tRV5B1MoBJDSkKCASSHM0iVnBco
         0ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564767; x=1733169567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWjtUwTz+qxGQM43m+Z3dIisqsvdUtxVeJqucaNK404=;
        b=GId3E2KvOmG8sApgn7R2RRT7EsaSPl2QXfSUJUvE3G0ulc8uGqP6UZ2VvTQNSu8HdF
         AXZo1h2WWY6/uL4PhbYVYxB1kyTK3m8RVuDPbuLkVxnpNEPSXsfbg0DjeVlOs/F34FWe
         RSXewBMKVKZNWU6CQxxqLBPJku83Px0KfLzo6bHEYOA17Q1QbgrqCk2kSF36ZarXjhV6
         MkNLZWM/flhIbMFgFqSfGmlmi3fHmnWO3HTh3m5el7CtxsilYIZrHxNvqxc/KRPRwRXo
         ksYCBzZKVFawl/9wqwBJPgUhklzFSqaZZdAC464R54O+9tIuBUsrg8hbLjsyczeVWhT9
         GrLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl7R08m5G9uixQzU3HfeUNdIhrk2ZJKwJH+sGiZ7cZPOXlNTsCc58/TDDjUgatvEFe5+Bk0ldfhab2cA==@linaro.org
X-Gm-Message-State: AOJu0YwiooEw9VTIha6HwtAfzGkXuuJtWcgLoKvSGmS6tBxESJH/nZgz
	WwP5ox0GooBF40Z0Go0JAtTo+SLyH3O/NxQqUwtVht8TbpxX73H7XrsCCfGbaSeBxYeEsH+erym
	nvms=
X-Gm-Gg: ASbGncukV9jCq5LYvJV6oJoRFtH0keoTxgStBgGzTZrhmFf+yfHA2AopBobEgWtrQld
	qIn5AyvUMJVSapE0aphPZOa0gk7iSU2JfluXKaizMU6K/RDgac/FiSmIQKw0RCY6lWKnjCW/WIB
	M1YBQti9zOM/gCVRSgu7WazxF65JcCB+DTbRPG17WWkVIP0t2oD5pksi6ks5HKp/GqmTZ+Y1qb0
	57m6iW6RLerJLCIFwJjReA0sHlP57hYTE1zYikwwqBKuQ9ZnT65dnAvB7LYwmp+/hcJ
X-Google-Smtp-Source: AGHT+IHn5QrVSKT8f+HZbb5tv4/jHNV6uqmDU1SLfzrB1hHig0KKaWqz8lFSXW23mKSBRR1e1l/D4Q==
X-Received: by 2002:a05:600c:1c8f:b0:434:9e51:4db4 with SMTP id 5b1f17b1804b1-4349e515028mr48346395e9.6.1732564767551;
        Mon, 25 Nov 2024 11:59:27 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:27 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 05/26] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Mon, 25 Nov 2024 19:56:04 +0000
Message-ID: <20241125195626.856992-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oENYaw9MjB5Z

The confidential guest support in KVM limits the number of registers
that we can read and write. Split the get/put_registers function to
prepare for it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 440c3ac8c6..0c80992f7c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2062,7 +2062,7 @@ static int kvm_arch_put_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, int level, Error **errp)
+static int kvm_arm_put_core_regs(CPUState *cs, int level, Error **errp)
 {
     uint64_t val;
     uint32_t fpr;
@@ -2165,6 +2165,19 @@ int kvm_arch_put_registers(CPUState *cs, int level, Error **errp)
         return ret;
     }
 
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, int level, Error **errp)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_put_core_regs(cs, level, errp);
+    if (ret) {
+        return ret;
+    }
+
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
@@ -2246,7 +2259,7 @@ static int kvm_arch_get_sve(CPUState *cs)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs, Error **errp)
+static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     unsigned int el;
@@ -2349,6 +2362,19 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
     }
     vfp_set_fpcr(env, fpr);
 
+    return 0;
+}
+
+int kvm_arch_get_registers(CPUState *cs, Error **errp)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_get_core_regs(cs, errp);
+    if (ret) {
+        return ret;
+    }
+
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
-- 
2.47.0
