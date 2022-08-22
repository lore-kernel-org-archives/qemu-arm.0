Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979518ejc;
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
X-Received: by 2002:a17:90a:318f:b0:1fa:a374:f565 with SMTP id j15-20020a17090a318f00b001faa374f565mr29086014pjb.146.1661182077601;
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182077; cv=none;
        d=google.com; s=arc-20160816;
        b=uCJNDckX3ngaWyH0wN4F4pwuRyC+GDMrKPugTAVI3xwem72Ky4jUEe+Uqk+4Lu4pKf
         BznfWLcnUzbPJ4EmeRNIomLv63pya6TMqMOx0aJe2xiy5wSSl2hx5HS7YYC4jQD+YgvX
         QFr9KFAI+JZxEG0erJf2MGhnBn2rEdrM9zBuSq5G07jl3w+3GFubIjb4tym3kXRvRy9O
         dSsdz7UpcCWzdWJlzEynyA6Ehnv4p+YQNBjFoBWzsxSAxFqU77gJSxPqTD6yRhPu7Vjs
         jOfY4428FMFGPrBNTR0Ei6pJWyFDf8R/876XlEKtvnbuox2ftZIVdntz5ers6KZ0kgAJ
         Oy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SMbOfNjA07XEkQhhsLqoAxwBL+AS6vzLDZt69vTOMCc=;
        b=GvdtAd+0rkgpi6aDg0cT/wuqUleAKbgZDU0Mo9CNxlev62UFULPS/FEslyRONvS0WO
         nxi+SbWllThzimLpUiP5gMzIISzeWKs7EUVTOkhrKe4mLlkv6VdHRKJmpQMJ1OCAWjRL
         5blwW6eu2W7WFv1XlysQas5ZyjK59oQ3wsNrl8b07SEQdTZ6Fa04n7a7jCcLtpdeQAaV
         ESETD1Qw7wv8sV36XTMVFm0zrC4tD7IrDakiqKYbYZBpqhYKhYj1RtbF3LYO5ni+i/jj
         SzNwn0TgVSM1TQp8/PEZQGEbvwYUsM4tvHDEZfeZss7UPN/Zg6pcoDqzso220cAgDl4A
         EDaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y3gNImoS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e7-20020a170902744700b0016d810aee0bsor5036492plt.37.2022.08.22.08.27.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y3gNImoS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SMbOfNjA07XEkQhhsLqoAxwBL+AS6vzLDZt69vTOMCc=;
        b=y3gNImoSdCwStRufdXqqyxKcmhSASmalR28HV59f04Z/K54PkxhRapmiYCMz8uEUWP
         UomGuP92hkEYfn26/6/RPoZWrX8MXkAJUMYVt8+wGnelO5Pz6IvpXyL7IMhIvWe7l7ch
         n3k0uas44pj/gJe5aTgxvPREVX+W2/++bbAqkXVFAi55QSVe1mTKLEIVI6eXRBBCBERu
         OSfdWK0ldzHQwjdosoedTAKRytRofQGHxE6acGKCgZAXHg4tKDkO2bn8qfly/77AaVsU
         j5eLzKFW1+mHcbigDJhjwntS3CCXvA1UgPLYGriwXtCGLJnRbLtZr1YBDfVdCYDsgPBB
         GURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SMbOfNjA07XEkQhhsLqoAxwBL+AS6vzLDZt69vTOMCc=;
        b=STY5FbKY5RvJNjufIAr0SCEzwZ3nHe0nWMvrw7gkgYgC3P//ugivoeO2T4yQN73bxK
         eFDsEG7MhsyyWVL9T9QGrq4XW1Qg8sENVuAIbOdEDyRSZIqoPskxV/z/ha+zA+lc+TUH
         wY0PzB88WkHIneHaNHlbsKTyLAVk7zSuuOECui2Zu6QszmLXgfzuNN29Ao42bsh8Z4FL
         KVAO0myclcxsMi/83Rgq5KS+hzjdBkas9JZrkzH2FDF4DsCnsKIITyi5m5q0N38fHFqa
         sBmYq+EePoMwhaYgoM30mLQiaaE2Q80xnWi6G05ObEavKYfB8MWtpwktQrFfD5ipMYwj
         2UbA==
X-Gm-Message-State: ACgBeo0DRKtgGNr+5yLqp4sLdtDTBArKEcucyA7cQ6hE1s9TjoeVZvjG
	3Qufs9xNSOfKosDg3ULkGVMq9yJHD9ahj8Wq
X-Google-Smtp-Source: AA6agR6rfxTm8r6DnIlseDV9ZBQ5q9MeDpMty/nLaQqSz0XIF/rHrM/B0AirGheWhM8Jq7uEGTpu1g==
X-Received: by 2002:a17:902:e8d8:b0:172:7e6b:c8ec with SMTP id v24-20020a170902e8d800b001727e6bc8ecmr20494695plg.171.1661182077204;
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 18/66] target/arm: Add secure parameter to get_phys_addr_pmsav7
Date: Mon, 22 Aug 2022 08:26:53 -0700
Message-Id: <20220822152741.1617527-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yN7iIYnnzDKr

Remove the use of regime_is_secure from get_phys_addr_pmsav7,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e95fd6b0d9..224ba09ecd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1510,12 +1510,11 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
-    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -2414,7 +2413,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.34.1
