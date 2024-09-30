Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1108959njc;
        Mon, 30 Sep 2024 02:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBKfKp34AAl0vysnd5Lf4AGrCa7A5oNNnJxFWjzp9nsTvZYcaelGsgoS/+Ku47HHeB/9qf5oCcbaylxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFrPwig5zTPX8+rWas8ltnfcQ5R09P+/x+XaxRX3PgqjrOmzTQnzqKmfLdn4bMwFoxdjuPy
X-Received: by 2002:a05:6214:5d91:b0:6c5:8cfe:d90 with SMTP id 6a1803df08f44-6cb3b63d30cmr148923566d6.35.1727687552659;
        Mon, 30 Sep 2024 02:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727687552; cv=none;
        d=google.com; s=arc-20240605;
        b=XauCRyzK9HsExmexwGvHZMXsExTRdhJqhLh7oyjJ2v0xXV63sBpgoqhzzEiTlbJKv0
         9Ydf7qZkrjUti3zzsbnt5Ht8iVbmt48Bk/d0QTfQRw9sgcjcCIzYDtNfKNF6ZhrkDF/h
         LGOQY9VCql+5SLnxczYo0LVg8Ui0FaeoVfbPaQPM5sxvbZehq6b2oE8G8oQmHP+BTlt0
         7GTDMi2yKUpJnY7ibZPS7prWQ8qNaDvh5ls79BIT/btIPaPBw2tX4S0EsmjhPO+AOoOC
         FUVBkQR0ZyOJ/34qh4s/zuzsAJnPiLZjvTOFN+V9LVxbOLKZy0QUcq4RA1cJKUg5hO4v
         Dx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=PSvEYj0dKJVVRWDByvKSHj+p1tVtxbisVKCp9nhqG/o=;
        fh=97uyR/uuvr4jnX3vPrzCNtEvGPs9ZT7AiNCQmcU+/V4=;
        b=W7zekqaMnFIzo+e7wq6Q4FhV3/D9uQOI/WiPU9/XjZiujFc//7iyvAwlvWzexBsznf
         hxgCVEcUrjXbsGs06zsSQDxFrQsIsZvOg3m95xAVALBTO5bKvPEfrpEOQtMotfN3WqKU
         RMZXJA5zSMF/8ZumZfT78IJTd6ybcLcQBSSfSKkRllCNAvpASmwtNqFGBlYsWp6scod8
         Qyre1Lf8pTw70kQXiDUNFF7bwZdKC4lY2TjwQjUCW/2A6jv9trx0HLT3dFPf004raLHn
         B8di5hIDWOZd8goEw3Zr+lhwmnX72DcYniWRfeA+2PG0aa1vwjn2s+H3mabOxs6sFia+
         BWcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b6a333esi82556356d6.474.2024.09.30.02.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 02:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1svCRg-00019F-Gq; Mon, 30 Sep 2024 05:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qSCK=Q4=kaod.org=clg@ozlabs.org>)
 id 1svCRe-0000zQ-Cw; Mon, 30 Sep 2024 05:11:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=qSCK=Q4=kaod.org=clg@ozlabs.org>)
 id 1svCRc-0004bQ-LI; Mon, 30 Sep 2024 05:11:54 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XHFgn5xb5z4wcr;
 Mon, 30 Sep 2024 19:11:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHFgh6jfhz4wcL;
 Mon, 30 Sep 2024 19:11:44 +1000 (AEST)
Message-ID: <936bb009-5339-43a3-86c9-f187e9d859f1@kaod.org>
Date: Mon, 30 Sep 2024 11:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v6 7/8] aspeed/soc: Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
 <20240930085239.3089901-8-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240930085239.3089901-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=qSCK=Q4=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: +Siw9Naz7EbE

On 9/30/24 10:52, Jamin Lin wrote:
> Add GPIO model for AST2700 GPIO support. The GPIO controller registers base
> address is start at 0x14C0_B000 and its address space is 0x1000.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed_ast27x0.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 99135edc1e..dca660eb6b 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -62,6 +62,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_GIC_REDIST]    =  0x12280000,
>       [ASPEED_DEV_ADC]       =  0x14C00000,
>       [ASPEED_DEV_I2C]       =  0x14C0F000,
> +    [ASPEED_DEV_GPIO]      =  0x14C0B000,
>   };
>   
>   #define AST2700_MAX_IRQ 288
> @@ -372,6 +373,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
>       object_initialize_child(obj, "i2c", &s->i2c, typename);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
> +    object_initialize_child(obj, "gpio", &s->gpio, typename);
>   }
>   
>   /*
> @@ -657,6 +661,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>       }
>   
> +    /* GPIO */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
> +                    sc->memmap[ASPEED_DEV_GPIO]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
> +
>       create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
>       create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
>       create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);

