Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2134922lfy;
        Thu, 6 Aug 2020 17:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1Iuwt5bi8aI4taWry7lNqT21sjqqAENgNUVL3d3BPbhHqdpMlKjTBXVjjRraJLSPzglhM
X-Received: by 2002:a25:bb8e:: with SMTP id y14mr16696729ybg.130.1596758622389;
        Thu, 06 Aug 2020 17:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596758622; cv=none;
        d=google.com; s=arc-20160816;
        b=T/Oa0eKU4ymgDcOa96rp+6oCXasrqlPbIX0wBMm1lIv/Z20cjzLcJzqBh+9O6IH3IA
         GKPqt7P7hMk2qr0GEVTpIy7CXKWtTEXJhloCQ96xoBXV0JXqR/zHO5H7Pzn3yN6Nzzf/
         ajBeXyShwa9a/+/Y3er9EIsnFgIhZ5hJo3f1QuB1whmThzrG/CQ5QQ15zPNc8uvygOYv
         6obWchgv8TzdG/DnE1tO8jODXG6fUt5WIdtK+SBh9IcPrZjpYbG9XcyL7H3+OtcXG/as
         eIRc0ixouOb6Xq8ibit+oFBxxtyrwTnueq3lU+rpiiymn5/F+ID7Q3Vy+nnC2hz48tTZ
         IoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=36skZ/Fqp0hzGFyizluyH7sOhrXB27+uSzT8RYATHZw=;
        b=pmE+AnIfYH54JTod9cM9Rg7FRTM5O8ANysSahzJqDxesMCxceOm60p9yimK8kbvbfB
         7JBiFh/X6313DUpDxfkgQUZ3QQfxDppDoPB11axA0FdTA2i8eDgye+wTlQOSd6K9W7Tq
         Ippj+murcOlQxyvwrZhyzAy7lZP2/KQCSNuAfq8z7H82RnJ9V4VIw4mueFHXroLP/iUO
         KRv7BsQ10DSvjZNG1y7SJQHTdD0xjVlSnJuKUAV47sbDQNmaraHjsKhWdPuXc8NW8L33
         3B7azxqs88tK5WAQhqcljYgOYTxHnqoHZqBn9ek9QUY2Q+Y2QQRIg+Eb1SUh6CuZVV1T
         qugw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=X0K1p8U+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j76si6316164ybg.496.2020.08.06.17.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 17:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=X0K1p8U+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3prJ-0005x1-LP
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 20:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pqw-0005vu-Hv; Thu, 06 Aug 2020 20:03:18 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:33362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pqv-0006K9-1Z; Thu, 06 Aug 2020 20:03:18 -0400
Received: by mail-ed1-x541.google.com with SMTP id v22so8051edy.0;
 Thu, 06 Aug 2020 17:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=36skZ/Fqp0hzGFyizluyH7sOhrXB27+uSzT8RYATHZw=;
 b=X0K1p8U+6sh6cvpVPLBNTUR1452pTRNBgAYBrrsZMjs0xW5RsJaaRzJB383cTH+R2L
 RBd8aSZsWS6f/67hrDibWwsJ82UtBB49lD45iS+MI2PWfU7ifTJ922CzeNmcw8VrXneA
 VOMrjmkZVxejA0uOGPLtyMJcGT/caO2pSgWmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=36skZ/Fqp0hzGFyizluyH7sOhrXB27+uSzT8RYATHZw=;
 b=QRBOv8coP8NAk2UswR5WpUrO7uBuCuvskcMlGtimXq52d/HU3LeZhwsBpbxldA7yOi
 7D0/taqbSTGgf8ILXu4vMYC3jzegFIqxmaB4dmcfUxbngi6V8juDU38V8AdStfs00au7
 x6HziwBGXtmfZjOpIWgR3XUxo219Dv2LLsI/MPHLk6bxxsqs+6j9Wa+gd0R/+7dRa2wU
 xN4rooLwa3bFeAhNfFb3roFBFrFYe/7M6kQFso6m4u8ORiy60pIpTw30NU/PBpcWjCiO
 C+cLsXBT4WAVaYm+i3Z8YKIplUlou0/WiTXu+JdfUoxT/3iOlXD/m7aYP5ub+D91jEt1
 o87A==
X-Gm-Message-State: AOAM530WksHpkOtqDuFaO6JCqRNnZT9kIkkU0hDcfMqoF1AmpOv04lz7
 pLNRSQ1WYLhn/N3zslWv2dml6v7JJ1+yBPLSuss=
X-Received: by 2002:aa7:c406:: with SMTP id j6mr6310927edq.143.1596758594814; 
 Thu, 06 Aug 2020 17:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-16-clg@kaod.org>
In-Reply-To: <20200806132106.747414-16-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Aug 2020 00:03:02 +0000
Message-ID: <CACPK8XdW0nysvS99Su7edNN7vzxwvYgZJRQ=VGV073UEik3YGQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2 15/19] ftgmac100: Improve software reset
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CZ2vQEcy7n8o

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The software reset of the MAC needs a finer granularity. Not all
> registers are reseted and some setting in MACCR are kept.

'settings'

This makes the software reset incorrect, but the power on reset values
correct. Was that your goal?

If so, perhaps put that in the commit message.

>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Fixes: bd44300d1afc ("net: add FTGMAC100 support")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 987b843fabc4..0740049c5268 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -655,11 +655,10 @@ static void ftgmac100_reset(DeviceState *d)
>      s->itc =3D 0;
>      s->aptcr =3D 1;
>      s->dblac =3D 0x00022f00;
> -    s->revr =3D 0;
>      s->fear1 =3D 0;
>      s->tpafcr =3D 0xf1;
>
> -    s->maccr =3D 0;
> +    s->maccr &=3D FTGMAC100_MACCR_GIGA_MODE | FTGMAC100_MACCR_FAST_MODE;
>      s->phycr =3D 0;
>      s->phydata =3D 0;
>      s->fcr =3D 0x400;
> @@ -812,6 +811,7 @@ static void ftgmac100_write(void *opaque, hwaddr addr=
,
>      case FTGMAC100_MACCR: /* MAC Device control */
>          s->maccr =3D value;
>          if (value & FTGMAC100_MACCR_SW_RST) {
> +            /* TODO: rework software reset to have a finer granularity *=
/
>              ftgmac100_reset(DEVICE(s));
>          }
>
> --
> 2.25.4
>
