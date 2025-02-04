Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183638njb;
        Tue, 4 Feb 2025 04:50:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOWZXQJQtL2wrjmQzIdsf7upGuUHefeHFPHTY2t8NjJYW0oen4qF48sR8M4Mc2fwcKzgSWXhNylVaPwA==@linaro.org
X-Received: by 2002:a05:6000:1ac9:b0:38c:5b9e:ab83 with SMTP id ffacd0b85a97d-38c5b9eac5dmr18077187f8f.40.1738673412362;
        Tue, 04 Feb 2025 04:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673412; cv=none;
        d=google.com; s=arc-20240605;
        b=DIAqpWIg2LdPr/e5eAUCWCPANPqcnIHgUeZnJj0XpbkwrFH8ZPoWXeyx5FgB8bI/rZ
         NT6i1GI9qF60A08C7ZGhMKLRVLvSbFobED2Qr8aj5gylKbSLT+CbSRKr3RKCUnig5aFX
         wKAgYfVvJRme6Q73i0q4kFM/DiooWE1kEcDNny3uuVuGD46+r1zNTy8QBFuQ25dKXyV8
         VK0MLVAOAmO6A0FcRrX4z7e7iGVS5LSHs2j0GufsXRTWlpH30O/OAvyClIuZ5hPePhKV
         zZZeEc3AJT6CAf/a0YvBiEHi9qNd8q0Idy2DMbw5FwLWfzqHt5Ol9hMARIQTxNvdx5YF
         UDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=yOXam1zZRDwCCiYrbs7WMh4G2vY3JpKf6Wb1iggPBq4=;
        fh=sIeXS1PJIjXBpO2gr3xXDPQaMLzq/iZh8FjW3OXghHo=;
        b=aoC4ccnzcyEWvWsBtmiI5VPzYIrxeZerts6PL9x1QTBD8YcnLQ28cd5KDrRiVLkQsT
         M54mVeXguxba/Y7cf4oWj9CyRR5WKWIjQ6XRZhCDCcTAVtUvjmQU93fAjAnffmy03zT7
         0nbV5einDpyQWW1nIc1B0LW//yozxyosdphWUdnOIo4+33Gy2XHU4ocNizW/Jq4fSFn2
         +B4qcM0ib0ITdWiw3TbtucRiCjNaOHv9lbS66S7Vfc+0IlojEdozdk148bXsf5F0/FHD
         mFi1OzQn/tPiMH7WzqgyzUfSEwbqsuUwMdr+xOwwVPfaKwQYv6JlurSBmvdmD4fvRGAp
         pPgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMFbideP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1ac044sor3459345f8f.4.2025.02.04.04.50.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tMFbideP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673412; x=1739278212; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOXam1zZRDwCCiYrbs7WMh4G2vY3JpKf6Wb1iggPBq4=;
        b=tMFbideP5Hypy5ujZJc62+n+Nvww1oxz4PzEdQwRiVnKVCeSZ9RZnid8lUDPZC7pT6
         yvvkG748yhja0usJvoczS7XY8GiJQRQ2ImC1Inl5DxHzgQXbg9fHxH2vcIn9/3OoE1ci
         /x282GVdhM3O1oVtnZH2SKdjXWCvjPlVgueOVSHHQ6MUJGMV4CnBEioCNDwo7RfIAhoL
         a+r0vo3E1/WoGJPdqs7EG46Ar3SVTJuhr8Zf9RiRmFNkGLi9af3Tswpo4NhJLl10czCa
         FI6odIqFqcsT0EA335ASzAvfnNCwKU6HZHnVr5c6ZFoQ2WpOFdiSa2/rDtLR4AV5y51n
         q6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673412; x=1739278212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOXam1zZRDwCCiYrbs7WMh4G2vY3JpKf6Wb1iggPBq4=;
        b=B1fRvhZkhx0m4h1Cvjnks1J4LrX6Mqfp/EyO06sYEjdzpUsWcBhuVMJbJuvPhtjoSq
         jbId2MWTLj4MBiVgOTH2XmUnho6gLw1lztULAAyXXVhsYN6+gOFuQI33sGOlucEaNtYg
         FyO+VUArXj8rE4i8hC7YHOfvCEh2q9g8+MgkGaHp5c42dv/2/TjlAz52WgM0eSPBoQ4t
         AOonGwubkgxetAL19yhlA2bfi4ZnttfTSUx2xlF7hExvRvmer6IggiBLkGZNMjqo1CuA
         GORm+vMZqisODl8EEQBu6PVAUmzF8Wc4gmPvQcX3uTxFJwlN3mKz5kymLruk0h65Ktfm
         ndNg==
X-Forwarded-Encrypted: i=1; AJvYcCX3VPzsO1SPR3VlNkt222ayDnki4t/G5BrrLewE03qB2BAFE5IfHLvxPiwGZQZIfXQ/JPxyNfU7lAnnzA==@linaro.org
X-Gm-Message-State: AOJu0YxlhnLlhVCKxKZHqs/KNUuU3mCJ4GM7Ibm/jU2ywx3+JH+ecG2R
	xfd+/ckwlSYapNertViHMTGXASVSU5lnVzuFTTEfuU1NQX0Px6wRK21B+o9lscyGjQ==
X-Gm-Gg: ASbGncuhh3jJuQ+UKm6ukOd5hCU1qbvMjsd2s8pJEMcQNSF0cCAkvFSwXnhI2gDwjSK
	qY2iKVgqdiA2cutF4rkFR+002jE0o9ll9Z958JGTTjbHjY4zrgDi/VHjGRjNFpNM2Z0s3G96V7G
	dAH5H5iwYwAagNlourP98aUK2yx71e+HmE8sWJbCd5U+trvWryVlszOKCcIwCULvRIVxZ5N3in0
	xHUQtZTLKOMvjiiOi7zibrcUchUi/lxTwzsKZg/JIJG92AftQ1iyJdt+ZvpcqpCAs4QDJ8r/y7x
	uMhptj7KqV/8YVKcL5mshQ==
X-Google-Smtp-Source: AGHT+IH09LPOKrDtyHY/JE4QnBMaOIGIDjF2LsxE+W1cm2LBqdSFksbaC1OMf39HAcqXHhxzvjABrg==
X-Received: by 2002:a05:6000:1a8b:b0:385:f47b:1501 with SMTP id ffacd0b85a97d-38c5195fd82mr20021127f8f.32.1738673411839;
        Tue, 04 Feb 2025 04:50:11 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/9] target/arm: Implement SEL2 physical and virtual timers
Date: Tue,  4 Feb 2025 12:50:00 +0000
Message-Id: <20250204125009.2281315-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TBjjmWJmiudL

This patchset is a respin of Alex's patches, with some extra fixes
for bugs I discovered along the way in our existing code (and
a bit of refactoring to make the fixes straightforward). It is:

Based-on: 20250130182309.717346-1-peter.maydell@linaro.org
("target/arm: Clean up some corner cases of sysreg traps")

because it wants to use the renamed CP_ACCESS_* constants that
that patchset introduced.

The bugfixes are not super exciting as they mostly are oddball
corner cases, but I've cc'd them to stable anyway. The actual
implementation of the missing SEL2 timers also should go to stable.

Alex Bennée (4):
  target/arm: Implement SEL2 physical and virtual timers
  target/arm: document the architectural names of our GTIMERs
  hw/arm: enable secure EL2 timers for virt machine
  hw/arm: enable secure EL2 timers for sbsa machine

Peter Maydell (5):
  target/arm: Apply correct timer offset when calculating deadlines
  target/arm: Don't apply CNTVOFF_EL2 for EL2_VIRT timer
  target/arm: Make CNTPS_* UNDEF from Secure EL1 when Secure EL2 is
    enabled
  target/arm: Always apply CNTVOFF_EL2 for CNTV_TVAL_EL02 accesses
  target/arm: Refactor handling of timer offset for direct register
    accesses

 include/hw/arm/bsa.h       |   2 +
 target/arm/cpu.h           |   2 +
 target/arm/gtimer.h        |  14 +-
 target/arm/internals.h     |   5 +-
 hw/arm/sbsa-ref.c          |   2 +
 hw/arm/virt.c              |   2 +
 target/arm/cpu.c           |   4 +
 target/arm/helper.c        | 324 ++++++++++++++++++++++++++++++-------
 target/arm/tcg/op_helper.c |   8 +-
 9 files changed, 296 insertions(+), 67 deletions(-)

-- 
2.34.1
