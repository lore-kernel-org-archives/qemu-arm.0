Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2924431ejb;
        Mon, 4 Dec 2023 11:20:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtZvoSLzKmcpLjorWECVCc2V2KcappWMuYHUzjMnE2JLpeq0DVQ2mdTFpID/5Fkkc0xdOL
X-Received: by 2002:a05:6358:2917:b0:16f:ebce:8126 with SMTP id y23-20020a056358291700b0016febce8126mr4596874rwb.19.1701717637487;
        Mon, 04 Dec 2023 11:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701717637; cv=none;
        d=google.com; s=arc-20160816;
        b=U6pbOMHMDQdj2k8Js01D0LUZXvIKApEDulaCDTcO7TKvdRC42KR2kMsJQ3FY0o6IpM
         5s98LrtojK7ErUWDevAo997ACzLX90mo+OPAyj/D64dfSs4LrtDRf/XRt7SSlf7Ab/pD
         V2eqcEbqRT/QMPtF8gYWNX8xMMUey2tAb3jVpF06qploUnwRDtgVK83ROja/vgKUCBR6
         3XboOecvJeqb7LR3uAhCuI9WsD/pJJOa5auieMsxutK+yWP9jft/AxResn7qQgkVHSRs
         dqz/yiwYE3zm1Y4WW/u6qcCAvLkOW5HuvRBeClGttF6clQeCFbNvdermQASx2xz27mt8
         /TcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=pOz+V0n6XjxbErI838JbobJahiFBF/U3ppN2skkg6nY=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=nP3RZNeWYLGjI+PO883wIPBZ4EkcNp+HOf9j0Skhj6DO436ea1HJ750D0iqixuHSGN
         ePLICqRAFUDuXOWsd1avyS8jGyETTYL9j7hiXCOfJTPDYS3Owv8R4uKfN4qBt5PlLSx9
         GFQ6s2PZjdfqU/ZnH4X0fGeaYdJjGly0XomBc0nYuP/dJkluxcYmaEJJedZxd3LCI1kX
         Srtbypvf4Wrkq+kjjMRVxagJnXXYjYIUEzQt0DK90raB3pkDDlIWhwg818C8o/VxIHym
         UWYho8cIWMEUpNBlNBpN6RvZEoVmodIc7VNY92bCVSz+lRiaEK+lnkFzfRSSerTzNkvW
         bGEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw12-20020a0562140a0c00b0067a97588be5si8066795qvb.496.2023.12.04.11.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Dec 2023 11:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rAEU4-0007Bt-OO; Mon, 04 Dec 2023 14:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rAETs-0007AM-Pk; Mon, 04 Dec 2023 14:19:48 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rAETm-0008Td-Bi; Mon, 04 Dec 2023 14:19:48 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6373211EF13;
 Mon,  4 Dec 2023 19:19:39 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Mon, 04 Dec 2023 19:19:39 +0000
MIME-Version: 1.0
Subject: [PATCH RFC v3 0/1] Implement STM32L4x5 EXTI
Message-ID: <170171757903.6536.10207274798404158986-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uYn6LasGPFb6

This patch allows to emulate the STM32L4x5 EXTI device.
It implements register access and software interruptions.

This is RFC because we're new at contributing to QEMU.
We had some difficulties writing qtests and the result might be bizarre.

We have some questions about the next steps for our stm32l4x5 project :

Should we send a non-RFC patch after this peripheral implementation is
reviewed,
or should we wait for more peripherals to be implemented?
We have syscfg and uart implementations ongoing.

Also, should the version numbers restart from 1 when sending a non-RFC
tag ?

Sincerely,
In=C3=A8s Varhol


Changes from v2 to v3:
- adding more tests writing/reading in exti registers
- adding tests checking that interrupt work by reading NVIC registers
- correcting exti_write in SWIER (so it sets an irq only when a bit goes
from '0' to '1')
- correcting exti_set_irq (so it never writes in PR when the relevant
bit in IMR is '0')

Changes from v1 to v2:
- use arrays to deduplicate code and logic
- move internal constant EXTI_NUM_GPIO_EVENT_IN_LINES from the header
to the .c file
- Improve copyright headers
- replace static const with #define
- use the DEFINE_TYPES macro
- fill the impl and valid field of the exti's MemoryRegionOps
- fix invalid test caused by a last minute change

Based-on: <170049810484.22920.612074576971878323-0@git.sr.ht>
([RFC v3 2/2] hw/arm: Add minimal support for the B-L475E-IOT01A board)

In=C3=A8s Varhol (1):
  Implement STM32L4x5 EXTI

 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32l4x5_soc.c            |  65 +++-
 hw/misc/Kconfig                   |   3 +
 hw/misc/meson.build               |   1 +
 hw/misc/stm32l4x5_exti.c          | 306 +++++++++++++++++++
 hw/misc/trace-events              |   5 +
 include/hw/arm/stm32l4x5_soc.h    |   3 +
 include/hw/misc/stm32l4x5_exti.h  |  58 ++++
 tests/qtest/meson.build           |   5 +
 tests/qtest/stm32l4x5_exti-test.c | 485 ++++++++++++++++++++++++++++++
 10 files changed, 930 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

--=20
2.38.5
