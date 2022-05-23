Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3390167lfh;
        Mon, 23 May 2022 03:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfF8BwlfdV8TH0zwi/dh6IoEVfei+Pr/K5UEg6NhCZ1DTeyNn0ghHPmDlBl8hoVO5CZ+TO
X-Received: by 2002:ac8:7e93:0:b0:2f9:34d2:ec0f with SMTP id w19-20020ac87e93000000b002f934d2ec0fmr3425479qtj.670.1653302262245;
        Mon, 23 May 2022 03:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653302262; cv=none;
        d=google.com; s=arc-20160816;
        b=wwLE5SIHG/YInijwPzIfa6f0uOJtu/3bz1xquaI92FCk0eP1CgmZ/EEZ9VIr0qDbyT
         FPX0BgJNv9fNlpYzBLVUPofqemJ/n0wd14ZqCZgCMZNJ78MTB1q0eOdkoSY8iggp48Zx
         cD9cTWaQxBVdI6p307g/jrA4SDMOa+PeVa+p9Rnl6y6JSNu7MX5ibtdMJLhP18S12gpJ
         j6fAz4hwZJf9wFgcKs+Utwm31SBjKyd9ZN+EIRfLzs76/PGWvftcDdw4KLuFIFZqEYqv
         UC9HnQLQuQFiyl1oVdONQd/ZQ1XZRVO69bDWqMrVIPQARt5AH1uWuunFB/7PW5mHNxuw
         QrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AJTlxuLrTQj8YIyYqIOHdaqDuai7TDAJX0ZKXUvPTaA=;
        b=oFBsmila55a/iNv3GD6EKyEYgdRA92J6GwKRyQWknLHZa5htE1PDc6R9Xf/F2rf0m5
         ne8+CePdTyt12g09Lx1zNEMPMX0lciBkaQ9zPg9M0oUD/Stg5tRroiu0Pj67O0zlOcPI
         /1GtLRDSYGzKMLfxqqjQ0ClLeg1Eyt0fgjFCYO5djrHttNfgsNC7oRTfqMAEhguV3UaA
         3jwjhMTQq0Ac8Va1+R2uuKTHKtG3vzIVMaSlP41xEXb0JlZj2Sv52mER5DADl6e+r0OU
         ah52Y4mooNRwrZ3LqAMrWUFgQcVF57Wl5Sj6SYNDZzwpTmcefpQ4yOcmX+JUZ6H77wNI
         298g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojec7nO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4-20020a05622a020400b002f3a5fa3e83si2333439qtx.754.2022.05.23.03.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 03:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojec7nO4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nt5RV-0002lz-Nt
	for alex.bennee@linaro.org; Mon, 23 May 2022 06:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5Or-0002e8-Fi
 for qemu-arm@nongnu.org; Mon, 23 May 2022 06:34:59 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5Op-0000H3-R8
 for qemu-arm@nongnu.org; Mon, 23 May 2022 06:34:57 -0400
Received: by mail-yb1-xb36.google.com with SMTP id x2so24255932ybi.8
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJTlxuLrTQj8YIyYqIOHdaqDuai7TDAJX0ZKXUvPTaA=;
 b=ojec7nO4g9JzS4KLJKx9FD3hcvZQ/JqDRYb199xD83ITC/3lRkiWkzdTN5UZdoI3Jt
 l/kbm4rWqvB9GiShloH21ekSlZmiWU6a4muE6ZTKPB1nGBRO6Msk8UEflfQ5PKSmiNIu
 tYmvTrwz1eLDiEitLE9ZInxpeKbvjwWZ4JG9UcbGd4Eaqi1TiwhGKJDck2aOT0yNnny6
 c2zKnwOEr6jwmlsmhUG8HenMx5XOl1WxlFUh+QkG4HfTV8ttHs4/Hi5OrNia7/BzhmJC
 GTavuNfc9SE6s2+ibggQR8ftrRKo6Or3BYf6tkPGZmHENyjVt6jWrrvn/kGNCS1UJ+gd
 ghTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJTlxuLrTQj8YIyYqIOHdaqDuai7TDAJX0ZKXUvPTaA=;
 b=BiU4CG180tHoloCgd46OkeIDibli+SwaK+3A7peA+9sJGfM0gdGxiM5TVIE/FMbTjc
 6f7j46IQd1vnZhYSKb4UC0jhoPKOB9i/dmVQQatLY/Oay7GxU4q6PgY/prbUimqdJujg
 Cu4FpHIZaeW+1uMtUkfkU25Wz4fGO8fAIapjyLIstP1vab50/7U3ghd2V8VcNmgeqRnR
 ddvUg9Z6e0hFMgGFEY7KKLF4aYSoutMDuIM1JAjeCQ+sOImXMAjiVE314AKaMO4UZczx
 M0q70czlE7aCyQ6tUMOTPrVMpCcqKjBlFbEYMTCM9dEUgy1O1eKFL3X2kz6j8BAqXF2S
 59Ag==
X-Gm-Message-State: AOAM533l921nIBtvD8XOGP28naCN6IA6Ko2AR/36ctbsTNrgKAZONy+f
 jDhguZPQ/qUzL6BGlvCOX3xoVYD6gwHSPEtuinyr2w==
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr5606735ybp.479.1653302093459; Mon, 23
 May 2022 03:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220523095629.144441-1-dgilbert@redhat.com>
 <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
 <Yotg4WL1RYpiLfM2@work-vm>
In-Reply-To: <Yotg4WL1RYpiLfM2@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 11:34:41 +0100
Message-ID: <CAFEAcA9=QCsXXgCEpy3aiO0X5h1hzOtX3ZXw+VyqvdUuMW_SnA@mail.gmail.com>
Subject: Re: [PATCH] Trivial: 3 char repeat typos
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu, 
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: 5IK7Hzgkc7NX

On Mon, 23 May 2022 at 11:24, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Mon, 23 May 2022 at 11:09, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > Inspired by Julia Lawall's fixing of Linux
> > > kernel comments, I looked at qemu, although I did it manually.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > Checkpatch would probably ask you to fix up some of the comment
> > styles when you touch some of these. Either way:
>
> The only one it actually moaned about was hw/pci/shpc.c's comment style.
> Does this need fixing in this patch?

Personally I would fix it, but I don't insist that you do
(hence "Either way").

-- PMM
