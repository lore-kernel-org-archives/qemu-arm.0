Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008852ejf;
        Tue, 16 Aug 2022 13:34:16 -0700 (PDT)
X-Received: by 2002:a05:6870:a118:b0:10e:631c:5f3d with SMTP id m24-20020a056870a11800b0010e631c5f3dmr163955oae.116.1660682056155;
        Tue, 16 Aug 2022 13:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682056; cv=none;
        d=google.com; s=arc-20160816;
        b=EE2bE331v6b/Y6rQDpChn5DT88E9J8ZrsC9gGdUGusZ0XXSHzKz5TVO+yq4Nl2plDl
         SEyf0pbuqLdl5PQt5ovY4UV5PRaWCvAmBGMrKNL45xhiq/yElAbot6Z2tjyh56XjJdAp
         6WB2LLkccVYF6E6J2l+rayuoJeDLDUvBK0p7B6q9p4ewsToNWAGwSW6rR+0aH1JDYed2
         4ZgkQfG1cPJ+Xog1AlGTgjAWqdbaCr4FJRf4izXyKvmcJ/Aw9uTsuFyJz6pXik8fslWJ
         wTzEZJpfRP1dGBC4wFO71rfptexkVEtd/xlKNzD5IMqSYyX3FxJJfHFd32Dl73BsacnM
         Xa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
        b=ECQtm6y7L5UKbr9X48sKygqFmzBJ3yRDenYK6RtG2RNL8FKEYP7bat/sq5h7zWqZXc
         UlnNGx2HZllJIOSpDHpfn6uvxRiCDzdJMWPSZu6ce/rEaWd3zdYhgOostiD6FyuES9+1
         IQRuubwc2mPDWVehFUrVwfkQcTci1PoK8vgQgFXgcKcEioZH8b1GjB2bvfqRRAF19Otq
         l4BJuL696SqphKSf0ZfxR5Sz2XLogn0xMVhRat2NLgkDTYnPDBhhD0UrcBIlKBkqfosu
         u0Vjdc07SudueyxzC7zl3H0yTuiMjn1/ewLApVbPUnZjeQ0OEOSVfa2zRSgZzs3v1vV+
         Qbxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKRYZfBF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z18-20020a056870e31200b0010c075f2c77sor440103oad.160.2022.08.16.13.34.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKRYZfBF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
        b=yKRYZfBF0l+lEmmYN5DIrDNWA9i7sub3taSvN/YUNdpHv7/vKzQ/HVvpRtH6itAhT6
         GvImupfKf5Lxljl8tgVYL5wO4M5YN/QULYN9sOt08YmhPFqqdQe/n0aYnrPGccd01of6
         hr34Zs7BZF3T0WCstrPZ/tQp+O9yCV2wN4YU0Zp0Wx1l+kv8LDc8mxW6OrFK+JHpeLSw
         mwtbA+QuQ7G6wPaanuk6knW/iD6yC4Ko21OzeTTtocEy2Sqn7l56Q+tMOc46s0IDSAM0
         FVU2h7y6IGZ/0/SBR7sPXpWQ7XU0Xqx6xe8qWAGiCWtHSPjDr/2Wbu5X0dZ+SldVEUwg
         qirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
        b=19xOz/NTZszSuyKP46pjBlRs/IcEhz5OtcG0adX0/LID4LD9eMaJt8opF9pDsL8WGe
         IDghZsBLvEAk0O1yCFFz4uDcNkO41v8SFFN8PbcS6e5KVx7eXSpkZFluXpxaYxo7N4by
         LkgAdytS64YhsAwh7UFoaTQsbEx4mUAQmm/77/b8orAj/bDecX+CF2QpcHCciB+/8X8I
         gSM/3hkSMM9G7WOGsY8ehAQ05VNDsLsc9maf77XaqcGmTJkHkRkmMPSRPj7yOKSs4098
         EtnFqGd1ED2nGWs0MEfbDCJV7n6L6G6YIgs4snYyQMqCBiTK4myMk5sBGDiM4L0o6LZV
         8Tqg==
X-Gm-Message-State: ACgBeo2e5/DQQBf9LmjWgzL9OMYA+hVOYb1XVKcvoNRfH0LaSwKswqPV
	1eAPOLdMSMeDSmXPDvJlwMUdvSMWHVAjQH/x
X-Google-Smtp-Source: AA6agR791SFeiRG+lA2t2AelaxQt16u+R+sCuX/sEHDTjaxHuDUkj42fj2Z4/HxvBut4cHMp1KIsTA==
X-Received: by 2002:a05:6870:8904:b0:113:a785:b09f with SMTP id i4-20020a056870890400b00113a785b09fmr159385oao.216.1660682055793;
        Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 05/33] tests/tcg/i386: Move smc_code2 to an executable section
Date: Tue, 16 Aug 2022 15:33:32 -0500
Message-Id: <20220816203400.161187-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mTQxcnpHOfaC

We're about to start validating PAGE_EXEC, which means
that we've got to put this code into a section that is
both writable and executable.

Note that this test did not run on hardware beforehand either.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index ac8d5a3c1f..e6b308a2c0 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1998,7 +1998,7 @@ uint8_t code[] = {
     0xc3, /* ret */
 };
 
-asm(".section \".data\"\n"
+asm(".section \".data_x\",\"awx\"\n"
     "smc_code2:\n"
     "movl 4(%esp), %eax\n"
     "movl %eax, smc_patch_addr2 + 1\n"
-- 
2.34.1
