Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp840419lfm;
        Wed, 1 Jul 2020 13:47:20 -0700 (PDT)
X-Received: by 2002:a54:408e:: with SMTP id i14mr10150507oii.175.1593636440288;
        Wed, 01 Jul 2020 13:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593636440; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeHNFWkJQBwfeDBz6pHSpxk+ueRBS0AoKtw4JJn2+UBUaX65vXuOnnNVptHHAJLJ8Q
         1uAp28SwZRGWFiWWcdMLO4YPTgv7+ysCDDmeT/w6J8Jmz2lFtKInf0bOhwHYfhLUF+U7
         yfk/2DwYVzvohpkpIRyZx/gRdZQI1QC2DGxO6uqOgDCH3rdqeCfMAUcXu9c/YProHH5t
         3gvO7GUxYvNhqU6/5qssfnEwH+fXvhguwpqbcVj3jNW4xnwVOGLtcm8Ze54/3OG19Bw3
         QmZSjwa2xWBhAy4Vpv8XzczSJr+CbM2f09aZ8/pOPxNUyb7e0lxz72lPL4SFpRzaFRBI
         mxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NS99qhyL/fdn4mBR75hJsxF0sNVyQqI7PaTGFtqZkfA=;
        b=m/4+izJmbFItqopi9YfWTNp1cQ6yoLA9zgh34ST2oVmm3KMJuUjALiJ5PugIZmc+Ku
         VuLeThQxhcq3Lq18Cdt8EFvLQj8TMYRyquuOt5jfIMxEhlFAMbtt6hdyKlWy/pFhmDJ/
         tPrGHNdnyfRzda1rgsOCPj/uj1btXbb4YkIMwq6fLwWmyhj6Wfhnf4zdVM4hzgada8Sq
         buA+ifLpnRvkb8arNUIrkt5s1IC/Og8dtfCs+NBjjmwZh2olFPfctXqteI2a2s1UF3Gv
         I4DO7MGOVm7Oz2yk0us3zjW4fVEyR56l+9dZdqcw0U7YUmkQQ43yb0yuXTIpKfrGdMYT
         89gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B+jY0ppJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k71sor4052995otk.100.2020.07.01.13.47.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Jul 2020 13:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B+jY0ppJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NS99qhyL/fdn4mBR75hJsxF0sNVyQqI7PaTGFtqZkfA=;
        b=B+jY0ppJQkHbJxcziqEhjiUqZmmFJgHsUhPYe45EHt+08bM0N1zgvNCCf46Y/tJAIu
         G4JvY9uGrW3W+XBDXdruy5rVALEZHeWvgQvsQUnTRucgzkkN9Gc7eGviQkWJBmDdg48G
         xhv1QUdKQn+UD1RPlprqIKuQZbze5HC4YnfiAHdArk1OWOz6eCxZ+URFhwbyMi12lUxc
         OQwP70/2HWXR0NXW6HNJ1vTLF5yD7y55Sup+XIw6/KHVH+eryh9FSwTcCusA7rjooEeC
         SkjVR2rXNrtQLicl+43So0KO9hkyqIrAR9Qx4bYzPXdZpzlVMTQceHW9KvIx9FLpPOcW
         5kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NS99qhyL/fdn4mBR75hJsxF0sNVyQqI7PaTGFtqZkfA=;
        b=SzlcQ9kj+iCJVmEaeWEdXiThQp/5coF+t8eD7+kQcLPLqNhaTo9ubALB9Ij/+Iu7wr
         9ZRPpMuOJ0qBGZi4v/u1kxg8/D2mHWXNVnYjY5PgvMngtou/WBEFc9puBi0iKTjp4W0F
         oHl/MJTcd8WZAQJmMBBFNeO4ns7v65mHCKMvZhEAUSZDkG2xiRTke2EL50CvAMLAIl9D
         2mpMX5bOpvlOT38s4zvbe1VvG4RBiiQoX8ODpNkboWsaXkJw55I8EKDBLoyRaw91TqC0
         Kur0qrAfuDfGFNwv7vXICznAqPFxd5BI5L5aFg0vA9a/SMe0YfIKUbHvuJiq2SQu44zl
         R4Fw==
X-Gm-Message-State: AOAM530rgAqv1Erd/qyxBPTH0x1GNgkOV4A8A9O5UD8hlqbVugLZWGT3
	6Q0YMjsHNvYaPuR8YoFQqT6Pk05gG54K5MnyD1fz0ejwnbt3LQZ3
X-Google-Smtp-Source: ABdhPJwaN8ZebAef5emBG204pfVdkXZqfjiPamo/sGFafI237deS+C9vAj+UbJs84M/rQxjTRESXSny+yF78fazKevE=
X-Received: by 2002:a05:6830:10ce:: with SMTP id z14mr16178878oto.135.1593636439510;
 Wed, 01 Jul 2020 13:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200701200848.26746-1-agraf@csgraf.de>
In-Reply-To: <20200701200848.26746-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Jul 2020 21:47:08 +0100
Message-ID: <CAFEAcA9S5v0LHMNc4fu9JGUzecbg8DsogZuCEv_aGNqVxRAcDQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Treat unknown SMC calls as NOP
To: Alexander Graf <agraf@csgraf.de>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vkRWKJOhm9Fg

On Wed, 1 Jul 2020 at 21:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> We currently treat unknown SMC calls as UNDEF. This behavior is different
> from KVM, which treats them as NOP.
>
> Unfortunately, the UNDEF exception breaks running Windows for ARM in QEMU,
> as that probes an OEM SMCCC call on boot, but does not expect to receive
> an UNDEF exception as response.
>
> So instead, let's follow the KVM path and ignore SMC calls that we don't
> handle. This fixes booting the Windows 10 for ARM preview in TCG for me.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

> +    if (cs->exception_index == EXCP_SMC &&
> +        !arm_feature(env, ARM_FEATURE_EL3) &&
> +        cpu->psci_conduit != QEMU_PSCI_CONDUIT_SMC) {

This condition says: "we got an SMC, and this CPU doesn't
have EL3, and we're not imitating real EL3 firmware".
The architecturally correct behaviour here (since we don't
implement nested-virt yet, which might allow it to trap
to guest EL2) is to UNDEF, as far as I can see from a quick
look at the AArch64.CheckForSMCUndefOrTrap().

I'm not sure why KVM makes these NOP; if I'm right about the
architectural behaviour then making them NOP would be a KVM bug.

If Windows makes an SMC call on boot that seems like a guest
bug: it would crash on a real CPU without EL2/EL3 as well.

      *  Conduit SMC, valid call  Trap to EL2         PSCI Call
      *  Conduit SMC, inval call  Trap to EL2         Undef insn
-     *  Conduit not SMC          Undef insn          Undef insn
+     *  Conduit not SMC          nop                 nop

The line in this table that your commit message says you're
fixing is "Conduit SMC, inval call"; the line your code
change affects is "Conduit not SMC", which is not the same
thing. (I'd have to look at the PSCI spec to see what it
requires for SMCs that aren't valid PSCI calls.)

thanks
-- PMM
