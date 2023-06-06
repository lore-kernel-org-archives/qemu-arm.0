Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3795152ejb;
        Tue, 6 Jun 2023 15:46:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:1409:b0:64c:c5f9:1533 with SMTP id l9-20020a056a00140900b0064cc5f91533mr2753591pfu.33.1686091571520;
        Tue, 06 Jun 2023 15:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686091571; cv=none;
        d=google.com; s=arc-20160816;
        b=Ypz7p8vPH37yZmsF1ZADgl3ZQGYvyJqcEYXUXQ3+pKksAO8vIhND4q4imG6f6SGz/Y
         u3+pfdcc9vyN9VwJk/5oMVm2hB8zW7eOj1R/0in49luX+58KWdWVO9kc3nyEqEbvYafZ
         xjZwDSp0f5N7PDvOonxSZS1Rg4RaY0uy2Ljeq2AIkhwl/BkfSTI1XMYvoHs0eDMDu93U
         FPdDTw+8JGrE8u6QexG1Pi5PIgaxa76MzmlHwe2148GNsIpaZZbhvKrRNSiZSxhqEc7C
         tbD+abbim0AyOcUP72rqi2tnj66sK03wRHkSWOGGTscRg47NcAHmRTRo1d7HKtxO65gc
         /dDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=n5Hd9wF3SA8O3vHUNCL/EbPuYQ6aCmo0Nwy8NbLBCYg=;
        b=qqIPMC10mkkthR0IY2Ow+nrpk6kCcf8IbCUN2tcE7wCnmRLeQAkh0Noi7dtKjiWotx
         9pVj6z8qGiuHE1Mf2Bq1ixwQz+dd/CAj4r7KQzchyj/NUsAg7O8R4f+qbjusmaZ6mepW
         BbMzYUkxwXj0ttOp76z4aecRR6J6skbXD8nuBTtuvJYg7bG1+wGcMU2bOBA4+ZvKaVvd
         coHpEXdVDUbLxR/nmQoB02yut+rpuCgnIfVQ6GdQJsngJ2Yi1qZn2xGVkGaInSrqFq2X
         ATEMDcZe0Rt4aXw2iok//dJmj5dQCyGinxTSh71OMK7HgMKpjA9nhA++VbXrJH9aBPu2
         DbYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dnmng2zQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w8-20020a627b08000000b006410a66b32dsor3537198pfc.2.2023.06.06.15.46.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 15:46:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dnmng2zQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686091571; x=1688683571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5Hd9wF3SA8O3vHUNCL/EbPuYQ6aCmo0Nwy8NbLBCYg=;
        b=Dnmng2zQJ7+mSEa5FIBn1X/K3UIqTRbBQ/PuJB38P+Ze11uL7KiebTEnwF4b/DYvAB
         MUfyNIozpK/C0ULbW7MsMMyTo34sUwUFI8lU83wzPiRahc4AlKtaPHbtPL0oQSht7hvk
         34c9C5EzeFU33x8PkHbiaPsoY7cnbrWvYjsQd7NGYJeTAZFBCzj/hR2t6FZ16gqYxMZN
         NLiwxYOMnJyMBpGqPZWv8T/wSbprSe+nJDVjQGKMdx1nB+yZWTvy5egrLpUAkflp55zO
         +OhTZ4Cj4qZFt2DdZIZjwOnMtp9ev1s6q4bqBQiv369Hp8jxbXNqRUl/pa8fH4/CTS/a
         CJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091571; x=1688683571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5Hd9wF3SA8O3vHUNCL/EbPuYQ6aCmo0Nwy8NbLBCYg=;
        b=C9N0H40reaVlsXm3dqu6fMaMpAZymG9tGot3bShgZYMW5pv17DyBGnTloV3ICzIzHV
         JiWa+ULAedZnp1zcXUGInjtyRNZDoiVMgOkshvcFsKzZcfcQ8b4uaw1F3T6CvPV76XgK
         67ft+1uZUvOhw+m3ULfo9+JMq7EerPBGz4xQ4DyiIsVuMhBPmSf9cZyTJA/3FrcufT7i
         XGVxQkgQDMrCy1mBZWapIUj3IiJ1hclolc8KqLo/maNqNkGSSegkjAr8ABwtsdlrG/QX
         BCkuEsJbbSvd0WvMCe6IzXkkW0krCQzxGQDzyrnFZ1ctUZhuTGRUKcb/1KYCIZSmyUEh
         FUEQ==
X-Gm-Message-State: AC+VfDxByWcD5ZvC1E8dR2ozW//Q88kka0IwCamkCIVu6+sfZ10Y55vg
	WAGAxGcvYgVHsCN1wIraxWP+hPlPGy03iRdxH7bxyw==
X-Google-Smtp-Source: ACHHUZ4F2PLqEXxhYjVxHGC4F+0t4R0EinCVFprYGB+0Ia6HixD5eN/faNjK2xGMYmhUELwPED3hZQ==
X-Received: by 2002:a05:6a00:22c4:b0:653:cfa8:dc51 with SMTP id f4-20020a056a0022c400b00653cfa8dc51mr3128922pfj.22.1686091570915;
        Tue, 06 Jun 2023 15:46:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id t8-20020aa79388000000b0065cfd5cbef3sm3346969pfe.15.2023.06.06.15.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:46:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Subject: [PATCH 0/2] target/arm: Fix --disable-tcg build
Date: Tue,  6 Jun 2023 15:46:07 -0700
Message-Id: <20230606224609.208550-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BQSmg4k/LuAz

Broken during my build tcg once series.
I thought we already had a test for this, but no, so add one.


r~


Richard Henderson (2):
  target/arm: Only include tcg/oversized-guest.h if CONFIG_TCG
  gitlab: Add cross-arm64-kvm-only

 target/arm/ptw.c             | 5 +++--
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1
