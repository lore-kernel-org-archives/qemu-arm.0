Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4057323lfm;
        Mon, 13 Apr 2020 11:11:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypIE66CThBc0OImOO9oOjSfbvOH81yEtf9YYvkAPJ0irt2owVZ96osIGT5hhHcIWmM6Al8Xd
X-Received: by 2002:a37:e103:: with SMTP id c3mr16459867qkm.7.1586801501545;
        Mon, 13 Apr 2020 11:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586801501; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb0e3qVCmgOxVHhmRQTnpwH92p2NiiRJk/YQDweWcR0GktU83zmqSxQBhB3dFVjybH
         Lm1jRaiXptepAI7xUez0Yu9c6gsluXg97oLtCrmd5HoO3puHkke7F4zt/c76zSU2YNG1
         8NgwrMkVA6COXruuMFBdyY+L/aXDSBcM3dim5RlbGjt7J/V2inctqAk7BMSZEYQG7Mq1
         8IkkOMaSHlkSgZ5NftHHFaLX6B1PX1xRQnwf7V9hBubTuX00nyAUwHj9ElaN99Jk7wuO
         /KWG59bz3U4Po3ar8ut9m7KNNzfT5xidRmlpwCj5Myozx+O8kTvJT0J+zUdTYrlhnWJZ
         F9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=D2o7yS8lDP+9vZND/93mgvVi5n/zRoNMfS7bbRBUMcA=;
        b=pXCb1IZqlkgEiIc4G9yoa+0fXn/IuDpGJ7OuQcWNNWjr4aL4YzOfxq8hBO87AKEEPX
         EpNHa/SdikpgearaD91QkfAyu5wFQOZdao4wGk/eaPkfA1iuuuoq7BgCrmB/sARY/h11
         hQllsTOxJVm2DC6uzNuNaLlb3hNsoHqt35U+vpc46bSC0ryoq3ORzD0iru1IKgypW4kj
         nDMu+faUIuY6N+xCCqmRGT70ZAaYpmHsXg+y2ampCHuQfz/Kzw/4dFn0Gg2/nGC8O9eP
         gyDuyw33SC4w+BC7VsO81eQYbb3OxAUyyijASSzUYtUJ8wMF++Yfa01q9+LbKmQn2S+P
         fPDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="pO/Ifq5M";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si5813973qtk.109.2020.04.13.11.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 11:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="pO/Ifq5M";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO3Ya-0005U8-RK
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 14:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rfried.dev@gmail.com>) id 1jO3Y4-0005SU-0p
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 14:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1jO3Y2-0006Ug-Ue
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 14:11:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1jO3Y2-0006US-OL; Mon, 13 Apr 2020 14:11:06 -0400
Received: by mail-oi1-x243.google.com with SMTP id j16so8116682oih.10;
 Mon, 13 Apr 2020 11:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D2o7yS8lDP+9vZND/93mgvVi5n/zRoNMfS7bbRBUMcA=;
 b=pO/Ifq5M4VAeasoXLDg/vVog6X5HgXzNyQ0QuJ4qbkfMfECC1Pq3fdtQvfT1gQO//I
 BN8CUXiVXHiqvzZ2DmYoHsfpIy4txtf6qeNcGN4Eb/pIfRmnxHdaaHAKZl8lIvwcGbFk
 0SyBH3ADPGZg3BD8lAIuNhjYnDx8nVjfa4dAYMhHXWcJafMrZnDpzl3eLzUjphEtnJyx
 4vZPRLaMzt4zEtY6twBenhkOOH3Jfhxu7C3fnglOKJwyrWKlZGdb2gOmEuTrZlkEqUfj
 590tGHjN3Zq+yKgk1CDc8lhIOdtBw/weOHhIHuzO7rfJk6IrG4Pq708TJm6b6/OeFbdq
 9APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D2o7yS8lDP+9vZND/93mgvVi5n/zRoNMfS7bbRBUMcA=;
 b=TophCyFTfnNwheX0ArOdJj9F1zhpiSz0ur+5QgcecLgsAgwgpYKYBDGz/42Cy6YpBe
 p0wsCTyvMXrkct86agAd1hYysDm1FnXso488+tNGWavHtmaxtBmQHpgvpEhX+OHTUhKb
 0fUpnVixUs/ucsItVuytJxjjgTQoK4MPJZJEixnGxghzFCuUW91CRP7X0n0dRGefIf3/
 tR17p8T7sZTCDVzva12Eu05odKTdC2AcVQ0pKNrrGuKnqpa9a97cKd+XGJW6mtVVYaUs
 kcl4YKNcz0UZfy0+2xZaK8KrHt+Ik7bzgv+bJj0hrHUFsSg0OdNa3KG2r13f2xlZZAcw
 MvsQ==
X-Gm-Message-State: AGi0PuaiZ+90Qkxm4pw+OjbTk0hJbXHfTVdjSHO9qjkKsDzNwDzWYEvI
 LIIopnaDoTPefXKRM4cl6OWiQq+D8XwrH9AH2QI=
X-Received: by 2002:aca:c691:: with SMTP id w139mr6985242oif.147.1586801465659; 
 Mon, 13 Apr 2020 11:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190615051559.13767-1-rfried.dev@gmail.com>
 <d87ea542-7ecc-4fb1-ac1d-929825d23a8a@redhat.com>
 <E1523CDB-895A-4EC7-908F-8A3A3717353C@gmail.com>
 <CAGi-RUJ_0LBfAe6eVXRrhqpW0EQH97TtdvjaQnXNY0Ts73zJCg@mail.gmail.com>
In-Reply-To: <CAGi-RUJ_0LBfAe6eVXRrhqpW0EQH97TtdvjaQnXNY0Ts73zJCg@mail.gmail.com>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Mon, 13 Apr 2020 21:10:54 +0300
Message-ID: <CAGi-RU+aC=c8fZRRdCvSmxtcwhoCG5oAKES7DVDP037iBWy3zQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3] net: cadence_gem: fix compilation error
 when debug is on
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ow7WY9TApzMo

False alarm, exact same patch was merged by someone else.

On Mon, Apr 13, 2020 at 8:55 PM Ramon Fried <rfried.dev@gmail.com> wrote:
>
> Hi.
> Just noticed that this patch didn't hit master.
> Got lost ?
>
> Thanks,
> Ramon.
>
> On Sat, Jun 15, 2019 at 9:16 AM Ramon Fried <rfried.dev@gmail.com> wrote:
> >
> >
> >
> > On June 15, 2019 8:38:35 AM GMT+03:00, "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@redhat.com> wrote:
> > >Hi Ramon,
> > >
> > >On 6/15/19 7:15 AM, Ramon Fried wrote:
> > >> defining CADENCE_GEM_ERR_DEBUG causes compilation
> > >> errors, fix that.
> > >>
> > >> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> > >> ---
> > >> v2: change %lx to HWADDR_PRIx and %lx to %zdx
> > >> v3: change %zdx to %zx
> > >>
> > >>  hw/net/cadence_gem.c | 6 +++---
> > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > >> index 7f63411430..ecee22525c 100644
> > >> --- a/hw/net/cadence_gem.c
> > >> +++ b/hw/net/cadence_gem.c
> > >> @@ -982,8 +982,8 @@ static ssize_t gem_receive(NetClientState *nc,
> > >const uint8_t *buf, size_t size)
> > >>              return -1;
> > >>          }
> > >>
> > >> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy,
> > >rxbufsize),
> > >> -                rx_desc_get_buffer(s->rx_desc[q]));
> > >> +        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
> > >MIN(bytes_to_copy, rxbufsize),
> > >> +                rx_desc_get_buffer(s, s->rx_desc[q]));
> > >>
> > >>          /* Copy packet data to emulated DMA buffer */
> > >>          address_space_write(&s->dma_as, rx_desc_get_buffer(s,
> > >s->rx_desc[q]) +
> > >> @@ -1156,7 +1156,7 @@ static void gem_transmit(CadenceGEMState *s)
> > >>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
> > >>                                                 (p - tx_packet)) {
> > >>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x
> > >space " \
> > >> -                         "0x%x\n", (unsigned)packet_desc_addr,
> > >> +                         "0x%zx\n", (unsigned)packet_desc_addr,
> > >>                           (unsigned)tx_desc_get_length(desc),
> > >>                           sizeof(tx_packet) - (p - tx_packet));
> > >>                  break;
> > >>
> > >
> > >I still get an error when trying to build on 32bit host with
> > >CADENCE_GEM_ERR_DEBUG enabled (pre-existing to your patch):
> > >
> > >  CC      hw/net/cadence_gem.o
> > >./hw/net/cadence_gem.c: In function 'gem_receive':
> > >./hw/net/cadence_gem.c:973:14: error: format '%ld' expects argument of
> > >type 'long int', but argument 4 has type 'size_t {aka unsigned int}'
> > >[-Werror=3Dformat=3D]
> > >    DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size)=
;
> > >              ^
> > >./hw/net/cadence_gem.c:38:24: note: in definition of macro 'DB_PRINT'
> > >     fprintf(stderr, ## __VA_ARGS__); \
> > >                        ^
> > >cc1: all warnings being treated as errors
> > >./rules.mak:69: recipe for target 'hw/net/cadence_gem.o' failed
> > >make: *** [hw/net/cadence_gem.o] Error 1
> > >
> > >However the 64bit host is indeed fixed, so I'm fine with your patch:
> > >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > >Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > >
> > >Regards,
> > >
> > >Phil.
> > Thanks!
> >
> > --
> > Sent from my Android device with K-9 Mail. Please excuse my brevity.
