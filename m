Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp6869njb;
        Mon, 12 May 2025 10:05:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH7EjJr4qMjr3QE0VMP9WDIMi3bFrVmfUMetWds66N64qs67C3Vw7bSW9xu+pEkTpQvS6PWQ+HVYAVEA==@linaro.org
X-Received: by 2002:a05:690c:23c6:b0:6f7:ac3f:d589 with SMTP id 00721157ae682-70a3fb67ee7mr176098227b3.36.1747069536756;
        Mon, 12 May 2025 10:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747069536; cv=none;
        d=google.com; s=arc-20240605;
        b=VgBhC2P2bBEGdgUOHePZl9S+px0oigJh3pclVVWVILCK3XGNsJnKf5KM1YQ77IfD9c
         gz4oZf0sU5Dk8CyyYGfe+xf+FCov110lISYLX4+APL+cJtmIVJQY2sl5kq0X9TwrFVzI
         l5MmpUR9HuerHHEj7aZPVYjAr4h3TZ7Dgxod7MOxo5IJmMsh48rhT+Ik3odQnCyz/SwS
         8mhIND9icwO0fvyG10jgg7Yxs1ip7no2HYVeXbgT96FgCBIm4WOdk/vwylvk/xEoHNwZ
         dZjsf90ap0dFH2gSOPu/ief0weNTcIidsxRenJgjv0B07baKSjqxzvLXjt+RjnLGQgV4
         iluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8HTNP+Dz9uUBMvSkat76DOjyJL5YwhYIaJa66H/oiLI=;
        fh=0g1DVVj71xBnu2iyKdy470E1mHFpmbpcVVWv6ps9eT8=;
        b=CYvMCjTCOJUsQdmZWmv25PqhHgJqvYc7NMZPdE25NOv5niduB6VZ8KwmKdWmNr/PGV
         ZasjaezjKOI+RvPBWJJe8v5I4EAUYJEs6HmaVL33Vh2aEjDzq0AUaPeOECHiILK1fV5x
         D6UMe9VM63PgYZBw0WcIKeMglWKaWWeOJg8JjKcrNNcreZUqXZOVxN7On2X/XKM49o2/
         PZ3851cYR+Affh2/Wsf/NUAmBCYfa4MaIzGPSzMZzkRHz2/EIJ0pBD7InIMwD2lj3bQm
         xNY7jMtaVzI8wf1uJXgXMhV7X4zzL9yS/yXAcaSpyTDsJG8sP3yN77rD+k1BkteIH0a2
         hyPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lC+kLu++;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-70a3d8d7bd3sor49244847b3.6.2025.05.12.10.05.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 10:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lC+kLu++;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747069536; x=1747674336; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8HTNP+Dz9uUBMvSkat76DOjyJL5YwhYIaJa66H/oiLI=;
        b=lC+kLu++/1Bt0aGS2lKZvE0hFIKTLFM6W+1cY7b+8ofXIfa+Mid6knP0FcOCI5R6kC
         d2X9CED6LSj7S+DnAk28YIpblzMT/3/DNsFlOPrJYJ6FZkCHOnarAoDvk8pTAdqBct5G
         9UCOD/Z/i9uLM6OpqGwEUL0cbGVip842Fe6kuPEqI3QYvULDVtNRqs9g5J2eGNhWOMg7
         RUPR/koRJuB6Dyso9jxWOmWgC0dqWWWhOts8FvTo8XV4YkgPKahdcGcmeWbgNuSR5k9C
         LpsVV37MplIIzuqhBweG79hwUM6omVrLJNn+3NfBClKy+26nkgneXcXkDYir9gJq8wwr
         Bcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747069536; x=1747674336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HTNP+Dz9uUBMvSkat76DOjyJL5YwhYIaJa66H/oiLI=;
        b=MtcWVyBpRa1ob5hZ/eiViEZ4CTklR0bHwYtxzl8iAlu7CbsVi+J47zOhPMB6sEGD/w
         JJk6SnWT2f8wbsXpH6oUgwC+JDs2rv/mriZiNLpJu3DgH1dSQ713GPEvm4I9JuAFSXGv
         dcH/Jer5TQ/8U1vF5xYARwIZarvSarGM1RHUaHjvAzL+iz8snKE/UQXDwrZqzJmVm6wu
         zcRTRDFIOgMvf7U/QI8PwVuABk4ttgOqPx03YKCCXaDcIUaCbpMI/N9IjKhIQDu04Al4
         xoF+HAPdEGxunkLQ9lorL+FdV0Bi3uUL0UE4a0gdc5CMumK8AMUgVKGhwV6M4lQW6B7s
         Jz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCojF15Rdyg07l+AStXn6ny2aMvzdMpbOREzhc+Jm7iwl9V+s1XEZq1qV3ehaKJHwoawOLZwTuWrWzFw==@linaro.org
X-Gm-Message-State: AOJu0Yz1JY8ZmdcVy7gp9m9gKsDlJDLViV5BO2/XPsTOD2d5lpmQ8pHj
	sf4ybv5nVWiG4CQEnNQ0Uq9QhG4qeluZjlORPQObHb09AXILXw+5SeEzpO2dvqp4y/UlvdXrlDj
	x9PEJA2vp5hnUB7H0M9JkJLaZk8S1dq76NypiC11A
X-Gm-Gg: ASbGnctZKEUAUj9ZfZ9YRNbIFf6p+rpRnYT4O9EjPZg4Dm56M8sPdKxLivFOV3xwtNE
	B/vgR8eTf9F3+Ahh2talK5DMshkAEjRBYI1ptGzoawDEeNIKIcZyLYaiTc1Vq6zb3imFG12P9rh
	pVOzHSLk92ErYoeBuJYTQ/2yJXHJ5FZEvG/A==
X-Google-Smtp-Source: AGHT+IHJUGXvU7eSQD629soUCAbI1o1OOEKe//YGeeBupCFFNme9TLnTnur0ZOEMcwQ6PGCg+MVCB1198KhwGVBMoSE=
X-Received: by 2002:a05:690c:6181:b0:709:966c:b648 with SMTP id
 00721157ae682-70a3fa1fb5bmr187347917b3.10.1747069536192; Mon, 12 May 2025
 10:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_NgJw=eu+M5WJty0gsq240b8gK3-ZcJ1znwYZz5WC=wA@mail.gmail.com> <726ecb14-fa2e-4692-93a2-5e6cc277c0c2@linaro.org>
In-Reply-To: <726ecb14-fa2e-4692-93a2-5e6cc277c0c2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 May 2025 18:05:25 +0100
X-Gm-Features: AX0GCFvvctnEj9SSRF9WiDdOiktBdw5JBrK0houKTahMILYX6RROtZ1LUTlNoCA
Message-ID: <CAFEAcA_WtAAba9QBS_zOPUPtjdeDv+0mDJiTEepHS2+61aZERA@mail.gmail.com>
Subject: Re: [PATCH v7 00/49] single-binary: compile target/arm twice
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, anjo@rev.ng, 
	Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: pmobyNB4eVcS

On Mon, 12 May 2025 at 17:53, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Hi Peter,
>
> On 5/11/25 6:40 AM, Peter Maydell wrote:
> > On Thu, 8 May 2025 at 00:42, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >>
> >> More work toward single-binary.
> >>
> >> Some files have external dependencies for the single-binary:
> >> - target/arm/gdbstub.c: gdbhelpers
> >> - target/arm/arm-qmp-cmds.c: qapi
> >> - target/arm/tcg/translate*: need deep cleanup in include/tcg
> >> - target/arm/tcg/cpu*: need TargetInfo implemented for arm/aarch64
> >> - target/arm/tcg/*-helper*: need deeper split between aarch64 and arm code
> >> They will not be ported in this series.
> >>
> >> Built on {linux, windows, macos} x {x86_64, aarch64}
> >> Fully tested on linux x {x86_64, aarch64}
> >>
> >> Series is now tested and fully reviewed. Thanks for pulling it.
> >
> > Do you/Philippe have a plan for how you want this to go into
> > the tree? I know Philippe has been taking a lot of the
> > single-binary related patches. Let me know if you want me
> > to pick it up via target-arm.
> >
>
> During the release code freeze, we mostly used tcg-next.
> However, now everything is back to normal, we simply work upstream, with
> a simple "first pulled, first in" strategy, fixing the occasional
> conflicts on our respective sides.
>
> So if you could pull this, that would be appreciated.

I had a go, but it seems to depend on some other patch
or series that isn't in upstream git yet. Specifically,
the changes to include/system/hvf.h assume it has an
include of "cpu.h": you can see it in the context in
patch 2:
https://lore.kernel.org/qemu-devel/20250507234241.957746-3-pierrick.bouvier@linaro.org/
but that include isn't there in upstream git yet, so the
patches touching that file eventually fail to apply cleanly.
I assume that's "accel/hvf: Include missing 'hw/core/cpu.h' header",
but is there anything else this series was based on?

thanks
-- PMM
