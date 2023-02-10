Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2027859ejb;
        Fri, 10 Feb 2023 08:41:57 -0800 (PST)
X-Received: by 2002:a17:903:2441:b0:196:3088:5dd6 with SMTP id l1-20020a170903244100b0019630885dd6mr18814732pls.13.1676047317558;
        Fri, 10 Feb 2023 08:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676047317; cv=none;
        d=google.com; s=arc-20160816;
        b=nyh+q6LhInY8akVeFwMZFEfCNRQycdD2HNYHDlG0KxHQjJpNVDBDQ76JK2YAZJxOiY
         fW7lXfH3+udA9WZfb7dC91Dd3E9w2fUv51NfomYToutBQFoJkMn1BII6Nngln034b4uS
         J6dDJRJXBx7jdXtGJW5pTHHQLcGbeqJIfYWsN+7b+ecZe6LHOGvt1xRcH6UPk2Iyzc52
         yKC/NXWH3XUyMfnoAtMu2Orfx6J+c+87n5aqqwFT7EQa13C+MCeLzTatWYOUDUDXtZay
         5Q8evDnjDk0hrMVSvEN9KX//O1nnKNbMp1bWkcWSURWKrb2mR3KZuecosYMVrYwle41/
         Kfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X+qGC5SWOOoLk1GEHeJ2me9it/52x7tT3pbTxhNtiV4=;
        b=ZZ+8zCxfisaVpbvX7KDYvJWBqmoPwA+2dHSoSpynxjmbr313zujvlfEcg6wBYInzM5
         cFU2YTHxKZ7SeILLNlhu/xkrZRDtzIZHP3FlBYNnxQ0OXJHbdO4+AxzY2067vm0EsNmS
         v3AKy/JPNbpZGkxXi/8zxhwERJGbPmZ/KtDvPan2M+oUQOFBPBI9AuVTYbUCX6MTPK+i
         3vtUxLRsmIDJtbgb+Sm+y03AlJrF43G7w1FEPMHmouVgtHK08rTG5yFFlBJVft8duVv6
         MfCc3iuO8UzPibbk2TYMoL7XXe7EMjREaVF/nXY0EbAq9JZ1ts3aS/iWC9kKZLZGJ/72
         N8JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8K7cPY5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p13-20020a170902780d00b0019a73322bcfsor1023354pll.3.2023.02.10.08.41.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Feb 2023 08:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8K7cPY5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676047317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+qGC5SWOOoLk1GEHeJ2me9it/52x7tT3pbTxhNtiV4=;
        b=f8K7cPY5lj6EO/ZQCg35x4lWI5uwE1chXDPmm00knBwGQ7w7hhFpwdz96LNKO7V9BY
         Q8Q62u5aBs07/Y7ATEwBVE6w9T/FHsb38rEz/d9TzE5xKKGhKNYCIcmp5LrGxb0JHD0t
         uW+YW7XGamIALaAXdCMEi/e67EMRa1WpIm9iw75ThDRq68sh7dvM5aKq3wMgpwCzd4B8
         yVir3InolkDeBnZoFf/g+Wb1X46RD43TCa1ZGKMyYJKvsR3po0EMd72gMLx1/DXHnMRS
         MeT9nMVMUovX6tlruOPQSvMpXYtk2zMpCvGyYyN5qJNHmnJWlrOSoy0R2oDdU6Vf0jmb
         RLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676047317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+qGC5SWOOoLk1GEHeJ2me9it/52x7tT3pbTxhNtiV4=;
        b=vOTMJ+CaHN/exN79E5oeCjh9Mtmro6LBa0bCmJbRlmDnOpApcyxgQOxM26pq2HBJjM
         C/qDaxu2GYAxYxdLIvkvxQbQNDsR6RwNOhuJwIL/jHEf5NQaOT1CpG6HOCvemM9nhDCf
         p3FOa/FYvcR2XNrJq2ltVmi8ByX1Gf3F/L9m+veFiRqKUvSippmbpHevYZNIM4baL/pC
         yJExU77oSmRPf6MqFgyKRXn22KhMprBiCmZQ1AedR72Dp8oiRO76Wsbq0VPDkcgChPVg
         IGHZlLC8vO9rpXcvPDv0hd2DIG+CfhqqsRthemX6RhpPeB98rmOeB7Wl5JkJHV3Z2j7e
         nIEA==
X-Gm-Message-State: AO0yUKWZGxerQyyXOpv8C/gEaXy1jyDGJFNNNkRJqVgKHaDgMTtWO4Qt
	5VbHlUHeXTdROzEeZmr4S5JhvBLsNwy6BT7F32xPRLoX
X-Google-Smtp-Source: AK7set++LG2FX8h+40bUEiyItImiVzPvFV3KtY39ysDXOPtVv81YH86qbOwfq/bCCOR/AUC7arNkjbc3rzRX7F/kC9s=
X-Received: by 2002:a17:902:6b88:b0:199:1458:6c67 with SMTP id
 p8-20020a1709026b8800b0019914586c67mr4094867plk.28.1676047317057; Fri, 10 Feb
 2023 08:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <20230114161302.94595-2-fcagnin@quarkslab.com>
In-Reply-To: <20230114161302.94595-2-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:41:46 +0000
Message-ID: <CAFEAcA8cOKCDF5_oxNLDd7JzvwUCC4_g_8RRmwPK3C2axLHuAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm: move KVM breakpoints helpers
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KQKxawU3+WRj

On Sat, 14 Jan 2023 at 16:13, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl' and updating meson to compile
> 'hyp_gdbstub.c', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
>  target/arm/hyp_gdbstub.c | 242 ++++++++++++++++++++++++++++++++++
>  target/arm/internals.h   |  50 +++++++
>  target/arm/kvm64.c       | 276 ---------------------------------------
>  target/arm/meson.build   |   3 +-
>  4 files changed, 294 insertions(+), 277 deletions(-)
>  create mode 100644 target/arm/hyp_gdbstub.c
>
> diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
> new file mode 100644
> index 0000000000..22b2b7de7b
> --- /dev/null
> +++ b/target/arm/hyp_gdbstub.c
> @@ -0,0 +1,242 @@
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "exec/gdbstub.h"

New files must all start with the usual boilerplate
comment stating the license and copyright. Sorry I didn't
notice this in previous rounds of review.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(which means "if you make this change in the next version of
the patchset, you should put this Reviewed-by: tag into the
commit message, so that reviewers know it's already been
reviewed".)

thanks
-- PMM
