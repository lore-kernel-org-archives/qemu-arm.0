Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2572048wrs;
        Thu, 29 Aug 2019 11:56:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxAta6fBOlnKROdu7froAX1WXXUgR7AAWEoa6rvTZXl2zAz56VwaRHgAsS8wFgqAfvKJp3
X-Received: by 2002:a17:906:1911:: with SMTP id a17mr9557388eje.290.1567104975321;
        Thu, 29 Aug 2019 11:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567104975; cv=none;
        d=google.com; s=arc-20160816;
        b=mG3Sh6Lyg8bCSHkns5FAMMKHbeCqgTBebEKtr7u5/fitw/jC0EVtfhG75yr/uk0EnA
         E7ZEg0Tti3rztYTLU2kRU20Iyv4mZk8V4aB48ESLRhitydqLjIj3Q9mGnh0DLR3klDhk
         PeWpjDvwRIbYkqNK3rb0oonXxUR4pWLgp9B6qJrBeQHP7b8HYHtZADvoLjRtlHN2KNCz
         Iso1eyqgxhYz+kKZHXzCo8pQ01R/1VzgAmSTIV1Cz0HAANbf2pulI233OKF96oyoXBGo
         HedSUCQpJ6JBjg4sZZ4g4QI1KnKSgAyzrQU9vM+zZqNhAkQf8ZWAVkEYKzkhd5Iiq8yE
         XtUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=GpT5VP/RmWMfoqvuppWWNFRnStwNyw3orwz3TIUun6A=;
        b=d4L2l2KN43cNsuQDHZd088MOjkKbMt3y5Ax5SmguTKvg47OSmUMBFNWgzNT/Lb4Tos
         dJjjLa1IokCDXv6JY3VBibU/202ja4bouxGbYvQDYvtZonM6IIFz4Qt/x4YuiVVG2YeE
         ujwHDJ5voEK59ViOY59VE2au9ii5YAD4MudVZ68dvhUFn4d7q1lJ44M+g7TbNqOpQIUY
         xA3OikyCDSfi+DszQGdRpehgRGUfB2h9uKwl56AOEJhNCTKoi6AI8Rx50j74oRxUv10e
         OgqGcOBqrlFMKqrlU4OBXv3yidpPEhkM10sXnUEmAVQ0BEutJFA7btzPtxWwLG2eE4ea
         ywxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=H1z67jwS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20si1965758ede.362.2019.08.29.11.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 11:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=H1z67jwS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Pag-0007GS-EP
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 14:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i3PZY-0006Wd-5S
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i3PZW-0001hW-N1
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:55:04 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i3PZP-0001Z0-8o; Thu, 29 Aug 2019 14:54:57 -0400
Received: by mail-oi1-x241.google.com with SMTP id v12so3367366oic.12;
 Thu, 29 Aug 2019 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9VFKcWa8OHbK1kiI+fJgtyQLXuwUGYfSk1gWWWibB7Q=;
 b=H1z67jwSPb9KRcuExUIAO+6sE80iBd/sJjuI6eIAc3yJFeTmyOEZq/TA+WEJn9+YXf
 Gd96INENhhR6OWK3VIuF2uYxQnNFutFSE0W1qhqCL7ZYKtaLDxQn/JZV1IYxHwJKOcp3
 H91rNWGPoUWyHSx+FjqwpxXDWnpFlvXfz/qN7y1Vsf/qdMGcFX4s7C52KJk8pHutDARO
 GUayPeyZhn29KIuDsX+8gwXJWPSOKRTU6BSyXJPMRwgsyjAhrLo2p7td1of2vooBCnP5
 lmhXyqZcwH7amrHXEUEq0xuDKIWR9BdT0IrelnrC6TaPoWMFuV8vw0UGOgnGPDl1dWUS
 IjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9VFKcWa8OHbK1kiI+fJgtyQLXuwUGYfSk1gWWWibB7Q=;
 b=gjSuaoTdJL+COqQAEq6V7ITuDrs0fAWoj8xzIpuB5bgSqVvZ0wJnPixbi0nbrG3z9b
 Lfph82MjUiztcYrZ97PbXCMR4+ZmEkrETlz2ExonpCCJ3wuCuy/pZbVI0FQAWQIV1fjs
 ilQPyhRVoTBVfwp+sGDXXazYowrCr5kiqFHB9sdpAFXSbV33Iyjbe5RN08UOkPLfPSvW
 cQpIipGQ73G4JWMyUAbdt8ZQSh66KPgr78DNGSpxTuj/6ctUwLHZxzhPOZmYXBQym0fh
 +L/LgxuvdYznWYXDEvo3HmHvhYv6ihCJgNdwbV5d28zGlG3bVugpa5mJ0TcAnpAK/TPj
 xtlQ==
X-Gm-Message-State: APjAAAUVPUIB+l20wANDk9acxbXN/ZMvI/7QnHNik8v+jL+VF/gXTICI
 qlohjBlkORLzIdNuWjhpgtAatqgTDyski2sQZnQ=
X-Received: by 2002:aca:fd92:: with SMTP id b140mr7107357oii.79.1567104893493; 
 Thu, 29 Aug 2019 11:54:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Thu, 29 Aug 2019 11:54:52
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Thu, 29 Aug 2019 11:54:52
 -0700 (PDT)
In-Reply-To: <20190827121931.26836-1-peter.maydell@linaro.org>
References: <20190827121931.26836-1-peter.maydell@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 29 Aug 2019 20:54:52 +0200
Message-ID: <CAL1e-=j_uoOcyxqv7CZv3V6FWaarBnS1wEnU4k1cAoc1_b5mMg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] target/arm: Free TCG temps in
 trans_VMOV_64_sp()
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
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3lWCpsD9L0n

27.08.2019. 14.20, "Peter Maydell" <peter.maydell@linaro.org> =D1=98=D0=B5 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> The function neon_store_reg32() doesn't free the TCG temp that it
> is passed, so the caller must do that. We got this right in most
> places but forgot to free the TCG temps in trans_VMOV_64_sp().
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Hello, Peter,

I am just curious if you found this by manual code inspection, or perhaps
using a tool?

Yours,
Aleksandar

>  target/arm/translate-vfp.inc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/translate-vfp.inc.c
b/target/arm/translate-vfp.inc.c
> index 3e8ea80493b..9ae980bef63 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -880,8 +880,10 @@ static bool trans_VMOV_64_sp(DisasContext *s,
arg_VMOV_64_sp *a)
>          /* gpreg to fpreg */
>          tmp =3D load_reg(s, a->rt);
>          neon_store_reg32(tmp, a->vm);
> +        tcg_temp_free_i32(tmp);
>          tmp =3D load_reg(s, a->rt2);
>          neon_store_reg32(tmp, a->vm + 1);
> +        tcg_temp_free_i32(tmp);
>      }
>
>      return true;
> --
> 2.20.1
>
>
