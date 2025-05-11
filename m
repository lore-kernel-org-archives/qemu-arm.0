Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2207168njb;
        Sun, 11 May 2025 06:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmE5YcT7Bt+MY1ZD/kKS2qNNb2gI+ylsVojVqQ82Y/HNXqNBjpIeHr7d+4KyREtNqJ7K38/X+Dv52slQ==@linaro.org
X-Received: by 2002:a05:6902:2708:b0:e78:f00e:882f with SMTP id 3f1490d57ef6-e78fdcd59c3mr13262067276.25.1746970820574;
        Sun, 11 May 2025 06:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746970820; cv=none;
        d=google.com; s=arc-20240605;
        b=MWKbxuTEt956CTknqJINuAlF5/g30kVK+ln9XDpkbbLVVYsd8CasAHmhOxWQ0kDn41
         AXeM+Ayx9jSy57qEnAZ0ot364jlw2H9QzNF2Yb/MoIbY+ufvjlFWy/z9dO/TIYCwjJsd
         Bna+Tv5wRTw3PuFbDSWbbUvNW3SvQp0LMWL4koblUW75YluYZs57eZv+J+YFDQdkO0Sl
         3sHneoHSUte0DDIg5LoP1KrJxvDPyFEXHbKHWf1dnrkS5+K/7ImR379Giqh+Nk29VNes
         5quFt+TCu+NUPloYjDfnB85X2tQNZHvv14t7jqAPdmh45DShRtqux96xTIONP4e1Z1Ju
         D1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tQYCAYnSnMLVlXmM6Q3dpe1j9yqTGHdnD9s/TU+XfR0=;
        fh=jrmVsj9zdOLsuHSWUb/5ZC+PZwZtsPCmNBSX0dguCzM=;
        b=RwbLPyrY+A+cmk7t8u8hGLjMLA1n+/X22+W7AP+W43KaB5A5PzEybBRWG26puO3EiJ
         fVoa2K2sYh1Ne+i78n1rKqYp4N2j4AZsP33irKHY0jJuQWqb7a26HZOU5lgQic/6M+Uy
         XGzpCZ7WODnr4LvqHyxdvxhEizN/geTsWuArN8loXOLhF+sF1STrTwsH4/GXT+2z9ITh
         iFMuJ7MFslP9BofnHjuP56yCDya8c2u6OLOA0qnDWBaqqzN6Y/Mlnx7uWhqwrt6epojK
         HIxupAZR3KsW7VZf+K4zNZEbm9O1F0UmnLs0DFt2krvS1Pvy+vu7NwVN24ew2vpWSKSr
         gvIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2g7EP8p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e78fd4629b5sor3089780276.2.2025.05.11.06.40.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 11 May 2025 06:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f2g7EP8p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746970820; x=1747575620; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tQYCAYnSnMLVlXmM6Q3dpe1j9yqTGHdnD9s/TU+XfR0=;
        b=f2g7EP8p2B47Py29wktliy9cXnizoWrt5gQY6+7Gnk5vlDr88llJlNI4VuQfaG1WGr
         bAqBpKnsD9kDYzQXM/L2uooSexAi8Zj39cCWgVnHQetrE+NiqpHOscxbCwrNAK6caFg9
         TNX391OgcDpCqw3x2Q0l+250aZduNAEJBtWOndDHGTvpXQoSa7amYV4XCKOCuHpR+CS2
         ul8ctRH3+WTNwQcPoufNj4aPR/LLb9wvYVXezWWeYWpGRUqZQzFgplf2KT4nSZdLVBRS
         SWNYamXxGbZbjrFpAzcdG5pX5qpXLJOzEcLLyZvOPPE3HP9kCIqxsE1Xvjkj37PbyeTx
         Exjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970820; x=1747575620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQYCAYnSnMLVlXmM6Q3dpe1j9yqTGHdnD9s/TU+XfR0=;
        b=b2aByloAnFPnzIG74aY4kIRq2q98BVgQyVS+ko85O127qubA8oBs0apYQQkNYCbrQb
         JqyDX6HB7s3+HulZKP0AZbxdkzA54yb8iAgNwJwhOlHwTrWPVsvkPVgyoKoeZGm95yIz
         W3uT1ffV+e5YLoda+6v3oZyHcOwvn4jrvu+BMeE37xCz/F27bcXI1EfmpbVM9O3Uew0v
         TyG3jyNp3mFwIjTYNrbafODKeEsZIsS+SfaD0m0nh3RQbYvehebNxs+YsRjTmZGc1jYq
         0hP+we5+A0GY/bTJK5cj/MHcu7oH5NnOO9wAJd8XYrg3O3lKjArjvJmiUBl0+ylxsLvs
         aMRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfoBm25tS3yy6B/+y/CtINyofMghyfrhMxtq79ZGzXI0Mx5bVYsQ8xw2/XoHsB03J33cKFOEu7GAaP+w==@linaro.org
X-Gm-Message-State: AOJu0Yy/EvqPF2k/VEMpNAUpqJtDviS3WDjZynQSoUMMqGgE+9GSlhUS
	HSWYD5bX5V69zfnQli9a/xlgO+d4MwCIBdCXmXZpsQJtVYt5VhXGuS2m91TaEr8/9dxOeSOahmF
	4s/ZYgOnO4d0XQ9xDCGZjffcxC9se0ZiUvEZLBrdV
X-Gm-Gg: ASbGncuQDxp/7Fes9gk7unFfip5+Qm87OI0bMX72Xc4sIsDqOQMKCfGkTuVRSUcV+uB
	CEq9Was+0r9IEncEodB4LC+fGzCbvi38YmcF63xrzpoUmSkHGCneL73cNDMXAvfPp+YhQ6/D2pc
	Ckp0JyQ9r3ZtRbFDWxQ+DCVkO8rkzWKexUJQ==
X-Google-Smtp-Source: AGHT+IE0KyLbfrS2S6y6k0L5Sv5Y/BL7XPKyq9u/1NkOPd9IMbHcYOljv/+I7+C94CfPc8CC+GuYQ3cEH7yDPqKhrqM=
X-Received: by 2002:a05:6902:2503:b0:e78:f4df:8441 with SMTP id
 3f1490d57ef6-e78fd9be186mr13405339276.0.1746970820155; Sun, 11 May 2025
 06:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 May 2025 14:40:09 +0100
X-Gm-Features: AX0GCFthFJShMwduZaRe8unlmupmQOaRCZ993P7xtVVqY51NCVV1-mxoKOxg2B0
Message-ID: <CAFEAcA_NgJw=eu+M5WJty0gsq240b8gK3-ZcJ1znwYZz5WC=wA@mail.gmail.com>
Subject: Re: [PATCH v7 00/49] single-binary: compile target/arm twice
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, anjo@rev.ng, 
	Richard Henderson <richard.henderson@linaro.org>, alex.bennee@linaro.org, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NztPNxHKz4Ut

On Thu, 8 May 2025 at 00:42, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> More work toward single-binary.
>
> Some files have external dependencies for the single-binary:
> - target/arm/gdbstub.c: gdbhelpers
> - target/arm/arm-qmp-cmds.c: qapi
> - target/arm/tcg/translate*: need deep cleanup in include/tcg
> - target/arm/tcg/cpu*: need TargetInfo implemented for arm/aarch64
> - target/arm/tcg/*-helper*: need deeper split between aarch64 and arm code
> They will not be ported in this series.
>
> Built on {linux, windows, macos} x {x86_64, aarch64}
> Fully tested on linux x {x86_64, aarch64}
>
> Series is now tested and fully reviewed. Thanks for pulling it.

Do you/Philippe have a plan for how you want this to go into
the tree? I know Philippe has been taking a lot of the
single-binary related patches. Let me know if you want me
to pick it up via target-arm.

-- PMM
