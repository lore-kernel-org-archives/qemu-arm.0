Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp706718ejb;
        Thu, 16 Feb 2023 09:22:43 -0800 (PST)
X-Received: by 2002:a62:79cb:0:b0:5a8:aa6c:dc14 with SMTP id u194-20020a6279cb000000b005a8aa6cdc14mr6181505pfc.31.1676568163164;
        Thu, 16 Feb 2023 09:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676568163; cv=none;
        d=google.com; s=arc-20160816;
        b=wCNBCDpjGC81QcWoiN+b1EMnjDnTpODvMnWy48CdczMbzBYEmaCd/aoN4IX26yTaqE
         U/7I3XQ2S6gI0eWfSgT6lrwdXbVUrh4Ion1B7sLv2VOZJvF1vAbIxpbAXFlDmHQtFnPL
         2BDqMNctw/vB9n6TkhIdgG0KtZgESXzoolg38VTanH6XkEEScPFL/2T9oanWTNbvEN8C
         KP4aJzqs3cah6uhBKZf+FwQN1nLrfXLc9a2zhhq3lvlqZrYqXwg1nyqc4TnXoW6AMu1r
         /oWyE8u19WH3THadIYc27Yp9Wx2xppJEyOiV3djEM3XprOgMSLRbEg2oVUrCpOsFooL9
         9+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sbio814rV6jzgN5Pjf79wpkew0WRoB/DmJ59mYScAAE=;
        b=pnm70rDyoRRPr5YA/ORH77ILvPgZ5xTsRsGXbqmUL3ONJ08ivM/+COFz1gAlG8Dlkp
         dRlsHQvUKkOg65OP1lMkI5/L1t9H2BkFodOouzjyU/ktaXKOc9DHWlOqELPe42wAWFDU
         vZmDs7FUG1rSgatBSO6lmiZgt+lS3FKZIkFRVY9DtvuFK/jC7QmqkgXiFfDW29RTwasB
         wlYVai4XA5wIApnlN7U+egB5J6l5KrehqhslXPs3M+3hVWAZK9V5dUwy1UFpfYNw2iel
         D0JOuwzaOA0Uyi+LgLY5WivGuERU5tDI2nzZiJfee187REl6W41jw5zcB6IXGM7ioUOV
         Wxww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mb/lBjHh";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k73-20020a62844c000000b0058e1b543a3fsor891689pfd.102.2023.02.16.09.22.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 09:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mb/lBjHh";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676568162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sbio814rV6jzgN5Pjf79wpkew0WRoB/DmJ59mYScAAE=;
        b=Mb/lBjHhHavtmQEiI3iRKW+plXv0tyvhwHcGtAaFor5auzXahb6SSQ3AIpbzmsalXi
         DWbvdLSBPC+Jf4H/bRacRy5AQrflutRO/SlCsULHvtdV7MxT5a80oQRovHdpL5wOdPfD
         0VCKGZBPDWj6XOKvydVq89xeY6VdlzXAjgHlL4npTfL5XrgNDkWt5o8G5HGMRlcuCWey
         M+Zgo+84eUNN2Y+jkOGI0g1w3k5SERmw7kncTaitxNqGhEe1ZK1ZRxpK9jBrefSv5KLO
         rcRpFpZdkBDnivXMRXogF8SZyViCELIW0OaZQXcxAhk2W/d9NeDsyVvRhq2gu8zwExr0
         DdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676568162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbio814rV6jzgN5Pjf79wpkew0WRoB/DmJ59mYScAAE=;
        b=v5uwLOu2Vcxa4cW55SfmUPsR3qsmry6B1sbtaUGSJc9DX3apXpA9gPEgXqxbA8N6j+
         NGfSv/Rgs+awdTy2A1DDGBalXLWsnyLTry99H0fYJvh+iEDw0Rnr+Rw3ChQAZD/M9nrG
         bk24okg6ECq1nyCpr9kUtf6cG8aCAPOjG67VQvNhY6p5Mx1oSdVmT6R1inZ9CUBGsNtb
         sITPwCTG04n5Sahcf2frV/yC9HSaKmuUUtDsfIHdcL9cZdlzu56ruekcxGN3IHXLrMrj
         KrL8J5FRxIEguGpXvsvLTPjqfZJsM62LKZRvT7SvV0Z9XNbXvn42u2KJAFtwFOnJ8Nvf
         yFkA==
X-Gm-Message-State: AO0yUKU135vGTNXl9y4kGYc/P/1UCInD6PIUKcqjesLfXsUz1lrZmL3r
	/5WjUcLX4NY2NBDMHqWrDETEb1wLAVRoqpiOKm9FIOA/
X-Google-Smtp-Source: AK7set8OwqF3mDfKQvEpHPj8Uq+y3r9H+p0pb9S6JnX/twBzlfN3/WjNbg3LNzKmgUyG7AjiSeK+b669YdzRK3AtHzM=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr211464pfd.48.1676568162597; Thu, 16 Feb
 2023 09:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de> <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
 <87357536br.fsf@suse.de>
In-Reply-To: <87357536br.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 17:22:31 +0000
Message-ID: <CAFEAcA_Zz2ko88N4x=x=mPabf5674VgNmewK3e49Gjs1GSTL=w@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: zgs4nZHmVpF2

On Thu, 16 Feb 2023 at 16:47, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
> >>
> >> Hi, could someone take this?
> >>
> >> I rebased and put the two series together to simplify. I'm keeping it
> >> up-to-date and tested while it doesn't go in.
> >>
> >> CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
> >>
> >> Based on master.
> >> Supersedes "target/arm: CONFIG_TCG=n part 1".
> >
> > I've taken patches 1-5 into target-arm.next.
> > Patch 6 doesn't apply on top of my tree, which is unsurprising
> > given that it's trying to move 9000+ lines of code in a single
> > patch. That's so much I couldn't even figure out how to recreate
> > the code movement locally. The diff is not very legible either.
>
> Ugh, sorry about that. I forgot to apply --patience on this last resend.
> That diff should be just a sequence of 9k '-' lines and 9k '+' lines.
>
> I'll try to split it up, let's see how it goes, the ARMCPRegInfo arrays
> are huge, they might end up pulling everything with them.

If there are opportunities here to split some of the different
categories of cpreg into their own file, the way we've done
already with the debug registers, that might be a way to help
structure it. For instance the PMU registers could probably
all live in their own file, and the generic-timer regs similarly.

thanks
-- PMM
