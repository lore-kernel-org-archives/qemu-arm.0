Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2156115njc;
        Mon, 22 Jul 2024 14:46:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX906yEv1SePZzH8Lc7ZaUPI9l3kUBQZiiitaM8TMvFbFd4JOji6zmd4xnk+vP/kfLrPSBQo2bMzXQmqneqjHiYhtpwSgJ6
X-Google-Smtp-Source: AGHT+IHa+i6KRWY5ZI+9+tl6ENZC6vfajbajHcwKxqwpM8eo/uz419lNz9H7/NLbKPaghBnpV5Vc
X-Received: by 2002:a05:6830:6305:b0:703:68c2:8356 with SMTP id 46e09a7af769-7091811f2b3mr1442076a34.17.1721684761673;
        Mon, 22 Jul 2024 14:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684761; cv=none;
        d=google.com; s=arc-20160816;
        b=ozSogBglw+SIh2EZNGaGThqnJSmG/B2Tblj2fHjVCkJLqZ3RuoQRGwyiAY9aJHZp8R
         zrHzWyYRYtOcpes2e7+untR4QtYXO5GomRN7PWt203rZTQmgK3oO/QexlP024y7342ga
         QGgQQrnq0FQRJOr459v1CfWuYBhT3ALgwp9IpaD7gN8tkj5FXYb2zkOSg9KIusDVX21q
         K9aQvaKNpKF3miwCc3o+sjELkC6gGWu12O6pbZ5Wgi62U4sCkHKmDgSzO0QaqdFiL9h7
         mC71UD2B7f7G0R86C2jXotOI8VPRVPK5sqddHtbM48baTCUCf6YSwiYRTOHEua3DbNSh
         gyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mcZb5YItFOMqqJrIuqjuWAfUzsfp40iXsHzNY3+LniI=;
        fh=/MNB32dte6qIcTZ6h+xej+E4yxAP2y+glEGkOBUjH7A=;
        b=1ISgC4FxfVeV0GME0GPqMFyR4JIPdvC6hcnRDkmBkmrqUKdM8Bjfdmzx+roW3oTi4R
         gwWGh8L2QmQbj2jTCuOHYc3MqjvkMpTMBpTF/zP1sYseht3kmyoC9f7HzQfIxA5x4/p1
         JkH3Yf7Ub0Vn/j0EtgFtjTUchkZ19cT3S/GIY1fX6CDPQt/2oLCiwIPo+JMyQuPXMVtB
         W3mMkotpQ5FM0g6meuf2NGgxOwQYXvPPEqOVlqEs6Vg7znHvzEJ5tECQMpqjKID1MHYr
         F26Wpbuk1/lapIqn72d7dQgnRri+zszRWcYcB2pkN3XmA/8skhG4CxuVa/Zw3FHBdDFC
         aXEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=bW39cLku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccf8e1esi89959761cf.161.2024.07.22.14.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=bW39cLku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0q0-000576-T5; Mon, 22 Jul 2024 17:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pt-00051m-OU
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:50 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pq-0004H7-82
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:49 -0400
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-8036ce66134so187978639f.3
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684682; x=1722289482;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mcZb5YItFOMqqJrIuqjuWAfUzsfp40iXsHzNY3+LniI=;
 b=bW39cLkuzQIbfXRB5IXR1T4ogc0+HrGeHaAptQ+Hktv2jaxz+T4S0KvXEb4yoqvPik
 ggkpNEU77QQ8sBIooQncxyVA1ur6bmHGKZNZt2wA9ekGgHnMzIokBAoPCZVJblqHHjT5
 J7Ws1mXXbtI5D3N1cEfzcW8W0LnAFIm5kjRP9YG7rJmS+Ove+JCB0j0GGPFub6VodLNM
 Qo48+dZV6nJwxEk/jPahb+nWrbzIzIESm8CRwRcpOy0tzD3rHtMjGHm4fSE3K2AS0vxI
 rlhUijMZbHgQiyNbUX2scqULlG91l0zA7+jLnOEa0gh1VSRv3TcI0uXU6UQshReU1pwH
 UY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684682; x=1722289482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mcZb5YItFOMqqJrIuqjuWAfUzsfp40iXsHzNY3+LniI=;
 b=JWktyGeBrmDR4PMmMejJH1DG8mfBjXcmOfi7t/iZvBlaOmIvE98iuvSGvo4isoUN42
 ydo1nIhF7aF9IHBywSBg8uposwbLRS5hFvhATiFxhWPFo/SawOlhTnU8jaHywcMWVYjz
 8vD6tdSurUFAk/f5TIm6jEmpBmp3BYAIKPEIoABjMhUWuXKU7fG9vQ5XczEt+4vvE3bB
 d1LYqTA/+5tbHiQMqkpjwcFLIQcH/4lKoYF6ks+hmQ4PjxBrypmNBayECQrKjgSkIicn
 JiWlH+WUCDK23Y16FCdcEJ+00BLGZIWczWQ7BdpGxBQluaf1GiuPpJhGRt7C+KUemnUw
 46dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6/sBdp+73IxjWlqZhO8U443GPB9CUOIOvRBnJg0jP6ARU2a/m4IUot2NWh7ABCRZ9qv1LDftIBp5ikWdhirtRjgmN
X-Gm-Message-State: AOJu0YwBb+PauaVLVB+AolMYSCqkDkbyzMp9wrCLgOSS8CWbeziH3ySz
 4oOUZzCq/6Tp0Snm7kE7WTe/Xx3dwZigDBbbSGwlXEj5OZLW93DruePoM4zwWhI=
X-Received: by 2002:a05:6602:2ccb:b0:804:b327:52d5 with SMTP id
 ca18e2360f4ac-81ea30a2126mr148544939f.4.1721684682374; 
 Mon, 22 Jul 2024 14:44:42 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/14] bsd-user: Misc changes for 9.1 (I hope)
Date: Mon, 22 Jul 2024 15:42:59 -0600
Message-ID: <20240722214313.89503-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yPh+UF1gh2Tg

This patch series includes two main sets of patches. To make it simple to
review, I've included the changes from my student which the later changes depend
on. I've included a change from Jessica and Doug as well. I've reviewed them,
but more eyes never hurt.

I've also included a number of 'touch up' patches needed either to get the
aarch64 building, or to implmement suggestions from prior review cycles. The
main one is what's charitably described as a kludge: force aarch64 to use 4k
pages. The qemu-project (and blitz branch) hasn't had the necessary changes to
bsd-user needed to support variable page size.

Sorry this is so late... Live has conspired to delay me.

Doug Rabson (1):
  bsd-user: Simplify the implementation of execve

Jessica Clarke (1):
  bsd-user: Sync fork_start/fork_end with linux-user

Stacey Son (6):
  bsd-user:Add CPU initialization and management functions
  bsd-user:Add AArch64 register handling and related functions
  bsd-user:Add ARM AArch64 signal handling support
  bsd-user:Add get_mcontext function for ARM AArch64
  bsd-user:Add set_mcontext function for ARM AArch64
  bsd-user:Add AArch64 improvements and signal handling functions

Warner Losh (6):
  bsd-user:Add ARM AArch64 support and capabilities
  bsd-user:Add setup_sigframe_arch function for ARM AArch64
  bsd-user: Hard wire aarch64 to be 4k pages only
  bsd-user: Define TARGET_SIGSTACK_ALIGN and use it to round stack
  bsd-user: Make compile for non-linux user-mode stuff
  bsd-user: Add aarch64 build to tree

 bsd-user/aarch64/signal.c               | 137 +++++++++++++++++
 bsd-user/aarch64/target_arch.h          |  29 ++++
 bsd-user/aarch64/target_arch_cpu.c      |  31 ++++
 bsd-user/aarch64/target_arch_cpu.h      | 189 ++++++++++++++++++++++++
 bsd-user/aarch64/target_arch_elf.h      | 163 ++++++++++++++++++++
 bsd-user/aarch64/target_arch_reg.h      |  56 +++++++
 bsd-user/aarch64/target_arch_signal.h   |  82 ++++++++++
 bsd-user/aarch64/target_arch_sigtramp.h |  48 ++++++
 bsd-user/aarch64/target_arch_sysarch.h  |  42 ++++++
 bsd-user/aarch64/target_arch_thread.h   |  61 ++++++++
 bsd-user/aarch64/target_arch_vmparam.h  |  74 ++++++++++
 bsd-user/aarch64/target_syscall.h       |  51 +++++++
 bsd-user/arm/target_arch_signal.h       |   2 +
 bsd-user/freebsd/os-proc.c              | 118 +--------------
 bsd-user/i386/target_arch_signal.h      |   2 +
 bsd-user/main.c                         |  46 ++----
 bsd-user/qemu.h                         |   3 +
 bsd-user/signal.c                       |   9 +-
 bsd-user/x86_64/target_arch_signal.h    |   2 +
 configs/targets/aarch64-bsd-user.mak    |   3 +
 target/arm/cpu-param.h                  |   4 +
 target/arm/gdbstub64.c                  |   4 +
 22 files changed, 1001 insertions(+), 155 deletions(-)
 create mode 100644 bsd-user/aarch64/signal.c
 create mode 100644 bsd-user/aarch64/target_arch.h
 create mode 100644 bsd-user/aarch64/target_arch_cpu.c
 create mode 100644 bsd-user/aarch64/target_arch_cpu.h
 create mode 100644 bsd-user/aarch64/target_arch_elf.h
 create mode 100644 bsd-user/aarch64/target_arch_reg.h
 create mode 100644 bsd-user/aarch64/target_arch_signal.h
 create mode 100644 bsd-user/aarch64/target_arch_sigtramp.h
 create mode 100644 bsd-user/aarch64/target_arch_sysarch.h
 create mode 100644 bsd-user/aarch64/target_arch_thread.h
 create mode 100644 bsd-user/aarch64/target_arch_vmparam.h
 create mode 100644 bsd-user/aarch64/target_syscall.h
 create mode 100644 configs/targets/aarch64-bsd-user.mak

-- 
2.45.1

