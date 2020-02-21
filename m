Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2050830lfg;
        Fri, 21 Feb 2020 09:36:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+/ZEQvZPX4IJpQ9FYw+/aKwKwYxmFngRU7JxVRpvTRcxk70QWC6B2a9VdrJ32Cn7y3ikY
X-Received: by 2002:ac8:6a04:: with SMTP id t4mr21937174qtr.213.1582306619613;
        Fri, 21 Feb 2020 09:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582306619; cv=none;
        d=google.com; s=arc-20160816;
        b=QtfOWxUOTjcFFhn/9LAYarBVj8DC2/xBSBG3PfxRP+2+QaEFztEaYqPA3kma+iZtci
         KXHSpChZl9dOIYmO1MJdepuVjvZeLejRXr+5OhDlh67k7vbvNZda1HTuRcdjBQyOj/ZA
         0fX0evbxQibQqNhnVhBCa0AGS7z04T1CJKEpy6cKF5pvYulbBY44+Nb9qKoeuPCQ8Wsf
         aBs3BQEumieqwUXiZmpQ5O/A+jvsYMH2LZONvJcDmH7sjrDgfUAE8XZCWAEPY67U3Whr
         b9cWNDSimjqnZZvJBxFIgl5bqLGjo/YSOME6/ATutX5oL6Z9A/VU3avlO5YBxggCZZUl
         0BvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0hZPLrTx+QxGezTlJEFQJMlOxfvv4M75Fk3m8GySp+k=;
        b=eeH+yJjLKtQUrHTJUhzFD/Gt07IPa7WQGUUAzSKfdobedayQBIJVL0F/I/SUmX0t9C
         dsm73hsCO9dsK2dlFrmEkqoMprOJmmt8LeK0Dr3wUnDVQrvtBa8pJ3pW5jJ19RsqGSGb
         +G+vzHKzVLYcTHdlNlQeLpYia349JShvc47q4TT/D8E6yX4UW43zGFMzew5/rQ2W7zzg
         0PH+PeUxhSFgpj5P48r1vgi3u34Ai60Bs7I1vTaZSKiLpBKKHNe2/dmuIELWSKGAN5hq
         EGdsiBKXNesHfPPfNr1ruDNCAUz3CHw2gtWvQXjlHKzgDgf8l1TvV73Jtw6XnvtcDb5e
         DuyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U2b/wbq0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk20si1612943qvb.16.2020.02.21.09.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 09:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="U2b/wbq0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5CEV-0005Lc-2i
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 12:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5CDp-0004bg-KT
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:36:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5CDn-0000qV-9A
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:36:17 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34480)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5CDn-0000po-3H
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 12:36:15 -0500
Received: by mail-oi1-x241.google.com with SMTP id l136so2367030oig.1
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 09:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0hZPLrTx+QxGezTlJEFQJMlOxfvv4M75Fk3m8GySp+k=;
 b=U2b/wbq02FNihsBqsviMPt31jwOChWp25VW+C94NWjLSj9BQTP3TiXjrdP7o/Hr2W3
 uSLOF7xKUTGbjB5nr3MM9e/H9wvkgIGWp0h1tGFNwz2egdNqx38JTNfjp2aRd3znaye5
 HIcIkq5hk83QRvDLr/LNxW6ZWRn7CYwhUpkFmry71tGpSiSFwg9vhD2OSj7jjTIwHuiS
 pvzDRvoHxMOgWXHtt3DBEsx4DFkLAE2AJlWcTRo8+VUoXRH/n2H1eBcCDvcrY8dGDC7I
 pYvhqhP6cv06WiMO8XLBLXdfRPb0dRJLOm/Ps6FBEedGpN16TVdb4sbqcsfT+SkFpoMe
 aQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0hZPLrTx+QxGezTlJEFQJMlOxfvv4M75Fk3m8GySp+k=;
 b=Gdo5VCElCdNrC6v7hDu5zAuYl9F6QSRgjPExBy39t4J8vSRKSvftu0ENBxsVUFxfzo
 g7IxqOgRZ5KzErmP7WqDoRgKFrxa827dmzMvCBnGjlJpXn2uzW5LLkvJcfz4MN5VTmvA
 hENIJq7vgp2pmR9zl2/kov8mXoXsEMS2ZFjN3ew/4ElxNsqF1APj7f3FhvY+l4+hXOfz
 pQAD2nQdiPJNLaIcim5z/hW+spEGF5qYyiRKNZRVUzmJ+WSwFH5soM7g2jVw57mgyKlJ
 4CBec+Mic9pD4SZ0jA/5q3YpOnPZL2A3470eSxg9gaMlTFKWOd+J76bvhnV+auuCgLHx
 oBuQ==
X-Gm-Message-State: APjAAAWUxi598crO8exzSK6JpRflAJY/PI/u0kwVU3SrVMOrEp1692sC
 a5IfxVGmMjeCfs3FyVEvShT+mkkS/7EZdBzb1utWBg==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2834616oie.146.1582306574231; 
 Fri, 21 Feb 2020 09:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20200221173049.18134-1-philmd@redhat.com>
 <20200221173049.18134-3-philmd@redhat.com>
In-Reply-To: <20200221173049.18134-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 17:36:03 +0000
Message-ID: <CAFEAcA8+LWYhNjaXUu-Y2oat1hsKGbt6Hcir_yeNpmY+c6+8KA@mail.gmail.com>
Subject: Re: [PATCH 2/7] hw/arm: Let devices own the MemoryRegion they create
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s5sME784SIDU

On Fri, 21 Feb 2020 at 17:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> To avoid orphean memory regions being added in the /unattached

("orphan")

> QOM container, use the memory_region_owner_nonnull.cocci script
> to set the correct ownership.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/exynos4210.c    | 14 +++++++-------
>  hw/arm/fsl-imx25.c     | 14 +++++++-------
>  hw/arm/fsl-imx31.c     | 10 +++++-----
>  hw/arm/fsl-imx6.c      | 10 +++++-----
>  hw/arm/fsl-imx6ul.c    | 14 +++++++-------
>  hw/arm/msf2-soc.c      |  8 ++++----
>  hw/arm/nrf51_soc.c     |  2 +-
>  hw/arm/stm32f205_soc.c | 10 +++++-----
>  hw/arm/stm32f405_soc.c | 13 +++++++------
>  hw/arm/xlnx-zynqmp.c   | 13 ++++++-------
>  10 files changed, 54 insertions(+), 54 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 59a27bdd68..d4b05336ee 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -305,28 +305,28 @@ static void exynos4210_realize(DeviceState *socdev,=
 Error **errp)
>      /*** Memory ***/
>
>      /* Chip-ID and OMR */
> -    memory_region_init_io(&s->chipid_mem, NULL, &exynos4210_chipid_and_o=
mr_ops,
> -        NULL, "exynos4210.chipid", sizeof(chipid_and_omr));
> +    memory_region_init_io(&s->chipid_mem, OBJECT(socdev),
> +                          &exynos4210_chipid_and_omr_ops, NULL,
> +                          "exynos4210.chipid", sizeof(chipid_and_omr));
>      memory_region_add_subregion(system_mem, EXYNOS4210_CHIPID_ADDR,
>                                  &s->chipid_mem);
>
>      /* Internal ROM */
> -    memory_region_init_ram(&s->irom_mem, NULL, "exynos4210.irom",
> +    memory_region_init_ram(&s->irom_mem, OBJECT(socdev), "exynos4210.iro=
m",
>                             EXYNOS4210_IROM_SIZE, &error_fatal);

I have a feeling that the owner of a RAM memory region affects
the name we use for the underlying ramblock, which in turn
is used in the on-the-wire data stream in migration, which means
that changing ownership breaks migration compatibility.
That's probably OK in most cases as we don't care too much
about migration-compat on most boards, but I think it does
mean that you want to keep those changes separated out from
the ones for IO and alias regions, which I think shouldn't
have visible effects.

thanks
-- PMM
