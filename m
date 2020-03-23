Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1631036lfi;
        Mon, 23 Mar 2020 09:06:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vunxTiyMDrrU1XSjZxp/wuzFeGE6IxECmC9BYe58ORt0WMsQVWX5D0sDt3j/EiKrDm2E7lA
X-Received: by 2002:a05:620a:391:: with SMTP id q17mr8424496qkm.103.1584979603023;
        Mon, 23 Mar 2020 09:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584979603; cv=none;
        d=google.com; s=arc-20160816;
        b=z17Llh25ihHubJuefcLPfkNJ5pwFQUd9cZDipnDehGwkXa7Xp4HRtnrPTWRg5TcGEV
         EiwgNy48YRtx5ll1niIZjdm88NJzSJUeFcuLHciKw72OPBefF95YekLbhGWn/Ebk0yX0
         HLfslTv68Gt0UiSFj7knNfQKnEy9wHJsHirkccXb6+M6OqkyuHFeBVnkSJv2+DZf0O2B
         SlXNwXZfp8iUE62XabcLkN1LpMWSUx4cIfL977p+1pcAIC6QcrSBm4yO3NdVa9wQKQsy
         cE9SsSyQxDX7D/8ORnhsejoCoPXkeoMRMKfYKx/I41lCrE6OuDNZ5gUcWz93RxMQTWPh
         54pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JnyeopB+Gr3i1azSR4z83W38j2lgLgHE6PDpwzZJBB8=;
        b=SdBifiyWg3AZ+ty4bWJOu0xtyldFUZYBxmeeCAM+T2Tbv4MMBLh/gPzfSxrbHP0XFi
         LctYlnjpgp/QM8LQ6rDXLmdunIa4qqIJqn8F+Pg9s98Ep0eATm/RP5h1+b8fYxhw712c
         4h9m+2+1mKjZ37uy+TLcwBy4IJjnnF4TImr7QwMe88YIgQmioVpIJko0w9+puyng4hNT
         nXxEqEMT2NkCzefTmDiO6mPbMsYMqx/3zZf+Amr3FOTzMDu456u/jiRbr7PvyDMWetvJ
         EID30ifZ1fH/kFxx0NfnJAp9crEDTFryX+awPR3h03RlvzH+0I1LEmBz3//jakob+Y4/
         yczg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p2kvYCwk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si9143715qth.153.2020.03.23.09.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 09:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p2kvYCwk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGPb8-0004rH-Cx
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 12:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPXn-0007aY-IY
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:03:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPXk-0006fF-OL
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:03:15 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:37717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPXk-0006dA-KV; Mon, 23 Mar 2020 12:03:12 -0400
Received: by mail-ua1-x944.google.com with SMTP id l18so966748uak.4;
 Mon, 23 Mar 2020 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JnyeopB+Gr3i1azSR4z83W38j2lgLgHE6PDpwzZJBB8=;
 b=p2kvYCwkVukiiOQHNpOTZjXZ3qUhT2afJEgMCmV0WTjTzaqibkNcZdaUTtSLRN0J5C
 5blHrzibFGYcVx1aGlzOBkTIC/WY+Wyd1kBaVrr1VpE+tcR7+xRqwT6tQGDGSOF1aRZI
 t31rf2eFACLhd9OxEZ73GD8R3v2mhKs3mxwa1/fi4KOAQAfOqlG/vhCRoERQpVeTAq0N
 tViP7821FddrPWi0mOIl6Uh/QhXdlhecgVWvxjN6fR1oXV/g80k1wpdLjdx51o9PWPl5
 nkAX/MyVJvglANyR+WW1A+vKlruZKNhUfs5W9EuH7X6JlHVw53O7UXX8gmNGvInMDBw3
 rpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JnyeopB+Gr3i1azSR4z83W38j2lgLgHE6PDpwzZJBB8=;
 b=uYRsWxQbNq/smPf/MRNth0LHrKkwY8EsJu8EKUCDjnPHD/uIjAaNwBSKPHwcE5RmWm
 rzli1h/MFYMqUTVLhyCkZyivpR3OsfLbkvcOAwHXLcNUA6N5JbZahs9Yu1kchjiS3n50
 rYiMCCl/iz+/YuurIUoDNs5jRIa0yZgYg8WyRJ6wop5K560wjoxPLA0ZCz0VoEvnAL19
 rqJ27CdRgoRC+70eyziSdzaIk2MlcawSasPk3hBQ+JkZ++jZxlnOUxnKShmtxLw8qLI4
 n+LnQTOHGp2qxrDuCjYR7L33TBi1UnDKuFkBNJIF9UerU/Kelg2BgPvhcxFfexQQCGWP
 +aOQ==
X-Gm-Message-State: ANhLgQ0E2PPRa4uAOITIqOCHau6tnlaEG/9oNurb9DRvS8fvJFRs5lSP
 UWAFeZyeYV5fay8wq5tbz5TrYaHSC8nS0hKWgrg=
X-Received: by 2002:a9f:2964:: with SMTP id t91mr7742050uat.21.1584979390662; 
 Mon, 23 Mar 2020 09:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-11-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-11-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:55:08 -0700
Message-ID: <CAKmqyKOt9+O8fYsSOabSP6kOqi879-qE-GBJqhVvW=EtH_2rmg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 10/11] hw/timer/pxa2xx_timer: Add assertion to
 silent static analyzer warning
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1Hg/JHPsZRg

On Sat, Mar 21, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> pxa2xx_timer_tick4() takes an opaque pointer, then calls
> pxa2xx_timer_update4(), so the static analyzer can not
> verify that the 'n < 8':
>
>   425 static void pxa2xx_timer_tick4(void *opaque)
>   426 {
>   427     PXA2xxTimer4 *t =3D (PXA2xxTimer4 *) opaque;
>   428     PXA2xxTimerInfo *i =3D (PXA2xxTimerInfo *) t->tm.info;
>   429
>   430     pxa2xx_timer_tick(&t->tm);
>   433     if (t->control & (1 << 6))
>   434         pxa2xx_timer_update4(i, qemu_clock_get_ns(QEMU_CLOCK_VIRTUA=
L), t->tm.num - 4);
>
>   135 static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, i=
nt n)
>   136 {
>   137     PXA2xxTimerInfo *s =3D (PXA2xxTimerInfo *) opaque;
>   140     static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
>   142
>   143     if (s->tm4[n].control & (1 << 7))
>   144         counter =3D n;
>   145     else
>   146         counter =3D counters[n];
>
> Add an assert() to give the static analyzer a hint, this fixes a
> warning reported by Clang static code analyzer:
>
>     CC      hw/timer/pxa2xx_timer.o
>   hw/timer/pxa2xx_timer.c:146:17: warning: Assigned value is garbage or u=
ndefined
>           counter =3D counters[n];
>                   ^ ~~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/pxa2xx_timer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
> index cd172cc1e9..944c165889 100644
> --- a/hw/timer/pxa2xx_timer.c
> +++ b/hw/timer/pxa2xx_timer.c
> @@ -140,6 +140,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64=
_t now_qemu, int n)
>      static const int counters[8] =3D { 0, 0, 0, 0, 4, 4, 6, 6 };
>      int counter;
>
> +    assert(n < ARRAY_SIZE(counters));
>      if (s->tm4[n].control & (1 << 7))
>          counter =3D n;
>      else
> --
> 2.21.1
>
>
