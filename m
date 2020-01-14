Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5295109lff;
        Tue, 14 Jan 2020 01:59:30 -0800 (PST)
X-Received: by 2002:a9d:198b:: with SMTP id k11mr17031894otk.295.1578995969849;
        Tue, 14 Jan 2020 01:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578995969; cv=none;
        d=google.com; s=arc-20160816;
        b=jOWQxopsoQDbsL8jIvusU6rfCdkWumw4JtCAFUkBCG1DwIndx19tH5CF3NdWAHMqs7
         8zOUDG/OwfsbcFjCq3vi0jjRmzTQb3AoDJbGHtpqE41169MuCTYvywmWKlRvnKouZDBQ
         cXnzf+9qi+RxWgqRuHwxA/oqWHH6O6YdLrPiozVIQnSqhWROAh8NHZjPgBgaqmJyy7qa
         Y47707w/Zsc4DFqOQ0L9yYk4iUZyRP5iF/GDNYDVU8K/uOyONloXbFnRVL397LOS4ZSy
         1m4/ktCl34lrGaYuHU3XGsGlJq0L2WnVECO8W4q5/ZkYEtmuNUghABdaPha18fkyDo9U
         K4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b2DiuJpfAtGeAoUNzZ4klHYPKsCmGPyrHxskQkSSgUg=;
        b=cpDhusJGluFRmdAgvTK7cXl9KL1+pnnd4w+nWEDuNSVFbjy7UxRiMydknJnmU8Ru1I
         pF/3vxlZ/QrnLiUW0/R2EPWd5vY4qsaydYk4tGH++nFozbqso/o6/AAy+DDFV6AkbR1x
         S3+eWiaoZoUUXzvAqSvWmQNf9xQwzeFBBSNktHE0LHWKNtH+4AYD3D1wowxq73CWOBpp
         1IDlfZwyAKZc7wrs3YE033f9fxHDkTxFR3RF7pHJS97+p5Zh+R2yM+zL3Py3MSlS0shv
         zVFP5HGZZM99SFCkjTZZOgsZU/w/y/sijDNQ3fTi1BjkJHNgCzAhV2Sz9HIc0BCDwc0O
         6OEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VbWdfXzW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 16sor7497335otk.0.2020.01.14.01.59.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Jan 2020 01:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VbWdfXzW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2DiuJpfAtGeAoUNzZ4klHYPKsCmGPyrHxskQkSSgUg=;
        b=VbWdfXzWosBz2rt7Q96OtBBGxyjJ23tVF22pL0vbVpHsN/sf6yyejPrAGzrRtedjuW
         ZQHqq2nT/tA64qyWt0KEVT0QgUHMSCiEi1G3yko153Uh8/nFZQdl2Uep832aroOMao2g
         BVGAUjG/viB/jNfQ8wcC/SodObiyxgQpfhUAQMZZRvdNZEp6RwqFtnL3Cc41Y1zmH3or
         A65ytUyeEXZ/2i8rlL9dgGLArVbDEVwIlFzEaQcL+sTwgPBZR5MrdyPshQTvWJQEQdak
         va3VuOc3ZyfPSqDt61Heu+Bw8KvD/rV9i0b8KzIXjuOBu/0X0smWgrOiHVfL8vqkypxa
         29QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2DiuJpfAtGeAoUNzZ4klHYPKsCmGPyrHxskQkSSgUg=;
        b=JbONJygNXiU2G/t5A4zoUmGNuvGWnRw/mpyv8ftcV646z6QI0qvinc1jl8+rdljVyr
         sCQh+yNCl7VgLqC8j4TcGHvL+UAkdGSK6vGutAcKoiip1Pi5MF1ONzi3IELBUQ9fQarO
         S1ehTVowmqsVRVaUIm2ggg6cyjY1OrjuyvhIU1ndd89vxIIDbpCJWGCzUPIw+CmmTnPj
         3gWcUNx7S1ETzUFiVI3/o0KxYgUBVBhbUTGPcjgdMp3UdyeVrA2MLa2/TrzgyU6Lt4QZ
         FOyyj2E7yAp/FzgroROpv8OH/RbzptCf3dPiKgILkoyE6Teu0KyfLRPkZsUfV3LuN0j3
         VrtA==
X-Gm-Message-State: APjAAAWB+wdpp5adfTDIedsGpSJpCUFYdZpcHZcD0iDm3PR2N17JCpE7
	aQNFI8yjyY8KApS56/+nPArZU2/VPzf2HotosLG/USzZ
X-Google-Smtp-Source: APXvYqztqi7IYRauvmq7P68h1Pbh39F85X1I1e1h+naKZZKMOViZ/q4V76RDrMrKEJu7EOga9JMCLvnITBC03NhBqLE=
X-Received: by 2002:a05:6830:184:: with SMTP id q4mr16615430ota.232.1578995969450;
 Tue, 14 Jan 2020 01:59:29 -0800 (PST)
MIME-Version: 1.0
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
In-Reply-To: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 09:59:18 +0000
Message-ID: <CAFEAcA-A_caQgwi5DzExdZChoTg-Qa73hq7Ho7dPLiN633Yj1Q@mail.gmail.com>
Subject: Re: Semihosting, arm, riscv, ppc and common code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ybRzFT6Q72DT

On Tue, 14 Jan 2020 at 06:29, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> Hi Folks !
>
> So I started "porting" over (read: copying) the arm semihosting code to
> ppc to mimmic what Keith did for risv (mostly for picolibc support).
>
> I noticed that the bulk of arm-semi.c (or riscv-semi.c) is trivially
> made completely generic by doing a couple of changes:

Note that semihosting is not a "here's a handy QEMU feature"
thing. It's an architecture-specific API and ABI, which should
be defined somewhere in a standard external to QEMU.
You need to start by having a definition for PPC of what
semihosting is. If you're starting from scratch there, there
are some important things you should do differently to Arm --
there is no benefit to repeating the mistakes of API definition
that we made! Most notably, you want to specify and require
that any unrecognized semihosting call function fails in a
clean and detectable way; you also should have a semihosting
function for "ask for a feature bit mask" so you don't need
the silly magic-filename approach Arm had to go for. You
also want to standardize what the errno values are, which Arm
forgot to do and which makes the errno handling in the spec
pretty useless.

TLDR: don't start by writing code, start by writing the *API/ABI spec*.
I tried to push the RISCV folks in this direction as well.

thanks
-- PMM
