Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229242ejb;
        Wed, 31 May 2023 13:36:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69FgHFC0wBPWJFgDySEpW2dWDe3NWHNWqomeqmHJFtPqfds3529PdDrascO7DxL2QXlNwS
X-Received: by 2002:ac8:5a4a:0:b0:3e9:243a:c35b with SMTP id o10-20020ac85a4a000000b003e9243ac35bmr6055912qta.51.1685565381851;
        Wed, 31 May 2023 13:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565381; cv=none;
        d=google.com; s=arc-20160816;
        b=AcAJ8MuM4LPYwkyc2i8NbGu7nCs7t4PH4mv/zIY30jtqwJWHSFWBiav01ySPSclOmW
         TmBVUrr2EUbbGHj4KYCXc8ykg/GaVP5h7aEpb6rPVPkgAELw1kE46M2djHQglbfTTdku
         VObhpXgKdS2lqyiZd0MaMEjxOqrhUuR6oy2g2DgjIxayueP9YtSVo5yL5fKFitS+3sg/
         00cZXI7zYGsEOOD7Ou5FmYpiCL2p4sXjHsqayZUpQ2c5wSMFHQAGevC/3xihgJ8mGAz4
         fnrg1ED/cJCzbQcYa8TDmCp2wI+96oNbze2LkdmvcvVEM5vBBAOiRRcZyvzW8ArEAqbA
         xV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=V31/8IijTlOvfTVfzLRlVjES6LbXgzBJVF5IEZaarpc=;
        b=VUVCcUbA05+umq6mna7uLmy+VI/EhiTpR3X7eZ339zEydCa+kIi4/ugj4woFNoNN3a
         H0ioJVyMs/iCMp+tuBXYY4KOs4atPzW6yFE0ff/6HsrjB/P4SS3Vgm3wEaUBuELs5vFu
         rBqSNZ6RkBbm6Q4Too/qAS58tcSNauLDAJusbzq4OA8AJJ1to+q1tKmr+NSnQO+RMBYg
         MS7pI0dgAm3W7TiiNmr3Zc5zqibU1GRQezUWyR9nTudfnOMGL2Gsgd9vPkgMDijPfVA5
         LsXeojYtdESXv0ILdJLqpmf5RRmEATVucNjhd3BAsZOAaQbfJTfhW2zEi8XfQUZ+6rV0
         BKzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2YYBwtO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac85809000000b003f4ec1c826dsi8668156qtg.161.2023.05.31.13.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2YYBwtO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4SYH-00076P-KW; Wed, 31 May 2023 16:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYC-00074V-BR
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:36:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYA-00036e-Ev
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:36:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3078a3f3b5fso72047f8f.0
 for <qemu-devel@nongnu.org>; Wed, 31 May 2023 13:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565363; x=1688157363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V31/8IijTlOvfTVfzLRlVjES6LbXgzBJVF5IEZaarpc=;
 b=v2YYBwtOwGB8JLLVzwFmTr3eRhisxWpLSTER44fws4B5aXCS/Fqj/WyZx+l1p6cO9z
 wPx5AMRJQaDQxXKo1jlBMtx4lh6guD3EUcM9yPSXNSdMvXWm7BPY0U6uXIcELrlF3dZZ
 YKDdp20W+w9EGXMXvpE2QQZ/e+Ylq2w4caTECIaG2BPMy28P8cznFDfIB7DkPnRCryi7
 E6cJ7n/bs1xWVSFlvD/y4X1NQ1Fl7JHyz8xmUu/QzrDE4TP4aJfIOpuaEVoZR5s+czGK
 BfcLEXwAd4vUozLdMorWYZrlYnjKOSIFuAGh7hAFvdon22wLKAa9zrCMM+vmcd3ANQ7t
 AHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565363; x=1688157363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V31/8IijTlOvfTVfzLRlVjES6LbXgzBJVF5IEZaarpc=;
 b=lu33Hp80ZgjP6wYGUP0BAycgCSjXuxHBNLHfLbHwKUrVlZXrJ5avaphSY/7ZDxP3KB
 wiXwBLUe2s4iOKqZco58pdNY5oy1uIbl6HMZWSPyxXXdKVapIg9HSnoWdYldpls1UyGb
 x+xJITt1IBJW9RqiF/x2ALAe/AVZtfcvpJ+noCyDupHWz+E2KJEUrO0Jm9sYKS7Ljfg8
 xdcpRENtFKKPKGZ+7asd4JVMZsPM8KWd/pKo/Ez5aBZiLBFHxUsbSAespomG8FKGsN8w
 ykn9+6eULCcj2guU61SKUzSUYt83w+rY73+kihpR8TO5O1jAHJIbjKI/bi+2EV7lT3Hs
 czkg==
X-Gm-Message-State: AC+VfDxE5IIUfAHxtbvqr7/7UU92uajnPZmL9jDxLV74f3rXwlf27M1M
 IZff7XXyaRdQfqdL+7B0W33Jz4lfIsrY673SvDg=
X-Received: by 2002:a05:6000:10d:b0:309:3e1e:fa23 with SMTP id
 o13-20020a056000010d00b003093e1efa23mr278379wrx.19.1685565362859; 
 Wed, 31 May 2023 13:36:02 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d490f000000b003090cb7a9e6sm7933674wrq.31.2023.05.31.13.36.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/15] hw/timer/arm_timer: QOM'ify ARM_TIMER and correct
 sysbus/irq in ICP_PIT
Date: Wed, 31 May 2023 22:35:44 +0200
Message-Id: <20230531203559.29140-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1TS6g/S4Rim8

This series converts the ARM_TIMER model to QOM.

Doing so we also correct an abuse of SysBus IRQ in
the ICP PIT model.

Sergey, I Cc you on this series because various patches
are simple / trivial enough so you can get an idea how
to structure your BCM/VC series. Still you are welcome
to review this series ;) (just the patches that you feel
confident enough).

Regards,

Phil.

Philippe Mathieu-Daudé (15):
  hw/timer/arm_timer: Declare QOM types using DEFINE_TYPES() macro
  hw/timer/arm_timer: Move SP804 code around
  hw/timer/arm_timer: Add missing sp804_unrealize() handler
  hw/timer/arm_timer: Remove pointless cast from void *
  hw/timer/arm_timer: CamelCase rename icp_pit_state ->
    IntegratorPitState
  hw/timer/arm_timer: CamelCase rename arm_timer_state -> ArmTimerState
  hw/timer/arm_timer: Extract arm_timer_reset()
  hw/timer/arm_timer: Rename arm_timer_init() -> arm_timer_new()
  hw/timer/arm_timer: Convert ArmTimerState::freq to uint32_t type
  hw/timer/arm_timer: Use array of frequency in SP804State
  hw/timer/arm_timer: Iterate on timers using for() loop statement
  hw/timer/arm_timer: Pass timer output IRQ as parameter to
    arm_timer_new
  hw/timer/arm_timer: Fix misuse of SysBus IRQ in IcpPitState
  hw/timer/arm_timer: Extract icp_pit_realize() from icp_pit_init()
  hw/timer/arm_timer: QOM'ify ARM_TIMER

 hw/timer/arm_timer.c | 314 ++++++++++++++++++++++++++-----------------
 1 file changed, 194 insertions(+), 120 deletions(-)

-- 
2.38.1

