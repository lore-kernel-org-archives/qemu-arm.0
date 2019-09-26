Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1811295wrp;
        Thu, 26 Sep 2019 00:50:49 -0700 (PDT)
X-Received: by 2002:aca:b345:: with SMTP id c66mr1622212oif.40.1569484249469;
        Thu, 26 Sep 2019 00:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569484249; cv=none;
        d=google.com; s=arc-20160816;
        b=HFR7fP42wO7b2d1Y90JcSpV9coEtl8pg0qe7zV2gGuh2FlZ6gvEo9dTwTNzHTfaQHn
         qAw82FF5PUPLR0qfNjMc8lhKWY5YvdbKeL/uhfMk21fnxqus6Nn7CHeXNL3MpT09IQjW
         wvfBCRc2E6OSgf6x1LoBnB+RBfgBER4ndgFI3QdLYqthE1rnMmeWq6gB4CAkW9rBBuAQ
         tmf8/GLb8q29G+RQ2QOqJG/imt4kQuJYhIHt+E5LsLXBlffGup1itcDjYJo5VqeQHyHY
         qhIIS2h7oST2NMcCokldcUvDvbi3nEd+qLeRUJd5bPzOGaspXAC9A+d8k03O0zsEPvqC
         SExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
        b=FmWNxMtLWSO2obeiOkJl4aLoAAW2Yfuux3Gt96Fvt3aCn07HJRnbZnfx7/anrXdzAr
         +OLV4S4jYI5A+Q9kDrfRHrx9IOsKqPu9K9tWcLxlkaBxY1lGDuo0EgNq1hzMhw8R9V0s
         bhsKJyzDcHU0VrhHBbYkKa8W4PmU/GqO1utKyodauwmMf4sKLFx6I5VJK00MR/gmxxqY
         xyvD/4Ch4L8mg+7Rg01CR5cJBFChwchTMxaYQ5PAW0STWl+rputOLmhM9HW/Z9EpucMt
         JTqmDG/PTg00voj4fe/J4/U5o5ElEltkP+U893095QTwl03FwVppzIwFK8XQc9Vmf+gu
         QFtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnbxwicJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l190sor657217oig.86.2019.09.26.00.50.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Sep 2019 00:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnbxwicJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
        b=UnbxwicJoCt+RX4tEOGBppHUBGSAJRNXpyj3gWj0oaK7EJcKfTSgqmlfn8uLsLbNgq
         jRORyjsOZBBG0kxWeg17GL/0CfiWml7dh6C6mwpwaYH4TvD/SOvnNqBpz1RkGZTwZBBm
         ZskEap5x9+crxkENXwueR/hsNRKZyQ9pCRaqzgtAJwGEyazYf4JWU+H2yLOTxbIUaUrF
         dZFg7hcRd2/8WuULWy7WORvj58P1O47BFxoMt7IeRx1S8hhQEd0x5q+Nz5Ww/H5vID/7
         Am7bdhL11kJCunGI2jduLzBnuiT8o1pE1bgxvapi/jNUZsbgKvW/ACtquUKlQT3GQKjg
         k/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=piBZm6c0B9OHu39h13g/t4GeewKYhac1BqjPaJCknOw=;
        b=brWZL/u+sjlVRFihbnZF04lkMJdHpj8WdqutC+tJ4oHqzaijwf/DAljyzvMcl793bH
         4f/NQJtcGErIWGYh5tF8jGuggSJXQ9jLGySGi1n+NxLjXEp7RFi0I1mxNOBrd9HleN+e
         0Y0TU1Vwd7Du3y1+BU7QwNFaQsfNiTz7E46QNI3X3CdLFqq1S3RQyIvrRA0IKysL5TCs
         sZL0kqwYFgyhGR+QkX3EgoMPOthpsaVMcqkIYa6KnnxPn6WnPpcpwea7/F2/N+99PELj
         yWv4Wi3tlCqR7auzgHGUj6w8NHj8IGt2IZixKEVey8+zE3j5Fxh2mdI3go1NLnrqGxuD
         S22A==
X-Gm-Message-State: APjAAAUrpM4DV04WLWwQKHdZaVlSFYfqiWyYtGPAHNSuZlNKRpthK1WP
	IoMBA7qBHVTmYGGgnbumVAmzKOyjiKQqY8GnC75UernzxUlS4w==
X-Google-Smtp-Source: APXvYqxbWijizyJrPpz2AKFW3LQQpjXFZqprBuEWlwQub8z9oY8l3hkBkTX0AgQnhmMosvxD2itTGADbuVM6MWGJ00k=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr1517628oib.48.1569484248796;
 Thu, 26 Sep 2019 00:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org>
In-Reply-To: <20190925233013.6449-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Sep 2019 08:50:36 +0100
Message-ID: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-discuss <qemu-discuss@nongnu.org>, 
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mzqX0Xg4bkUw

On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The 32 bit hosts are already a second class citizen especially with
> support for running 64 bit guests under TCG. We are also limited by
> testing as actual working 32 bit machines are getting quite rare in
> developers personal menageries. For TCG supporting newer types like
> Int128 is a lot harder with 32 bit calling conventions compared to
> their larger bit sized cousins. Fundamentally address space is the
> most useful thing for the translator to have even for a 32 bit guest a
> 32 bit host is quite constrained.
>
> As far as I'm aware 32 bit KVM users are even less numerous. Even
> ILP32 doesn't make much sense given the address space QEMU needs to
> manage.

For KVM we should wait until the kernel chooses to drop support,
I think.

> @@ -745,19 +744,22 @@ case "$cpu" in
>    ;;
>    armv*b|armv*l|arm)
>      cpu=3D"arm"
> -    supported_cpu=3D"yes"
>    ;;

I'll leave others to voice opinions about their architectures,
but I still have 32-bit arm in my test set for builds, and
I'm pretty sure we have users (raspi users, for a start).


thanks
-- PMM
