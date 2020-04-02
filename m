Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2234225lfi;
        Thu, 2 Apr 2020 10:21:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypJDOQBi2P4rX5pZrzBnslQv/YalYwi9jzCbLUs7yy1iiIyZJk0Yi1Tuq6KoDVFpXOC6lPP+
X-Received: by 2002:ac8:6b4b:: with SMTP id x11mr4150757qts.118.1585848108189;
        Thu, 02 Apr 2020 10:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585848108; cv=none;
        d=google.com; s=arc-20160816;
        b=ENgPrVyN6wDEOrXpCdhF2DG55AOzCRfSeNz+nS8NfOXOQdtfxqjRrb5O3mMy5qEhsj
         LGv/jcDm2G+ngyQZTmCsXHCDk29dIMlL8jjptk4kI8e3EFJ1dQwz61uvCqzPxaWMM4Mj
         u2p1GgGmCPFH8gjkPtfvasTayxWeCcC0Kc4K/nmdDoGCIyS0Cb1cPnV6lzWvrB1bxKEa
         XGCoz7W0hF9v6ExzRQLb/qm3PeeYlQKD1oEBhxyWDfV+9STzrPbvdkGORNBJImB5rOSZ
         OUFrYjTdwqDCNPAPs/KYQO1iKLpDo17Lo+KNM+hi1cfmdAqlUzFsm/12nX5+OvQR9e4n
         Frcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oekO7Iey/J+A25klZ5udo88BsGYzcw759MzkmKCIw7I=;
        b=p2HGNOeVJdZKCUHAWUkuuNS2LynI7yl878pnrPdieVgfJw/IEVerFUFrqxlhb6lcKT
         EaeVyn2WIuzPHptgIljr2RObx6Kyg5CcV6fE4OUfyRJCAGhOL35M5m5dymrKnKn83tGG
         KpWs6kJg54A5/SfTXvsXnCsDmuukErEL9zckMpTNHtuqzl2odZyZvNTUrsnla0BV+D4X
         2GURWTdBDY4yGQR9HDddzUwEssZwOnzboshKmh14+2NoZQZOdtAuNktfdJjDLsElJW/I
         YsHbUN4/RMe4CdUA9Q0JwQk9MfoQiTf6dNd0CePTOQLAPRHSRmp2Aj/93m0qbJ1Y1g6Q
         MZYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yyjw5OUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si3804126qke.345.2020.04.02.10.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 10:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Yyjw5OUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45121 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jK3XH-0003zw-Jh
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 13:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jK3X9-0003vs-7X
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 13:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jK3X4-00071r-F2
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 13:21:39 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:45940)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jK3X2-00070q-Gi; Thu, 02 Apr 2020 13:21:32 -0400
Received: by mail-vs1-xe43.google.com with SMTP id x82so2866573vsc.12;
 Thu, 02 Apr 2020 10:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oekO7Iey/J+A25klZ5udo88BsGYzcw759MzkmKCIw7I=;
 b=Yyjw5OUUGqmZDd+hbAZZJr3vBaJH10dqL/IeHbbmJ15NIXnzKSSEw4V/Y6J3Wadzht
 AJp52TwXMZiG7+7IcHqpMIoB086/sPq+iZfwk1NnLNT1Zpsm1hxpHfHy9oZjo0dRYAOT
 qT6zvjqfPSEfSMZ3AREJfTBGib75ZmWfxm+wvwYOQ0Jx8hEGcEptj6d1343fIdEd7/LC
 YGMFYOcO9ylPETm3aqwXlFCFse9wjOwF3FIGv6L91GW8NNakm9bxpYv3vqKioerHh8fl
 qhyfMxF7A0ZfQIZIJ8zHFjc0qJq7Z40GK41fgFptWvUcdTxpE/moV4Xq3blfKnG/wWTb
 nA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oekO7Iey/J+A25klZ5udo88BsGYzcw759MzkmKCIw7I=;
 b=onxIgQUJC03WEgzMVMEwA8z2z5NvuIWV4Am351zkjbbH1Y+Jc9NOOA6pWhIczleIyp
 YboTCXjnLlR7tfCmBb/S0ZWnmGqvcqt8QE7bZLPjz0Pe6pRl8kN4VKzKFhVuUcGJWpp0
 mHcuz+EWsHXF9QS6EsvP4CUszyysFouYygKs0/EDuEw0FQL4Ja3iVEi9WF22JzQ6GylU
 Lf8oO2rSmIYnxYuI2qiqVyXLuHhtqKY0cbu9c3cg4wHp+qalu2tnieIrJkvJUDsYS1fd
 8Gvyq0LI0M+BAnT1fc3HPdR1YV2XrGh9lkHPNcSe/5ePbDH/ynYBXliXHAqBvjzOU89f
 xdRg==
X-Gm-Message-State: AGi0PuZvx7wFjGroN3JdImPCu5r+FhjRVRzEl6xP0EJ0Gzlmcw97fY6p
 9/SNJglVXmvupCMMbvn+J5YvgSg5fqkNQJ7XSDI=
X-Received: by 2002:a67:26c2:: with SMTP id m185mr3304616vsm.180.1585848091833; 
 Thu, 02 Apr 2020 10:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-3-edgar.iglesias@gmail.com>
In-Reply-To: <20200402134721.27863-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Apr 2020 10:13:19 -0700
Message-ID: <CAKmqyKNY0qv8iwJCheC0x7EQgdUgLsMtJzwkyS6CpcRzOiJLZw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] dma/xlnx-zdma: Populate DBG0.CMN_BUF_FREE
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BirS5M25jJAV

On Thu, Apr 2, 2020 at 6:46 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Populate DBG0.CMN_BUF_FREE so that SW can see some free space.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xlnx-zdma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index a6c5b2304a..6a4699757a 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -680,6 +680,12 @@ static RegisterAccessInfo zdma_regs_info[] = {
>      },{ .name = "ZDMA_CH_DBG0",  .addr = A_ZDMA_CH_DBG0,
>          .rsvd = 0xfffffe00,
>          .ro = 0x1ff,
> +
> +        /*
> +         * There's SW out there that will check the debug regs for free space.
> +         * Claim that we always have 0x100 free.
> +         */
> +        .reset = 0x100
>      },{ .name = "ZDMA_CH_DBG1",  .addr = A_ZDMA_CH_DBG1,
>          .rsvd = 0xfffffe00,
>          .ro = 0x1ff,
> --
> 2.20.1
>
>
