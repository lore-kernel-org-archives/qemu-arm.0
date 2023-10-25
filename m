Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2547791ejb;
        Wed, 25 Oct 2023 00:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEtxn6/jx+PsxRIQ2KUJ6eB/rsYMPH7AMzsI019H+uziF+FubsmkjlrTafVNwTwTfr/HCI
X-Received: by 2002:a05:6214:268d:b0:66d:1d92:c692 with SMTP id gm13-20020a056214268d00b0066d1d92c692mr15913872qvb.16.1698217915065;
        Wed, 25 Oct 2023 00:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217915; cv=none;
        d=google.com; s=arc-20160816;
        b=eYhzlb+C+1ZdpuI6a8f5JFFIIjzd/NXWk2nXRzdLBIDbddTYTPTHyYImr+eatuXG+d
         0Tu3wf5vYOREopu48C2QPravi2dt7MoKZ9XDo10L5cNc64peJhQPKjqNlr+WtORKLKmS
         nozk27cckL0PRjFZZ3TGOOiz8+Ac4RFsBR5MqO6F90J8L84MHmrNYk4XALFmWuMbmbwT
         ycYHQgLYYwY5j+FdUYgzcUku4T+6pvNIWZwsvp5MGSY6fE8psBZxreBU/Z5MgRFDoGXt
         ZB3K0dl4SjQ+J7g0iqJ3aKGsTbk7gac5CgU2uuO4AN3ZHfujIWutv89mKdTmY8M9whim
         wXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=SLLokBlYCMcuLW9VMGMpgUQ80i11W1SUqwsW6tNXFqk=;
        fh=keE2KatKG8lbgXGZXmt3WBgtkhQ6uEw33ggpupitLEY=;
        b=bDczunQWQEC55NCi8X5b2sjPDke+qLV8SN1GN6//H4C85g6j6JWZk6EiqKkyP+wmSx
         z+eBdQ/V+Xi8gCDdoA2wiz7zc0AVwzFIafdQXg04hMI8HYpytuS8HjNnc6WiC1VE9X7T
         jcD3tY4f/VEC6RNwG3brUcYxHCN3CLYLaAIqHyIfZDwVRmYLhJs/JShcyOLMrmoXWS+M
         raU34eBC8m+dKBXEaY1bkZP8LnN/7refgaZvhIqI529iasTwJVLO5XdbuIxG1bH8gb2U
         Xys7ABpaqKTD508bZH0uf3cFKP1FxInasZR2l//0/M7YmiVe5H23hJt6mF2HXxRuA/jE
         veoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cu16-20020a05621417d000b0066d239d89bdsi7830363qvb.445.2023.10.25.00.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 00:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvY3M-0001px-Km; Wed, 25 Oct 2023 03:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY3K-0001e2-TO; Wed, 25 Oct 2023 03:11:42 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY3H-0001gm-UF; Wed, 25 Oct 2023 03:11:42 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFg8R00JRz4wwG;
 Wed, 25 Oct 2023 18:11:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFg8N0lZGz4wdB;
 Wed, 25 Oct 2023 18:11:31 +1100 (AEDT)
Message-ID: <851245b8-c697-4cf2-ab59-8cfc2f28aed0@kaod.org>
Date: Wed, 25 Oct 2023 09:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] hw/arm/aspeed: Check 'memory' link is set in common
 aspeed_soc_realize
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20231024162423.40206-1-philmd@linaro.org>
 <20231024162423.40206-9-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231024162423.40206-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ASE8YIKk6+1p

On 10/24/23 18:24, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_soc_common.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
> index b66f769d18..828f61093b 100644
> --- a/hw/arm/aspeed_soc_common.c
> +++ b/hw/arm/aspeed_soc_common.c
> @@ -114,6 +114,16 @@ void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
>                                           sysbus_mmio_get_region(dev, 0), -1000);
>   }
>   
> +static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> +{
> +    AspeedSoCState *s = ASPEED_SOC(dev);
> +
> +    if (!s->memory) {
> +        error_setg(errp, "'memory' link is not set");
> +        return;
> +    }
> +}
> +
>   static Property aspeed_soc_properties[] = {
>       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> @@ -126,6 +136,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
> +    dc->realize = aspeed_soc_realize;
>       device_class_set_props(dc, aspeed_soc_properties);
>   }
>   

