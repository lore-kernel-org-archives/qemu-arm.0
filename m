Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp314371lfq;
        Tue, 5 Jan 2021 13:11:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDlmCxtplZsOL77GWpUZXxSiHOyVKQEX4EPCql11V8TnwUWtMQaDqH0ps2At82qJlXwc1P
X-Received: by 2002:a25:83c6:: with SMTP id v6mr1805219ybm.24.1609881096934;
        Tue, 05 Jan 2021 13:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609881096; cv=none;
        d=google.com; s=arc-20160816;
        b=Zmk1heKxldy9esdUuU4LEX0NJx3QPikPg1Vk1ugl4GuK2ky/Z+WxaDCN20XaUVFrl5
         spelX1R+bYFJLgeXW/MyJ1H9KY8joiVkf8XL/an9sF3Pe4rCfMftsQMPcaBVLFcHht5J
         Uuo5QvIrwQKT+1sLtoNpeBxwGhPPu8Vl1VzDJ06EJrqEAU7/uouG24xZ8/Gr7/oFpNMl
         cTgNhp+ZAKszxrgBtcyOJMmG5Fu2MYr+Vfd1ik2V4yjJPzfKjXKCvnCIZJoslegLfc5O
         JfgT/rDw9tuYHx03Y+fXuZZhmN+2vrvYU8bv29Snquqnd63OwLZL7MufyHZE3vFb68xo
         Bb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5FDRc64gS4Z/qmb6HEXGmEPLYosVqTsAov7RGKQL4I=;
        b=H5JVAwlFGi2vqCZtnRtBBS/BGY77pU8P8iP5+inItf/eJm8u0OrnG6WYLMoVzezX29
         uMUJv72ScDd5hDJcVOixEMhEwiRNAjeQ8Ktv2qoeRKEQLbHHhIi5SNLEErM5+DIpkUIz
         tdoTkc1gNZ+QFnh/IR6+vy/3YwDySV8kb9E5BWSdJDcUZCIdRq9FMzk6eUkWUwKRGd2+
         jIriS9DStO24hZb0ty9/FF6TDQxkWzzYr9K+TnyCLi9FP0d9kw576DXKrxWCZZpxGBKX
         0QvvLXIkvcoReigJXdMQKSlD4aD/pazI9fMIOIfTy7Gl5H1gXvrUyag5NDgzC03Kxg5u
         S6Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oj6E3u9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si506899ybc.379.2021.01.05.13.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 13:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oj6E3u9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwtc8-00048k-Bk
	for alex.bennee@linaro.org; Tue, 05 Jan 2021 16:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwtbl-00048U-KC
 for qemu-arm@nongnu.org; Tue, 05 Jan 2021 16:11:13 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwtbj-0005Pl-Io
 for qemu-arm@nongnu.org; Tue, 05 Jan 2021 16:11:13 -0500
Received: by mail-ej1-x62d.google.com with SMTP id x16so2363522ejj.7
 for <qemu-arm@nongnu.org>; Tue, 05 Jan 2021 13:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5FDRc64gS4Z/qmb6HEXGmEPLYosVqTsAov7RGKQL4I=;
 b=Oj6E3u9O3Jrt7LKPLG6Nq8/J+shdNd6V+xZ7v2hHYmNqU+a6+yrn8dKqJ1KI/7b/ee
 e0ZiBdBNNSNKOABV2VMicEKtefSHcvd0yl/ylpVsLkz1ckyjmc7nZRUluQ1AindEXSFd
 YpKYUOhcmoNE/FG6EZaXIP8oEn9PFCf7cK60xuhMbDA3iflP6bgnAt6S+CcZ5ijPwkyX
 LkIQfRAD5n1V+FjQTVj4Wan1d5sU29cRXdrocDyUV1rfrG0rJj7A4Z38mcyldiEFVzf3
 RavfAdjFn+TeIFSdXyANMaky8XnKSRBw/aI2IcoGqXtKwtLhC92M80gMY1EZIDHl5TGJ
 H4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5FDRc64gS4Z/qmb6HEXGmEPLYosVqTsAov7RGKQL4I=;
 b=pXqWSPd4pARw3edl6YnrNS3cSCiYA6NoB3OpT1TpOrlCiiecihdX55ltS0G1rvP8CC
 z4+cmpRp9NBS/JL+NaPwZ/snKvbcfefDiUSSwvfBj5KUjZy4DqbFbthy3y5R0NvCZ/QV
 iYeCGflIRGnJ6rjCmNefLJamh3RUdbJBBFep/UHMAe7N25f8rpxEPDFZsHlAA50X8jzx
 qUqu45DyDcQ0JvIPQ34sR0kuh2X5jt+GGCjbxfRLJZ3Y5XyepDvWj+tTLhu7QweKnjqv
 A4lBhTEUKgaVsAE2nDGjUzdBrPmisDpXBWfWRgqr3dbxkHzWdtbj/ON9RcHlwn/mhBOW
 wJ5w==
X-Gm-Message-State: AOAM532G+0GjNHjqZCdtKkDV7nRqunpjk5i5uYHtvGjrL3frM1i2MM5i
 9zeHsqLITDdT+o1zkp4RyVZvRG5HYcnflgK832ibZg==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr808600ejf.407.1609881070185; 
 Tue, 05 Jan 2021 13:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
In-Reply-To: <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 21:10:59 +0000
Message-ID: <CAFEAcA-6NqgwKQKBFVg-VYgwdOReddyHm=sUO6o0nLQXaoB_Fg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +r+PmVTsGl0Y

On Tue, 5 Jan 2021 at 21:09, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair, Peter,
> >
> > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Avoid using a magic number (4) everywhere for the number of chip
> > > selects supported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/ssi/imx_spi.c         | 4 ++--
> > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > >
> >
> > Ping, not sure who is going to pick up this series?
>
> It should be reviewed by Jean-Christophe and then probably go via the ARM tree.

It doesn't seem to have been sent with a cover letter. Multi-patch
patchsets without a cover letter tend to get missed because when
I scan through my email looking for patches I should review or
pick up I'm looking for either (a) single patches or (b) the 00/nn
cover letter email...

thanks
-- PMM
