Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp669766ejb;
        Wed, 22 May 2024 13:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrBy/gLidG/HIKMXHkSMxInbaPpiq+Kt+iQ5cI0raCX2FKUtvm81KmXUU9jyR6KGRBMORfiVbtrCn+2xSN7sjGZ/7b2PSV
X-Google-Smtp-Source: AGHT+IHkGywTpWcpIHQYfbAta3z1NbmYGNaL0jhddifh4WXY2gCYGCJNQzeuYDs4Nd+pDHJgFadl
X-Received: by 2002:a25:3605:0:b0:dee:80d7:e73b with SMTP id 3f1490d57ef6-df4e0dc8bf9mr3430625276.47.1716410474229;
        Wed, 22 May 2024 13:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716410474; cv=none;
        d=google.com; s=arc-20160816;
        b=wxrlQA+p17yh3OGFIkRNBPhKHQqw9oHB2I3Ou7xkTGFWySyJJd771v988mEPJDzJhJ
         9+1c68mKRRarYPN0Rj9jkqqtYmQQ8CrytxmJTgivFmkCRO/Pr6wrgPUU3lUJTN3NlVWy
         qDKhUYSyjPaOYyk5LEw8AmV7G/tPb4gp4qj/z3kJf/5WtijhB4alt321ouKrEG0s0q4d
         am/pCvhX1mFStFR5u0InkutAemtLrLnYUo0LWuJHv8pZp6ERkVe/YuzDeA5OiPGC2Og1
         PSmGJWw1TEExn9OwDIjaEcTPniCeeisVTKkk6B7LmQiJdQpYoQ/gMU8oU4+jBpAVGk/E
         NrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=UN1akvvFl2+VTqqnu9gWREufKJAhjqwwuabgunfm6bQ=;
        fh=kGxdJi6DeIwP9PP6xgyAD+wtRjVPVIjGsUP7vGLhsIM=;
        b=HWMVJ15hZf03BJZ9j9GlXATkGRkKOvLrBfrymZZ2hbsgSFfN8X+Butuz5lYOG69llz
         IM0ukhv4z9T2c5gpie6PGO2Xy3qXrld1c9knjFl91Wo+PSAfhuggZTemiODUMExXCPnZ
         iLAl+HmwGjHjwCoTHCb5+5nK3Aj/aqzrS8xb19Xk3rB2jfu+znwHNl6Swj8wDEhqpPdw
         T/rGJmHae/9jfaBn/lfOOszgVZkUzkxQSbsXvTJ3lzTH1tXeOxjmUtem9LLSAvJOIxD2
         X9iC+JO5gnp59pUV5k9YlvXv1QLVf/NWT6nekq3HDR5jzcQXiflwxTcYsr8jrlupeer7
         KNUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=08Jkhu7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df56f6971si318720081cf.799.2024.05.22.13.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2024 13:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=08Jkhu7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9slK-0005F7-EZ; Wed, 22 May 2024 16:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s9slI-0005DD-P2; Wed, 22 May 2024 16:40:36 -0400
Received: from zproxy4.enst.fr ([2001:660:330f:2::df])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s9slG-0003CH-KR; Wed, 22 May 2024 16:40:36 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 73AD720616;
 Wed, 22 May 2024 22:40:29 +0200 (CEST)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id JhllZ0NXvaL2; Wed, 22 May 2024 22:40:28 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id CCA9320528;
 Wed, 22 May 2024 22:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr CCA9320528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1716410428;
 bh=UN1akvvFl2+VTqqnu9gWREufKJAhjqwwuabgunfm6bQ=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=08Jkhu7YjBs0Bg8Uml73RSps2PA4TaLjn7t34Uh+Vie2eqb536bT/ZaW2X6COZ8Rl
 R47FDQgDRgcbjOj3i1ipMINiIFye7fJkmMmLPykoD2Qlm6K+SFVNiFSYfW/eym5QSl
 v3qkvsXBlOJRRGv+tAADKWbkUWu5DzE72g39jliI=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id ncjvFZfnhpbU; Wed, 22 May 2024 22:40:28 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id 7FF0D2051F;
 Wed, 22 May 2024 22:40:27 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/3] Connect STM32L4x5 USART devices to the EXTI
Date: Wed, 22 May 2024 22:39:37 +0200
Message-ID: <20240522204020.203905-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::df;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy4.enst.fr
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
X-TUID: h8Oizf5Y0xCm

STM32L4x5 EXTI was handling only configurable interrupts
(such as those coming from STM32L4x5 SYSCFG which was the
only device connected to the EXTI).
This patch adds support for direct line interrupts and
connects the existing STM32L4x5 USART devices to the EXTI.
The patch also corrects the handling of configurable line
interrupts in the EXTI.

Changes from v1 (2nd commit):
- add STM32L4x5 EXTI status fields `irq_levels` to track
configurable irq levels and do edge detection
- use `qemu_set_irq` instead of qemu_irq_raise/lower

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (3):
  hw/misc: In STM32L4x5 EXTI, consolidate 2 constants
  hw/misc: In STM32L4x5 EXTI, handle direct and configurable interrupts
  hw/arm: In STM32L4x5 SOC, connect USART devices to EXTI

 include/hw/misc/stm32l4x5_exti.h |  6 ++++--
 hw/arm/stm32l4x5_soc.c           | 24 +++++++++++-------------
 hw/misc/stm32l4x5_exti.c         | 31 ++++++++++++++++++++++---------
 3 files changed, 37 insertions(+), 24 deletions(-)

--=20
2.43.2

