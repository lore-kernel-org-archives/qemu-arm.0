Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2127344lfy;
        Thu, 6 Aug 2020 16:51:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySx4qZE4T8Rs/qJgF9fDnxmeB/IFVAcMEPsh8AYPIYN2wvDKVPizHaZBtJml4zeZboac6L
X-Received: by 2002:a25:234a:: with SMTP id j71mr16537174ybj.504.1596757901998;
        Thu, 06 Aug 2020 16:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596757901; cv=none;
        d=google.com; s=arc-20160816;
        b=KPUykdFpxQ10mcuv443pmeja8IYFCgXHdRnMwQdJ4ndKiHJo8hNcxO1RER81O8jmE2
         WutuiAy4rKXbrYaqw8lUrJ17wDP2rAXGrEubxkbCf/C4EtyiuQ0YbwjGC0P5WDr/Q+s5
         ItzCK00IBCzhCiDuWGvTHlmyEmz52Z2dGek3ykTo8IWTyunhEmG7JCNndpftDHyOFZRn
         6BmykVOymA7QP3fDT9T5Q3n3Ohr1CC68hRme8FuJBj3Oc0tvrDnTiI1t2wfu2n34ZFOd
         +iCnXsBoHfp8f1buQjf7siGvqlmFqqqOkIW5gzdtVE/pXz8cQcks3Sq35XCopLtWjujL
         s7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yhkYD6jNFI1oia6iMO0Anl2+YSRaapDxeQ9aaFom5pk=;
        b=G2yb7WvjoxRt6KXamP6T9XxmhinsvcUWiNT7+HQV2zfWePxJvVUNaR6siTDHmJMoKd
         fjrg7LcawvRbCsy7QqbR+xm37YVzQXdvKRS9dgjR+IiFGPSVreNIF1JWGnwNmQpc4QKa
         9Ws+rfDlZ9nCs8hdfyCyOSrphwBP+FTn2yl3UbMvTOLLFf1+3oG3kg7I5ioYigc8AvcV
         G1wt0+CF1/j1lJ0mauai066lkncMb6ShMSfxBvKm1NB4eXPbViEh/LkJuTxXYCN0OCJ7
         fRIQwvWvIMixEt3NxTGLWVJu1sP1wjSNUUHf3zxx0U8SilrFIj+yRDIumYHuzX+PRLUg
         uVug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=kNCjceR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si7444090ybt.336.2020.08.06.16.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 16:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=kNCjceR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3pfh-0000qR-8u
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 19:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pfJ-0000pT-LN; Thu, 06 Aug 2020 19:51:17 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pfI-0004xo-6u; Thu, 06 Aug 2020 19:51:17 -0400
Received: by mail-ej1-x643.google.com with SMTP id l4so139758ejd.13;
 Thu, 06 Aug 2020 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yhkYD6jNFI1oia6iMO0Anl2+YSRaapDxeQ9aaFom5pk=;
 b=kNCjceR6EPcGdSpwr2fvgeuwaRGK9efwwUYSiD8oyvl9Fwfly+jB9YXFL/4ndSpxgI
 iVdF7A4giFCF2bYDp/EGkIzLbOy0wr4+ZSdlJ0KiBuanE6facd1VWo3NW0gKx6MW25j+
 GGs3huX9/GsYEnZC24oxTo+GxjoJUwIfXFPVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yhkYD6jNFI1oia6iMO0Anl2+YSRaapDxeQ9aaFom5pk=;
 b=Az8qstLUS4Lk1UYbjKqX7CXo4hVViJrDezmWswJf4nFOB+fKzqaU3fYpl+sc29XgDy
 jMcik0pnR3FGirtoW96tyxtNI5l8Vov3X67HSxNpPG8BHd8G6GpAAejmAkz1Utn+KMfM
 axJbdz4XJLk6I5mcBVubvJROxOBHtSOmwO7/SLe6Du58RQkUzgBp6EbfZOPOj9Bo0CfD
 y71RZ/QojTsCeyYiDlVTPnPhT+Y2nPkQlmQKJzug6jVyfPth5oKAMLd5mD9w9CQdWpPA
 5SBXGlxexqM19HgxYR1I6lQbQtC2lPdOO9+wybD6jyX7GMcxhgyceX8v91wob5G/LEM+
 LhIQ==
X-Gm-Message-State: AOAM532WDZNW0TPXOwK/TP1tjeSJbol57x+qSUaw2x1P8tDeiQWNbMTy
 BNG41TT6UhLvczaLG1syCsKi/kCelNjdeWibulQ=
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr7047421ejz.108.1596757873675; 
 Thu, 06 Aug 2020 16:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-13-clg@kaod.org>
In-Reply-To: <20200806132106.747414-13-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 23:51:01 +0000
Message-ID: <CACPK8XdUOhLVDxjBJoAZmOxGafsHhajyhb1jXiVvY8BqqTxNQw@mail.gmail.com>
Subject: Re: [PATCH for-5.2 12/19] ftgmac100: Change interrupt status when a
 DMA error occurs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x643.google.com
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
X-TUID: fvnj49G48ZZT

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The model uses today the "No transmit buffer unavailable" interrupt
> status which it is not appropriate. According to the Aspeed specs, no
> interrupts are raised in that case. An "AHB error" status seems like a
> better modeling choice for all implementations since it is covered by
> the Linux kernel.

The datasheet calls it this:

 NPTXBUF UNAVA: Normal priority transmit buffer unavailable

Perhaps we should say this:

The model uses today the "Normal priority transmit buffer unavailable"
interrupt status which is not appropriate.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 5c0fe2d8cb75..014980d30aca 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -517,7 +517,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32=
_t tx_ring,
>          if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ =
0x%x\n",
>                            __func__, bd.des3);
> -            s->isr |=3D FTGMAC100_INT_NO_NPTXBUF;
> +            s->isr |=3D FTGMAC100_INT_AHB_ERR;
>              break;
>          }
>
> --
> 2.25.4
>
