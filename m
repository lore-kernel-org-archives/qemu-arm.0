Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6786521wrv;
        Thu, 1 Aug 2019 03:57:46 -0700 (PDT)
X-Received: by 2002:a1c:be11:: with SMTP id o17mr115111182wmf.115.1564657066152;
        Thu, 01 Aug 2019 03:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564657066; cv=none;
        d=google.com; s=arc-20160816;
        b=dNrNGAwXodVqpFQv1zmdM1dS1UW60EbkG+h7VauvvorFvKiybCnMTYblomM09Q3MV6
         Jy9E3J2JoiznpZfN0eXbD30FtNwjoOMjhnrEwi9fLA5RZrxlDF5NACtnYxvZTRE5xsT6
         +2TpVisOUGYidzCPPCu49K+whDHMWBg2dbX/8o6iWSZeBQckItyrgmKPkFdqhbEUiYRk
         Ztz+Zxcoe3VSDN5aKihRax2YcEJzxJ0mCA92d/q9gY1XA0gt4ZQBkolKPYn0MlXAvvGM
         Vp+wn92k0evW2kLv4GHWybJK1kCbMcfp34ABcQ3OEWJ28opKVjcOhVCnNHdaYXwW1J2F
         hlRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=i5yczFfVrAVlR4940QCcbKeiFq9wP+iOiA2djQVLfF0=;
        b=Fz1f9UBn4uxlCgISVttIe2lCY151DyuwjRfr2EOBz3mFwuPsOa32kiqapoWjsVx3MX
         lIumnKlr6+lbbBTEGK5d2FAw8wvT7NGF0lp9MozV0mAyg/oPUKgfeHbtWgI2p2zgeqat
         dHLMO9H8FbrIHVSFHLhXPzC71yZK+/ViTtyJPPi0FnJ9fPa4ssT6/kH9u47KLByjKDt1
         kEDKrTU6z3kMdTrjktaQdaPugpBjfYwg9QSD2LIJ4wLjsprDd7gX6nVKXhPUXEWyfCTz
         pYdnwqsADsx+rHImzj1ynXThQ7s81YTKyIhUL2BktzaVG5pJI7qJ+xmCVsf5b/y3Go7b
         k1wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIVOUUDm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y2sor56667853wrn.33.2019.08.01.03.57.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2019 03:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIVOUUDm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i5yczFfVrAVlR4940QCcbKeiFq9wP+iOiA2djQVLfF0=;
        b=SIVOUUDmYzu8CzBNXMzZrqYbvaV+X5Fdm5H8GwoaxpNJb88ybs5sf1HNQwzwXIBwYQ
         lrbUca/7V2THxZsbYTcGHOQ1MtmrdyhL+Jv/maFlX+0liLv2evo+59aOnBYewHsA2b1N
         g46rbGEpyTKRPoSsRjbDagjGmsMOzemlKNkKZ9k2fZaSwCMa0ej/1lAgrMLaedn8Ldz/
         dqOjoHnFFkRsCgs/JW8YVYXsZjn+cBWuAfiz/kDHMVPPrdcFxsK+IOWrDxrHS385MFNR
         wgpKpijAWEaHFNJOea7GR7z5JuOfeeQ1Ki9lf+DHnODqCujgU7g5zJeoG6Y/Wnwh3iiZ
         2+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i5yczFfVrAVlR4940QCcbKeiFq9wP+iOiA2djQVLfF0=;
        b=mt9gbZJfs7aISA9ovbnI3w6LAdNb26rS1TEOnHBniEc5H9F+5A95Ya9W4dbqxMcggb
         Pw9oQZAKvZrOgV8oWKsybLjFORu/13/yqYalDv7y6z3lG/pS0SRxiSrN6lPIKEWNniKC
         wxx41m2n4Z/Xix8iLGTDkGF9AxeX+YasQn5aHzmJ62cqxzuE7MsZINe8Y/y/KECJK7i4
         Nwp7PgNvGmH6t7oAj0IDacyKw5NMIpo9ac71Uv8G8VU/XkNWgRp6whEldR92dKniOZvd
         1pStoJRPO6wLae4kDF2zpVQW7tJXrDTfAJ+b1yFiZDjmZ7Mbtya4gh8Tj7U1/RGJEjSY
         TiAw==
X-Gm-Message-State: APjAAAWNFMiUyDyxioJRiHH8DHGK4dtObIj63ND8nLMA4r1kfXz8IgYv
	HyZWn0VfaR0ZKlDuQ1uo8DFxYb2UwvgUwC9i
X-Google-Smtp-Source: APXvYqwwM9Hawd0U9pUV1WLp+RkK3J/4CO/HAt22unUylWxWOrCpFKlaoXnVeFb9vZaDLingMcjMdQ==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr20438551wrl.79.1564657065815;
        Thu, 01 Aug 2019 03:57:45 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id j16sm17320424wrp.62.2019.08.01.03.57.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 03:57:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-4.1] target/arm: Avoid bogus NSACR traps on M-profile without Security Extension
Date: Thu,  1 Aug 2019 11:57:42 +0100
Message-Id: <20190801105742.20036-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PABsBzCVb0+c

In Arm v8.0 M-profile CPUs without the Security Extension and also in
v7M CPUs, there is no NSACR register. However, the code we have to handle
the FPU does not always check whether the ARM_FEATURE_M_SECURITY bit
is set before testing whether env->v7m.nsacr permits access to the
FPU. This means that for a CPU with an FPU but without the Security
Extension we would always take a bogus fault when trying to stack
the FPU registers on an exception entry.

We could fix this by adding extra feature bit checks for all uses,
but it is simpler to just make the internal value of nsacr 0x3ff
("all non-secure accesses allowed"), since this is not guest
visible when the Security Extension is not present. This allows
us to continue to follow the Arm ARM pseudocode which takes a
similar approach. (In particular, in the v8.1 Arm ARM the register
is documented as reading as 0xcff in this configuration.)

Fixes: https://bugs.launchpad.net/qemu/+bug/1838475
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I've marked this as for-4.1 because support for M-profile FPU
is new in this release and this is a pretty bad bug for it.
It probably doesn't qualify as so bad we need an rc4 but I
think we need an rc4 anyway and it probably does merit putting
in at that point.

 target/arm/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9eb40ff755f..ec2ab95dbeb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -266,6 +266,14 @@ static void arm_cpu_reset(CPUState *s)
              * on ARM_FEATURE_V8 (we don't let the guest see the bit).
              */
             env->v7m.aircr = R_V7M_AIRCR_BFHFNMINS_MASK;
+            /*
+             * Set NSACR to indicate "NS access permitted to everything";
+             * this avoids having to have all the tests of it being
+             * conditional on ARM_FEATURE_M_SECURITY. Note also that from
+             * v8.1M the guest-visible value of NSACR in a CPU without the
+             * Security Extension is 0xcff.
+             */
+            env->v7m.nsacr = 0xcff;
         }
 
         /* In v7M the reset value of this bit is IMPDEF, but ARM recommends
-- 
2.20.1
