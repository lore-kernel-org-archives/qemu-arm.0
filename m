Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181787njb;
        Thu, 30 Jan 2025 10:23:15 -0800 (PST)
X-Received: by 2002:a5d:59a6:0:b0:38b:f3f4:57ae with SMTP id ffacd0b85a97d-38c51949b97mr7951805f8f.10.1738261394860;
        Thu, 30 Jan 2025 10:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261394; cv=none;
        d=google.com; s=arc-20240605;
        b=VSPsfO6bkmuErYuN9lyUyz/1BUR8dm2J8mLIp7nmVs8eLTYZCGmjXgrKsdd8faZv9Z
         +bpHlpyl5y3ACnEsdmIt8bKLTXMuM3VL54b0PTg1rhff/rm4G2AwnXrbmhRQ5I7DY/mI
         pWQ7E7UBPiEqNs9oT2Hx5oWJixYb4xnrbTihoaMmxa/7gav7+w45XUTqQSj2Uws0p8EO
         5edMlXkQwhMy9QvDaGm/qNo6shw3VSDRIPs3Kubmj5M3gfIiAaDc9/3kGBM6PCT875XS
         vN7AnVK+uuM4D8H9XMCiOol7A5iAfHHyoyjgt1bbrs6M/s/FL+Gp7G/z/hfCUr6o1KPH
         EPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2HabG4XQXFtTl/vZ0C82NDKUjYubip/tkWdtm1VvavA=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=M16iqjUrh1fJ5tqoDLezu2urTmb9bne65oBIhVkar7mdWitPwXQ/jz4EkM7kloOJXO
         rxIzFapI4VwheSkBRMTnFp8BbBrAwYh3/wDRYzTEKFSwEdEsjVFGKvFXjmCczgz+lJcK
         ip47AzL3pAszFXz+356nr6xv92MHcBOUBHE2LHKiD5TD2y9OAViIE4O5lbAR6zw7rZCQ
         r6CtNkSyIBb/jBqM8FT8pOIZlV8k600F6f934CnDLG9GfVjxwvNZ/cAETCBc/RgAyjy5
         mkGYOD1/A6tsFXrXH7apPxmOr3d+O03DjeW+3Um4wxvrLwncBpFpGdGfgnq9rmx64Iwn
         GuIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUq6UwQ0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1b9e13sor768902f8f.6.2025.01.30.10.23.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUq6UwQ0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261394; x=1738866194; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HabG4XQXFtTl/vZ0C82NDKUjYubip/tkWdtm1VvavA=;
        b=bUq6UwQ0YwOT89habY0mhX1dK0hrIaG2gsJC1uXcY2THn6Ug+UMV3AKEi0MYgKafzZ
         wKqhiMwcmkqc3OQcCJ8Au113ngrl6VKvzqKD4T4JQJcw5luG6cpSgZa1UZJfwiCcQkpZ
         nS4Lz8g78th03bpALGuJQ8Be4rQnpBXQE7Skx94lQ/psXxWl8nmY1NdZqejDrSDoT26s
         XTa2cH5pRTtNccLzXagMA/jMOwqGRDmLOw/ITPirgGvZhDY9edbNZvc0D3lspfsJf/4q
         C72llC2l4u6QDKYBka5yL5aSEkUcurWv50q7szuh7a3tCI61I8U4JbWXC4NSBpADTRIC
         9HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261394; x=1738866194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HabG4XQXFtTl/vZ0C82NDKUjYubip/tkWdtm1VvavA=;
        b=kemEUtufd4dC2h5LDfJRXkJZSaZpvERsEYqfNpwqn6/dnXJm2Tm+MxNpmgDR2pZOKX
         x3Ds6+PPI5pxD5bZjSXY1BZnG0FxZj6VqVnEy0xHoU5T3nOlbPektvBwMe04h5tXpdnt
         QRt+PgB/iJa64u35UFNPUF5AewZvXy/dLVRMhwOJ9xaswwbEto3jFWcnVLByYAxcecVK
         esHpTcaZEa/iBvxzvJyEGaZLPc73DKaMVIQbJM7s0ju+mIHLcryz56Gf4q+NR4Too/qP
         l1hLd4hkkTRHNDrw7HThzUH64DFWm02gkVbDMH7xdykdYYXSfZagKSy8+EVIwREtT4g6
         wIeQ==
X-Gm-Message-State: AOJu0Yyg/KkN7mcY5ukvahNiu7tSCpax5PIPv5wy5ThA1d+GYBtx14sx
	CUNh976f2DeiZ0tGVeHsyFimlMCpi+1S1LT/SguLgr5vdvwBAqil2oyuJSxGXWHsqg==
X-Gm-Gg: ASbGncu6aZoqV/atu72m6kgNtSsP/vmaNNh8qR3k9VZ0ngQVtAeiZ8LfBiQZBYI8CUY
	l3RUKxHOQibSvrLaZTlGFKhbrPQYms5QK8/0N2nrZGt44D2P95H4voXLobz/mYPB9qtHxogpU7w
	/VZW8G6mm4pdwkQlVTalun2kPjZ+X0x9Z2uJN+6q/VVKRyDDdQrVwbS/lLmNm4ExIQbW9PHlpiS
	4MWHZ2cp2Vy6NVJh/JlP5MY0/ITmd+jojKi1Bo6z44R6stGoriz7s5cTXzIuyIJml91lrI36wZE
	aGV1rTwTYx2jMm2R6/HCyQ==
X-Google-Smtp-Source: AGHT+IGHWLRAr6UvyG5tkm3LNlD+rT9SlJQAJnIc0AxKJlDbszY93/3OUUNruL8dn9B3fuEhIAZdWA==
X-Received: by 2002:a5d:6d86:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38c5209395cmr9473926f8f.35.1738261394371;
        Thu, 30 Jan 2025 10:23:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 03/14] target/arm: Report correct syndrome for UNDEFINED S1E2 AT ops at EL3
Date: Thu, 30 Jan 2025 18:22:58 +0000
Message-Id: <20250130182309.717346-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D2W5f3CIx5Sj

The pseudocode for AT S1E2R and AT S1E2W says that they should be
UNDEFINED if executed at EL3 when EL2 is not enabled. We were
incorrectly using CP_ACCESS_TRAP and reporting the wrong exception
syndrome as a result. Use CP_ACCESS_TRAP_UNCATEGORIZED.

Cc: qemu-stable@nongnu.org
Fixes: 2a47df953202e1 ("target-arm: Wire up AArch64 EL2 and EL3 address translation ops")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ddeed0283f..74b556b6766 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3611,7 +3611,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     if (arm_current_el(env) == 3 &&
         !(env->cp15.scr_el3 & (SCR_NS | SCR_EEL2))) {
-        return CP_ACCESS_TRAP;
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
     }
     return at_e012_access(env, ri, isread);
 }
-- 
2.34.1
