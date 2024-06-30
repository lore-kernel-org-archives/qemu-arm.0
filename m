Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004274njm;
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuBlNOJisS9GrvgLEPxe85cdz8InDMSyzDFjGihOxBGfqnW1eXvhg2n6Jse4yQinmnZRPHhcxtgwjhda59nIpP11xgpITU
X-Received: by 2002:a17:90a:12c7:b0:2c8:e99d:441b with SMTP id 98e67ed59e1d1-2c93d72fb5emr2972459a91.27.1719774056037;
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774056; cv=none;
        d=google.com; s=arc-20160816;
        b=v/my1uKMUxhy/SaHe6j4G93sb+dB+iI0GJ1OSARt7m9DpansdV8YUczbAQAdkENkLx
         hLwAl8bAUo1EXf4HmQkBi53CLbQIkZlaOip4EVCbOpIAjZKVMIqpsj8mJT/sMO2OkR0O
         Fzy2Ju82fhd6TO3E9jG4EJQSCMi50rIiQWsS3iuafn9cKKDdsSAU8POKd1QtcUGCoYUG
         fjZ/RpfTlcFCa3vtbTh5vBB/GKYmEy0Ur38nL9niDB+9ijnwSviho9PNw7OliFBwiWsD
         T8LHL0eA/+jAwUF3+uY776GWsAWxAzHuWII8rbbSvWxX56s53s5C8kbkY0+Rsf8XY7Lv
         HMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M+1cYfmSMutOrFAkzzUKLrm39z58ASnq++T0AOOpk6g=;
        fh=1Al7Z4J1FQ+zpWFzUtJzbemXH3MBgMbJc+KbrqkJfzo=;
        b=f7tuABRKTYHXwR9g6o+6vBFiXs9Zs9cLflumFbwa+WUcEK8ft3psPy1WNvkBRYLauV
         roihzTQaKlJsqUn6VgPWaJYyNOQVweNL1nVo/Z93ff26nAgUJm2F1tc5/YKgmGL4f3KL
         +B+RBtn2Gqoeb7UL99SWh0EAHbcgUv9GCMwslbapxnrpS3Ih2VJUe6OgmUKk38DEi6Te
         DM64zYWd91B1V8gynt/zNPdgsdWxt1eeuGontCB0bR0iEWtJM36Fxhk+modEGc/UsFYe
         /Nyw7NSAc1jKw2EXb5vkH3/cnVqMKRt/pqGxrCmyOqISM7wEv3cWqPxQffzTu4DeCtqr
         fd2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S1I+La7G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c92d075f2esor2346854a91.0.2024.06.30.12.00.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S1I+La7G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774055; x=1720378855; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+1cYfmSMutOrFAkzzUKLrm39z58ASnq++T0AOOpk6g=;
        b=S1I+La7GsPOVxGSO7FIhSd3sAQ0YCsm5IO9BI+/1iOnsK3wnkvgTeQzTKZwVEYG0IT
         T4Cv/bKJ1m85ehyu4gwQqlJG4dcOLYKiFhYnWXtSJpxPKfbpcefMN4XgR8pzMKMSfkIB
         eUJ2S8d3Dgs6/Dk2TaQqGvKNA+vSPgkoQbCH52cV4TN+vzyh+BWUp23KnAq8uCz9rksB
         wuJ5Wx2EoeZtJXT+0dIwQY2c3YPHJ1L8PltKrN4rgipaze+s/SokpblRTgLy3KiZw614
         nJKv2nISdJ8iOjr4f9wFx3JjyXsnhnsu6w2OCFAIsflKoe6LNpxcstWLo+yU1tQMcvKU
         Zrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774055; x=1720378855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+1cYfmSMutOrFAkzzUKLrm39z58ASnq++T0AOOpk6g=;
        b=mj0uSyHGsdpuBLb1vptXR7OdHbb1gbj8MnXV1guZP/WqPvVvVdY1Ee1ZamjUmskiAk
         Xp07SUgdfsL6X6NtovkKX0wEizDgiuQ+fOq2y/Bt8lKMyCOifghss0BQMPJi8DBjDcS3
         jAvFlwlCXRixLvMrql8gWe/XcRahsbKqYjJfMZEin84AEB0t6TbLv1ZemHWpbxZvbyb7
         QrZf4jmYd/rg4/G59cHc/TG12EQIBCDuZ5bRmCPdgSlslJuVCiLp17jesUqYry8Kfe0D
         fOhaegDp7GnXsJ6/FfAbICkZ+vHWWkhX7H94ky4bMocYo/lycALqhFiC2rJw3p8Nm1XS
         5zPg==
X-Forwarded-Encrypted: i=1; AJvYcCU91LkEg+7BFSSl6ykicwdeNI5cyU+qga8oD8wBvulTCorGeet4+Wgbe6a0QY1jnGVUmo/XR4KybZH+/ERaF+HXVfdSivwW
X-Gm-Message-State: AOJu0YzqXI55d5sTFwuV8lDWlWMnKGXSrTZvYU2nY3eDwXrV8HSIeg2D
	G5YvnXl2jhsWTYd8z37C4JvHNb5+1JhasSbTBWK8bocjNYW7nM9bk07xU7MOaFMnYg==
X-Google-Smtp-Source: AGHT+IG2B4Je/WhspfUwDslB/opXv1xJ49qrKfJXLO5CtdGqAD+mtkJz5qsM7LVb9pZmHN0VcDgv8Q==
X-Received: by 2002:a17:90a:7185:b0:2c8:1f30:4e04 with SMTP id 98e67ed59e1d1-2c93d775c0cmr3473732a91.36.1719774055501;
        Sun, 30 Jun 2024 12:00:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 03/14] tests/tcg/aarch64: Drop -fno-tree-loop-distribute-patterns
Date: Sun, 30 Jun 2024 12:00:39 -0700
Message-Id: <20240630190050.160642-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZI0oJhkr2y4v

This option is not supported by clang, and is not required
in order to get sve code generation with gcc 12.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 39d3f961c5..dd6d595830 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -39,7 +39,7 @@ memory: CFLAGS+=-DCHECK_UNALIGNED=1
 memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
-memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3 -fno-tree-loop-distribute-patterns
+memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
 
 TESTS+=memory-sve
 
-- 
2.34.1
