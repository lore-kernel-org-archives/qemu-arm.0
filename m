Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5223521lfa;
        Tue, 20 Oct 2020 16:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyXzjFHxfyNZqzgpcICxkVhXDLaPjS0O6eWAhI2JtiKZaTsQUWbErDpWNSYIUhY/uoH4z0
X-Received: by 2002:a25:f817:: with SMTP id u23mr1333583ybd.466.1603237235540;
        Tue, 20 Oct 2020 16:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603237235; cv=none;
        d=google.com; s=arc-20160816;
        b=uqLxZQP6qPvJ2Ych6XQmgbxWA6IzR0ua4B/rbapGbBOXaifvAbgQonxEZg7e6Ac4wN
         20wF7k5Kw8iLdkCf47jsCRMeiTS+rxVbK+lDKN1PThK+lKefenQvZHTE6hhLxv+VS1sm
         F5jAxFPfNUWB0qP1kIefgJgHUBILIcHRtd3Yyx5JUmJ5in6zPDGWCVLqQ1Xcy2EPtK9i
         Q/h+PChM4Jwy0mmlG7YPZAZ2qa8wG7BO6h0vPtaGN2tvhtBq93Rw3F0n6Wx02kiXyNyq
         8f6yB+yMt6wkUUb3dc5DRM/WN2TretdXEaGhQhp11iI/RmBXwV2NTmgP4ZiC7yshFjMG
         eJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ny4GZITxBl1x7gXJeqDFvluB75Neh/+3KKa1M6hbhzs=;
        b=QQM1nhifb/2+uOGGZJxlsPTAluydHLEPUBzFa77fLkWSozP4SGUPRTs557qkN9illa
         KX/5wvNH3Qa3ltgSMV2qIj2kuv7Qs1SGaHuVDi9AVzXFkHq2xh1dg1ZLKhsyjvEdUN0J
         AerUSluH+QO1ARVw1Zm3oNK21ADvU1vmwmjE6d0wW8WsCbkGOYLjG9XtYPW092jDBXkU
         Kewqtn8H1Qki2cbnJhP1nnGn7600MEwcRZl/F8/wWCgR4eLPMTyKwzm+cZa3oNGWkys7
         ccmDZ3zfQw6vmzQ3hSTtr7o+2syPizCrw0xou1PqkfzIAmMFOPmoS0tuO97KSznZJuJu
         Tudg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GYThPspj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si338206ybm.306.2020.10.20.16.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 16:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GYThPspj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kV1F4-0003iM-Su
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 19:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kV1Ev-0003gu-Kh
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 19:40:25 -0400
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kV1Et-0003xu-Fe
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 19:40:25 -0400
Received: by mail-vk1-xa42.google.com with SMTP id a8so70832vkm.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 16:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ny4GZITxBl1x7gXJeqDFvluB75Neh/+3KKa1M6hbhzs=;
 b=GYThPspjV41J7fmrlcpFxnMAFOH3rbatOr8xIITZGrggDRi3rwLU9d/mtm1DNhSvZ7
 rT1p89FE7e87Bv9fuUZsJE9PZyvBopVOQvkhy9QdeRoN6xhMPt4pmeuqWr5flWw/lNI8
 iW8U0bJWtJmPZKCfTXEvJ9R3lav3XrU7ikgxxk4t9qKtiAT7PBjsZy9rL+DksO1o/+AS
 inR9KAfoMXl4vODivKJTvXz0RFskJ1bdCmqJ93QRVKMXhXfXT4dwDosRZG0oF/cHNIXX
 bpvmx7RxFewgqXI5br8OUosUF8Nzk/Do87TtFu2+CiVc3kIhPnVxhVhws+OrGg+6t535
 RhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ny4GZITxBl1x7gXJeqDFvluB75Neh/+3KKa1M6hbhzs=;
 b=L5hPUzOWZcDM6VnPH9aMS5pL12OC4PcghyZJkho8jCl7U8KyzkbT65TvZkzdnsmiqJ
 DV2qmij/bbbIc+fOm6pFXF8jjjTe3K3+XxpKd+1FgIeOFRd71fw9D2bARVgUDd761G93
 ON1D8h8Q7BtfRzixzPnqEVfUYbkNUR1gWTeEDpJRDTkUVcJsKAohhxxMLOLqakH2bu7f
 juVvBRjoMk3n8aixMRJBJSc3SGJV5iVy9yvWLRIIYbYMmdhlPyPw/rV5LhajBL9h1jKe
 Fq0/2rTe0q15wqg33vb3gEIrTmR5MmachILCuMilN8edo/IrHlwxuJdtE/vm4D0ZD+ZI
 kb6g==
X-Gm-Message-State: AOAM533K9ncwFmz6CcA2kivXKHJLuvtwkKeeCdRwRQjj2JWmbnCdVNQh
 LwTPXoj3NrqPuNxa/QGkJQ6+7nU1rsVdLsW34tRfYw==
X-Received: by 2002:a1f:25d0:: with SMTP id l199mr296976vkl.18.1603237220705; 
 Tue, 20 Oct 2020 16:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201008232154.94221-1-hskinnemoen@google.com>
 <20201008232154.94221-5-hskinnemoen@google.com>
 <CAFEAcA_-sWHjQ4ct66h=9ZMRqwnuFT+LWPFYLHGuuur2-+C9yg@mail.gmail.com>
In-Reply-To: <CAFEAcA_-sWHjQ4ct66h=9ZMRqwnuFT+LWPFYLHGuuur2-+C9yg@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Tue, 20 Oct 2020 16:40:09 -0700
Message-ID: <CAFQmdRbTxH_NPnnekFC_6uw1KLkf5uNvwL32hezTTo129Xs=RA@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/misc: Add npcm7xx random number generator
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a42;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zbST9w4klc2h

On Tue, Oct 20, 2020 at 6:02 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 9 Oct 2020 at 00:22, Havard Skinnemoen <hskinnemoen@google.com> wrote:
> >
> > The RNG module returns a byte of randomness when the Data Valid bit is
> > set.
> >
> > This implementation ignores the prescaler setting, and loads a new value
> > into RNGD every time RNGCS is read while the RNG is enabled and random
> > data is available.
> >
> > A qtest featuring some simple randomness tests is included.
> >
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>
>
> > +static const VMStateDescription vmstate_npcm7xx_rng = {
> > +    .name = "npcm7xx-rng",
> > +    .version_id = 0,
> > +    .minimum_version_id = 0,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT8(rngcs, NPCM7xxRNGState),
> > +        VMSTATE_UINT8(rngd, NPCM7xxRNGState),
> > +        VMSTATE_UINT8(rngmode, NPCM7xxRNGState),
> > +    },
>
> This is missing the VMSTATE_END_OF_LIST() terminator.
>
> > +};
> > +
>
> > --- /dev/null
> > +++ b/tests/qtest/npcm7xx_rng-test.c
> > @@ -0,0 +1,278 @@
> > +/*
> > + * QTest testcase for the Nuvoton NPCM7xx Random Number Generator
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms of the GNU General Public License as published by the
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> > + * for more details.
> > + */
> > +
> > +#include <math.h>
> > +
> > +#include "qemu/osdep.h"
>
> osdep.h must always be the first #include line, before anything
> else, including system includes.
>
> > + * Verifies that the first data byte collected after enabling the RNG satisfies
> > + * a monobit test.
>
> Some of this "is this really a random number" testing seems a bit
> overkill given that the RNG device is just plumbing through the
> qemu_guest_getrandom() result, but since you've written the code
> we may as well keep it :-)

You may be right, though there were a couple of reasons why I added it.

One is that rngd was complaining about /dev/hwrng failing randomness
tests, so I wanted to make sure my device wasn't doing anything to
ruin the randomness. In the end, it turned out to be a kernel bug:
https://lkml.org/lkml/2020/9/23/1021

Another reason is that the value from qemu_guest_getrandom() isn't
consumed directly when reading the data register; it's latched when
reading the status register and returned on the next read from the
data register. So it's possible to imagine a bug causing the same
value to be returned over and over, which should cause the randomness
test to fail.

> If you fix the #include order and the missing terminator then

Will do, thanks!

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
