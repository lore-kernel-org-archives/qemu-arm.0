Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B869FF9D0D2
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 13:57:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCeGP-0004AM-As; Tue, 14 Apr 2026 09:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wCeGO-0004A1-04
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 09:57:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wCeGL-0001vY-Tg
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 09:57:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488b00ed86fso58450245e9.3
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776175028; x=1776779828; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncwnJgeyesJrK5JPQX0Uqv5vd6bazY7R1dHY3JbsH8k=;
 b=MjRJ9ejLCr0CpqtVd7K8uwLC4TbL/2uBUHifCjjQ0b8lqCgw25RXtvlJGF7vMdAQAx
 GPs+KaLyg4P+rEy29bnJX8y7I5TQCuphYfLrgIhcYNVbUVoF6IRQCSfVftkcJMbXazCN
 i/WbhN0r26tNORaGxope64mmpRx6iWM51cl9SBfOykiX/x08Q1gQMi3XNKj1tSfuJ5uD
 BgoW/aEREHkX9DWFQ6PvO1fxvE61NDihi4H4SWD9nxk88JwX+fZd2qSHd8QutbgZX3gV
 Qujg0wiYyqO06LAJT8ju4++WjQPReDC251DYohCcnVcFkctZvsuzuQPi9w3wWg8kRmCu
 sn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776175028; x=1776779828;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ncwnJgeyesJrK5JPQX0Uqv5vd6bazY7R1dHY3JbsH8k=;
 b=H+ZBHY89QSRM402TRFiOpPg8zByuhppj8YpeIBL3LeV7q5wkGv/RAmrlnLvRuACCiU
 pUT/oUJb7LoZTNPxo3b8Ubd0iOfqiP7XqxTi3cg10W8DUeqFvjfgDBe4+KjGONyd0SJI
 xjy1EVdor9qfq2sy5aMng89vxd5yt9e4rm5c48/HfOLupyaknIXJBv+ReJUTPRln6OSk
 T6+o/xjkT+s7rLJr3fer4gYcCHdNbJ1BvmSx0/PjxUgqlSCJNLqQqoOGPtp3o7cEpDCM
 8JIeazayRYl6BmDzY16Cjq03PqxfPqxh6OYs4LX84o3o+jv5D1UGeTD13rUEPdcpuIxS
 Kk5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ82fUp2sVLx7Bk2VoYVqLgF7wwUW8DOmOfGc6iw1rd8xF75oa1s7h4MFbz8G+kGxXV9vqQBtDcWKA==@nongnu.org
X-Gm-Message-State: AOJu0YxAyyqgnkzYdNKDXn7HMQq1i1XvlRBRcDmcMSN1sfJcKuMMOdcG
 nAL+/l1l+H4WNAjgNz0SAfhaKmoHpIWHdSJkSXm7EW3lIXKKGjx19S2f
X-Gm-Gg: AeBDieutdiW4ajxJ0XMQ12JhKXXWhQw9PfmlftXaQ+6wn6aSpKRgRrjqDa67Z3/6RMH
 Qq9xZa82nY764zDXZS3G/Q3l2Vw50kDPr+gaxcAdgm0srfeJlmL3FYT5Fp6jm1kzgbIad7cG6Hw
 W/JGofcf9WTMqIRjsD76pTKAZOOZIhdhn/43UFLbe+4KFnjSu3HDqseW3z8Uqb5HuoYv4j/r4tm
 +DrMjcPqzlgvDreqAFzSpFU0HlhAIPReoXSX0DeL37xuM1RUAOjClNuxMKOpiz9y53iJuZj2/Tj
 O4uH1/tFl2RkIBPvUhegvwc/sHk9r0yzDkT0O+5BVKMCixh5LORe6Esm0sSPDUWlta5y18WfwCO
 oFzZ8l4gPH80g0mZtOaLt+5EXiNb2a1xPbX5IOBboCjrLud+x2Y1SUbs+7QauoE9JoDa5tOIi6L
 3ixo65ijv8bULzR37kTNEKxz0SgYFKWg+L1kTap9Bt79SpKpcY5Y8cbRam0DbgrHuPEyCMCUlDD
 0Ecy4uLxjcHo64RpyWn
X-Received: by 2002:a05:600c:8207:b0:488:bf0c:a372 with SMTP id
 5b1f17b1804b1-488d68a0ec8mr249708075e9.31.1776175027851; 
 Tue, 14 Apr 2026 06:57:07 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf1c6100004fcff454cbdf8f.dip0.t-ipconnect.de.
 [2003:fa:af1c:6100:4f:cff4:54cb:df8f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede1e826sm108963975e9.6.2026.04.14.06.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 06:57:07 -0700 (PDT)
Date: Tue, 14 Apr 2026 13:57:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
CC: =?UTF-8?Q?Maty=C3=A1=C5=A1_Bobek?= <matyas.bobek@gmail.com>,
 qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, qemu-arm@nongnu.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 6/7] tests: Add qtests for FlexCAN
In-Reply-To: <ad4xqiJnd8GoCrGu@redhat.com>
References: <cover.1773866323.git.matyas.bobek@gmail.com>
 <33d03d96698eb7511321690d9b5a054f03aa8bc7.1773866323.git.matyas.bobek@gmail.com>
 <4244E4A0-CCE2-4E23-B32E-B6B9242FAA60@gmail.com>
 <adzuRHcb4BVIRAS8@redhat.com>
 <FB523542-A8A0-4B5D-B757-2C6F7F7AD981@gmail.com>
 <ad4xqiJnd8GoCrGu@redhat.com>
Message-ID: <3EF25FA9-D2A0-45C8-A266-D87EBFBA9ACF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 14=2E April 2026 12:23:06 UTC schrieb "Daniel P=2E Berrang=C3=A9" <berr=
ange@redhat=2Ecom>:
>On Tue, Apr 14, 2026 at 12:11:58PM +0000, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 13=2E April 2026 13:23:16 UTC schrieb "Daniel P=2E Berrang=C3=A9" <b=
errange@redhat=2Ecom>:
>> >On Mon, Apr 13, 2026 at 01:16:20PM +0000, Bernhard Beschow wrote:
>> >>=20
>> >>=20
>> >> Am 19=2E M=C3=A4rz 2026 19:13:13 UTC schrieb "Maty=C3=A1=C5=A1 Bobek=
" <matyas=2Ebobek@gmail=2Ecom>:
>> >> >The tests do not test all of the FlexCAN emulator functionality=2E
>> >> >
>> >> >Signed-off-by: Maty=C3=A1=C5=A1 Bobek <matyas=2Ebobek@gmail=2Ecom>
>> >> >---
>> >> > MAINTAINERS                |   1 +
>> >> > tests/qtest/flexcan-test=2Ec | 424 +++++++++++++++++++++++++++++++=
++++++
>> >> > tests/qtest/meson=2Ebuild    |   1 +
>> >> > 3 files changed, 426 insertions(+)
>> >> > create mode 100644 tests/qtest/flexcan-test=2Ec
>> >> >
>> >> >diff --git a/MAINTAINERS b/MAINTAINERS
>> >> >index e723863a6f=2E=2Edbb159f031 100644
>> >> >--- a/MAINTAINERS
>> >> >+++ b/MAINTAINERS
>> >> >@@ -2090,6 +2090,7 @@ S: Maintained
>> >> > F: hw/net/can/flexcan=2Ec
>> >> > F: hw/net/can/flexcan_regs=2Eh
>> >> > F: include/hw/net/flexcan=2Eh
>> >> >+F: tests/qtest/flexcan-test=2Ec
>> >> >=20
>> >> > EDU
>> >> > M: Jiri Slaby <jslaby@suse=2Ecz>
>> >> >diff --git a/tests/qtest/flexcan-test=2Ec b/tests/qtest/flexcan-tes=
t=2Ec
>> >> >new file mode 100644
>> >> >index 0000000000=2E=2Eb5880d4119
>> >> >--- /dev/null
>> >> >+++ b/tests/qtest/flexcan-test=2Ec
>> >> >@@ -0,0 +1,424 @@
>> >> >+/*
>> >> >+ * QTests for FlexCAN CAN controller device model
>> >> >+ *
>> >> >+ * Copyright (c) 2025 Matyas Bobek <matyas=2Ebobek@gmail=2Ecom>
>> >> >+ *
>> >> >+ * This code is licensed under the GPL version 2 or later=2E  See
>> >> >+ * the COPYING file in the top-level directory=2E
>> >>=20
>> >> IIUC this license text is redundant to the specifier below, but agai=
n, IANAL=2E Daniel?
>> >
>> >checkpatch=2Epl  should complain about this=2E
>> >
>> >For *newly* written files, only the SPDX-License-Identifier should be
>> >present=2E   Traditional license boilerplate is only permitted if we'r=
e
>> >dealing with historical files where we're required to preserve existin=
g
>> >license text=2E
>>=20
>> Thanks for the hint!
>>=20
>> Though checkpatch=2Epl doesn't seem to catch this particular case=2E Is=
 a patch needed here?
>
>Yeah, it seems it is slightly different enough to miss our
>checks=2E If you want, you can submit another addition to the
>@LICENSE_BOILERPLATE list in checkpatch=2Epl

Done: https://lore=2Ekernel=2Eorg/qemu-devel/20260414135018=2E13585-1-shen=
tey@gmail=2Ecom/

Best regards,
Bernhard

>
>
>With regards,
>Daniel

