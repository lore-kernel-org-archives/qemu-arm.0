Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp590119lfm;
        Wed, 22 Apr 2020 05:45:04 -0700 (PDT)
X-Received: by 2002:a1c:23d4:: with SMTP id j203mr11037788wmj.49.1587559504200;
        Wed, 22 Apr 2020 05:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587559504; cv=none;
        d=google.com; s=arc-20160816;
        b=koV8G3G9w0kf8MxOgbpSY1BHsKQRpgBIGDDMWaQa9/IVAlJ9LVDkvVK37sPfDWEhYK
         X9trUYKS3GyQ2934LkCXO3ewcAT97ZfZyNy67zfXlNPdef9b38RCkpAO9LDIMidq9Kzt
         J+kPDUvIzJUJydcUvzvNgMdDLD2u5p2vuHUUoZWvUQWiFywlyHV99MW1V2LXPxJWY/18
         51Zey5BnhbnV0sDNexVTOze1QRzSGyu01wTyl5Y92nqMmhv9LqPAIPA0ILLLqsGHr492
         mOO/lv9Hg8FwiSimTUykO69FNKPLCjnbERVL3TP3xOQYyrEyP1i0N0JTW25Z6mazd8O8
         T4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=NIX7XE0lwqNmMlxtXwGrInjqZgxxjkJPUEwnhNSZU7s=;
        b=ED7y41R2SOtFx+Tu6xaP11haDt0fdpTytB+hGdK8PfX4e8HxvFxepJ75wIX+DpchxY
         jQGqT9LW/zn7rSHTh6VCGPvNwhGL0nfRSEEBXxzA8YENroTzrQarhDxnohTonMMQVBUM
         QepfDo9zYY7zu+Hw/SiNhCm1kCSwCAWms/05rvcJpawlKfudY4eoc1k9CUIC42XU8ZPQ
         RQnjFj/7A1C+Pq6f6Mzkbx1Nkb3NiRB1cMN6u1b5OJzzEqu3oj8124VAe/VOYd5+UtJG
         KHzfr3MuPYX15qFlyPKyVPPZ3PszKahsFlPa/+aRV2gEdujepsECfBbB/rv0GkfZMcfg
         3XVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6Fmz4ES;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i1sor3822368wmd.2.2020.04.22.05.45.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Apr 2020 05:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6Fmz4ES;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIX7XE0lwqNmMlxtXwGrInjqZgxxjkJPUEwnhNSZU7s=;
        b=j6Fmz4ESXGI83sTR4431nXjOSLgQDf8QT66FgGnF61tvBBu18xOG6rPvjfkHVPkowo
         1dxOLgZDMNGbO551vwiR2Cwl2rh8MrzqnP5OkRy4YjIOG+wDAg3rd/YM6l1LEO8iD9kq
         kB3nplfIFEz1LX3DjapfLSB0DethJwpk0qVAuu7Tcth8ieSq93G2cJN8UeNC0isOOXi8
         SBmxwmav2AvzhgskhtBjFcPVUDUqSbXSoGyGwkyeDv+u+RmC5FTFVvbzPoP/112dTi23
         +P8hzG9Act582kB4WHBllT19LQJpDj6Uc3xkAvNwmcf/jAuvDXwcQJAyQKEJY1Mmbt2F
         RJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIX7XE0lwqNmMlxtXwGrInjqZgxxjkJPUEwnhNSZU7s=;
        b=q6TSHaG0SBmbZqgqpqpkq4Fy6/GgKZJXOoPtne+zX2X0M/MQAgyT9Yzdkz6iyBLH4D
         AZVT3eARfYGOFrTprtvzbZdrBOvTztQ/C+aqU47Eh2lVWNrBMe76zqfOB9R9NzsldRtG
         Qd5vCrZ9jzNjkHdJ3BSYXGOSvATErlpeVT7KFw0DprMXTKfsP0p59LVC8si+0VoOvbZ1
         RgSJ2dDJKCufWG3cxx6/fdR/arA6XGvIsHfTfd8GgV0jkZ31wOxHL6tgkermCkUS4XSD
         9SdgkbYnQakPVdwBf3noZQYvqbQhuDZ3ETbTsYJVcZCBCdPG4epsrZU4W232HLUIYfBG
         qjDQ==
X-Gm-Message-State: AGi0PuaPgh5TaKasqiG0fRVfAJLUy2tUF998EhmrmPl8nNJ4Mc7GWSJG
	uUbBLxlEkF60wvWNm+c3WLFvHxGQ
X-Google-Smtp-Source: APiQypLAxELcvP2Ph8vbCinX57dFNAA3YsNn0kD9tkkI+Vq/6f5tc72NVuB+7sXlNQq9XVym9LfBng==
X-Received: by 2002:a05:600c:28e:: with SMTP id 14mr10938313wmk.79.1587559503865;
        Wed, 22 Apr 2020 05:45:03 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id z16sm8481824wrl.0.2020.04.22.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 05:45:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-5.0?] target/arm: Fix ID_MMFR4 value on AArch64 'max' CPU
Date: Wed, 22 Apr 2020 13:45:01 +0100
Message-Id: <20200422124501.28015-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D000dOdnsZ5l

In commit 41a4bf1feab098da4cd the added code to set the CNP
field in ID_MMFR4 for the AArch64 'max' CPU had a typo
where it used the wrong variable name, resulting in ID_MMFR4
fields AC2, XNX and LSM being wrong. Fix the typo.

Fixes: 41a4bf1feab098da4cd
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
maybe 5.0 just because it's so trivial. I dunno...

There's also an error where we use the uint32_t u variable
to update the 64-bit ID_AA64DFR0 register, but that's harmless
because as it happens the top 32 bits of that register are
all zeroes anyway, so we can just fix that in 5.1.

 target/arm/cpu64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 62d36f9e8d3..95d0c8c101a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -705,7 +705,7 @@ static void aarch64_max_initfn(Object *obj)
         u = cpu->isar.id_mmfr4;
         u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
         u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        u = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+        u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
         cpu->isar.id_mmfr4 = u;
 
         u = cpu->isar.id_aa64dfr0;
-- 
2.20.1
