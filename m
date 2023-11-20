Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2181549ejb;
        Mon, 20 Nov 2023 05:38:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETI3LoMb9o3AjHhRMAABKna2PID9UEDFYsFR7Cim7HWZhImEO3Jw/zUV3tkoXzQ++51fQJ
X-Received: by 2002:a05:620a:45a4:b0:76f:8c6:a537 with SMTP id bp36-20020a05620a45a400b0076f08c6a537mr9405128qkb.77.1700487505383;
        Mon, 20 Nov 2023 05:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700487505; cv=none;
        d=google.com; s=arc-20160816;
        b=fnDbeuSw/PwCBIejRYk8fS8KgcV+b5mxoSdiWC+MPyi/3NNJUSWh+eh9oZOX5DHeS2
         z/IY//xR7xXPuKQx0gp1YvWD+RM+E4KgyWFCLZlSs9jnomYU/Igt29vj6bDnwCusjslL
         a6p5Ofju+bVDyK3f7naWR9g39On/sYdHZrr9ZM1dZ2tU+EB73keC13dTu8aH0HqCHxTq
         +nthlRJvltHDbOUXEXtHF4GFdxIcW5HbXCW5JXi+b8W8/ddIjc941UB7vKOTeATKGIT7
         ECSiJeQ7hCxOtRnnZlAScTvksMS7e6FP5qZpfMRlke9rljOkejeRrmZKbp+1If81NVpn
         3jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=gmh2uSZ07HY1iM4XcgJk65dKR80R9Z3eOn1tQcF+Ygw=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=l2DF5236JdqZ+DfCjgNHUiM7qqQU7yqcVVaZzADFMglCHaHbM5KCiNKEkENaLWm5rN
         RO7wCv83tKrEFOPOvdMn3eluA2rnsxLOQqV7qJiwF7mKW+JANS/MwWNOaMhNetuCuetZ
         iCv853bm25p6Nlem5h7IqJlJ6AczaWXf+5ZlJgNsbsyLqhvon+rbCOBI2iKdLkvSUHws
         JIGvmV8tQWcXio+xPMBsYgboXts0hM0jkWl42tjKcGIfXfhQvXRrUfIPc7qe/mGm2rjw
         0UP6J/FK3i4OQazBdsX1B7sNW5LcyBXC8IrrubWgPdGTTuGI0YJgMzGths5nneFDqj4L
         YF5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05620a440800b0076da5b38bd6si7895380qkp.700.2023.11.20.05.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 05:38:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r54Sx-0004z3-6d; Mon, 20 Nov 2023 08:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r50jT-0005KB-2C; Mon, 20 Nov 2023 04:38:19 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r50jR-0008CU-9A; Mon, 20 Nov 2023 04:38:18 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 10D0111EFA6;
 Mon, 20 Nov 2023 09:38:15 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Mon, 20 Nov 2023 09:38:14 +0000
MIME-Version: 1.0
Subject: [PATCH RFC v2 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A
 board
Message-ID: <170047309499.17129.4986209009679789101-0@git.sr.ht>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Nov 2023 08:37:26 -0500
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
X-TUID: 2a4jxRviLb6O

This patch allows to emulate the B-L475E-IOT01A ARM Cortex-M4 board.
This is RFC since the implementation isn't complete yet, there are no
implemented peripherals, and it's a first contribution to QEMU.

The changes from v1 follow the reviews from Philippe Mathieu-Daud=C3=A9.
We additionally changed the parent of the stm32l4x5 SoC from Device
to SysBusDevice.

Details of v1 to v2 changes :
- replaced 'stm32l475vg' by 'stm32l4x5'

In the *_soc.c file :
- added support for the stm32l4x5xe and stm32l4x5xc
- used ERRP_GUARD() instead of propagating err to errp
- renamed memory regions
- hard-coded the cpu type in the realize method
- used DEFINE_TYPES() is preferred over type_init()
- added a SPDX tag

In the *_soc.h file :
- included "hw/qdev-core.h" and "exec/memory.h"
- removed <private/public> lines
- exported the different flash sizes
- moved the SRAM and flash addresses, SRAM sizes to the *_soc.c
- added a SPDX tag

In the board file  :
- enforced the CPU type (using 'valid_cpu_types' instead of
'default_cpu_type')
- added a SPDX tag

In=C3=A8s Varhol (2):
  hw/arm: Add minimal support for the STM32L4x5 SoC
  hw/arm: Add minimal support for the B-L475E-IOT01A board

 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |  11 +
 hw/arm/b-l475e-iot01a.c                 |  75 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 276 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  67 ++++++
 6 files changed, 432 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.38.5
