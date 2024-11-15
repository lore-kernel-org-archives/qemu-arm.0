Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1070603njc;
        Fri, 15 Nov 2024 08:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzBCWluXEsKx34E9+1d8pJU+Q3z4MErEasftVCbuqrZmmpDTtJOXUrBerI8PVnXC2ECO7ctiT1U7ZOOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXPvE27/H6BNEBlG1nctpz9MSh7JYGbuGONpym+0TQaSrF0OmppJN1QlEyvIyFbOX3Jaa1
X-Received: by 2002:a05:600c:46c8:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-432df790731mr27651905e9.31.1731686692419;
        Fri, 15 Nov 2024 08:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686692; cv=none;
        d=google.com; s=arc-20240605;
        b=O9Hgy2hOxWPmJ3285MWbu4z9rIWwD7OD89qMc2jBWSIn672aC+Uyw5eO0BLMlbbhgS
         PI3RPWgfw3Sv0Do1IK78nMhofWMy1XCg2Mlsq1X4orVppYPv/U5jz3EXi2twZl8kL84l
         2nZMyir3BpEzep0bCczun+psXTfrVx91tQjBhYjxQhsIYNpPDsqtfKonz7iBAW9+/aFL
         cWpzlrpNxJKjOva1iFbN8cUgqVL/Cw2txJcpvzUCRcGK9ych6p0E19f0JARl54564dXL
         kdU6TjHdWxDeX6Q1SKHeFcdkuuYwi9OhTAO9FFP8hZCM1P2jJST6jppmIkAq2cDuHgjA
         9vXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=1Jao6wFY8gON0NOG+NANqTtWcVC5+rnyn6sEoCRpZUA=;
        fh=ypBVXsMFHjWYVR+aCFGHOg1gZLuN167OIpN5IOze6T0=;
        b=NcH9HBxMelXcM183rWngthu7sL0j6AJ8/CUB1k2jNOFWWAisaXQX/b1fSNjelSHMWr
         bQVou1C6hJ7OOrUK5mjXibz71TWaKleJ+bP3wi9WmG4b33hQVz2bNWDJyV+SRW2IjJW3
         NeN066EvhElakliti8twT/Txc6dMDpQ7b+QhQoboQUTHnRWfjCrc9nqf1okIrLx5+NcN
         wDxICVsRaizcvizHF+DCBvALM+T5vewcw2RwEmSJJefuwNh2pnOAOyhyYPf1kFjl3vpG
         eb7FsRyfvozockASfRKXSB7PMDEfZ32YStTy8AwheHOH35TloKI4m/95HKLB7xwbh1LW
         Wfow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pOBlZSJj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-432dac275e6si25007885e9.179.2024.11.15.08.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 08:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pOBlZSJj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBynO-00048u-JP; Fri, 15 Nov 2024 11:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31nA3ZwYKCtUIFHL587FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--roqueh.bounces.google.com>)
 id 1tBynM-00048G-52
 for qemu-devel@nongnu.org; Fri, 15 Nov 2024 11:03:40 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31nA3ZwYKCtUIFHL587FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--roqueh.bounces.google.com>)
 id 1tBynK-0003jm-Db
 for qemu-devel@nongnu.org; Fri, 15 Nov 2024 11:03:39 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e3808cc775bso3601486276.1
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2024 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731686614; x=1732291414; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1Jao6wFY8gON0NOG+NANqTtWcVC5+rnyn6sEoCRpZUA=;
 b=pOBlZSJjZ0BVU7V1uFDnRBHhSabAavTSyFfy/cYNmP3CoTbacsjAussDedwoZ0lTEq
 18UA16diUB9XT2jyDlbNzK2vqpZOUcrLg73UXP1DSJ3bgTsQOdpkHc9IG0iaynKzVBQC
 G+g6t2MGOWFgdJMY9avZG4Bk9eyvRl1RqWZw6SVrkTZK6lzEqPKa9VFaqj6qNh6dsnwg
 zwOrRguAQFVDyDk2KdWj53RMGOnZl9AiFXbrKjYuakKO1JnzfnLY0j3tauGGYmGSW3ry
 y57Wt28a0d+HMOp9rsMxbWFUqgXQA0SiNytQnNgdXlkOIa21Y1o/6pdR9oVyqDx+sN62
 OdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686614; x=1732291414;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Jao6wFY8gON0NOG+NANqTtWcVC5+rnyn6sEoCRpZUA=;
 b=QaGCWGg3iyGhQ7nsYnsGbRI8c0+Mw2JZ/VdwgwoCldZSum6dChVcD5s7D5xMVs9Lya
 qNhxx6/Ml68xeXg7kwA/l7rzB3TLiO+s9dxHehywjq/ZZcWA3xfz+GBmskxfxMWsDHSq
 aQ0c0m5e0KEvuZzfl6HJsDxPlP/TMCLb7u5w2Rtwuqt7GnIY8uIvPEbF6dYik+f+j3Nt
 jP5vOWXFN5R/4f8Cr+233bMiYwnCum9ccpuXWxMNcvu5iejmxfkrzPxOnW2NLg25mdCt
 HHGFmXv5cIXJ/NpnFnyzZGu2QMJz0h106EtPg9S21rfpQ+6UZirAiLk6CV3+kmrb28Gi
 5YTw==
X-Gm-Message-State: AOJu0YzRs7i8cb9zNs6hsgdrXkCEi63JPZgaqT1XoOnEfrWABCommTIC
 DpVzRJRSnMUrtroRAg3E6G1R4/78fTIp9xLXHQ3/9TlIzvURSRySuvH9GEaZXHvbuyJA4iWjShA
 cCg==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a25:886:0:b0:e2e:3328:7a00 with
 SMTP id
 3f1490d57ef6-e3825d4d1a9mr200320276.3.1731686614700; Fri, 15 Nov 2024
 08:03:34 -0800 (PST)
Date: Fri, 15 Nov 2024 16:03:23 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115160328.1650269-1-roqueh@google.com>
Subject: [PATCH 0/5] Make WDOGCONTROL.INTEN the counter enable of the CMSDK
 APB Watchdog
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=31nA3ZwYKCtUIFHL587FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--roqueh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bLoM9uaRv/2T

The following patchset tries to address an issue where the watchdog
counter was running as soon as the device is out of reset. This
created a few problems with the firmware under test. It was pointed
out that the firmware under test was already working on an emulator
using the real RTL. Further review showed that the WDOGCONTROL.INTEN
is also expected to be the counter enable as it is defined in this
page from ARM:

https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watchdog/programmers-model?lang=en

     |       | Enable the interrupt event, WDOGINT. Set to 1 to
     |       | enable the counter and the interrupt, or to 0 to
 [0] | INTEN | disable the counter and interrupt. Reloads the
     |       | counter from the value in WDOGLOAD when the interrupt
     |       | is enabled, after previously being disabled.

The second half of the patch is focused on adding tests for this
behavior. It was required to modify the test to be able to run some
test cases in the MPS2 since the the stellaris machine had 2 issues:

  - The stellaris machine did not run the counter out of reset
    because of the way it is reset. The function
    ssys_calculate_system_clock is not called until the reset phase
    stellaris_sys_reset_hold which is after the watchdog executes its
    reset, so the watchdog would not start the counter due to the
    clock not being set up at the time of reset.

  - The Stellaris machine uses a derived watchdog and not the
    original CMSDK one which has a special behavior where it cannot
    be stopped.

The MPS2 machine on the other hand uses the standard CMSDK watchdog
and could expose the problems we were dealing with.

Roque Arcudia Hernandez (5):
  hw/watchdog/cmsdk_apb_watchdog: Fix broken link
  hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
  tests/qtest/cmsdk-apb-watchdog-test: Parameterize tests
  tests/qtest/cmsdk-apb-watchdog-test: Don't abort on assertion failure
  tests/qtest/cmsdk-apb-watchdog-test: Test INTEN as counter enable

 hw/watchdog/cmsdk-apb-watchdog.c      |  38 ++-
 tests/qtest/cmsdk-apb-watchdog-test.c | 328 +++++++++++++++++++++++---
 tests/qtest/meson.build               |   3 +-
 3 files changed, 329 insertions(+), 40 deletions(-)

-- 
2.47.0.338.g60cca15819-goog

