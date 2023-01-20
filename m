Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1087871ejc;
        Fri, 20 Jan 2023 05:44:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvIUdlYjzVkqyZouE7TNUbiVtSj0LBrug96Rvjt2W7bM9QAd0xsD5yMdp/GzbN9JN60qsf7
X-Received: by 2002:ac8:6045:0:b0:3b2:8972:d541 with SMTP id k5-20020ac86045000000b003b28972d541mr16806576qtm.22.1674222240009;
        Fri, 20 Jan 2023 05:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674222239; cv=none;
        d=google.com; s=arc-20160816;
        b=SBUnCrnBVYsXnev3u5MB9K1CBVeUdiSm0C56odY3nv/isPsN2b1CrfPFgq6HKIkcnt
         fgVpfP619bsJ4kF9jKUSNcckfHpcQBiPYKRp7dn8tGpbvX+BuVbu2rkVkJk79ZqQrXyn
         utqPq+Qx4+sj2CdvEprFOTVjNbz148BZQiF4NQ6aWuvB18r1m1L78698EK9EqQa7EGwV
         LvjqFgjrV+h+Yl3hnWTmGsHYKzBqw6zenWKx4hr5Grb24OVliTmL7mv+uRbzJhhiAfob
         lgWaOND7fRr5DXl8OgXnagTFV2S9KwDQrJl2+CW1J5JvuTKiYCTAqzr1ayNK/KkP8N46
         GYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gXuDv/C0Rs9dQca1e1w0gMaDH945zae3nzhBwBhgYss=;
        b=UxHE1EQUUet2rdlKfPY2cP4zIZJWbsAZrrWDaE0i9aP5wqZLWH1e5oSY+uHHX7Wmzd
         xowiLEsfVYMg3kLrmRtdXlKgVpNVsmF86W589CV5KqGfmyAaezSlSR1E5K85BOxxJQuf
         4zIGt+O7Rzkea1mMOTqXTz6LDXceWMBm12OMNDvr/Anmn5gVpCgJy3hrGtE+NZM2LzLx
         kDNnYF7hw2XE/GClG4qImFn9gkCdgGSFVPTmm7yD3Nx/PToCemhIih3liaPF/uV/bghS
         eMzaNjqtx40ky4bJwJVHr75+I8klb8friiX5iBsqPAF/2++pTo3ipps/oD80xso1Uz04
         V04Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDdvOcVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq8-20020a05622a1c0800b003b631d32120si9063315qtb.508.2023.01.20.05.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 05:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aDdvOcVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIrfu-00012P-O0; Fri, 20 Jan 2023 08:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfr-00010z-Cm
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 08:43:19 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfp-0007Vy-O9
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 08:43:19 -0500
Received: by mail-wr1-x433.google.com with SMTP id r9so4901519wrw.4
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gXuDv/C0Rs9dQca1e1w0gMaDH945zae3nzhBwBhgYss=;
 b=aDdvOcVKHmz8bhEdKgqTPwFekE8EliPsTF+Sa5oudfNiSOWeY6HC9REVEjxaP0kaeV
 najG8MqQ5/QpV+1kb8N3jOen8oBs+cEu19dKChriLY4Az9vXM1z85Gj3RPYX9Jq1/cgE
 gfJ0/IN3RAgEga5qpdaGjgaU99e3hi5Ji+DT0s1kMBlPZuTmkoeE4kce/Pj1Um5ql1WS
 to4QpA22+taJfLjzbY3YjrIEO62HgsIELO4zV3C+JMSh9imq+dCs5LsB/yp4DWLFkvHP
 CaGHxZed66BgiQ2ucKUYejZVNcSrR2cmranV9Zg9jjpn2JY4P+WT2Hcl4qv2eg+x7SIx
 iE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXuDv/C0Rs9dQca1e1w0gMaDH945zae3nzhBwBhgYss=;
 b=A+gQsy0jqJnBVIgDcaFlcS5HwNHdOjB5oavE/UHb3vw9GOKqI2EK/WgurIGhrbHnB+
 3BdeWOPVp1EgY8P8sqdHs004jKJtX6v34gpQljV/OIW1xdx+BrgOtRcMyIcrh8+c3RYG
 ZMhAmijm2Yvr3FfeRQtnUFNWKqSTsPWkh5q08BJ6iZde83sk6YdfoWdyC3tRgMnPtUUM
 Iq7j8W88vU0IgAsat/lH8ktY7teGZXQvQqZUCj7S+JyEgMhHNAdBKk3o+fjVQNAjZwxt
 o+G/Hn6aoWb7C2SFxFzerKTox5/wxb9shbplb0zfJaPIfXpiuq2Ep7Y+eoi8b7eyuJBg
 tRkQ==
X-Gm-Message-State: AFqh2krUTSO/5Q8NUG7zKUEU1FOUD4byK2+iNqE2TI8fGWm+gK6BcW9o
 CAUtZI4p0eCuv4abKB+p5wwoQg==
X-Received: by 2002:adf:cd81:0:b0:2bd:e0e8:694f with SMTP id
 q1-20020adfcd81000000b002bde0e8694fmr13257915wrj.32.1674222196127; 
 Fri, 20 Jan 2023 05:43:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002bbeb700c38sm31004057wrw.91.2023.01.20.05.43.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 05:43:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH v2 0/2] tests/avocado: Truncate M2S-FG484 SOM SPI flash to
 16MiB
Date: Fri, 20 Jan 2023 14:43:12 +0100
Message-Id: <20230120134314.81956-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BGMrz9JxXgIX

The M2S-FG484 SOM SPI flash is 16MiB. Truncate the file
provided with the Avocado test to avoid:

 qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes

before merging the "m25p80: Improve error when the backend
file size does not match the device" patch:
https://lore.kernel.org/qemu-devel/20230119123449.531826-2-clg@kaod.org/

Since v1:
- add missing 'size' argument in file_truncate (Cédric)

Philippe Mathieu-Daudé (2):
  tests/avocado: Factor file_truncate() helper out
  tests/avocado: Truncate M2S-FG484 SOM SPI flash to 16MiB

 hw/arm/msf2-som.c                   |  5 ++++-
 tests/avocado/boot_linux_console.py | 15 +++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.38.1

