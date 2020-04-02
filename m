Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2212660lfi;
        Thu, 2 Apr 2020 10:06:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypIBzgbArWKf0h32PoMNnVxZ7HOWuiaWx1XKMHe+zEul3qwF0I4E4whRiwnovoRBLRg/Iehb
X-Received: by 2002:ac8:7292:: with SMTP id v18mr3981668qto.304.1585847175532;
        Thu, 02 Apr 2020 10:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585847175; cv=none;
        d=google.com; s=arc-20160816;
        b=m54bcD1AFS7ZqnD6hjhSkbUTAST8oJwjsk+2RopJm9WVy1L+aJG3AeUrXIEC9y6qay
         UkSilEVIkY7wFfVTFKVDynUKSle1W9KKvywzg4gSreh28u8tE5ljvEp1APyfpVBAzfKN
         bP+GpKfcqYBR72OdFAxgOS5vRaX+Nn6FD0b7d08yua7ExtQkfhY2r8rqHzQkXpxWwxww
         CNhFL9JpQ6lZwY4V7cvvCBWhYHYDV4Vo+d4crqcljt9anPPFc2lmhz1xmcTqq7X0AZUv
         EHN7b0BN2X23aT5V6XLUPzgtJ5vIvVWNEF9zm+/C+2vQTiV8Ng1KUBy1XpbEdbNmyxM6
         M/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TbYWU2Jlqfbeqyj2fl2VXxgfCuBG4GtNYBQeDD+Vx/A=;
        b=KCRsCzH06iHs5Yldxr2ragvF79caAjnj6odwOqITyHw7kiBAykcZUFuegKz74H3I5N
         UxMCX8H3tnaxFbD9rxH14DDDp5XF6MlvZwcNp+bm/yEh+ZQnewiwtwhB7B2y72xPWDsb
         0F+HsKcDFEJx9ZznWEjNyYDzxMbpdt7a4Dkkv6+QCbBA4Tg7b/mLILd/RCAJgVovvpua
         szqaDmy7snNkLIBMCzYt+27bbBpOjAaTqK819dtVFFBanNSfw4h6DRtIE5Ml70NtDTeo
         5E5oRtY/FzIHMXe2V8YKXrjeXhaE2EOqh49tzYavGmlXjb66THcKNxIsHfqXxXtUZz0o
         2/wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e0cM11So;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si3981978qte.13.2020.04.02.10.06.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 10:06:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e0cM11So;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jK3IE-0007Oi-Th
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 13:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jK3I2-0007Lm-Uy
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 13:06:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jK3I2-0003QM-0W
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 13:06:02 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:38285)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jK3Hz-0003P2-R5; Thu, 02 Apr 2020 13:05:59 -0400
Received: by mail-vs1-xe44.google.com with SMTP id x206so2869243vsx.5;
 Thu, 02 Apr 2020 10:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbYWU2Jlqfbeqyj2fl2VXxgfCuBG4GtNYBQeDD+Vx/A=;
 b=e0cM11SorEKbqSLmbzZ7DEWcUik3F1Rfxu8McKj9IOdp0SbK4nw3SBO3Bo881u6Jsx
 LQLrhgJW29WV3vzu6mvARz+CPnpyyDCxinj8nyf5gZ8jMYsw4ONbW73dXnrROVQv3g+a
 Mdhd8pZRF2Jf3VH11cMfLnlcv1fD/6UWPFBLU1nHEe+PiOpWtbUq1zOxbDvWfMKzwolW
 bR2HoitgaIObMOkfWC4EI0kjhqfmh46KVEmMxjx7BxP2xFaPlgA/Nj4nJ8yc4DtNogyt
 qvnVA0rpoBYPRSBVUprURTSJhV7DL7xQPuGdYLWh9E3td3L/JK6mjNDYH8UxErFz+/wN
 v2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbYWU2Jlqfbeqyj2fl2VXxgfCuBG4GtNYBQeDD+Vx/A=;
 b=BHhMjE/ro+qhSlouqSTA33KcDCHLQrUYhZ37JDTEYcD355gpAq7NmnJU8+jyaJlLKP
 HASCergjFq3TzxSLW1bUAlzF7zbqWir/lMKWz0loRawOs9feMMQ+54JjdOVlOg8Ez6KK
 TH3nPlsZQvPa+OUTyVK/8xEbNXhC9oYanUJCtkgDe7Zh4J8YoiZNQF9eBIDd6FtsxLlK
 8lBLs6CHOlWdRvmzA7g7SFckd8EqW/YYcFFM+1sWD8zz96w/xD2lf9qn6Aqye1LSVFH2
 r2cnYgRLS4QX4Zr6LX8c/Z/jPGqsYNuhtZrKU9rFZgdBIDGass8FsNQHu2edyNm4aK7L
 yGfw==
X-Gm-Message-State: AGi0PubB9Iy6ZmZdyJwDYZSbDFIN0kPL90n4yJQIYh7HMotNeGFnRgxn
 By44gjvoT08+AeG2R6mHrQGxOSnuYYMJlitgZjw=
X-Received: by 2002:a05:6102:730:: with SMTP id
 u16mr2889551vsg.70.1585847158764; 
 Thu, 02 Apr 2020 10:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200402134721.27863-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Apr 2020 09:57:46 -0700
Message-ID: <CAKmqyKMUesgAAvU+e1gbiv3bK9QxpJHtM-GzbXxLfLiEF8eRKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dma/xlnx-zdma: Remove comment
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e44
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
X-TUID: TABn5nB4WCXm

On Thu, Apr 2, 2020 at 6:49 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Remove comment.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/dma/xlnx-zdma.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 2d9c0a0d5e..a6c5b2304a 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -511,7 +511,6 @@ static void zdma_process_descr(XlnxZDMA *s)
>          zdma_src_done(s);
>      }
>
> -    /* Load next descriptor.  */
>      if (ptype == PT_REG || src_cmd == CMD_STOP) {
>          ARRAY_FIELD_DP32(s->regs, ZDMA_CH_CTRL2, EN, 0);
>          zdma_set_state(s, DISABLED);
> --
> 2.20.1
>
>
