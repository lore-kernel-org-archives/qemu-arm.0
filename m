Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569334njc;
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUb1kj4L0FQyH8ea2pefJeXEJ+7xdB+c0vf00XVjRyp5Lfoh+61+emgs0Gq4870pP47St1sBIw0gzrJtw==@linaro.org
X-Received: by 2002:a05:6000:4813:b0:382:134d:65e0 with SMTP id ffacd0b85a97d-38260be5f63mr13089037f8f.56.1732564773128;
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564773; cv=none;
        d=google.com; s=arc-20240605;
        b=MOX2JSkeh73mtbBCrGRqlDRpPNz5ZzE22CSIj0C+7QzLZNOUfvdU6ASKcc5Tmo8e2u
         2/6zWTxFw9L/OENgJCofyp6891A4Gz6du5vHTPFY9DiKkXsS+Z4xrjuNl59kEK9FvWa+
         UEsUYryRbwEUzPWsBSeuDp6kC5vz3TyIY5EyUuOU2UJJEFlbFen55bTY/cPJkcOvKgjL
         Cb2kqR6Z7hO70owZCrACn3++KM+mKe8OZ9YiCsmlep7o+wsiTatpj1IECoXS0DstVWN2
         uN9qBmBgqNbKl56LjGrEFgSFWGQp/V3fCbCR+5MVjyko73KCejBh4EGtBCy8t/q2+i0V
         nOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NexLDu9BoTuLD1ACg75BFq2LpMIPfdBrbSTr833QRX8=;
        fh=D6k3D/9Mt8IrOctFy4JI9uLtHPUN11dKnR+dUfUc1q4=;
        b=V3Rygh3FV/bDNhuYvJqOnHQGBUHQO7RRh5TUBUTsgml1p19RsP2PydB4BByY5BNN0g
         oZj5HjD92wNQo+OEbK1WthP+A0HvK8vKoI952nYTtQ0kd85+6x/weg1sV4yX0POj6r1X
         I9ulesNgHFSma/ElVBAd8FJzn3DrLCz/H4PfcoO5R8RytfY+2NESxbI0oP+JcICemU1L
         y0SagVMm99uRdTAvn2r+phFJgEZ8u+uRJ2AUxa9FcEg2g94suLbCQrLlJhNIl6B+CK3z
         krw72M2vB3bSaxIg03C6P2is+MFbknfHHE+WsVMuAuyA5kqkIz5tRsMDDGNJYYqmDObw
         eaKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAiVHa7r;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385be96f020sor412558f8f.4.2024.11.25.11.59.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PAiVHa7r;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564772; x=1733169572; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NexLDu9BoTuLD1ACg75BFq2LpMIPfdBrbSTr833QRX8=;
        b=PAiVHa7rmKM95yeyii/tn384RGtf2RmzNPknCNMDv1JzHVVCYuA8FgjcO12WsuFltO
         i/l/tAJjzHrL9W5BmAbnC1JNVaX7o/lLigZhB4dHXoGQJfEwqbNfXgtI+OD1w+p57kG/
         VrYG8iYq67+wXQ5+bP3JgnPV6V+GDn7ljOtri4E1Y1BQj08VvaBAst80p5Vv7aBAm4Mv
         vUmn5Dg16ClxwOpN6mB1qwUopQoRhuZXI3k0J+GJrxXQUnU1MTibKniLmjuwZKk2Cxxk
         ijIU7sl/QlcGIjE1Ow91gWHgRKIl+T00UyQekVSsMdmwOo6GVraqOfLr7uoiPq3e5cPe
         v3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564772; x=1733169572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NexLDu9BoTuLD1ACg75BFq2LpMIPfdBrbSTr833QRX8=;
        b=CBfqFkslaW9lTTD3UbtzTMUZJn3k+VcN5W3+v4F8BkuEQT3xyNM1a2qI5QRAcI8Iex
         9lbHPkq4boZhOzE+fwdwRAag2gNiBepqb54hRZbxgGUOYmaZ20+h1vd0MHda8W/8PBrl
         kgJPrGp/YxXBuwY7aXgw5HTDI5gtx/0WF9XZZCXoouT/a7N0NetlzkXnPWiGzlewuLKW
         ckOdp1+vodi2qTk2jAGUgwuSkUsCAEgbY8EIC/PdRaj3teh37TYUPfeXHiqFl57vf2yE
         uaa2gEQ3uzkLB9df8MUG3Jnvd6CeoefvxJlYLXydkxpM9KYI3y/8VJgqqCgbpdR3LV5S
         XIOg==
X-Forwarded-Encrypted: i=1; AJvYcCWM4CAbJXt1FP6ubBFJjiAe8o6lEKdukuEgENpE4Jsihyht7ISPcVnjyAno7ofBG+ODVpVCv//pEKHOpw==@linaro.org
X-Gm-Message-State: AOJu0YxhAca5NJmDbL7H+lzj2nTeg5wbvimtWgFm5+6wX0dIvaPPOPRt
	49f18bOYNxQyEgDgYLk4oHDylUcbA8SRnfb8bKMUavkDqc+3BEaAybPAWHfizuFrEg==
X-Gm-Gg: ASbGncsXNwrKewk9LXmgN6Ux5x0kZdEb0z0JB7EYKakmzUUKAKd/pE3TtzhAn50vOvz
	sYdBS7IyZQcONL9DXaLlu8JMqCA6GpeJrAZJkIdD7vnLtdU+pP9CuiSzzI10IpU8LCcjWgpIgMH
	f/I7YQYIwXvjQEdQun8wCbAEh3FzUkkGPIBl2TVjXScr9W9M8IQErlXIl/+vHX2K7XJF1ZLWTb0
	cPUUVxS0CNniFGiqlrhEciPXOq95kFF9iUY7pDd4R+7l9ViO4BH/JdWc5P9tfCGVuks
X-Google-Smtp-Source: AGHT+IFCPZLjADcW8fIg/RWkYEbvN1XaUQSM0f35LENvp2ikPkmmonU9r3fcgb+nDIAWPkH3+0dnyQ==
X-Received: by 2002:a05:6000:4813:b0:382:134d:65e0 with SMTP id ffacd0b85a97d-38260be5f63mr13089017f8f.56.1732564772667;
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 14/26] target/arm/cpu: Inform about reading confidential CPU registers
Date: Mon, 25 Nov 2024 19:56:13 +0000
Message-ID: <20241125195626.856992-16-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lyfGVTC/BbBW

The host cannot access registers of a Realm. Instead of showing all
registers as zero in "info registers", display a message about this
restriction.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6938161b95..7f6569e87e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1232,6 +1232,11 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
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
2.47.0
