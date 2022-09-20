Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1823260ejy;
        Tue, 20 Sep 2022 07:28:20 -0700 (PDT)
X-Received: by 2002:a05:6402:518d:b0:451:6655:5fb4 with SMTP id q13-20020a056402518d00b0045166555fb4mr20299782edd.150.1663684100375;
        Tue, 20 Sep 2022 07:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663684100; cv=none;
        d=google.com; s=arc-20160816;
        b=rY9mmTz69akUZBOsRtjsqag2NDxSbHHKfky1iKSTxhoBWsr+VOZc4jQh2mzkV2BDtF
         6IaLoLQ05W+dj5v5W9oHFOREAp32sxucOemlJTSHR+CxNqeCVuU6l9UKu8jxV9TCcVyF
         wdO6Pvw1vKbsFd6O9UoFMkdZduskdQ6IJbRD7mJzpdQ+SQhlvWD5YEulTpwvQQYe/Rwd
         VtkfpE34FoIqrJzjLgfB7NPeiC4AYDs77oNPJ3seq7EIPZG9iiVfqyD8PnPg1JA3+oGW
         Uxv7hUUVh0WGwvgUV9gaNUPm0Y+wdvsimi7fcPDwR+bd0sCyx+l5Hmmlv3/eRZAlUafj
         KftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B3AHyNWscnobqmFFoD6C1ouVzEGOp3H0F8qEibjy7qQ=;
        b=rdZ0D40+q9PWsTCoxuvk5U7gk2+yqwbhppRVis+/wkupG0jXAU4xmDIa9ggBPqZiRP
         v9MxdJiELebaWsA0ObNLVR5nqJgRrjnMy5S91zYg/h6bnXqLzcK4W7dwKNZk5gukrsfv
         3S0DQ2bUNXP5KbCYOa5LOC/VgT4eCpYhFCjr0tjv1Ceblep4kzu2g6GyuhXIDC7Aob25
         FjcF2Q/5UvS5NuEnx3xi/6wzBslL9sBvKK+qqQqXJ8Hj9VM/u5D5J5fta0DI7XoicMXJ
         l5Gx5AgOQS5/RnqDUODumCL6tLdMtF+SX6VmekQmhSPWPFag4WbjF2M9yt9twV9fvL8m
         82OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGOwGJDV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k9-20020a056402048900b0044e8d39a568sor151692edv.42.2022.09.20.07.28.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGOwGJDV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=B3AHyNWscnobqmFFoD6C1ouVzEGOp3H0F8qEibjy7qQ=;
        b=HGOwGJDVhrbfNkbD4ga6uguXF2J38aQB3Js2qRuoOdcDy6qAu3t4e4d5FM3TBjb2n+
         4d5kA12YiXCvyHWTFH5P3o7V4TyvThNQACYrbAQy+mSTw1LxkYbopOyOAlKfs8QnELBA
         0cX/rMECt6nTrcVGI176HQ8x91jP6n5Dz9S8wSIllV+GFiPOMxeKJWB2y8rACbZ/SEgN
         fFlmt5eJXUZBiRghBak+A99+ja70GxdqOIOKehebZasmt8P7CUfkCpjOH/SbCNahbHKi
         3WUmlGDnI0or7MyY7FEcRVxl3J/+e4px7NPYlGS6wV4etxbKLRAi8G4nr/H+opaNv1eL
         F8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=B3AHyNWscnobqmFFoD6C1ouVzEGOp3H0F8qEibjy7qQ=;
        b=TtVdIzDTLdP3h2Q1KzmjF+boo0JGIwVmGIRvoADIMGBbVjXG7dLf139bpHHNtKfC2n
         8CMUColt2i7T0GXIVA5+GsA37NlHydZToxt8D6Og9n9cbzq4AYSuai5rP0mvxUB/MXBu
         x3pjdJSwpizsuw/jgtw+dt1qT4hhipu4A5Jg8MKWktZJAjj5qaug7deNYVA0EcFxX+OY
         ub/oIC0OGmzkM7wP2IezDmdMHVUXDqWz2A0jfnV7NctXvdjboHdyvK7Gkh2wQf0y/xHa
         BkZjmPDvKUqLIRDVY8z8LwKaduPBT9yRlMeVGfvWTd9Qi7wkTAO3QwtpW18rjMhLY0eb
         qVKQ==
X-Gm-Message-State: ACrzQf2XMna3vG+8vA/a7q7KytRdGtoz8tJNNon9YqK0lFUybXKB9yDY
	yhKTyTzkknv/bGiAXZGzG0CUYhsIxrN7YM9a6JsDvySPpwYoTw==
X-Google-Smtp-Source: AMsMyM4A87S6HAZWTOE2PbzksqhHKzseJeWjsXFWmgdYOC6VPl4jSLnnW65u7XOu307L3YpPQLWcDvJywlmhPr4Wh/4=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr20055453edq.140.1663684100175; Tue, 20
 Sep 2022 07:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-9-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:28:07 +0100
Message-ID: <CAFEAcA8ec=XrjGQMpA1NUDY=zxjo140BMiCMFCwqEFweH8vwcw@mail.gmail.com>
Subject: Re: [PATCH v2 08/66] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AH2byUh4iXz0

On Mon, 22 Aug 2022 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
