Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp697088dlb;
        Tue, 16 Jul 2024 23:02:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZdeduxOVjqUn63ArFffzCfjfXrjkgYH1xSxwB0pFT/xdC8/LMI9qMnSB0PfMrR3MkLLztbhIH+JQFlYLdgo6JDm3WWeSD
X-Received: by 2002:a05:6602:6415:b0:804:f2be:ee33 with SMTP id ca18e2360f4ac-8170ff4ade6mr118771939f.2.1721196123012;
        Tue, 16 Jul 2024 23:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196122; cv=none;
        d=google.com; s=arc-20160816;
        b=GWgPdnoa6m1ap69beqYhDchbHGAKayodhrJw57hrPhPiYrsbRGBf9O5XIO4izdLnil
         lqEVg9MnpXGEhoGJt8ymBTwFjRFxjI4/2bBy/wziB62McpUFMsFdUSkgkuGm3aNwQ55Q
         q2Iouku1LjjCPn3XppAFv+QsCMiDkrjQsSKqgg7frxwrw8VObpGzwXNXLIBMEMUD+saA
         VPBma2VecD+bxr51S9hyoVP5VZ1lgsL0OJLCgFw8RNu2lRAeGL0GCkKEstdxzCAjMAys
         8lRgiUKKulUv/L3xKLk9GqdJLq7ckBFLNHr9lW6RNC/lqaLGGYnPYQyKc5O0Q8hAz9Ez
         A80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZMf5aA84rLqw++9CAhqa8G+mFDeuLcUiCA683ccZn6Q=;
        fh=gqETTkVmVa/9okh5YmIMwoMUJIRHHR45DB7Ga83VkRE=;
        b=hZCbQstQCxRaqFjd+l8lzdK9n0BvGMpA1JBeoanrHYtJ5r2LCDMoRrqFA9mNN1vsa+
         RIn3WTDRKH635n/g2DSTGR5pU5FO+WP9lvtpMK7pNxmxsBFP1BQEEtV6zugm2QiGs4Qo
         cX8LY9D5Goidz0BAY8Br+paUJwrY3ve10p4djqUoK13VB/r1uvEWpzezG05LrFSJJaT6
         eCjAud1mIQEk1UOrzO4ucqIoZg/J+kitzZPkN0MURkHM8PhMuQ6H49Rmo/+06Wj6VDZD
         YuhWohDh65IaAHWD1CTFIBw/45/5ub+1dyNQaLS4P2nSHJjs1Q8g0hRygm82tnMvS3nz
         jZoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLP4dtS+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70b7ecab58dsor5516655b3a.12.2024.07.16.23.02.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 23:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLP4dtS+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721196122; x=1721800922; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMf5aA84rLqw++9CAhqa8G+mFDeuLcUiCA683ccZn6Q=;
        b=DLP4dtS+0DB7NxVTWYXc8RnUZYLCuX3Wa/6klO4p5nWUSzvIGvVohMVAk/vVkHtH7b
         CEPdN1/0L/xW4Eer79tCbvBXqYD7EIdHoqlAYI42YMmQjBeFSf4HDSzJ6lM3E5b2t66N
         BopyUtCnZlv/aOiw1nLdX6mxSTQ8o6tGoVfE1+k3Zl/hFQpqGcO+kzYosBHee4n1Kecf
         q3FchuKbXPusZ0V2HHV30DYW/b5z5j4CJ7MWwrrKDyFBvIIqfl9a/ynCUmMbimeIfU14
         fiwiBgTAbjchyUoGcrWLxqm4nrMtZAHGdOaEqr4wYckngwiA/vZ7NOrhIpiGxDg+EdYR
         x/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196122; x=1721800922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMf5aA84rLqw++9CAhqa8G+mFDeuLcUiCA683ccZn6Q=;
        b=YddI82ibH1vHF3zvY8DWlwyjRgxqGYC56kxsL8pkg7E1KAQBl1qD5KX9g0TOoMooWR
         umoEWxhQg6jJvTRc39qRpvogpAZPD03uwZT4/EKAeLxHaJ/Gr5rY9qq4caLE1hYmz5F4
         qhCVlF7D7elMrMSJ/zGhYlaJfE8eVFIbN4qFWgVBEuRw1qzwSsdV/d6Z/GS1B86QHWTb
         t1SN/t1xcz67rHP+9aEjo84IDkGA5J+UIpb7bUzvh89BUuV0bdsXhfhSfO3di6egnYDI
         4UWLCCdn8OVWJZUYNFYFczpQz/5sSjJy8Xu7iDdlh/ZNPe9VmGiKrMLY0GdpGBHlz5B8
         7/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXDWTjR/OpHE+WsRPyqVLRWtJA34wLdexRCE4X7pPxfGT+Af8gVsvd15LquhZp3Aw9h2+nU/81RtTLxpN/HDlJB4O2jX0OZ
X-Gm-Message-State: AOJu0YzyKTOKq5lVYFjdIOnFihQCl4bg/6ESGITlOU6y6Bwd64TO8bAl
	nsUiay3e+opd7JydJuXuiaD2Y5Dr881MkgNrC8DwKtcrQBbcYWVBUgtL1GSl3BF9wA==
X-Google-Smtp-Source: AGHT+IFMwG44JiaRsp7aB3LErrrLsfSpwGrps9gnE1ekF3g46cheDEXccnT+qT28qEzuHlw5KBrQ9A==
X-Received: by 2002:a05:6a20:7348:b0:1c0:f759:9544 with SMTP id adf61e73a8af0-1c3fdcd50demr1239258637.11.1721196122385;
        Tue, 16 Jul 2024 23:02:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([203.56.128.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc27383sm68131575ad.140.2024.07.16.23.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:02:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Daniyal Khan <danikhan632@gmail.com>,
	qemu-stable@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 1/3] target/arm: Use float_status copy in sme_fmopa_s
Date: Wed, 17 Jul 2024 16:01:47 +1000
Message-ID: <20240717060149.204788-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060149.204788-1-richard.henderson@linaro.org>
References: <20240717060149.204788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WJ/QrdAX62Jv

From: Daniyal Khan <danikhan632@gmail.com>

We made a copy above because the fp exception flags
are not propagated back to the FPST register, but
then failed to use the copy.

Cc: qemu-stable@nongnu.org
Fixes: 558e956c719 ("target/arm: Implement FMOPA, FMOPS (non-widening)")
Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
[rth: Split from a larger patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/sme_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index e2e0575039..5a6dd76489 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -916,7 +916,7 @@ void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
                         if (pb & 1) {
                             uint32_t *a = vza_row + H1_4(col);
                             uint32_t *m = vzm + H1_4(col);
-                            *a = float32_muladd(n, *m, *a, 0, vst);
+                            *a = float32_muladd(n, *m, *a, 0, &fpst);
                         }
                         col += 4;
                         pb >>= 4;
-- 
2.43.0
