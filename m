Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp297680lfi;
        Thu, 2 Apr 2020 23:50:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZVWxCSmZiKS/gtnb7iJFqq7OkP9ugVEyVXoJ3RiheTRXfbOcRcKOY1GJHhYaRbB+Z7d/m
X-Received: by 2002:a37:74c5:: with SMTP id p188mr7427086qkc.475.1585896625830;
        Thu, 02 Apr 2020 23:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585896625; cv=none;
        d=google.com; s=arc-20160816;
        b=kqLdtznjV3VDpCaM7dM2odxQ3Nf2J1a22ISoW+9wBT52sH4kN44l4gTE/VJImpf4Zx
         S/hM2mqzyggFf2R4x9Rx4jQWte5vhteDMY7HX+LJOLX2e9YlAvigdli7b8mmRFldMV4C
         Un7AU053absYtUK/3WJDykZaqHfT5nv+NjBIENdH/Ttqcp4UePB2rRCiwmL+UJr0VZcM
         29HL3bsnDhdLaRvY54PIUWAL/3SbT4qenj0R8cOfvQynjd5qBShfbhrSE+XA1PO2KHCK
         3U1k8LcQTYpPTfRlDwSFFQgQj6JP96zqToEgBRHhsIKN5L+SLbO/0lk+T0W8k9C73oHh
         spOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=xMW0H0Y8GIX7/ZZDMb64Yogczz9CLtZk8w7p+2So+cM=;
        b=Rmb0yfeY93P4Uydv+tjVdnJ+o/RQv2uhqeQKtAHRDRiBOAFtyp0VazmAonJXWC3B66
         i3xinlw3lw41tyyRgtccU3wgtEh1gJKsy9nb8/YCDN3J4uFQXFvvaQBz4S5xfTH0dJsE
         6r5hY0jDnSaOYFwMXufTQHaJq9Bh41WGdeurcH7F18hSSFMVlaKHsxw1D3+yh75AAzzX
         lImDJxgGDaqLJhmOVEG6SXJ33mlcuJ2RiRtgBcDUNGedparFzaqtHgKV/OiUSphcs9rB
         JQpzr1Mk3cqYjMCKJt+/3lYLlRPCCMFN1GpyKMwCLTKYIbuqNAtjiHvZnD0rBGVZ3Xiz
         uS+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ogurwqdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si4955322qkl.233.2020.04.02.23.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 23:50:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ogurwqdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKG9p-0001v4-7z
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 02:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG98-0000cy-Lz
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 02:49:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG97-0001yO-Ow
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 02:49:42 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:34446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jKG95-0001we-HP; Fri, 03 Apr 2020 02:49:39 -0400
Received: by mail-lf1-x141.google.com with SMTP id e7so4879158lfq.1;
 Thu, 02 Apr 2020 23:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xMW0H0Y8GIX7/ZZDMb64Yogczz9CLtZk8w7p+2So+cM=;
 b=ogurwqdyxhbS4oNCa8AE1iqIb9W0ZJf8ArmH0xfkNuaokjR1rKo4nxQBOW1eCRRG4O
 14oofDB8xJR3Ecj7DdZRtfVJEIYLDON3aRKQHZA8jc2mvg+8Vu5tVogBM+P1Lz6skXKo
 0WpZ2/CBQjM22x34ThrTSglZs4/qJf1M8HP6XK4PY+wPgOOEmWbCYZDOpnsoqJQv3+5d
 3+/hnOz09lIMh7LRvAryv/Nn2ZNi7M+nUstotvU2PhYCwP3DavUDRADK7p3VtRUQCJRM
 w0B6d6gGdBN78HmDe4pGBT44lDOKQhw2eXW/9yC6eUiP6Rw73hK023hSc3r7LhQTvgUu
 phhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xMW0H0Y8GIX7/ZZDMb64Yogczz9CLtZk8w7p+2So+cM=;
 b=Eh/w0OJy61jpA3bWdD9MYpGKmC9mLQtxdfHOYMDhdcoholDS+G2SMVptE8wDL1zkbB
 XpnWs/wvuF3oZUp2ivs+Mv+HouO34jDl7vQM89hfvDNfCwcO4oTzb0aCMP5zWFn5ahRo
 qu+046fwC/5jwPvYl/ar3MpBPjxYIuSKsN1D1fH8uGVrMQ+hJANvYlFh6X4pU1hSwzmn
 wrEC0x1qsn/Wkqrdevv0SyVoydetJ+TxnIHuRYc3SxORyAUd+0OZLzblSVgzSQXy5LOY
 Ug6JJrg14JaYvVFzvj8FdfwLzX3a0fQfkNedI3ly3zEdbPTBPEVzjKx0kx2Vt4CVjx7n
 5xpA==
X-Gm-Message-State: AGi0PuYfljsOufTOO/3tJiugxTmZa8V0PZNrgbF/yn6B0IxAg9B0Hv7g
 kIE5BM5dZFkhoyOKQyIAZbs=
X-Received: by 2002:ac2:5092:: with SMTP id f18mr4441648lfm.162.1585896578052; 
 Thu, 02 Apr 2020 23:49:38 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 d9sm4553415ljg.39.2020.04.02.23.49.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 23:49:37 -0700 (PDT)
Date: Fri, 3 Apr 2020 08:49:35 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 3/5] dma/xlnx-zdma: Clear DMA_DONE when halting
Message-ID: <20200403064934.lczyn7ipthaf44in@fralle-msi>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-4-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402134721.27863-4-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xvfKUGEks+Y/

On [2020 Apr 02] Thu 15:47:19, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Clear DMA_DONE when halting the DMA channel.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/dma/xlnx-zdma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 6a4699757a..dd893bc420 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -520,6 +520,7 @@ static void zdma_process_descr(XlnxZDMA *s)
>      if (src_cmd == CMD_HALT) {
>          zdma_set_state(s, PAUSED);
>          ARRAY_FIELD_DP32(s->regs, ZDMA_CH_ISR, DMA_PAUSE, 1);
> +        ARRAY_FIELD_DP32(s->regs, ZDMA_CH_ISR, DMA_DONE, false);
>          zdma_ch_imr_update_irq(s);
>          return;
>      }
> -- 
> 2.20.1
> 
