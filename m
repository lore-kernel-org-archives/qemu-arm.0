Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp246572ejc;
        Thu, 31 Aug 2023 15:56:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYHOpfjlXyldpz252g4o6Z0HyCsv9vnmxqC5vAApk9FcEafLdTU1fXyF/clCF/BK/JzSO
X-Received: by 2002:a05:620a:1181:b0:76d:7431:2fc2 with SMTP id b1-20020a05620a118100b0076d74312fc2mr733269qkk.73.1693522618696;
        Thu, 31 Aug 2023 15:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522618; cv=none;
        d=google.com; s=arc-20160816;
        b=TRzKq/saOAv3aPatgBYYccTOdLITBi41X2kYaoIrUQRpeZAFwxwDlpdXmGH9GvIz/f
         8RKhs86EP6sEHu5TjG7V1lloeidMxXgAk9A71iDp0DOUGctXvDHiBSC/6mussNJDByPV
         UPsUembuvwrIq/ARi3Wl7UwFjJYOhN1AlLVihyN/JfsBVbvJv37T0K6tSrG6hm9AUxfg
         870hsKhxlAUQdr/HBdgHnKBgO7PXAlRsS96sB0Wixfc/jAF7NvVhmUFsw0XssKY6KI7R
         AK3rETFMOXS6LJuv9CUWm4bG+K3Iv7XO0P4M0C0N02zwZUAv3RLbs+ZydSA8sL6LyNlw
         7MjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jKdocwvusJcWDjf+v4RM9Qjoh/9+oixhFLCVcNMDDYE=;
        fh=rlQHDIzzTkhW3I+Dv+UVmOhN884Mhn6UC68Z69hooXA=;
        b=eeE30e8yQQfrecdfqDtL5IF7YqYONGKZRAPNsbCptAgtOeynLecQFR6c3oqSHikx26
         RkB0+pnsu+JFrVWc3Z1cF2lIX6JRLLSLvV1S5Zg02f67bZjR7PNfBD/9EYT4dEPIY4C/
         fraBZg6EW4idVzOaDXrGEztSOCuboYyqZgqxxbrLy5MmLzurdHlQAwr1gKLHApjDoUXd
         aOSg1byYLyUPvDdGxlqvqYDNtp0tO6nGJaeo5g/e/SnYvKj8+RnTHTMo+bM0jmWE5UaY
         X5n+NNAqEm31HTUx49hSZyH56/RLF+Rq24oWAzpxtRffj3bFMLXDT/GRCAm6yppE8otw
         fXXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRTD9j4n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pb21-20020a05620a839500b0076719299da1si1587355qkn.766.2023.08.31.15.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRTD9j4n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqaR-0003t8-Sn; Thu, 31 Aug 2023 18:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqaQ-0003su-OJ
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:26 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqaE-0002o2-TA
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:26 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so2611585e87.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522572; x=1694127372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jKdocwvusJcWDjf+v4RM9Qjoh/9+oixhFLCVcNMDDYE=;
 b=PRTD9j4nwt2MYriHQeCE8WQvgKoxZOoxkrBY4GZW7EMZJ73guW4ll3yM/63Scj/ABN
 M2UHAdDcJnGALhIFuv9DnCQHnkE6xQfh3UBd3vRDskQrvIokdLMYehrxZDu/Fdu+OlAW
 rQZtNn7pPzXGOkmke9+BRhPRQE5z3bWpLoeT+lRsFxyS66YIwmbOntlJJIyMd7abEk7F
 LW+XFYnYNQGw44cvQTsoM/0HizUdvFMcw9mZIjnzLsEBthPL3j+P0tQmL64PJp5xN124
 4hMj81Ou79AnGUyR3b6XtJA0deUH31TVZsJAZykN3VR/gM2CbWJBZ1bpd0F252oxTd6q
 t7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522572; x=1694127372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKdocwvusJcWDjf+v4RM9Qjoh/9+oixhFLCVcNMDDYE=;
 b=gCbV4Se4TdM6pzrKOcfM7AYyFuBY7+vLWB7a5zO/54A0lSsmdZnXOpKfvTdfePHNDY
 W04KIrNE7zImz9pENN2SENSaA6zc32UoGSQjmH6Ba/ZyvV1EEqqBFnQOL7RA3mNfrjef
 ctN3mPBRc2M35qT/u1G6beh8i8dWSESqBEQLhRciFiPOcBGNk8BbrhfmlGpazi+OZnv4
 zd5/AHZQX/poW7w0+37dKVKoB0VOGdoOWZ8eY5jCqhL02gJ5+e+CN3ddE+SzzfMIkufA
 Ynv0S3rqIRRHu3IbStaHXaddrjgdF3vaxbCoU1+fYL9ulHcrJ2MLwknJ9yPEdbtj+ZLv
 wHEQ==
X-Gm-Message-State: AOJu0Yz5KgTpVWqMturqwnAvUiP6yyHGAkUAmfI4tEbYWJTPFRRFtGNK
 7D4XHHC7GeXyTuAEGbNb2z2oZg==
X-Received: by 2002:a05:6512:3b26:b0:500:b2f6:592 with SMTP id
 f38-20020a0565123b2600b00500b2f60592mr471916lfv.50.1693522571540; 
 Thu, 31 Aug 2023 15:56:11 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05640214d800b00525503fac84sm1324851edx.25.2023.08.31.15.56.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:56:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/11] (few more) Steps towards enabling -Wshadow
Date: Fri,  1 Sep 2023 00:55:55 +0200
Message-ID: <20230831225607.30829-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: MLnAhX34hOb8

For rational see Markus cover on
https://lore.kernel.org/qemu-devel/20230831132546.3525721-1-armbru@redhat.com/

This series contains few more, my take.

Based-on: <20230831132546.3525721-1-armbru@redhat.com>

Philippe Mathieu-Daudé (11):
  tcg: Clean up local variable shadowing
  target/arm: Clean up local variable shadowing
  target/mips: Clean up local variable shadowing
  target/m68k: Clean up local variable shadowing
  hw/arm/virt: Clean up local variable shadowing
  hw/arm/allwinner: Clean up local variable shadowing
  hw/arm/aspeed: Clean up local variable shadowing
  hw/m68k: Clean up local variable shadowing
  hw/ide/ahci: Clean up local variable shadowing
  net/eth: Clean up local variable shadowing
  sysemu/device_tree: Clean up local variable shadowing

 hw/m68k/bootinfo.h                       | 10 ++++------
 include/sysemu/device_tree.h             |  6 ++----
 accel/tcg/tb-maint.c                     |  3 +--
 hw/arm/allwinner-r40.c                   |  7 +++----
 hw/arm/aspeed_ast2600.c                  |  2 +-
 hw/arm/virt.c                            |  3 +--
 hw/ide/ahci.c                            |  6 ++----
 net/eth.c                                |  2 +-
 target/arm/hvf/hvf.c                     |  1 -
 target/arm/tcg/mve_helper.c              |  8 ++++----
 target/arm/tcg/translate-m-nocp.c        |  2 +-
 target/m68k/translate.c                  |  2 +-
 target/mips/tcg/msa_helper.c             |  8 ++++----
 target/mips/tcg/translate.c              |  8 +++-----
 tcg/tcg.c                                | 16 ++++++++--------
 target/mips/tcg/nanomips_translate.c.inc |  6 +++---
 16 files changed, 39 insertions(+), 51 deletions(-)

-- 
2.41.0

