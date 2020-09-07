Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3357556lfc;
        Sun, 6 Sep 2020 18:12:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw61gnDZQyHkDLIRbwkN8L4ErKKJ6SPnMgnExIdZB9nxmrfH6jrjkZcFWKSXuE4Knvoj6O3
X-Received: by 2002:a25:40d0:: with SMTP id n199mr18625930yba.306.1599441165300;
        Sun, 06 Sep 2020 18:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599441165; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfvIdsVN70ZjOPHrVo5SzkvoVzCF5nLXxRTLkqJKSrhlBWtB82I1HbeOyAm9649Bu0
         JIi5IzRG25F+DLpCa9442L3XErqzPUvZ/cOI8+SacL8opAaPhYaY6X3UENl9X6J18Dni
         nkVn4hJ4/qysI/uZGJFZeCyZbiRnr+a/y/SIv0afuMZi9gUqGnM3ne/YWV26I3KgbjOu
         jhNLLmjwGE+ASc/v2EtM0yYyaWVkbmd9YIOlL2foUNhfOGevS/Z98MhAazarDex1y9FY
         C99KSSjfiHsmq/4rxBEW911n0nXaxTvNCF1tSsoPSrsPWWV41SFs8jHV07Zi8QYAxp5e
         3/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=U1xrxZw6wNGe1qsNnvO0rraAAbdhelBwJsQdL/3pJWQ=;
        b=zDojSeFBmALjoicutFO1ZeMiedOGqq4jCIxGA/jrAbRqJi9ZvvDm+enhxj6nwp56E2
         Lg2nSPAvad79/Suj9rsPs9VK8I7jlbUHuRWOoL6P1QsSl51X7oBRrPEzLx7IrlivFW1v
         QDauhDvRiR3yt4RlTB6AXw21H34I75Uf3zq47Js3UugtFQtVhyvIIacieo5lmqWhhYPp
         goy5b0Ktn1tamN377Dv9IfICu0qUP52UbfpLVFsnabzB6jBwBC26uKvCFw28Fj6+ZA3X
         9eHtihHWT25Cs3oKQMLHyfDPmrujngfwtXFo4ga89Jna6Ss06se3IRL3SWyhcPxi5COF
         ndqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uo6ktWwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si10359771ybp.311.2020.09.06.18.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Sep 2020 18:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uo6ktWwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kF5i8-0001fR-Ok
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 21:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kF5hj-0001dG-EP; Sun, 06 Sep 2020 21:12:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:32941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kF5hh-0002k4-Ll; Sun, 06 Sep 2020 21:12:19 -0400
Received: by mail-ot1-x343.google.com with SMTP id m12so8045195otr.0;
 Sun, 06 Sep 2020 18:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U1xrxZw6wNGe1qsNnvO0rraAAbdhelBwJsQdL/3pJWQ=;
 b=Uo6ktWwNqk2KdWSfPEHgjXtOmpkDJOu+BXbMxymwGNXGoPD6lftNR85tcZxhnKreQ+
 UhbAtH2Zm9VETZtJxi0+JI6g6Ymjp1gXUv+ULdfoJiuSEbxAwRB5o11vL1j59HdboQ2z
 Dea0fEu/J3LAEjuh721Z3GmDdQDxChVgiCwy55IZIj07wBW4Pp5VXNk71LVi/JU2bSv3
 l0f4RT+LI4z0lXTg77GY/AF5fGQRz1SflMmZhi+fNyWJEoA0DjYztAlC0jTgieQm9U52
 DeJqAmJLfJXSBgxjf8NPWpIS3KQtTfEOHKW/vV0/QaVIf5aETb1uEYyIcXNPXEMjbmOM
 Nu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U1xrxZw6wNGe1qsNnvO0rraAAbdhelBwJsQdL/3pJWQ=;
 b=VKI2vUjVmg42xbd9fylIr5aHbFjtcbv1fRvn96RLZ7lliKwe0VZOL9G8kYBMiI+wGi
 R8FmLrfqM1ZflhHP6HB4MSU153gMaQ1XONkdqt6AaKhevwxFabSpqE5qjHa5RTAd2ozS
 sLPkUeTkwEway/y+/Y+bDDi/N8R9+ymVd1w1oyLCkBMg/5AEaUytX+sIh+eQ1vqeypj9
 wIiHHNLHF2AShTe9M90FDPx6C4439tZ5yYTs7t00VDU0tSGK+P6QIE2fNO8Yl7/6CcI8
 PH4XGMqQIsjHktqx22f6yK5DEdnndTjoxGF3e0T3bHXLuNaqtRnQEYLFqkDWVVnwBBO7
 SH9g==
X-Gm-Message-State: AOAM531rB44Cw2mO6k3s8ba7L3Kh7MRiJgV5DUn9pdBbvONizXvdI96M
 mOhWAw94llz3kAPD5KkF4s5BJKRbAEj4V5D0pVY=
X-Received: by 2002:a05:6830:610:: with SMTP id
 w16mr12169963oti.353.1599441135520; 
 Sun, 06 Sep 2020 18:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-9-philmd@redhat.com>
In-Reply-To: <20200904154439.643272-9-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 7 Sep 2020 09:11:39 +0800
Message-ID: <CAKXe6SJ76vvU-Dom1twGhKi2UmARN1UcV3k59D1xqG2ybUTo7A@mail.gmail.com>
Subject: Re: [PATCH 08/13] dma: Let dma_memory_valid() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Qemu Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6PSxyfz8L53

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B49=E6=
=9C=884=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8811:48=E5=86=99=E9=81=
=93=EF=BC=9A
>
> Let devices specify transaction attributes when calling
> dma_memory_valid().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  include/hw/ppc/spapr_vio.h | 2 +-
>  include/sysemu/dma.h       | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
> index bed7df60e35..f134f6cf574 100644
> --- a/include/hw/ppc/spapr_vio.h
> +++ b/include/hw/ppc/spapr_vio.h
> @@ -96,7 +96,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *=
dev)
>  static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t tad=
dr,
>                                         uint32_t size, DMADirection dir)
>  {
> -    return dma_memory_valid(&dev->as, taddr, size, dir);
> +    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPE=
CIFIED);
>  }
>
>  static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr=
,
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index f4ade067a46..b322aa5947b 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, DMAD=
irection dir)
>   * dma_memory_{read,write}() and check for errors */
>  static inline bool dma_memory_valid(AddressSpace *as,
>                                      dma_addr_t addr, dma_addr_t len,
> -                                    DMADirection dir)
> +                                    DMADirection dir, MemTxAttrs attrs)
>  {
>      return address_space_access_valid(as, addr, len,
>                                        dir =3D=3D DMA_DIRECTION_FROM_DEVI=
CE,
> -                                      MEMTXATTRS_UNSPECIFIED);
> +                                      attrs);
>  }
>
>  static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
> --
> 2.26.2
>
>
