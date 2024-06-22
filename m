Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp66228njc;
        Sat, 22 Jun 2024 02:45:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCptlcrGYCns2bv+Y7SgbI+DSbU27aCeIDwTBSPsHc6OcxPh5GrfSpiIXJTSMq6sdAtwMujVK1Y3D5XxVNO+s2ppOoLve1
X-Google-Smtp-Source: AGHT+IGAlsFppKIT43lJWetBtk68hAPCieL+dOSycwOQSFbCmkf1eUdeaiaFThdzU0rvj3QX8XnF
X-Received: by 2002:a05:620a:460c:b0:795:5896:f847 with SMTP id af79cd13be357-79bb3e54ccamr1153705585a.32.1719049543114;
        Sat, 22 Jun 2024 02:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719049543; cv=none;
        d=google.com; s=arc-20160816;
        b=rM8F3kGKLYrAV64Fy/PmQ8t3RK7NfJhvvz1qv2NxykQn7XrktqehYO3Nm7To39Z5ZA
         /0hAaT5kiaH6OzUByLTeIgyJ3FdJhTc4B/RseMfy56SAgUGV6IC+jReGUk90NMAk6tzO
         ebnUFYdG+TUjN13rQMade1D6vdN9F4aaEU9M9W8LwpDJ7QedxZbpdlppRhVeS85Qm3Lh
         6xor4w0kgKedYVPkOkOyIaaZQtfRJJfG5SjKBA6HBO3MS3/3UA8DkTvrhV3v3y8ZZZxI
         ZzyI1SyfarQCQ/3iQNTA96ZdTs2poGcXp8GRGg2ulfAPmWbVwUK/k7hhkT9P49brV+e2
         Qd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=Wku8nU4WuFOVlOrxwroV3y3glEG7WMuejPyRaGMEs9k=;
        fh=ylG8qXrAnNyVtPUw6V2hogvMS4j1RbxBsm8NgWjFQ5o=;
        b=tGI+jgpU5qRBh4KlMR3PR5+QgOMXTifA3pjBP+XQe7UKMmDmeB06bvxcXZ646is7w4
         4a7ZXN8zLuinJtNwBsFI0hIJOWorcbIZGHRfaoz0CTcF/ezrbOzHcmf0OnVZzQRtv5YW
         rVpLSVCh3FyAtuhP+XIQo483wvfIiMmm6ngnF0CubJHr7Y3MbZLCrgU4zcMlvXBZQuoF
         UXnHsCLmWiIQkrWGds7faIaAqWZ7U2CPIxiovKmlhgrJYMz/RZsl6UzWat0raM4EuOXr
         yIg+aDhzW8kYsBsdhXi7Dov77V80eKyKIVuPpxk8mwFmV6STE7I69l41gx8hfNfaFzB/
         5fnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=Yk4EXa15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce941f36si371647685a.640.2024.06.22.02.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Jun 2024 02:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=Yk4EXa15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKxIV-00027Q-DW; Sat, 22 Jun 2024 05:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sKxIT-00026s-V3; Sat, 22 Jun 2024 05:44:37 -0400
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sKxIR-0000zh-Rr; Sat, 22 Jun 2024 05:44:37 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 47A4D806FE;
 Sat, 22 Jun 2024 11:44:30 +0200 (CEST)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id EIdDC7UP7Z3V; Sat, 22 Jun 2024 11:44:29 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id C730F807D6;
 Sat, 22 Jun 2024 11:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr C730F807D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1719049469;
 bh=Wku8nU4WuFOVlOrxwroV3y3glEG7WMuejPyRaGMEs9k=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=Yk4EXa15dazCW5x2UUFxVeZijV54NNhXcAAOcDyMxQuLyoRbL52NC9Lr0LEVUYlWm
 JldupnHL0lSLCVc4cRV/HfKNHyh5CT5y/iqKUGwUBQTmKOtAJy/SirOn26xDbZLAA4
 TZp7HdFUscy48KldIubKkPDeR+VPqf3ESRq2p0Bc=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id pEmuL8pcZAz7; Sat, 22 Jun 2024 11:44:29 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 54D35806FE;
 Sat, 22 Jun 2024 11:44:28 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Damien Hedde <damien.hedde@dahe.fr>
Subject: [PATCH v4 0/3] Check clock connection between STM32L4x5 RCC and
 peripherals
Date: Sat, 22 Jun 2024 11:43:52 +0200
Message-ID: <20240622094402.244604-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.221;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
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
X-TUID: tBMhzf1s/O9j

Among implemented STM32L4x5 devices, USART, GPIO and SYSCFG
have a clock source, but none has a corresponding test in QEMU.

This patch makes sure that all 3 devices create a clock correctly,
adds a QOM property to access clocks' periods from QTests,
and adds QTests checking that clock enable in RCC has the
expected results for all 3 devices.

Thank you for the reviews.

Changes from v3 to v4:
- removed 2nd commit (it was bumping up version id in
`vmstate_stm32l4x5_usart_base`, which is useless when not adding
any fields), it was a misunderstanding
- in `clock.c`, `vmstate_stm32l4x5_usart_base`, renamed `freq_hz` to
`period`
- in `clocks.rst`, specified that `qtest-clock-period` is only usable
from the QTests and not QEMU
- in `qtest/stm32l4x5.h`, used macros from "clock.h" to compute
the expected clock period in the right unit
- in `qtest/stm32l4x5.h`, removed "osdep.h" include

Changes from "v1" to v3:
- adding a commit to expose `qtest-clock-period`, a QOM property for
all clocks, only accessible from QTests, and mention it in clock.rst
- adapt QTests so that they use clock period instead of clock frequency
- remove `clock-freq-hz` QOM property in STM32L4x5 USART and SYSCFG
- dropping the commit migrating GPIO clocks as it's already upstream

Changes from v1 to an unfortunate second "v1":
- upgrading `VMStateDescription` to version 2 to account for
`VMSTATE_CLOCK()`
- QTests : consolidating `get_clock_freq_hz()` in a header
and making appropriate changes in stm32l4x5q_*-test.c

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (3):
  hw/misc: Create STM32L4x5 SYSCFG clock
  hw/clock: Expose 'qtest-clock-period' QOM property for QTests
  tests/qtest: Check STM32L4x5 clock connections

 docs/devel/clocks.rst               |  6 +++++
 include/hw/misc/stm32l4x5_syscfg.h  |  1 +
 tests/qtest/stm32l4x5.h             | 42 +++++++++++++++++++++++++++++
 hw/arm/stm32l4x5_soc.c              |  2 ++
 hw/core/clock.c                     | 16 +++++++++++
 hw/misc/stm32l4x5_syscfg.c          | 19 +++++++++++--
 tests/qtest/stm32l4x5_gpio-test.c   | 23 ++++++++++++++++
 tests/qtest/stm32l4x5_syscfg-test.c | 20 ++++++++++++--
 tests/qtest/stm32l4x5_usart-test.c  | 26 ++++++++++++++++++
 9 files changed, 151 insertions(+), 4 deletions(-)
 create mode 100644 tests/qtest/stm32l4x5.h

--=20
2.43.2

