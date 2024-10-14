Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1769015njb;
        Mon, 14 Oct 2024 03:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxuDm6mhpdi0IQC9mXqct8Z9YCdzKHfOiVWQAcmpFK/0zCmupxH/vNOmp2j/0AISgoKylMuryCN8NrFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHdbYRBNL4CWf1j2hRlW+a3TMC69M0D8k+nog9hFEzGzKBZKnnpvtnIdfFiX13KAXmuzc6j
X-Received: by 2002:ac8:7dca:0:b0:458:3ab3:84f9 with SMTP id d75a77b69052e-4603f590b1bmr239895331cf.9.1728903066929;
        Mon, 14 Oct 2024 03:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728903066; cv=none;
        d=google.com; s=arc-20240605;
        b=XHrquyon9VRiw9ei4+E8vanMGGFbaL93rnsNx3CfS0SuldMGP+h20PJWJQpELWk8Ky
         B/bZYu6sYwQTbv7tM9856qLprg68PlX27fvxH8Z5nfM3lfKgnMfCwP6/+ln3UfEgFwOV
         MY4l03nZ5BMoe7P242DS/K77O7TiDKdTMqg1R7OTGDtk55Mqwdp9g2pU96ULIEOrj3u/
         AeLIKSL5t36Jd07M1vJQgyzDK+Xd5dwv+uApi4lsdPoVULywVpl50RZcNOjQRUHF4h+u
         iELbvqtT/gZ8qRgW4KjISfZZAjHneSNvhdg2kITuJOuQ8o/7/dujMf1ljy+hKFDTNOtW
         8DSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from:dkim-signature;
        bh=b6bafoQ4AEmroXUTOf4RMDPzol5f3xKj5qcmoPEW4WI=;
        fh=7fMLPEQwGy6OMPcRzLzCIU1Tkw2F8/Z2rIFZAOjqt3c=;
        b=YbyR72janB+U8NtE0ysra1/nfs+Jl5u/gXu6CUEmc1UpA+/a+CUpPF2HZR9PtN8t31
         NP23VgGW6CRCtcv7ki11n9IIeK6mAgIwOA15aEV0hQdMw0brCKmP3zDTqg6Dez3gjF6X
         b/mZagmotn9bCqjEJsSGdPNj5v8S4dYB1q+wzBvG71RITzzY4Ev1n/M8WH29SUwXEy2u
         7n6y7fVScnKFEhGf5FFYE4p5Zt8y2rti5w+UpBMx5+LHV166/2v0xMXETDn9UTyBBvyx
         /rtsF3PLmFj1il540haTZX7RQZjbUXmhMUfKv62X/6GBfdHP3k1IC/LOpSgdNaOSRfoF
         o14A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q3b5woZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460428c8f29si94904631cf.550.2024.10.14.03.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 03:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q3b5woZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0Iez-00040H-KV; Mon, 14 Oct 2024 06:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t0Iep-0003ys-3g
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 06:50:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t0Iem-0006U3-Vv
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 06:50:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso248841366b.2
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728903030; x=1729507830; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b6bafoQ4AEmroXUTOf4RMDPzol5f3xKj5qcmoPEW4WI=;
 b=q3b5woZC1CIIRnSaEf19MINkXBEZmCe9hHuzCS8mLnrt3uAOa4XldDZ7fb/iCMAWhX
 UyGrUl8MKBdgRg8z+rC7lD2eIqICR0oZ30q35dSxEDqyhNcSaurma53rRxwPJc9vei8I
 uOeggp33QnPSGgyoB6Jz/2AIA786yxdDkoAq7wKrirnIPZ823EQD/SPQBETCoS7ZU+yS
 1cUVTVT9P2TVl/aUW6E5rKs7frA5ci5GR0aG5/fR2Y3IQr/h8kQepKLq8VIWqxM/EDUu
 QFQQj4fPVkRJRZljLPFmLlODqgZr1kAWpo2a4IzWeEPv5+Ka30pBsH8KNwBXS7MtgK45
 1N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728903030; x=1729507830;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b6bafoQ4AEmroXUTOf4RMDPzol5f3xKj5qcmoPEW4WI=;
 b=K2cn9oitCxiqze4MfVrW2Cxjjcoqna3gv/YW/X79husUhAlRbKIAlnjKJCiMYzHsAC
 Fd3FpLq4qut/QFmvb3PApe1nr9uixbK+au1+t4EdmDsxHxFLhPjpAhdwKjW7C/bWnPWr
 gxeIuANZ1Y138pcZxYWGE0Uel3hSXJxbfqa1HDgOBmrK0AIWp2I/ywshi1Ig0aZhe8Wg
 dP8JusaDnUUH2IZm04OD0+WUrFv+qiRHuD6yx98Jm8TQ3pb4ahdWcCj5YHlmjaxzrYXL
 dMDVA5UZZXWvR9x7fm/LLeOZOUlJNY0j3cTS/dgNaf0qLQyy+zNu2S/KT+ECKZae9N5Z
 o1pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyeuK6KYN/daBZUbRfQFqLxvswGhMLOfNPcOalZB4t9NNvUWyClXoCJb6/9OEy6e62V+LSM5IyAg==@nongnu.org
X-Gm-Message-State: AOJu0YyCRXMfLyGvU6GJKLK5KW4VO+04SqHp3pVR65SHdPFmBqxbdUSu
 mmtvXhu1aNwVshKimMbmak5R5GGttNcJKZDtGWXTW/xwu+N/cLiTYfGeVuw/kjPCh7ZqeYFORqn
 qqbw=
X-Received: by 2002:a17:907:7242:b0:a99:ff43:ca83 with SMTP id
 a640c23a62f3a-a99ff43d09dmr434786266b.14.1728903030245; 
 Mon, 14 Oct 2024 03:50:30 -0700 (PDT)
Received: from [127.0.1.1] (adsl-161.109.242.225.tellas.gr. [109.242.225.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a0b25226esm165504466b.59.2024.10.14.03.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:50:30 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH 0/4] No-op support for Arm FEAT_XS, feedback needed
Date: Mon, 14 Oct 2024 13:48:54 +0300
Message-Id: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABb3DGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0NL3cSiXN201MQS3YpiXXPj1NSUJCPjFEtjcyWgjoKi1LTMCrBp0bG
 1tQAet9eFXQAAAA==
X-Change-ID: 20240919-arm-feat-xs-73eedb23d937
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-12fc5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=n3V+VVQvSEXeK/GAnYRkazxno+QILIS5TUpLyNPBbMk=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm5EUGQwZXZWMmhRNFRvbFFsa1J1REVjZnFCeVhDCmxmb29JSmhTeWtYejM5b1NE
 WkNKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnd6M2RBQUt
 DUkIzS2Nkd2YzNEowS3dDRC85OXJCcTZWK3NqSTBKaW1QRS9IeVd3NmlNWjJkVHpEcEJHTkErZw
 pJOFVzM1lXbktneUc0eXZvK08veFFjdHNYclBQa2FkTFJZeHZBa2hQQWFZRm5mOE9SM0swMG9pS
 lpOenpkTHdwClFqT3lEMlJUSm85bFZzV1FPSkRYNjF0Q01Bd3ZzaDNQNHBxcGZtaU9DY0MvWXVi
 RTduU2c0Ky9Bc0lWQjZhUUoKazhvM1ppT1phM01RTDM1SnNQY0E4NnhWc1FCMTBpZmNlVTBGNTB
 EUTZONG5VUTFjUll3cnBYSDY4YWNSU0grNwprOVhleVlVcnZQQndLN1pYRi8yUXNNRXRqNnRhc3
 RqZjNHU3NuMkVVOVR6aWxsbGhRWDJGTDJraVkvWWQyU3VtCm4wTGFER0Y2Q3ZBNlErUWEwTHZxT
 nhiekZVTmJKK2drY3dETmJyeGx2WWRSdlgzc2N1NTRRQXpqd09RQVZlZ1MKMm1FYjB1RHNxYy9i
 eG5GUXhVUXRZbmMxbHpwaVdqcGpOV0dyMm9ORDhWU1hRWkhSSVhlREtyNGsvNmhjR3kwcwpNTlR
 lS21UV1laZ2ZVc1VRUkRkdUZsMVRPMVhTKzdFQVBJQUJ6K2ozS3cyTzJpSUFCQUY1Nnd5SVhWNk
 ZYaFVtCmZWN2ZKL2ZoWEpDTGdRZlNocXgraktzNFJnWDVPVUh2U2NHbDZoVlJ6S0E4b3NQNHpSW
 nUxcHVmQ0VsRzRycnQKRUd0NzdjR29kdCtpUzNLUHVRVE1SSm5NOXQxOGZLa2UwOWRNTXNXNzlr
 MEZUUTJKcWs5eHU0VlFQbGVKK1pMNApiZDZOR0lWbCtrckRFb2crSTBqSmRpanFJWmFhQXBoYmo
 yZm8vUlArSmczVCtKZEFmWlRXd2FhZ2hDMTFJVXk4CndTZ2owZz09Cj1YNkdnCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v04Lk1+s/hSD

This series is an initial incomplete attempt at adding support for the
FEAT_XS feature in aarch64 TCG. This feature was introduced in ARMv8.7:
it adds a new memory attribute XS which indicates that a memory access
could take longer than usual to complete and also adds instruction
variants for TLBI maintenance and DSB.

These variants are implemented as no-ops, since QEMU TCG doesn't
implement caching.

This is my first foray into TCG and certain things weren't clear to me:

1. How to make sure the feature is implemented properly. Since we model
   cache maintenance as no-ops my understanding is the only
   functionality we need to provide is to expose the FEAT_XS feature bit
   and also make sure the nXS variants trap properly if configured with
   fine-grained traps.
2. Is there a point in adding a TCG test? If I read the manual
   correctly, the nXS variants should trap to the undefined instruction
   vector if unimplemented.

These patches lack support for FGT for now.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (4):
      arm: Add FEAT_XS's TLBI NXS variants
      arm/tcg: add decodetree entry for DSB nXS variant
      arm/tcg/cpu64: add FEAT_XS feat in max cpu
      tests/tcg/aarch64: add system test for FEAT_XS

 target/arm/cpu-features.h          |   5 +
 target/arm/helper.c                | 366 +++++++++++++++++++++----------------
 target/arm/tcg/a64.decode          |   3 +
 target/arm/tcg/cpu64.c             |   1 +
 target/arm/tcg/translate-a64.c     |   6 +
 tests/tcg/aarch64/system/feat-xs.c |  27 +++
 6 files changed, 255 insertions(+), 153 deletions(-)
---
base-commit: 7e3b6d8063f245d27eecce5aabe624b5785f2a77
change-id: 20240919-arm-feat-xs-73eedb23d937

--
γαῖα πυρί μιχθήτω

