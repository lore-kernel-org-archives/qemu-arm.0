Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp585863lfq;
        Tue, 5 Jan 2021 22:05:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwosA6/wYvtIa6htupBSwYX943phHbs2+aCEpC4lzFYWUfWh4/1DmT6uYJof8j5Sj/0rjSO
X-Received: by 2002:a25:d1c4:: with SMTP id i187mr4126792ybg.7.1609913153470;
        Tue, 05 Jan 2021 22:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609913153; cv=none;
        d=google.com; s=arc-20160816;
        b=iIKc8gcw9lONNUxw20XLZ2urVdLct2fLYei1b5sItjAQwHPMzRr1i8cEprDO2OGtRE
         km0w5P+50T1pEORMMsMSXhTTL7QqJ7siPKU1RJJf5J6gigOJvQRLipFdh59f/br7UbjL
         Q1yt58/4CSBrNnCJlkIbTVD7wr+QUvdj8G6fTBsYQhln+vOnBOtEC9d1iRut9+1YlWVV
         9VfFe0T29PI8F7sxkH8+Aapsn5/bSb5GIqQqvCGu27RUYFP3scmPCU6eu4AO/nGNHSTM
         /SasL5F/4CXaG1vDBZKETRVtE0Au5HiGoxfdY2P3V0hsjlOb5k3gyUSftG64RMSg+3mU
         tvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ev+EbpEFLmVZe+5Epsyt5KsNPBDTv3jc41WhF2HPQOM=;
        b=BiFKKiTr71U0BzadhGim4CZ0LGmVGPhHUFYmNG1Ipagl++loP6QU4bTYN8Mm3GkkAo
         3K1+fiADiOzZVFq+DwyurG16HbadF22Bs+54sTQvNVNysT5n18HF+uOeSmWqgQpCJQv1
         qOcQ4sNBJYoeoIsn20+odrfr+vW1160o2wdoxILDLFERUAfADPWbo57WI5YoJ0AceXjJ
         TF3XYN9Kgl6YqcGfVuoQXlvGHEUML5pEK4meDB5wFhKyJwFNuzbzfw4smQPmanZZGOYw
         Wmp4t2knYrUO5ZUD982K2KJJUYdpRWI6RTQYWSnjxyeQRbao7x39BkIEzPFbbkFb/+jR
         vUWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tLfwfw3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m193si2080866ybf.253.2021.01.05.22.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 22:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tLfwfw3+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx1xA-00022c-Qe
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 01:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1wq-0001zU-FS; Wed, 06 Jan 2021 01:05:33 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1wo-00019P-1V; Wed, 06 Jan 2021 01:05:31 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id j17so1813967ybt.9;
 Tue, 05 Jan 2021 22:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ev+EbpEFLmVZe+5Epsyt5KsNPBDTv3jc41WhF2HPQOM=;
 b=tLfwfw3+uJadhD2f3jjZgh+w4cmrvhxkGhZeesxQFjK7UwbpsVASoVlBS2rtbu+sjX
 8Yu5lWOOADC8irh7+zm5G0fIPxwlSt0oz5vGvqvZPSenM5lHzLSbnfl1Tps2pCasF/ND
 N6sU3eBdSzrLpk7n/0a3SF+zkTY/nRibHuW8DmTvJSzpb23++AYf+DWOmO2dsUbPYzkV
 sSK9AIUGc1i6OeKNO4HXqWnt0P1QGUpUowQuSvv7uYbn7ys0dyJ4MF8wLR1TiLJ8GjP+
 tffTt6gijvyV4OLTqRtBQSxxJsfrCqAvXyC4pEABv25GY1iMyTG06rHnxC1OQ3axqwRm
 Ukfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ev+EbpEFLmVZe+5Epsyt5KsNPBDTv3jc41WhF2HPQOM=;
 b=Pw3H3RVDj7FEUpqEpa4N1R4nVRtMF1mLhpAnjdrJof1o6qL1ChjxQm1GKOQcHTIG9T
 7zSb+urnsTdCUt15AHxrhBr332TN/da1IX2Cxa79OLBakELpXvisbSMKFDV2DILwdq3L
 0AmnvBSlhPCTPwq7+3j6Ez+O5N+VyUH3Xlj/AUb/YEceekQHcDplE5zlS3E9AW3VBkF+
 Ksm5si8R4i8nj9P0c7OJjZCLFpmrOpp04tMeLkt8w6Yl/fLkI0mAel81BnJND3mLXppI
 6h+dEsPFOw1SxtAWyx3HDTL86NdQpsK/jHMQ9mBefP2C+/w4ePE3hBb3nr51DwteJ47u
 K1/w==
X-Gm-Message-State: AOAM5314mXQsGAfkEN7YDMahIirdNuzwGPR25QbOofHgBC7nz4fm6Dvj
 mZ1EX+4hNIabu8WaedHQgEEsvbb5vFdMgkHPkSI=
X-Received: by 2002:a25:aaee:: with SMTP id t101mr3764854ybi.517.1609913128766; 
 Tue, 05 Jan 2021 22:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
 <CAFEAcA-6NqgwKQKBFVg-VYgwdOReddyHm=sUO6o0nLQXaoB_Fg@mail.gmail.com>
 <CAEUhbmVd3Umei8qWdN-H2vejR144sgEDYyKwj5CTsbku5KjvKA@mail.gmail.com>
In-Reply-To: <CAEUhbmVd3Umei8qWdN-H2vejR144sgEDYyKwj5CTsbku5KjvKA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 6 Jan 2021 14:05:17 +0800
Message-ID: <CAEUhbmWuDn6yNJOZtW_bn1f2ofnH29rH=Em7mY4=JBoLkfFLfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sRzmoUrsirHz

On Wed, Jan 6, 2021 at 8:22 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jan 6, 2021 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 5 Jan 2021 at 21:09, Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > Hi Alistair, Peter,
> > > >
> > > > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Avoid using a magic number (4) everywhere for the number of chip
> > > > > selects supported.
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >
> > > > > (no changes since v1)
> > > > >
> > > > >  hw/ssi/imx_spi.c         | 4 ++--
> > > > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > > > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > > > >
> > > >
> > > > Ping, not sure who is going to pick up this series?
> > >
> > > It should be reviewed by Jean-Christophe and then probably go via the ARM tree.
> >
> > It doesn't seem to have been sent with a cover letter. Multi-patch
> > patchsets without a cover letter tend to get missed because when
> > I scan through my email looking for patches I should review or
> > pick up I'm looking for either (a) single patches or (b) the 00/nn
> > cover letter email...
>
> Thanks. I will resend it with a cover-letter.

This series is resent and included in the following series with a cover letter:
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=222931

Regards,
Bin
