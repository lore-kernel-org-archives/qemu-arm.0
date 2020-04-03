Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp296399lfi;
        Thu, 2 Apr 2020 23:48:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJdCrxgguoYboSHecg4Jd8WGcaofytRBeVp2qRdIEHBfBRzqXE4HhsRjBIdXTDG7O/OVPAK
X-Received: by 2002:a0c:8444:: with SMTP id l62mr7031057qva.239.1585896503935;
        Thu, 02 Apr 2020 23:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585896503; cv=none;
        d=google.com; s=arc-20160816;
        b=ssYeWOHgCI1mLto+509lfIc4mt41EGcABKblBPOI6lsW8fsLGa3ZDLdqmOYnRBVGya
         4mNOw5jidSEQu8N2mCkAa6kBVsaUBOSRKTN/lJksk9BtxsX4XOjAiWSjmlBwcnMrKIUj
         YSFYjf/DhJjrp+nSF9D/KIgs/N3rWHhfR2kLk/1iz2DOs9yN4FPTqp1bOowIQiq+UlBB
         wIjwMMqDUExJew3DyShn5HJ1uFCqjB7kWvuXMmMFswH2gl9jEj9u7HAxvfoIoz5PyVWN
         zPLKW8SWhBMUDa/tMrQyNI9Hy7TSBFUtxf/TeHANBhGibdqSn6ags7kLsrXDYzqf3wFZ
         ejpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=KpN8FN8Gh2TEnC1CcN5yIM656FSZeo9lJZDBNNHpy+Q=;
        b=FpE7iKmIg99SKPf7Zzkj2hdeZJO+VzUyasfp5SDZsflZZBeCQSQfr9n6Ve2N40qS1X
         3OHZ9lcV2VnqyOiS5792AjJ32xYn0rdwmv7aeddmCS4UullBTVsks0kvfwiVDVHd259M
         J8Eei2WFoFvjBbMbHl3qQ4yLQoYpocUZ4Qab+dmelmMcII8NbV7lr1aRKOwFnoPmp5gg
         SzbN4KJw6oJ6yZiKEG0I7GR16zltr0H4GQLSRrRfLE9zfeipuJqjiAwEHW8oYM6Razov
         b49jl6mhSzhtqUCL0xjcCgkCnGmFY/AF3fc018S+SMjPqjB/CjHtq/iCBVHNFwldcNwW
         gpdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VB644px9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si4850916qtk.125.2020.04.02.23.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 23:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VB644px9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKG7r-0006n0-BM
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 02:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG7i-0006id-Rn
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 02:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKG7h-00012I-Sp
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 02:48:14 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jKG7f-00010i-9J; Fri, 03 Apr 2020 02:48:11 -0400
Received: by mail-lj1-x244.google.com with SMTP id k21so5880469ljh.2;
 Thu, 02 Apr 2020 23:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KpN8FN8Gh2TEnC1CcN5yIM656FSZeo9lJZDBNNHpy+Q=;
 b=VB644px9pQvSo5oR5F3OF15iQ9ZTILTyNIe6ajIAJoyGnDTj3Y0TVOhEgpKibrt5ud
 dI0XL1tXRCapsq9rkHlhpqvcqgyYF430VwxvqoMKyMo06Kl1nFoBhthaKtncmilTcrEp
 HsHnRNNlmwmcu/WI6i4WE0xzAV3fu6PSdIRNhZHGljxte3jFgk98+8uUcrZgaDu6lsAS
 XOVuOZpvS5OlqrLmu0S3GnsbuLL3qwCxdoz9wWfFfOugwuMt/6o9GkUiqudHK+lGTBfg
 hfEcl1BuRhwLiVrgivioMiKnHaS3XYN28XwRUe5fAt/K18a6fTp61rn1qkieW6hkEBAF
 AXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KpN8FN8Gh2TEnC1CcN5yIM656FSZeo9lJZDBNNHpy+Q=;
 b=LyQXdB6lY7IwDsZNTbZGrqZWdsF7l7bHwiCBmrvC1PLLRt3Y4WUybtSG+/trzLnF+H
 u3z4+Kz5UeYOc3RjC3kQR8+DyJZwNLPoQ+XFhz6UEK1rnVQu21r+RbqV9LvxTYGprGQM
 t291oTdiU7rSHvo2scINRLVo0gyx5viO9pipK1DJICbtWI5DFIgJGjWWqqAMaeXSPcMl
 sH1zGPlCKcWuk8G5SpqKCnjQehxRih36yqwJaAEf+w6q03VTACSPnd02c5KWP7u9wIje
 rsK+0OdJFMEEGJr5BNJGyODju3ikCuV2By1vbgN8InvzZicDeoFTO298PFxZy+hXz9TS
 7q/g==
X-Gm-Message-State: AGi0Pua+I8itEdEejXFo5bEfZ30Vi/DEzdDjABjG+SoZKnWSvs5ULe2b
 1sAOdPjCP+k1ZDe6l3q3434=
X-Received: by 2002:a05:651c:1132:: with SMTP id
 e18mr4006061ljo.149.1585896489549; 
 Thu, 02 Apr 2020 23:48:09 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 b16sm4435729ljh.20.2020.04.02.23.48.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 23:48:08 -0700 (PDT)
Date: Fri, 3 Apr 2020 08:48:06 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 1/5] dma/xlnx-zdma: Remove comment
Message-ID: <20200403064805.aqbdwocgk2ds46hh@fralle-msi>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402134721.27863-2-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
X-TUID: cOXc+MgZsCBY

On [2020 Apr 02] Thu 15:47:17, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Remove comment.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

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
