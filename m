Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3385731lfa;
        Mon, 26 Oct 2020 18:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymiBwsxda9T4E8gfGhzlPOruJXsBf/EQPGhySsKxnHpd7epdtqA8kdlwkhZIYHbNuHnNA3
X-Received: by 2002:a37:c8c:: with SMTP id 134mr1564qkm.53.1603763999678;
        Mon, 26 Oct 2020 18:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603763999; cv=none;
        d=google.com; s=arc-20160816;
        b=bevc59Monrgifkva2uVyQtm3k521AHSCNaNmAGyT6wu1kYRSgjMmKGZglw0Hl4+cTW
         w0BpwNtush65bYNxqKG15sXu3FcRx+57IqDas78yMbs+PMde2VDh9KYQrqmCiUl5ee3K
         iFARkyt9DOglyU/ha04xlTGq0YvCrA2PG3h6UuXSkBLqjHfwy7kTjZM7Bnq4OyYGjBwg
         c1mM6jP5uQkhFLkl2jUC8Ic11fFv3QDgPIthZszraBOiIczShuxdPuasqUkix1qi+Uwq
         4CewnpUntiXJwP8grMv5ec6en0SvV3kCY/WYwV3nCG+MJrnw+WdlH+qLD1ExdFWbdHFT
         y9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=P73OfQ/GabEbetkpZWCyqL1d/D+m78Hvu8J2m1tjPOU=;
        b=I6AnJvIbbXvqFA+KlmFOxIlD0Uky3bDkjHL67ZzHhKSqsr4GuiFTKV3jAceb8WKGoE
         YO9EHeLPYmHnjbE3UBBEcqkhnUJHlkBlEib/uZDlcNbtSxWOzPDCCVLJ6u1ypNHO1qaf
         Uf0OxRybN5ud7NgIStVstIbN4NcRmZJ+7SYecSwiaSro4yKsuqkBn86PDmkM3i6A7KBY
         hNfhaEewwS8blhdnxvdwMNLntpZMTy5JVkAakVheGnlUQFifeGlTiq47e37yCIHsuhm4
         N7XqdUu0/Esa4YSjbazZWX5Yx5SNV5SzaIQYScUizC25kuY9HlIgxdLgBrOryDV38eoF
         k6eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJJHCxFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si6502538qtw.8.2020.10.26.18.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 18:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJJHCxFZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXEHH-0002Pv-4J
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 21:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kXEGq-0002P3-DL
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 21:59:32 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kXEGo-0000zK-Lz
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 21:59:31 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id t6so5341732qvz.4
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2020 18:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=P73OfQ/GabEbetkpZWCyqL1d/D+m78Hvu8J2m1tjPOU=;
 b=FJJHCxFZ5q7OJ5/uMgu/JxtkzMwjMRkwqCq020VzCzd0HoU9bXyxFbhpnKae8iUIrh
 bgitjZHZX6nShY4K+BcD6cZKMGBc6Yo2CqdZcxQ4KF9GrWNTFzde4cUmP9usNnjJTrQk
 giPZJtvcdL+wSvv/+nB2q2yU/aZmxueWYt+Ps7eWPmYuytbtEoI6s/0I6BUlMU3Vfjnw
 1MGM2u++O8uCkollIbyb7wufu/BzNOyms4F+rnGauqLYt0yT0kJo6drNyJzI2FE+Sr9c
 5Vz/OjyPZwcnu8r1kV0pYOvpc2BZxQuItyZgvOm5NdCLMBBhCwFw+kgOjweA/M/nvQeI
 WVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P73OfQ/GabEbetkpZWCyqL1d/D+m78Hvu8J2m1tjPOU=;
 b=VWewkuSQZsFnc0DOkE+XVCbSttGIv8WRu/Ad0+Up8DB5/uR+0/Se+2CxWAbgXskqJ2
 2RnhiWHwF6RGsPfVcQ9rI46Jdsjg363ND/6UHHIgcaL9wp99fu+bSOFMj/z6dnFHDSGX
 q/59qYvtvhABgcDTl/WDeUuz11WS7AazWKtH1bZNJ0PDiYArCfeZN5eIKE1x5BIrmsGa
 lqrKvRPnYWM4qbi6wVn9b6neR7p3EK5D1r/b4/LRcjDAon+SNuOxppkQv/bWmjsIzULn
 E2NBwKqtDsE5a9HfeYq69EPBXqQhQFRzEZ9xIOUuOibJ/1EgffhVjuQcubMvmbhfR8+O
 I/SQ==
X-Gm-Message-State: AOAM531RDuwW0+FPk4azUkxmbJDXYXGNJBWSeNI1uBEP7fK3mg3EjoB9
 SSc3H/GHHLm4zprBMVSOiR0jig==
X-Received: by 2002:a0c:dd14:: with SMTP id u20mr31526qvk.56.1603763969259;
 Mon, 26 Oct 2020 18:59:29 -0700 (PDT)
Received: from localhost.localdomain ([142.114.143.244])
 by smtp.googlemail.com with ESMTPSA id 61sm19317qta.19.2020.10.26.18.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 18:59:28 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v8 0/2] Add watchdog support for SbsaQemu
Date: Mon, 26 Oct 2020 21:59:25 -0400
Message-Id: <20201027015927.29495-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m+P3l1IY98xn

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM SBSA v6.0 and then used 
in the SbsaQemu reference platform

Changes in v8:
- cleared irq also along with ws0 clear on each explicit refresh
- addressed additional review comments

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                  |   1 +
 hw/arm/sbsa-ref.c               |  23 +++
 hw/watchdog/Kconfig             |   3 +
 hw/watchdog/meson.build         |   1 +
 hw/watchdog/sbsa_gwdt.c         | 293 ++++++++++++++++++++++++++++++++
 include/hw/watchdog/sbsa_gwdt.h |  79 +++++++++
 6 files changed, 400 insertions(+)
 create mode 100644 hw/watchdog/sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/sbsa_gwdt.h

-- 
2.18.4

