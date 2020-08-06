Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2127805lfy;
        Thu, 6 Aug 2020 16:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzynUnhEWM5hl6vd5IKVoauMlzT1yvK+1bNM0FZQXJXEM043reRwhMcT8RNXZ+4zIFuVVem
X-Received: by 2002:a25:5105:: with SMTP id f5mr17729733ybb.262.1596757952564;
        Thu, 06 Aug 2020 16:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596757952; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtBPvcCEWW1D2JKL4f9sJdJ5wD8+r2s37xf0ip3aVTJFNxy/8CiM8/bMKphBs8ka2h
         syfaUxKzalJ7exP4XJm4tBi3xTTfaxj0EUgcQjbqM4oRE3wEzovBS3IhC8HzW5PIkGN7
         fZS3lE85HKWW25Gbo2N9t7cpUSQ98qyqHDvfJCgXh5jsvOMWTeaPG6GE3F7Mr5MC/jP7
         e8uObp2LdnfUyyGbSyWebrIICftXa3fqGd3z37WNhBA8qFufx7DlV9p2ZC2i5Se56syl
         V20Ob/A64trri/yJ/H5itj/ydx9kb4k+AfBDqV7NXvMAXLqV2vsnMnS2Dc7CAlV6l5W9
         K6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=d+9pBZZwPa0pV77+wNPY0Un0t5VNfMN9t4dWRP7btB0=;
        b=pks4VQcxym7ti9VHrxWPH27VUcw0RTpnXfCOWip0zwiDdSyqtA8nulyICjWQE0EnXA
         zpu0CKcGwnL92rZ6BB6Zoo3nae9ZhZTt+h46j2bO0EGNC5GTHkHOzclj17MHXqitD3lJ
         5awrL7KvuTMq+vDlWZvlpFDtPrDPhU8O/OCrKhYj7zYfr6PBL28MTGMPxjCf+ugZdeTe
         S/fZ5UoiovjsDTS48HyCM7SL2/V5cT4QYy5kSJ0TtDrIyW7xExxwxlzGGHAN9gFkfXJl
         2hhYUTCl0y1dRjmhqpXkPNZMZgzrInDPnoY2bA5Wda+CO3pu7J4tUycbJUzJsT+1KRT7
         BFzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="D3N/ufOp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o85si6234954yba.140.2020.08.06.16.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 16:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b="D3N/ufOp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3pgV-0001HE-Nd
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 19:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pfw-0001Ga-N4; Thu, 06 Aug 2020 19:51:56 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pfv-00050q-0J; Thu, 06 Aug 2020 19:51:56 -0400
Received: by mail-ej1-x643.google.com with SMTP id f24so170746ejx.6;
 Thu, 06 Aug 2020 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d+9pBZZwPa0pV77+wNPY0Un0t5VNfMN9t4dWRP7btB0=;
 b=D3N/ufOpiYAQHcaWoKDlV+6OaIu3LAhP3wfT+QMvgxFTwgi3MqUXU7sTXp0Wr5Q2vh
 VwAJfMu7APpMIZAgz9SPKK6l9t/vin6zT9TfMN6c0/YxAjw+Cw7cweFwBpbxpKSn7GD3
 HY09XV1Q+qW61i0sBQL0li3q3dk3l8GC7IPKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d+9pBZZwPa0pV77+wNPY0Un0t5VNfMN9t4dWRP7btB0=;
 b=AylEoxM5dSmX9lz7gyQJJTnFxpQoRSYiuUjQmC52dDqv6SDUfBNcy4RoTflrVUpNYR
 dL2PVFVHcWyDG3zDmNuolgFFvbUDCW1t6IJt19iqktLVx118KLoo6sihHOAS9pez2mLz
 iJ8b6YazkiD9zLC9PIhhsn+sJFfPMx2IhQjEuD/kNYHMvg+QmF+SFlXTyGwxEv8J9OUp
 NCELh0TuQPF1sDcW3ZCMkVrzYkXds8M/d5ni9VM6SQ+LCxxjwWZ8oGVuvdz/eYM1c2ta
 6vMxPj5kQmUe/S3nY8986inu96s4rcAfFN6aPFByXDY2ZF47/ggb9k2CPnNwn9Cs2pkk
 ebkg==
X-Gm-Message-State: AOAM531k7zO2xYu2/9bAxELSJoN94uDKLynMRbCtlX3LcUO3kfwK7lzh
 ngGOseJupGbR0GlgEm4if6yY7Q8SckFsI1zQ5kI=
X-Received: by 2002:a17:906:4ec3:: with SMTP id
 i3mr6634458ejv.215.1596757913041; 
 Thu, 06 Aug 2020 16:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-14-clg@kaod.org>
In-Reply-To: <20200806132106.747414-14-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 23:51:41 +0000
Message-ID: <CACPK8XeB=G12CyJNm5Zt7F6NGfq-fX8MgZMOXLgm7yNFHDJBvA@mail.gmail.com>
Subject: Re: [PATCH for-5.2 13/19] ftgmac100: Check for invalid len and
 address before doing a DMA transfer
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
X-TUID: DoT5i8cLVtrl

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> According to the Aspeed specs, no interrupts are raised in that case
> but a "Tx-packets lost" status seems like a good modeling choice for
> all implementations. It is covered by the Linux kernel.
>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/net/ftgmac100.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 014980d30aca..280aa3d3a1e2 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -507,6 +507,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint3=
2_t tx_ring,
>          }
>
>          len =3D FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
> +        if (!len) {
> +            /*
> +             * 0 is an invalid size, however the HW does not raise any
> +             * interrupt. Flag an error because the guest is buggy.
> +             */
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid segment size\n",
> +                          __func__);
> +        }
> +
>          if (frame_size + len > sizeof(s->frame)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes=
\n",
>                            __func__, len);
> --
> 2.25.4
>
