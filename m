Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp175692wrw;
        Fri, 16 Nov 2018 01:58:42 -0800 (PST)
X-Received: by 2002:a9d:b8e:: with SMTP id 14mr5594037oth.279.1542362322469;
        Fri, 16 Nov 2018 01:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542362322; cv=none;
        d=google.com; s=arc-20160816;
        b=O/f9ZW0oWuJ43V0zGBw8RaVvioAw+ZgPXzbe08IyT1+3GfSiqtei6R7Qqxauee7M7L
         Rve44TQVdWCfOcQytBG9mEdDpi4sctOUHJrakF1mKCbxAzF9sYVFzVo2YVseZD6+J1JT
         0ucoHPQW+f4G9rs23yULGuTXnPMAJiFK5/y44cGnxNHt/FL+mhiECBhY4pbUHvo2sPjZ
         SbU8d8ZnVZdMRCg5FcBq/BopvBD/0Cf8dnc58uER213KZXH3g6qo1KOcE346W7cjRdQU
         4EEIPSk69QTHkzVjFcrSKcsQMyGVGPLy1Vtht+Qrh8CAPklfmseOT0l23E8PY8kaF7Tc
         Qlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=nfeuUoS+BSFMSNVMKDGpF+PeWYTaEk8fLb9AeVslaco=;
        b=nIySX6C3JB4gkpgc/gOCA+8XT3gVobKRbSSt8qdMFsZ9dN0vsPvF7OYmZALL6ewIqm
         JRVL7C0mufPyIhEh7Np1pgI4fvSFHHxnU2AyJUy9as6NAHLis7mzAB8mPwumntx7vcIz
         iGWX1z4cUnGbZ0FHrtavdCqwQHCJIPZff/6Lm6jZa6OJmL+CeJHTnqLhyZ5QMx9eSdi+
         5SHJ5wbRXoQIq8IkJMlnDB5QAjDWMdQWIPGfpRkUtIYP6dNtxxhfUuLrpAyc/b7WNhmq
         7st3w5pEj/vP3aNd+UrSsJtu24fQzO9Tky2cwXNwpXdWLL8RpdTLOjp4Rxyp+yJZOUW2
         YLtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j6eN/On9";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t91sor17072009ota.152.2018.11.16.01.58.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Nov 2018 01:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j6eN/On9";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nfeuUoS+BSFMSNVMKDGpF+PeWYTaEk8fLb9AeVslaco=;
        b=j6eN/On9U329YQniFGWFHDXp7rlnhCEGmT0exIvnxveMVMdRIV6/35NUSc4yfVSeo/
         +wodk5H/6y+oVnqekWaVzvnbzOfoDXSWW3kxCDeVhTJrU+/f2wgbcind6ptQEqNoU7uA
         zkkvZZHT8ZF61Itfxgaa6EZAUNk4F7N9wJcPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=nfeuUoS+BSFMSNVMKDGpF+PeWYTaEk8fLb9AeVslaco=;
        b=hHP061hwsTK9yjxi3jAikUYsL3mg8LLu6jPmbpTkNdgHQK7ceWstkeL0RPA+qACuVP
         wu5g6UM3LZEpCRoUDAYRNXqXh+sKH2B9DR5hA/debyupugfdCvWcY4+JaTIHmhGfYniV
         YZtTnI5QjFb54sHWOQYTy2RApFWJnAut4ZBD3Bf+f/IVDMa1J6cZes5yqHmf379ssjfr
         grM1HMmP/u3qI3uSJEQCdkv0DZIWDi5uZVV0U4N18rRY5bXCCDeJonPx4104YqZmmSY5
         tkcytGtj05iWIm2NuLMhvQxHl1nDNcll5yZCCD3KyNCmfuDi/RIABtAeUTdJ5hNLir5/
         U+MA==
X-Gm-Message-State: AA+aEWZ/NSkjq/iY7pqbUSa4ukXnMAxlvumsyZb6UlbPH1YrWq3zIolS
	n6Y5N3lQcphrnl4tgMaIDQq/S4A52UfKyW29w+ifGDcb7zYsEg==
X-Google-Smtp-Source: AFSGD/WrEzeb3b3tsLVVjM2OMNNZbtDvuE3MK70j++0qIAKfsVuPFjiTinuGTqSCKC+6sMK2RPzm4r0FWdu3w847YYI=
X-Received: by 2002:a05:6830:1115:: with SMTP id w21mr278368otq.316.1542362322125;
 Fri, 16 Nov 2018 01:58:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 01:58:21
 -0800 (PST)
In-Reply-To: <CAHmQWvA7fyCFz-qE2_B1SHH+29gns5m_tccLSwF_GTs52LV9Lw@mail.gmail.com>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-gt4aLx171zU=qzbzygL6AN98HEPmL6iKG2O6E31ka4A@mail.gmail.com> <CAHmQWvA7fyCFz-qE2_B1SHH+29gns5m_tccLSwF_GTs52LV9Lw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 09:58:21 +0000
Message-ID: <CAFEAcA8601qTOVRJiMpe84w62ObpzvM-jeq5hLxhs9OFTvCskQ@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: DUb/NbROBk7o

On 16 November 2018 at 08:23, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> Well, for the SMP booting, when GICv2 used, there is no problem, max
> CPU number 8 can be booted, including all the three cases: kernel
> only, UEFI+kernel and ATF+UEFI+kernel.
>
> But when GICv3 used, these two cases still work: kernel only, and
> UEFI+kernel, but ATF+UEFI+kernel fails booting more than 4 cores with
> GICv3.
> The original ATF didn't support GICv3, so I added the support:
> http://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=sbsa_gicv3
>
> Root cause of failing to boot more than 4 cores with ATF+UEFI+kernel
> with my GICv3 enabled is due to this:
> In QEMU, we have this defination
> #define ARM_DEFAULT_CPUS_PER_CLUSTER 8
> But in ATF, the defination is
> #define PLATFORM_MAX_CPUS_PER_CLUSTER 4
> So when we pass smp=6 for example, QEMU generates MPIDR showing all
> the 6 cores are at cluster 0, but when ATF parses such MPIDR, the
> function plat_core_pos_by_mpidr() in plat/qemu/topology.c returns
> error since there should be no more cores than 4.
>
> I think we should change the definition in QEMU to 4, instead of
> changing the ATF's, because I checked Cortext a57/a72/a73/a75 spec, it
> says there are 4 cores max at one cluster.

Architecturally 8 per cluster is entirely legal. This is
an ATF limitation and there's an argument for fixing it there.
However, since for this board we're trying to match what real
hardware with these CPUs would look like, it does make sense
to use the same number of CPUs per cluster as the hardware.
If you want your board to instantiate 4 per cluster this is possible,
and you don't need to change ARM_DEFAULT_CPUS_PER_CLUSTER.
This value is only used if the board code does not set the
cpu->mp_affinity value itself (it is the default, as the
name suggests). So you can just make your board code set
the mp_affinity up however you like, after the CPU object
is created but before it is realized.

thanks
-- PMM
