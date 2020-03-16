Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp330370lfe;
        Mon, 16 Mar 2020 10:20:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtYHC76wj6QRCWJDotJ7kFA5jNLpcozPXipQQvdqfF6uAOr0+VUhrI/ZLLKC48afdfyvQAD
X-Received: by 2002:a37:a6d4:: with SMTP id p203mr818547qke.184.1584379209419;
        Mon, 16 Mar 2020 10:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584379209; cv=none;
        d=google.com; s=arc-20160816;
        b=tZKBRhGSpGrrIiFHVO8mdBkDnr2DPM5h6hcdRY2oDALoR/6q4lBlVq5+eYf0WkD+YO
         M/OfQC4o6HQ4uLi6gS2IALx3ysFS7EHBJ/Hxzd2tUeO7XLd9dAFZOaFArt8FZ1JlTjBM
         dqINxPsR+yiN3d9WyK9yRnuQfxz72hQoRmgW9cHH6sM7W8VcmjVgs+R7kg4SXH2BZbIj
         RrnQNe043N5yhaI0kHvZVIX3uTmJKQZmpE+8t+fS/rBKYp3Vq6ebXYDbdhWmfMO4Td5+
         42U8p5hs48CPrvQ0zmQn9XxnySoAYEZyULDmQps5erPzxX99c8SSZAsi57jv5UKlOd5E
         OJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rsVvqa9kEBpaKYZwDI4QbsyQDuz5Bpb4wRRnlFykK3s=;
        b=IZndYuPNKcXkUSmC+guvpmBBDIT7dcG2F3Dt6zrFlm9V6yq0xbTK5jyrbLdW9Hzw0I
         NM+g0z9hsC2t1E24XKvWj0Ik+37P7Yut8wT0bIXrkFwnJtK6H5cz8FopUb8V33QJVv3d
         j1tfeqssOlj2WGlgGKwmDrxd7B4LbR4Rwb4uNoyBqYmBZDY0GZ/k0ZpeVcQYXJUKgvLF
         g5lW838L5eQItK1Hl8j2gWSTkOBs4r8CRD4HOS8hGpNDolgU5wnAY0rSOwQrhzgGJdkI
         EiWBF0k3nEjbKo5DaerL3VHDtjKwNIRRZRNHbim0wpObao3eKvMTh8vlNnL4FT98jda5
         2f2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mmPKpe3n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28si153202qtm.259.2020.03.16.10.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 10:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mmPKpe3n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDtPM-0004hc-L5
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 13:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrgY-00073z-Q0
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrgX-0005hJ-8P
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:29:46 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDrgX-0005bl-1H
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:29:45 -0400
Received: by mail-oi1-x241.google.com with SMTP id d63so18203341oig.6
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rsVvqa9kEBpaKYZwDI4QbsyQDuz5Bpb4wRRnlFykK3s=;
 b=mmPKpe3n56L2g4uIGTLOtiSJQYdsR0TIeCxf+6NR+pt5GoOdUZNY7lyjJsEiKv492d
 V7TISmbc08dRhSG52rkr0yONJiP9T9RbXz5kcb3ciGE7YFiKPav3FMDGPGIzNUscjLfQ
 /rzpAfHeY8JQ9R+ZzIHWyP7uZjxnsiOw9xxjtoRceQR5YBN0qQRGHepm5JjspSg6jrmJ
 pDRoXjOXY8IZioJtJo49DVY5JyTRvZ+aoC17QqQdqBaVHahfoa4dnVLcd8m4PPxXXNCC
 Wmm78saSIZ2u45hgwzm//cpgYuejLAVYVE454ejEvcVjP557GW3QzxjVRwflEW0J5ENC
 yvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rsVvqa9kEBpaKYZwDI4QbsyQDuz5Bpb4wRRnlFykK3s=;
 b=C4mTyLrAZ66YKdCXa7yNDDve9Q6QtjdNcC1FJum175mqpqtVm1wMBXVu11yr7mf2Wr
 ExztR5dA58dxe+QN6VL7SVIzFqVGWCGF7rfOu0q2JMqDFYp328+M8FpNJOp4lxaZQOar
 l5mYPsEHo+LcAwCFFuwwT+SiZEShw2bo3dUW8gaHJ2cBhPRquiSLNyBt2RzVRrsrGrp5
 xOApC8MDR9Huu6IoAy5tNUmlM3jVkAw/4NM3EQLc34HoLzUO7w6N/MSrKx/KHrw9cjg+
 ci+LsfbHQiO0jxirrpsnrZ6N1+uZkRxJHLIQdq8Cm5O2WgVENpSYaLs05JPSiTIYEGjV
 uUWQ==
X-Gm-Message-State: ANhLgQ3iNNCPIbz2eAGEQP+fAzE0oXd8qAxTQqDpO3HgXKNEa4T9sp6A
 ZqmMS6R4bC4LOSpARqREzcwPfIGLR1jAn+sq6sNkTQ==
X-Received: by 2002:aca:c695:: with SMTP id w143mr93974oif.98.1584372583847;
 Mon, 16 Mar 2020 08:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200206183219.3756-1-linux@roeck-us.net>
 <488b3355-4467-e01e-d6a0-a2d5bc959428@kaod.org>
 <5589b5ce-1ff3-bf1e-ceae-fe82e1e1265c@kaod.org>
 <CAFEAcA_Zg65ebyTH+7i8ZGf4jzmf1tRPYdVz590UP0rQoz86pg@mail.gmail.com>
 <a6af95d9-f95c-f9fc-eac0-60d9c8517dec@kaod.org>
In-Reply-To: <a6af95d9-f95c-f9fc-eac0-60d9c8517dec@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 15:29:32 +0000
Message-ID: <CAFEAcA--vBbg835-AOm1xhnz1R_ic7Xz3SjWoerkSEwq1+Hsqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] m25p80: Convert to support tracing
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bVsFN7/SnwqN

On Mon, 16 Mar 2020 at 15:11, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 3/16/20 3:58 PM, Peter Maydell wrote:
> > On Mon, 16 Mar 2020 at 14:14, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> Hello,
> >>
> >> On 2/17/20 4:47 PM, C=C3=A9dric Le Goater wrote:
> >>> Hello all,
> >>>
> >>> On 2/6/20 7:32 PM, Guenter Roeck wrote:
> >>>> While at it, add some trace messages to help debug problems
> >>>> seen when running the latest Linux kernel.
> >>>
> >>> Through which tree do you think it is best to merge this patchset ?
> >>> block or arm ?
> >>
> >> It would be nice to have these 4 patches for 5.0. All are reviewed and
> >> tested.
> >
> > Do you have a pointer to the cover letter? Not sure
> > which platforms (and so which tree) they're aiming for...
>
> Not having a cover letter clearly doesn't help ...
>
> Here is the patchset diffstat :
>
>  block/m25p80.c     |   58 ++++++++++++++++++++++++++++------------------=
-------
>  block/trace-events |   16 ++++++++++++++
>  ssi/aspeed_smc.c   |    2 -
>  3 files changed, 48 insertions(+), 28 deletions(-)
>
> http://patchwork.ozlabs.org/patch/1234532/
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> http://patchwork.ozlabs.org/patch/1234533/
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> http://patchwork.ozlabs.org/patch/1234535/
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> http://patchwork.ozlabs.org/patch/1234536/
> Fixes: f95c4bffdc4c ("aspeed/smc: snoop SPI transfers to fake dummy cycle=
s")
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks for rounding up the patchwork links; applied all
4 to target-arm.next.

-- PMM
