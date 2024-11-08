Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5148430njc;
        Fri, 8 Nov 2024 11:11:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuAobeW84gmaspOuV7ktst1lllXX0Bkhs/8FK9i50bftFwrR6cRkODPBzJE6jo5ZO98vmgYFmc9CmRRA==@linaro.org
X-Google-Smtp-Source: AGHT+IEP2p0GJuLVr/ls1x3FToZGGzN2TiW7SAfPJMAsospx4+bCPdeGvbRcPT2WhVUdTuYkGtl8
X-Received: by 2002:a05:6102:3713:b0:4a5:b712:2c94 with SMTP id ada2fe7eead31-4aae13f3d2emr5012870137.14.1731093070816;
        Fri, 08 Nov 2024 11:11:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731093070; cv=none;
        d=google.com; s=arc-20240605;
        b=kXYSkiwe7UchZVeV7PuIaCctHdCilmg5H0+Vb6U5DmrQMn+py5fyRY4tmOVFNFz32p
         zeCISmc2I2K0/34nerilRwbwP17JA7C+vQDqAzXIhlZxorR9WeoHCzouvSLL+R3ih7LH
         1ThSdesjweT7CmOe/458XPem8nd3WRdHoF08BUBkfFsGBPU2qiHGDjX5A0aBXvTsX0E3
         Y81oCklInUMa4f7NyJ/e44WBBp+pR5DLuGnLkcQdO6cqCjn+ZoTCviRsTGT9FXfh6eqw
         MXhHEFqsUZ7TI0Uni+Wx0QZNHCjC7yYR9FdqpZP4eaphDECddXvQPo2axoR+uYXW1ByI
         K4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=dXKjCtgB4NlPQ0iMDkTUNQya8PszAV5pFwFKgi96zto=;
        fh=ypBVXsMFHjWYVR+aCFGHOg1gZLuN167OIpN5IOze6T0=;
        b=gH+HtIBwSprz7oBsYj0Tdo0RmUesmMetw2ro18jaJ+U4fAIjMBPXfJlZWRlgWkAMbm
         7jhnHxRHw9Rtwt0C7CEmyxJoOHSt4PuZvE5s/s9jRLMq/SQaSxNcSZXQx/el7JLHorxb
         nMTcqIdwskqVrQOIPMVd6vC6Zyp5AEH5GRD8ussXeToIB2FFA9unbeBigRqUk1q7LRlZ
         CjJbWug3GK0GSPTPuk+AgPd9sLFIZQqItR6EZsALN0pL481E0NunrRfmlX7SQX3Io7Y2
         XkM9Wu5Z24dsWU7G+gEIB6YnEKRmUx3c3PMUtCq7QCUXZ2nfBVyKyBRP4HRqLj76b0bK
         b2rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gaKg5KoA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aaa7c84c54si1243195137.728.2024.11.08.11.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 11:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gaKg5KoA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t9UNP-0000aG-9K; Fri, 08 Nov 2024 14:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JGIuZwYKCuEURTXHKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--roqueh.bounces.google.com>)
 id 1t9UNM-0000WB-Tc
 for qemu-devel@nongnu.org; Fri, 08 Nov 2024 14:10:32 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JGIuZwYKCuEURTXHKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--roqueh.bounces.google.com>)
 id 1t9UNL-0002Qr-5z
 for qemu-devel@nongnu.org; Fri, 08 Nov 2024 14:10:32 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e32e8436adso34674887b3.0
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2024 11:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731093028; x=1731697828; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dXKjCtgB4NlPQ0iMDkTUNQya8PszAV5pFwFKgi96zto=;
 b=gaKg5KoAqNDyp1NeUYchfQbxl7HA9SEMZAm+tXXeizocUs2TZuTZqjlvoE5t8w9fd3
 gC3V21HSDJldnd4dBrDGTHNFVCPrh7vlfF3BwUuqMp8dLF1kjB131OOSfZ4yMho8Z2nJ
 G8vXcYvFyaafMLdx+dDnKk0HK3/d8JV6kMjU5IUUubeLB0hBcmWVicEPV2q1nG4uPUYN
 didPIiRuB5Md5FBZIomp5DqeFIQC1CbLd19UNxIcNSwdDpS6p42wi20eYsBsk7WIABP0
 tWPVDeE4ra/+Yh81SUgt0bdhTYod7E3d2TSNNbD+LDxo4cCjNSUetM5vwMn+FNI678qa
 7nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731093028; x=1731697828;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dXKjCtgB4NlPQ0iMDkTUNQya8PszAV5pFwFKgi96zto=;
 b=BMqwHU/WzUscZ7Fj9nZEULgp8dC9tkFMNvuoxBUPGul7lEMkZ3wuj/KSAkmLwy7/U3
 m00gic2YSWjL/X7QUYFN/XTnRJ2PNUFpfb7p9Qn9LJ0B5mrGt30t/81DSlCa1mXH6pOY
 Bygv5WiiRh8sD5spkVBFD5cBGYWQlOFhQD/YXd2P6Thb7bMRQHx4LQcUTBe2dcOji4Ej
 lV6rAweczrNBjOUExxQIPF7SLKlkNGVJEzzShGMgvjlvuYUAU4oNLiPTbnBLcwONF9F9
 10Z4fgY02MXMpr4Bkw+o7UTz+WoDvNFqB6acXAdah/xcSoAGNlYMEt1IeFOk8NXq8D2u
 LjvA==
X-Gm-Message-State: AOJu0Yz906Vcjo/+qMBiCvrP6wzR6h3SJbMqRuUN93dEmQK4p9yCaOnn
 w0Dq2NfqYkKHSa25y14u0wIln2rfM8ZSR5OZwP4ILt/C0cL4gRyqZYk4QJfYpaHxctoLDfRaatt
 kwQ==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a25:264d:0:b0:e25:d46a:a6b6 with
 SMTP id
 3f1490d57ef6-e337f8d405emr5295276.8.1731093028655; Fri, 08 Nov 2024 11:10:28
 -0800 (PST)
Date: Fri,  8 Nov 2024 19:10:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108191024.2931097-1-roqueh@google.com>
Subject: [PATCH 0/3] Make WDOGCONTROL.INTEN the counter enable of the CMSDK
 APB Watchdog
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3JGIuZwYKCuEURTXHKJRRJOH.FRPTHPX-GHYHOQRQJQX.RUJ@flex--roqueh.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: UShXYsdp3w1Z

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

Roque Arcudia Hernandez (3):
  hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
  tests/qtest/cmsdk-apb-watchdog-test: Parameterize tests
  tests/qtest/cmsdk-apb-watchdog-test: Test INTEN as counter enable

 hw/watchdog/cmsdk-apb-watchdog.c      |  29 ++-
 tests/qtest/cmsdk-apb-watchdog-test.c | 327 +++++++++++++++++++++++---
 tests/qtest/meson.build               |   3 +-
 3 files changed, 325 insertions(+), 34 deletions(-)

-- 
2.47.0.277.g8800431eea-goog

