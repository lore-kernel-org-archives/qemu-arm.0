Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp790875njk;
        Wed, 17 Jul 2024 05:59:17 -0700 (PDT)
X-Received: by 2002:a17:906:b0ca:b0:a77:aa6d:e0c7 with SMTP id a640c23a62f3a-a7a011b5305mr114652166b.30.1721221157619;
        Wed, 17 Jul 2024 05:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721221157; cv=none;
        d=google.com; s=arc-20160816;
        b=IV4ljhkDJx1K9WJCaPwmr5ItTndlYMMMyr/38M3SeW+CK3xrtnfdQBJhnwmU7XFZ9k
         RmiX0/DpDMxjwgaSBpS9vRPLm9J1DawUq9iwS118nO85CaoKJUEtlymTM9PzDz9HyUN0
         HrNJHEG5yfw3Py3rwGdVM3SQOXRPzZV+po917TNMIQl+Tk3x/pW/RZBbo9c97VEdSDvO
         xkx1r2xHwDtgLrsBGPuTnLS+QkshmVarCmby3AUaNpCP1Q/57usvwobmlSmo9z/UL7j3
         7Q39mfIja/IihSLo+VXZoTqpyD//DPEmxJgRAXplBptkrKtJxQ1GuCFM7dCj/Qb0PDIy
         k3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=idvDtEwZOQUpT0NLawRdOHb4ouT+t6TnY0ba6XL3flE=;
        fh=Dj1kCF53wAAKsUceIg1gAqnaC4xeVBJkiT/g+mbJFic=;
        b=biEXTgO0o9DIt001nZY+OZrrafzIXDmHcPlONCAfMs+gi8U2UCESx7vXqVsQlDhYTm
         ph4tV84lbInIJsZ+xycxuTM4e/Uu1W3j4qJg2idJ5DMuZvRSZ81VJ5vokGz9QjHI51Ss
         duEjABqph5NbcZVRZJo3Nhr62l/Rw1E2BbwrkNORqm0t3K8umvFxGI/YQlozTsIzj+tv
         6GroT6BCmEE0qKtuh2bOSzBO5iMc+vkh2eOeEWsUrgolgNUZ0SzyDKSrfLX5vbek/IqB
         pYX/IDuIMMEIiJ4ESJXJcXWH4uAInoNOKtlgF1LYfupurtXhb/uShw6rpVXioq/Tcmuh
         cy5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dMetBjqg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a79bc59800asor197237466b.7.2024.07.17.05.59.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jul 2024 05:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dMetBjqg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721221157; x=1721825957; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idvDtEwZOQUpT0NLawRdOHb4ouT+t6TnY0ba6XL3flE=;
        b=dMetBjqg1zOITyDtEUqnC9pAQgzjn9qucdfI382lVtO5Y6LDs+W3lhfSkZi4TrQWV5
         kKYS8PYX7qWmwbE6eZBhQSmnV+62Fqo81WDZt8aZ0aGLvA2pqqGEWcu8zMhHoLw0ki91
         YM0fHeE5HhlD9NdqgRiI6uzGTpNIg1Ftcl4iHsV+Ju9sOeeYWQXawjB6zEORcfjWBpNq
         HbDBoL244FY5VtFBfH5CTIzqMv2+2+zd5QAlMsbFKCrNJGGi4S1CPiba9zLB0fjwJu6P
         6fPSvaaSx1EHW093hcuO0VyyN1tXTc5p8D2DVTr7IiCJ8AMx/8l71EPYTL71kwe1D0c5
         W+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721221157; x=1721825957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idvDtEwZOQUpT0NLawRdOHb4ouT+t6TnY0ba6XL3flE=;
        b=NMaIZAd95XGZrcukrQLpU0g6DSCJiLxIy6Y4xqgnNZIGJD/9WcLcpp+u7OgLU1Yws9
         aokBesu0k5cdS0fkskhMJjQcrPhr+2AJ9hwYS/7oSwHlCEGfBj3M5fo7UV+Ux3jyNNrt
         McVU4NHNzqd/u+IGIKzQFjtBGp8u4g+kSV7KPb8adrWOASjNHShsnFDpiUKTio9uedtY
         /1qGJHjVomrqk4epI2/mHF+/mvJQgY3/hKW9V7DJ2U1+/XM3KtH21FAjT9fYR089QQYV
         zXJHgD7tfkEtucxHtX0FDsxdj1eWon7pGGuLS8fBlQVGK39V36PgSprU4xuXfkz+SIQ1
         87cg==
X-Gm-Message-State: AOJu0YwAa9jx78OTL7BmpZ/o+SasMLoryUVvaRdcferrzRVdJP9v8eUB
	uwu/Tgy43ASi+pgkA5chTP4S+/7HePHf+7QkASaUkwS7netKgmLyDYN3WLKn/9nNcwccAYMqaip
	77HPPmneB0PTjD8z9l8c1fS7eRjyvWms+wmhtuhUO
X-Google-Smtp-Source: AGHT+IFIUuXnEci4DiEIoFp6WIqY0KqFLP1+LkwPme9Rh2y3HQn+Xu9skocf2a45JCK74J5eI8CfO5CZHJxgCl4etdE=
X-Received: by 2002:a05:6402:f24:b0:5a0:f7ca:5e97 with SMTP id
 4fb4d7f45d1cf-5a0f7ca60f3mr504964a12.12.1721221157012; Wed, 17 Jul 2024
 05:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240716114229.329355-1-alex.bennee@linaro.org>
 <b9b178fc-04f5-49a6-992a-f6920408b41f@linaro.org> <87cyndgtui.fsf@draig.linaro.org>
 <afa432f7-ed06-4074-8849-796984be0bc5@linaro.org>
In-Reply-To: <afa432f7-ed06-4074-8849-796984be0bc5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Jul 2024 13:59:05 +0100
Message-ID: <CAFEAcA-huKegPEAUh==S0bkLPT2TA3FVNw=u03VagG5+nW7-Gw@mail.gmail.com>
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	Gustavo Bueno Romero <gustavo.romero@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SyzCiYIfyOtH

On Tue, 16 Jul 2024 at 22:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/17/24 02:55, Alex Benn=C3=A9e wrote:
> >> Are you expecting the same GdbCmdParseEntry object to be registered
> >> multiple times?  Can we fix that at a higher level?
> >
> > Its basically a hack to deal with the fact everything is tied to the
> > CPUObject so we register everything multiple times. We could do a if
> > (!registerd) register() dance but I guess I'm thinking forward to a
> > hydrogenous future but I guess we'd need to do more work then anyway.
>
> Any chance we could move it all to the CPUClass?

No, because different instances of the same CPUClass might
have different feature sets. In this case, one CPU might have
MTE and another not, or one be AArch64 and another not.

The underlying problem here is that there's quite a lot here
that potentially varies across different CPUs in the system,
but the gdbstub layer has an assumption of heterogeneity.
(cf also the stuff about system registers.)

thanks
-- PMM
