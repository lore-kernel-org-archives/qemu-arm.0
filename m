Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp884161njh;
        Mon, 12 Aug 2024 11:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJD8hqloKqr9PsLdxRnhNuh4d3nK8Gut/+uJ2oWS3f3Ct/Tb3rknCl+WVGxh3jMzTk5wSRf6nBUT2pODdlN7FlpD2ON4be
X-Received: by 2002:adf:f48d:0:b0:367:89b0:f584 with SMTP id ffacd0b85a97d-3716e43cabdmr352211f8f.11.1723488007554;
        Mon, 12 Aug 2024 11:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723488007; cv=none;
        d=google.com; s=arc-20160816;
        b=nhXM951JKkJQ5pPe1XQ3S+vlX24hfGHDOxWaHKB27h4PMuv99I+OHNzKPEl76jmZTl
         /EplwjMuB2cEYPE/NhZURFUAbWfTO+GufdPO9sBAP4HBPSAjl6qWg1Q0xaeAxzSNzppf
         81/C4/0lKws3wYouyLiMwaFbu2faQJm9ZsxQARSAWOD9LkfJqTgd10THD0pk4fnEE9/4
         /Qd67Y2CcFIdEL/jfN2+J3CN81XndvYm5IKRrBKCU8QgiGOPPhFzbgG7kmSFsvqOCL36
         UUvOK/r/GgGLRt7wGFZXHIE6xqqtRlHkX2Qdv1Wjca/2lS629H6V+gdHJ4jK2tZkMLUn
         /h5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rF418gmjx4SjooVpfdgVEelVbtXR1QDkywT9usen5X4=;
        fh=xyPjVqEyCGAxZWp+qaXLQcKS75gQ7fLeuEflotTSb5E=;
        b=PcDplY1cqKmi9lDbkLr/1+6wdizkjlghccyYNH5diMcoSldQsgLntXVdFhFk2ZprJC
         yhZE3SI2XF6iqVioOQwwe+XVAQT7/fpDv9A9BI6DoJ8zFUqq/7NPW9u3k18UctFgSeQ7
         25Q1adMpaG718K10zYSxQSexphirrS45j7uBxrtgqCXGrws9rubii26yoLD811LyVYem
         AgEvlF/nLcs0qo3v4QSblVxojwJDwSpXiXCGD5MrNtuxJB33Kp/30yoAsuPxQzMQjSl3
         ABofYWUnJsXeAhjFwXvSGTa0LV/YC7kiSRaMrhKYn1Vjy2oiirxz+AhdCulTILpDUPim
         uk4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lhtsEHrR;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36e4c93716asor1410467f8f.2.2024.08.12.11.40.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 Aug 2024 11:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lhtsEHrR;
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723488007; x=1724092807; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rF418gmjx4SjooVpfdgVEelVbtXR1QDkywT9usen5X4=;
        b=lhtsEHrRDJpa/k3cnvQsCJH7C5Lz+ZOzfPooqO3zgC8E5BgBt8JwoW96nxhR1yhKa1
         y8UAmCKpXiWmwq7kWHpam4r3A5G17He1EkeF4tL2JAy43pi3Wk2xYvaz8U51Dzr0bZua
         GNqV0M1gGKKeZW+Sg+xWFbRIodXdR9AfjKpbaEBAzqbe25uWUmkp55Gz8ixGLMndPTKL
         qc9VdG+vIg90jeanGuXrTUT1TcHVDURuqDhMGwfeokmT87asQt4B6J2HvTWaceGmSL+Z
         UKlrJr8uHpVXRRBbkAgJZxuyflyss0FrLup9TyxkC9soen+ShenShgLhM05dfiOgkNE9
         hIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723488007; x=1724092807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF418gmjx4SjooVpfdgVEelVbtXR1QDkywT9usen5X4=;
        b=UCffdi6f8OY/FAskMxHOHyl8cdsYhMn8gk/SxBXVSxCtsuARjUUUEhFv4nCXfReeYY
         2LHPb+EMlENyo8SvajAPxRuw1CVXXR5+CAuvU2sJuHEyILYV0XOt5yw6qHg21zPiaZUj
         rCpKZvkG4RRCSMEGdstddRdCCXBHtsDza+3x3xUk1CEqeo2NvuI9nfQbE6HHeKMz9EsC
         NC86EGq0KogkbUT7umQbZcviUKyYBOA0ipTqnP6yURgNA+RSrSxCgNfxtGurjS1mmeX8
         Xl678SO2dArjlcOxQfBMYqnuDkW8b/L8+BQob/+bGlvDykV+EHeTyD4cx2BvMWUkPP/Q
         W4Og==
X-Forwarded-Encrypted: i=1; AJvYcCWXw8kyOtdFOr5yItUxolPK7ERQYZ2sP4GMvv3QFYJkC/655JpgEFcoLscy8kh/Adel9Y8Bq2EM6q3iJzQdGszaedr4eE1K
X-Gm-Message-State: AOJu0Yxu9+ccEG6KxfEczfz+BKh/18xKAVatvyQG54+yPkyLWDoVqhcN
	vlueXWjYiTI6uEa+vDwIj4Zrmv4m3cGZbtknVjRJ9JhVjuwf50RScR9+/L78qiitWByyRTjjVtY
	yxxkFo5P38fG62cUE9EpTshPl0g1hLfk70ogX
X-Google-Smtp-Source: AGHT+IHT2yYHFMAIKDS2jK6y/5ndIwLr6HSXC8D7VCqXXv1C6p42RpeONg5iOr7ZHiRSAXlBYgT+RAYnxHNsgG+S9Cs=
X-Received: by 2002:adf:ef0f:0:b0:368:3562:7c76 with SMTP id
 ffacd0b85a97d-3716e42c619mr397781f8f.3.1723488006702; Mon, 12 Aug 2024
 11:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <CAFEAcA9tUW0DHHOuGJ4sUxu12JMLUMxqW=_9oUHKiiRTenZwKw@mail.gmail.com>
 <Zro207XTHFILvRoe@redhat.com>
In-Reply-To: <Zro207XTHFILvRoe@redhat.com>
From: Octavian Purdila <tavip@google.com>
Date: Mon, 12 Aug 2024 11:39:55 -0700
Message-ID: <CAGWr4cSndr-mQ34cp5-AJiqFQxq522J2K-7W3jAGyUdLARLg8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/23] NXP i.MX RT595, ARM SVD and device model unit tests
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	stefanst@google.com, pbonzini@redhat.com, alex.bennee@linaro.org, 
	thuth@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ePOoZK2U2IVQ

On Mon, Aug 12, 2024 at 9:22=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Mon, Aug 12, 2024 at 05:10:52PM +0100, Peter Maydell wrote:
> > On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
> > > It also introduces unit tests for device models. To allow accessing
> > > registers from unit tests a system bus mock is created. The main
> > > advantage of unit tests for device models over QTest is that device
> > > models can be tested in isolation and do not require a full qemu
> > > machine.
> >
> > On the other hand the disadvantage is that you need to add a
> > bunch of extra code to mock the interfaces that the device
> > connects to, and then you compile into the test binary a
> > subset of C files which weren't written with the expectation
> > that they got compiled into tests like that, so it feels a
> > bit brittle. The nice thing about qtest is that it doesn't
> > need you to do any of that -- you just run the QEMU machine
> > model and prod the devices it already has.
>
> Yep, mocking often ends up being rather a double-edged sword.
> You can do some really powerful things with it, and in particular
> it can enable you test scenarios / code paths that are hard or
> impractical to exercise with regular functional tests where fault
> injection is difficult/impossible.
>
> The cost of this though is that the mocks can pose a significant
> ongoing maint burden on anyone who refactors code in future, as
> the mocks need to evolve in lockstep with the code refactoring.
>
> 12 months down the line, it can be hard for another maintainer
> to understand the full purpose of the mocks & thus even harder
> to know what todo as they refactor the code. The future burden
> of mocks rarely falls on the person who creates them in the
> first place.
>

I agree that there are potentially maintenance issues. For what is
worth, AFAIR, we only ran into one breaking change in about 3 years
for which we used this approach which was also simple to fix (gpio was
removed from hwcore so we had to pull in gpio.c directly).

> > Do you have examples in this series of tests which you
> > were able to write with this unit test setup that you
> > wouldn't have been able to write equivalents of with the
> > qtest framework ?
>

No, I think all of the tests in the patch set could be written in qtest.
