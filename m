Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1629428lfc;
        Mon, 9 Mar 2020 14:58:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuLST1wxKvAMUZ/1Qo3SoihB5vPUWxbueYacjwUzoyXLk504xVmsYIXScNBFe14CaB70kzQ
X-Received: by 2002:a37:546:: with SMTP id 67mr16404276qkf.272.1583791114631;
        Mon, 09 Mar 2020 14:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583791114; cv=none;
        d=google.com; s=arc-20160816;
        b=Ef7a8TZJsRVZswPHSvh9Y8ricnzZ/8vC5H0AeQGmly3WmlrEQgTALpUtBAsBSimYTP
         fAO4XyXFD3IPX5XlnD+U3gE+PV9m4KDs2cXtJeljSzQRupZS6XRx/6mKpg2aHPPIdoWB
         GqsYh4irDGeG1qXRmsGpJztU+SP77ClCgj8aQ1/QzegWlg/cpatltSpW1MqKknn/c1G+
         LuHK3z3meGfP6TeQEOJINvV+kP+ioFfB+I4SR7GP7qlNWzyygI99ca4SMIlFTEIdZZtW
         ZyRtzxATXDtOpV9nrG+RKNA06I2nLh2cqfH0d/CZhuLOs+KprqTE0L8OasoLR/x4eqry
         a4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=I+5a9zEgMMFR0bDZiCYRjxV9Bygk+g13EGfEiLMSujY=;
        b=PUr8xbBU5r88OioKa1qTm5zJn1fFWxDns16OXUD/r/lPxTDJBpDeI+n4zAEeWoCTDQ
         4kmqYfG9iHeVWURHtz+opSQ+Vz1tzdSKZ9bWAOmJfMlG06+h1uzvJV4ijcnFJV41jYyB
         /C7RI/TtEw+A9RqtgO2aOkfH2eQVqR+uPIO4w1mIceqnNjfftEZihsnsl/GoLH5aig8K
         2KoAp8a4tX/MrnlTew3PnQrmQm+mO0XYjuRlHxDVJtzCIyzBPC1eFWvJkfqTNFcLuLzG
         7d8iuoQggy4xLaEPJImcW2a7jCZjKlqgkaPqP+FHlSYbGBxJsK23Ly2WS4W/7s4yBRsl
         rqcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSMFt2rM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si2988366qks.88.2020.03.09.14.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 14:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSMFt2rM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBQPx-0003BE-SQ
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 17:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPo-0003AC-1m
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPm-0005cj-PH
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:23 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBQPm-0005bD-Jk
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 17:58:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id a132so1209515wme.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I+5a9zEgMMFR0bDZiCYRjxV9Bygk+g13EGfEiLMSujY=;
 b=NSMFt2rMi1DKZ+ESjSQfMbWSAEKiLzndHEKXIUCvpzHXfcaObj11OHNMyaBsdwbsQW
 jKblpArBHezoNI88URb0UcTDaUBt6Q4od9/f6sezMdIoxTax7pPncCML7IOt2zSslATB
 1nkJ5CcowWJNyy/bIiBlEl5bQMoG0AwSuuNYxdknVVY6pYuRcYvM8qHs5eeP5PEqnXzt
 ZjwkSwdtfPQ4nD4VHqSXPBPoLjTox291yD7N9WBZEs21LYNulVj2lIZ/FQ+LZM7wrUYv
 M/nyMAtj7UiQofFisu2D6IAXv3DwQe4pMVNPI22hqlbcnqoOIYmKTwlJXLllUZw3lQdx
 WDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I+5a9zEgMMFR0bDZiCYRjxV9Bygk+g13EGfEiLMSujY=;
 b=fRl1huPKOgfn0O1OTP/+ta75dbSlu/TvG04297qifpguS7ZNSEpX3diDBFw3h+ZTiK
 uMGzXutf+ja4cA+ov6M7Jza4WW6f/a5yFQ2wxX16onIiulEMusSdVlrau+p+08Xb8ekf
 VPVT0aP2+2nd6WzuFGCdMZkqTOEvz+CsTa8ET8Qc2LjWI+y9e41/UADUJgoasJtuQ22Z
 lmpkuLDlmhfUWcwMJTAuhUgy1SEcHm96CrkCA7aJ5M+4FdUKMaec5YdLCtkzSuz9yv+E
 B9bsHcZPqkdIgZPxc66WAnHAEvBxzwDrEsCR30erfX8yynQsBNyCqKXoLIg59i8FYoyF
 sfyA==
X-Gm-Message-State: ANhLgQ3cOiWYVb2L3ocJwtPbdAHCbaDWrysD9ODROwQaaakOu4cnOWZ1
 AKvgr1gM9c4rpjUyncd39YknQy9tWogMMg==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr1267839wmh.174.1583791101100; 
 Mon, 09 Mar 2020 14:58:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f17sm42207068wrm.3.2020.03.09.14.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 14:58:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] docs/system: Split target-arm.rst
Date: Mon,  9 Mar 2020 21:58:13 +0000
Message-Id: <20200309215818.2021-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6jrwMN6Ocf3o

This patchseries splits the 'target-arm.rst' file in the System
manual into one file per board or family of boards.  It's not
sensible for us to document all 50-odd boards in a single enormous
page, and the split will encourage more detailed and useful per-board
information.

The impetus for doing this split is that it gives somewhere for the
documentation for the upcoming Orangepi board model to live.  It also
means we can move arm-cpu-features.rst out of being an orphan unused
file in the docs/ directory.

I've also added some of the text I originally wrote for the wiki as a
general introduction to the Arm system emulation and to how to choose
a board model, plus some apologetic text about how most of our boards
are undocumented.

The last patch in this series smooths out an inconsistency in how we
spell 'Arm' (there was a corporate rebranding back in 2017, so we
have a mix of old-style 'ARM' and new-style 'Arm'); I don't feel very
strongly about this but the inconsistency did look a bit odd in some
of the docs that this series moves around, and it was 5 minutes work
to make docs/ consistent on one style.

Side notes:
 (1) I still think it would be nice to be able to generate some of
this from doc comments and/or the board declaration macros; that
would be definitely not 5.0 material, though

 (2) Anybody want to tackle the target-x86 part?  There's a
docs/microvm.rst which would naturally live in
docs/system/x86/microvm.rst if target-x86.rst was restructured along
the same lines as this series, but it would need something
writing for the other x86 machine types...

thanks
-- PMM


Peter Maydell (5):
  Makefile: Allow for subdirectories in Sphinx manual dependencies
  docs/system: Split target-arm.rst into sub-documents
  docs/system/target-arm.rst: Add some introductory text
  docs: Move arm-cpu-features.rst into the system manual
  docs: Be consistent about capitalization of 'Arm'

 docs/can.txt                                  |   2 +-
 docs/devel/atomics.txt                        |   2 +-
 docs/devel/multi-thread-tcg.txt               |   8 +-
 docs/replay.txt                               |   2 +-
 docs/specs/fw_cfg.txt                         |   2 +-
 Makefile                                      |   2 +-
 MAINTAINERS                                   |   9 +
 docs/devel/kconfig.rst                        |   2 +-
 docs/devel/loads-stores.rst                   |   2 +-
 docs/devel/tcg.rst                            |   2 +-
 docs/specs/tpm.rst                            |   6 +-
 .../arm/cpu-features.rst}                     |  12 +-
 docs/system/arm/integratorcp.rst              |  16 +
 docs/system/arm/musicpal.rst                  |  19 ++
 docs/system/arm/nseries.rst                   |  33 ++
 docs/system/arm/palm.rst                      |  23 ++
 docs/system/arm/realview.rst                  |  34 ++
 docs/system/arm/stellaris.rst                 |  26 ++
 docs/system/arm/sx1.rst                       |  18 ++
 docs/system/arm/versatile.rst                 |  29 ++
 docs/system/arm/xscale.rst                    |  29 ++
 docs/system/target-arm.rst                    | 295 +++++-------------
 docs/user/main.rst                            |   8 +-
 23 files changed, 340 insertions(+), 241 deletions(-)
 rename docs/{arm-cpu-features.rst => system/arm/cpu-features.rst} (98%)
 create mode 100644 docs/system/arm/integratorcp.rst
 create mode 100644 docs/system/arm/musicpal.rst
 create mode 100644 docs/system/arm/nseries.rst
 create mode 100644 docs/system/arm/palm.rst
 create mode 100644 docs/system/arm/realview.rst
 create mode 100644 docs/system/arm/stellaris.rst
 create mode 100644 docs/system/arm/sx1.rst
 create mode 100644 docs/system/arm/versatile.rst
 create mode 100644 docs/system/arm/xscale.rst

-- 
2.20.1

