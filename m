Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1604906lfg;
        Sun, 22 Aug 2021 23:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmFN/J5sfJmEYsUUN+SrGojL/LjKeNnFC0IPR/F4Jt8ZEyuF8pgJ4fUWvmAtaNKAIFaRxK
X-Received: by 2002:a5d:8a05:: with SMTP id w5mr16877324iod.155.1629701607924;
        Sun, 22 Aug 2021 23:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629701607; cv=none;
        d=google.com; s=arc-20160816;
        b=LHx9GLmte/WKNUU0yE7j8fT2rLFgJ4e3j6NRXF4caGKwI/c4iQ60zhhxgyVClxy7nj
         17CTUGBoLNYUojDHTIruR2IJ/JV3TNcIY6xWXfo5p9On++9RSmC1pWQHI7VuoVsEtaTB
         r3DfffxNXKlw7ODq/XtxcM/9qR+QUO9QnBOa/3SWNAyd+HUIwZWmQlluOVUDHn9d2oQT
         o0Oz5cXqc9j5HH1e+ld4Tj71dYHml7rxMnYWvS1rIF1E0wgrtCq4VTr4IbOoxJ7CPdnc
         zVZ3jwHK0xm+pzYkyAidlr92gZrxwjSR8Lwz62e17Evtksw5/IJhjhbAL1y6EZO50oms
         GB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uO2Mp78lySxPx+yK9SJCUMucZmEqrJNQe0KMLuRtxLk=;
        b=Ue7GJxzVBHRClXl7nl16ulBdS0U9zzC+J1PYW2cizW0m6abBCVWWtf3LXtCeB7z/u+
         oZJURuAKlIMCR30ja+TSTzr/zq7HSfXvjo9W04/+MuxZYLelQhlootd4c8itHgxssOai
         XOg808qziFn4KWKP5/Ddq/ZVqRQsK5CgWb7wDVv7zq/6w7MEuBYcEtzs5j21hsxXkUEN
         R2ghpcy6NbDx/P2oLtHVs/JR3VcSbqsOQeEGLMzv4ozEzGGiExyH8E2uDEKLC8JC28uY
         QmwsMgFjM4AwV5wrgmFShkeQnwMHfudmfXLZFBpgfidw67MDR10iKU5C7NErpTht18jd
         mDIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lpmufmh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si5774253iow.29.2021.08.22.23.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Aug 2021 23:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lpmufmh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI3pn-0002qf-99
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 02:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3pd-0002ok-V9; Mon, 23 Aug 2021 02:53:17 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI3pc-00034Q-Fx; Mon, 23 Aug 2021 02:53:17 -0400
Received: by mail-io1-xd2f.google.com with SMTP id a15so20506192iot.2;
 Sun, 22 Aug 2021 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uO2Mp78lySxPx+yK9SJCUMucZmEqrJNQe0KMLuRtxLk=;
 b=Lpmufmh5yEIn/y82poP9By+pOOUkw6RI4uHUpUKUpw4NHUqnWODG9UNeZs4541IQLz
 eQ4zuW4jTEA/MccMnCwpzv3tINKUpElgzVJaQDwzEV6T9oEpOXrMaideJEl9L9TPoT7y
 AgtRXNl3UVXTMxEvg/zkpqVYQNL9FSE+xivCPZVCM+y7I1ctfqBe0yPkjRs0QnCAITb5
 HZZfZZliKZRIrnRScYtXiV99IxW6a+SEhz8ZDaNhel6vPXO1zy60fkWrvW8ZZ68dRmUo
 ZAlwQRHmfL54HcQj3B/1OCBmSVAeP5Cftn2V/yotzfg4Cc30pnwrIvcdXkZwqH9nH2kF
 VqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uO2Mp78lySxPx+yK9SJCUMucZmEqrJNQe0KMLuRtxLk=;
 b=E7f65uNa1P1el8IGULPdZ3GqwofuScBrR6IIYOeMX39fMIRyWoyRD8BW2T25fPOq7m
 GyENwUTwI0a+N+Eq8W5686SK+UVgBvyL4BLgv7cmdoTdBEMn6oonziKd1FmsXd/slYrs
 y7p7xeKWFHL9SYvXGljbQm+yFGgjhzxr+gWb5aMnOsNp7gMOj7VnUbLsjNNgCP1PYGcV
 QxB0Yz55YLdqo7AhtZWq66zXpK8NDSihX0WJG3yZRKIE4K1UOrdBC39ow8MxWyeiPxhF
 FM4fVH1pqp+r5H7B2lJkbe7L0mz3V1CoL8awU7k8UHZCSj83ymSDhQmykmTsZW5Wax5C
 s7rA==
X-Gm-Message-State: AOAM531ufZxFAp7Y9/1y9arZG0XszJGZYI4xTLLa7iJYiDLnVSXhDAGc
 Gk/MRbSCBbslXkHLq+s2PNwrLfZ6V5+Vhu0003s=
X-Received: by 2002:a05:6602:3c5:: with SMTP id g5mr920298iov.42.1629701594959; 
 Sun, 22 Aug 2021 23:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <CAKmqyKMzq-F=MYMA=_7MeLTodxY7Eo91Nta4nKuncvAZ=bQUOQ@mail.gmail.com>
 <CAEUhbmUscqN-8fe2BwJ3dRN63fJd5qVPQnnM+ifm5qjt1pPdhw@mail.gmail.com>
In-Reply-To: <CAEUhbmUscqN-8fe2BwJ3dRN63fJd5qVPQnnM+ifm5qjt1pPdhw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:52:48 +1000
Message-ID: <CAKmqyKN3WnF6iNTYOCJ9o71TurwUtu7yMD4MKpQfEbi8Hy2-qA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yjpz0+9OUscO

On Mon, Aug 23, 2021 at 2:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Aug 23, 2021 at 12:43 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 12:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > At present when input clock is disabled, any character transmitted
> > > to tx fifo can still show on the serial line, which is wrong.
> > >
> > > Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > > ---
> > >
> > >  hw/char/cadence_uart.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > > index b4b5e8a3ee..154be34992 100644
> > > --- a/hw/char/cadence_uart.c
> > > +++ b/hw/char/cadence_uart.c
> > > @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
> > >  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
> > >                                 int size)
> > >  {
> > > +    /* ignore characters when unclocked or in reset */
> > > +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> > > +        return;
> > > +    }
> >
> > Should we log a guest error here?
> >
>
> Not sure. Based on my past experience of many hardware, if the input
> clock is disabled, accessing the whole register block might cause a
> bus fault. But I believe such bus fault is not modeled in QEMU.
>
> This change just mirrors the same check on the Rx side.

Ok:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Regards,
> Bin
