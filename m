Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp167790ejb;
        Mon, 12 Jun 2023 15:35:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5k23RA/7CDpo9XswrO6h/FjYcA3pHv15TQhbSJ0fnLpk0MaPo+AUD3TwiMb9hfdvUFNt3d
X-Received: by 2002:ac8:7f41:0:b0:3f5:3b4b:b2bb with SMTP id g1-20020ac87f41000000b003f53b4bb2bbmr12144161qtk.41.1686609320713;
        Mon, 12 Jun 2023 15:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686609320; cv=none;
        d=google.com; s=arc-20160816;
        b=NV2YoVU5dCireRRG8n3WcKaEcj4hmtN9FkskMnD0wvPtulKapT3YfIam30cxvO6SKu
         NdC08GZhZ58M4jo2b00y9wjhCV/QWnp98uf/SinPadm3zPRmzfFJ3CeRjcWdFartA/Tk
         PfapqulJL1TE5YwiDTKoOHK7/XjCMhp+HOxXDbQ/Uo1IXyabC/S7I0dRK+trYDZ3hKAP
         8ZyD0liAaPbwAs7BLJobadw1Ttm6jiUikQPwFI+NPHFRcZan3bXVlej5wqgcYG4Yu9F1
         l6Fv4FsMT5cloSYqvOw0olhNWiW6M5M+ef8F5HDenS6+M92OaDJZrY9tijtb96iXy4dT
         S5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SqhlRkXOcH7EyYnTn68FA9nqTZvBqxPLUfNCO5zF92Q=;
        b=VFOWzoZn+zXbaGMaZpaplT87ILvlmuFnQuSEHrqR+gCJzVVzvAvA2LNPak7O66Fx3E
         vMnYpDL2a5q++WBSPt2akzGas3P3MLnVqCprKt7eb62kEkVB8YzqAxuYK7ViqEofDevk
         el1vRtMyvWansximaWusDitondLOl0/Z19qbdB7zl5Y1Bh8usrbz5GJ8n73mPkCrZKbS
         i3AYjRrEaXVUnAsfCUe7rgzM+xOkhZXzLE3BAYdc0I9l7VhY5JYnbJCihL1l8za7mDr8
         deg8C2ueJDYHZVhr7KaPrR6fVN2TVOWwHkh5InFB3NSGsO4Vbf4J60c9WrOVU38Hqnqq
         Ygqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kEDhXScO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05622a145300b003f6b71f1967si6871137qtx.552.2023.06.12.15.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 15:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kEDhXScO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8q7u-0001aW-1J; Mon, 12 Jun 2023 18:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8q7s-0001a7-NR
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:35:05 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8q7q-0007dV-PX
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:35:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977d6aa3758so880645366b.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jun 2023 15:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686609299; x=1689201299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SqhlRkXOcH7EyYnTn68FA9nqTZvBqxPLUfNCO5zF92Q=;
 b=kEDhXScOIvT6oF80U+aW5oGYOdkhuJLcJBS+Ka1GseFVbpXV9ynDLbXIos63othYHc
 vNtmWjCJ5jALFQogj9a3n3zQm5Sb2wjHeMNZ56I2utscXxHiGqyegt6ZpVJ+kcD7QzTI
 Xx/yJYeZP6X0TMDb/p0OFzyt5opv7NcljMZk14S603kiZCRdaBLx+4rgzbHh31NwT+6Z
 k7RZRVAeQEQDOsmqba2YNDFeqxjZFktA18K49+C1abWV7HNcysDOPtfg01P1HiqzG6l6
 6ancD0RQWuy8psvXWV+5zqtwH8u6tXzBS8SSrBzlqrE0ih24vKXhMHv2Ft3ITKSCTsW3
 CicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609299; x=1689201299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SqhlRkXOcH7EyYnTn68FA9nqTZvBqxPLUfNCO5zF92Q=;
 b=Qvf8tGwTH0muqipL3qlrqH/d84KeTIVteo6Zu7t2+NPNCguZrwha1RxFBxHZq4uCBD
 fi/+1XpBq38MDfvgZuvk+tqKTNGjYu3cH1+VMWZOEq30PkjhxKUXWgIUUskg5mUkXClw
 8PPrAL9M3X8Qx6dzSSSGL80ysEvxxzPNwlEUMkvr568Z3l1FQoY2DtsV4z0UqcdNc2LT
 6KlnuvMpq+A9+cnJ5F76xY2355p0msE+h4FYRRuEl1j1LzDJYSWG/g5Ipx5mGhVCsouT
 BqqvNfa/hCizxN8T1asJ4krFfXC/GHMtOXrjMc+TKNVb9xeENf29t257eXzYDyloQ4+U
 t2lw==
X-Gm-Message-State: AC+VfDxpRSaY71DyfR9tF+h1U/pwGTes8P08+l5CvfIuwlNfA93XGmUJ
 sjbznjA7R1/gktmSqdR8ICXZPNScqmpygl/wYL68uw==
X-Received: by 2002:a17:907:36c8:b0:978:af67:c7ea with SMTP id
 bj8-20020a17090736c800b00978af67c7eamr11761566ejc.41.1686609298809; 
 Mon, 12 Jun 2023 15:34:58 -0700 (PDT)
Received: from localhost.localdomain ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1709060dc400b0096f937b0d3esm5802572eji.3.2023.06.12.15.34.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jun 2023 15:34:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/4] hw/arm/raspi: Use named constants in BCM props
Date: Tue, 13 Jun 2023 00:34:52 +0200
Message-Id: <20230612223456.33824-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: L7Tf+xw02Akd

v2: https://lore.kernel.org/qemu-devel/20230612115950.5002-1-sergey.kambalin@auriga.com/

This is a respin of Sergey's patch but
- split in multiple patches
- removing redundant comments

Sergey Kambalin (4):
  hw/arm/raspi: Import Linux raspi definitions as
    'raspberrypi-fw-defs.h'
  hw/misc/bcm2835_property: Use 'raspberrypi-fw-defs.h' definitions
  hw/misc/bcm2835_property: Replace magic frequency values by
    definitions
  hw/misc/bcm2835_property: Handle CORE_CLK_ID firmware property

 include/hw/arm/raspi_platform.h       |   6 +
 include/hw/misc/raspberrypi-fw-defs.h | 163 ++++++++++++++++++++++++++
 hw/misc/bcm2835_property.c            | 112 +++++++++---------
 3 files changed, 228 insertions(+), 53 deletions(-)
 create mode 100644 include/hw/misc/raspberrypi-fw-defs.h

-- 
2.38.1

