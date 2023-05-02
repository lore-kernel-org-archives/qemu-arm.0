Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2059236ejm;
        Tue, 2 May 2023 02:47:04 -0700 (PDT)
X-Received: by 2002:a17:907:3c81:b0:95f:7edb:def2 with SMTP id gl1-20020a1709073c8100b0095f7edbdef2mr17587983ejc.69.1683020824248;
        Tue, 02 May 2023 02:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683020824; cv=none;
        d=google.com; s=arc-20160816;
        b=DRG4FIF8KCFty+S0B+QzcrQkxFs6IMley8u40nEvC+O8vwLPGLXAGgCzVqpYtqM+P+
         oCESZ4n+Qhoei+QC7sHBoPU+gTtz5QMGsTp9ePDnAwdGBemP2ac028a/3N47VRZdpau5
         Hab3bfgY2gl0CIKifzxzN+NKPXwT8/ixH614vbg6quoLWGNikp6GBDT0kzKn3al4dVsX
         Iqf4dzfNbHcuLEccKNMJKl13HhI+7FParv3FknHFS8Jewh3tcrT2fPA6CA78G53grHzX
         Q6Np7uusUElJq4A7ICizIjRyTNOdgMc48Gnfki2T0NlcL515w4pHDlplTuGB19rND9DA
         ulBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMKrazW8sILQReKUpzrOaZv7JAe2Iym/Bp6J/et7XJ4=;
        b=v9PLFolifWrGZlzE1y5oMueNS7KSAthbwmK9SAfpj0J/53jOKdshGw7OhU05O2syEe
         dbs0Yuq0dVT6RAV7u4Am6uC9SoPAtKd4UIJsRLFqArVZCsiaxefR4jZH/yjbXrY7Pcc6
         NKKaEDkck/HLQMmoYTwKL10MFewiF/yZBxw/2ELT8Zu4jAxnwIihOuvf5PEoX7xHngXI
         Xn479Nn1kBxNtDc9gzWsVGRSaa4X31FQDXvKOrsSjPZh59etxcyro4xs4T3sy6dHyN/5
         VS7dNy/ENhTHRCjJOlpDoIE8vCMgMeBF3YoePKm0VkRU/u0Yd+jGD/EwL+rPu68cH+nM
         ZJUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Caxcv4kT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id sa41-20020a1709076d2900b0095908c64a22sor1330122ejc.13.2023.05.02.02.47.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 May 2023 02:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Caxcv4kT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683020824; x=1685612824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMKrazW8sILQReKUpzrOaZv7JAe2Iym/Bp6J/et7XJ4=;
        b=Caxcv4kTH7v/ZqTV0au/4aVpEYqqkGsgyufry5xAbWCv6YOZmKIyVHDfTiyY8brWSV
         ru4PVyJm8C+QyOPVzXjk73nc4erM7reoA5ymTefDrLYnbheAX2NLQOvmT/DdQCfFZCYk
         x1VHFXsT4ymf3Fipm5Y3JZ/xokv04jcPy7WBha52wx+BaZRV7f5rmh4N34LfHTjPlk4O
         wlkjVJQZbtlZ++NErvy7giGMSD8oYXTIcZBdu0TCdCEjmMmnjXudy+o4UmVzN5io04w0
         hTACPj/2K6xyTyA5qBM7A0iYY9cyYUJBwKPPr5SPVK2WX4ylDukkOhdjayouGCZ6/slr
         e8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683020824; x=1685612824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMKrazW8sILQReKUpzrOaZv7JAe2Iym/Bp6J/et7XJ4=;
        b=j7xXM0liklRId9zWDNFrMPMe0b4NHzYhnb0MkFYM7cYd+sZ+m5iVevDuoTfn3NxNbx
         OJnand25nQIO18dhpv0PwFUs8VQZ7bIrsySHPctCPxNQ77yqAp3jLyoYcurYbnMFRK/R
         UXk95obbi8CMkox7ZBdfV5kuxJU1WFeaGgCl/DE3ViaGprla/itR1CWCRkHROWeNH40Z
         YFrrPAqSJDSVZVqXxGykopJqY4QjHtUK59R4SZZuuRxYF3owqv5YXcITLTAzgvooUdIV
         L3wVlxajrASo9sqDBjgDandiagKrBTs12oRrDcA93KHp5ZoMm1iVupjWSwZgLql8ZLkz
         UupQ==
X-Gm-Message-State: AC+VfDyFvhOPjYZ46DSOkdXZpWIIEsKUbEiEm4i5F0nboalSD3zmndFh
	ceFgPWXg3Zc06Tx06OnbgQO9dEv+Oz+ZOixelaDKOBHwDZgTUyeHUyc=
X-Google-Smtp-Source: ACHHUZ6KtZ4JA3EzXD1VW5QaGQw0idIoMnxxWCEX8yLiDd2HN9rOZiSIYEaNZAAOYn/dNZ7Obtyw8kLbWh62PXSgV9g=
X-Received: by 2002:a05:6402:648:b0:50b:ca21:a85e with SMTP id
 u8-20020a056402064800b0050bca21a85emr3619653edx.35.1683020823919; Tue, 02 May
 2023 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de> <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org> <87a5ytpirj.fsf@suse.de> <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
In-Reply-To: <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 10:46:52 +0100
Message-ID: <CAFEAcA8EmJcOiy0hR36wonBJDLEDuVBakYYK=cXEmQ3J-TtrTw@mail.gmail.com>
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: TkTSuYa6WW8D

On Fri, 28 Apr 2023 at 08:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/27/23 14:16, Fabiano Rosas wrote:
> > Richard Henderson <richard.henderson@linaro.org> writes:
> >
> >> On 4/26/23 19:00, Fabiano Rosas wrote:
> >>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
> >>> query-cpu-model-expansion test to check against the cortex-a7, which
> >>> is already under CONFIG_TCG. That allows the next patch to contain
> >>> only code movement.
> >>>
> >>> While here add comments clarifying what we're testing.
> >>>
> >>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> >>> Suggested-by: Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>
> >>> ---
> >>>    tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
> >>>    1 file changed, 17 insertions(+), 3 deletions(-)
> >>
> >> I don't see why you're changing the cpu model here.
> >> Neither cpu will work, of course, but why change?
> >>
> >
> > Because there's already a patch in master that puts the cortex-a7 under
> > CONFIG_TCG, so I can have the whole if/else in this patch.
> >
> > If I keep the cortex-a15, this change needs to go into the next patch
> > ("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
> > which was supposed to be only code movement.
>
> Well, I still think the change to a7 is wrong.
> If the two patches need to be merged to break bisection,
> then so be it -- just mention that fact in the commit message.
>
> Peter, do you agree?

I see your point, but on the other hand this is only test
code, and the situation it's checking is a rather
uninteresting one anyway. So given that this series is
already on v11 and it's an awkward one to have to keep
rebasing, I'd rather take it as-is than ask for a reroll.

thanks
-- PMM
