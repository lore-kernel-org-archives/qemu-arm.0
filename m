Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E646BCD3427
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 18:03:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKK7S-0001v2-P4; Tue, 05 May 2026 14:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wKK72-0001sh-8Q
 for qemu-arm@nongnu.org; Tue, 05 May 2026 14:03:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wKK6s-0005RZ-H3
 for qemu-arm@nongnu.org; Tue, 05 May 2026 14:03:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43d73352cf2so5080138f8f.1
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 11:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778004183; x=1778608983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCTx84tlBdBwEyORHk4E+U0CrSuvcjYEig/jnRcdvoI=;
 b=XRk/jj2aquR47x7Q4HlVLb9yrgvWpXaBq7Ek041n/hZWlq5LLTyxJhsXad4yYToEob
 uFSTxygAgCe39qKM+UFz55s27len1uUlOFSRaTftUjLvr4WemophYjk83Y0q8/LfcGuK
 6KqHp2vaktEZkQhKb6tQnoiRBJlu6y3qbc77b2f1mjndd6jlvSc9/OnfsnIDVI09pK7R
 ghlnV7sA1vouDx/giYPRCR0u5XH5m+VBYSVNcFgAq3VpKmr4WuRn11MIA5mgTRuO99uV
 cSRmMamopbvxwgf3k6AYXnb94U1IG3Y4WRN0voFQ7JmsIobCDAlGBjOk3gSpIQJ5bUGQ
 G4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778004183; x=1778608983;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dCTx84tlBdBwEyORHk4E+U0CrSuvcjYEig/jnRcdvoI=;
 b=StGtYmSmu4gbTfmqf16ieCf2BWZH1zUhrVGZ9m/JC+SmXN79xmbgEwLWq7VatdCeSL
 8apCmHlLX79X30uYxiFeMkjY7qIQ7O5Di5W4wnYp8wbL8C2p9MYK/a9lRurU5UzTCDyc
 3jGth6fm/9gwz557PnrAOurXediAOA86+0c8RWG4fLBmL1ihpSW74SKgviYWDL1NBOiQ
 4zQI5Tcjeo2JeYzDY4rwi06i/vigF32jSzwIYlI2ruqEJHAT0gmdyvrijiMPiOdxkSKe
 Fj4oPvzpri/n+7VgJiTs/Eo6O4c7ipiDu1egZnq3k/biw7PRqTmatnvzNQ60aqT/LcZs
 ZKQA==
X-Gm-Message-State: AOJu0YxIYZJSceGDOtsmCRlbfA6t4sa9WJh0ieuKaBQTOFFR2qpEq3ev
 jmUbwqWZDGdKp/VAew8Pu1PQ6yq/87O1YNbDvKi3s+Hu0koX6iC0VT1Q
X-Gm-Gg: AeBDietj/DvqQ6E0YJ+GfBCposGjnyK+LidnhVN5NQjpFLFq2QFyYJSPzYQeliJyy8A
 tf/fqCb3gc/QPlLyJIZF5jdj9C4phdrwXGzmXkzkDVPwzoq1KWclM/fM1fUYfet4BpLC8lI8YTC
 0zePIOPpykqhRpYxQn80nvJp2QrHyUbxMw4+KOONzRwUEHNykIBvXtksQo285Cl6rfmaLnoCRRY
 WOQIVSiiWvPJdFOc4YiRKz3uYcwVuM3lazBX7mzD9rrg6IgQPlhacNlM1EAO1x7ONNbYrZX+ITl
 eO1GeU644iLdqKSxnPBBgxENRVjQtp94vQqmQkcP9rYFabglDUDwNLMvqrC8panfbchqXqt0/UT
 LyUBnV4WK5YS2L2wO5T5RieWCQ4lc02Xf3vepIBjbDgcExNlZKn63E3FVQllLcUyo0G8f+9GiLS
 aXIju4BO+3pffo8TzR1TNgnbviwZKkKQxnbZJ49DY=
X-Received: by 2002:a05:6000:2910:b0:43f:ea25:20ff with SMTP id
 ffacd0b85a97d-4515d3dc31bmr210955f8f.29.1778004182992; 
 Tue, 05 May 2026 11:03:02 -0700 (PDT)
Received: from ehlo.thunderbird.net ([62.214.191.67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055f2203csm6396491f8f.37.2026.05.05.11.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 11:03:01 -0700 (PDT)
Date: Tue, 05 May 2026 18:02:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?UTF-8?Q?Maty=C3=A1=C5=A1_Bobek?= <matyas.bobek@gmail.com>,
 qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>
CC: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 0/7] hw/arm/sabrelite: Add FlexCAN support
In-Reply-To: <cover.1777571962.git.matyas.bobek@gmail.com>
References: <cover.1777571962.git.matyas.bobek@gmail.com>
Message-ID: <1B6ED5DC-6808-4A41-B8FA-B2C97C5C8933@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x431.google.com
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



Am 30=2E April 2026 18:26:02 UTC schrieb "Maty=C3=A1=C5=A1 Bobek" <matyas=
=2Ebobek@gmail=2Ecom>:
>This series adds emulation of the FlexCAN CAN controller, version 2,
>found in NXP i=2EMX6 series SoCs=2E The controller is integrated into
>fsl-imx6 and the Sabrelite ARM board=2E
>
>The chip has two FlexCAN controllers, but the Linux Sabrelite
>device tree enables only one by default=2E Linux kernel with both
>controllers enabled has been tested to work properly (using a custom
>device tree)=2E
>See docs/system/devices/can=2Erst for an example of QEMU command line
>invocation=2E
>
>More information about the implementation can be found in my bachelor
>thesis [1]=2E
>
>The headers (struct FlexcanRegs and flexcan_regs=2Eh macros) were copied
>from the Linux kernel=2E Marc Kleine-Budde is the copyright holder=2E He
>has been kindly asked to provide consent, to confirm his approval for
>the inclusion of said header fragments into QEMU=2E The approval is still
>pending, hopefully it will be resolved soon=2E I will update the patchset
>on request if another wording/solution for the copyright statement is
>proposed/requested=2E

Tested with imx8mp-evk: https://github=2Ecom/shentok/qemu/commits/imx8mp-f=
lexcan/ which works excellent=2E Next step after this series is merged woul=
d be upstreaming that branch=2E

I guess the only open issue is the licensing of struct FlexcanRegs [1] whi=
ch originates from Linux? How do we proceed here?

Best regards,
Bernhard

[1] https://lore=2Ekernel=2Eorg/qemu-devel/202603211316=2E18181=2Episa@fel=
=2Ecvut=2Ecz/

>
>Changes from v2:
>- moved variable declarations to the top-of-the-block
>- cleanup
>- removed redundant license boilerplate
>- rebased onto latest master
>- Link to v2: https://lore=2Ekernel=2Eorg/qemu-devel/cover=2E1773866323=
=2Egit=2Ematyas=2Ebobek@gmail=2Ecom/
>
>Changes from v1 to v2:
>- removed DPRINTF (turned into traces or guest errors)
>- removed gotos and unnecessary continues
>- register memory region shortened to actual length w/o padding
>- make flexcan_* fns private
>- used DEVICE(s)->canonical_path instead of allocating new strings
>- changed DEVICE_NATIVE_ENDIAN to DEVICE_LITTLE_ENDIAN
>- removed ugly USE macro
>- used enums instead of define sequences in flexcan=2Ec
>- fixed FlexCAN KConfig conf (fixes build on non-arm-softmmu)
>- fixed style and other issues from Bernhard's review
>- better wording in docs
>- rebased onto latest master
>- Link to v1: https://lore=2Ekernel=2Eorg/qemu-devel/cover=2E1765826753=
=2Egit=2Ematyas=2Ebobek@gmail=2Ecom
>
>Thanks Bernhard Beschow for the review and his patience=2E
>I borrowed some fixes from his flexcan branch at [2]=2E
>
>[1] http://dspace=2Ecvut=2Ecz/bitstream/handle/10467/122654/F3-BP-2025-Bo=
bek-Matyas-BP_Bobek_FlexCAN_final_4=2Epdf
>[2] https://github=2Ecom/shentok/qemu/tree/flexcan
>
>Maty=C3=A1=C5=A1 Bobek (7):
>  hw/arm/sabrelite: Open code DEFINE_MACHINE_ARM
>  hw/arm/sabrelite: Introduce class SabreliteMachineState
>  hw/misc/imx6_ccm: Add PLL3 and CAN clock
>  hw/net/can/flexcan: NXP FlexCAN core emulation
>  hw/arm: Plug FlexCAN into FSL_IMX6 and Sabrelite
>  tests: Add qtests for FlexCAN
>  docs/arm/sabrelite: Mention FlexCAN support
>
> MAINTAINERS                   |    9 +
> docs/system/arm/sabrelite=2Erst |    1 +
> docs/system/devices/can=2Erst   |   24 +
> hw/arm/Kconfig                |    1 +
> hw/arm/fsl-imx6=2Ec             |   29 +
> hw/arm/sabrelite=2Ec            |   68 +-
> hw/misc/imx6_ccm=2Ec            |   24 +
> hw/misc/trace-events          |    2 +
> hw/net/Kconfig                |    5 +
> hw/net/can/flexcan=2Ec          | 1395 +++++++++++++++++++++++++++++++++
> hw/net/can/flexcan_regs=2Eh     |  193 +++++
> hw/net/can/meson=2Ebuild        |    1 +
> hw/net/can/trace-events       |   18 +
> include/hw/arm/fsl-imx6=2Eh     |    6 +
> include/hw/misc/imx6_ccm=2Eh    |    4 +
> include/hw/misc/imx_ccm=2Eh     |    1 +
> include/hw/net/flexcan=2Eh      |  139 ++++
> tests/qtest/flexcan-test=2Ec    |  421 ++++++++++
> tests/qtest/meson=2Ebuild       |    1 +
> 19 files changed, 2332 insertions(+), 10 deletions(-)
> create mode 100644 hw/net/can/flexcan=2Ec
> create mode 100644 hw/net/can/flexcan_regs=2Eh
> create mode 100644 include/hw/net/flexcan=2Eh
> create mode 100644 tests/qtest/flexcan-test=2Ec
>

