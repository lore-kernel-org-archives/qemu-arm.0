Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp295970wru;
        Thu, 26 Jul 2018 05:10:55 -0700 (PDT)
X-Received: by 2002:aca:4c7:: with SMTP id 190-v6mr1739199oie.107.1532607055401;
        Thu, 26 Jul 2018 05:10:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532607055; cv=none;
        d=google.com; s=arc-20160816;
        b=QqJK4D4VWgmWFjbzJh1heGqaMyksUdb8RjMDNQVZYoSz6eINTHe7Ge1zhBQobfPN4k
         +ksHpYX/q9VUGLRqblszoQfRM7/mupc9JGd6Vy6NKdYPrNGvDhIRBGe2WZCiGd3vme5a
         X8j40PSPLUVAgQtmxwms/maOMvoZa/JD7FTSek9+xWxV6i/h914ExLdLjwK6i5F6uvaT
         t9mVQcKWZ+vPRyBGG6tsmGgC6htTXVNAYbvnA/P/CKZ6usVEOOZRY2ickLuVQ/vR0G1+
         h1SwiSGYYAiV9Yg8FSbT7ASoBaZgCGmjpc6dmOanqjq9srGhz1eOd4Lt/ZxmWJpYuFoG
         Sctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=tVqe3aXzw/KHVjTkgH9k4QPyvxfkAoG/PBTrmyYs5iE=;
        b=QvORqFsOyq5CRfaLVZKY6SqrTgeXkuqw0pZ5b3m/qzD79b9+7vH8HG9UYGmm1u5f/9
         d6kDq5XLgzH93NoJ3Om0pyMNuDSwjMoJt29wCu6MP/vLWrH/8Dzaty4j4vz6YPZg8kl2
         1HAcSu6FqB3eNn8FH06K807WqUYLBP5j02WBYIOFRX8C+XnulJ1cvYk43uKSyLHwYE4O
         VRNTnuNbb7yypXoXreyr1gLjXYGITB7s46/2nGoyhPYduWtRfy4HYvINQetaG4VPf04N
         EhphWNV6la7971rppCbGwB96z2uDVRJzxTHsoG/ECmS9/sJqwMvCZQP8T49jkok1vxs+
         qEBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DxufH6bd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x185-v6sor626852oig.224.2018.07.26.05.10.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 05:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DxufH6bd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=tVqe3aXzw/KHVjTkgH9k4QPyvxfkAoG/PBTrmyYs5iE=;
        b=DxufH6bdHQYfu6WoN6nfdcJLvqQIl0LH7xsItxmcutCSNQRM4KtmwVyJhfOCDsAXhl
         pDDS2QdbEkP9j6JhTI3jZ0DhCNERKVxY8HEey/5hWwx4YwUBWf6Tqwxe+/fcCLojKW/f
         nklxbiVX59deCxaUE9fAS/ScYAMi8w5TzQ0dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=tVqe3aXzw/KHVjTkgH9k4QPyvxfkAoG/PBTrmyYs5iE=;
        b=G7oWJ2HmOO4BPrsim+CGJBQC9fgUNxJav/3PZIY5dt1e0WRCre4140o7s7ANnW0Yky
         PlZ37rEMF2SLLwc9T2+apdITc15c3g3A8Azk221JJuM86hV3oxM0UhpLy9RssxBuh/hH
         f/8sZUAC6x6HfUqb1hwIzV8QAfEIMJC/RT403r5MEGyeLIQ4HSt6RFr+k9AVcDMP/fQZ
         Epld+xZVtPJnuB+rtzYts9kr8b3VXauv5EAIeicw4kD08Aq4vpjiQhAgI2Atsa7TkMA4
         Rf8fxe+FXV4kQlXtn8Stutx86YAoZYJRoYpfjZ5xr8Nk6tfhj7VFeoTcX2IGQ9NtOU7T
         ISyw==
X-Gm-Message-State: AOUpUlG/cAVU7H/H5my5URsIUJnmlKNcTlCnLK10/IF6IEgSkz0XRNy+
	KVbaeEF6bR0ic1R0SwKk9dNAoHd4yjlewKJAa22KjlON
X-Google-Smtp-Source: AAOMgpc0ooyL4lZXvUd4DvOfhXptEqgFe/yOwa0SMi/aDZlswl4IN7GUOuj8IJCTle/wPDSxRC5BYWM1wRd4tmnsY0Q=
X-Received: by 2002:aca:7247:: with SMTP id p68-v6mr1785673oic.252.1532607055107;
 Thu, 26 Jul 2018 05:10:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 05:10:34
 -0700 (PDT)
In-Reply-To: <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 13:10:34 +0100
Message-ID: <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZidMzRkguxEK

On 26 July 2018 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
> The patch guards the generation. It'll only modify DT and ACPI for the
> new machine type. But, while modifying the DT makes sense, as that
> generated DT will get consumed

...will it? Why would we want the firmware to read the
QEMU-generated DT? Real hardware doesn't work that way.

thanks
-- PMM
