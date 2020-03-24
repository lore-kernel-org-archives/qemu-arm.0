Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2942745lfi;
        Tue, 24 Mar 2020 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvwMPa3gt3nrtMpa/yTPi7/76/F8myZasF2eCJLSmfGqS7w5LyTMJe7qOIclwX7Ke6s0N1o
X-Received: by 2002:a37:66c9:: with SMTP id a192mr21398402qkc.10.1585065859945;
        Tue, 24 Mar 2020 09:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585065859; cv=none;
        d=google.com; s=arc-20160816;
        b=Pc/4lah/nUs4Th/+3KT8YdClIyIe7j0DCJX5slVa2sadJcPTBpLwLNn8eLP5NZhCPh
         uS1lEq1nizSQxUj6s+lE3qLRnhmrllWleBNFLK4yUmH8ufs1bKD4OwgFvVKAyM0+EIxQ
         DSQlt2F6Pg5u1aCWG2fb7ccD9eDFsXyVKacMareLnx9Z/9cYGxn0j9D3R7vlAcYdc4iX
         OxYpMI/5azldt0sfMhwxp6ewh3eu2E+JJsfO1h0LPuobZBnpz6n3UU3caCaEOXllEOYz
         V22Da+vRmyEJNTbKR1fmjua7WssXbumybpE5Bg4TLx2FFGWp3pbtn324yURA1+R8jUx7
         D7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0h/TwjEcebCcGsV2tARcocmmiJM/HkWArO7LTFSeZ5w=;
        b=hQ/0YbQ0vvtq/4hFoR9csxLiE+c5iWwb/aokKT/uMeGLLG90iouK0SlmqO/aIuKjtZ
         YEAn4iSH8UJS3EZQw/ZaZlOIa1EN1yPZmLPH9ZjWkrn81HeOZe9pgP5hZDTVkLbIKDkE
         0o2OoZjWbi/3n3svnS8TNW82GCn+b8n2Gfr7PgTb0fqVsNX6juXfIUnGtsU+uEo+PPuK
         AnPBv7cc6tP8nkfU5tvTbbNtaDB2a7NmSbt7meLucf3EzgrEyuBg0TlerhmzEj2rM0au
         TtziE+T7lDAb8VY4m3/2Pf0AnjdgHVvA2fLIjnI14iA9GvWwIzd2lYfkIXywTzlphdzT
         l+vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qsAI7UFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x90si4141663qtd.117.2020.03.24.09.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 09:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qsAI7UFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGm2N-00030E-Ay
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 12:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGm24-0002yK-Rz
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 12:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGm23-0007Lz-Nv
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 12:04:00 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:37116)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGm22-0007KD-1G; Tue, 24 Mar 2020 12:03:59 -0400
Received: by mail-vs1-xe43.google.com with SMTP id o3so11474796vsd.4;
 Tue, 24 Mar 2020 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0h/TwjEcebCcGsV2tARcocmmiJM/HkWArO7LTFSeZ5w=;
 b=qsAI7UFSOEIVtzsOxnqe51d+4dHFNvDj7V7TB7NJmoZdQXm48xsARVZPqT9JGwprnO
 T8Nhxojpi7iDlDMZSLOmcQfcwnZK94cX61pjrFT2QlWeUbe+WIBn+eLCe24nGzLax3Pf
 GpchIYFjjkRepNrVBJZh5bzmBuuvdUDevqbRonFVIQpb1qzPiwfn8SksjZETr9IEUm2Z
 5EfHgm2kvYGSCIua8kCqIhTLZEFcZVfUaZZzQEwuV2fucUTjGfBGQ9a11V12YVhRWgd5
 vtGjopH8klP4XSj1c4v+BeWIgQ3O/afmY6hg2y+fvNgB+/8ew4s08MRHBIMG6MTdPG0e
 +mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0h/TwjEcebCcGsV2tARcocmmiJM/HkWArO7LTFSeZ5w=;
 b=dRhGAKxtYKAogLkUK9NUxDuuKYbskyIR+qTa0oujT6C72TVJ0bt+bwG/w4YbdImY0o
 jCzFSR1DXJ8Def/ZKp4Q0uqWiZ6LVj1+tBtRBb+5H8kvqAT+oIrMeY0MYwRYYGNkVlX7
 rkYWhNWBTGDC6HvWTziQNWQPsga25TKv0BEUCxkqfQcAGsWZasZyU6DeKNqtZlbj39g7
 ZCZBP/6TzZVoOucZqI8a/BTjdp0wDDl+y37qiPf2fe4Mxl205EOU2hMaIKf+SGCMJ8KU
 QeFCAn8LsXWulV+lt9IY1+Owo+2SiHx3wi/f7984NmMe5nvhMGVDe5B+hmlThhmcboYq
 WbRQ==
X-Gm-Message-State: ANhLgQ3iJUrpC+6PxohuTqdXmz9Gas44Kb174Hq7tLWJfnwAcjHdWIT/
 81tlQ94kUpIlnQa8ygodvWyzbiflC8tdBuFAd5E=
X-Received: by 2002:a67:ffd0:: with SMTP id w16mr11669933vsq.151.1585065836790; 
 Tue, 24 Mar 2020 09:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200324134947.15384-1-peter.maydell@linaro.org>
 <20200324134947.15384-2-peter.maydell@linaro.org>
In-Reply-To: <20200324134947.15384-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Mar 2020 08:55:58 -0700
Message-ID: <CAKmqyKMUgDkXdk+gASP-W4_-dSmZOyjVdhtpAQh8ARtNn2ZXow@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/xlnx-zynqmp.c: Avoid memory leak in
 error-return path
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xt+0vSTx+kB5

On Tue, Mar 24, 2020 at 6:50 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In xlnx_zynqmp_realize() if the attempt to realize the SD
> controller object fails then the error-return path will leak
> the 'bus_name' string. Fix this by deferring the allocation
> until after the realize has succeeded.
>
> Fixes: Coverity CID 1421911
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 49f1c8d0de2..a13dbeeacec 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -520,7 +520,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
> -        char *bus_name = g_strdup_printf("sd-bus%d", i);
> +        char *bus_name;
>          SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
>          Object *sdhci = OBJECT(&s->sdhci[i]);
>
> @@ -541,6 +541,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
>
>          /* Alias controller SD bus to the SoC itself */
> +        bus_name = g_strdup_printf("sd-bus%d", i);
>          object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
>                                    &error_abort);
>          g_free(bus_name);
> --
> 2.20.1
>
>
