Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1535319ejc;
        Tue, 26 Sep 2023 19:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZjsshz9JymDa9peWBVdvPjy3rN5TUG3R4jvCfMFWGJ5UxCaOrd742Fkh4fQyXFy9PIXYH
X-Received: by 2002:a05:620a:4693:b0:76c:ba9d:3ec7 with SMTP id bq19-20020a05620a469300b0076cba9d3ec7mr663698qkb.6.1695782338437;
        Tue, 26 Sep 2023 19:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695782338; cv=none;
        d=google.com; s=arc-20160816;
        b=SniqbJX9OrL9bkYNG+ln/f4YCDeQJ32xADSLUy7cWXI3sHLtE18vXPI7+DSfaRl4Ym
         0AUAIx8lSnX/cYFLhbLKEbTOO2c+Q5Kn/BUn5WPnWqe4K3nWnScgK8G3Cf5AICfOGTbs
         xODi5xo9r5Kedewjsw4YC9IBa8NxJ2Dldq08NWsEVjTWUSLcyHleSc3RsvugdEBO+LjV
         LJQpPSO2XTTsK2QWM5m3osG9EWmXSv6JxBkQpUFFP8RJG3oJPdW83I6jlyKG7wK4oFvo
         YRIaM6vCQHXv31Wk5986dN+UMAIxKzIFJLRRl7BkDXqQzKhddUFrBhche3PHkW3o+S7o
         wb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7WR6vHIEEVdIjBC3pWufmBrSu+xygCKsI+r8KdJjQaA=;
        fh=VJHO+ZF9zJOg7sVJfAOOd1ubBud4pfT6yOmJd98zMjo=;
        b=W/TRVv6jqJvZrS12sEiQNEb+tmnNVH7DsYfwwcUgRTeEfCzea3Q2kW847K5Cio8Pnw
         zRkiTJq4AtdwLaCySUZk66fkSTDb8a2roqUr9hKRAtCbUcfnudmL0sn95v+Kal3NftR6
         nKzdTheO7dFAPDA25nWNiM9uKi24+2PrN2qx1FYo9DicW1Z6cKNFoJ3MymIw/16fi6QQ
         6KYJ6RbeeGScjx+9Mrw1jPu2h/arp56s+HXNyF6xYO7q2rwg3aBTAOqOmKkcWY6bS1JX
         iOpTUEMmJjDhOzcIEuJbkT9TTAkiDWtdvbyWYeE8a8x8QvyADQVvexQAfckmH17af3cT
         ZwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=GZkc2+6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05620a288a00b0076db12d14c2si7735152qkp.719.2023.09.26.19.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 19:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=GZkc2+6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlKRe-0004wG-I1; Tue, 26 Sep 2023 22:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qlKRd-0004w3-IY; Tue, 26 Sep 2023 22:38:33 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qlKRX-00020m-PL; Tue, 26 Sep 2023 22:38:33 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so168429511fa.2; 
 Tue, 26 Sep 2023 19:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1695782305; x=1696387105; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WR6vHIEEVdIjBC3pWufmBrSu+xygCKsI+r8KdJjQaA=;
 b=GZkc2+6gb2I3aa97m42ii5wtL1rjory7z+gcQ2h2s3uqnmCERHIB40wEb+FeX42VdS
 FdDT7GcjS/xfJZZ4z4I/Ba2C5Py1GtxL+QRkAZ/UTa2f5zflJ66F+vfZJCiJdTXxPUlC
 h2A0fZu3BbOVwhDK7vl96I0gSTaKeQcWC/SOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695782305; x=1696387105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7WR6vHIEEVdIjBC3pWufmBrSu+xygCKsI+r8KdJjQaA=;
 b=nxGWqtKANXuGRlP36N6Vp+Z+QeZL9mS4XazAn1eR1tG5IXsgqx949hpi/31sasrmQ5
 IbFZa6QAfeRlcZVGVpPWApQB+JzMaEK/Bl1kYZpV5GlTr+mGgEQaJn0tK7O5w/7gAG1Q
 vuMMSTIAsoT7VizxsNyuJFoZFQ+1iFQJelXWMPc0MxbHfir3cz+GbKAe55Q8G7Ude5lb
 4RPF7mpLDp9XCGNDEVqoD/aG6WCwE2n9+vZRAmRpmXMy1IpzPzfOIbl1d6KWZVPpmNRA
 mFgeugsZxdZHbDMDsSEpt5fzsXdxPL4a2p3denQLclm/DlLNBBIFFte1ExE/q2akmTkm
 /D1w==
X-Gm-Message-State: AOJu0Yx13IchNfVAqx734sqhJINS8a+LHPF4ysHcjhDOtey4WrTV75M0
 EoQIppBy4qZ+jxOD6bUZ0UvlQIRpYFoZmyM7E/s=
X-Received: by 2002:a2e:b606:0:b0:2bc:c3ad:f418 with SMTP id
 r6-20020a2eb606000000b002bcc3adf418mr720730ljn.20.1695782305252; Tue, 26 Sep
 2023 19:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230922155924.1172019-1-clg@kaod.org>
 <20230922155924.1172019-2-clg@kaod.org>
In-Reply-To: <20230922155924.1172019-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:38:14 +0000
Message-ID: <CACPK8XdzL9EJ+v6KKsfRvX6x5bVnevVtTmdjM_w22p6gH8oXKQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] aspeed/i2c: Clean up local variable shadowing
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=joel.stan@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u/rD5j+JR+58

On Fri, 22 Sept 2023 at 15:59, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Remove superfluous local 'data' variable and use the one define at the
> top of the routine. This fixes :
>
>   ../hw/i2c/aspeed_i2c.c: In function =E2=80=98aspeed_i2c_bus_recv=E2=80=
=99:
>   ../hw/i2c/aspeed_i2c.c:315:17: warning: declaration of =E2=80=98data=E2=
=80=99 shadows a previous local [-Wshadow=3Dcompatible-local]
>     315 |         uint8_t data;
>         |                 ^~~~
>   ../hw/i2c/aspeed_i2c.c:288:13: note: shadowed declaration is here
>     288 |     uint8_t data;
>         |             ^~~~
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

messy.

> ---
>  hw/i2c/aspeed_i2c.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 7275d40749a9..1037c22b2f79 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -312,7 +312,6 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
>          SHARED_ARRAY_FIELD_DP32(bus->regs, reg_pool_ctrl, RX_COUNT, i & =
0xff);
>          SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, RX_BUFF_EN, 0);
>      } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)) {
> -        uint8_t data;
>          /* In new mode, clear how many bytes we RXed */
>          if (aspeed_i2c_is_new_mode(bus->controller)) {
>              ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, RX_LEN, 0);
> --
> 2.41.0
>
