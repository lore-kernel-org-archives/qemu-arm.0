Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1102406njf;
        Mon, 2 Sep 2024 06:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNXEObmHCfwOS/ppo72fpnJVLSBdj6VFVfYWluHRkZI7FfV8UqJY2JCZRCoRFi4VQu9aLVqrVgzFlE3w==@linaro.org
X-Google-Smtp-Source: AGHT+IH26DHyuM8YOI6c7CVef+ov4GM7/sEU+P50M7xFFsS0G3qhYANvZJToBHUksUSZuIomNReE
X-Received: by 2002:a05:620a:3941:b0:7a1:e37c:bde0 with SMTP id af79cd13be357-7a804c7fc2fmr2328198985a.24.1725283734015;
        Mon, 02 Sep 2024 06:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725283734; cv=none;
        d=google.com; s=arc-20160816;
        b=gAukfX+bKUe971D8ovzNSVGk9Yd43KH/RU8ANkQfuPXxf3vWfb0bjEY//jkWyL3LN0
         wB+iCIOFk5eaXLworFSfMxOMR6Vave+hIKxiiSOdo4WA7c9BFzonjeg+piaGg6qAJdEW
         SXmnIzjhfGuUZr0r4mIDbPjVbq6IlsXaLQoOQFQjvZ99SlwQpsKeclqsDXYSKLjt3ZpV
         fHs4hbcioWosS1JKg1J+XG1vBpVfX2pl4vEC85D9bTziX11CT0/aD86rUtm2GdVkgnNd
         0bBLc1GII7jymPym56fVMChp1JIVCz7/zPwiglfMuQVjeA/BcmRnkADUekJmitQg7xzV
         9FQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=bFVs1uxryVB7I6d8wOS9ItmNets7yWU8N5ye1Z+iASs=;
        fh=+y/GHvpFiqVUhF0FBwhjWHFyMV+LFDYOf6Y0AporVsA=;
        b=qlk0HbBU7lErPkWSkrEX6XKAUuBsFtBKBOg8Cht8wSI5g/uk9QFOye7KDhHyO3zi+k
         +y1AZFIIzozqdkgH8MdXmWOeZkiTol43Sju7OgxFlaU856JmoxehUctscHfkIRbUCWOa
         QiYivX5MHYzBUwwynSJFrEYWigpIaeoRHiqMxRNBLN1V52KDamjcyZLNISJUh9mWLvs8
         zBSlBHngnWIgfU8Ot61mJ9tgD7NFMyBqllKGK9P2CEiU+vdtLojiJ/j8DVn3kcVgY1Cu
         PiJqaZXKEV88z9tpldl2Qu6V3idAPWEM3gB8GfUesShcWzB6BBN1zcfLdx/3nCm1nvWY
         ladQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806db9acesi840832585a.641.2024.09.02.06.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 06:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl76h-0001sp-KX; Mon, 02 Sep 2024 09:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3a9v=QA=kaod.org=clg@ozlabs.org>)
 id 1sl76e-0001hM-NF; Mon, 02 Sep 2024 09:28:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3a9v=QA=kaod.org=clg@ozlabs.org>)
 id 1sl76c-0007Ko-8r; Mon, 02 Sep 2024 09:28:32 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Wy8hq006Zz4xGl;
 Mon,  2 Sep 2024 23:28:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wy8hj5Xbtz4xCy;
 Mon,  2 Sep 2024 23:28:21 +1000 (AEST)
Message-ID: <0e62d8ed-f30d-4b18-914b-89a51d6d9687@kaod.org>
Date: Mon, 2 Sep 2024 15:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] hw/i2c/aspeed: support high part dram offset for
 DMA 64 bits
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
 <20240808024916.1262715-8-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240808024916.1262715-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3a9v=QA=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: U5yQwr3gMGLg

Jamin,

Please adjust commit title

On 8/8/24 04:49, Jamin Lin wrote:
> ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
> And the base address of dram is "0x4 00000000" which
> is 64bits address.
> 
> The AST2700 support the maximum DRAM size is 8 GB.
> The DRAM physical address range is from "0x4_0000_0000" to
> "0x5_FFFF_FFFF".
> 
> The DRAM offset range is from "0x0_0000_0000" to
> "0x1_FFFF_FFFF" and it is enough to use bits [33:0]
> saving the dram offset.
> 
> Therefore, save the high part physical address bit[1:0]
> of Tx/Rx buffer address as dma_dram_offset bit[33:32].
> It does not need to decrease the dram physical
> high part address for DMA operation.
> (high part physical address bit[7:0] – 4)
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/i2c/aspeed_i2c.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index c1ff80b1cf..44c3c39233 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -743,6 +743,14 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>                         __func__);
>           break;
>   
> +    /*
> +     * The AST2700 support the maximum DRAM size is 8 GB.
> +     * The DRAM offset range is from 0x0_0000_0000 to
> +     * 0x1_FFFF_FFFF and it is enough to use bits [33:0]
> +     * saving the dram offset.
> +     * Therefore, save the high part physical address bit[1:0]
> +     * of Tx/Rx buffer address as dma_dram_offset bit[33:32].
> +     */
>       case A_I2CM_DMA_TX_ADDR_HI:
>           if (!aic->has_dma64) {
>               qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
> @@ -752,6 +760,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>           bus->regs[R_I2CM_DMA_TX_ADDR_HI] = FIELD_EX32(value,
>                                                         I2CM_DMA_TX_ADDR_HI,
>                                                         ADDR_HI);
> +        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
> +                                         extract32(value, 0, 2));
>           break;
>       case A_I2CM_DMA_RX_ADDR_HI:
>           if (!aic->has_dma64) {
> @@ -762,6 +772,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>           bus->regs[R_I2CM_DMA_RX_ADDR_HI] = FIELD_EX32(value,
>                                                         I2CM_DMA_RX_ADDR_HI,
>                                                         ADDR_HI);
> +        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
> +                                         extract32(value, 0, 2));
>           break;
>       case A_I2CS_DMA_TX_ADDR_HI:
>           qemu_log_mask(LOG_UNIMP,
> @@ -777,6 +789,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>           bus->regs[R_I2CS_DMA_RX_ADDR_HI] = FIELD_EX32(value,
>                                                         I2CS_DMA_RX_ADDR_HI,
>                                                         ADDR_HI);
> +        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
> +                                         extract32(value, 0, 2));
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",

