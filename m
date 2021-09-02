Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp366002lfb;
        Thu, 2 Sep 2021 08:18:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxigKKXDSFwfy5b/qCjfaQ9vLuoPJYBq3Ek2stCEXdnV/zfo/pG/aOxihuxTchNBcLPhi+t
X-Received: by 2002:a17:906:3a57:: with SMTP id a23mr4372067ejf.469.1630595907903;
        Thu, 02 Sep 2021 08:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630595907; cv=none;
        d=google.com; s=arc-20160816;
        b=Djiranhj/+ourxrCE2k68cMtC0QmrtF+rsLZZ6D0sX6mcI9nrRZslW7w/ZKPXYd3nF
         kHyoe40ShMSK6KvFykeKd0BKcWfObdacyIQCh28dQaHdx2FEqmfrM5rKcSvUOPPY7gMk
         5A2sBLZxrcvUiPvcrrfmh7FKr4mjFPQkV8j7P70NE9yVN0ozyBAkS8kRjZiJtcRl3YPC
         LQvtZEiCCmEGYcv8XL92dseLzpgbJe5/ufK07Hwn60W62V5fPHsEPF5j59Xxp3L7nnvO
         nrp4DBxHPn2IAVZh6WoYJRW9puu5Y1GQ2iwpJr8tGkxp6x2/LFqXZXxqp1EqAamqUHVF
         fkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4eZcQfjo6daqlbAor/uYuTvA42Z9JFJfSgBOZq18QIs=;
        b=VjaxvjIlH6sOpX2ds1nKuAzh1H1oX97FMi4cDDT881rEJBpWdBrAh9P3Fdhh7NQlfQ
         +cCzpcWeDq7V0G4xErhOfTe5erd6QvbX2WYzI5hZaSEYdTse0mQXQ0Ioc5UcNBcqd1Nu
         MCTuflSoEc93cdJ+LQOVmy65nGidokVhVoltJpFF5LMITbPUwGjqa0KcjlEZ9hNEeDJC
         DjHQy5EJ8IeyoD3nezvJcBRRTphA4wb3YOdycyZBxgsUttCaa1iLCe3q2P2Ilft9gxjl
         yfOVDOeznRf0/GokiuFLrCkLvLXmoOo232y49ZP5rhEeGP6dON/pmyohe7bnIYPGiekU
         I1pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=L63IPhXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23si2201394ejm.549.2021.09.02.08.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:18:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=L63IPhXw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoTy-0003gl-S5
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoSz-0003eW-PU; Thu, 02 Sep 2021 11:17:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoSu-0001fc-RO; Thu, 02 Sep 2021 11:17:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1738529wmb.2; 
 Thu, 02 Sep 2021 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4eZcQfjo6daqlbAor/uYuTvA42Z9JFJfSgBOZq18QIs=;
 b=L63IPhXw4PzQkbxuYksp2EzJTg4WchwSU+JvZhA9AsC+IbRUc4NdDSFMJegTPkGLIf
 wvUMyB4cu9D5e+FEGJr4OiEUnQAy43lGsJ0MGCFodxgDfu600RoLwrMTJXgdS6WKKNIA
 leVDElIEAX03R//WZcoSlYsM4rFALjNnrWSucS616DmtBUqErg1xuJqTFa7oP4+UrqGz
 3ZUxPBuovGosiW+VK8OyeteydIIxpnIoUifjqeKDgRf4kNCHPqK4jj+2lWgqxbu/F3W+
 GsnxEZfElJSUz9NWSitncAb3pupKIInFfgtDFNZOm6CmadmAR0wSZYA57QgOHPtpfEmb
 J9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4eZcQfjo6daqlbAor/uYuTvA42Z9JFJfSgBOZq18QIs=;
 b=bZa1b2FwGExs57rR11WxA2RnAFA7OpZG25dmfLn4T496pIL6JkIHSuOUQPNP0YXwMe
 MBAvOCW2nEnKrKdLi6Eiv3NU19LUuPi4l5JYQ+0BN7PkBeAhLdZNVJAQk1Et8XBjFTDq
 kBUE/B2EWXqj6KJiQ3BNhCtpdpPCy+7QM9KO+QlxqJQivMaPI5BahJVsTGaNEfTj5LhY
 hHNNDsN6Lr77iSqqWjlha3IUkX8FPXm18vrzxvGzIK1w0rJxsWlqannlQmGysvJNj47e
 iMxOuBOpYQh24TmmWyCx7bcuLuGr78S/16wt89+/drDW7bZoBWiTAgY4GytOIGdw6Vvw
 TrmQ==
X-Gm-Message-State: AOAM531UAIBaHO6m4XSc7IWvh4h5bMN1Pmt9fmG4YGfytgJ81DJd2ntU
 RUxYVOhvXEKMS/Fqdv7KSnMgGCFU820=
X-Received: by 2002:a1c:7417:: with SMTP id p23mr3747384wmc.144.1630595837484; 
 Thu, 02 Sep 2021 08:17:17 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l17sm2213415wrz.35.2021.09.02.08.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to
 sysemu
Date: Thu,  2 Sep 2021 17:16:51 +0200
Message-Id: <20210902151715.383678-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Warner Losh <imp@bsdimp.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o1C0q6MFkYtk

Hi,=0D
=0D
The TCGCPUOps::cpu_exec_interrupt() handler is specific to system=0D
emulation. This series remove it from user-mode.=0D
To do so we have to deal with a x86-hack first, then we restrict=0D
each target handler (one target at a time) and finally we restrict=0D
the prototype, simplifying cpu_handle_interrupt().=0D
=0D
As a bonus we can remove the cpu_get_pic_interrupt() stubs from=0D
bsd/linux-user.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (24):=0D
  target/xtensa: Restrict do_transaction_failed() to sysemu=0D
  target/i386: Restrict sysemu-only fpu_helper helpers=0D
  target/i386: Simplify TARGET_X86_64 #ifdef'ry=0D
  accel/tcg: Rename user-mode do_interrupt hack as fake_user_exception=0D
  accel/tcg: Assert most of cpu_handle_interrupt() is sysemu-specific=0D
  target/alpha: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/arm: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/avr: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/cris: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/hppa: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/i386: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/m68k: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/microblaze: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/mips: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/nios2: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/openrisc: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/ppc: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/riscv: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/sh4: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/sparc: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/rx: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/xtensa: Restrict cpu_exec_interrupt() handler to sysemu=0D
  accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to sysemu=0D
  user: Remove cpu_get_pic_interrupt() stubs=0D
=0D
 include/hw/core/tcg-cpu-ops.h       | 26 ++++++++++++++++----------=0D
 target/alpha/cpu.h                  |  2 +-=0D
 target/arm/cpu.h                    |  3 +--=0D
 target/avr/cpu.h                    |  2 ++=0D
 target/cris/cpu.h                   |  2 +-=0D
 target/hppa/cpu.h                   |  4 ++--=0D
 target/i386/cpu.h                   |  3 +++=0D
 target/i386/tcg/helper-tcg.h        |  2 ++=0D
 target/m68k/cpu.h                   |  2 ++=0D
 target/microblaze/cpu.h             |  2 ++=0D
 target/mips/tcg/tcg-internal.h      |  5 +++--=0D
 target/openrisc/cpu.h               |  5 +++--=0D
 target/ppc/cpu.h                    |  4 ++--=0D
 target/riscv/cpu.h                  |  2 +-=0D
 target/rx/cpu.h                     |  2 ++=0D
 target/sh4/cpu.h                    |  4 ++--=0D
 target/xtensa/cpu.h                 |  2 ++=0D
 accel/tcg/cpu-exec.c                | 14 +++++++++-----=0D
 bsd-user/main.c                     |  7 -------=0D
 linux-user/main.c                   |  7 -------=0D
 target/alpha/cpu.c                  |  2 +-=0D
 target/alpha/helper.c               |  5 ++---=0D
 target/arm/cpu.c                    |  7 +++++--=0D
 target/arm/cpu_tcg.c                |  6 +++---=0D
 target/avr/cpu.c                    |  2 +-=0D
 target/avr/helper.c                 |  2 ++=0D
 target/cris/cpu.c                   |  4 ++--=0D
 target/cris/helper.c                | 17 ++---------------=0D
 target/hppa/cpu.c                   |  2 +-=0D
 target/hppa/int_helper.c            |  7 ++-----=0D
 target/i386/tcg/seg_helper.c        | 14 +++-----------=0D
 target/i386/tcg/tcg-cpu.c           |  8 +++++---=0D
 target/m68k/cpu.c                   |  2 +-=0D
 target/m68k/op_helper.c             | 16 +++-------------=0D
 target/microblaze/cpu.c             |  2 +-=0D
 target/microblaze/helper.c          | 13 ++-----------=0D
 target/mips/cpu.c                   |  2 +-=0D
 target/mips/tcg/exception.c         | 18 ------------------=0D
 target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++=0D
 target/mips/tcg/user/tlb_helper.c   |  5 -----=0D
 target/nios2/cpu.c                  |  5 +++--=0D
 target/openrisc/cpu.c               |  2 +-=0D
 target/openrisc/interrupt.c         |  2 --=0D
 target/ppc/cpu_init.c               |  2 +-=0D
 target/ppc/excp_helper.c            | 21 +++------------------=0D
 target/riscv/cpu.c                  |  2 +-=0D
 target/riscv/cpu_helper.c           |  5 -----=0D
 target/rx/cpu.c                     |  2 +-=0D
 target/rx/helper.c                  |  4 ++++=0D
 target/sh4/cpu.c                    |  2 +-=0D
 target/sh4/helper.c                 |  9 ++-------=0D
 target/sparc/cpu.c                  |  4 +++-=0D
 target/xtensa/cpu.c                 |  2 +-=0D
 target/xtensa/exc_helper.c          |  7 ++-----=0D
 target/openrisc/meson.build         |  6 ++++--=0D
 55 files changed, 138 insertions(+), 189 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
