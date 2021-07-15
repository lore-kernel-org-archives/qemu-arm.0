Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp577444lfc;
        Thu, 15 Jul 2021 12:29:42 -0700 (PDT)
X-Received: by 2002:a17:907:1b29:: with SMTP id mp41mr7013089ejc.459.1626377382788;
        Thu, 15 Jul 2021 12:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626377382; cv=none;
        d=google.com; s=arc-20160816;
        b=JyFyQYDX4DH8Qi7kqkU6w5uncudzQF+0cyFQ8pabpTg/HU3OSvxhkyicEBNVDC2iuv
         rdxP6Xo3ewUlga+OOY2uzJ0m4nWufJ2PRqsPy0OtPfizmZ7BNSlr3QmIMEB+uaoT0VRu
         4MaTVmyBVuhNx7H4sf1Gl3BRkFtwm30WLjZCV6eeEA26uOeipF5L0rgknGmUiRWfx8bY
         NE607vk971EmPtFxO1lxVz1qlZnlEB/+R1FNiw9DM7Ofhp0wmb4OWll2yjKc9FpnjEnh
         vgEAe7ApdkfkUywfy4xidXiQ1nYdLeg2ApezY9PpquRolgXoN2AnOosGf0HrHFm8MBpz
         7tHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iOgTNX8o23idiqZD3+PahvcNwv4GJBpkYn5xX1HkZzU=;
        b=PkjshphNmQAHpuoxsLuM2fKIPGa7R5J+DmKp4rqu7I9IvbSGwwV2+w/AdSMI75kbx1
         t3IA6KO2qvgPDCr/D0QUr7h/y6y5udLdEmE2YbTwAP1EwpjpQYi/1Onl9Yjdj6jMfSQg
         k+YOKY+viGmFawZJOC5sTCdO12Wg9Ga7esdnM5XSwWRjxOTwmY++a9veCTm3fyEMZKmI
         Pi+IaWu/mDbPfzqZG+m4o6ye7sxClxifKsqon5d1n2reWXb2ZbfhoYv2K3FIOrY8EjXM
         NB7hBN2chvoRffh1J+zpjS2tnX8NWlBvUsuuQaZW8IaiMygqt9TqwYoym6l3scaF5tzM
         12fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLIvxLVE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u24sor6933748edo.6.2021.07.15.12.29.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Jul 2021 12:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLIvxLVE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iOgTNX8o23idiqZD3+PahvcNwv4GJBpkYn5xX1HkZzU=;
        b=jLIvxLVE0b+RxSnedLTx1uDIN+fvM0to5FIpjM8AEBnN/I73/L0F77cOWxF2j42T3R
         /wiTdZdyRPhNJ6h1TZHYX/fs77iUtwribDxL70mTw6fUsslztFpiDZQ5unKCNQ4WvRja
         yb/AYvDd3GRsiZYSYuU8leR8kJL0/aaTp3Eak/6/QMSVWP0ok5Yu4T1s98mBHCEZlqUt
         1q+STdjEh8OWokmqwboq/eU+oRUPuACug5nOYm6s6OcmzQOIsziCLVWJINcHuYKI8hb/
         JnDnCnQcKRCl5ypXZATUQoYgEaTk//kHiRVdlqdubMk0xFuLlJO32euBqr8dGIMBfezf
         lzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iOgTNX8o23idiqZD3+PahvcNwv4GJBpkYn5xX1HkZzU=;
        b=JIKsfn654H5+zJ3pj1fJI0LR6jLK6vnyLUO7jUuanHbwiI+i6ZvyFHbjv3szfwI0M7
         H6acfv1O1f1NpswUyPhStEUfs+Wteh0ola0GcABApPhi+m7vyJBBfv8tBWb7jfaWeRfs
         Opnaax5DTm+/w9tmAcbyQQrM7E09m47fLvesPBdX0DQ94eS23KZg7qIUJbYxhXJM/aTZ
         9PZ6na66QL7vU/4mWdELcJu8tjAu8IVIHZYCU/FahuoNRgYOh7C+vu1Zplth/og1RJ0t
         wCpB3CBn35fpjOTthdvIwaXkhAhLgAsd82QWDAJOxSkJYVYLaZIwWyowmI/rPZ8ICR4H
         KSgA==
X-Gm-Message-State: AOAM533z5dxoMJbiCCt9YwYczVppc4eYESpuHCW+wmF9SvEQf9oxB0bA
	u7o3lelCPBHcDaXQSfhi0RXqKKi+NV8A9VtysHXwbuG1
X-Google-Smtp-Source: ABdhPJyetSuZEgbJOHFFjfsdtSJpD4r7SDE/VG+UDmHm4UTsp2Yd16ZL3rVOYCq1dVzI9odDdiuHi/albWXb21OE5hQ=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id cz4mr9297241edb.52.1626377382438;
 Thu, 15 Jul 2021 12:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com> <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
In-Reply-To: <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 20:29:02 +0100
Message-ID: <CAFEAcA9kdOm1kLg=SqCg7oK=2mq-Sya9+ydS7L9vx_PuQOCLyw@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Joe Komlodi <joe.komlodi@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: jUB0L4NizZZl

On Mon, 28 Jun 2021 at 16:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/21 7:54 AM, Peter Maydell wrote:
> > Richard, Alex: what is the assertion trying to achieve ? It doesn't
> > seem entirely obvious to me that because we're in default-NaN mode
> > (which is a property of the *output* of FPU insns) that we should
> > blow up on calling float*_silence_nan() (which is typically an action
> > performed on the *input* of FPU insns).
>
> This was in response to e9e5534ff30.
>
> My assumption in adding the assert is that it was probably a configuration error.  If you
> disagree, I suppose we can revert it, as it's not critical.

I just ran across this again, in a different context. For MVE VMAXNMV
(which uses the "default FPSCR value"), I need to silence input SNaNs
before performing the max/min operation. The logical way to do that is
to call float*_silence_nan(). Except that that barfs on this assertion.

So I think that having run into this assertion() twice now it's
more awkward than helpful and I intend to put a patch deleting it
in the appropriate part of my next MVE series.

(In theory I could work around it by deliberately squashing the
"use the default NaN value flag" in a local copy of the fp_status,
but that seems like unnecessary work.)

thanks
-- PMM
