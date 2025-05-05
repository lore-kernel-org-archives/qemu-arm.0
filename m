Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778360njj;
        Mon, 5 May 2025 16:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUo+MSgdlYPQjTJTzGUjtgPfmD1RXWzAZu2cDPWL9hbSRZ8gPmUNbhINKJGPAGhj5u9DvwmNrM0SX1iQ==@linaro.org
X-Received: by 2002:a17:903:3c25:b0:22c:3609:97ed with SMTP id d9443c01a7336-22e1031f6femr212699855ad.30.1746487249345;
        Mon, 05 May 2025 16:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487249; cv=none;
        d=google.com; s=arc-20240605;
        b=WDoWb/+4ovu1y+XzX5pn1mYLacDvVvt5RhQEQD1uZUrEm+o1YTNxZ8PXzk1Vtn9MZm
         c9N9aBsKjCfQ0vCzcPa8i5N4ZiLvs2Df+Bcw2qZOzD4O43DuQnQp+G6/aigdvMEofWlG
         fSIuaM9ZnfJdJWWSuQhySLnsS3LrwzWe8zxzau/GpOoZs+PdKJWzEdwNh91mU6WGo0DA
         fLZNEuux1Wb9FNyiisra/4av0RqBQk6DvV6UMsQ41kuGxxs5DTDd3VTpiRSBELvFR+Cg
         VXgNLEADpuLkoBKo3+zkYs9zfjVRzkm6JxzVv9JMNgqTk/qxAGUjrkOkh4rqGbBUYDMu
         hGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JUmj3qtC0Uxjt25GgPIz4kBx9RjJCUcgOSDgbgc2pqU=;
        fh=Fx/Wa8sCef8P5gOo3GMsbcRGD+rswnhVShM6pw/iDzU=;
        b=j9O6/XWdyIhlBRyNxyWGumkI9rLTiAcFzxCjYwERG5NOnFs3NTthb6q0NmCnVnuYWa
         HGLdEa0cQBvmHImOmm9qcH/ujPk3ozF9JZ5/oeYgsP0ZiGvClwyCoLRdjJuU/8twWq52
         wReVq5uQETT10Jvf45tqjW6xK7uD8ksFIo+47T4jOuAOjyOgbNhe97BFSpc7g0v79E2e
         wxZTvncyGPDxRqq0L0vVrcxR1YS/qzazsk9yA0ESEsx6Usi1qMtVPJU2jGQSjotgtyFU
         s3+YkWsuwbiJj2AIghYXpGo7ploZoeZDz9IIItKKbns+AM8FfyqGQj7CZj/VbvwMI05O
         KXgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J630+24l;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0fff0sor54571275ad.4.2025.05.05.16.20.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J630+24l;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487249; x=1747092049; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUmj3qtC0Uxjt25GgPIz4kBx9RjJCUcgOSDgbgc2pqU=;
        b=J630+24lPJ0FDtCYHTYV32j0GK++mkYfN56nAdKdlWdSpN4o1LKx7iLEZb3UCXl10L
         14yax+NUWm1vQpCKxv2lVwo8fmGECoNdQsUmheeuWd3i2kgz4IJj3CG95UfYHsFPoxbF
         xqKfefgABAC94fHPDm8A+SVjT9Dn21PQXfN7+T7ruFJ7R5BJ+3YjNE3PS5l9nP85AVTL
         EpcfT4G0Rza5M4OUg7IHf/4m0QY7k0WUoxkHB2KehP9jbfNXvyUbAwjTp6SkBf+2Pewk
         VgZE5Kzm56bHRuwOzoXKC3qUR9uo5gqNZppgTZ+AoZBrYWygGYj/dLYmq/hAB+srgs3Z
         yXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487249; x=1747092049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUmj3qtC0Uxjt25GgPIz4kBx9RjJCUcgOSDgbgc2pqU=;
        b=v1TC8X4udeT3MJjw2q6V0C+XdDOnHriayPLvsdTs/PJ2x9y7xclnb4MSo7AvOgRMoq
         yr/ef39cxzRVWadasI8BkTJ78BwJ2Kqrl8yqg7euAe3EpCLFytH6y9gu00yY05VGqVGa
         rrUupsgdufX9FN1/BUEYa942mkpO+IwhWarsKZorlEaAztQs3Epd1Qipc9oZTp6i7rlm
         EXkHVr18f5tLAe5L8VckkyFq91w/e/XEwom595K/HEkNOjFW5C4lzLgkMt4UGqpLk4pb
         KxfHTRXRgIWjPDOiLJkpxr0NVk8+BQ3Y0vf7Jq/aWeBtQnz+2fSAtQdRTniRkOx37GNX
         6Tvw==
X-Forwarded-Encrypted: i=1; AJvYcCXlJPfaIqeT3nqJjs5JfhBK8zbsLR8j3Lj9wdwcsi2Hsd111iwNRGfea458TbSnZNPd5vqi1SzI8cJwiA==@linaro.org
X-Gm-Message-State: AOJu0Yw8QjB1160LijZUVZ4ftJxNYcI4TJgfhzsm2sZoaNL2bpD3aRdK
	9KvK8C1io/Ah/LL4J/bvdNmF6OSXPsIhBcnvxWuCgGaV6yM7+oY/mbRdq92fdTKGVw==
X-Gm-Gg: ASbGnctPt/rRQkXpDhCqXDdrRBUGpxDTY3DKUz8aagDX4Sq61luaMOqLwdCAgi7dm82
	qx9VL+C1XP+dt304n/TgI5mhyPrWGF9CHk2qq0r7kn5e5UfYWwm6kjVqY/pp3srITV34wwXndVU
	K7czJCv69rXRFQCWIgAE1sYMWxKAAIQK39I5TY3MFdJw6UWCQrL0WfckR2g5DIeuIXN4xeHiCbB
	a9Rs+MhlPUJkTVjvsPdlqDsIk87tIqYn6sLmOdlYn/quMh4s1znPjyMtM3nqVJ61mlzrD2GWvPD
	x3hRDW1ff28mTGiwyuFQepAhC8+I5SUP34PLvXwGjHrvvzkHESM=
X-Google-Smtp-Source: AGHT+IHvuVTEdPuucnAVpdGG4ydIM8fLCmaTsPKggUPfKTAS4sZirTPdaGSJrLHEw92uhuxYwBNlUA==
X-Received: by 2002:a17:902:ef43:b0:221:7eae:163b with SMTP id d9443c01a7336-22e1037ecb5mr223727865ad.46.1746487248943;
        Mon, 05 May 2025 16:20:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:48 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 32/50] target/arm/ptw: replace TARGET_AARCH64 by CONFIG_ATOMIC64 from arm_casq_ptw
Date: Mon,  5 May 2025 16:19:57 -0700
Message-ID: <20250505232015.130990-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kAGXdHVJTz6p

This function needs 64 bit compare exchange, so we hide implementation
for hosts not supporting it (some 32 bit target, which don't run 64 bit
guests anyway).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 26c52e6b03e..c144516aaba 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
                              uint64_t new_val, S1Translate *ptw,
                              ARMMMUFaultInfo *fi)
 {
-#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
+#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
     uint64_t cur_val;
     void *host = ptw->out_host;
 
-- 
2.47.2
