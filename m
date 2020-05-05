Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp375169lfb;
        Tue, 5 May 2020 13:06:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypJSlfhoUn6Al4d/C/qeTpbMLAs0+Q1zx0x/PFhacEeKQEnPN/NOol0VCGWoyf9D+4jAsuqG
X-Received: by 2002:a0c:fcc5:: with SMTP id i5mr4564756qvq.14.1588709179322;
        Tue, 05 May 2020 13:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588709179; cv=none;
        d=google.com; s=arc-20160816;
        b=KCBCfMCJ44Czbn5T/C6q5Sy8GruEM/eyfdSxMX5xKZcoFOMvPaitVux09glyRrShuv
         JoOD6SDkudwDn3sRhcL4mzuoG1SrO46KvxqWYLXIS0nunwPzqMCuN2oTdQGyoQKQ0F8r
         P2/PRTRIm6UvcVouhFKvPxpj+6t3bJsAIJr77noXB9tE6Rlq3RelrQ4fmcRbz4Tn/j46
         M1QHvtijPHdq1I8t6R4fKpcEImNURt0AV7EZtp3pOz9Z8hNH8DfmT+CYz1bW3EG1K3eG
         BkgZmBko6yRKno2xYe3ZogIsmFCK2Ui586ITv9mo//P1BT7d7ipsqcMhw1FZN7utVIOv
         P/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtj2we7KH3HvnMoW35RtDJPYL8qTvt82pQ++4qEa2tA=;
        b=c7x5UN6n8X1jMr71TyNX2zq8dAR76XOqAJflqueir/uBgqcARgeh6P5oOUpBtFp+2b
         EWtqevRdVSCZll6bbfJFNKGB/TWw6Wokz3Oy6ENERFwhhLlfnR/iLtl1NltaZFL/Otu0
         WsXHmUaYucpZSMMPwnWi8rAeplSYsLOaqTI0x0kA4b6jsDvJDEC+dEC2k+aitM+ODo68
         SqaLYot1vq4K04d2e5IL20tkP++6/VXFTaR4gSf6Luics82XAOiaW+NAZT45ezCLmtjQ
         U8NnLG/BnnavOvZvz/I1CRi/e5+W4h0ny4StB2WGlOZsJI9RSu1yU5odP+rLCIW9+CYG
         OOLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z5sEqTB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a23si1631339qtw.226.2020.05.05.13.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 13:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z5sEqTB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jW3pa-0007zb-NE
	for alex.bennee@linaro.org; Tue, 05 May 2020 16:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jW3pP-0007xi-GO; Tue, 05 May 2020 16:06:07 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:36448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jW3pM-00033F-82; Tue, 05 May 2020 16:06:07 -0400
Received: by mail-il1-x143.google.com with SMTP id c16so26373ilr.3;
 Tue, 05 May 2020 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtj2we7KH3HvnMoW35RtDJPYL8qTvt82pQ++4qEa2tA=;
 b=Z5sEqTB+UTWDlKdTVZJHCB0e3hIsmE5OgwBXJjuPPlENpNJUSmdMILv/fOAwIRzoMk
 wqJ9j5ta7prQU+d82hKQjv0BvtaAkaCvuFUauVX4X4hJUx0Pa0k0LiC3amXJFKQJHybC
 bvi3T5SdQ+yHGyU1jqXyEH4sFCUJSwtg/lVPH95yw85oi3fn04XQYvZFDleGknxHhZZ3
 yaUpqYaY53AAez6oeZRZGl68vKlPq1SJXeirJZ0VxwquAW/EjcwgRzVBNYRq+S7LkBY6
 Oei7iPUBkPWdYuoahIze5RefCWIRpwKWv3TLTi9bWQy7r8veKxkSvZC0//fmlre0YUCH
 h2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtj2we7KH3HvnMoW35RtDJPYL8qTvt82pQ++4qEa2tA=;
 b=jd1poCg5pWDYV7rLJYOs/VMw9vM6LSRemPJS/eoDA/zwA805PK7fVQ8//rmd5oW2GT
 qaXId93FU0nEaRlDlbD/253UohYdeOFcFqDeHyDzu0pApH6Ol0IwosLs1qPOpF+7Bop9
 X2HTQbwh7TrtCrENkVb4VKO2mG6DOufUEuanayh3YGzFVKGj80yKL75Pt4uAMXL3ph53
 d/dTPxW6f3f0bNZVzvv5GM4GEHw9hN4KV+ALoOR0wshCtksYVTVMAtZwa9F9KSx0ElLC
 az0W0wE4efW+1HuzZuAsT2736lwdFmH5rKfdVDE5UDEVzufaJqQHqH+9ZDBtkgLIaLZO
 3VjA==
X-Gm-Message-State: AGi0Pub16dCjozLlMF+vO/d2Cus8Osq5RrbB6nvp2oKXzOXTz1EnanUp
 WQlBZZzME10X0jbQWaPLnDUYvSbJjOlmrz8l9VI=
X-Received: by 2002:a92:d0c6:: with SMTP id y6mr5841208ila.227.1588709162741; 
 Tue, 05 May 2020 13:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200430162439.2659-1-edgar.iglesias@gmail.com>
 <20200430162439.2659-8-edgar.iglesias@gmail.com>
In-Reply-To: <20200430162439.2659-8-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 May 2020 12:57:17 -0700
Message-ID: <CAKmqyKPSUzqQxvKEvu3TYJao4sVhFXz62OyVkoW2cpNpt8jFFQ@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] hw/dma/xilinx_axidma: mm2s: Stream descriptor by
 descriptor
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>, figlesia@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5BeyxazFKqCw

On Thu, Apr 30, 2020 at 9:31 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Stream descriptor by descriptor from memory instead of
> buffering entire packets before pushing. This enables
> non-packet streaming clients to work and also lifts the
> limitation that our internal DMA buffer needs to be able
> to hold entire packets.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xilinx_axidma.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index a770e12c96..101d32a965 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -111,7 +111,6 @@ struct Stream {
>      int nr;
>
>      struct SDesc desc;
> -    int pos;
>      unsigned int complete_cnt;
>      uint32_t regs[R_MAX];
>      uint8_t app[20];
> @@ -267,7 +266,9 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>                                   StreamSlave *tx_control_dev)
>  {
>      uint32_t prev_d;
> -    unsigned int txlen;
> +    uint32_t txlen;
> +    uint64_t addr;
> +    bool eop;
>
>      if (!stream_running(s) || stream_idle(s)) {
>          return;
> @@ -282,24 +283,26 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>          }
>
>          if (stream_desc_sof(&s->desc)) {
> -            s->pos = 0;
>              stream_push(tx_control_dev, s->desc.app, sizeof(s->desc.app), true);
>          }
>
>          txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
> -        if ((txlen + s->pos) > sizeof s->txbuf) {
> -            hw_error("%s: too small internal txbuf! %d\n", __func__,
> -                     txlen + s->pos);
> -        }
>
> -        address_space_read(&s->dma->as, s->desc.buffer_address,
> -                           MEMTXATTRS_UNSPECIFIED,
> -                           s->txbuf + s->pos, txlen);
> -        s->pos += txlen;
> +        eop = stream_desc_eof(&s->desc);
> +        addr = s->desc.buffer_address;
> +        while (txlen) {
> +            unsigned int len;
> +
> +            len = txlen > sizeof s->txbuf ? sizeof s->txbuf : txlen;
> +            address_space_read(&s->dma->as, addr,
> +                               MEMTXATTRS_UNSPECIFIED,
> +                               s->txbuf, len);
> +            stream_push(tx_data_dev, s->txbuf, len, eop && len == txlen);
> +            txlen -= len;
> +            addr += len;
> +        }
>
> -        if (stream_desc_eof(&s->desc)) {
> -            stream_push(tx_data_dev, s->txbuf, s->pos, true);
> -            s->pos = 0;
> +        if (eop) {
>              stream_complete(s);
>          }
>
> --
> 2.20.1
>
>
