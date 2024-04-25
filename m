Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1227963ejb;
        Thu, 25 Apr 2024 02:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1FnqTAa5OUyrw1iUI2hTvnf//hjIRLz+nmYOs2qsmsYkbfaVlm3ncasNE3ZwnGFdC1ZD4xX5Jzu3NiO+F4+YBgvMXNjrp
X-Google-Smtp-Source: AGHT+IGPn1AdGKnhiM4R1zOhJO1XgZMwsiHnjxQcPEeEyTXSTThal71F/tlWgQ6Z35qJYssiHHOM
X-Received: by 2002:a05:620a:e1d:b0:790:9a32:651 with SMTP id y29-20020a05620a0e1d00b007909a320651mr1751425qkm.55.1714037244891;
        Thu, 25 Apr 2024 02:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714037244; cv=none;
        d=google.com; s=arc-20160816;
        b=SLpv8GFbQB3ZXwpQATFxyWPE1JqQm5H+zUSOX86Szsf/5y4DhoiDLesS3mXr0UJM1c
         bQm1Mw1k5JV2Pxg53sn6hPtKZ0nd7I/E8dssuDtPiUgHJzUE1dXSAe0DYbXqOwgjsMWS
         JbTqPpqTtVbO7IhtMWz3ZevyhrUpuYnWkGIT0lwWnew9oCqkQcDotE5YSFg+OiFKNnEJ
         xf8t8PG676VD/fdsOWPVABlohLMgd0Q8c2O3vJkQy/Swr6N5ieqwyAPpY2HBtZCzhp+o
         uYggYS8KBTyydk31Vg/0m9sPJX17iVAmLPkBJDx8Z7ZpA84IOu7TWkROaJHZ5i5Cv6HY
         refA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rTcffbbh8St6G03hXiCUZ15jJjGKzFrEgvJRCgxAEUc=;
        fh=MHx1l8rR4l4ofVxhPOd38ZZNA0swX0mX2lERLbABKak=;
        b=U79/KOyYmONmjUpFEuY88g57iQmsF6hM0w8B+/6pcoDE9rX436Jzqmu6DiOPoVAalZ
         2roiRw9/Lh2hfHqbkQ1jkmv3udZ6C6OZAFgjRuf5Oy/LsRJyQ14v0MV9Gq/F6nUIwfuC
         TFLhHKvylwsEY/MlPrS4RgW7cSSmfEG1O/0+LmMXLhJC1a9AsyykkYyA7a60gfvPMWXV
         euyqpsQ+af5NF+8QzHOqAz3dDNmQZCKGa71NiFdbd/edOgzQ+ty/Rk6WQrSQeAvF3AG5
         jD+iqR/gh6+1oUDryDOVOksE2an+W88k3fP/5AG/T/Y4+SwCzB4y03fTUcQ1jv3zJQlu
         0vXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iycjK0Cw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020a05620a205600b0078ee1869f64si16748118qka.319.2024.04.25.02.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 02:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iycjK0Cw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzvNO-00022Y-KY; Thu, 25 Apr 2024 05:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rzvNN-00020x-6S
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 05:26:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rzvNK-0003Ak-3n
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 05:26:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so748248a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 02:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714037190; x=1714641990; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rTcffbbh8St6G03hXiCUZ15jJjGKzFrEgvJRCgxAEUc=;
 b=iycjK0CwcH1R6gl+sbxhVb7vJItlq+zdKCGvKUbgkpIxOBQR2SUy/+L1g2BV30T/Mw
 biCzEtwl7NW0WjTCK+1zZDng12Z/Y7aXqbabKw/RfuFfarTlBLPz2w9mv7J2Lb/S0C3D
 n02DzWA1xmo0l9AaNwPGo6fIiluYhINyHJPf7o+dxUoaEO2n56orQlxsl2SXVbw9LCgA
 IfZMVS48xPeIY3Me4FOUWSFrW6/wmjxmmiFJzQ4LnrHnYPgrK8byU/gOa9yk5KyRGWKl
 73NZFoz6kFIjcDVOV1939aVNsiOPI6CHPtZLPT/29dWyCZTlwqaMYmD1rep4ZjhLVlPC
 WDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714037190; x=1714641990;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTcffbbh8St6G03hXiCUZ15jJjGKzFrEgvJRCgxAEUc=;
 b=DKHBIpsRGzBE7VT4+BdT3UWye1n7vfedoTunkUwEs1uq9kDPscq9Pm4Hzgn8EGGFGe
 UbEi/ZR0b7Yccd8gMVbqDsEp1nhGBYvfMLUapzYnh5PVEYWSEVIy7gSLh0L8XuGfwvpA
 bcMpk/32rGenyI4pRkTrulb22rZcP2n3mghrunHZjxk5u4ICaALJW8/EGBhHP9uTGdHz
 2quW5rylhV3TGea/dX9iaQph73vKoIkrYM1zSZ1MF5HTskQs3C5P3OFhkb0+NfIuu4X9
 6zIjlEuwB2OQhobSByMlN9g+bdZ2UyCtBdtvzQfL391/jAWz/cWIQnZXRH9GNH1W13Zr
 ovuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwgFnfT8sF73xLjQZ48N6MovTwL5pAVf7fGUzKJ37cBMQHYEjfA2JNVArwF4h0wwEZ7vpwS6Rm2mjGSUVOUHt2Qa5y
X-Gm-Message-State: AOJu0YxrTG6/PCGyv7nLEeG/N6P6NNs7O+snD9n5blh/Da4D5++kCEuw
 MK3mM4+nw+yKQI4iuwmVioYqVMq5XApvkyz4gWwUixzgge2OMMX+owB8sLs8+FweGpeEPujrTR7
 YW6OGcM3c17ALlEbnSLcvvGXq7LcSW2OObAa5Dg==
X-Received: by 2002:a50:d70f:0:b0:570:1161:111f with SMTP id
 t15-20020a50d70f000000b005701161111fmr4632748edi.15.1714037190260; Thu, 25
 Apr 2024 02:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-=kk_TQVRLLQvH96DC-ffmDqd_hU5=z=Og8ntYGxPUeg@mail.gmail.com>
 <20240424181321.20844-1-adiupina@astralinux.ru>
In-Reply-To: <20240424181321.20844-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Apr 2024 10:26:18 +0100
Message-ID: <CAFEAcA-6td71-XBL6dp49L2uZGTbMphJcFeZbi6ReZrm3AHNbA@mail.gmail.com>
Subject: Re: [PATCH] fix host-endianness bug
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>, "Konrad,
 Frederic" <Frederic.Konrad@amd.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z54ohtyWDddW

On Wed, 24 Apr 2024 at 19:13, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Add a function xlnx_dpdma_read_descriptor() that
> combines reading the descriptor from desc_addr
> by calling dma_memory_read() and swapping desc
> fields from guest memory order to host memory order.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  hw/dma/xlnx_dpdma.c | 38 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index 1f5cd64ed1..5fd4e31699 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -614,6 +614,38 @@ static void xlnx_dpdma_register_types(void)
>      type_register_static(&xlnx_dpdma_info);
>  }
>
> +static MemTxResult xlnx_dpdma_read_descriptor(XlnxDPDMAState *s, uint8_t channel,
> +                                        uint64_t desc_addr, DPDMADescriptor *desc)
> +{
> +    if (dma_memory_read(&address_space_memory, desc_addr, &desc,
> +                            sizeof(DPDMADescriptor), MEMTXATTRS_UNSPECIFIED)) {
> +        s->registers[DPDMA_EISR] |= ((1 << 1) << channel);
> +        xlnx_dpdma_update_irq(s);
> +        s->operation_finished[channel] = true;

I think these three lines in the if() here should remain at the callsite --
although we only have one place that reads a descriptor at the
moment, different callers might in theory handle the descriptor-read
failure differently.

> +        return MEMTX_ERROR;

Otherwise this looks good; thanks.

-- PMM
