Received: by 10.28.4.212 with SMTP id 203csp1219446wme;
        Wed, 2 May 2018 15:16:13 -0700 (PDT)
X-Received: by 2002:a63:7f56:: with SMTP id p22-v6mr17571966pgn.306.1525299373346;
        Wed, 02 May 2018 15:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525299373; cv=none;
        d=google.com; s=arc-20160816;
        b=fknTauEGohYZ4YOc/R4LxgkwVO0wgijVa4UnnrDrdUfrzJCs9DwKJ9v9cEGABC9LI5
         MV3/6t+ZjqAQ1ykWTr/jJXwEHNKgQoEzI8IseHi2eDp0Du8XBs1/B00moUhUVWFALtlW
         tmOZED8FyxDnTd6gHRdW5FtEn515RVWRe/hWhHCD0cOmwKNBMyY7JHl8H5v1AGkaKudI
         DO3b153tNGBy+p7PNG0gm3Kzbh49knPfOdXuRcC8OHVNnZ4d6AUJKX1hvuQH69OiVbvQ
         nlL9MRT5a2HeMk4hm4caIF+RHFDbyTyh0m8f5pCXv3fFkPtpU/gyyfc8+7IweXZDGZf8
         RAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=Nwrrh4E41GtFRXCHQJcmc6i/oaMBOH59tfZ3rvdlzVw=;
        b=VkiwNYnN/qw4a+cFp7TEg5Od5HkmGMiLOIWDP6WoWWJJAwW+8aIgk2YOLSEvfDFGRp
         LLZ50NURYBgjDo0zbA3KQgIPDb9GbDoOptNLEQUNCOg5bP/voT8xMzobkg0gPX4S38za
         lyknvvGGCtvfc0ZgtAwsgFF2UD1WKz4Y5lFM8A/GwkZEEbvhVv+2Z1jl/JwSHiOAvwBU
         uDY7mAw8BALGNoNwUZWTWaFugNWpMerdEOeLQlPXm+nCZ+xYu4EotjWHqMk/IhCcOxvR
         OAxm2L0GJcx7RHQ78RjSVghpDrENErvTmSG3OZwSDOv+lpYYLYQ4EIbepceINYDbxUEh
         PeXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVuLu1Sj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r13-v6sor2746108pgs.106.2018.05.02.15.16.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 May 2018 15:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVuLu1Sj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nwrrh4E41GtFRXCHQJcmc6i/oaMBOH59tfZ3rvdlzVw=;
        b=RVuLu1SjmHrN0GXNBM9ImbFwEhHFClUtAFWVIyzU1AdRuIiiYbNWZsyzoWYbAeMf+5
         3Hf2qLiNBvd5j9vUzFUMh8yFl1rdiPLv7EY/YTrPw0TgXwhCrwibMfd5sflbZ+s2hVQj
         v+fHzN56gfQM9H9heLOaUnnSNFEvLwGHO87/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nwrrh4E41GtFRXCHQJcmc6i/oaMBOH59tfZ3rvdlzVw=;
        b=eE1v1V/yYCEZWDP75lbBhXJu4vgzqQJeaJJ+ppJdaJQlQbGsd982b740+6UDpBHN+u
         H2N14DLybxb9flflXjy+JXAd3pyHPppDqMVfAH/pa5myfpAGOQncQ52SKWT3BmykmAp8
         E+0cTSYO2AeQj0tM5GBcRukV7N9oEAAq/mYGdmyfC2IXYlAw6lzM/fslWFHPrT5q4sbC
         wHy4FtlFFylYnEkxZBQqwxrO4ephkNweD/sT6+ywoeA73bwUiwZLE+xPXAiBV1L36DBs
         RAi4ERz55Xj+M9Q75N/f3X+dWFuhXfhj7iBm3pxOC8ipzjdJ5d8s9jBgqUXCp0yB080+
         QIiQ==
X-Gm-Message-State: ALQs6tCHoqM+nsszwSrlcxjcxPs9FR7oGpONgUXiTsysOIHxeOCGXn8M
	RB3PYELQUQ7Mx7F98fw+f1xSbPQt
X-Google-Smtp-Source: AB8JxZrLTtipcixwYM4biPL/cLivOCF1HPD09REO0lD6fxWgEVUUk28ZlMZUFMWfZf3m8LkHjlw3xA==
X-Received: by 2002:a63:6706:: with SMTP id b6-v6mr17373639pgc.214.1525299372927;
        Wed, 02 May 2018 15:16:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id 65sm26170145pft.74.2018.05.02.15.16.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 15:16:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 14/14] target/arm: Fix sqrt_f16 exception raising
Date: Wed,  2 May 2018 15:15:52 -0700
Message-Id: <20180502221552.3873-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180502221552.3873-1-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N9J1j8fnxBYR

From: Alex Bennée <alex.bennee@linaro.org>

We are meant to explicitly pass fpst, not cpu_env.

Cc: qemu-stable@nongnu.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b73d6d96cd..07e196c19c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4739,7 +4739,8 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
         tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
         break;
     case 0x3: /* FSQRT */
-        gen_helper_sqrt_f16(tcg_res, tcg_op, cpu_env);
+        fpst = get_fpstatus_ptr(true);
+        gen_helper_sqrt_f16(tcg_res, tcg_op, fpst);
         break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
-- 
2.14.3
