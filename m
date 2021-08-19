Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp741483lfg;
        Thu, 19 Aug 2021 15:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNbupus1GaxbwGCalHkPWZxVcJRkZxXrx7aBSJDT8cdRNUmI/T8uX0/akr+jaVe33gFvzm
X-Received: by 2002:a5b:70c:: with SMTP id g12mr13591752ybq.336.1629413582430;
        Thu, 19 Aug 2021 15:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629413582; cv=none;
        d=google.com; s=arc-20160816;
        b=TNB9q5pV9b3lnpWaRi16bKFO0ggckPSYV2E/Lk9gJAIHygWDU88On4oqwAkbfXCrBN
         iom72nBYCjjc1wwp5Z4uNy+vR8orhV+PoO25E7fOFIgEdnlbpxO+o6KgnQlhKTu07HVM
         hkXaqTnXY4nMogWPLiHO+W5ZkD6vKNSiWd1tYbj4cgUKwseJo39uK6qNXgKdtmULImPt
         iZYIMjqZnqxb8+/UZRqGwWcrN9KcNRBrgf8SgipFUj7ujOXPfTyAcnEQyRugw1QgET4A
         D2TNeEL/xdnzMJ2dOB7M4NMLE6ECVoyXNcA6rixua0b/iJF5YPgMv3nMvAzaaKc0E8RI
         sEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AEizeeqCVH0wImSsTsJ0Jf6ckHx+EP1nXgT1ff0qgB8=;
        b=s9j7/EUw4xG6LbssmPXTSPTR8tCCy2tts7WSP3Fcjhq7M4n0NfOHzTIQIdoMh2XTKr
         cWBODd6EpvFJgmGZTzvz9lJfZpLK/ZzX+s09bogCAIRIdWvACL2Q56RNo0uuCSYX+mqY
         snX/l4DkkCaZSiE8YRsAHJUiaHHHRC7lJONfk80a1uuJM+N72+SmgSYVj5bENBvB9RCU
         7eF/eqDCifZpiGtA++ZKtLwhLK5yCxhudjJOwFvbufTNI4AGEOGRuIgA6pfOmtd05eh0
         i0nfZJjw8/pcNg9FcylWBj/T1QvFgKWFlRaARsEolRx1SzHQfxa3Om4PaWzR5+C+dakN
         oTcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KoEhbfkD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k30si4191466ybj.458.2021.08.19.15.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 15:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KoEhbfkD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGquD-0004ex-Pq
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 18:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGqsr-0003JP-KG; Thu, 19 Aug 2021 18:51:37 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:37796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGqsp-0007hz-Tg; Thu, 19 Aug 2021 18:51:37 -0400
Received: by mail-io1-xd33.google.com with SMTP id b7so9788935iob.4;
 Thu, 19 Aug 2021 15:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AEizeeqCVH0wImSsTsJ0Jf6ckHx+EP1nXgT1ff0qgB8=;
 b=KoEhbfkDrNb83tNpxhXji5yt3UzY7ZBl875QVj0kRS1p25fPIGTG/LxcIaaWrq5V45
 yWKe1x6Vwgm7dSUFnpIoq504IbjIXQaJUHw5PJDu/IaiOMtuxgsgsBuGlAyTaBQU6ura
 nADwyTR9HLq6VUhPwaBkLLgZja4IRew9hRoI2tgkmATWwhbDvP7TJHixOCYyRi4n16cW
 mg/9M9au5wkBJs7VRBqJwhrBkdTEh6F8mXB4bsdYoKP5M+ln6u1blbdcF3dMzIc6U6ra
 N0w8DiaZ4vh7xYdGrXZa2oPi9UB9nratSLN+Gh9/0flaDaJOWpMK8WVnzAnjPyAFup7U
 Ekeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AEizeeqCVH0wImSsTsJ0Jf6ckHx+EP1nXgT1ff0qgB8=;
 b=cD6Sml1kHYSWMzLTJvjcM/q94G7KuXrRY1m0wyCYZpq6lgB6UicjO8nHyG2q2Sf+iw
 pRZ2jMOCgzibEj2qQNwDJOkSMsXu3uUVs0NabEZzOrW9kcNHSoXO9ppdFlu7myVEVezw
 rRlGTS9sNYbFaM6gGybgxzlgB6bevqte45PwZU/4zI13LIM06nCBmtOC7DUC0BIHkwxq
 XO9q8TaIy5htCGEpoeygCnoUoRGXMbCgNcOOKSCFfGTB265t4tZqi+MHRiOwvEdHlhZC
 OeqOZlp6d5YvUYX8bCcCNhyXuI2of63uCoipCTeILKlwGrdjN0sAtkHzZppL4be4uajZ
 tX8g==
X-Gm-Message-State: AOAM533d22vmm8ZbnMsXjZmaSTGXtK7WC6a5ZDK3V7c7Ew0NwRdzHlPK
 69wSh1CPJhYvjMYAprCHsTyHk90OocZnUWtbe+I=
X-Received: by 2002:a6b:490d:: with SMTP id u13mr13629780iob.176.1629413494610; 
 Thu, 19 Aug 2021 15:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
 <20210819163422.2863447-3-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Aug 2021 08:51:08 +1000
Message-ID: <CAKmqyKMp2Fs4pc2_bRyY9BUZ+Kn7LAeMYn128rZw8QwC1W8CLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/dma/xlnx_csu_dma: Run trivial checks early in
 realize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RCkKwC9Z7sEV

On Fri, Aug 20, 2021 at 2:35 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> If some property are not set, we'll return indicating a failure,
> so it is pointless to allocate / initialize some fields too early.
> Move the trivial checks earlier in realize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xlnx_csu_dma.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 797b4fed8f5..2d19f415ef3 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -626,6 +626,11 @@ static void xlnx_csu_dma_realize(DeviceState *dev, E=
rror **errp)
>      XlnxCSUDMA *s =3D XLNX_CSU_DMA(dev);
>      RegisterInfoArray *reg_array;
>
> +    if (!s->is_dst && !s->tx_dev) {
> +        error_setg(errp, "zynqmp.csu-dma: Stream not connected");
> +        return;
> +    }
> +
>      reg_array =3D
>          register_init_block32(dev, xlnx_csu_dma_regs_info[!!s->is_dst],
>                                XLNX_CSU_DMA_R_MAX,
> @@ -640,11 +645,6 @@ static void xlnx_csu_dma_realize(DeviceState *dev, E=
rror **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>      sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>
> -    if (!s->is_dst && !s->tx_dev) {
> -        error_setg(errp, "zynqmp.csu-dma: Stream not connected");
> -        return;
> -    }
> -
>      s->src_timer =3D ptimer_init(xlnx_csu_dma_src_timeout_hit,
>                                 s, PTIMER_POLICY_DEFAULT);
>
> --
> 2.31.1
>
>
