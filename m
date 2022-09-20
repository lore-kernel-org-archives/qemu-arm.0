Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1682868ejy;
        Tue, 20 Sep 2022 03:23:41 -0700 (PDT)
X-Received: by 2002:a17:907:7629:b0:776:a147:8524 with SMTP id jy9-20020a170907762900b00776a1478524mr16278655ejc.632.1663669421050;
        Tue, 20 Sep 2022 03:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663669421; cv=none;
        d=google.com; s=arc-20160816;
        b=mV5nZWmjCokpSbz2dEWgjRa8VceL8HDw4u5IfXgttyw8Se67+B81eLlH5kLF1LHc1n
         O4DLBKlRY61weR4IRCJtqWPP/Eo4alhjdlFIgqyhiR0nUfIrScQSw0IOMl/SfPVqNbhA
         1Dkzs5VUUXlC07LbNsLPAefTFnrHBlJvXMK3igBZhLG5iF6+vx4lGbxWVM/Epa6jGg1g
         wFr/QuLSY9OQc3rk36S5wi+5RncfhwnlnFduC9Di90jWS9C94Sr+jIqHsEUk66nH/k7y
         3sg+Ya27QfI1Jc5zY4ywMY2wfRhK/dmmL0eT22DzBcymemMTf3UZHdKhU8I34KlfDtfy
         KHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8eCfwXyxbVOtx2Ul+DNXv/DSwNYB7qCIpdD5hsi1mk=;
        b=hg0EHiHl948JZZ471G5BSzZdPsuwT6VREKzE2yX63QcBRVVsVADuR+oGBL/cD794eT
         7SR4HkQu8nwJj00JSHgvVxNSQsowpisRmhiKtDVtLejWsi8gB+znRsh8IPyYCS/5to2G
         6ZXYV+uiHPtSFvo4rkcCCuidQvEEDZLusP9+y0kyFq8L41UzR6t/HNR3doXyh8qPAum7
         ZMqcwLXinf2s0XXsDtlSPRt2MZdo8EZaymPoGaTIBQcDu6Y0Zl0DP2iyj1SkRHF4yQHR
         jSHFbKVyaYK9jpkNwtlv9AD/+sXOe8wfYD242P+S+dpN3ide2PIQDEmqs9y4w+o3luA4
         O1sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/zLD7v+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v2-20020a509542000000b0044ea9e6028dsor652294eda.51.2022.09.20.03.23.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 03:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V/zLD7v+";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=p8eCfwXyxbVOtx2Ul+DNXv/DSwNYB7qCIpdD5hsi1mk=;
        b=V/zLD7v+pJS/vhTgPfPSnoo/yDG/Ihd/bbgAstY0oJeQYD+e3SOVJxZJhQw8gqT5tN
         CIuzEq/7yU1SrXjMtjdK0Hn9tsSigKWvGNqDq90UoAShri0FMEVxJSHfLq3RgYq7DbFh
         PFMdZE8tWg3hT6mS1/b2Sq9pOG3QQJmZhxu5roHd+fkuBMb7wLDeVzpAkyZjmJ0mO58s
         M4ySeksbvhAzdZHrwYFoM5OOdm9yGcaYtpnOC8bPAlzWLIolOdtOjWeOySZOVQAK6YS8
         +i8uCMApcbbnUgOb9wUK9yLK+iczFZzN20yDpoyoRLIFYZEEtBE3gYa04CpQRTy6RGMq
         Ts8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=p8eCfwXyxbVOtx2Ul+DNXv/DSwNYB7qCIpdD5hsi1mk=;
        b=SNadOZM48zEX93qMjUXq/8X/5YWbtt4TPFzCEWrR6VmHK5eJKfDFg+41hPGMeYxBQN
         L+kgSD6eJ/5dx2Wg993WQCFvUGKqI20XVT+98vUmtmmfc8rlvVWyUzu7x41Brzl8PuEo
         jlXG7FM7LsPWDkniK7aKm+wLGDnPDNeYnUluk29Z51kOiMzo/Z4FNOlBfV2G5s4mrMc7
         HuRTQi51G6MXBLDA9rn62vG3R/7V6Q6g/jvq5ZoZpt38Ouln0Zfq+fNoOq2iEwEI5OKW
         LFzX3OM1HkPPDgv0UXETeIg/ftQ0gDxAsnYLAtKV8jZDO95wAZBMZD6hXNVu7IKnwy8y
         Zq9Q==
X-Gm-Message-State: ACrzQf2fyJgLgL7zMdZJ5lLXPtZJZo0ilhAjLL/4+px0M0S8xtB+hb/O
	sUQwL3DxdOg5pwe51E+KGQGnltgXgPtWGlX5msVg85nh
X-Google-Smtp-Source: AMsMyM7Qht2sxnNA9eNB+N2aI/7oFJnoxdXcyfEnqiteHuwOUMazpHH9rW9MVxjStrwV8i/FViuhOQgysgeGIfdPHLw=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr19758223edw.53.1663669420852; Tue, 20
 Sep 2022 03:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220827180702.39462-1-frederik@fvhovell.nl>
In-Reply-To: <20220827180702.39462-1-frederik@fvhovell.nl>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:23:29 +0100
Message-ID: <CAFEAcA-QJOua_ZhnJXrSYw95xBZNbs9QSUsrZtd-C0DpfabdQQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: fix the position of vcram for raspi
To: =?UTF-8?Q?Frederik_van_H=C3=B6vell?= <frederik@fvhovell.nl>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Bishop <cleverca22@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Pg2Bp+MoSME5

On Sat, 27 Aug 2022 at 21:09, Frederik van H=C3=B6vell <frederik@fvhovell.n=
l> wrote:
>
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> The previous calculation fell over when I tried to create a 8gb Pi 4
> because the values were only 32 bit. However the quirk of the Pi
> hardware is the vcram can only appear in the first 1gb of address
> space. This also limits where the initial kernel and DTB can be
> loaded (notice the DTS for the 8gb Pi4 still only uses 32 bit sizes).
> Fix this cleaning up setup_boot to directly use vcram_base and
> documenting what is going on.
>
> NB: the aliases are confusing.

Hi Frederik -- could you say why you've re-sent this patch from
Alex's rpi4 RFC patchset? As I understand it, the code as it is
at the moment works OK for the rpi models we have so far, because
they happen not to have enough RAM to trigger the problem, so
this patch would only be needed with the rpi4 model. Or is there
a setup with our existing rpi models where this fix is needed?

thanks
-- PMM
