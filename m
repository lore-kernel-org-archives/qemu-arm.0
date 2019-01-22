Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7129474wrt;
        Tue, 22 Jan 2019 03:49:56 -0800 (PST)
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr20646875otj.268.1548157796425;
        Tue, 22 Jan 2019 03:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548157796; cv=none;
        d=google.com; s=arc-20160816;
        b=N8p4fQ1YtNxyGZiaTzQyrSNj77kz0qYwfaRVEKX/pUzaEHTwJLdgqsJHjvsYZr5729
         9I0bpj4UbKonKnI3Dwg2hOdAM39i1+1zE7pyW0fNAaSaQfm4FbNYSiryhSs95Oe1HDqd
         yPnx1dbjmTOtTwu5hrdQeP8zW6EnWrswsZQb/DOqe4lTiybqDvS7bORHnRtr3pXhg9+O
         YU9xiXbP20Aiw1vQA+2cUn3lcyKrYoTp/8RW44VC7rrKzXmx4HQfclto1AMAobnupuYS
         cPhEomrBlsnH6M5FmEEz3eL7x6jG1BqfAVsRcFFw/roqxKjY2SlIJ8iUymp8czNTB6Cg
         HLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bswhO6asGCKl5LqbLzCt7GfUF46hZQpBTL/amFxLxEw=;
        b=eG3hMnQiX1pip+HYEKvZdd3cO+Q8B+wJeXwc8dGvfewKMgVuYZ+HXDMbxYGQMlP+nB
         8avxbJpLfzwBJMc1GaZh/Peo6HmXd01lMbZ+wbEAEIIse+EPwyOQga0Mv3jL0h5gd6Zv
         0RjfSFPCZcFDoeHGJka7wu8MtrONOq1RTCLqEQ3t/Uj9z+DNONyzcLiJ7XuDdL/YE8u4
         9B1chAUqLHyYvIIesxySPbn8GILMfkoWxxI88TUaKlmB+DwUQ2Mecri9db06zdc22Rk4
         xj2TGYYOoWZbfZA+csQg754G/PURR91pNl3635rZ4iAX4/cRqxYN2kxU1EXtenXtP+ov
         bkhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtkrvP5x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b65sor9280846otc.24.2019.01.22.03.49.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Jan 2019 03:49:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtkrvP5x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bswhO6asGCKl5LqbLzCt7GfUF46hZQpBTL/amFxLxEw=;
        b=VtkrvP5xv+gaZttFCeSzB9XAKxNC3zXlZNTKWHBR87QpinMFPIaHKyszMQVUfXtIrt
         BXFD9bCueZPsv2tNJ3avAw0l3vqcn1lfnK2iLu9Ox6NNlOpVLPP/h2yFlYqdl71YU5Fb
         xyMmy06zdZBKD3cetTqjJw22DkOBmJ2W/RYaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bswhO6asGCKl5LqbLzCt7GfUF46hZQpBTL/amFxLxEw=;
        b=KW4dTaJlEZphFXiyHzIWuk3wozlfg16sniHUcwbcZ+eQ2PDvSNSrt2oykiozg9/wBE
         2em22Cq32fZ4HxbjzTOhjyiiKcZAIcd9vONXNrHjUy5morr6HeF8PGmga9EFrHv05FYN
         O3Ijcvx64OXxdnHu8F/Z6L4XnLXWxS09kxDaCT7YX3aC7y2tFoQc0rgCqXNo8+gvAP0q
         FaFgc2bUkLGZs5Elx6wYriRhCpCO201YN/BKhts9ntW+icKDGLQmSQ53TpsFdSpmV9ox
         7d3yjeHLGDJ7zpTcjoHhBl7MgfgI+zDVe3xvIAW0381Rihf8WNKNb9bwiq0x8rhiHmlc
         JA2g==
X-Gm-Message-State: AJcUukfK/E75Tw6TA8rodE1ldJOenmC1io6gIIHkvvl+wHto3vGhbno9
	MeReXM7tkXMq3qbY8aKCTJpv+Six4aqbArUToU6PTGZsmZs=
X-Google-Smtp-Source: ALg8bN7VbQcXKYkeRjBHXcw/p3X0Ua9VStmJgY/rAwsAbGqGDEsMB3EQ1U8Apavc2wtAi//mrqjROiLyfKy25oYG2uA=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr3732676oth.317.1548157796055;
 Tue, 22 Jan 2019 03:49:56 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org> <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jan 2019 11:49:44 +0000
Message-ID: <CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hw/arm: add Arm SBSA reference machine, devices part
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: F1lLtb99stHh

On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> Following the previous patch, this patch adds peripheral devices to the
> newly introduced SBSA-ref machine.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 421 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 421 insertions(+)

Most of this code looks good, thanks.

> +
> +static void sbsa_ref_machine_done(Notifier *notifier, void *data)
> +{
> +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> +                                         machine_done);
> +    ARMCPU *cpu = ARM_CPU(first_cpu);
> +    struct arm_boot_info *info = &vms->bootinfo;
> +    AddressSpace *as = arm_boot_address_space(cpu, info);
> +
> +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> +        exit(1);
> +    }
> +}

I still don't understand why we need this -- it doesn't seem
to be doing anything different from the default behaviour that
boot.c implements if skip_dtb_autoload is false.

thanks
-- PMM
