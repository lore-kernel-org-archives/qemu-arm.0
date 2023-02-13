Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp383964ejb;
        Mon, 13 Feb 2023 09:11:41 -0800 (PST)
X-Received: by 2002:a17:90b:1e41:b0:230:c96e:fc4a with SMTP id pi1-20020a17090b1e4100b00230c96efc4amr9576952pjb.1.1676308301433;
        Mon, 13 Feb 2023 09:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676308301; cv=none;
        d=google.com; s=arc-20160816;
        b=D9LE2H/aRuIyXIJSUuB6mpPYRikXP+bAAwyXNLf0T8ap2+D1RSdk1saX1bgU/8fYlp
         d0CEQ9sdAln6xcbckoEZSijCmKLruzaqT82LCUyWMtSdL9x/aA1NBt/k6ROml8BuIREN
         Gt0hLooQX/cPxYjYST/9os/J2W6OzWREeNmAyMTQk2/6m63vZlJtZOmULzGHtW+kBhbv
         hegz/QwGsGWt6obKR7RiZz7OjnXttu/JtMhQZBVZSzSdE2ofNwg7vHN2ug1XUaghyHOH
         WY0wlMwBJi+/zZIJcoC3NSDx3f/G0HrlsiGmovGD9sPRnVUX9+ZX/hsrQ3wzi/ycaGYp
         u4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oVX6/A3JGFds8sMuszFaaFmMhRFssJSfXrFF3tdQbtE=;
        b=GauC66nszccAle2nomozxwJrQ+c09u4d5DoUFDYYIXoxVS7Oz9DHb996Jt6brQO+JD
         bLua+dhBTVylGItoTKOYi+b5qn4X/uCGOMAmp0+M/jGBdS3+4g88llLiN6YqhXIE0/HA
         M6K0ulSrpgizfNcERJgc7GMZDxCTPuOdb3LX4UwiEtmVJibBcB7wFOhc+aKSOIFeLG+A
         6VRutVOZd36bvydL4olgUAi/lcEFWVsaeTOuaLrH3oSVUdsf5HAwyCnKkNuAUIE7EqDi
         mu1XO+OF8mppBH1A+Wvx+wRWN38zLmwINSSSYLW6cvQUwG3zIfYBXxElgmDCgi+lOcsR
         aEOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJ4tFvXR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x15-20020a17090a2b0f00b00233d21618d2sor2139788pjc.2.2023.02.13.09.11.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Feb 2023 09:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJ4tFvXR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oVX6/A3JGFds8sMuszFaaFmMhRFssJSfXrFF3tdQbtE=;
        b=tJ4tFvXRnWAObqtE+mLewg9UTQH3bnrRK5SCEb1ehqhVuJ4o/upwpt0i1/kFanxq52
         gQb+zZvXCPI37uDdRI8gtUPJdfGoZqK/oFS/UofauN6uyNDIcVs1PgPK72dOq9tzIrIl
         0MMycRAZzQls4t8u8+8GQpCSS2J+6m7z2rwmZZlhjvzsTu8mR/Ib0LESrhWP1P1azE2N
         UGcUHEo57H8XTtCJmfhwhu3dL22LfAoxyyWdFg1aDUvJVXsa/yCY5fMbZQv/3KOFiLfg
         ABlWsmXlGWWszN9ypQsh32om/YwORE99dWnB2AJuQG0FrsoTXYeQGp0cSfVVeg40xbZw
         +DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVX6/A3JGFds8sMuszFaaFmMhRFssJSfXrFF3tdQbtE=;
        b=OVEqRAR4zgSF9vml9L3SFHRWgPrT1b3D3yBuZefhCGJdLOK2x7ixgQS6mUXJPVEzlW
         1PjRuVXx4Vj0vvfUTRxlHhH2xWH7IOiUB4AmZIGdiNcJI9bhB4Wak1skwS2H1i5tWyGK
         +C/n+O0ynW0jy+Mt0QFsv4Farfm9zWmB6O0RWhL8amJeqGSnPh5H6i5F7nUMp9EsITjO
         FRS3FWMmQ86hF2SXChmNXNUKPWLKDyyMjwPp4Qf40N+sZLJpHWQzgu0EaW4odAqiFUS7
         suqy+NTqpDRogyV1CxGKfqydlvTOOAtT3wAjLb/GsfGKxcCn7w38aigFzCv9DbYtbwgx
         axnQ==
X-Gm-Message-State: AO0yUKX5iTURF6jrc8VEtXALuWsfGNYcVhb6X433Jm3QXz82L70v7/MW
	fQNWypckK/i9Kxb32Cd1kBJwtNKdJdIZtKQF1c4zaWnD
X-Google-Smtp-Source: AK7set8qQ6jqGJBfa0APDgrIVqOYXgGsKSKVbON+uUTCbvF/wxm/1Q1WXptLLkZX5l0G2ao5JBq7ucJ6gJv90tTPWv0=
X-Received: by 2002:a17:90a:15d6:b0:233:dcb5:ee15 with SMTP id
 w22-20020a17090a15d600b00233dcb5ee15mr1439459pjd.92.1676308300971; Mon, 13
 Feb 2023 09:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com> <20230202211129.984060-8-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-8-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 17:11:29 +0000
Message-ID: <CAFEAcA_XAC3rT041oB_3aC25kuoL8zoABR+bnNJ47iVzasZMAg@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm: Add CPU properties for most v8.3 PAC features
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8gHkyJETie4u

On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h   |  5 +++
>  target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 72 insertions(+), 14 deletions(-)

Do we really need all these properties ? Generally we don't
add CPU properties unless there's a good reason for the
user (or the board/SoC code) to want to flip them. The
more usual case is that we simply enable them on the 'max'
CPU by setting the ID register fields appropriately.

Somewhere in this series you need to add documentation of
the features being implemented to docs/system/arm/emulation.rst
(just a one-liner per FEAT_whatever).

thanks
-- PMM
