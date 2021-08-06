Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp742560lff;
        Fri, 6 Aug 2021 16:49:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxESHd7dKSQB6y3I7cKT4npalT9HBnmlkB0UjniKt1rT6CjPvdR0O4yUqgcStKhxBeFe+jG
X-Received: by 2002:a5d:93d1:: with SMTP id j17mr338650ioo.123.1628293780558;
        Fri, 06 Aug 2021 16:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628293780; cv=none;
        d=google.com; s=arc-20160816;
        b=gh3WOJxDwIFOLS9iUKwrQwHQKv50Qv8lDken48M1MLgHiuaSMeY57NFJx6300aK90b
         rAukk9vOsd5D4FAiY+8Gdhiq1OwlbsA8BUwj06nYLFNXyvxFGcKuhGuBNbBgpHSl6tQl
         Zo01CSmH1oflJS1OHWTMIONVHjG6jJpCkCplCaYouK22FLgbFXPJAbvyyS5Wo/oCuOgo
         Rc10XWlpmc5x6ykv7ZRaC/WoOzJ7LHyl7y3mVaeDKbNL2fpTo8tyjXsw9A5clKfPR2/f
         LliV/ysy94kpoTmzVGnETclvr3eQuNqtHptIYcl8hxysMK502qyQQZiZZoKSIhY11f7z
         S4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=IlWXFMCa0UMgwIUaqgru3sFdgAucXJ3aH12PDRfT6H0=;
        b=NmCqCBndJnaM5+2I/da+zaMBCplnPz0NFbJcigP+vDGq2dTdtrnDX7iCm49h7TMtKz
         YL2K4R5Q0Sk85p6L07Kz3Nm6ZUgXCZq1NjuLjPLJu+eNXoztdwZmYBPdsvURd+ifNADU
         ICHijA0vqSqXepUSq3stWuy7CFfxGYZrR90T0JZurM/z3DQJCPUMQZuKVcA8lsXxy46/
         WAGrdRtO3tvZ/JermcNu1bUaA03VX9UGnCLMDgqJ2NDknNhIUAnqqsQFKc19Ju9uMxaY
         hKr3Fy9hk7fmYfgZbF6EO8jiN8nxogENA1W4cpgSl8Nb4oxwacLk6bab+tYPxcqktPz9
         nfxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=TFE4bTtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si11471775ilp.102.2021.08.06.16.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 16:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=TFE4bTtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC9at-0005MC-Sq
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 19:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gcoNYQUKCFwMNG4IAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--stmao.bounces.google.com>)
 id 1mC9af-0005Ll-3U
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 19:49:25 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gcoNYQUKCFwMNG4IAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--stmao.bounces.google.com>)
 id 1mC9ad-0002qv-04
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 19:49:24 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 g2-20020a0cdf020000b029033bc8be6d4aso926175qvl.9
 for <qemu-arm@nongnu.org>; Fri, 06 Aug 2021 16:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=IlWXFMCa0UMgwIUaqgru3sFdgAucXJ3aH12PDRfT6H0=;
 b=TFE4bTtlMnFUHaFi70DEOFaabTsq0uj0ybz1GrScuyx+8Cw6sRxiWIk/uHg3fXV/0A
 +JGSU8kOiO2ihdQZR6cBxe1r/q81+iwxZI78it6YSj9KTH6/lSAh5xplO3IcsqMJ5QmB
 afSxIZbmG45bXEYoWEsewxYz0h7GJqjnrvx7rFQVl/LRyRmbt9CBhwsd6PD9PlnocoO5
 /qjuvVgkpBK+9NqBXphud+fhMKzBQI4qoH2HvVzx04AJh+sBNi2M3te8vkOYQ5q3Q1jI
 PhXzqcag0l0aSIZCI1Kst1K4ANXgL/+PBp1BrhK56Ncy09v4KVna/ekdjtr9UQ/idzfT
 kTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=IlWXFMCa0UMgwIUaqgru3sFdgAucXJ3aH12PDRfT6H0=;
 b=nNGJddUDDsvjBX9OixWZ/Vn+RJJzel/UnT0O+az+CFAMhkxQmMZtGqOC3/p3qkLg36
 UepazXJPVCjW/VlhsJq5Ty+1RMA3erBK2622KOskjc7Sh2WTonjMjHYJmNB06jhLHE75
 9qPaWB9fSIx1YrN8OEz75WXc+STCjaYXLQDybj6CvnrRVWJuo8hWkhYFAFqdO6Ri8a3B
 BL42CwjqJ1x/nCjlcrzgOQZWk0TVaOi3HzBOTmObtvkcMX86xZcobmQ1KPlenBwtygCg
 oRYv4Tziz377D+HbRseIuz2OK+U5o/hnFO5zFwE+dwo9vu61aov31PN13MD+oj3JBo1R
 gdlw==
X-Gm-Message-State: AOAM532FeCBUEdS6VGufX7M4KQG3aiNRy4oUJIcmD+/AOMz8+yP7+Ke6
 ehPZKTYmH3w5J1X8kdEDnNwONswGYQ==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:2428:: with SMTP id
 gy8mr2492492qvb.49.1628293761235; Fri, 06 Aug 2021 16:49:21 -0700 (PDT)
Date: Fri,  6 Aug 2021 23:49:16 +0000
Message-Id: <20210806234918.122457-1-stmao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v4 0/2] Add remote I2C device to support external I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3gcoNYQUKCFwMNG4IAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--stmao.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PK4/j6d/ufwQ

This patch implements the remote I2C device.  The remote I2C device allows an
external I2C device to communicate with the I2C controller in QEMU through the
remote I2C protocol.  Users no longer have to directly modify QEMU to add new
I2C devices and can instead implement the emulated device externally and
connect it to the remote I2C device.

Previous work by Wolfram Sang
(https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough)
was referenced.  It shares the similar idea of redirecting the actual I2C device
functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
The work by Sang mainly utilizes file descriptors while ours utilizes character
devices, which offers better support for emulated devices. The work by Sang is
not meant to offer full I2C device support; it only implements the receive
functionality.  Our work implements full support for I2C devices: send, recv,
and event (match_and_add is not applicable for external devices).

v1 -> v2
    fixed terminology errors in the description comments.
v2 -> v3
    corrected patch set emailing errors.
v3 -> v4
    added remote I2C protocol description in docs/specs

Shengtan Mao (2):
  hw/i2c: add remote I2C device
  docs/specs: add remote i2c docs

 docs/specs/index.rst          |   1 +
 docs/specs/remote-i2c.rst     |  51 ++++++++
 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 8 files changed, 392 insertions(+)
 create mode 100644 docs/specs/remote-i2c.rst
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

-- 
2.32.0.605.g8dce9f2422-goog

