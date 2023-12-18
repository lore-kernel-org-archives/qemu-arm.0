Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp662255eji;
        Mon, 18 Dec 2023 01:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu8Ue0zjF0lr1qV4/1oHeup0Ze6mGPBEgDoR7nn/6A5dIMDm4zVyNmpv0YjOpq/8rA8N7+
X-Received: by 2002:a05:620a:398a:b0:77f:ae99:b7a with SMTP id ro10-20020a05620a398a00b0077fae990b7amr6426143qkn.42.1702891133205;
        Mon, 18 Dec 2023 01:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702891133; cv=none;
        d=google.com; s=arc-20160816;
        b=cFOrJhipTfLIDAHjqzqeiyENSbSGzuNt9hzfKc1WprFywvM45luF3dBVkB/dynJp9J
         Jy61y8pJagI9GoQ2Q7YJhG5APpt2x8z6mev4QYNBF1HC6SzQ44j2nJPjkgeAMz4I1PWF
         5DukIEUVTGk/VOKIZYO5P+wR/KDiwtj+yk5z5FURtG6G7B0/rN+vJKKVIn843Lt8zkUt
         q2FcYKTZbX9QPWCnIiy6/X7AbHRIvmTvvfdqb80DgTkGZz/YhDgZxf06tiz7siEdOgDv
         o5xz1LQNCJQ5MDLsBrvpxRmPrTeP/cBo0WR/v6g/xw+tok3vvaoWSQjBEdmNuFJJIDDt
         C8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=Ft+8r4QhLW14JwyxDuiF3F0oz8vEojjDsGyFoNuHu2Q=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=RTkrvfdxEzBKQKB/N9HSECLjE88rfNCadZi79l0v5B9bi4m+CiNAMT/NVGCnPwmUOP
         NocNj3lE1Vsx2jd1ak06vBQO/q4bMiwL6pNy9JAG0n6YMZJ15rC8JQOLDc+gYrrlkSSp
         OQPNMt/DWa8f5Y9Zk3fLuazyHl+buD0AUjnTCGlZKnRXFUs87/dcrdb309d7NAQTTYrE
         KyywznzRsKkHEDpela9MkdgwEuKVqKfdGub5hLuuoGq47cocL8D9u32UtUi91BDnXt0s
         Etn+nhJwk5LpKVpg5Y3IOvk3Q58e1Us985sXiWROyiDe6TYRxBPdWV9+NQHG2yHvxCvt
         EN+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fa12-20020a05622a4ccc00b00425484f1f49si24406082qtb.310.2023.12.18.01.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 01:18:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rF9lg-0003JS-6R; Mon, 18 Dec 2023 04:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rF9lR-0003AW-28; Mon, 18 Dec 2023 04:18:23 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1rF9lN-00005Q-MK; Mon, 18 Dec 2023 04:18:16 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6512411EFBC;
 Mon, 18 Dec 2023 09:18:10 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Mon, 18 Dec 2023 09:18:10 +0000
MIME-Version: 1.0
Subject: [PATCH qemu v3 0/3] Add device STM32L4x5 EXTI
Message-ID: <170289109015.23396.9428181315206234398-0@git.sr.ht>
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
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zsXfkt3nqY57

Changes from non-RFC v2 to non-RFC v3:
- corrected the license

Changes from non-RFC v1 to non-RFC v2:
- correct the commit messages
- remove a misleading comment

Changes from v3 to non-RFC v1:
- separating the patch in 3 commits
- justifying in the commit message why we implement a new
model instead of changing the existing stm32f4xx_exti
- changed irq_raise to irq_pulse in register SWIERx write (in
stm32l4x5_exti_write)
to be consistent with the irq_pulse in stm32l4x5_exti_set_irq (and also
both these interrupts
are edge-triggered)
- changed the license to GPL

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

Based-on: <170256739558.25729.14053113716470464567-0@git.sr.ht>
([PATCH qemu v3 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A
board)

In=C3=A8s Varhol (3):
  hw/misc: Implement STM32L4x5 EXTI
  tests/qtest: Add STM32L4x5 EXTI QTest testcase
  hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC

 hw/arm/Kconfig                    |   1 +
 hw/arm/stm32l4x5_soc.c            |  56 +++-
 hw/misc/Kconfig                   |   3 +
 hw/misc/meson.build               |   1 +
 hw/misc/stm32l4x5_exti.c          | 289 ++++++++++++++++++
 hw/misc/trace-events              |   5 +
 include/hw/arm/stm32l4x5_soc.h    |   3 +
 include/hw/misc/stm32l4x5_exti.h  |  51 ++++
 tests/qtest/meson.build           |   5 +
 tests/qtest/stm32l4x5_exti-test.c | 485 ++++++++++++++++++++++++++++++
 10 files changed, 897 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/stm32l4x5_exti.c
 create mode 100644 include/hw/misc/stm32l4x5_exti.h
 create mode 100644 tests/qtest/stm32l4x5_exti-test.c

--=20
2.38.5
