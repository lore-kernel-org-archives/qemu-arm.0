Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp107636lft;
        Tue, 28 Jun 2022 19:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uiAsvyPGbpAElrG6hxMbyDmfR2CP9bdTR+3V71Qrxkgr5uTzfvzcDx1eI2SK+7CCo0tJTB
X-Received: by 2002:a05:6214:d4f:b0:470:2d37:f2de with SMTP id 15-20020a0562140d4f00b004702d37f2demr5063233qvr.42.1656470519620;
        Tue, 28 Jun 2022 19:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656470519; cv=none;
        d=google.com; s=arc-20160816;
        b=dJ3ng2hUFZliGwUnS8YizQW/uTIXBoA04cAUfVXFuQ2FKOcwPOXY9kZYPTcHClNjXK
         BYbEYcq3f3wUa+k+1e8upuTcwLZ32+XnW3RyMI7KaHZOhYXlW+p1j2F1Wt8fiLC9tpyG
         C8TkWA9OaNdxixEH2004TNeYrRnTv5gf0OrN3gEuqO9qjxTY9OEPciB9G2N7W2hrboRK
         JRp9BJZAowOnfyFtYgtRHy112ZBcxUnPygrxVbChLB2PRQZRYH0B7kCjrDERlcAecxOS
         tpKha52ZLwmyn6kb616axu9fdGZuH+HSzydw/Y9aptU+9NtCuS7XgJKIDXtD77HhwG7l
         Yy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IsTzoEg0ClyrSbaDEK+7H2YPFmfHQJnBKASyXg2h31w=;
        b=ZEsb42fSIWqXF2YYaRHffvTMAV5k20vUpvPKxVZER/M7uZO1TkMnAd1o9Ll/GpM7i2
         CUu44Oju6ZzO2klLG2nHsBUhupOzde8sRxdchjCITgnVPWj8R8O1kRyLiMQiEx3nA31a
         pgvItAMBihxq3hoaAfp68OKyhEna6vlnVHwrWQ2AlWupVEfycsZ4BTpYNImaMq9RYIQ3
         N1Iq80wL/BA8qNfttl2htOCt+C3h4sROw3os3jjUY3ovsNTIVvfPwwHSgnCYRJRAgazL
         QPZ24hC0fqaiLy7uzxqQkbJivOZgoWGW1lD3AmaPrbF3rTCiDUolDbT96kmmqk5IPTL/
         oIsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=nk9g3PPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo24-20020a056214501800b004705951962bsi9251378qvb.553.2022.06.28.19.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 19:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=nk9g3PPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6NeR-0001SD-0l
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 22:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o6Ne5-0001RT-Vh; Tue, 28 Jun 2022 22:41:37 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o6Ne3-0001dN-E2; Tue, 28 Jun 2022 22:41:37 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n1so20229766wrg.12;
 Tue, 28 Jun 2022 19:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IsTzoEg0ClyrSbaDEK+7H2YPFmfHQJnBKASyXg2h31w=;
 b=nk9g3PPqSnK/cP/7B9nYtYFb6pxGDzQkOppS+jiLkTKUMX5Y65RwwPMRvq61azEKWS
 MFR03g2ExNA9JGaGhH2DzGOntNllyjIJAMg4mdfLeSVQuESGPF4/4gc1b+GHIIywQfuT
 qGl7inz2q2Y5RHHuWpF5oKJd/FvnW6O/eme+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IsTzoEg0ClyrSbaDEK+7H2YPFmfHQJnBKASyXg2h31w=;
 b=jzn4V23GLJfZnJfNQgNP9xkM7tZDm25Pj1EM+OS8Sq52yoQKlQ+5xadt6TzdyhIZ6m
 qR39DbJuxa879gHOmZAB7HhCZEHUUK6UdB6DzE8p56geLaq9mXm0KMEtyWOHOX+1IFxH
 FrVyiMGIr5OcMFfr8QLTTHBhnRJua323FsE9PZpQGLJeQM6mMP/LF5hn2QAufHXgd4Ep
 Orf06cfVttPMY161eKe5ksV3E6mV2xlm4L3Minrvvsatm42YnsP760zHGXWmKZ22IM5M
 T7neoDv5zPZYchUr3yRSZixDnOjaTHbvn7noTmiPUmRZ1cwaXyjnrU6sYi9GLHeVL5Df
 pWYg==
X-Gm-Message-State: AJIora8YBbDFiB3R5j8g1+vFDRKNnMSVz/FXae0jDPB4uzgzdBgMb3xz
 bS7huoZXoYsV2Iuz9oGRGA7yDezgtMRCcZj4sh8=
X-Received: by 2002:adf:e502:0:b0:21b:8de6:7f14 with SMTP id
 j2-20020adfe502000000b0021b8de67f14mr736560wrm.3.1656470492733; Tue, 28 Jun
 2022 19:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220628165512.1133590-1-clg@kaod.org>
In-Reply-To: <20220628165512.1133590-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jun 2022 02:41:20 +0000
Message-ID: <CACPK8Xd2Bx1dpJN38MkR_ZJnNJjygkcMCaLXxv+YP03EsF+V8A@mail.gmail.com>
Subject: Re: [PATCH] aspeed/smc: Fix potential overflow
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FTVBLug0IvK2

On Tue, 28 Jun 2022 at 16:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Coverity warns that "ssi_transfer(s->spi, 0U) << 8 * i" might overflow
> because the expression is evaluated using 32-bit arithmetic and then
> used in a context expecting a uint64_t.

Would it make sense to also place a limit on "size"?

assert(size < something)

>
> Fixes: Coverity CID 1487244
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index d2b1dde604e3..26640539ae64 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -490,7 +490,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, h=
waddr addr, unsigned size)
>      switch (aspeed_smc_flash_mode(fl)) {
>      case CTRL_USERMODE:
>          for (i =3D 0; i < size; i++) {
> -            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
> +            ret |=3D (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
>          }
>          break;
>      case CTRL_READMODE:
> @@ -499,7 +499,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, h=
waddr addr, unsigned size)
>          aspeed_smc_flash_setup(fl, addr);
>
>          for (i =3D 0; i < size; i++) {
> -            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
> +            ret |=3D (uint64_t) ssi_transfer(s->spi, 0x0) << (8 * i);
>          }
>
>          aspeed_smc_flash_unselect(fl);
> --
> 2.35.3
>
