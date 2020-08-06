Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2126777lfy;
        Thu, 6 Aug 2020 16:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr9K/LEWyexlD94Frj986nnKiusPSBti46lwzz4txki0WI18rooST7xnsFL9qYxtyEYIyQ
X-Received: by 2002:a25:61c7:: with SMTP id v190mr15258535ybb.168.1596757830382;
        Thu, 06 Aug 2020 16:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596757830; cv=none;
        d=google.com; s=arc-20160816;
        b=YhbzbdCYnFocHtff7kGZD5OnfFgX1PTRD8pPHXyRN6iezUkGdJQQMFyjb/951/YUyc
         3v5XZUZ35PyPrneapo2WmPOc/u33ZX4xxmxOiSgOUyifoDjlmFk6ERWp8V4jGlrOnk7e
         4dnnzApKwC/HBa/rcCxt2578gjLjqiwLoP8ALF69DBTSpnpnLZr/RWELJrzWiP0+7ItU
         nkJuhWmipMm+BQ/WZcjLOgZziDrok+MdwJ3IRSfqiiZnek90WGBdxcfOw2BrH5R0FWSX
         x5GhXwRIajZFjZGl5eVEDREAtVGDssFSihBpRpUdbhtxRtY4NMIjamiSeGJwHGdGicmY
         be9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gC87vBsUsvMkWV5AOgd6HXISOv8B5xWjWIbBBoAT/5E=;
        b=bbxwkgAz4LkQ23rldkLD6BGq6W9x7QGgUMi0SwMa/OxaZ6K1LI9hkKqM8aK4idiBAD
         +CM3/s9cbG/FAfb/mqXrJyXveY8u9My8GZvz8nLZmob7UE1RJUR0Hv5B0wkmF39uazvS
         dkepvxc6BKuFh9gp809j9ZIKeQfK2Uc8GJ1MDjI+CGLZe2saEHM2esnL+FT4dcTGUrE/
         ZpI3pUKN8SRF6y0X7EhZQW38syWI6zOsW69GXyIPNI7bfQJI7mQ80mPqYc+D1orMPErq
         OMDZVMxg7dZJRaVlhRxQDjTXnDEv1uAwlTIGLU5Acz06B2FRntdr4vOCKjCrJDYt59KU
         awAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=QB41AFds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si7881612ybt.216.2020.08.06.16.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 16:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=QB41AFds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3peX-00007G-NK
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 19:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pcV-0007vY-30; Thu, 06 Aug 2020 19:48:23 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pcT-0004eh-K8; Thu, 06 Aug 2020 19:48:22 -0400
Received: by mail-ed1-x542.google.com with SMTP id q4so33173799edv.13;
 Thu, 06 Aug 2020 16:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gC87vBsUsvMkWV5AOgd6HXISOv8B5xWjWIbBBoAT/5E=;
 b=QB41AFdsQUVAwcUYFqyiWg2UpLXbQ955MbVBOk2v4ziZ9g6sCWwVlYG1kzwRrRCFlZ
 +qWWNi8x8GOxJGOW7EpjhEZxVmTy6MXJqWrFOdWmJ1+12t5SU/ZGrdCWAS9ulosvuiow
 gEFnmUZ7mZ9mliKNl/ymqUbW+lLZ1Lg9EvKns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gC87vBsUsvMkWV5AOgd6HXISOv8B5xWjWIbBBoAT/5E=;
 b=cJAnSKtcQ2es9G9wcNS6aYuXRe3kJrxBRgHR+aPOt9uTwhjoVN9iKnTtAm5ybqYsV4
 vFI9gUrE/fxJ7EROsqjCiaHJ6cFnjPmd5Wn9BTAQAe98Xz3SvL682B2JeIJfd4fJZUeS
 8K6yWmTxlYNPX4ht6fKM2WCMETj/JfbF5sq2M0+J3vvZOYzmzi6OOJ2lqK6J0Udl66bF
 bZ4bxQ+gQ4DQr67Tnj9wo8ecIkugyIbaOVAmMg/VA1acQhI0i73822udS6fNmdW4A6DS
 qP48UGysqjJpnyDH3/I2YdLXMU5I6F4TJqkhzQ8MThGvcgBVFSEjh1M31OII/xjd/ykI
 mKJA==
X-Gm-Message-State: AOAM53046/VD97wt6ntHj43LZmi3TyILyxviVwX7dCUobcEJRPk0AS3H
 U/kfg9jgKywxanJjBA5pvxb4CY5wcuqIz8O39mI=
X-Received: by 2002:aa7:dc02:: with SMTP id b2mr6266764edu.260.1596757699375; 
 Thu, 06 Aug 2020 16:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-12-clg@kaod.org>
In-Reply-To: <20200806132106.747414-12-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 23:48:07 +0000
Message-ID: <CACPK8XcpXWPLhj7aCiJkDK+2iqEvwA1Mh2+d0a77TxJg_u1opw@mail.gmail.com>
Subject: Re: [PATCH for-5.2 11/19] ftgmac100: Fix interrupt status "Packet
 moved to RX FIFO"
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x542.google.com
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
X-TUID: ARhr9K7dgmj0

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> As we don't model the RX or TX FIFO, raise the "Packet moved to RX
> FIFO" interrupt status bit as soon as we are handling a RX packet.
>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/net/ftgmac100.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index aa3c05ef9882..5c0fe2d8cb75 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -950,6 +950,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, =
const uint8_t *buf,
>          break;
>      }
>
> +    s->isr |=3D FTGMAC100_INT_RPKT_FIFO;
>      addr =3D s->rx_descriptor;
>      while (size > 0) {
>          if (!ftgmac100_can_receive(nc)) {
> @@ -1001,8 +1002,6 @@ static ssize_t ftgmac100_receive(NetClientState *nc=
, const uint8_t *buf,
>              /* Last buffer in frame.  */
>              bd.des0 |=3D flags | FTGMAC100_RXDES0_LRS;
>              s->isr |=3D FTGMAC100_INT_RPKT_BUF;
> -        } else {
> -            s->isr |=3D FTGMAC100_INT_RPKT_FIFO;
>          }
>          ftgmac100_write_bd(&bd, addr);
>          if (bd.des0 & s->rxdes0_edorr) {
> --
> 2.25.4
>
