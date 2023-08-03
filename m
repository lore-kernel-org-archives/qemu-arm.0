Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1300492ejb;
        Thu, 3 Aug 2023 13:48:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG2+tTnPapA9Gt52LY9TZio6Tqsp1C8TFbAp5v64cqheMEOnQfMcgp8OMFtm72cddEnZ35z
X-Received: by 2002:ad4:4532:0:b0:631:f9ad:1d43 with SMTP id l18-20020ad44532000000b00631f9ad1d43mr17230838qvu.14.1691095727003;
        Thu, 03 Aug 2023 13:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691095726; cv=none;
        d=google.com; s=arc-20160816;
        b=uOx56hJ1eZoX3BhxiY5wN/KYFcOXtKGO76g5GrFovzRkl100IFbiF4lcROOOBQWtYz
         nR13hJuyYeUK5ppy9pOp2vCZ+F1iHJU2HyxduIQjrqhN/z22OCQYmtcQphIrifRc4SZh
         fUkAmQ3mGdNtnE1kxbkrlQxcW6w+HNmxN1RwoRQVdwqNwupulFwDm5ZX50ShvLDdo0iI
         XgL8p/Beir9LEsMXjwgyAEl1QF9arJ+myonExhjcBlrdKXSzBk4cLr0xD00oModSE47Z
         XCVaFpFlAgsc8RwCr46cf32DNwF4xP0XvSJCDUSM0X65U+WZRappZdo2wxHnxMMpUFXz
         ylpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=GjVSThr4RD7dg8wHaAEM0iExWRet6t95weKHsaT3CSc=;
        fh=3YX2FLhfp8hpQuq6U4NvJqSZQbJwH2TJMLdsjSwG+n8=;
        b=hh90QsxzY6bRaTlKyveKL6PPfye/eI0YhhDza80quVSQYU5mOCTw3BT5IQ30MGhi7r
         VmL12t5OtEY2gPyBPvFYy/uZLHMS8KwCOQjAxKVRfzhfo//XNtokXUW6NPBkAyGHglV/
         QzivNpgGNig1NOMO9CmyrachcpoOZVj9TYQDZn48YjmnlyBjsufi4+uns8iW/y3tbVzm
         e5tkYCV1VXN118OZXEkPut549xLODxYHVgHVzWP+lrjyYNczq5zmryPVESMGlPWNDJK/
         DrW0W7/Vp5yeZYD69ydUjJlm8HzMeVfBk+fyhiZlVzLP6viZ+t0sRhvysfICZKGMFx2z
         +4cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=ZHQy3I2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d28-20020a0cb2dc000000b0063d44639d86si270034qvf.338.2023.08.03.13.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 13:48:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=ZHQy3I2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRfF2-0007Xb-7A; Thu, 03 Aug 2023 16:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qRfEz-0007V6-RQ; Thu, 03 Aug 2023 16:48:13 -0400
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qRfEw-0002ST-UU; Thu, 03 Aug 2023 16:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691095684; x=1691700484; i=deller@gmx.de;
 bh=ac1ukUecfoycAeGhk8cQXbAiIoP0bHzwZ9wJgg2qbh8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ZHQy3I2vTJltPS+stKKtNWoek/7S9dxf+On9DpajJwwuR0BihMWizA7ya+59fucGGDHy+E6
 EqhXW72ikbYuLLd8bBhKLU+5zkt00+iafyne89TwaCm6H1Ki3TvAHG1jvDnXw+ERzI9GtxE7B
 BjpTG3Uk9LZQaGhCTwYEFbFAZrE98QmmLM/ddIOix4dbgH8FBBWg+tS2foEWiX0SfpvHLQKTv
 h50axvZ3otZtjkuZinkMAroYFCsPnYb71/4a8jRUvCIRiJnq0DqGRhjQPpyXAvvV5B9NqsiiD
 MwJnFICz5aFS2alQQZ4jwHUuIJTv3Y43W7HC78/4xghhkma0f7EA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.147.53]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17YY-1piGQo0wSw-012ZOd; Thu, 03
 Aug 2023 22:48:04 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>
Subject: [PATCH v3 0/3] linux-user: /proc/cpuinfo fix and content emulation
 for arm
Date: Thu,  3 Aug 2023 22:48:00 +0200
Message-ID: <20230803204803.639733-1-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:akHn+ewWj2nmY1N4aet0ampghAfRugoANN2sLRCTr16he26c6Ht
 p81Xqzn/uSbvwOxOJkkG7z1kk8wuBqKQXR90pUvBXL/jgDwOCTZjVxZvKEb/N3q9frbgZEY
 epDiGQGMi+YF0/ZAJw72xfl5TCu1iex9m4LJSg+KWfQ4nz4k/rYhrpyISaT8m34JvyYd6mO
 oTEtcinMxYUukW0+6BqtQ==
UI-OutboundReport: notjunk:1;M01:P0:B+lS3QFiGGg=;ujurlXdhBCc+8WcADqlrecO+d6D
 uXRt7UNUWiM8b5XgriBwxINeA22n0h8tFaZtsQa3P8IcYB2eUNEU0edL5p8HGhFa21DnMEh2r
 OEtNI7zDfOirRF7Gq5qKsBhFHuWb96dPKbDYU7T2IYCbZnshc6LK1Iag00nd/aNuobX+BT9wV
 hBgi0aWh4PGaCLwGSUrlB0K/sbzvXAraOKMc+g25r420ig7T8wYoHqhKGvxiURJNIOpsS7WnK
 NeeIj+ouuWk/GeyEZPcSQ3XS2fruBSVs7J6XAtAu8Da4Ep1fAkaVU2GXsbZwDaneEKZxeDxA3
 fbtXaSNrAVwERm0SrLDSVdbxa5ZjH/P2DG6GPBWHHVADIaBTxMWPWgK586AhNyXwAfHievx4J
 UYlk5ksTmUOwHBeeFglLjWTN9b1IcdBpom76DSHXC6TNJ0ODtdHwGz2a5EbYEEgIMwXh9F4Ih
 BhoyzKw5DFEnnHetvAhXppnR9A6780ohr5XFzEu/6cAPS1sPPWnOUyAycSviAiYjKdHh74oWD
 Q8azS3PS0+aCI/uOFvnOxaRcT71rAaRrLQzzk5uRdfuT1KuY+P5n1PZkpgoBLxQ1b+jUuLKtI
 yg9Bu889GdzM+mlIW+4dHKsSTUEeoTfZFvLe6jVdsqO1+U8zdOeQlN9KH3EWlggMFlPJE/cDY
 P8Sn5TpYlC4F2Rhlste0QbIhAYCTZkQVs8U8or3O5iFvomZiKyRPaTBXaA9+SPBXy+cRZv8dS
 gAuSnKovAZ4vfrr92Ux6HWjbsd2qLWt93oR/pL3HKZEdAV68kX3Rqyf9ov8yT8n9fB57h588y
 VGwXl0bdyPAjVUkRSWtXQsJXHeO+miB/WYW6fLHaAL4F7VjeZEWT0OJx25dbskoplWuWEiI5m
 NH1hFhfmCX9hWtS2Mg8tQ5DPrp/krhRgHR997rYscHnSOvO///O7QixGu12XctQ/VOMpeo36g
 Bt55sfgsYMcaZ0LSrpf7iCF//mM=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RjaismREpHC4

- One fix for correctly detecting /proc/cpuinfo access
- A new /proc/cpuinfo output for arm/arm64.
- A new /proc/cpuinfo output for Alpha

Helge Deller (3):
  linux-user: Fix openat() emulation to correctly detect accesses to
    /proc
  linux-user: Emulate /proc/cpuinfo on aarch64 and arm
  linux-user: Emulate /proc/cpuinfo for Alpha

 linux-user/elfload.c | 130 +++++++++++++++++++++++++++++++++++++--
 linux-user/loader.h  |   6 +-
 linux-user/syscall.c | 141 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 269 insertions(+), 8 deletions(-)

=2D-
2.41.0

