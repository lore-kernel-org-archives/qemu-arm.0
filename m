Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1952715lfk;
        Thu, 3 Feb 2022 08:13:35 -0800 (PST)
X-Received: by 2002:a05:6000:15c5:: with SMTP id y5mr29696672wry.94.1643904815558;
        Thu, 03 Feb 2022 08:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643904815; cv=none;
        d=google.com; s=arc-20160816;
        b=l/QFSODjuq9CLN/qEegRrB2aDZxXj2Mqi5FkvBkxqcosxcbbM3UZDPlo5LLNkgiLax
         vxIc6tMjpx+O0jOemJm9g4oHLOyT0W6fAnWTt1lGMcD4fiqk4a7dBYZtR7DFhs040MhM
         KHsN8gJNk3WbE/JkqyxxHIEpAY7DiAesq3P3fdtF9vUsP1RdzV+l6wKD6trAlaGj0Bsr
         6RpbRYc8Mn17z6xTWkjgK58490EKOA7aDkss+403k1wBWhRPeN3Nr7ETXdViQ78mdxkK
         CEjXBSzwoGqtydLYtP9sdxObGmjd0PYazbY8zPiwVIhP2LUHLwo8hXemtWJjW4s4a39h
         nSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jHAQ6Tcl5nITN+zzsMb9Yfzy99jPOO6lzA2+4ntXVzY=;
        b=slB7d7b7r6dnwpUS09085VBrp/OaAkBhf0/Ca/AVnUsSvwmxn19O21mrSfqOOR2P8J
         7r55Jo3L9HAe5ZQvjvJFcmbh5sJr8vxSUwh65HNZmfuUoWlt7qgih+i6O3/7z0VjZsR0
         WxFhWjrAFvAHcbem8KNrvTJ+6zXaeMcCryY6w3guUzNveiOdckuX+6HE3+gUWa2b3XGq
         aSX8rZToSLLBJy6dyJa4YByt/NcYR3ROjS67jsFzVG7xUG4RdJjbnPyniiQR6ug6YAR5
         cLr+ppEgWyWYw5kREXcAOSrYytZKfGL6Ylbw5mn+y2RqEOwjpk4StQ0auFxuKo6r0hkS
         2sAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfzSg0ov;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r5sor9849615wrn.10.2022.02.03.08.13.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Feb 2022 08:13:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jfzSg0ov;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHAQ6Tcl5nITN+zzsMb9Yfzy99jPOO6lzA2+4ntXVzY=;
        b=jfzSg0ovaq7QK3gnypyS/O0rRrZPG21JB3onJkAS6zry74aPjXnExS0M7p79i3T8P9
         yLL72tgHPss2DV4PB3vgnoeP5upYb0ArCJXizdLdxso6rnTMe1kOIXAtY9dRC1VXPNH1
         4bvqQfa7oA0N318vTReeVH2UovB6Fe4MP8xHqWY3wY8LMZwpeYr/uIDBmcIE2BnXZoTf
         Vthe1FIWV3rTIfzD6FwF58OzKl0xsmvUvEzKasf/ELGeDHK3DFXlT9k8b9YBbmccDlPm
         qaSk14yrP0cHV9LAhDAiMonC61kqnMSZgKUjiOxTEl/D9E0tU5PNzM9wccgwdeP658PJ
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHAQ6Tcl5nITN+zzsMb9Yfzy99jPOO6lzA2+4ntXVzY=;
        b=nfxQNEn+hdNzSc26srN+wLo2zOKV2W7EK0banRGq71yRa3FXAez5MbSABAsDtdT8si
         B1wUfefE6Mv9OMIIfqGEwOYlUbtOBt7fPVy1WwRSiYmBsd86RYHa/Dp4tTGxMAW4LvpD
         MYPUvS/S59htm3qYMV2h6ctayyt25ff/qzH20ufs8TamgVszWaz9aqp8pOBIEdHuUCUY
         OUSE1JC3cYqU7qXa2I9tpEXcz9QjtX/2zHOWtN9Cd4ErM5JfFqxeYIjJu2U/3rNK25uU
         y9lts5ubDf3knMVZLEREr0V8/Mv7K5gvc4z4/GBFEuiqhr3wP1kUWb4uK/ck7ygrmbvK
         PxkA==
X-Gm-Message-State: AOAM5301aZ5+EpIAzrmEtl4wYtdfSIErIx31aiX1fOKUAq74UQNNZEFE
	RyN2rJeX1x/POj+zDnRdw4At297AeJdQ+g4KB20UhV4Du5ZS9g==
X-Google-Smtp-Source: ABdhPJwy+oc+lXZRYm398p40S0ERc6xiwcsyPclax0eDwzbRvk6DDrvFlgDC3qK8RkVek47C7Xkrhi/bWAJ0SUj6N48=
X-Received: by 2002:a05:6000:258:: with SMTP id m24mr30803106wrz.2.1643904815189;
 Thu, 03 Feb 2022 08:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com>
In-Reply-To: <20220203155304.2648009-1-valentinghita@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 16:13:24 +0000
Message-ID: <CAFEAcA_51Hy4kiq0BmXQez=bXbEqUB9Xvthnb1ixyoyUKaPpLw@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: Valentin Ghita <valentinghita@google.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: eD16VwPou7uu

On Thu, 3 Feb 2022 at 15:53, Valentin Ghita <valentinghita@google.com> wrote:
>
> The DEBUGEN bit is set by the debugger when it is connected to the
> core.  Software can use this bit to check if a debug session is active.
>
> Add a function in gdbstub to check if the debugger is attached to a CPU
> and use this information when the DHCSR register is read in armv7m_nvic.

The DHCSR.C_DEBUGEN bit is for the architected Halting Debug, where
an external debugger uses the debug access port to control and
debug the CPU. This is conceptually similar to QEMU's gdb debugstub,
but not the same thing.

QEMU doesn't implement Halting Debug (this is architecturally
permitted), and so making this bit RAZ/WI is correct for us.

thanks
-- PMM
