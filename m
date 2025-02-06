Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1629277njb;
        Thu, 6 Feb 2025 07:53:16 -0800 (PST)
X-Received: by 2002:a05:6902:a85:b0:e5a:e7ec:2752 with SMTP id 3f1490d57ef6-e5b25b36a65mr5998101276.27.1738857196762;
        Thu, 06 Feb 2025 07:53:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738857196; cv=none;
        d=google.com; s=arc-20240605;
        b=PX9rfD4UIFVHNOyeKl4qJFgnOYMdp1Wm1tR7lU73DXUuAmJTsbLAaezR13cQ7WVfSp
         6GwlbEnn2qm9p71ZE4meq49+81fhpICn+DKgDY8AwYuDqPeErNUTinNH1lBydHULIfau
         L2PHZW/rpfJ0OwD7w3LRZ8d1P/2PMtjjdwOz5rpvTBtDLPMyOLOnAm5AR2lYRp7R6K8Q
         PkL2KK4tYJSZmzsMj608/c60xL03seppWQSDR/J46Y013VACq10uwF7gZLUksLIXSqk2
         0OyAwMF83Jloswuh786Gb2orpYgx0cLMeM/wv5x1DNROa72JoxmUZSKtnPtF+xLUo7w6
         qNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
        fh=gQjtQK4ozk7tGo9GYeAaWXMEcKCusqNMITJ/TgWJ9sI=;
        b=aZ9Oz3bQ5p/2H9iU1vaKCFeD5K/EEYFuR5IaPIYkU4dgIuV84q1PdDxtSSyXHOro+E
         oFLW61XEh+ul4Bwff3t4DzJurCXfxaXND59ftFwKOkABnVIfuLHIOxix0S13VwcxYUnH
         9bQyPdrsbc3mODVKAof5DCnKVuaa8NGdlgGSTflVZn5l6+2ZBZE4/4V1bNSoiDxA7Cjl
         uIFHp70o7t/AOOxoZWdxcUvZenRWfw7XGLIstkXOXsx9+9Ae8SKYZ2MOdIpreBugiVZt
         lKsYJdEC/Xo+mQhaKqBFZMFLriNtOdkt5ORi1NzxEUFVi3J0DDSsh3BJRP/xqT1npitw
         GhUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De6EwRWE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5b3a471abfsor753378276.15.2025.02.06.07.53.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 07:53:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De6EwRWE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738857196; x=1739461996; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
        b=De6EwRWE6BqfhwbfivJFXXdA9/uhz18z8WXTM0wZOrZU/nXARLn4rADBKNoomeP2i/
         0UYtBMh8HN8Hsjg9w7xpFP93GBQvltiykORnmDJy1lF8ZR1FwWzj1mYAABRrNlQ0MToZ
         TRwSP/Sdsok67fZDlZxLiqXH5vJ32otuEWjHFsJ+kswS4NiI/swH5gdd44fswXwnSTKD
         likIJx9ltOgn0GrGATkhKofnjSrHScr43Ra9R608aWp0OwhWE173fU4j5NEG0Ok7HpSP
         hF9iFH29h/7tjHXdR3HV3rJr4Ol0HOeTzDhwzVzlSIVoLnlgePHkDmqcZozg5gCZyk3z
         uKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857196; x=1739461996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5H+hhL1ihPNFguVGpGNPg7yjivptPGHwTYAbDhAvvlo=;
        b=HZ5Y+o5YnAAeMCPu3Wd1BUrfGcvcfs0qvIKHeW5cOdkei6OyBfBZP7i2PSuOZPQh9q
         eoWbz8+dcgue3MCXs1mWi+Dmvh7gPzci4Fw7GtX8ZI+d4TJz56AWXJ88HlJ7on1kruNH
         qudtIldklc9BEXlcL2lE+HwuHwfdh1uzW+vO/RpOyAiDC5LLcDENHe3e0Kcz/jBRQKsY
         O+vK2yu0xiYTTbM86lw9BipeOS33g7ErYhGqM+88UTHatHmfIYsgtE/OnjQgQTOK5lEa
         jmNHhNdIg/6gv6NEiJrqbeXpwYSi1RpCf9rw/JGE4nwRUhKsdP0W7wAk94TlGMi45Ntd
         qo5A==
X-Gm-Message-State: AOJu0YztHDB9KUwf4GlgfhxwGGqHVT1Waz6yve6ZGfvKjTu0F1bWz7MI
	80pRQGmJB7yX1+GvA47lCVVN/Rn3F9Y88PS2rh+gIKQEa/fJsKufGZ2Jstgzn28jzCDpL/j+BmI
	RokJ12ByMGlMdZwmM/Oove+hzkSFp5jAQZrsMGIXz/SiE+9fGtdE=
X-Gm-Gg: ASbGncssf3cXS5Pe04ivmS83+2TF2XsIC/P0Gqi5gpAdt5RGEa8XLgpRSHzmD0ZhD0T
	CVK5WXSL2DJSMXqGnP5PeL3PpXb5panZII3qVj/lChiwDb/JSSAN75ht2J+xLTIjDA+jmjGMQXQ
	==
X-Google-Smtp-Source: AGHT+IH7se20k+IcZxopIIGWe8rNYHJ9965GJoItdH8fQqtHWEKQS0HtpBHMWxVRa1dfLgNz384z5mQm92UIUKnjmUo=
X-Received: by 2002:a05:6902:218d:b0:e58:8e82:5345 with SMTP id
 3f1490d57ef6-e5b259d213dmr6055544276.4.1738857196284; Thu, 06 Feb 2025
 07:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20250203144048.2131117-1-alex.bennee@linaro.org> <20250203144048.2131117-8-alex.bennee@linaro.org>
In-Reply-To: <20250203144048.2131117-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 15:53:05 +0000
X-Gm-Features: AWEUYZnHiVWrLGi-2zGS-ZXL0vgR8vDSrhzcIVVztSk6rKPjoO_A4eVt_FUbanA
Message-ID: <CAFEAcA9SnRrYGZVkB_NF=VSkSDtRQSvQjOPSid+HN4997Mwxkg@mail.gmail.com>
Subject: Re: [PATCH 07/18] Revert "util/timer: avoid deadlock when shutting down"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Hao Wu <wuhaotsh@google.com>, Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Kyle Evans <kevans@freebsd.org>, 
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, Bin Meng <bmeng.cn@gmail.com>, 
	qemu-rust@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
	qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, Tyrone Ting <kfting@nuvoton.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: BkDQ3IOg7era

On Mon, 3 Feb 2025 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This reverts commit bc02be4508d8753d1f6071b77d10f4661587df6f.
>
> Now we catch attempts to clock_step to the next timer when none are
> enabled we can revert the previous attempt to prevent deadlock. As
> long as a new target time is given we will move time forward even if
> no timers will fire. This is desirable for tests which are checking
> that nothing changes when things are disabled.
>
> Previously most tests got away with it because --enable-slirp always
> has a timer running while the test is active.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
