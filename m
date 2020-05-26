Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp302565lfc;
        Tue, 26 May 2020 09:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu9pqz9xhK4T+9qVg+95f0TWyAAF9nwwDOA+JEm0If+lPqpbmahfDD2dDv4ob8HQ3fF4Lp
X-Received: by 2002:a25:82:: with SMTP id 124mr3477275yba.476.1590512224529;
        Tue, 26 May 2020 09:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590512224; cv=none;
        d=google.com; s=arc-20160816;
        b=S/6L06XAnsZyeFO2SOe0mLKPVavUdkE9O9Fvn2lXsURhLW5BsCLJLEiARJXX85iL8T
         2hekQX12mlBZ1fYr8cDYlmiqQuVPJnEPe4RP1ByHP+u5Pm9D6HSrrrAgI0jHMebQEsD6
         rxV9yPe3cvQcnDZ5iK1Sreh+BmBggIcutDUW0fjN86hsdQUkdmNtlfvEzYoEP6yc2Fqm
         XcnzvREqyC7G/kzPnAPPccE1IQ9f7uo3BwosN/4+tZdCR2Nhmt16MJ8gWM/JBBTLpFaw
         o65iCTE+tKU/kLu1mECvltgxDrVPcRTCjyrwVtZlx5IAjVUOXI7pFg/SqlRSWg7hAiwS
         5Htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=c99aHn7ARxhEy/7aKLvR6O5sUhHQpgUNKQAiS/hog2c=;
        b=cM/etTG6QcByr7DklO9D4TrwpNtnnAua52WQtcQj78pZwDbUJVkNwhaoEL2tDE7vrd
         I4jUVBaUxouUk0saNIRR4zrj65Miw0jwxrIpHDYsBYCISQrqchHdoqB1eqzuv7qMYHyl
         RTSOx4mxHGXxCz590wig12lu6KsopnT4VQKUMc+12KodNmhNCIwrUNfmvlGkWFqJvNdx
         1vkX6fC53x+IFshtx8mjSKteGKEgB1OBU0ahV1OWCED282GYBfuoN02q1yfqmcPbSBwi
         M7qMbBUoE6+5d1dP8i34+x7GWoZXVbr0HhDFcG/d+qpmhNkNKXdtq3jn8gWqX6QvbMR8
         fd/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Av0d9lQx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si472263ybj.143.2020.05.26.09.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 09:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Av0d9lQx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdcsx-0002lC-RU
	for alex.bennee@linaro.org; Tue, 26 May 2020 12:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdcrj-0000Ru-C1; Tue, 26 May 2020 12:55:47 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jdcri-00037h-5Q; Tue, 26 May 2020 12:55:46 -0400
Received: by mail-io1-xd44.google.com with SMTP id j8so22736109iog.13;
 Tue, 26 May 2020 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c99aHn7ARxhEy/7aKLvR6O5sUhHQpgUNKQAiS/hog2c=;
 b=Av0d9lQx0qngdzjXS2n9oefHKZtg0qpGrQqaMnR1MrwWwpCtbiCRzZu5Db25kxJBf5
 mjaZMCQ9UB7SVkdeUJqcGz3tybciybBRxyHmyRuQcLSVMhXyN9Y1E79RnhsZfNuSchU4
 8i1/kDUImULY35vC/aRBppSaeUGQm2GxDmNFQDV5O2XGiKK1nAbvB/Jck4dYkOl5LkN+
 5W23cHQ6NXegmQyAB20b1hdS2Fwu/4xy48CWaEdzh9gDxRZaOwhricqV8t+m0jhsq8Rx
 5xoAzIMAgvEpZ3VmNtWxOk6JlBahAHWerMpGct5SYBuoFCLEB5Rg0Y8D1mdQZM+jS13d
 SlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c99aHn7ARxhEy/7aKLvR6O5sUhHQpgUNKQAiS/hog2c=;
 b=pCw0NIb7Jp3AiSq5npvQB+C8R8SAQ0WjMN8QrhBN/uMt1FrG500j292ghw2KT2dfqg
 uSZPUYFNJsckhCAQMnfUGAovJGJx1f5y0psWdSnpKC9RQMXZRFF9LWGeDnPAD0fjdkPP
 NcX9cPfBJxpmgxsArNNB7zIe26P1CS5Qg72GoI368NcaPvZFvjEigYqrb2olS82ILa6j
 rXbO0Hgn3vUnvzshrstVSskJsBeHxwVxS6BcKmYrQoFgm5u7eahBrCdMoebSQ23rjP+i
 yXBTUYtmRY/I7xgUxFH2fQiZivazibdbGjiI3mOhJOVgdEaJ+Fw8iHryz2HxZy2CFNgQ
 Sc4g==
X-Gm-Message-State: AOAM533+pCUDPyQJc8ETRnenvc/cNppwPiuTDma5ce3zhCfBPpkkdmKm
 ka3aTUmAn5Q1jg4NrXsqueI3e+GKwaBzNvPESU8=
X-Received: by 2002:a05:6638:dd3:: with SMTP id
 m19mr1959002jaj.106.1590512143958; 
 Tue, 26 May 2020 09:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-7-f4bug@amsat.org>
In-Reply-To: <20200526062252.19852-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 09:46:43 -0700
Message-ID: <CAKmqyKN318+wJy63ntVnm2e98VQ1s+Yj6kz3FdASE858vUApyA@mail.gmail.com>
Subject: Re: [PATCH 06/14] hw/display/cirrus_vga: Convert debug printf() to
 trace event
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TWoro14S6KKa

On Mon, May 25, 2020 at 11:25 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Convert the final bit of DEBUG_BITBLT to a tracepoint.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/cirrus_vga.c | 24 ++++++++++--------------
>  hw/display/trace-events |  1 +
>  2 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 76e2dc5bb6..92c197cdde 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -53,7 +53,6 @@
>   */
>
>  //#define DEBUG_CIRRUS
> -//#define DEBUG_BITBLT
>
>  /***************************************
>   *
> @@ -950,19 +949,16 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
>      s->cirrus_blt_dstaddr &=3D s->cirrus_addr_mask;
>      s->cirrus_blt_srcaddr &=3D s->cirrus_addr_mask;
>
> -#ifdef DEBUG_BITBLT
> -    printf("rop=3D0x%02x mode=3D0x%02x modeext=3D0x%02x w=3D%d h=3D%d dp=
itch=3D%d spitch=3D%d daddr=3D0x%08x saddr=3D0x%08x writemask=3D0x%02x\n",
> -           blt_rop,
> -           s->cirrus_blt_mode,
> -           s->cirrus_blt_modeext,
> -           s->cirrus_blt_width,
> -           s->cirrus_blt_height,
> -           s->cirrus_blt_dstpitch,
> -           s->cirrus_blt_srcpitch,
> -           s->cirrus_blt_dstaddr,
> -           s->cirrus_blt_srcaddr,
> -           s->vga.gr[0x2f]);
> -#endif
> +    trace_vga_cirrus_bitblt_start(blt_rop,
> +                                  s->cirrus_blt_mode,
> +                                  s->cirrus_blt_modeext,
> +                                  s->cirrus_blt_width,
> +                                  s->cirrus_blt_height,
> +                                  s->cirrus_blt_dstpitch,
> +                                  s->cirrus_blt_srcpitch,
> +                                  s->cirrus_blt_dstaddr,
> +                                  s->cirrus_blt_srcaddr,
> +                                  s->vga.gr[0x2f]);
>
>      switch (s->cirrus_blt_mode & CIRRUS_BLTMODE_PIXELWIDTHMASK) {
>      case CIRRUS_BLTMODE_PIXELWIDTH8:
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index c3043e4ced..bb089a5f5e 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -134,6 +134,7 @@ vga_cirrus_read_io(uint32_t addr, uint32_t val) "addr=
 0x%x, val 0x%x"
>  vga_cirrus_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
>  vga_cirrus_write_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x=
%x"
>  vga_cirrus_write_gr(uint8_t index, uint8_t val) "GR addr 0x%02x, val 0x%=
02x"
> +vga_cirrus_bitblt_start(uint8_t blt_rop, uint8_t blt_mode, uint8_t blt_m=
odeext, int blt_width, int blt_height, int blt_dstpitch, int blt_srcpitch, =
uint32_t blt_dstaddr, uint32_t blt_srcaddr, uint8_t gr_val) "rop=3D0x%02x m=
ode=3D0x%02x modeext=3D0x%02x w=3D%d h=3D%d dpitch=3D%d spitch=3D%d daddr=
=3D0x%08"PRIx32" saddr=3D0x%08"PRIx32" writemask=3D0x%02x"
>
>  # sii9022.c
>  sii9022_read_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
> --
> 2.21.3
>
>
