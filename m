Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498075ejd;
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUONQGlbxmOK6TuWuLBY3nZWXYq/6qv/JpcFmEAziKAsg1W5boYnawR7ymGgQR+03u24ZgbbXTFLZ2NmlQwuQdmz2hnqBpu
X-Received: by 2002:a2e:bc0f:0:b0:2db:381a:bf6e with SMTP id b15-20020a2ebc0f000000b002db381abf6emr1676713ljf.16.1713542399715;
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542399; cv=none;
        d=google.com; s=arc-20160816;
        b=dKckGESQyCpeYe+oUlhIJCfUsL7bPGwjxh4WjyxYk+XnZHHa4xrhQHQhBCssC84oDS
         Jt3iyun3Dmddh9s91gPSZXQMdg9s/4RObBTE8ZSkEE6WescExEGsgia4XhdFpb/yWsf0
         m8A/+pNeV9SroTTQSEp+RY/Cf0oN96ECJx+L7KtE9M2PD9Twn/MSRMli+zAAavhhRM4x
         85UobWpDWEMMlbMRI2bx/7zCJdt8jtzSyDQV/jVSgQx4WuM17Ms+mO2zUi0L0pgdErY7
         y4NhwzBVm0t7rrTn8ft4XtaSL7WAGrm+jeGsZe1le5WnKMhIeCIzTMZigUNx3mJ2y/ys
         smuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jIcQyW6KzhNyvwt6+UmGVqg4qIIzzlR1XREhlouJbsQ=;
        fh=AQ2A8h04BErs1wzVkODdxQW16yyZ6mkk2uszQ9JZZ4E=;
        b=W43A00OZcT50OybZwO2Yype0+fNvhiEVNRsXGNH7d0EOCyhmKj9ybP4arquJ7Stqa1
         32GNhdU3kfhH+kk7IlqpyhFNQrVU2rfIobpLpF/pF2aYD1E7WWXKdc8ctn5hWWP9uCm1
         cWzOKPRC5/ykwDHPyMaIYO+9KgS/f6p2/D3JOM47rm0lcaq90Ih5ltjlYbIfAjy4YdSs
         T6Kgz1ZXj8lXCSilqQ5qpZ+g/m2Qd1txkMcQ2qsMbT29h0qA+pdlGi0HGVwqFee7zQPh
         HX+nAsJHJfo8BabJRlfXIgFpNzYZ0zfp+zZjw4TnhfNd47RnwUtjfeojQVDiHrAdOP8i
         31gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xK7Qzvti;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r28-20020adfb1dc000000b00347e635db1fsor1288637wra.4.2024.04.19.08.59.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xK7Qzvti;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542399; x=1714147199; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIcQyW6KzhNyvwt6+UmGVqg4qIIzzlR1XREhlouJbsQ=;
        b=xK7Qzvti1S6Gfb0wP3mrz2p4Pc2dOyV6534V4NtG9sutkjLSC/XY3ZMtYByyJEduhU
         fK36WB9vEAW38d7hWm/FsSUFnsu0QG27VvMwrcjw5/iqJMzDM3T6ifmWXEHpHe0cdRXm
         EB2MISg/QVStKHp5aTV7OM8BGnlNJgqJ5r5L20i9IlxFC9P0Hi8BZpmeyki2bARJ8Kzo
         JkSiQXKZNSj5ko4a6wQLdEarKX3ZQ5XCZnClsdFfyEe2bv4Py+KrJ4Qv75VwgPlhOMc6
         uoyej97BAwc6VL/2kIuXOBj/3MoG3hHKdtWnp/o+0ZxqiAOQJTINKQtLDbmjbSe53wXN
         NuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542399; x=1714147199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIcQyW6KzhNyvwt6+UmGVqg4qIIzzlR1XREhlouJbsQ=;
        b=KXaC8EJNGrG3ouIxYsgfaYvqxxO8pUoSodMtuaxj6zRzraZHKgc1EYdk7YmtpMU9mo
         TtZf0SpWEd5Gt6YrQ6LzpemzZhk2okaARktcqTr4Ad9BDI8gmtStqO55XjjSC9XWhnqJ
         SYcKuRj0xg8sF2NI68BMJnH/OsTwa8Z7Rpmrazj2AginrVtlD19ql1NQ01wq9un2ikpD
         6eevzGrw6wsODGvWbgSmHlYZ/y2OtsT1tTbZ16iuo6WT7E7DBD5xZdmQE7QvFyNxOWn/
         WbTi0tQ5SKTjSRRDrekTfF5EO0HuvF5c0rPCtkp2Iq/FkGTT61chioPL43c7pJGSKLqF
         BRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/OuYp68fEoHsOVSSDGvwuc21ebB3/V/D1+UcZvf4KKAfXfbl6Vmco96qA+lHoBth4YCHZ+BSBbS/lv9wp6dXrIrg9sooZ
X-Gm-Message-State: AOJu0YxRnTYCphR7EcSJbvHUric2TMnGGQzCN1sn6Jn/V+dNjBMYYkb7
	KI+PKU6tytZP0sL+CvY1Zis4qBVGQmq+wYZuafJQyDznkwZAhH5VaDbdl5wuzcoEEg==
X-Google-Smtp-Source: AGHT+IGhGSM7QgbfXO8OR3slb7jRSos7wMZm9vS1hUM+S6LXvKS+/GJivhp4kH4tzFVyibQMKFVAWw==
X-Received: by 2002:a5d:4589:0:b0:34a:5663:40e with SMTP id p9-20020a5d4589000000b0034a5663040emr1679936wrq.9.1713542399398;
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 19/22] target/arm/cpu: Inform about reading confidential CPU registers
Date: Fri, 19 Apr 2024 16:57:07 +0100
Message-ID: <20240419155709.318866-21-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: on8HW4It5fAO

The host cannot access registers of a Realm. Instead of showing all
registers as zero in "info registers", display a message about this
restriction.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 target/arm/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ab8d007a86..18d1b88e2f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1070,6 +1070,11 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     const char *ns_status;
     bool sve;
 
+    if (cpu->kvm_rme) {
+        qemu_fprintf(f, "the CPU registers are confidential to the realm\n");
+        return;
+    }
+
     qemu_fprintf(f, " PC=%016" PRIx64 " ", env->pc);
     for (i = 0; i < 32; i++) {
         if (i == 31) {
-- 
2.44.0
