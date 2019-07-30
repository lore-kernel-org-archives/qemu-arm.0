Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4587232wrv;
        Tue, 30 Jul 2019 09:42:03 -0700 (PDT)
X-Received: by 2002:a9d:65cb:: with SMTP id z11mr48833537oth.325.1564504923659;
        Tue, 30 Jul 2019 09:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564504923; cv=none;
        d=google.com; s=arc-20160816;
        b=FSGDctvUlY/gofXaqNQQuoTyFNJPeleAOePygrzVuasgb+6NsGzquToK/9tILj0l8T
         Si1uXbr5balZeJHoeT4WysRYEYH4f4iFG6JvdYKVs+YQMl6lfHZVpabBDvdssavsQuoY
         gZNrf69kQCDGN/s7CHeXA/rrWFrcLGuFxuo3kUnZvNFZDDk520/1HBReAFlyVrHj8QPp
         70GZzBAFT2/tyJOKshAOk+kFEFwMGKdjU0esEXozhjak2eYhcAKResLBGYMpOSq9FiRX
         fPygfCe02esNIPvnqYEp6NVxMXv5c4ia+DZbh00XJvSLwHhIiS8OoTTHc0UPMIvKrzdJ
         gwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfafEYSPfzAyOBXdbB1n/j4rOF8gCfb1ntDDy8rwbIA=;
        b=LjPsM+DcR8Bsu/aLsxx90bHAmiOaw8SKPAs10bFVXkfQ6udwGRCCKlZdW8UW3ulvrE
         4aT8r+CRgv1wc5fH4QijU/PWTwyX5N0cIXRQuDWLMX4GbqenDqnfItYA9kq7hSVSuFE4
         DxmY7FPFHne0vZIZleBTGoQUpEMLOorO+bob4XMUTmW9yh9xrCJxbYKgkhsssDSmJjK9
         ApDK+Hf42hynig6XiaF2Xv+JtNqLk5kfFLBvtJPsTl4XCmuq9ulpxAlzK0VcA4vUU1/H
         lyKSsxDQbjKZvrpVuxryte640ees6fTiDVqTiddj2+Orvkzszz936zLeSy6gDje8bfEk
         /JTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGF4koiv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h81sor28256979oia.128.2019.07.30.09.42.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Jul 2019 09:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGF4koiv;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OfafEYSPfzAyOBXdbB1n/j4rOF8gCfb1ntDDy8rwbIA=;
        b=nGF4koiv+oDd3rnl/K2HD/M7kQBlUWRoHIPwUayluI93qFFG5QOs/lyqiwkz7mEx/b
         fjBPKvWcmg/15Zi/n3mvsuVC6/L3Qmx4MlM3QRbRSPwGSRiYE7ADnZrbo+NWDmgSs8U1
         AnmK2IkVcCDr7nDVROblItMTtCD2bCb6O64vd0M8oxVz45LmW3nujgy6Z1v4YscSjV0E
         VrKl06/xKuvkroT9kKNYPLnDxY8qm1w59Tx9FlFdB+HcI0MSIevyCKqrYfLSjLk3FS8O
         pdepQLkF/rjWjcFo0xWkUJFq81HV4efG+i65uEIMyInT14vAo7aJ8CtRVGrMWKUBS24b
         r7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OfafEYSPfzAyOBXdbB1n/j4rOF8gCfb1ntDDy8rwbIA=;
        b=TlySpoDnwWf6flW+pf2+wse+0n8NRMPbRXsh04LcGjrnuGp9TFvcgbxWMK+Ft5f8Ym
         XkY7+liYVJb8o1x2SZQcNlhrOC6OooWFdN1hJrRBhv6Evtird2RCPyy17kfAdGsY0/U/
         LVhdbibNC0SM+Rw0gg89dK7iWeG9YMa2CSxFSFNoYD3s8s/yVBdEt0SC5FJT3G2xrNwF
         2jArIM8FbmtPb0NmCTX/X5KotrMZaXZrVZLGvS/VIVfNMBZszLDiJAXgXuLZZW3taS07
         kkuQAXPN8u/blh7B2R6HpJwK6bYxMrnQx2WOzuRhbR2ipmhU0RcaWwmDA8SzIZTyAerN
         LTjw==
X-Gm-Message-State: APjAAAV0v7CYIMMCQec2WfzaG1MAo3zxtRuDWVBJ/eN7EVplCFHmDDWB
	R7zZRGOCNelJPzsD95kYPEJ4HbkTbzVNhTNnZyNGEWx7
X-Google-Smtp-Source: APXvYqyeLfRy7iSI8pYbVvXOhB/uWLvBLzQeX/BgOiojfOYMaFtPKKoSrmlvsegEZk3sCxVnijqI07GqrseBLRY5K8M=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr55474571oij.98.1564504923200;
 Tue, 30 Jul 2019 09:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190730132522.27086-1-peter.maydell@linaro.org> <c8d89a39-a711-a416-b069-5710d672b4e7@redhat.com>
In-Reply-To: <c8d89a39-a711-a416-b069-5710d672b4e7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jul 2019 17:41:52 +0100
Message-ID: <CAFEAcA_5+tYKyMO5A2h-YRe4h25VrGS0wm1G=yTY4OLX4Q4XMQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-4.1?] target/arm: Deliver BKPT/BRK
 exceptions to correct exception level
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: KJEsJVgp3m2J

On Tue, 30 Jul 2019 at 16:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/30/19 3:25 PM, Peter Maydell wrote:
> > Most Arm architectural debug exceptions (eg watchpoints) are ignored
> > if the configured "debug exception level" is below the current
> > exception level (so for example EL1 can't arrange to get debug exceptio=
ns
> > for EL2 execution). Exceptions generated by the BRK or BPKT instruction=
s
> > are a special case -- they must always cause an exception, so if
> > we're executing above the debug exception level then we
> > must take them to the current exception level.
> >
> > This fixes a bug where executing BRK at EL2 could result in an
> > exception being taken at EL1 (which is strictly forbidden by the
> > architecture).
> >
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1838277
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > At this point in the release cycle I'm not sure we should put this
> > into 4.1 -- it is definitely a bug but it's not a regression as
> > we've been wrong like this for multiple releases, pretty much
> > since we put in the debug handling code I suspect.
>
> The fix is quite trivial, and the user reported using a release, so
> having it in the next release would be nice.
> Or as usual, wait for 'last-minute-bugfix-that-postpone-another-rc' and
> squeeze this fix in.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

OK, people seem to think it's worth putting in, so I've applied
it to master.

thanks
-- PMM
