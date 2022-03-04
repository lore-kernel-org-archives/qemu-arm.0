Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1506337lfo;
        Fri, 4 Mar 2022 03:52:50 -0800 (PST)
X-Received: by 2002:a81:a196:0:b0:2dc:489a:fd9d with SMTP id y144-20020a81a196000000b002dc489afd9dmr6037363ywg.144.1646394770448;
        Fri, 04 Mar 2022 03:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646394770; cv=none;
        d=google.com; s=arc-20160816;
        b=RvTCxiGjDFW4wB8n8OroFELGY47TI/58yz7rcm+nSTmj3NbMqiXX7fsN3d2S79Rdyd
         sVDO+hmlQEFYS+BCsK4iZtbUXOPpQsrzYyn1zIZz+1RneejU9cb4lCCQkcPucTqzwV5m
         GMJvHxlPnMlMwv3VyoU5es7VCt6kwzPUQTlZZs1enxfskFJ/VnOJTMG0STCsYAvujyFX
         0P03E+xSXQ70Jme4LYAxNcz2BkC+nnTLWhMdGbH4wDB75N/06FBSw8r4cWjcjp/s74Gv
         NHpSRHEZi3lGaUqcSfvy4eeCWSQkjY8FbVbV2NIzxCzqFK8fspex3hcmAo/Lj92zCzz4
         KXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m2HTDSBtJzg+iKRymQ1pqcjCbMdOpJAgtBxZQUXeU8o=;
        b=cgiLnn71s/LQ0lPXp3P932MoI0Zp+e0pAi11uihIgrLDZxn6Ze92M1uoYhZAV5/tXb
         FKeYFRi1ehL3wm6+cqUeDn1reQT39/oJ9lLUpd3Kr+Xs1dVRdObSCDcxfQURzHUFPeWM
         EvSwM2UswUyAqzSpaR5giLTbpDLPrOW1w6tAhMJcnF+8xUy2h4OBBw3/g1UGmBjHAcqH
         laD2ObyGeC/lGffBWO0Vi0mEkaHAFkF2ruO1QAv0Nsf8PKt1j/mFiSVbOFC7mtt6+vC2
         NRVAKgN0l0j21rSnabT66SZUR8a8Ypa4ZHERD/EseWDILRrphDV64ea2DGwepfj65NY4
         JJWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVODVOzh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t5-20020a81e445000000b002d82aab98ebsor588824ywl.127.2022.03.04.03.52.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Mar 2022 03:52:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MVODVOzh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m2HTDSBtJzg+iKRymQ1pqcjCbMdOpJAgtBxZQUXeU8o=;
        b=MVODVOzhZ+Rf5wiRqQIqkHr5PY4+Eu33jjWPm9V7dVJm0kw9asBWUzReosDOxd9FKB
         x1b53H1jlrqt6VoxrObaKxqkpZH7+qEG70Jkx1L9nv6tQuoQEi805B6NWz4o3h893tx3
         4cKYC+xU/9ObA7ywXyVhRef2C3yr/rqhKio5chdPxKaxWej2WWcyWrKjqzoZClvT4tSQ
         FSCxRJiAgMgzmW4cVU3pn9b1EUQ6dxwkR5WzqJfWg/aywrHLy1YXPuWh8hhGRwIht3IQ
         XGStviJ0jLxB0FXQzNbZWjjq/lSB6iKnJgWzR1LR5rWuNXOEWXMs7RBOczsMWlKh2lj2
         DqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m2HTDSBtJzg+iKRymQ1pqcjCbMdOpJAgtBxZQUXeU8o=;
        b=IgwQxCoCrjldbb7CS3U1q0lG2okqG7DvMf+jFCAf8A9uGFywlUa+cUYOEJOWwyw/EX
         EnW3faIKWozgKGx80DYx2Uh8yDWWoetp/Ti/bxa0Y+zFgMpz9WEQPtsfSwbSupfedDk1
         GLX8384jRrB/lplvFSSzZyZwDBQdQvAnmGTLa69Upu3l5YHkNSUEZYx2Sr87GMfPw2Jb
         mK2/DhgZuh0tMDvQxTkvMCtjGvM5w8QK6fsFiVMD4oYDT+OH/rNWHuxDVNcmqLuL9nwV
         NGZcj0i+0MzfrqywU4FYpwMlzWd68TdM6o3CPPY8NK6gzggrvGQmHcaNxbufu+blhGm8
         EgZQ==
X-Gm-Message-State: AOAM532rViuBRK8YxQTzS6f3/MFmXnXPO+vNdZjCnqtNtFaI/O8u1qzY
	11OjdhAwBeJIkOG1c6LYXMcj7oa5xTIj8dA4Q09s1+dTs981ZZnnAcY=
X-Google-Smtp-Source: ABdhPJw5Dvj0c3Aik084O0U8PNxbttiajVP6p9KaHzPPNLhlemrZOknmeHm7td1oDiOOYW2UYnZcYvTCHbnDZq3PfVU=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr39601710ywh.329.1646394770064; Fri, 04
 Mar 2022 03:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org> <20220301215958.157011-19-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 11:52:39 +0000
Message-ID: <CAFEAcA9zcf+A6h3R+x2uSEk1aUpV_iWfEZT72CCUeSs32OUJcA@mail.gmail.com>
Subject: Re: [PATCH v4 18/18] hw/arm/virt: Disable LPA2 for -machine virt-6.2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: H1RPec2nyVZd

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is a Linux kernel bug present until v5.12 that prevents
> booting with FEAT_LPA2 enabled.  As a workaround for TCG,
> disable this feature for machine versions prior to 7.0.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/arm/virt.h | 1 +
>  hw/arm/virt.c         | 7 +++++++
>  2 files changed, 8 insertions(+)

Is it not possible to implement this in the usual "change
property for older versioned machines" way of adding to
the hw_compat arrays?

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4d..dac82a709ba 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"

-GlobalProperty hw_compat_6_2[] =3D {};
+GlobalProperty hw_compat_6_2[] =3D {
+    { "arm-cpu-max", "lpa2", "false" },
+};
 const size_t hw_compat_6_2_len =3D G_N_ELEMENTS(hw_compat_6_2);

 GlobalProperty hw_compat_6_1[] =3D {

thanks
-- PMM
