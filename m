Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42893njb;
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9I1BrNMZSdnR6BeVouMnzAQxPF7YF/Zkw1lzqH0X8IKc6/A3g7DiLIdBDqpnqo6PY8lCck73Mx6WA/g==@linaro.org
X-Received: by 2002:a17:902:e94d:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22fc918c322mr213575075ad.46.1747073138196;
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073138; cv=none;
        d=google.com; s=arc-20240605;
        b=d/KVgJwmcYoDS6pMYqNXGP+U59+3RE5whVwRW9nb+U4wBEx3aKSzWtPF0zwXwTgYO+
         jl+r68zEEd7DYBVBZFxunx8CTifb4CPuxKR5oeXkO/CmkxI4Awoum1495HZSCutdbC8H
         Rf7WYp6begXLgr1wqlgFjVxgrjVm7vtWlzWmHfkKkRV2HwkxLYIl4/Kjjql2gPFV2P9U
         U87ZqiyZZczIAZ7TIoCl+zsZqVne1pXYPoiE+fraONjOKhOghe3ksl3NK1FlBvZxSKGj
         UX/5p637XCKzx5fclMlbOle1ARh2PZzDMAcfkjBa5t373v0ACm03yFjPjdNmRW2blttq
         6JrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3AGfH/it6XrbUjxeSHUy0wlg4nMt2R7aYVYgAEJcCXI=;
        fh=nxICSv8KmcKKQk+dGz0FiYK8nPeVYhjFbCdcPnSLuFA=;
        b=a+hwRM/bJsrYoeQoZv1wT2tOBDnqU3SEwdHz6WIitDVJ93koXfNQikQaJD8W/u4NNx
         MvSnCyVrEPOhVFFvRiy8H3Dp+dTxY3BQ7A8mMLZWuixX4vBF/NGF1P/E6ZusmX/N2PyX
         E0Qni6WeNrTFtohJ1qhbM/ePsBzBsmkTEDUUgtG9twZuFIkubrhLLFHLHQOQtZozgsQ/
         1YoRms3V0LItWv8Zw2LODCffY04+01SlsyYz06rwOGjMHAJUqeVvGapKlZivbjEJ9GGp
         hpvJwvd5QU43bdxwnSAwZUUVoPhJKo2YQbnpfF3/Rxwc8+T1QwtZH5eGwpkuZsDH4fIH
         iDNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MChIqF2F;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5a2bcabsor63622435ad.5.2025.05.12.11.05.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MChIqF2F;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073138; x=1747677938; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AGfH/it6XrbUjxeSHUy0wlg4nMt2R7aYVYgAEJcCXI=;
        b=MChIqF2FUNuVyH4fven++O2r74Xooalm2PJo9Ntrp8X+pIRuiY1I6U75AJpT9upoll
         kbJMMMD5seyk9HaBX4fmre+bzmUUCI/KVHJIJpPml4YwT3JfzkfFA2nwHIGCt8K6Bk3v
         wrvnBJNuBDhV4kMUEKUsZOwVG7MhpllWWcwTgoA4eXYd2tfciImvAGrrlVGXkKQcpRbN
         8LpgBfWLhfjNNet4/30nQV83QJWaRcD/a2PL06GYmuGx0z4G8vEthikyXyztk1pmzpA/
         KZ6TfUMbyZr3wXpgWnOe/1OhVBj//nhAV2/5Wj9wv/BtwDJKxpMqkxZuorKuwKnuNCMA
         Q2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073138; x=1747677938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AGfH/it6XrbUjxeSHUy0wlg4nMt2R7aYVYgAEJcCXI=;
        b=HdZhMRdYZ3mAxKWtjC/gHksKci7h1UBj1bGdVmebsCMJC31yPKm31x8wCT9uKm2Xeo
         kKrfxlKAcF0+2QsCr+XOP4h3goWhTNEDhUEtDRSSxXfbNnSMNpqYF+v0AZLiB8Bp4bTq
         fyL0FNE9iAHo8aK+KEx/4P4UIAHNxxp/U9wElicQxlKzxZplE3y6mKtM4I7IC4nstZ9W
         W0jhSc5+kDOi3gr0IDChCmEEirCX2DJxYfgqMgRTWdKXTmUQ8C9/KCXHi+Hl/m+BCCCp
         cpzFp21nEHMf1QHsqsUXcJpFXqfSGSa36wGfdzepnj325hga6I8MoGB7oEfTzPmyLidB
         d1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVNXX7UQtvz1FbCeL/aVWSDQCl/hlrPDXAok/vdPeXLutbumgg6y3zqLN+gCCme7BtSle5FWSrXbBJGkg==@linaro.org
X-Gm-Message-State: AOJu0Yw++QAn00e7CNQgmgMMjlq6ReUtejKZORRbPJkCkq2U89z9yNMr
	prD7rS9RpXWSCwXdoIUEcLTYbvAe3NBxZJ5HBSVZs/0+LO8KH2zjvr+i/eipzrsDUw==
X-Gm-Gg: ASbGncsAgmxllOc3nJpyxYeaqWp5w2FK4dEbCW/zUJlgPTUGCjmqWtnKZe3vTp2mYqT
	Kcnp8KbCf8d4g77XU+Z6OIBnrz3ojaoULAFfiPo7xkFY0UK2i6WQcFQUUBPGpn8lj4vzKeAMt97
	mZop4REXe+NY7TMreFWwceeFmSdseKCJWcBDWrAo0ANVy+ET+6rZpwb0B7a8Y3yXN4mtfJDyWMW
	SfDoan7qVUlt8FGi4QUJBrV4St+kHvvomXAKpGzv+H0cSpb9XOevh8yr5C/N1kNeq+6J3FXdtlF
	fX3/uSdjArPfIQspuUu+7tkiDNzEQ7Uh0HZnZ+dQzZprkPLv6GU=
X-Google-Smtp-Source: AGHT+IFqLZqdqiB4vnCiLX+YhBjMM+mS8XRugjCd2bR2uEmufjtP7iuEmrJPLIQL55DxmxoR6NT1qQ==
X-Received: by 2002:a17:903:2344:b0:216:644f:bc0e with SMTP id d9443c01a7336-22fc8b58ed5mr234792585ad.24.1747073137679;
        Mon, 12 May 2025 11:05:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:37 -0700 (PDT)
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
Subject: [PATCH v8 29/48] target/arm/ptw: replace target_ulong with int64_t
Date: Mon, 12 May 2025 11:04:43 -0700
Message-ID: <20250512180502.2395029-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +ZT8Lnk9JCP/

sextract64 returns a signed value.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 89979c07e5a..68ec3f5e755 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
-    target_ulong page_size;
+    uint64_t page_size;
     uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
@@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
+        uint64_t top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-- 
2.47.2
