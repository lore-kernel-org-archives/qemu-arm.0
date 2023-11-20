Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2310899ejb;
        Mon, 20 Nov 2023 08:35:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrDjDGl2kzdbs+WEV7OqQJzvRRyk1Pg5J+gXxP10ZrcHTuwyy3zaYOxh4YVCsnvtg8uHzT
X-Received: by 2002:a05:620a:850a:b0:76f:5b9:3f32 with SMTP id pe10-20020a05620a850a00b0076f05b93f32mr8076128qkn.19.1700498118427;
        Mon, 20 Nov 2023 08:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700498118; cv=none;
        d=google.com; s=arc-20160816;
        b=t7lCxa3sK6ZDAx7Zudr9umDBFfcugvcczHD4RQOiTddJ4P+6ddAvQVyzxkieLtkhkC
         Hz1vTFFAhqHm0BxC+xWuXwIU5JJCILdRoskgTjYvUHEfDXSBVVqo4gdy8/8rxKGNPZvl
         KNSzGx0sbNVSls/4tB2rmLZdYSikH1kUBmlUcUfWlJMD+4unpUnmJFe23BkXsEvI26BT
         eg4cCMeq67q7B27+7EhqXyL8Zpn9+sJfRJjQh/FayeWmOh39kmr1oV61Wf+DgiaWTWv7
         /V/9hr/pFej1aasUd/qfcWNcS91cTpKKxBkz7yDCUIHR8RdPa2z8VzCavqrujiganBTe
         PKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=JXafBXstucjnjLtKdYU0FyB2SK0xQ49Ajyvy7cZuzbI=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=CpifLrRk3gYNtqtF1RI3tqxzZFpbGiTvRjfZuGGw0w+mdwaIHZl0H0HsFSqC6nKWXC
         Qe0Rv7fzJ+6acAQ6UN75NqNnEN6KjHbTAuYsQcOR+lDDdInck7SUN+A6zAjzcaMh73nH
         rgscHKS9l03/mKirxz2fkHDt2hVaVLkO53iLmzbm88DEWPo2e3y12uEFvbzkU6+YYmSr
         PhWyFtMLaaCSJl7FZ76Hn9Qlie+FnCqiWXRUF5215jnH2h+HY6UxyBycvplrfQ6U4msb
         LArdgBFQSHKroMa8yjUnc/MKnxlMn9AMHkv1llLRuQK/cxskWPbkjg37H8aTzNwiPzEy
         Udtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dx1-20020a05620a608100b0077573d5c255si7682457qkb.607.2023.11.20.08.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 08:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r57Ev-000178-Mn; Mon, 20 Nov 2023 11:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r57Es-00016B-VG; Mon, 20 Nov 2023 11:35:11 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r57Eq-0006yz-K0; Mon, 20 Nov 2023 11:35:10 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id EB68C11F04C;
 Mon, 20 Nov 2023 16:35:04 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Mon, 20 Nov 2023 16:35:04 +0000
MIME-Version: 1.0
Subject: [PATCH RFC v3 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A
 board
Message-ID: <170049810484.22920.612074576971878323-0@git.sr.ht>
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
X-TUID: aVlvqpFxY7Vw

This patch allows to emulate the B-L475E-IOT01A ARM Cortex-M4 board.
This is RFC since the implementation isn't complete yet, there are no
implemented
peripherals, and it's a first contribution to QEMU.
The changes from v1 follow the reviews from Philippe Mathieu-Daud=C3=A9.
We additionally changed the parent of the stm32l4x5 SoC from Device to
SysBusDevice.

Details of v2 to v3 changes :
- moved the initialization of armv7m from the SoC initfn method to the
SoC realize method
- embedded the flash sizes of different SoC types in the class_init
methods (removing macros)

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
 hw/arm/b-l475e-iot01a.c                 |  77 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 275 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  63 ++++++
 6 files changed, 429 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.38.5
