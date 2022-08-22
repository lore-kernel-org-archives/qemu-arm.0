Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979494ejc;
        Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:8cc:b0:52c:7ab5:2ce7 with SMTP id s12-20020a056a0008cc00b0052c7ab52ce7mr21108804pfu.28.1661182075472;
        Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182075; cv=none;
        d=google.com; s=arc-20160816;
        b=PYxLvkaTGuiS8tB1iMz0LtjBf37Xkq2Cl2r3Gjees8F9dURroHapE4qLqTRRLt0gEI
         MOqYI58ow+2izpdJdPGhGrVAD7tz2/9UoBBSn8M5/JCxPDfcVp4k+Ter5lxn/jK3SBFK
         hYT3qGuAFBQNoJIdRV1UKDOF8w9hOMV5oDSLGvXsEi9n/NaRBA3ZPrUWMaeaVjy6//eM
         K/TYgIMAIa8T2/0Jt/gyxseJXfLjSfaki1mmz9tJO+4h/owLu/ejzqZssbH0/TlTwmXZ
         iFS8/l2w7N4XZj0mtA+sJEXwqJPzlNvVvwzryVk5FocwDGlPBtzFSpSj6Ika6uXP2qCU
         1vYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GSDRuelmXHTBnV2ZkAtPbMvnakhm9Yy5oZigW0sA2/o=;
        b=zBFIbP5y1a6Vz26sOBhPDIJ9tCjkLtC4gl7ub5Q41T7dk6mF/nXPml0rTCVn5bC1Bs
         n0Ji3RfsqBV4BIpS7ccDcD+jqvHVTkolPcGM4g1fgj9UITiH7b2KHvfP251hsgmEFtAv
         6hNGCuCXOxDYojg+p14RZs25atGVT/QcJC62q3fALAf+ucfUA9j4CmByfTHt0fqpXspl
         yLRvjJaa7syON9auaxbBmEQvKjWZT169e3DbPsr/k2Xyx7AOVPf++el0Q/rpD1sJ3YAp
         57watdib2d02C9wiV/9avaTL1uBbywrBzyHfJLkWXF7ZatgQn0Q2N8Ee1nMBONIdvpCO
         fTmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHY4ia1P;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a6-20020a170902900600b0016d0affdf66sor4972873plp.70.2022.08.22.08.27.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHY4ia1P;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GSDRuelmXHTBnV2ZkAtPbMvnakhm9Yy5oZigW0sA2/o=;
        b=cHY4ia1PZSpVvJpUxvTTZbwuO2D/HWRflpj0x13V4BecdfuMBpgylaFlqOAQI/8ZnD
         IYwmpO2jIThSBmZF/tnFxk6c/L+28IUZXkMVkaEg8UuBQAlCOfwjHkOK0WKC/+YK9uck
         mlVpdn9IIZpj4I4szremlgvWVUbNr3mv+euxyoyFbZ3VefTXwBdJgaBq/Ng84PSK9xFX
         t3LkcgrzUHzb5Anoky24lm7sQez2DleJ+rNCdXTQz4Blsa1ezTznyfx1uDsCmSz6SmJK
         SO+1X7TmsVI7S3KJsecg8mji9pkNa2Kn2S8KzSmJ9IOnJkwxOsRgYEuKfpPSf9M+du6h
         xO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GSDRuelmXHTBnV2ZkAtPbMvnakhm9Yy5oZigW0sA2/o=;
        b=enPDtFREZzkhXGsPnwE8pU2G8QoZUveduFhdckserKYWgs48Z5Zvxmjl65hsyZh1Ru
         BSiF6qptNOmMe6LBi/zpWuZfsrMnSRxuUnkUzN+jchkVyxkoIuVsaESEnsEAS1KCD//a
         +LHPSi6s7+r2hKxRRDFCTU9ddRbC/7Q6kQqUfSIORqC3XrcrB9D7olxEY+y7Qk2jvf5u
         x4EqR4TBbvXKsJUWSFWFtmbRzB0q+gAEtFculzNCP8X98GePMA+cOFMGTjS7axxuKivO
         Kuj0DIismxaJd2/k8K4k5wexRzo6+rev7LiuPmHyyNhU183VQntDGI6orb4adwbZ7L9Y
         J/cQ==
X-Gm-Message-State: ACgBeo2btN9qRIo8RKV8M3y0H7K2YyI9RYOQ7g+iwGF41ap1EoZdfWfJ
	jJLCzm3HikibFKSVDGvupGInG2r8
X-Google-Smtp-Source: AA6agR74a3Kua1RUQ2FTMYSgGFm4G+xzSJF6XaR3TwflcTqQqJdumkXJ2tmxpngfHg40xSGQT8pE0A==
X-Received: by 2002:a17:902:a511:b0:172:97a7:6f5d with SMTP id s17-20020a170902a51100b0017297a76f5dmr20720936plq.159.1661182074999;
        Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 15/66] target/arm: Add secure parameter to get_phys_addr_pmsav8
Date: Mon, 22 Aug 2022 08:26:50 -0700
Message-Id: <20220822152741.1617527-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WcSNGby1cW/f

Remove the use of regime_is_secure from get_phys_addr_pmsav8.
Since we already had a local variable named secure, use that.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a6880d051b..fccac2d71f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1963,10 +1963,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
 
@@ -2411,7 +2410,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1
