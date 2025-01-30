Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181917njb;
        Thu, 30 Jan 2025 10:23:23 -0800 (PST)
X-Received: by 2002:a5d:47a3:0:b0:38c:4a05:c25f with SMTP id ffacd0b85a97d-38c5209605dmr7275155f8f.42.1738261403465;
        Thu, 30 Jan 2025 10:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261403; cv=none;
        d=google.com; s=arc-20240605;
        b=gkx3E6ED/VnmlDnXXpEb1q2UYGNs4A5erxJSsBJV4//l0u35kp7GrMnA8kqYzh3P6M
         Nig65LpQKlzP8UHd5VgPQpXrxZDVU20UN7gyMc+Qki5tJugJEmKFokBxnJcrWYEE7za1
         QYonaXOoBbjb+JuiN2Aa6RG0l8qLuDIeNf7GhhLWPtV7iyiMgh58zyVTtGS+fh1b4n4L
         QdSVz/7bkZlEfsO7nhTJv1NF7kb2BRqa5zRP4bihUakXYcLXULIMp98ddO99PQHNaxd/
         Ghj5l+EO92oqJynsDCUm9L4t5hzHP4I5KWZ5SEJbFv65T59r2wYWzoyFVnVpjYGkSVK9
         1aOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uM2XjXMDd682NDA4uF6pTcUgEcj+06il83UYUtiVd8Q=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=ExRpbQMlcMmSJBZ6tkIkWwekSxH25PLZtQTPDcrl6W2vXD38UvPR/gjhT4gfv0T8nC
         4kMq3OhKPR9yllyrp+N1GJxuQLhHZ7IuFk/Keumkki18cy3YgR2JEn81rllD0kwICODQ
         azaTkrPVmqNZrVKalde/TqE3khwaLDmrrW5v0nePCZd8Y2rpELbmXfZJyOGlBw1j4oyk
         znpDqnMPLfX2OUoKoRC+TKgNJLucCl5UkNkgWdx5JOFTHFi4COYMDYfbEOLyLXdE3JYW
         lWexuEOuGirl4PehKrnx3FbrEvhjkSv3sFcGYBDSNsfxeUJzvlOB28ERyWlTxl+kUuf0
         toQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f3vmOEV/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0dd859sor688276f8f.1.2025.01.30.10.23.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f3vmOEV/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261403; x=1738866203; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM2XjXMDd682NDA4uF6pTcUgEcj+06il83UYUtiVd8Q=;
        b=f3vmOEV/pqzeEY/eJkuXnYeaxuH5QWxClJfv1uFceUHiYQEg2P3qL0Od4ffo6RfsF1
         R27VZSNdjxoxdvCiOkQ/Dl/DQSTuhv9YoyU1iUJTp8VqWeRpLjkIzX9jmWNhwVZH7LxU
         PqMhsDZ2UPx4TcBdeHxjpmc/umF1VZWFB6m8YJm8jW/icW4MBAfpls0m7HMeZDUBiE1Z
         elnFS5zTHnye7NXFjKc6GpdD/QiXE16jEcOaA1ewrEKKWr9Mdudhriz8RpFYLb9GMnCS
         eoq4cId7G6va4mvKuCaANXr5AfuuEjg8KszCPvbZHn7xeZqrLYqLIldeIiURqdW6KiZY
         Uv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261403; x=1738866203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uM2XjXMDd682NDA4uF6pTcUgEcj+06il83UYUtiVd8Q=;
        b=OxR4LlQX7G3uhZBVPRDosGmiqo3NP9AZ/MLOBvCaBS89bQfdw0fH8mxwMQ6V4G5TMs
         iOW1oMiSNmhrJwnUgE176JaGd8KCRkjMoRcRZryab2O34B3rvfpL6zSJuUhDAvGLlx1p
         +XDMJ472DQW4001TVZq99/WnJR27rLkOIgb2IZbqGY+PD/qHrqODf8EIbsjCpl7A9ZmZ
         PXXVLTzRpI932+ARo3p15lAZbm0IcQlcCSy/DkZOuilPgjCcsBPqLYNXeWt86NiliXWi
         33b4k8XoPvJdIhdSIDcuQmnJ+0nr2cwaOq3rz4P0SCUboh6uHKjPUEmi/hUra0bHA7Fj
         nNzg==
X-Gm-Message-State: AOJu0Yy+Odfq8mw0y0y90LbkVsBuZnNE+XRrrtTFBwuPHQaO0ZqxWA/O
	F/QcFHme1AuKC1LHT9v6VzyPdtE22psf56YBW6kF7Jp6To/dp8z6Vp49rrboLpi+Qg==
X-Gm-Gg: ASbGncv2GjcLiTJF4KZra6/QtrEln4C+PPeub4K0VJOBxfzKmZtLXask/usakyAzoBn
	OPkMRhBdgAmQZm8PSjJjT1WMyS/5P9zK0Dw1N267MEaPwD1V9YRu5UwnFFpmqyjf2CI2sf88rQQ
	9itO/+lk3R53hxkwiv7tJ7SMUk57NfdH1LNIUqUUUzYA3L2eLtYhSY1y4rnqJwR7ZkTWydzdxtU
	z4XUfcEJrIKL7CfLk/Ft19928LW/fBkmmd+ZlKuXgAr7C5OWk1vnPbB500UHo28xJi1ic7SKXsC
	bHXQbVJQqim7GKgZ9Sfw8A==
X-Google-Smtp-Source: AGHT+IGPLxL2UDh8VWMjiUXkoevUE03LKP+A+C9UXdFH0CX4fDCMN1qUK6Gg2OA1rjPODvsRr0fr4g==
X-Received: by 2002:a05:6000:4011:b0:385:e8b0:df13 with SMTP id ffacd0b85a97d-38c52095e20mr8046541f8f.40.1738261402914;
        Thu, 30 Jan 2025 10:23:22 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 11/14] target/arm: Use TRAP_UNCATEGORIZED for XScale CPAR traps
Date: Thu, 30 Jan 2025 18:23:06 +0000
Message-Id: <20250130182309.717346-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: S4fz9Yu5ZgW9

On XScale CPUs, there is no EL2 or AArch64, so no syndrome register.
These traps are just UNDEFs in the traditional AArch32 sense, so
CP_ACCESS_TRAP_UNCATEGORIZED is more accurate than CP_ACCESS_TRAP.
This has no visible behavioural change, because the guest doesn't
have a way to see the syndrome value we generate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index c427118655d..c69d2ac643f 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -764,7 +764,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
 
     if (arm_feature(env, ARM_FEATURE_XSCALE) && ri->cp < 14
         && extract32(env->cp15.c15_cpar, ri->cp, 1) == 0) {
-        res = CP_ACCESS_TRAP;
+        res = CP_ACCESS_TRAP_UNCATEGORIZED;
         goto fail;
     }
 
-- 
2.34.1
