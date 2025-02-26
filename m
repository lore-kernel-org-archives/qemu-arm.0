Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp824417njg;
        Wed, 26 Feb 2025 03:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXh3BhuDUPk6sBnyZ7NUx46u7F+oSEhUXaze99LGZ6XCF0tBJVfD+tD6EQUjKCF08wV14L/CHLMRSYXPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFT/grIHU1hMHF6rWun8OxvyWOFaf35vhmsuCCM6q+bWUphAIIF+/oqxxw9LPfFFIIF6JQ5
X-Received: by 2002:a05:620a:d95:b0:7c0:82cb:f430 with SMTP id af79cd13be357-7c247f42e6dmr353659085a.27.1740568281478;
        Wed, 26 Feb 2025 03:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740568281; cv=none;
        d=google.com; s=arc-20240605;
        b=FZju+IU7CEw4/dWwukT80KrRvQqG5o8JFV8d6m8ithxive0dYhcvfTOQGDm/2Dqy7s
         k/4AY9gGjxJVQLOYsU+SEbJiDxjBsEftP0KSl4T5Ak3Q/dTJdFcwIqXVhXXg2QzmjbOJ
         /bZztZqxWcwDynQlpxzoRXtmNCsp8JXP8l7CuAY2XSK9hnxbyEaVNHF2NJr4J+GGosk7
         hdMcLjuB/9jOs3PjzOlZ1kM5+qCUf9LTTGltbclfVc9L/1CBzjM9urQUmUDhVyOxFE78
         iYIbu0WxaQaxMHi9bYEblLMuIv2P5XqexGktX4NeAM5ng0fMGEjc6z4OXnjCvx19Q9N8
         LQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=aVcLI2F79oA5VpKyYwKaCV7+PnY0bsRktpKSFx3zLW4=;
        fh=Z2qDztSV8CWVU0ChRWBZcc7s5uQfKpc4TkuCRqvdIcI=;
        b=eCove87FdhvG1IV+38E7Sik/LACPx4KCJ5c/u9nEoZ6kFjqOH2im9ork9YgxCgtfCq
         rNov5uXSlQB8VKh7TiObveOOnGoCNS61euDKZ+IJSkPa105XX/Z9b32C0goxIcuHyaV0
         ewegZvmr1yeJwJ1Yyksf/v8eXvvYaRldnFRlPt2l/vGE6cnEAlVi9m6rlbpZE2UPXai8
         fa2FQfIum2Ln0Kpz62dXfe08/KPGLgWmc9TAoE1qmk4APqk04I0CQqpHY37nJJB7zTDw
         A2Oepu2SfU686OjyeMhWehC2wDkAWOwGloa1REpJ4DCU+I40YwRpvi0Nk6EacPP8xiTR
         OiwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2d8bd2si362782885a.412.2025.02.26.03.11.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 03:11:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnFJV-0000Or-Ml; Wed, 26 Feb 2025 06:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7zlN=VR=kaod.org=clg@ozlabs.org>)
 id 1tnFJT-0000Oc-B4; Wed, 26 Feb 2025 06:10:51 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7zlN=VR=kaod.org=clg@ozlabs.org>)
 id 1tnFJQ-0000RV-Cx; Wed, 26 Feb 2025 06:10:51 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z2sFy1dTQz4x2g;
 Wed, 26 Feb 2025 22:10:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2sFt29Pkz4x1V;
 Wed, 26 Feb 2025 22:10:23 +1100 (AEDT)
Message-ID: <598b3498-267a-44de-98a3-1a0e4ac39d86@kaod.org>
Date: Wed, 26 Feb 2025 12:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] hw/misc/aspeed_hace: Fix boot issue in the Crypto
 Manager Self Test
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
 <20250225075622.305515-5-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250225075622.305515-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=7zlN=VR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dNGK9WkFn/0C

On 2/25/25 08:56, Jamin Lin wrote:
> Currently, it does not support the CRYPT command. Instead, it only sends an
> interrupt to notify the firmware that the crypt command has completed.
> It is a temporary workaround to resolve the boot issue in the Crypto Manager
> Self Test.
> 
> Introduce a new "use_crypt_workaround" class attribute and set it to true in
> the AST2700 HACE model to enable this workaround by default for AST2700.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/misc/aspeed_hace.h |  1 +
>   hw/misc/aspeed_hace.c         | 23 +++++++++++++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index d13fd3da07..5d4aa19cfe 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -50,6 +50,7 @@ struct AspeedHACEClass {
>       uint32_t dest_mask;
>       uint32_t key_mask;
>       uint32_t hash_mask;
> +    bool raise_crypt_interrupt_workaround;
>   };
>   
>   #endif /* ASPEED_HACE_H */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 86422cb3be..32a5dbded3 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -59,6 +59,7 @@
>   /* Other cmd bits */
>   #define  HASH_IRQ_EN                    BIT(9)
>   #define  HASH_SG_EN                     BIT(18)
> +#define  CRYPT_IRQ_EN                   BIT(12)
>   /* Scatter-gather data list */
>   #define SG_LIST_LEN_SIZE                4
>   #define SG_LIST_LEN_MASK                0x0FFFFFFF
> @@ -343,6 +344,15 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                   qemu_irq_lower(s->irq);
>               }
>           }
> +        if (ahc->raise_crypt_interrupt_workaround) {
> +            if (data & CRYPT_IRQ) {
> +                data &= ~CRYPT_IRQ;
> +
> +                if (s->regs[addr] & CRYPT_IRQ) {
> +                    qemu_irq_lower(s->irq);
> +                }
> +            }
> +        }
>           break;
>       case R_HASH_SRC:
>           data &= ahc->src_mask;
> @@ -388,6 +398,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>       case R_CRYPT_CMD:
>           qemu_log_mask(LOG_UNIMP, "%s: Crypt commands not implemented\n",
>                          __func__);
> +        if (ahc->raise_crypt_interrupt_workaround) {
> +            s->regs[R_STATUS] |= CRYPT_IRQ;
> +            if (data & CRYPT_IRQ_EN) {
> +                qemu_irq_raise(s->irq);
> +            }
> +        }
>           break;
>       default:
>           break;
> @@ -563,6 +579,13 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
>       ahc->dest_mask = 0x7FFFFFF8;
>       ahc->key_mask = 0x7FFFFFF8;
>       ahc->hash_mask = 0x00147FFF;
> +
> +    /*
> +     * Currently, it does not support the CRYPT command. Instead, it only
> +     * sends an interrupt to notify the firmware that the crypt command
> +     * has completed. It is a temporary workaround.
> +     */
> +    ahc->raise_crypt_interrupt_workaround = true;
>   }
>   
>   static const TypeInfo aspeed_ast2700_hace_info = {

