Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp466199ejf;
        Thu, 11 Aug 2022 04:57:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7OZly92FKckTLMOml5apOcM8AjfF9nWD2W/hdDbeCpaK47lh5qeOOT/kCsNGWwe1hFX58j
X-Received: by 2002:a37:8047:0:b0:6b5:7090:c7c2 with SMTP id b68-20020a378047000000b006b57090c7c2mr24137341qkd.723.1660219051352;
        Thu, 11 Aug 2022 04:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660219051; cv=none;
        d=google.com; s=arc-20160816;
        b=aJZKUnvmbbqShDUhrPMndkcjAxr40H17xZWkP+8s7XTtdhofsUJuqQfK7EvMfO8bOm
         9upPczW0QSy2J7pCeNxFkUlVb2XCzZAHEjEhUTozMtHDjLjQrRhW5akBzTEYVqb/1lxm
         znRsaDrNz1IFw9oNR+e/VdPf4i5azNtOU1TpdSiJy9Dwaaq522se/jhO/vQCf/Qiml0j
         QHXk0tTOrJxnTM+/Eqdkjs6F37H3EzaZGiW1pWENdVdstMTkyvWpmhHC1KbVCeu3zFwJ
         W6VnwRuz7mHsefa0ifhOo6iaLykZfV4m9u3xemVVOK/GtCq2R9VZ81CeB5t/v+gOcYrF
         njZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gZ/spJQV6kqeSHCWbWhGtuL0uupDpyaPh3AVYavUODM=;
        b=igFwd4/Zg3KKXe6K+kAC7Pax6wWk1e3PFvjv4KMs9IWs2fuFK3gzRlkcz+fWc0dMUx
         nBuXeQIDxSm0u8hUhic/GMdPysjyhu70bEHknRsAGOh0jcsYmZkEj01BBru07YEeNNP7
         QFzvOPhst1mkbWnEYwq/1Zz7Z3C90Rrcdp5IXlfkYHcydl49irsLwRZ8BWznN6/AR3Go
         G+O8gF60FOgy3iE83EIHXs1zK2bQMJEt+PonJjCgANyfLBMY2u9PCmVfc3K4RJm6GPEK
         Xz9PhX2QKloERbuAQMoEbXomQ4aJ2ItRPLbdQ140aosGVMuOmTHMkcxIPXNurtzAaV4Y
         g7pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TFhdu4lH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb19-20020a05622a1f9300b003436d2c85c8si124050qtb.631.2022.08.11.04.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 04:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TFhdu4lH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oM6oc-00022e-TD
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM6mF-0008Jc-QI
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 07:55:04 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM6mE-0005Fu-4u
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 07:55:03 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-32194238c77so170225667b3.4
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=gZ/spJQV6kqeSHCWbWhGtuL0uupDpyaPh3AVYavUODM=;
 b=TFhdu4lHu9j5YxsClQJIxagjATFOpAZZdk60ND9MzdVH3yOe7LGrduGNi1Ka3kRLx7
 9MOTdpHI/SGIiYeRmqVL/y3sURcBKAY2MLK5rEXd3vywGYZUqWNggJlKZ+uVaCXnDK2S
 0X4IfCrQyRzkuyTs7O2vBYHZGL3AnBl3oOFmv2x6PXU03PEotwoDW+LrVDNuj2AYFdJt
 cCDTZ8HeIuujU3da48VMl4GJRLzgkcR68RClTSAl5dpbB1774hZPl8T6seD+qHA6yoGB
 lHBpfDJkzZmYFgCEnoQpdSEFNWmraAA2w8qz38W18MaWqReGlJL+ArkYZ0UEgnIldulq
 RcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gZ/spJQV6kqeSHCWbWhGtuL0uupDpyaPh3AVYavUODM=;
 b=qaF3351z976dou3Ds7QsBg43MBgTwacXgGv0zGpsaMvOSVheBmhZWMuhsxlyLNVKcK
 nASbrXCIQAdeLHjiIPqxu9TN/Yc0FFl57mBYBixlJT1iEBXolmBWDs+xenR1gjp02tJD
 yfZDHEfvhkpXhrxkxoee0Hd8a1qFiAyBX9p181vdvxzejBW3s9K/FcNesJJsaUgGkKCg
 1iR2AahbwOzNwUdaQVeTRlCHUzjf9ctWMvB1DMOu6dfGgDz775AuHBo6FSFcv7VXs/iS
 rk/EcsOMPDiS3WACm/E9/yqnZ+bqUGGzbhXXq1ChWQVznXv4bAe4gV4xUHgOqU+gEtVu
 revQ==
X-Gm-Message-State: ACgBeo3vRdFyj3wzvp7pRq5Sj2CTXCagkOBgbtUT/IqWJvDgaFRaHjZ4
 WKEki543wPR5J4q+z5rAR6bTTyGdrfV9udyK9XNe0Q==
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr30940972ywf.455.1660218901084; Thu, 11
 Aug 2022 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
 <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
 <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
In-Reply-To: <67a42d65-8289-b26c-26f6-275ea0bfac98@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 12:54:49 +0100
Message-ID: <CAFEAcA8AXodRV=eG2Ra4Sf9rsap499zDJEu6hC=c+V9gE2KjfA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: Laurent Vivier <laurent@vivier.eu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HnbiHSn4o8hH

On Thu, 11 Aug 2022 at 09:29, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 10/08/2022 =C3=A0 22:47, Richard Henderson a =C3=A9crit :
> > On 8/10/22 13:32, Vitaly Buka wrote:
> >> Sorry, I only noticed today that it's not submitted.
> >> Version is not critical for us, as we build from masters anyway.
> >> Richard, do you know a reason to consider this critical?
> >>
> >> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org
> >> <mailto:peter.maydell@linaro.org>> wrote:
> >>
> >>     On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
> >>     <mailto:vitalybuka@google.com>> wrote:
> >>      >
> >>      > How can we land this one?
> >>
> >>     Pinging it a week ago rather than now would have been a good start=
 :-(
> >>     I think it got missed because you didn't cc the linux-user maintai=
ner.
> >>
> >>     Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
> >
> > It's unfortunate that it got missed.  It's not critical, but it would b=
e nice, because support for
> > MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).
> >
> > I'll note there are missing braces for coding style on an IF.
> >
> > Laurent, do you have an objection to merging this for rc3?
> >
>
> No objection.
>
> Do you want it goes via the arm branch or via the linux-user branch?
>
> If it goes via linux-user I can run the LTP testsuite but it takes 1 day.

I think we should definitely run the LTP testsuite on it, so
taking it via linux-user probably makes more sense.

thanks
-- PMM
