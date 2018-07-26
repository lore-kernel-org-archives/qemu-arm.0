Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp154511wru;
        Thu, 26 Jul 2018 02:20:01 -0700 (PDT)
X-Received: by 2002:aca:db09:: with SMTP id s9-v6mr1159543oig.339.1532596801642;
        Thu, 26 Jul 2018 02:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532596801; cv=none;
        d=google.com; s=arc-20160816;
        b=RxJVIiSSdGZrt043u0SaSEq+uYHEE0azwqS5ER0imEryJ9o0D+rPPUpxAmn5Xz47g5
         xRuJHEB491wCJ1Su6DYl2cVqTV2aGaijZ1413ctWgd5STuAMVYxKzmqwTE+w4LsXwlh5
         GKIdEpmJgQy32uALt07cYuqpLLAGq6ILgT+AHJuggqust1UzqjjsJmvTxcB7TV1Qmv17
         XArJGAV7tE5G54qhVH/qDXEdfwnbSlGi6GD0nkYW2JGx2GoMUisPBkM6MVFCCdp08sQB
         ynBWEVwWTom3aMXJjGRvq2PzX9XsLCjEjSi5waLJv6NlLzzoepOvwAzlrvEDs/3Er4eM
         HBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=iEDqBVJLLNdQYbtmInTZZjjiFVeuFCdMTsiS/MT0/bE=;
        b=dr9Z57irjx4AO2sd9sTBV6T/CcE9in/EwmcWqTZS0rtT284+sGrLSptseH/edQT9m2
         o6e6AvHPKag7YrOwoPRq1NVb3VVUMsN10l+ZQm0QWtsgV+Bw8AJ6aRbEhp0ClQgiAVbv
         XoEZXS9uawcABd9xNz/sEZ16mdgyRPlRYQ2zUE3d3jiXzAhTNXkRDaHf7LxW+mD31Kkz
         YZs6XTjLhI2XGKQ9L4uDUSXRHgso/a/xKhFsPeZ/cb08BFe7+EKTiOTWLZ2fVbv9AJqg
         tiLC6z5F2t4eRhJNBpyNIQ01U80XFBr9RohlSemkdY8YoTgx2ig7FWvIW187XtT/opKT
         46/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCSjVvqx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z196-v6sor450836oig.133.2018.07.26.02.20.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 02:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCSjVvqx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=iEDqBVJLLNdQYbtmInTZZjjiFVeuFCdMTsiS/MT0/bE=;
        b=TCSjVvqxWvSIUTeJy+ysnDoH8Sy5Rhcv0wYBqpYkliATahiDt/Rgwax8dBUyBhzkcY
         LkHspUmI7vt1e9igjD4Crb9fVOu+OQH8y5HaZFktRkSkyCoLYBuIPu5FskIO41F2ZWJa
         nAHhvH/pkrT2vdjM3RLkhkAU31F830s6u+mRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=iEDqBVJLLNdQYbtmInTZZjjiFVeuFCdMTsiS/MT0/bE=;
        b=VUm7EBTGAOVaYN19KX0MzKBtDLoElx2EViTDZiP/7pk6uxc3KHnHL8VqD+U7n+ILYb
         nsU8AKdFe7g5r0G2WdyoFgvImKjbyYRakmd1vor5UciNglXOR28+Cz3gQQFaPrz67+vc
         8d2PUOurFEl/VqOm2nffPFM9CJNzYa5SIZ3r5rGTJqpjz5XmE37KHMZW7AQaOdiauI8a
         FWeH4ut8VTKkTEMbItCOR5sqeCc3IzM7+922qoTOb7TsjesNnLdUF4sXTYmP5Qgme4v9
         bAM/vj9lNhLnl63xw22r++xEVPUdqy7BaAFWVN4Z8wfGnCQ1mEDpHsQkdy1WLoNxnZHV
         ZfqA==
X-Gm-Message-State: AOUpUlHZMFynMiqVQ+rKSwgVCtgdZgGDoQ4eCl/s2bcuUSjFooeDxyTu
	7eiQdV+qeeZyr8b1uZBA7W6JdX81dgq6HRL21kqWzaqP
X-Google-Smtp-Source: AAOMgpcMuNbPiv/hWl9+kysfxxlljAm7Usf1Cv0SNy+lFfrTgVt6DOBTdoWzGZW/RFp/GQEdeuivJ14fL3BTlGV3W0Y=
X-Received: by 2002:aca:a982:: with SMTP id s124-v6mr1177359oie.80.1532596801322;
 Thu, 26 Jul 2018 02:20:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 02:19:40
 -0700 (PDT)
In-Reply-To: <CAKv+Gu8qM=C=bJeDrUHxMEp3mZ-PYemRXK-Qttvwk9k+C2uz+Q@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725105330.GB2366@work-vm> <CAHmQWvCHBxdMy+Qocc1XfURx86RTZd72rnB5-R=5QA00R6fEqw@mail.gmail.com>
 <CAKv+Gu8qM=C=bJeDrUHxMEp3mZ-PYemRXK-Qttvwk9k+C2uz+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 10:19:40 +0100
Message-ID: <CAFEAcA_DL-Gfo3nJffaWquORaxkEdFU3hz0cndBq_zvVAL3vHA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PjpECYLDc+G3

On 26 July 2018 at 08:44, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> Does that really matter? As I pointed out before, we are not
> interested in running the firmware on actual bare metal. What we do
> care about is not having code in the reference firmware stack that was
> added specifically to deal with the dynamic nature of our QEMU
> platform.

I think we also care in the sense that what we put in the reference
platform is an implicit recommendation. So if we (collectively) think
that good Arm server platforms are likely to or should use XHCI,
we should definitely consider going with that, rather than going with
what happens to be being used on currently shipping hardware.
(We should also consider whether we want to implicitly recommend
that the USB controller should be memory-mapped rather than
hanging off a PCI controller.)

thanks
-- PMM
