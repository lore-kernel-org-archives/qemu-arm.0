Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp624699lfl;
        Tue, 15 Feb 2022 14:19:08 -0800 (PST)
X-Received: by 2002:adf:9dc8:0:b0:1e6:8d72:b886 with SMTP id q8-20020adf9dc8000000b001e68d72b886mr10449wre.509.1644963548278;
        Tue, 15 Feb 2022 14:19:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644963548; cv=none;
        d=google.com; s=arc-20160816;
        b=Pwpo6Afz+RncL4jEx0KHSzK0lmbyW76GaxDrG1UkRFSF1FXKxHWhjezKHM55kFZVXt
         GRxTeFoDw9LzAvzcrOwwVpDrRwzPeK2hAbNCzfHogsZptpeU9pA3CFz8Jq39oKqyPnjL
         9Eq2EwNeVuAPWtoGSO9blY/4cW9JJ50J13mmKo6FCWZe4Vz/CxQPpku4ZGeEmtwOfrxs
         XglQllPN4FA5RqSiLTs9ElUluzUUGz2/9RtGhBwgMTrYEQLCxKJW6VTAHxgv63VY4j4X
         18x5LeXfzMzCv0vwsQBfC9QKvFfhcKfWcyE2tpqn+5D/liE/gRjfc+B2JX6jg748A1Ux
         N9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+GO2t88Z+VbnJ3TDs49HJ+5AsGu6OFL8hFwfMD+4rQw=;
        b=AyD1OwiIjF71MnM/tgLILqZ6oVnBqU+qEMbM6ZOf4YAPYC54hlo0z+6dAZ61dkKD/0
         4X3clyFgJRh2FywoaWDjiWb37YBMUqSr2L6iwK1mhcGRJW6onq4YpjAraY7GgkQGeaAy
         c+NtwP4MkyoYjSfyUkDOus9OVhMiSZRnMGTJKgtYWnQdmmYyChUxrwIYc/JRzJJxu/b4
         G372nZiTFHEpWrv+lj5BZJEzXxl1iOkrY2vJmfR2UCjM4T9dOgDHPBQD6GxGx3ork567
         raLOxeWEINd6q3TrwQooSlp3uhy3hhW2eMboxOA//4BCPPtcZKqjpgY7flFnojbZaYXO
         GgXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+PIijCP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t8sor2918524wmq.26.2022.02.15.14.19.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:19:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+PIijCP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GO2t88Z+VbnJ3TDs49HJ+5AsGu6OFL8hFwfMD+4rQw=;
        b=u+PIijCPMCTsd3rtCl5HoRRCBH2E1ZgonuoxGVTkj8xn1fGegxp+715wueWbj/mKl7
         HHH1OH8KVbjlynld4PQ4yJVvVONWu0Qu9dCzDNj1h1YUO6pZzu5TiZv6vAR9gfVGNv9q
         72gd+vnWrpnoNJNnXYVzzM9OFEYVeHNCzBbWXOBPrlXbY19vpThNac7EVSkRLxDJ5nLG
         xs/gg5fR0UV1L5yUvP+LmJ0nxWckUQ3GKUoBM9xllIu4VWVvVxO96NkmYDX2QI2LWr7o
         bmN0fGK0Y+E5FHk/ZVKcaHemhRlTfcqGjrWxfdE3+C9xQvhARDMCUlruOZhOKiAAtXSX
         ywpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GO2t88Z+VbnJ3TDs49HJ+5AsGu6OFL8hFwfMD+4rQw=;
        b=WerDCuA5D0s+9c807sMU7UPrj4ixvkLpcdzNUUSyQasiw77ytjBVyj6SELPXldWctL
         HNgrT9g8fFngbFjJSbl8i6P2qUGjc83Jl2cruw611yYSrlQF8W5yMoJnauoVtZXA1qUH
         6bS0XThl5UAzzviELTM3Lf4eZnqI3IzURjwa7v3NXDcivwwYJYoLyafUwpeYGXbOvRBG
         t1oijytPJ0VTogfXXTbCjuqvWs52xeAoCPHeOtQbpU24FObBioPuPhfHMu72o3T8gtKT
         42UG3mukGqfESWufa4lrI4OMMVrXTrzWAylGwvOBzWeMxCNU1qhOplcWz/d90gv57emr
         iabA==
X-Gm-Message-State: AOAM5333I23phbPAZynkttYnPGaTOXffqrBYYzc76relGy/rV4rG8b0i
	DntLb5dYlKLpY/84BwK91IJbZZKDu9v032vKlh3EP+0tomMY1A==
X-Google-Smtp-Source: ABdhPJwiI+KEwjbiWKzosr2OIfSTzf2mTfd4ye/13o36sIYSgBNnI6C58uujrxP/m92eOVBTlBiDeAI9qkqD+DtmuUc=
X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id
 l20-20020a05600c4f1400b0035332b70b47mr4988462wmq.126.1644963548036; Tue, 15
 Feb 2022 14:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-14-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:18:57 +0000
Message-ID: <CAFEAcA9-em5bOe7fALC6__Jg_zjeqQTLMLWZ01Hk3JQYr_pXVQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] target/arm: Fix TLBIRange.base for 16k and 64k pages
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9OOBRH4eR/M2

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The shift of the BaseADDR field depends on the translation
> granule in use.
>
> Fixes: 84940ed8255 ("target/arm: Add support for FEAT_TLBIRANGE")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
