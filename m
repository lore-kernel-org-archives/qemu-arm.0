Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp1540967ejb;
        Sun, 12 May 2024 03:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU1fR5Y/cA8JfhZLSZ003PJzj90rrZiI6sarz0PK8W5U2SxRxum4ni7SiHChfJp39G+8OrTqbY+f3+B8oDZT9tLse0QTW0
X-Google-Smtp-Source: AGHT+IGTEMnvC2nkDJzKiN0Ppoz+EwDt6Rr1Spr0sVEDiiV65W4IV+BDbokWxsn3jcFxiVRCLAo1
X-Received: by 2002:a54:4415:0:b0:3c8:430c:ab4f with SMTP id 5614622812f47-3c9971dd2famr9219190b6e.55.1715509246677;
        Sun, 12 May 2024 03:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715509246; cv=none;
        d=google.com; s=arc-20160816;
        b=FL07G9k0xqrYKTd05XiGNKWZuysJolNp6HXVBd+ZbzlBTbKMaWd3e9BuGP8FPAWNxW
         toA58OwN2EMdywROsW8ZmHfJ3SFpwsJAUJ/Q2+ZuJFQVE6INHxX7Zxg14qg8PJPNGY+D
         HEIdoQa15rwSb9aHt/MxA27DocpWeMXKCJpkDZ4OYf2zoh5KiEiV+6NSJ+Wb7oflDOlH
         sbyAtN5tqUUKP1aU8LPJOE/aAGE9dO9YsgGDIveDLN8ylsI03ZybScsGmt64CnploPdm
         h5cWD8Sk7kKLV+Ck40mUufhHUCSC9AXkZgAZuWzX/MeN9D40EHyE1gqnYwwVMYeVgA/O
         MXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=tdwT/SWQvpyZmB/2pZelE0+kiYbs+C+sPzXNCmDVBC0=;
        fh=Zmq9HMx/NeXKNrckTb6Lh5JU5VplidR5nLaFqdt50kc=;
        b=PNumz+rQuCHUHqB5QS6gRZic2AikyUb2ODARZd0/znIjq1ciSjeZcJH71PzhTfetkX
         eZhkpz6SlsK6xhMjB3xDuNev+myWw3gSeuTqJfnTczSzPFEpdpMm3Cix8LXGy+kMu2E4
         39mdS+UWpLs+kVKT3nimNvfYMfMYx84+8e92tP3JnS7ee/agIyQi4n+UQ2Kkw2ALjZmH
         cbd+bYNkbHGnYT5DfT28W4jjYHSxoL7IK1+EWf3TXmrJ1AVhqGwPTiSkG2VuTKArsBe1
         4gJ2vE2Fz/nTGlQfp4g4b7OSekW3JHZRyxh54yPt9B6rVdzQERZ2iEZzPxeXZf5MtlYG
         8iFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=VxkB9g3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f29afd9si73724536d6.288.2024.05.12.03.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 May 2024 03:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=VxkB9g3r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s66Jp-0003xO-Jt; Sun, 12 May 2024 06:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s66Jm-0003w3-GE; Sun, 12 May 2024 06:20:34 -0400
Received: from zproxy1.enst.fr ([2001:660:330f:2::dc])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s66Jh-0007P5-6k; Sun, 12 May 2024 06:20:32 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id D00BFC05D0;
 Sun, 12 May 2024 12:20:20 +0200 (CEST)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id zwol3mqBYL1N; Sun, 12 May 2024 12:20:20 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 7AC0CC05C1;
 Sun, 12 May 2024 12:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr 7AC0CC05C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1715509220;
 bh=tdwT/SWQvpyZmB/2pZelE0+kiYbs+C+sPzXNCmDVBC0=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=VxkB9g3reWHsHTKVQLGteAc6s7j0hoaAY9rrPHnYLK81jg1H2iKzYoe0l3MXl2zOM
 GTxCHksdP7BheNH2SZxIwp/jevmJYRR52vD7UNHSEZUa2mzSkU7brWnB2L8+z7svDA
 SwBZilOEL2rKw4d1yiBPxenLmgKfYZy4ARV2Pb7Y=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id RQhBWCDGoAe8; Sun, 12 May 2024 12:20:20 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id B7C49C056A;
 Sun, 12 May 2024 12:20:19 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
Subject: [PATCH 0/3] Connect STM32L4x5 USART devices to the EXTI
Date: Sun, 12 May 2024 12:19:39 +0200
Message-ID: <20240512102013.211127-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dc;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /VRy33TIXtit

STM32L4x5 EXTI was handling only configurable interrupts
(such as those coming from STM32L4x5 SYSCFG which was the
only device connected to the EXTI).
This patch adds support for direct line interrupts and
connects the existing STM32L4x5 USART devices to the EXTI.

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (3):
  hw/misc: In STM32L4x5 EXTI, consolidate 2 constants
  hw/misc: In STM32L4x5 EXTI, handle direct line interrupts
  hw/arm: In STM32L4x5 SOC, connect USART devices to EXTI

 include/hw/misc/stm32l4x5_exti.h |  4 ++--
 hw/arm/stm32l4x5_soc.c           | 24 +++++++++++-------------
 hw/misc/stm32l4x5_exti.c         | 29 ++++++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 20 deletions(-)

--=20
2.43.2

