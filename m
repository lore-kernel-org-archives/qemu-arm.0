Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98380FF8855
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 18:42:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKKig-0006cR-4f; Tue, 05 May 2026 14:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKKif-0006cJ-De
 for qemu-arm@nongnu.org; Tue, 05 May 2026 14:42:09 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKKid-0004Nc-P1
 for qemu-arm@nongnu.org; Tue, 05 May 2026 14:42:09 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-65c7a459105so72301d50.0
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 11:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778006526; cv=none;
 d=google.com; s=arc-20240605;
 b=a3WijTIgAZCpqaj8zlE/BfNJ0SNklq6K5HOhXqJ5wxLB9XaGOq2gBhiUMj85GZji5R
 hUmwbUzSeLHFQfEQO8h2qgOe1bjxTXQ2Ts1NqEd2fyhzPmTi8Qv7WcjyhSHkcj2f/GUw
 Ra/ZkbeOLCykZd5s9YxOYvnUt6mlYNZWBwf4cyHfwVdKwWhBRiL5M/Yp4gWvGlhYB+wG
 gKgQSzS3DDJddnlDUVRdqXbLyxkFu0G7iNmtcaNirCt1A7n7hxn4uOTYVZbL/EMquQvd
 m53YCqM/3OUdgaUriyO+/i8CfiL3FYXECXf52pXCemRPWIQekSpQc/XNZ+/bVQaIM5fH
 TsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QhWgxVD87K48Iy1+q5naoIAHxckRFpYt2Sd5qZUK67g=;
 fh=drL5BGM1gh60+PR9TYigtb44V/M3+PFlVJFlZZKc/G0=;
 b=iF+KEfAUdO91YCithmrE+yAIuBtpyBkiEFlSqvzP5m+o1ssL+ietIhq9PrZiilDyhf
 D/yMsKouyoLq+kcMZ4hhMOr2yv5QUTKqAGt9Fw9WF8ORYpk3q0PWfWQGhhwTa+46IA9F
 f+6dmVdg4YvbfT//eHzdNlnzDodN7060Wznk3sZzsuFa9fYrIm3+5Lj2KOT27W3hhKlH
 XrafTKUflVBRdfZ/zE41HLr+DGR+Oj5Dem9/9GJ3/bYJskEE7fhA99cdOrC5DaVlav0R
 CCZUtaF0F1nesI9iARnJZrnxKJ/xjTSMwTsgW+gsoJft5p25j2G/ee8n6eEzoetWxPkQ
 59MQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778006526; x=1778611326; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhWgxVD87K48Iy1+q5naoIAHxckRFpYt2Sd5qZUK67g=;
 b=k7eXQ3Xzs8RjBatDpFA32yi9W6dQFvIS0LyCa41dct0iyU0CZU0W/Mq9qwvZy4CapS
 Q/GN+k5vctH0hk85gGk94Q8v/RbYGZSzgWdwCdwM3SryRcC372B6aUugaotbyUk88Ulx
 lZzqe6EuoR7sN5HAPx1bL5cOZHAhSTixHeqcs8yndOzoLbf/K8SQNIvvcDjrl4mfkgui
 FTb8j2A/V+m0aS6a8FA4EkfOytNc/btMWQNpoSkmaG9Af5+FtffUSl8BfycbA+cmb718
 onju4Ah872RuxLoDiTTDo8j9D4zJuNcwmE9u4GB2EKlWV1iv1J1l9NWwEOYvYRKBDaQM
 HYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778006526; x=1778611326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QhWgxVD87K48Iy1+q5naoIAHxckRFpYt2Sd5qZUK67g=;
 b=S7G1Ml6pz8BbyqUmvBfjCN978wnjbSXUEgt+dZ8Vk1ryyfB+zy1Sh+T9g9AXQuV3TK
 1ShwvJk2EOzHOdSmk+vXCPLqTtij1D6/1onwJ9wkD/BpFN8DNqPPPJkLmJY++k9eesPm
 qJHRKkDKtW4/zgsse1ED6r7XWkdv92bOjlR8fMSn60U7WwTV4qqw48L6QPhXCc4qxnEB
 VlgfTqAFYWSZaWagGjoG5x7VojbELs6G003IJm9VUDtt5VmeFyUR7Ts3rKR8FA/BggU3
 m4o8+cC79ier5xRrl+pq2XI3d33W+YDt+f5SfOnDYD8DVBCcKqfjzYBiRlTPmZWn31Tw
 t3HA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1B5XyG/roVUcPswiE12Iz6wIIjay4uXYTnM4OsmYlHO1qyabz6fa7Z/a9jgSf1bKz5geJMgjg1A==@nongnu.org
X-Gm-Message-State: AOJu0YwhCsDOOj94mH7YJLmptq/LOuNION/F7t421hxCQgI59HBxXnYC
 /Ox1uefQC++NfZTeg1dtnqsZOLoF5x3mmZNu6W0zOXF7Lz7l1O9szOwnxVIPPDpiT1vKLm12/RQ
 feSB0yByMFeVrOMwctz4A63V5Yg+LYcV0Iw/TTrc8iQ==
X-Gm-Gg: AeBDies/hajOsvxHsYiQn0u1mk83YjBzMfCeHGQ6Tx1mSsh0ImQ97daQevXmnpQ2nqF
 SXiGeF3a1inoA0Eo2X4c7zK8mjO286quqsrtrOHgOzYLYIMIQWjwkCY5UtQAnceq47Kjj1RJPsV
 GfI0EAlbuEvkIleeeNv+DDfTaPC3Ff2TeVOLgUqEnccWj+Z7OvXJDcwO4POS2Z3obvmNev1MLew
 7PbwcX80LSOWs9vfx6fQSCE8Hx07zCEW6uf9iAJ5WGGOHi6Ln13T2HMze1DXlVFDE8RPZrp6RGV
 Le5J0cPn9rKq0KMk5GdK4pDpRL76risjFuO2ENCKn5IR2KB2x7wRYfRGzzPlvzZz7GBDvauPBCP
 EWQ==
X-Received: by 2002:a05:690e:169d:b0:65c:7492:9d5c with SMTP id
 956f58d0204a3-65c7492a244mr1746285d50.28.1778006526107; Tue, 05 May 2026
 11:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777571962.git.matyas.bobek@gmail.com>
 <1B6ED5DC-6808-4A41-B8FA-B2C97C5C8933@gmail.com>
In-Reply-To: <1B6ED5DC-6808-4A41-B8FA-B2C97C5C8933@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 May 2026 19:41:52 +0100
X-Gm-Features: AVHnY4Jd62kNEZX-JTP15GNvAtu-L-pBRSl-sg6WFwHKHP2gqGOamvQZiBnUW9Q
Message-ID: <CAFEAcA9kQNdx=gwSd_Ec=R2nwegT1R-BEiC9yXvfr23VJHDZiA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] hw/arm/sabrelite: Add FlexCAN support
To: Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?B?TWF0ecOhxaEgQm9iZWs=?= <matyas.bobek@gmail.com>, 
 qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, 
 qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 5 May 2026 at 19:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 30. April 2026 18:26:02 UTC schrieb "Maty=C3=A1=C5=A1 Bobek" <matyas.b=
obek@gmail.com>:
> >This series adds emulation of the FlexCAN CAN controller, version 2,
> >found in NXP i.MX6 series SoCs. The controller is integrated into
> >fsl-imx6 and the Sabrelite ARM board.
> >
> >The chip has two FlexCAN controllers, but the Linux Sabrelite
> >device tree enables only one by default. Linux kernel with both
> >controllers enabled has been tested to work properly (using a custom
> >device tree).
> >See docs/system/devices/can.rst for an example of QEMU command line
> >invocation.
> >
> >More information about the implementation can be found in my bachelor
> >thesis [1].
> >
> >The headers (struct FlexcanRegs and flexcan_regs.h macros) were copied
> >from the Linux kernel. Marc Kleine-Budde is the copyright holder. He
> >has been kindly asked to provide consent, to confirm his approval for
> >the inclusion of said header fragments into QEMU. The approval is still
> >pending, hopefully it will be resolved soon. I will update the patchset
> >on request if another wording/solution for the copyright statement is
> >proposed/requested.
>
> Tested with imx8mp-evk: https://github.com/shentok/qemu/commits/imx8mp-fl=
excan/ which works excellent. Next step after this series is merged would b=
e upstreaming that branch.
>
> I guess the only open issue is the licensing of struct FlexcanRegs [1] wh=
ich originates from Linux? How do we proceed here?
>
> Best regards,
> Bernhard
>
> [1] https://lore.kernel.org/qemu-devel/202603211316.18181.pisa@fel.cvut.c=
z/

Could you say what the problem is? In general there is no problem
with taking header structs from the Linux kernel, as they are
GPL-2-only and that is a QEMU-compatible license. The relevant
source files or pieces of source files would need to be noted
as 2-only rather than our default of 2-or-later, but that is
doable -- we already do that for other things we have borrowed
from the kernel.

thanks
-- PMM

