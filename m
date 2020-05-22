Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2688363lfb;
        Fri, 22 May 2020 08:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye8llvUFzqNNRZO8SH6V0D3OacrnzZxDfPUMbU+8jkGAg88Tzi/YT5CuaxZG4V6tEfqx3t
X-Received: by 2002:a37:de16:: with SMTP id h22mr11743254qkj.195.1590162278217;
        Fri, 22 May 2020 08:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590162278; cv=none;
        d=google.com; s=arc-20160816;
        b=kdAclxkezBQU5uEYsY+gYH+sZ8vTszXMrSlmVyJCmjufWw9/oYmdvApmE2p2ZyKlPA
         lMSG8fjMWRGpxC/sk0OHW6YGG/lshyvvq5W+pFvyQq9uG8N6aarNA7+DHYDkH0oaSS3V
         Kl5YpGHR7ehrFxz5VIFeolm5HgQOp4h+Ks9yN7mpRmAwdK5sBvpiZDw3HIKFLe8UtCoJ
         pQWrszXqVTBqj1lPRLPcaYov9prUw/Kn+gdonWjDVCWZWUuc5INM9ate5SABDrOugkHM
         TQy/fbShez27sT0xMKO1IcEa++x5K48cTAHXlWv0ANSLnYlKLeq7NqCCbeCWWxwR+A6O
         dqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PC7ssX+ZFZ33aEp3xUpkKd5iG93Ot5l7HURqGdFeHfQ=;
        b=P6SzuWeaSVaMVebABi2dX+aHGm3hlFMqmZC2cpPlf3eTiD19Gg52qxHhiwZ0PIQDd0
         /zXVbTWkK2WWZJnuTk0b43P3xnP8rbODJZ16USXGNUJ3E7d3RLVY1BhBCjvL5LdqkY3H
         yukiEIRZwlfYfysGEX2PFwEtJ6GCmzyy/rgBNVqT7P/sX6NC0KmS6ekXi/lq1xiZsJGx
         J3oKh2I7GZaA45hotjaVIX99rRJP5pBntBM9R0ifXAqe6SYBeqbV6TbqCkuVd81NU+uj
         5mifkhJKMbwcWYlbriHQzuuir7oH8OOCVN7rM/PPa4xPsR+89P5Y6EKroSPBr/4Ec870
         32pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=a6AwITci;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d51si5347508qte.104.2020.05.22.08.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 08:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=a6AwITci;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc9qf-0006Yw-Ks
	for alex.bennee@linaro.org; Fri, 22 May 2020 11:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jc9q3-0004yk-0k; Fri, 22 May 2020 11:43:59 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jc9px-00081R-Ig; Fri, 22 May 2020 11:43:58 -0400
Received: by mail-io1-xd42.google.com with SMTP id q129so2667800iod.6;
 Fri, 22 May 2020 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PC7ssX+ZFZ33aEp3xUpkKd5iG93Ot5l7HURqGdFeHfQ=;
 b=a6AwITcidtwgAgQ+0aeKMHg8JLpzz5bTpIxk9xEMrVQfe9EgGk+Rqo+4UzE9qgEiWZ
 kX1TnOO7ekhdJOY+CnZxMU+Eqyn1qadsZ2iaWS2hplxLnG4lJaZ4hGN+OreVgl4jZVl0
 r6RefFFivAQxDqqA5JPRQDxjJsqHQq41QmA9Yc3nIlDj6aHsjwg34r+oBOI4Jmhbnnyx
 ZDX1+imDUxtv3CHVnU75+N2fYCk5JxTlROOYPLCJA/igDTXOcLjlCt/4lwh2ONghOGkI
 98p/fuYEn9fav8ZGU1LiepZ4oIzRGs7f1sFo8IVsv2GstfVmjUbMZhhcU5+7JrVhAsA2
 PFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PC7ssX+ZFZ33aEp3xUpkKd5iG93Ot5l7HURqGdFeHfQ=;
 b=q3c3nCUvbdkmGbZKv0vteeRkvKxboFJaZfXMBdJfxE76oqTeRkw8Z7JB2KvSrT1c00
 IVBCb6W+XLA3wcft0J3NpiOm4veM1xoYvyyXPtJw8uqtkgm5kIK4B3AH0Qiy1VUe+10P
 iPb7VAPW7U/4kbpd5RxizFo8/q49MuCi9XaR1b1LKYpU0ffBaJ2/f2vB8iD7JevspazK
 eWJAOJ94tL5ju+ptnJkNcdJMEE/I3ajERHApUTVh2naaYUkDozkesrL5hi0uLEhLYDfG
 vNTBEYNHvTu3DtXMtZ4ixInokqQ6O3SttFrsYwyvKKmFKHevPB6E59yGzIkW9qmwuQYZ
 NzWQ==
X-Gm-Message-State: AOAM532bG7MXsukeDSBoG/6LliwTIq9ksrYMCBjaVb94G4LQsJ/20kdt
 gMcRRJ4CT6I30nzt5AGUdfnQlUMgvKICywG8uEU=
X-Received: by 2002:a6b:8f82:: with SMTP id r124mr3681687iod.42.1590162231039; 
 Fri, 22 May 2020 08:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
 <20200522115036.31516-1-e.mikitas@gmail.com>
 <20200522115036.31516-2-e.mikitas@gmail.com>
In-Reply-To: <20200522115036.31516-2-e.mikitas@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 May 2020 08:34:53 -0700
Message-ID: <CAKmqyKOrNwjsLSAOjcj2jmcZftqAi6W-8whOwQ6nwnxC8wf-cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi/imx_spi: changed while statement to prevent
 underflow
To: Eden Mikitas <e.mikitas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_TEMPERROR=0.01,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDPH0eV3zCGg

On Fri, May 22, 2020 at 4:51 AM Eden Mikitas <e.mikitas@gmail.com> wrote:
>
> The while statement in question only checked if tx_burst is not 0.
> tx_burst is a signed int, which is assigned the value put by the
> guest driver in ECSPI_CONREG. The burst length can be anywhere
> between 1 and 4096, and since tx_burst is always decremented by 8
> it could possibly underflow, causing an infinite loop.
>
> Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/imx_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 2dd9a631e1..6fef5c7958 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -182,7 +182,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>
>          rx = 0;
>
> -        while (tx_burst) {
> +        while (tx_burst > 0) {
>              uint8_t byte = tx & 0xff;
>
>              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> --
> 2.17.1
>
>
