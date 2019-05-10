Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2086938wrh;
        Fri, 10 May 2019 07:22:29 -0700 (PDT)
X-Received: by 2002:a05:6830:16ce:: with SMTP id l14mr6829641otr.108.1557498149798;
        Fri, 10 May 2019 07:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557498149; cv=none;
        d=google.com; s=arc-20160816;
        b=fA04MYzFd2KvGhscrdVHW6e3U2kYSwf7FS8p6F3hKCsPOxEYO6VfPOjkBZ/mhAGZQl
         F5veRSqoyiGtfnE4twxC3DFtoORWbZYIRxh8s73SmRIAKuo8MW/2//TUAyLBtqa2L4li
         80av4AFdh3jZ0n/V+ltz6BWiZZOpmCQJUPIYai5z4V++JGtZnUBpWPv1Sg6LyFF7gNyG
         v1A8ZBSCujU11JhB0sYVrtN+jovY7Dm56lQyR7vJkdoSxbtoeiy4rdl+O9YR6Q92e5oE
         ZIV41SgwtIrw0fcjkvSdyDCo2dlrvq/55hqWY1XTRVahb536bcVthVFX6yPNVsbLKAnn
         y7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SnOzh2ahj3YiiDODmURqcGg1qqqpBwipaak6Ip4l7LI=;
        b=DvghLx3o9OqJbcdgBLNutzHOwNGlwROE1XvztiDdkjLNNkjh2h/eHa1IgE97ldkQZX
         uXHuJk/j9o92Z3aWNoyB/85kn6W9JstloSVm3w5OreyTiofgCQZURjnVjQMNPytuDFYH
         DckgsumWwcwBzVK7HOR9um50NcwPmDy9Q1SwNh2AoX1E+ncp2nufBmo8tSdNNyDK9Fay
         sjS3p+ntVU1gRDBeNksQYl/2Irbfis6LSgHmojMOTCNYnnVwYLzVvKEBz8niWOIlNoKU
         SrkBPODRh+jXcEwIHRcFnB/bARdVMPksMhTRH3BnG8S6Hlt8tUYAYHztzTeIMt/gbQjY
         Niaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEoVbXin;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o4sor2376143oia.24.2019.05.10.07.22.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 May 2019 07:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jEoVbXin;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SnOzh2ahj3YiiDODmURqcGg1qqqpBwipaak6Ip4l7LI=;
        b=jEoVbXinaFORcXOIeFHISNbuKPkyftnZ1TmoNWu1EN05JIYXGNslgULptfdjXV2aJk
         xxePc5qHgD89GvpwViADqEINU48CxYS8UDbX8RfLgzxKsXTMBmWvgNJIG39UkCeXEKcH
         NMytkO0EEJPa+Qw5bVrgH8Wmi0XAnS+caE6mqOyx/4YCcdE2lhXXPdg7Xv1JY2Mrwtp/
         4mZnG1W4DLbk+yg5NabgcurfIEJd4Q4rYR7iiLzTLANhVXiK9NE/QNkrT37XcUPQjHs0
         yxK7HJE7tAtAs9MKMYptPgAhWHawKIuO5MvFlx4rqjTezjpIFnVgo2MtFQ1iqVmLLg7z
         ejBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SnOzh2ahj3YiiDODmURqcGg1qqqpBwipaak6Ip4l7LI=;
        b=aJaLdi8X0HXJVndh2xuG3YoohvK0y0XuMuBbTXUk7bPbINMC7GVmt/uUQPglS07bCZ
         wlhcz6QLwihUsXJvzGXeyVVVk4IuSOUnZbuXTmw6rcdNZF/R51Rk9uYZHQajMYv1Jyve
         rqVkjbd+HnJqd68mlqzPKWmzPwefE6uvPbSxMtrHPxcB+mkZnka5CDRAPvptFEL2/Oyx
         gc36AoHTuBQGVI465UFHsVqKhVdqthbsCq2l8nI5ZGmRuKvQ2lELy1r92O0LgKjBQk6H
         1vXw/R8Q4+BvzW9velro0iiEpLJNrqgzN3IHW7FlrzZJvALX7pRT81f9lVFZydHMkD1M
         3jDw==
X-Gm-Message-State: APjAAAX25UpdT9fsNJ+rxXk3CIaRHBPN4nxqEzHoL5BNPgCUXlX9JZc/
	5/2un8mlEhDfrBVBaU8azavTv1kOXKblMBpvSK3MxLXGkr28bA==
X-Google-Smtp-Source: APXvYqzY05TNMKEMuju3VfTTUPwLbVg3TWvpHUHWDklHZE85H+Cs8DbkHKUIfjhrBXlpprnOsOj/6e8w4G1FOUb6QkQ=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr5563521oif.98.1557498149188;
 Fri, 10 May 2019 07:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190509165912.10512-1-alex.bennee@linaro.org> <20190509165912.10512-6-alex.bennee@linaro.org>
In-Reply-To: <20190509165912.10512-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 15:22:18 +0100
Message-ID: <CAFEAcA8Dsdp2rnORnzqemWspfFxfhVwkAz=2EXdupo8iDj_=Hw@mail.gmail.com>
Subject: Re: [PATCH v1 05/23] semihosting: enable chardev backed output
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vtCzbynNS9zX

On Thu, 9 May 2019 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> For running system tests we want to be able to re-direct output to a
> file like we do with serial output. This does the wiring to allow us
> to treat semihosting like just another character output device.
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 51802cbb266..6aa3a08c2fb 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3975,12 +3975,12 @@ STEXI
>  Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
>  ETEXI
>  DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
> -    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,a=
rg=3Dstr[,...]]\n" \
> +    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,c=
hardev=3Did][,arg=3Dstr[,...]]\n" \
>      "                semihosting configuration\n",
>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)

As you can see in the docs here, semihosting is supported on
five guest architectures, so we should implement this new
feature for all of them, not just arm.

thanks
-- PMM
