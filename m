Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3249715njc;
        Wed, 18 Jun 2025 08:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQlvZ4Lj6FjFl036G/f+X53jGZ5heJLG5Vgcy+GZHuoSfu14s1jv9koI7LNnwW6dQXpIAbF3Wj+YiADw==@linaro.org
X-Google-Smtp-Source: AGHT+IF3Qhow5wDfxzHY/UbE4c22yRSsZsG12EtjxnlGLhJdM7tIUrg8ePGEL+P3o63zVKBnw2dJ
X-Received: by 2002:ac8:5a0f:0:b0:476:ff0d:ed6c with SMTP id d75a77b69052e-4a73c5a5ae7mr274320131cf.40.1750259084452;
        Wed, 18 Jun 2025 08:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750259084; cv=none;
        d=google.com; s=arc-20240605;
        b=YJEiI5vjgSIQHAmDU6e84z7yk5D9e2lFTk9CUC778kpoe3QSbd8jc3VjBuqRIeViZF
         9znIYzLVoXIe3omGReIMwhjUrUwQf00bPjjy1gwdmrwX6KUkYQWleuPEFWFHlxlkcrLR
         ALVV8a555RsYAoY1eCmRM8gyMI6AyigxCm3nSred7iwiwfcAZk9WaGAm18/2g6/4idXl
         TMP1dxyy/Q2Jueltb+SXdlaSfAfpXpouf+55YuvCkboeYYJ3Un2UWstr+BDGHTmCkf1e
         vCXuHVkaXMm2KAv8CpNjHrUFYUaU6tU6Hxq4L4BPS8eBhkFAqsOAu9lhFxL2GjlyaQSW
         kuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=zw2N7rO8IZbrSIwZgUJX2kZ91Aia55esppxXkIyfR/w=;
        fh=Z2qDztSV8CWVU0ChRWBZcc7s5uQfKpc4TkuCRqvdIcI=;
        b=e6XnPspjVe+Lxk6+TMBswtyeIJ0UoFa/QncTCSdALt8ka3YGuVFQ6QEJAxZTaDHt2d
         Z6wM6QJs/pfXBh0cBgadfOlnRXsXGhnR1brSSS+LSBDFQNT7MHVEJ1LESQjRn1Gj7xET
         l2ty03Wu4csy1pMAWJ+wAKnwu9pddiDL1Ta6MnFoqdFE4OcHXiWEv54U/PWqWlYpygrN
         ApoIkTdCuQeejUNSWKuBZt3fGe22KJLIiQlrhyTTg2D8aUdMSZ5HSRE8/RIczT27aXPY
         lwoa4r9jmdUpGcXdLf78+IJVor4GtyI+VHDFOI6mm49ZviXPpGVsotgPhJDDMhJ0kUTR
         y01Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a761fbafa1si23842731cf.318.2025.06.18.08.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 08:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRuKw-0008HY-Po; Wed, 18 Jun 2025 11:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zn5s=ZB=kaod.org=clg@ozlabs.org>)
 id 1uRuKu-0008H7-SH; Wed, 18 Jun 2025 11:04:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zn5s=ZB=kaod.org=clg@ozlabs.org>)
 id 1uRuKs-0007Dq-Dt; Wed, 18 Jun 2025 11:04:24 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bMn833m91z4x5k;
 Thu, 19 Jun 2025 01:04:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMn802yt8z4x11;
 Thu, 19 Jun 2025 01:04:16 +1000 (AEST)
Message-ID: <0e4c20ad-8271-4122-ae32-4b8e9419228f@kaod.org>
Date: Wed, 18 Jun 2025 17:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] hw/misc/aspeed_scu: Support the Frequency Counter
 Control register for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250618080006.846355-1-jamin_lin@aspeedtech.com>
 <20250618080006.846355-3-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250618080006.846355-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=zn5s=ZB=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.067, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: yxqxbvL9wCao

On 6/18/25 10:00, Jamin Lin wrote:
> According to the datasheet:
> BIT[1] (SCU_FREQ_OSC_EN) enables the oscillator frequency measurement counter.
> BIT[6] (SCU_FREQ_DONE) indicates the measurement is finished.
> Firmware polls BIT[6] to determine when measurement is complete.
> The flag can be cleared by writing BIT[1] to 0.
> 
> To simulate this hardware behavior in QEMU:
> If BIT[1] is set to 1, BIT[6] is immediately set to 1 to avoid
> firmware hanging during polling.
> If BIT[1] is cleared to 0, BIT[6] is also cleared to 0 to match
> hardware semantics.
> 
> The initial value of this register is initialized to 0x80, reflecting the
> default value confirmed from an EVB register dump.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/misc/aspeed_scu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 4930e00fed..11d0739108 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -176,6 +176,7 @@
>   #define AST2700_SCUIO_UARTCLK_GEN       TO_REG(0x330)
>   #define AST2700_SCUIO_HUARTCLK_GEN      TO_REG(0x334)
>   #define AST2700_SCUIO_CLK_DUTY_MEAS_RST TO_REG(0x388)
> +#define AST2700_SCUIO_FREQ_CNT_CTL      TO_REG(0x3A0)
>   
>   #define SCU_IO_REGION_SIZE 0x1000
>   
> @@ -1022,6 +1023,10 @@ static void aspeed_ast2700_scuio_write(void *opaque, hwaddr offset,
>           s->regs[reg - 1] ^= data;
>           updated = true;
>           break;
> +    case AST2700_SCUIO_FREQ_CNT_CTL:
> +        s->regs[reg] = deposit32(s->regs[reg], 6, 1, !!(data & BIT(1)));
> +        updated = true;
> +        break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: Unhandled write at offset 0x%" HWADDR_PRIx "\n",
> @@ -1066,6 +1071,7 @@ static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
>       [AST2700_SCUIO_UARTCLK_GEN]         = 0x00014506,
>       [AST2700_SCUIO_HUARTCLK_GEN]        = 0x000145c0,
>       [AST2700_SCUIO_CLK_DUTY_MEAS_RST]   = 0x0c9100d2,
> +    [AST2700_SCUIO_FREQ_CNT_CTL]        = 0x00000080,
>   };
>   
>   static void aspeed_2700_scuio_class_init(ObjectClass *klass, const void *data)

