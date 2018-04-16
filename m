Received: by 10.28.4.212 with SMTP id 203csp2785595wme;
        Mon, 16 Apr 2018 08:36:50 -0700 (PDT)
X-Received: by 2002:aca:4e45:: with SMTP id c66-v6mr14330825oib.190.1523893010215;
        Mon, 16 Apr 2018 08:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523893010; cv=none;
        d=google.com; s=arc-20160816;
        b=z6GmJbegk180h4NESsYxzGaZZE0qZWTHCKWvBZs7rDdc8bVc+PxWlomzaL7dOWfY6W
         Lh737uxEpVFkpaGGMPR+R2kD/nkdzumg/H31pFaEGZUSBahX3H4Zx6HC+slAhvU2TPTj
         +D2kmoNb+RKUl1CMiuD68sCnMvVBqUXXYI/T4640NggCnbPgX2zvARn1FxuVMNNkzK52
         ptSh9lY3EDcqy3PJikXI39QjQdnXpwGxA/KNcfV19mFhTrQrDf9FVB12koUQElnddxds
         JVcDswYlMlGIGwz/Ks+ul5FJIx/8BKI0y6loqhctDi0ZarS8Plh2HPplqQNBjBnCbLUG
         fnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UXYsCgCNqgL297V8D+ZzCjREN1a+h99r+VtoyvKWNqQ=;
        b=PoMHrH7JjfzV0GChGDiJr71WJbl+QznyRM/Vhr0T/fSdK64V4Ez/AIdIFIPPL3q4xV
         TGfMtn1y2QfIDnPcS/eiT7ULpL68HVoRUcqYSyRw8v+75bbo6LxgBSYbE+XCg/5PX6Du
         Ur+knc6+4NrRDS/2iY36b0QiE6qQPlIZDCDqfVuVFIgBhhXt+EWHFtG5urIT4tVnzCfK
         gzy3RU5HbSW7MRvdg4qHdWW14cUUg0a/gvIXCBm0E4zOh7RWvrz4rvsbCVqlvFQsIM7T
         2KUjvDJK5hHJUasShkmbXKvEaphyP8nMOrcv2+iG3vsQAviS/EHWY5GcmwbJxschHlIK
         ia/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVdr9Nn1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b22-v6sor4889951oib.183.2018.04.16.08.36.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Apr 2018 08:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVdr9Nn1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UXYsCgCNqgL297V8D+ZzCjREN1a+h99r+VtoyvKWNqQ=;
        b=KVdr9Nn11rTjFMAi92neAMO38bvMthu4l4WXhTfNpq5j2A3glYqqT2zukKx2A7oPLe
         rLW4fxnN0P7N+xX8uyiIYIrORhTZjHCLX2EZZ179ywrrrnu68agXThxeOPldTZlWed1N
         2sYhYVXl7HPKiM06BV5O8xJ1ZHoAkV3coQ9m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UXYsCgCNqgL297V8D+ZzCjREN1a+h99r+VtoyvKWNqQ=;
        b=iY40n0JDrSsh0seWaPud7I9gR7gQHxumBDMxDxvxJtHCWTNfySykEWXzdvRPJOtXPL
         jAwUBwgi/wxbpyRvtZzVH4B313rJlehdMFtww0zIvrCsTKXzDT6qgGx/DwKo6qMlE5gk
         MWMd7ws6WVE+TWD6nLVNrt/ecHZAor8vZ/F7rCj+/lGxCYatLCttC8r0Jp3CL4BJrUFA
         6vIw2QJrnMJ+3xwR0I9E3fgQStJDwNEOD0lrTScdBGU+4FK9LuLQzvgWjhsK8XU9eyg0
         qBEpguaXZh7LwNwr3WkrmwaFIbxcTomk3znie54aIiMR6nBVU+too6A+KDGwO1A7/X5C
         jEMQ==
X-Gm-Message-State: ALQs6tBcYtu4sg6ljzDGR/BCnXvXfWjIEKTyfocEDdfnBl3y0hUyEYUk
	bPbrtnuud1DbxdQNfCwampzC18QANeWTyOsSpD0Kqic2+IY=
X-Google-Smtp-Source: AIpwx49KxKbRE4MY5Ry42n16rQCUS2vwBhQ2vG9D8rb77rMy2V8qXkdtsEIQgZ3wlhy2lE/UFPPJ2m46id0/fQnD+0o=
X-Received: by 2002:aca:d447:: with SMTP id l68-v6mr1462062oig.102.1523893009757;
 Mon, 16 Apr 2018 08:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 08:36:29
 -0700 (PDT)
In-Reply-To: <874lkbb264.fsf@linaro.org>
References: <20180416140322.904-1-alex.bennee@linaro.org> <CAFEAcA-1GVMOSJVQ5p8+qpo8P-+fBq0-6TaA2mdvLDbk3fiihg@mail.gmail.com>
 <874lkbb264.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 16:36:29 +0100
Message-ID: <CAFEAcA_edPjsu5vvZSreJhzzo-pv04Bg3bRrkDaUx8=djNWXrg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: support reading of CNTVCT_EL0 from user-space
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, takeharu.kato@linaro.org, 
	Renato Golin <renato.golin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: oNiU4+fYueO3

On 16 April 2018 at 16:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> CNTVCT_EL0 isn't much use without CNTFRQ_EL0 which tells
>> you how fast it ticks...
>
> I've added it but of course:
>
>     /* Note that CNTFRQ is purely reads-as-written for the benefit
>      * of software; writing it doesn't actually change the timer frequenc=
y.
>      * Our reset value matches the fixed frequency we implement the timer=
 at.
>      */
>
> So it's not like we do anything with it internally.

But we do correctly use it to report the frequency of our
system-mode CNTVCT counters, as the comment says.

> I assume in real
> life you could mess with this but still have a monotonically
> increasing counter.

It's purely a reporting mechanism. In real hardware the
firmware is supposed to know how fast the system clock is
and and set CNTFRQ up appropriately to tell the OS that that's
how fast the CNTVCT counter runs. (Notice that CNTFRQ is only
RW to the highest implemented exception level, and RO below that.)

>> It looks like other targets use cpu_get_host_ticks() for an
>> arbitrary time-counter thingy. Not sure you can get the frequency
>> for it, though :-(
>
> Hmm I've just used:
>
>   return cpu_get_clock()/GTIMER_SCALE;
>
> For now....

I guess that will work -- it boils down to a gettimeofday()
syscall, which will be ok for speed if it's in a VDSO and
a bit worse if it's a real syscall.

thanks
-- PMM
