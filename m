Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1834495ejy;
        Tue, 20 Sep 2022 07:47:03 -0700 (PDT)
X-Received: by 2002:a17:907:2711:b0:77a:15d6:931e with SMTP id w17-20020a170907271100b0077a15d6931emr17301098ejk.154.1663685223288;
        Tue, 20 Sep 2022 07:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663685223; cv=none;
        d=google.com; s=arc-20160816;
        b=kYxCvyBucp5+X5fAc83XI2R6nuDVw2NIVLwSdrSJWZ3a9gntZcgECNd5U3Y46YEzwb
         mXwMe8zs0BE4YbB6QHv9l1e0PV2aEVM3htsiAvDPgHe4uB/ruh8rSE7P10HgIQHBGtMH
         rbbPMrrGV2vGLjMVdZTJ5fb2RJ2h8q9e/JGhr18CmQgWCN0BQIuzfBcs/arCC8efCQKK
         5BViFuJ0hjbY+ft+C2ln8hfeTmrXOaOG4jmVV9B4oKjr9GMgkj7NBfEC4LQWFZMpLVrs
         Ol6EliIRtYAZwHKsnk30nM6v/M8zUilPaJMMOhmjP5jMq2sE/T21NYx9QJpHeS7bUmcn
         neRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N9KvHJ2UuOpNu4tSSK6u1AfaR49RMbabaXRqo5WP64g=;
        b=z30mA8Wro7L4jLy4yH0mofTr5MWPib0E4d61HdrvuPEu2JygEA1Hi7MByOFXugZoll
         QVOPi1pgr5LJgsw4ou8+WRkvnK/55rgIBLCOFfw4ILJM711F/a5PjDUFA7xhjYEaHItd
         qVqm//LUaHCzwyDK1aZm2FTerAY+9gIe4L+o/GyxsAvh5Prc97xdnls7u7IlpouwVUXs
         wvU36Ba1fykKJJ9Mgg2cM7nnRIk/1+0Kz5/rApj9b8gp3bGn+dbqdEzTlSQ9ty9QmJtM
         9APPETeB91ughviMclQv5+B+y92l03R2eBAKSFtLW10oaZSOZCeBxjG4F6vPgvVqO1PA
         dsNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Nh0+/ijN";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10-20020a1709062b8a00b0077d1233d59csor837425ejg.49.2022.09.20.07.47.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Nh0+/ijN";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=N9KvHJ2UuOpNu4tSSK6u1AfaR49RMbabaXRqo5WP64g=;
        b=Nh0+/ijN7v13QU63EJbG1v6magZtdM01hR4m3rQ+1PQlYsbYfm7hVBIU1Z/kVsCFtR
         t3mBiTO9F4TzujkNesH6gzwgdGGq0wvrYcV80j+nvv+4j6SrNpTVt0wmU7tj2j0Vf1wr
         a++sJ4BWfi28z4+X56BsBZi72NFCtrp2QP10/RGAvb6jPvsYiDsgqQh/iCYwAD4xQIzV
         dc9sKVixMugeh6eT9er+GfsQn2wqOnGhdqNuEmoRKRx+OV8LWlLwFVrLbUVbU6pdbQvx
         BVV+oBelQOkctMM4JDw5YalIdcrG9FuecVppiI5RrjYN8b3rGwOu6wy7E1QR3Ir6Vm0e
         1pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=N9KvHJ2UuOpNu4tSSK6u1AfaR49RMbabaXRqo5WP64g=;
        b=eOgk2RhejnGh8EktewZfvRCOAKWRvr90lacJpLdhVOJuY0lTancX4xkAC4SoLvW4fg
         53fsZ7hYWjcbJMUEbjl4Yn8tFgY4s4aqNyk61mmgoMq1bNf7wxx23tUNQhyGV7HlqaQB
         KnqP/Cd8u6TUX8H63mrNRJ0Bp54qx040HJfd8779aZPVobAB5MlRNr53Z3BLBYzHNOxO
         HvbgezHjQL+yDNIxFaTZDkcsx/cFDZ1U0zMf+e0UDI4CsP2MCy4MEEir5PZKT2YJUR6K
         jO/RNYlMvF3YSJu7/aahcXgE07zEd6ceJryGTyw8Yhhothh6z7I88ojORBY58hn/CbAU
         chpA==
X-Gm-Message-State: ACrzQf3eSDSD6VyRrhNDoH4CM+AE8qrhaP/Emil5wy4jLEThzFSgjHj9
	6qkI6jgiD6UvL6obrG2aY1Y3BEtkW6lTW2mK0qtt/6vT
X-Google-Smtp-Source: AMsMyM78XJrg2ro/xZBLvYDKUBsrpnPy/V2ktgelo0na591prXsF9fIfePTuspNJ0xdY5gNIPW21n9KesnGxSvIxM3M=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16714747ejc.619.1663685223031; Tue, 20
 Sep 2022 07:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-17-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:46:49 +0100
Message-ID: <CAFEAcA9piGJZe9cmP1gUAJZRrh+2xbGJ-M0kr5sJP5LcYLkDXg@mail.gmail.com>
Subject: Re: [PATCH v2 16/66] target/arm: Add is_secure parameter to pmsav7_use_background_region
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: D2jRnqOmlf2K

On Mon, 22 Aug 2022 at 16:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from pmsav7_use_background_region,
> using the new parameter instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
