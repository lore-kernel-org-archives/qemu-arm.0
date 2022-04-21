Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp294829lfk;
        Thu, 21 Apr 2022 04:57:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAUK5iRFUIWU/YawljdEPgOPxWUuohPsHXj6ilQPxXdv710P+GvZvBtxlbtGQoE4Cdc85q
X-Received: by 2002:a05:6214:1d25:b0:441:6b43:6e29 with SMTP id f5-20020a0562141d2500b004416b436e29mr18983042qvd.28.1650542270758;
        Thu, 21 Apr 2022 04:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650542270; cv=none;
        d=google.com; s=arc-20160816;
        b=hUvB1tz6nO09Vm2QhwUyM20PjcUqfyGNGL5duQztC/LjAV/HplrZSeXxsSx7C48hBU
         Ke6YhylkvlToUibEgMKmFAsV+AX+pTXuMdKl5/TcTrpc4QVKu9ZPkD6rdsaIwO7CnZ1r
         HUMEFlpy/KyWKWijNXIohcUHHWKPqtkp9mGjuiTfh3xUgGUG/4WCQJxLdmMoH1iWyGYQ
         eRAgBfM0ZKlSx2ia2j+Mnw8n92qTeRb5uIdwyJlkZWPd2g12lD/FLF8pVzUf1qYTsUhB
         nkDMPfyHk83/vz2mq8dWStbux7pG4tzFrsDBPPMYu6V+xgg9LQ0xwbtj2wgpe0HiKH7g
         WM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFFa6K3zug0VPXPEIBmy+xyMxywEYUdRgjqzX9LBOic=;
        b=I4y54Nj+0PQ5UFKQEkAM3X5LK8mEgt42RHUVSlrITv1kR2mc3dwPSm+hEt0JMA/fSg
         NQjI+rj46YUY1hSUhdFFj1VS30i/0+/7PsOz68Yr6NlesjFOkxutoSe0HrOkuLeEsD1G
         DCTAeQzxHlL1f4CkJts+P/0kwYWznvaYakrHdNQxuUrQ73o11piLCoNQDs9Z6qtwSUSo
         Hcig3moKEBJHsj+KNcQaED7w/5zH2tN+gCTMOoTmsK17CHonaGunR41S4jM4BYvtpoi/
         4pjvc4YGuC3FvOg27/v/Sx3z9KZiFpe9dXFRFeYT8BoEilRcCIS7h3X+9X9C/DS1kM5B
         L1qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=taVyFISf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a0562141d2c00b00443f12de2f2si1343072qvd.75.2022.04.21.04.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 04:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=taVyFISf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhVRW-0002hB-7t
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 07:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUyv-0000HV-B5
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:28:17 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUyt-0005IU-MI
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:28:17 -0400
Received: by mail-yb1-xb29.google.com with SMTP id w133so5495626ybe.5
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFFa6K3zug0VPXPEIBmy+xyMxywEYUdRgjqzX9LBOic=;
 b=taVyFISfuh6Zik7b/CAn3yP1ihc5CD3bQHx+M0lFxm1gHaJI1cuJQs2T/EiCM6bjX6
 9nM+Q051xljVq9+Qa4MiziFNp/2Uke6UDdWE+QiogfijYkAwsJW9hJAvt55T8LBhVdUK
 avl6uk8d7PmiOPjrvPQVjWT5qcMOSS9tHNu4JbVBNkpQOrLOtYoRCLAYyF19iWEonCaV
 pG+D5QqHNl2pBc6q67y5UdicN+TYHiSB1AQjOjTd88YvYcofb1HQa9sSBQ3iMtOKPe/t
 B1yTtc89rkHSXYhm/kGoJSeHNyVva/h9zXiEniOBUNoIvhtNiwazvVHpnwXZOVPKpPjy
 egQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFFa6K3zug0VPXPEIBmy+xyMxywEYUdRgjqzX9LBOic=;
 b=WrdmeKxR6rrB6r65pRD1+IatAcwItyMU57yY2AiGHwgg7pH7UxsJLuU7gkM/b5u49u
 rKUV2wVjXUjHIdROB6+XW2GCtR7f86N+ypPuZpAvASHjAwz8qYVtSfLhGkaywKXA3lQo
 lvZqgSm0CzStBMRKSCrt6GTEqDQjMR7KaagxnZ0HP0CvvqvuQIr9oWgmag/aBM1vZhl7
 rjBng4YIVkmhUAwDqJ30FVHfLlLXDwNErVYauKgP3uzfoTHLbZYTLUC0cO/krjg5Lla9
 eI5uYj8KArQw7Ydk5z3OGugzXp6wCJ/7RN8aMa7QGsU+DsHC42mT+1lGykZsDaZqwkPu
 VBaw==
X-Gm-Message-State: AOAM531b+6AtTXRIjJG7g+8mLTS3YIaBPUaNfqD8GnopdLkF62p4dFXl
 3Yj523cGWoGrBk2+4j4l58wyxKAhYhimyEInWHmvRw==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr493447ybs.85.1650540494606; Thu, 21 Apr
 2022 04:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-12-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-12-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:28:03 +0100
Message-ID: <CAFEAcA-7u_MNBb6XoXvNpRe00BJg-L9m+2hbaZe3GPa_D4B8ag@mail.gmail.com>
Subject: Re: [PATCH for-7.1 11/11] hw/arm: Add NPCM845 Evaluation board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9bvTwj+Rn6AZ

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/meson.build       |   2 +-
>  hw/arm/npcm8xx_boards.c  | 257 +++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm8xx.h |  20 +++
>  3 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/npcm8xx_boards.c

> --- /dev/null
> +++ b/hw/arm/npcm8xx_boards.c
> @@ -0,0 +1,257 @@
> +/*
> + * Machine definitions for boards featuring an NPCM8xx SoC.
> + *
> + * Copyright 2022 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "chardev/char.h"
> +#include "hw/arm/npcm8xx.h"
> +#include "hw/core/cpu.h"
> +#include "hw/loader.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"

Don't include qemu-common.h unless you really need it (if you rebase
on current head-of-git you almost certainly don't, as it now contains
only a very few things, most of its previous contents having been split
into more specific header files). There are some patches in flight which
rename/delete it entirely, so if you don't #include it you'll avoid
a conflict when they land.

thanks
-- PMM
