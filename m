Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3322206lfq;
        Sun, 20 Sep 2020 10:58:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp7fhdqG8vSOCmTIj6X5NqDXeZoNV41I2NeqSaGXCFSXhISZCJYMO6L+fEnm14/F88l4AA
X-Received: by 2002:a25:ba11:: with SMTP id t17mr53507670ybg.107.1600624731240;
        Sun, 20 Sep 2020 10:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600624731; cv=none;
        d=google.com; s=arc-20160816;
        b=cKQ7XVqXSXE0xeNVjj4rplu8tocr9xhcg17aEAFEOHyXks5EtaBSHuulPEPv3Jm5Pc
         cIxfEaRYVr2r6b2r0EcC6piatkr5R++TGutezwst7piwmeELs/tmVFsj/G9D+XDadpy6
         Y+CD5+5SXVGnFS1qwfshwTgyXe/VtiMxz7OM03TY45B4oeDuRhYHIxomFqa8wgL4ehVy
         fFXXTfJ6wjuMaOjvX8fdHakXH78K4fva1tDZykEuuWgPUTMwv598xEs3fFh+JmaaDH6i
         +YgmgIac1ZVkz1hLu0EBK+QL7O7oCKLgvbCKjceUVC1FdjtJKEi0+SsX7jWcjS1TAgNE
         7JTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/VdMmIK1mFI+lDfNuHVDrs8UFSjcbDwK40S9cUUzWDc=;
        b=CMRJBdIG0NbGzMFFknI4aAjfhxUslw3xn1WywQACzyFRvWz50rVXfR2Gue4X6KZCYU
         dMDRmp2wOmZa7ATroJxc/ktWvNyjJ0yv3kINH0UdmP5KS/jG2h6rKYeeTopGUjJqZ2GJ
         Q+xLGWgLrW+e5ww15sB4kylcIJOzLATyHnJ4s2I1lS2sVIysYKUIdZ1ZNxGuJ1L422vB
         3O/isFP+DHdhJHe1SaNNkSFrO1bG3ULoNafA/TeIJN83baz45s1AVLKW7no65ek5X714
         PwJDcAFQaGiI+sHlr7qcvzLh4Y5QEh2sIxFi00cMpAVkwVAGpAaV1cweIRBmqA9zsHlY
         dXAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QRJIXjim;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si10162633yba.144.2020.09.20.10.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 10:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QRJIXjim;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kK3bu-0001u4-K6
	for alex.bennee@linaro.org; Sun, 20 Sep 2020 13:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3bc-0001tE-25; Sun, 20 Sep 2020 13:58:32 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3ba-0002zz-Bj; Sun, 20 Sep 2020 13:58:31 -0400
Received: by mail-wr1-x443.google.com with SMTP id o5so10418617wrn.13;
 Sun, 20 Sep 2020 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/VdMmIK1mFI+lDfNuHVDrs8UFSjcbDwK40S9cUUzWDc=;
 b=QRJIXjimYc9U2s41ONtTcXuiMRx+V6+rtPb0+muIpJIPYdSGU4oKuHx5h6fdNgaMLq
 J/+ajSX3AgjLaRo6CwLywBK9/Np3Z14K6yZpD3czkcz3CQQUUezBnQG2E9qnZL//pD9q
 /JcS6VEf/DZ8vL/hdhzumbznWxDcXxk6n6Dg0AG8yqfncVE7wgtBzwLUv4CfieeRpjSt
 /l0bOl0RPot5T12wJyfKPOYTRIf0qLsZ3KdYvSZqDSy7dDlgKPc2W+QyyyavmB1lpzdN
 8jnFy4iD0oXIs7uP2QUZArJCcqRy9mlrq2MAZ7uIbHHshtIfhbqw+flniQjOsjorDz+9
 7LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/VdMmIK1mFI+lDfNuHVDrs8UFSjcbDwK40S9cUUzWDc=;
 b=DFu0BTv9ixg1/UxzrCf60egopt8INfWzK3pKmhEUuQp9Pv3ncPJ/5tNuJ8ceD0eUlI
 +qBtrtU07K8OajReX9cjdri+jKN5RwrIFDS0h4oE6KM972hK68162DCsBBolm9XvOaQw
 z8FlJzkOiMzPWHZa2nzYqmCucaO5c1RLUpuzkho5LbapcPGwa+q3lEVBeHtQyRwZpc3T
 /uHKb8939KyTPo6O6NZkGLlhAeA4J5LPPbMpmdy7iYYv5sQztHhiUEQ1N/0G/MmlhI46
 wwP2J1OMxulTo7hNrjpZuDTTKt572lOURW9UEhj03Ln7mMhk2x+/0kzDNkzhMug6FptJ
 8f1g==
X-Gm-Message-State: AOAM533KsaC2+F0dZdxPRfyS6Bk5QitsHq2dP/9EWgT/DN8kg66ixGqt
 k+MEz6CFcybdexX0fIlvjHinmivg4Tw=
X-Received: by 2002:a5d:574e:: with SMTP id q14mr46669203wrw.281.1600624707731; 
 Sun, 20 Sep 2020 10:58:27 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u66sm15675781wme.12.2020.09.20.10.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 10:58:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] hw/arm/raspi: Fix SYS_timer on Linux + misc changes
Date: Sun, 20 Sep 2020 19:58:18 +0200
Message-Id: <20200920175825.417680-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d1Pg0frUH31C

In this series we implement the COMPARE registers of the
SYS_timer, since they are used by Linux.

This fixes the hang reported by Niek here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg682090.html

Few trivial patches used while working on this added.

Philippe Mathieu-Daudé (7):
  hw/arm/raspi: Define various blocks base addresses
  hw/arm/bcm2835: Add more unimplemented peripherals
  hw/intc/bcm2835_ic: Trace GPU/CPU IRQ handlers
  hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT definition
  hw/timer/bcm2835: Rename variable holding CTRL_STATUS register
  hw/timer/bcm2835: Support the timer COMPARE registers
  hw/arm/bcm2835_peripherals: Correctly wire the SYS_timer IRQs

 include/hw/arm/bcm2835_peripherals.h |  2 ++
 include/hw/arm/raspi_platform.h      | 51 +++++++++++++++++++++++-----
 include/hw/timer/bcm2835_systmr.h    | 17 +++++++---
 hw/arm/bcm2835_peripherals.c         | 15 ++++++--
 hw/intc/bcm2835_ic.c                 |  4 ++-
 hw/timer/bcm2835_systmr.c            | 50 ++++++++++++++++-----------
 hw/intc/trace-events                 |  4 +++
 hw/timer/trace-events                |  4 ++-
 8 files changed, 111 insertions(+), 36 deletions(-)

-- 
2.26.2

