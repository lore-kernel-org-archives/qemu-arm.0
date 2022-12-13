Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4188912ejb;
        Tue, 13 Dec 2022 04:52:21 -0800 (PST)
X-Received: by 2002:a05:600c:1ca2:b0:3d2:d72:e8fa with SMTP id k34-20020a05600c1ca200b003d20d72e8famr12312351wms.22.1670935941059;
        Tue, 13 Dec 2022 04:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670935941; cv=none;
        d=google.com; s=arc-20160816;
        b=x5K6yaSAZxzaZgynq1bkxpxcQnpNCyBk4Le6yXVrL0mMiUJYTcxNdVabTMmZWnKqd7
         z7qSoxHgpya2MYuCedvjFC7QG2f2UGLySYqLgz0aa566UxHJqG/2XvrRGfuXzMIY87af
         AaAlfY1jTpbFZaSl+7oU/pmT1PBmHYpT8k8fsZqa5YctHfYPrphUdKLb7PvbGOdllCLS
         dAhbmHt8NVjYu6059MqXwgf1KIbyqOzVY4M3BT77TT+biy/ioYcllj9orR5qCECTObmX
         MZlmj990nI8+NdAxSYcsQes78pzw2K9IK+HbfnPPeTLwBv0NT5DBhlWAPkDdw3Tgyrpx
         /bCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3bfzNnoI5loXrPkezvGfbdzUW6/ZLveS30TWnXZXaBg=;
        b=uZ3mktcL9NUPtHukd64jTbI6H66jkx7y3yxqyOZC623W+H119ORMhsXeZWxYJUJOQ2
         gyPgU9fqYGC5atx2rz+bba4r+N2ZhLhZRcsYbWNzeuxBQZFZpCjwiT4rOtR3e43V2oOV
         u8vX7/ln+OUUIHGj8uDN7uyfy7Yzo6mP2llLy1BiegJV3/mKhKPBdCvAyIArcwEMdtTY
         jrg2US+NznZTBaB+wn/LyOey0ZpxkMrAf95g45KTriNKwggXiAIiXN3N3S3VvEeQm3LW
         ngmovFTgEueLmvMonqi4cYtNnl8Kr3dHWzV9nnPZArhU1Jz33EwrZ/zWP7Dmeek95Z0y
         Thxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JM16wLaq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x25-20020a1c7c19000000b003d0546cf121sor3197196wmc.4.2022.12.13.04.52.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 04:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JM16wLaq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3bfzNnoI5loXrPkezvGfbdzUW6/ZLveS30TWnXZXaBg=;
        b=JM16wLaqrsHvNIWTJ561XYEmz0daMJhk9cT5BctIO/NWCtE9/Fivhy43SrpItVHXFB
         6QodV7H2+sUJON9Yd3UKewPT/be6ixGnqhEHwWhsp8yjFfR2c5jtH3SYB182DGCO7WH9
         1oN0QGjzL5g0lpNmxIFnbeG4jH7W8GyJvE1qP9ZYvakeaSEG4KoxDTXNu2nVud+yAQhE
         EZOH/M3bWGhaBCCtOyxYwvGwwdNWUAgMOZPQVvqi2h9f9rJGuL9RrAfEoxYg436uOB3l
         DHAjj4Euvp7sZSqbpi2G7rUbA8BjKjXoXs9OXeatF6zCRLfAmQ6VZyehTXCptdvEmf8U
         amlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bfzNnoI5loXrPkezvGfbdzUW6/ZLveS30TWnXZXaBg=;
        b=CXOZ43T25svhu9yEe0I9i9o3HjKlyNnjvdDEzabknCEg/bJESYGJLLn/TtSDK4i2Oh
         RUHuXsADkbliqer8B9VitPCP0obj/1ZR+NzkxJSW15bPkPGnJLqci+9M9mmYk+jdneAc
         fOvuUl/EEcoAkWmY+YOz9670TQ5qclgbkoO7nnP1UYb4rV1fON+hNcYT4cx85JEWBW/e
         eGMK9ULrw6/gFx3xB1S/HfnCWNAzix1yperencUx/ZL1P10/QmTIKY5Rrn9EGgQsSRKL
         KWkDrbQPeXqeN82UK7IhuUK6wcp2rRaIxnaNgQ62bNGVD848/+m2tqxGxDfszApVfGqg
         Paiw==
X-Gm-Message-State: ANoB5pncQRUWMOdUQZvTFG0D2fyNL3gOXBBwOdMSZ0iyy/TVNm7Cv1L5
	9SRwJjc9llM71R9uJcnAgFWSCKlo
X-Google-Smtp-Source: AA0mqf77irf7zNXmukiwrDTKwDbegq7MpBSRdmRGEPFf/pC1gqsGLpzpmScsSOdw6DgaepqGCBYmIQ==
X-Received: by 2002:a7b:c00a:0:b0:3cf:cfcd:1f5 with SMTP id c10-20020a7bc00a000000b003cfcfcd01f5mr15085047wmb.38.1670935940762;
        Tue, 13 Dec 2022 04:52:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c205900b003a6125562e1sm12499949wmg.46.2022.12.13.04.52.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Dec 2022 04:52:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 0/3] hw/ppc: Remove tswap() calls
Date: Tue, 13 Dec 2022 13:52:15 +0100
Message-Id: <20221213125218.39868-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 4PK7vMYjphb1

Hi,

I am trying to remove the tswap() API from system
emulation and replace it by more meaningful calls,
because tswap depends on the host endianness, and
this detail should be irrelevant from the system
emulation PoV.

In this RFC series I'm trying to convert the PPC
calls.

Any help in understanding what was the original
author intention is welcomed :)

Thanks,

Phil.

Philippe Mathieu-Daudé (3):
  hw/ppc: Replace tswap32() by const_le32()
  hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
  hw/net/xilinx_ethlite: Replace tswap32() by be32_to_cpu()

 hw/net/xilinx_ethlite.c | 10 +++++-----
 hw/ppc/sam460ex.c       |  3 ++-
 hw/ppc/spapr.c          |  9 +++++----
 hw/ppc/virtex_ml507.c   |  3 ++-
 4 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.38.1
