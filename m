Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1443545ejb;
        Mon, 4 Sep 2023 09:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERZvWqc+aWsSITOM7UB4838uF92oRLVQUw954V1hmncJ6fN6KgFafaU024MuHR+2OHY95c
X-Received: by 2002:ac8:5c96:0:b0:412:8bb7:25aa with SMTP id r22-20020ac85c96000000b004128bb725aamr13545983qta.2.1693844006115;
        Mon, 04 Sep 2023 09:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844006; cv=none;
        d=google.com; s=arc-20160816;
        b=crHrw9JKeWrN+b0EMSOkWfszobjYUd4eIdoPyakW0bGvWmP0X8AwNsw+jlk31NEHJn
         Ox/oED7pOL//xiyCCr3/TQZDhAXCPJQeC06gXuUbYcLxdcQtOB8vVt8GhvfDOpVlWD89
         Ojpk7tmdV3rZxupLNz1zn2b8UH0YM17e/f5G8D/4uKEAEYWTKdSdLPbqF6CK7OgR+HYp
         Tu7XM9nq7EjGyU1wm4MmZ8ZD/HHOiAz9vo/KLuLBnHIXAbIrsnHBLydvMcJO9olxK7w8
         qzMPYLhgfw3zrDxLvVwPN7zU6wHgsXA//97h5tgGqm0HBBJ2mJVbqiRK0MXQeCBEG2mf
         1kYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yq8FYkdbDvoLNRHuC4AycCnU/bFGlRwAaDJitxv4be8=;
        fh=cwenUyNIKJUsdmBlesGyzJhuy5RRyVRyje4dsGoNSbw=;
        b=WqPdxgvRxBYdg9WEiqxuYGMjXZUTUzhQiAJNxpHhB4Wpikot71yVEx2LXuJtTSt499
         G/jSFhSWcetmfTAAbZ5bO4JSubd04n25SeS/C7Tf7e6W/I9MOOu8aaoTWPLo4HmHq1tW
         I1NtK+yG9TE01slY5GsxP4WvqwIGU6zsZJ8EyeRkh6M5TqnokLkDkNU+kSOTnHXWl5P3
         cs1V3pWRCdkeUFncQE8DUxLqpAtIojGDz7pYmKO7JVFtYDulluQ4pHrwwA13MeSn9vq4
         Yp0qeRhsrl4sMwA/nCxACVjzo70SxpRVucbCIJQMJTAHD4p41gndYZPeQ1XT0SoF9RzV
         BF6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RE5dZhf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020ac85d86000000b00403ef5890edsi6783073qtx.680.2023.09.04.09.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RE5dZhf4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCBy-0002FS-5M; Mon, 04 Sep 2023 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCBv-0002Ea-Rx
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:12:43 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCBs-0007Ph-DO
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:12:43 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso220234366b.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693843959; x=1694448759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yq8FYkdbDvoLNRHuC4AycCnU/bFGlRwAaDJitxv4be8=;
 b=RE5dZhf4U6vcHmdaYlfT32glp+hJ7F7hAQbkEOiSIzcsSLLF5rFavv62EXiRGnpEnY
 NHYa3JUYHuZLlxhElG1n4cm1xRuMcbdmb3xFkXqEtMT1ph6tsRfinspxxubtTbOwSCyO
 CBeNhwq10DtXAJrehwyi7O9pAraddrYWju1GqYDgSwI5WFiq5hR2JgTmXv4XhVf99USB
 az5fXlOPmNBl81SjgjQYNsFDJCoBGjriH5tTf6/4ZZks5lL9KidUZ7GQbBf1zMxAaw9P
 k6Kq0YiSrcvjqC1Ss+5cmBpmVtTqpHPfp1+SjqrETo9KMkAcvQchHCao+0wwEgBss94w
 sJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693843959; x=1694448759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yq8FYkdbDvoLNRHuC4AycCnU/bFGlRwAaDJitxv4be8=;
 b=BKdfwxEWCoGjzFbCLVyDxx8Y1e4uK26JaL8KOnx4/D4KCbFgRwNCFHhJ4nSuvdSmLm
 24wRG82PwOhc2A9iiJ5C1hsii8FQEjn5ND97iO/ZrdMICt8jZhKmz+WXL3t+s3ysjsXY
 EN5p6YnJ9sKyUHA8wC8u8xVP4KsY8cA7jUSK6hdyWsPNhB/cxEk/2qMHBolVLcyjfYCD
 Bepeb7VUuD4QUywVV940/jzecdKtRsjPJweWadBSWJC0Ci/BsQj2ybv/A01uavsy+JFo
 OvwNwxOThVpcGUjyAvH0ObRf/88KeZQSVAXw4gVD+yzdD9hxQrN37f1Gefc97ZA5WncT
 XN8Q==
X-Gm-Message-State: AOJu0YwsJgEND+maqMEyKFi4FBGDS6vqTQYhrdHj2q2S7h4md4ZAHgqz
 Pz5AkBcDuljAk8G/Oq2tW2fp6w==
X-Received: by 2002:a17:906:5393:b0:9a6:1560:42dd with SMTP id
 g19-20020a170906539300b009a6156042ddmr8732121ejo.51.1693843958457; 
 Mon, 04 Sep 2023 09:12:38 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170906940600b0098e78ff1a87sm6339544ejx.120.2023.09.04.09.12.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:12:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/22] (few more) Steps towards enabling -Wshadow
Date: Mon,  4 Sep 2023 18:12:12 +0200
Message-ID: <20230904161235.84651-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
X-TUID: i4vMUOfopbrp

Since v1:
- Addressed review comments
- Added R-b tags
- More patches

For rational see Markus cover on
https://lore.kernel.org/qemu-devel/20230831132546.3525721-1-armbru@redhat.com/

This series contains few more, my take.

Based-on: <20230831132546.3525721-1-armbru@redhat.com>

Philippe Mathieu-Daudé (22):
  tcg: Clean up local variable shadowing
  target/arm/tcg: Clean up local variable shadowing
  target/arm/hvf: Clean up local variable shadowing
  target/mips: Clean up local variable shadowing
  target/m68k: Clean up local variable shadowing
  target/tricore: Clean up local variable shadowing
  hw/arm/armv7m: Clean up local variable shadowing
  hw/arm/virt: Clean up local variable shadowing
  hw/arm/allwinner: Clean up local variable shadowing
  hw/arm/aspeed: Clean up local variable shadowing
  hw/ide/ahci: Clean up local variable shadowing
  hw/m68k: Clean up local variable shadowing
  hw/microblaze: Clean up local variable shadowing
  hw/nios2: Clean up local variable shadowing
  net/eth: Clean up local variable shadowing
  crypto/cipher-gnutls.c: Clean up local variable shadowing
  util/vhost-user-server: Clean up local variable shadowing
  semihosting/arm-compat: Clean up local variable shadowing
  linux-user/strace: Clean up local variable shadowing
  sysemu/device_tree: Clean up local variable shadowing
  softmmu/memory: Clean up local variable shadowing
  RFC softmmu/physmem: Clean up local variable shadowing

 hw/m68k/bootinfo.h                       | 10 ++++------
 include/sysemu/device_tree.h             |  6 ++----
 accel/tcg/tb-maint.c                     |  3 +--
 hw/arm/allwinner-r40.c                   |  7 +++----
 hw/arm/armsse.c                          | 16 ++++++----------
 hw/arm/armv7m.c                          |  2 +-
 hw/arm/aspeed_ast2600.c                  |  2 +-
 hw/arm/virt.c                            |  3 +--
 hw/ide/ahci.c                            |  6 ++----
 hw/microblaze/petalogix_ml605_mmu.c      |  2 +-
 hw/nios2/10m50_devboard.c                |  4 ++--
 linux-user/strace.c                      |  1 -
 net/eth.c                                |  2 --
 semihosting/arm-compat-semi.c            |  9 +++------
 softmmu/memory.c                         |  1 -
 softmmu/physmem.c                        | 10 +++++-----
 target/arm/hvf/hvf.c                     |  8 ++++----
 target/arm/tcg/mve_helper.c              | 16 ++++++++--------
 target/arm/tcg/translate-m-nocp.c        |  2 +-
 target/m68k/translate.c                  |  2 +-
 target/mips/tcg/msa_helper.c             |  8 ++++----
 target/mips/tcg/translate.c              |  8 +++-----
 target/tricore/translate.c               |  6 +++---
 tcg/tcg.c                                | 16 ++++++++--------
 util/vhost-user-server.c                 |  2 +-
 crypto/cipher-gnutls.c.inc               |  4 ++--
 target/mips/tcg/nanomips_translate.c.inc |  6 +++---
 27 files changed, 70 insertions(+), 92 deletions(-)

-- 
2.41.0

