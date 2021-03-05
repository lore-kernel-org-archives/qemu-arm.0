Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp599053lfg;
        Fri, 5 Mar 2021 10:47:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyQpCTUoM5T8P/PSaYVN3xyomaFKWGo3oczMvl0b30dBOcI1cInhHss/2/LwOAuHX0HqNa
X-Received: by 2002:a05:6602:2d04:: with SMTP id c4mr9616782iow.182.1614970040462;
        Fri, 05 Mar 2021 10:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614970040; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcwMHbDICq4+Va5L5i380iKbolfiD9bGb5VMEYaoVI6m7qw7SE9Fc7vsf4Wy97SOYY
         8NaRq4X7Qo1Y9eyy0ewcYDc1ibsuracCrr4Z1NqLSi5TvoM6wDwHYXD0Lu5uSPhpKAcB
         HsKheyVzetju+fSEsPJLYFUdRUrQloTD6fWbRKQW97X5Jefh+g18xTrrkI9YUGRVL2LU
         7ig3Tbb9oc+PLMOfqqmRAh09gq/7hUEmGQd36tQWva9hR4RnF4iq81kGQ2U07RE8eXax
         Ud98q/c3LEr4J+eechOE47aOOHwFshP6DA/+vGL+8KTz4sZzWDGbT2sfw3YamNH/1TdO
         Kl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:date:dkim-signature;
        bh=Nk7lxsUa75dhQmQF0/5Rl+mVDMFdt+RD2Y9tLIMQ+ZU=;
        b=O8cJI/ef1Bx99WhcM979jmGEw/vSUpxNLGW497cfYnResz9gh3MExE6jzPi9ov7OSl
         J5aIuXoXElo6ggIVmWDqdZCcGZ8GoueLCI7VD26I/RySsWkk4RceStFibT+qYErROcc9
         rLFv8qvy9c6/vuFTOCCEIl+tqBcff/y3vEkIKclqP3tinOs8unrBlfGTDg91Iy7gRoBR
         K3fgWTqM7MSu2vgDZy2iz+pdR31A3RaShvwzbWZIhvbmZtBFSeQcfPwCTS0UIDLrGfPS
         zsVb64QPNaguvRcDDMO4h2y7Ee47vNlM/SITRd48HQFEAKfKvmFUOWDx7SqkbafhY7qu
         eeyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=uj++KYI3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si2791874iln.49.2021.03.05.10.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 10:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=uj++KYI3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIFTr-0007i3-NR
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 13:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DXtCYAgKChYIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN7-0006gZ-0p
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:21 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:48360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DXtCYAgKChYIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN4-0006yk-0Y
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:20 -0500
Received: by mail-pg1-x54a.google.com with SMTP id c30so1897232pgl.15
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=Nk7lxsUa75dhQmQF0/5Rl+mVDMFdt+RD2Y9tLIMQ+ZU=;
 b=uj++KYI3cO26JBtNK9OaXQyniXl6bFpMc9r6aiIaRteih49KeNGj1yRLzNnsRfj7lz
 pI7XkUhJEsXnWu5M6eY7yysnDyVDLeTYwoO0qYjZoK8JjaQmBDG+c3XwsgRZXrEZ49NK
 KQMJFV2hoEt9W2r/tFqkJWbJQUQC9l1n6RqbPS5O3FY3pSDxF93Q/j5lJqACR79Si3Gc
 Ae5/fkMlKIWMrjsVZjHRa730a4tyHlMH6zHPC8rQWrAzYK1v36MrC/vX8lQ6R6VEcevk
 x3/33TcgIi8jiyyjWZpg7q0tLFNv03ChNeU76uwcBNIcfxbrngcA7F1mVmSF3K5an59x
 e1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=Nk7lxsUa75dhQmQF0/5Rl+mVDMFdt+RD2Y9tLIMQ+ZU=;
 b=h+zp13CMjoqTOqr4TGgsppNwykEC0JKNjpCRo9F8lzh1GAf5pe5RSN7+EX32a2tpsE
 b3IINKVC4J6PCvXZ/qg+6SE4V1jPkFwJeELn1zmJ2YEYM9s9Tr9/rt7gn8DgBVnZx9a2
 vIlmb7LHVuzDqz9soCSFdfpVaGp3/44IQtznZtnZPikaBoZCKGStaWrCPbrbEOZb2TQx
 POzeSN6G0p5FdDiQnYm58rHlGyrGcWIGJt8uqZFlgyqn6lT8vPZYglugE8WOKSykh7BT
 /TIMhZNYPL3rRbaHCh+H2UthmlSMgiJnyq4k7YkFHIV3LWhM+nhk2IJN/HefFSTR4oSI
 47JQ==
X-Gm-Message-State: AOAM531lm0iZi50tjFhpJqbVfbCSC3CwO+lZQyOE4vnPpuY2D8t0Dgr/
 ccC7TD81OV6EjKPfgUJ+OcKJbFp35fxoWw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:30c1:0:b029:1ed:a487:4253 with SMTP
 id w184-20020a6230c10000b02901eda4874253mr10313559pfw.3.1614969613749; Fri,
 05 Mar 2021 10:40:13 -0800 (PST)
Date: Fri,  5 Mar 2021 10:38:53 -0800
Message-Id: <20210305183857.3120188-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH 0/4] hw/misc: Add NPCM7XX Tachometer Device
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3DXtCYAgKChYIG3wAFE32AA270.yA8C08G-z0H079A929G.AD2@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>
X-TUID: Pvqf9ZDlWyR5

This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
the RPM of PWM fans.

To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
into the MFT module.

The connection of PWM modules and fan modules are derived from their specific
Linux device trees and coded in hw/arm/npcm7xx_boards.c.

We amend the QTest for the PWM module to include verifying the reading from
the Tachometer is correct.

Hao Wu (4):
  hw/misc: Add GPIOs for duty in NPCM7xx PWM
  hw/misc: Add NPCM7XX MFT Module
  hw/arm: Connect PWM fans in NPCM7XX boards
  tests/qtest: Test PWM fan RPM using MFT in PWM test

 docs/system/arm/nuvoton.rst    |   2 +-
 hw/arm/npcm7xx.c               |  45 ++-
 hw/arm/npcm7xx_boards.c        |  99 ++++++
 hw/misc/meson.build            |   1 +
 hw/misc/npcm7xx_mft.c          | 541 +++++++++++++++++++++++++++++++++
 hw/misc/npcm7xx_pwm.c          |   4 +
 hw/misc/trace-events           |   8 +
 include/hw/arm/npcm7xx.h       |  13 +-
 include/hw/misc/npcm7xx_mft.h  |  70 +++++
 include/hw/misc/npcm7xx_pwm.h  |   4 +-
 tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
 11 files changed, 975 insertions(+), 17 deletions(-)
 create mode 100644 hw/misc/npcm7xx_mft.c
 create mode 100644 include/hw/misc/npcm7xx_mft.h

-- 
2.30.1.766.gb4fecdf3b7-goog

