Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7369899wrv;
        Wed, 7 Aug 2019 21:45:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7voppHk/Z0ZHcGketQfFJ5L6Ztd16zkAAKXlpwKQ4k5034029a/fbA3xKKMNnols2Gbk7
X-Received: by 2002:ac8:6d0c:: with SMTP id o12mr6829799qtt.74.1565239542349;
        Wed, 07 Aug 2019 21:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565239542; cv=none;
        d=google.com; s=arc-20160816;
        b=QWWQ/euAXGT25CTyYYE0o6qez2c3R+vmYltRm9gMtnTzhVXrG8ZcftsQh/DfUayLlx
         fSBOMGPTk6ClHlnitmz0ajRdZ/5VDH6QzYe/mpK95i/kryzenMXe1yPl4CBhRZtueZnf
         CIjgXkXaz3XIwarV5px6j42BgRJM9tyjxoi6d0Ui+OwOE4MF51hqDQg6byjYeDf8zw2S
         2qOodGNpShEIe+Xi6LhvseCsCsQEAI+QpknOXrHDMPCyf/IPVE5+pdv2FYYhZ4xxl255
         FilV8qgDsnT6av4UZIGHjPlHDADTHT/fmKZxUuEhSBuQfZUaqOWBQaJu8YwvxZLK5JsA
         nN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qCY9EiUe/9gn3nO08CIKw8D1hOmiv1y+XsfoedLw25w=;
        b=eTT8RlqwHpIKEepbs48d9pqRAAbn/Hoy18aodFcWk2fU1JDp81O6tVnZS/gdonawKO
         riWwYFAPzJK7xpdMXLZxyPtCXSKz30eQoyNLSuT/SBHPd2SKsHjYLkGLuatB7w7eBa5B
         pYJMZg3endfkajfDzyMbXyAB7f4TycOnKaOOQTlN0sFTbUExL+VgltM/Rc7trMHQooCr
         bjw9nr/wmQ2qr7sI+7nBdMRzPfHdgKZsGIDY44pl2Q11L10WgKJ6SQOC6qUaiRkHJFSQ
         tqdvVd1TWHMGUQ2696vT2wsFFW56Gf8lcpJ8I9iaex/qN47+cLVBrXgLl1N1WxVr0FIi
         jikg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t3BHiiqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a39si9405896qtc.111.2019.08.07.21.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 21:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t3BHiiqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvaJ3-0001uZ-Ue
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 00:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvaIw-0001o4-60
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 00:45:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvaIv-00059X-9s
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 00:45:34 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38581)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvaIv-000599-3h; Thu, 08 Aug 2019 00:45:33 -0400
Received: by mail-ed1-x544.google.com with SMTP id r12so54128743edo.5;
 Wed, 07 Aug 2019 21:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCY9EiUe/9gn3nO08CIKw8D1hOmiv1y+XsfoedLw25w=;
 b=t3BHiiqXe1M351XyysHIBGaMnBbhRX5ZdeIdumG10v15Cce17zb+ciSowuoNuQkFjT
 pLWgETo/dCoSN++fLpjxw7G18aIRDJxYcFWa7KREj9d5u7I4nCh28rxkntCF31GHlCqZ
 AOn5R9RDkfpM5YQ7Gg9wzlMrh0U/BARnYevT46mns8NtVWB1DqtSkmblqDKtMz6HBax+
 1MOJEWGL4TwlWMyV76wGICbgdEmdbXPuubo4Yu2ZhuJZIBdSjgPlMb8xIdRxRyEI6hJG
 aLnRZTzcNJ9pr6cb4MJ6QoV9uhYq+63o1gpjoEQ6ilrVKfqwtsc1y8Aw9oq79Cujcq2f
 Dybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCY9EiUe/9gn3nO08CIKw8D1hOmiv1y+XsfoedLw25w=;
 b=C5KCWj9VUUokUv1dCFFfOZvCIfs9fxYO4VV6go34eweZ0FNzjDp5qLAkd1u7ae3h3I
 K1igEXWWetICDudTJ2w8nigKYWKxnGX2wNEnGzvMMZ6chzxoUKo6jLLodavPDPL+xUuP
 cyLeNDyb7GKNJlWhxeZyb4fvJZ8oiX2WVo5gq0bHU/TtH6yyOJ1q+iS+HeiEMFBWAEEQ
 /vJmyGUOeuzS+ffTdaMFeuYla+6a7RKiAkBi/UXi9Gai2k679FQJISvLJVJgZADSgKx9
 8bN5LweumZo6l6d0PlbW4Wt2GlwhJElPz67BJZy+Tk2h02T23EFC54LgWuG0DMf7fAu7
 yT7A==
X-Gm-Message-State: APjAAAWnO14TUmnhIP7HaH1O5TYCXKrLpDWW8cJp6NH+CnArhrF9ZUbD
 BcErd73wJruShUdXkW1L4Fr6X0X6xneYE0jWNl8=
X-Received: by 2002:a50:886a:: with SMTP id c39mr13681566edc.214.1565239531883; 
 Wed, 07 Aug 2019 21:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
 <20190806105739.ypoa545l4vigsscg@steredhat>
In-Reply-To: <20190806105739.ypoa545l4vigsscg@steredhat>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Aug 2019 12:45:21 +0800
Message-ID: <CAEUhbmV10=Diih7Cy7c1GweA8FeMhLaKUa6PXpSj8wy2Yn_Rww@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: net: cadence_gem: Fix build
 errors in DB_PRINT()
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s493I0OB26yE

On Tue, Aug 6, 2019 at 6:57 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Mon, Aug 05, 2019 at 08:52:54AM -0700, Bin Meng wrote:
> > When CADENCE_GEM_ERR_DEBUG is turned on, there are several
> > compilation errors in DB_PRINT(). Fix them.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/net/cadence_gem.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> > index d412085..7516e8f 100644
> > --- a/hw/net/cadence_gem.c
> > +++ b/hw/net/cadence_gem.c
> > @@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
> >              return -1;
> >          }
> >
> > -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
> > -                rx_desc_get_buffer(s->rx_desc[q]));
> > +        DB_PRINT("copy %d bytes to " TARGET_FMT_plx "\n",
> > +                 MIN(bytes_to_copy, rxbufsize),
> > +                 rx_desc_get_buffer(s, s->rx_desc[q]));
> >
> >          /* Copy packet data to emulated DMA buffer */
> >          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
> > @@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
> >              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
> >                                                 (p - tx_packet)) {
> >                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
> > -                         "0x%x\n", (unsigned)packet_desc_addr,
> > +                         "0x%lx\n", (unsigned)packet_desc_addr,
>
> What about using 'z' modifier? I mean "0x%zx" to print sizeof(..).

Yes, good idea. Will do in v2. Thanks!

Regards,
Bin
