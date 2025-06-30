Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2244279dye;
        Sun, 29 Jun 2025 21:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/J9aDphvDh46yDwMNvQ0L2R4oguOZGxptF9uoazIF1v41Ikj8swbFU0tXaOtCnLvb9NvWUHN48uY8tQ==@linaro.org
X-Received: by 2002:a05:622a:4e88:b0:4a8:1b92:17fb with SMTP id d75a77b69052e-4a81b921fa0mr30421061cf.28.1751257979311;
        Sun, 29 Jun 2025 21:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751257979; cv=none;
        d=google.com; s=arc-20240605;
        b=apg8oDmdrrhLQ77SHw3ZyIATbSpGWdDp2GIcaDcqKBKH2rhE2c9vM7jd7hoQ8mZk3M
         QDSoNLASbfYB0ZnpRSr61TjZszV0FaMFkOjNpVy6yZZrCtauTHaXdgkzwL2zVtsE9/12
         qzZrwkReG2r5NmtLvteMnZyGPJgVl+8dSgB3f/O5S8l2FdpngMg/f6KMeIYRcNZ/gA2c
         xSHoVCTrHjlEbbc6ZmRkQUL8M3CxBvmzvloxyuGGYxHxdU98HmqOmKZ2XtUX46ZXSH2z
         t+a2eS6ThHvUwRskIdIF1D0xsnG5dSrSp2G+3/4w2hr6BDf6yvJLRbTsq+xIxcFQ+rjV
         8RnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=xwg4/mGs9AWU01hT2+1uM8Iz4xoWbdqsFjVaCRRcKlo=;
        fh=eXohlnGDUHyBk7VpahldSqBdCB4XZ2tgZvDvzoK8MqM=;
        b=MnybtqyHEjbXoQ+sP0mCRspXn2m2+3s74ouo3L4ASJfaKoSlD+EgFXdNVkxckNbRLE
         DU2/q4AYyGywjUUhuPrYyFc0EGDZwad8dc43cYHlcnPPvS/Ch0gtdQ2A2pss1s8yemJP
         PZESuvmersBV4vbR1Glmegrj/JtEQ6nsjUOiYiqj9Q4ijeuoVJKMfqZ7VSxoQUjCKYXo
         pxZwOqy9hY1MPe/+G+K7JwwEwMVidAI1e4KLJ07iZbZnusi/lPJIL9NEAXnZljBapifq
         XfvPb2/zAtl7lB5hu2IhxM/Ps9sKI3uZqXeOMuq9icOGG90YYXgu18J7qDMfR5/uh084
         be3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6SR6CsR;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d75a77b69052e-4a7fc0ea3a9sor80150891cf.2.2025.06.29.21.32.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 29 Jun 2025 21:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6SR6CsR;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751257979; x=1751862779; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwg4/mGs9AWU01hT2+1uM8Iz4xoWbdqsFjVaCRRcKlo=;
        b=A6SR6CsRzLEQuv8+z4f2WVDQiMtzz/UC85JSIbgrtcLGkkreyNZVN21p3aWrcv+rH1
         yXhJau/H4kQ9myD1z7QvunMkMd5ZTFgWxazk8I6jr9seJja0o3iEHTki+WA35wkzVNDG
         AYME3nWitAh2pNHQ4x2iik5ds47CtPcLIzrrfdaoY3TTR8T9XKPlbKrrCHsbFtNEv1nU
         L+XATF1/E3hYYQeKHNy6jCLzOL4xSEUv/4P8HI8GCS66rd2P+s9pxDg7dQ0xTBPI5VTI
         40bRGeaxlySUlyGwPK7IcHZT4PFdoixVf3nQ4+99AK7SPJq7iMohYTH3td70AUf/anKO
         V+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751257979; x=1751862779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwg4/mGs9AWU01hT2+1uM8Iz4xoWbdqsFjVaCRRcKlo=;
        b=re89KSY12A9mHnRy83t3+yUuJ+L0guw/AshSryAnUIqia72YieFL3dnVl1lxAOJvvv
         LgiXU6y7zY8aGy580FkWT4tpOq7Uw21b1QmDY09vfsJTEwdCGOR1pGtdVDt6HzEf5EaJ
         nYz9z8WMMXv7bFwHrutLIMYu3JssMohdDmbFU/GnjwD2Elgmhs0jnX0OhW210yV0IELb
         NJ5j3dgcdbSop9qn6mzs4bB9qL8lVGGQLtGZ6LBVedBaZATBt/CaCYsyd87EeHGKslJB
         /pz8MdiBUpUeIfGou5Ku7M5YU2doiHO9gkW0SA4SLMsxun9RIthT3L2NVLD1TlIOHTp4
         nX8g==
X-Forwarded-Encrypted: i=1; AJvYcCU3UR5Dfy7OKv+paV92kcn9RDgBTMovU1X2Ms+HRPIPvc3XafCQpFwTuBuQXb8V8yHTxtwoQnEe6oRbiw==@linaro.org
X-Gm-Message-State: AOJu0YyvRcx9WqP5JnCPdfMVmLRQNndF1ZVMYaLAld4RvsiKl6rrcDmX
	lwT9a7oiwztBt/FgGCg9uo6ECbP9gkXDyRPrl5jNOY4fjrsAn01gbysVLl2cIpLZc8LrrA==
X-Gm-Gg: ASbGncvLyFZVj2FrI4lLqn89grUghESwn46Dwtp5n41LaeSIs1+kn3VL5tDAkqD3OAq
	FQAPy5/K/YPjd17xNRTst3KuqMv+4Kc6KQ4mWisCEzmqYY2eUAsZD9hK7lSinJaMk09Y17A02fC
	Hl3lzK25l1Lw2q292cyEsD4tyuPUUelBNRmKNy4y5hnKQ3MUZfjOpsNFBxLb6h+nxhl6+iDYrfH
	25pmRxoLRduOTiZvR9NESowf3jy5bXbd0ZosiWB8LEH/YJj2nKm9VZsDzMD8pFn8YYyFKz/vOak
	dLRBGfGLF6clq8bxadCliOp4yNCwH4I3kRPymrnve+ur/3OHFQmZWxi8fLy/qTkM354=
X-Google-Smtp-Source: AGHT+IFHnkvJlPZGoYIy5ZOVjm6Excfd1PisbneTFkOA2RRZnH1Q/nxBwevrtm1F2aCa0VzIkb4gdQ==
X-Received: by 2002:a05:622a:8b:b0:4a7:fbd0:79b3 with SMTP id d75a77b69052e-4a7fc8bb4c1mr183691361cf.0.1751257978871;
        Sun, 29 Jun 2025 21:32:58 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13971fsm53470171cf.20.2025.06.29.21.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:32:58 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 0/3] target/arm: Add FEAT_MEC to max cpu
Date: Mon, 30 Jun 2025 04:32:34 +0000
Message-Id: <20250630043237.996788-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gLzdnoNja6rk

This series a WIP for adding full FEAT_MEC support to arm max cpu.

It adds the FEAT_MEC registers but does not touch the translation regimes to
support the MECIDs. I'm currently looking at the possibilies to support it in
QEMU for the various translation regimes we have on Arm64.


Cheers,
Gustavo

Gustavo Romero (3):
  target/arm: Add the MECEn SCR_EL3 bit
  target/arm: Advertise FEAT_MEC in cpu max
  target/arm: Add FEAT_MEC registers

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-features.h     |  5 ++
 target/arm/cpu.h              | 15 ++++++
 target/arm/helper.c           | 98 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/cpu64.c        |  1 +
 5 files changed, 120 insertions(+)

-- 
2.34.1
