Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1282902dyc;
        Fri, 4 Jul 2025 08:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzk9e4cBtDstFdXsRuM7i/Tmws0E9R+jEp0NJsozQjyWUkOtzGuPCJP4doLuoFWQEt4s6rzeVg42tyvg==@linaro.org
X-Received: by 2002:a0c:f093:0:b0:702:cf15:686a with SMTP id 6a1803df08f44-702cf156a54mr1656546d6.3.1751642104901;
        Fri, 04 Jul 2025 08:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642104; cv=none;
        d=google.com; s=arc-20240605;
        b=bLZJ6x0QpDR98RN2MbKsZ/Wwg1dH3HVDiY2QpJAjHZxu9/Zur3DMOTZtox6X931L+c
         P3VuOJso4RgmrQVD/X9pCOSuA6VsOd0eFNqwge0RhXjh2KxwxBEzQCv7sVixvx4ATyV5
         AOmLwiFcCM8jGZbvS1pYWFdNj8H5Rc0JJeaC4Ww8FrO2XuyXo5OWEp9Nlu2T+cExsmHy
         2Ej3QyHJjkYyxNQ9DwILBCCDcMgQgmvk3CH74vs7P1fylnzD9yHMsql+B26GkyK+BRwD
         LXFaLb3jaQt/6rsdRvG/9tlezWQXiTo8xWba1UUYO6zVsK0eLuUEFVwED3LbJl50Eo6j
         mvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Oa2zhtn7SrMvQwPB1AlA+6y1mdRzYmiTTXZ1QyH4Dk0=;
        fh=QUI8l2Vct8F5icYS3Pyf1RAES0sNvBoYtOxw4A2Wc3s=;
        b=LxQrDvp4L4f0PqfBofu/5unUGcIBHfupvQx7/pmf+rbRVAR9G2OeIM7nan/gmgyIsj
         w2BX9n2EPd6Eow6wdaa6AkWkxyQGBvKr7r7vMi7thn+LpapuzdlU6Hlbg1+KrHywB5Ue
         WWLnQvNoYj1wjlIPJ6W1Fpa/o9lHnQwEQVEseW2apuVfs4UitNAQZESEeFK0athJDMyG
         BrN4fsg8Yl9nmGDNHtHzEywNME2oBGGr86Kz+oO7/rJDW9FJjuGu1kc3U4+IjbxuPSAe
         sW8mDssdAnMbzUky4+w/xqCw801d2O8BaRAkU4/NMctpTfSPtAQ//vIRX9N5K3AiPL/y
         iJbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkOfWun3;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-702c4c32d37sor12419296d6.0.2025.07.04.08.15.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 08:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkOfWun3;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642104; x=1752246904; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa2zhtn7SrMvQwPB1AlA+6y1mdRzYmiTTXZ1QyH4Dk0=;
        b=dkOfWun32qXL43Kus4E+s/9irGNQB5adldLzJ2a7AUPw/N8CiKc/+DgLxTVwdOGmP6
         90rRusAjyJex9Yn7uMT2d2LaR/YqJ3+baDuj2Swc9rNM6aPo0bHjaxS7F7szDWtUq4iS
         mLJwdQXbL5cMwQToq8jOGfacODYT3cE0BgC3wucNFQppJalAhQXnhxPYHB0/CjdfLSsA
         z5Gn5v9/p4+PnTUBafSZxaR20zWm6wtLg4PoatZ+zHQs5xLG6CKk3d/67mI9G/OIzC31
         R8nvXMtsq8jYsmDVF0wQXvo0ZhA6vumeK8W/tI+32tYONx3HZ0mOe9/O/ZlLHP4mdckZ
         n+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642104; x=1752246904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oa2zhtn7SrMvQwPB1AlA+6y1mdRzYmiTTXZ1QyH4Dk0=;
        b=cHtrqd6+cHevf8xFAC4y6KjpJsdBPuBmyOqeHZcmhjAoz/tqckFdkuXb57Cqm59Bgk
         7e4JazrHVVcK82ta6sU8Pjf914JnVBp2VJvw3lOeEzLA2ObAB7i/xMD7eGMBayndmOZZ
         LLSV7nzhGxSn+CBPrNvaV+tSDv78VLFI1ojcDrQ/k8VQ9DPSNEzPBJkLo3SVuisKTCOU
         ktQh1xSKvJc8FinluJJIvtmh8/ywG/3AWflNP+qu6m5yNqSNbLBlmOsAtgrLSsAqKKDM
         bBuOREWyy6yAegHXci1L2QD27fTdhsGLlZfd17aFoEZ5AGqAjBhFTgqLghH/Y9FiCOT2
         2vPw==
X-Forwarded-Encrypted: i=1; AJvYcCUmyIylBoj2VZTYRcvsZ8T6jgsCgWS0lPEgmPv5GK47epQtTUlDm9Lt2wkNxLvC2YSXTRnosFMqhYTkKg==@linaro.org
X-Gm-Message-State: AOJu0YwS+PbQbv3WuFoWBOtC5FoIlfhu7SxnJufhzJSmIkDRqsUQ/4/8
	VTJBN3BfwFxJGWU0j3oNJRenxK6WO6ezwFz3yEvqimNBWane5s0DX1pIP1Bcucb+UCfSpg==
X-Gm-Gg: ASbGnctPCrmhivAgTJ/5jBGkeuIsMAi4/Igykcx8Sbl30uhpz3Yc4FJgAFwoTdlGFOZ
	+1sA09oG/ggNm8NPUgFb2NN+qvCUh45kniN8zfvAGsr1p9YSJfs6UoQj4pXeM9lwbCuU4ndjqIC
	pXZE5MiuK2AMdpVkLUJemQS/im2HgwYtiy/rtHIBC4ZoBas31nKyDwHyMvJYyubFsuwyH7E4bT1
	uBhRJbJewcLkEtqIO2BXUIztXuhGdwcadBTJ9eRPdb/I5ziBeIRce7KTBWivVcoUMpS90COa73O
	6UcvGS0eHJ/uuQVbBba6VIjSUUhJ+eKwWulnBA7HbhSgxk9X/w0hEDVZ4XORocjEsnc=
X-Google-Smtp-Source: AGHT+IEbbVpxdtR4FV6sLGWAzkFGZo5K/VevjnVXsId49D3E1OpNEN5Xg8ZeQCesuYGmQBd4KdOrbQ==
X-Received: by 2002:a05:6214:4b09:b0:6fd:27:5a43 with SMTP id 6a1803df08f44-702c5696090mr50371326d6.4.1751642104274;
        Fri, 04 Jul 2025 08:15:04 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([189.110.24.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6039fsm13658666d6.111.2025.07.04.08.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:15:03 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 v2 0/5] target/arm: Add FEAT_MEC to max cpu
Date: Fri,  4 Jul 2025 15:14:26 +0000
Message-Id: <20250704151431.1033520-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GWBZ30HTCr0p

This series adds support for all FEAT_MEC registers to the arm64 max CPU.

It includes the FEAT_MEC registers but does not modify the translation regimes
to support the MECIDs. It also does not yet implement the two cache management
instructions introduced with FEAT_MEC. Despite these limitations, most software
stacks that rely on FEAT_MEC should work properly with this minimal support at
the moment.

I'm currently exploring possibilities to support FEAT_MEC encryption (or
obfuscation, for testing purposes) in QEMU for the various translation regimes
used on arm64.

Gustavo Romero (5):
  target/arm: Add the MECEn SCR_EL3 bit
  target/arm: Add FEAT_MEC registers
  target/arm: Add FEAT_SCTLR2
  target/arm: Add FEAT_TCR2
  target/arm: Advertise FEAT_MEC in cpu max

 docs/system/arm/emulation.rst |   3 +
 target/arm/cpu-features.h     |  15 +++
 target/arm/cpu.h              |  31 ++++++
 target/arm/helper.c           | 189 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h        |  18 ++++
 target/arm/tcg/cpu64.c        |   2 +
 6 files changed, 258 insertions(+)

-- 
2.34.1
