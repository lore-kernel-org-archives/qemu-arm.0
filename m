Received: by 10.80.163.71 with SMTP id 65csp3488772edn;
        Thu, 6 Oct 2016 17:04:19 -0700 (PDT)
X-Received: by 10.55.209.207 with SMTP id o76mr15963800qkl.276.1475798659532;
        Thu, 06 Oct 2016 17:04:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si8985501qkg.109.2016.10.06.17.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 17:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsIeA-0006sd-FC
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 20:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bsIe3-0006p2-T5
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 20:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bsIe1-0005aB-TI
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 20:04:10 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bsIdy-0005Wm-92; Thu, 06 Oct 2016 20:04:06 -0400
Received: by mail-oi0-x242.google.com with SMTP id i127so575479oia.0;
	Thu, 06 Oct 2016 17:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=MmveJqhUpeNiPrcrwpGE9ayGg5RqsC2DyMQitRF+gOg=;
	b=flk5RJrvQxmufe0BdyD9SEzLZD1eRpvVkRrEFJO9rtHwc/n98p4OS2JahpNfGTwGFH
	5mAw2gzLHI8c20a1BmPJBg3d0sxu6ihRY+3550HdQZ1xUgvkwGwYojBW5L6C3s+Oke0R
	JZEzi6L38iHvpp78/n17RX5VASSZQC9FVrUJcLttb8IcU2N3hpFAeE6OJaHL0gAR8fOg
	dycNS/boHFyKcUsCsAaFRMsND7QH1UFhSkW7FI4Qs+JB7N6o4mVv9pSS/saBvhkPgLaB
	shs+5IdzwbTEtyUR/w+TvKduIxw4HYt1OxOA2j14bHQtpz1wWLEBX3E4Ljr/E2KWYSeB
	Pv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=MmveJqhUpeNiPrcrwpGE9ayGg5RqsC2DyMQitRF+gOg=;
	b=NUbXoh2JcUyAQd2gKskzAXwOMiCJr3C0f/fniMWil33o6632gdlmvHqanPtziIVQ4B
	MmjDPMAqCJjnkbeF/7NL9Vl2gyRmDP2ULK3TdGh3Z7O4xPtLrgmT9lyZ1xgz2NFWZAKg
	hkLOA4BzIUBmwaTy5KXA0E71ulz4KmTfbBIj3xzWWmOZ7/Ou5iyP/9QbVXGzm5HdX0Ha
	1iGDiYRk90mBjJHq6X6UnxUfDmDMKWhW5s4bmkmERmsF/KoeZY9XxCcuEcO7w/5HwXhm
	Y2PNmQN3K6XEefGwznGaRmvrhdY5KkrL4/CgQOTz3xLU4Xp+XV3qHNUSj6ghV9+rOXMp
	JmIw==
X-Gm-Message-State: AA6/9RkNQSUyrFmSVAg5+lUW8Fq17twKTRvMj5MkPvuvLB+7liI/UbScv/XlcEqrXQbzb7tOAbNuX7QpVsNN4w==
X-Received: by 10.202.206.215 with SMTP id e206mr14343267oig.80.1475798645512; 
	Thu, 06 Oct 2016 17:04:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.181.7 with HTTP; Thu, 6 Oct 2016 17:03:34 -0700 (PDT)
In-Reply-To: <1475777794-4376-1-git-send-email-rutu.shah.26@gmail.com>
References: <1475777794-4376-1-git-send-email-rutu.shah.26@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 6 Oct 2016 17:03:34 -0700
X-Google-Sender-Auth: 5sU1gyShmVT43K39l-qrKC4q4n4
Message-ID: <CAKmqyKNBuC3pZSOQ3q6wHBNjWThj8hO7A+Booy_GaVuG8fO_Lg@mail.gmail.com>
To: Rutuja Shah <rutu.shah.26@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCHv3] Reducing stack frame size in
 stream_process_mem2s()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V7vzhgXCY373

On Thu, Oct 6, 2016 at 11:16 AM,  <rutu.shah.26@gmail.com> wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
>
> This patch allocates memory for txbuf in struct Stream rather than the stack.
> As a result, the stack frame size is reduced of stream_process_mem2s().
>
> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Hey Peter,

Can this go through target-arm?

Thanks,

Alistair

> ---
>  hw/dma/xilinx_axidma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index b135a5f..6065689 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -111,6 +111,7 @@ struct Stream {
>      unsigned int complete_cnt;
>      uint32_t regs[R_MAX];
>      uint8_t app[20];
> +    unsigned char txbuf[16 * 1024];
>  };
>
>  struct XilinxAXIDMAStreamSlave {
> @@ -256,7 +257,6 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>                                   StreamSlave *tx_control_dev)
>  {
>      uint32_t prev_d;
> -    unsigned char txbuf[16 * 1024];
>      unsigned int txlen;
>
>      if (!stream_running(s) || stream_idle(s)) {
> @@ -277,17 +277,17 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>          }
>
>          txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
> -        if ((txlen + s->pos) > sizeof txbuf) {
> +        if ((txlen + s->pos) > sizeof s->txbuf) {
>              hw_error("%s: too small internal txbuf! %d\n", __func__,
>                       txlen + s->pos);
>          }
>
>          cpu_physical_memory_read(s->desc.buffer_address,
> -                                 txbuf + s->pos, txlen);
> +                                 s->txbuf + s->pos, txlen);
>          s->pos += txlen;
>
>          if (stream_desc_eof(&s->desc)) {
> -            stream_push(tx_data_dev, txbuf, s->pos);
> +            stream_push(tx_data_dev, s->txbuf, s->pos);
>              s->pos = 0;
>              stream_complete(s);
>          }
> --
> 1.9.1
>
>
