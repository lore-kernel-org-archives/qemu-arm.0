Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2237987njb;
        Mon, 21 Oct 2024 02:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnisREjJ+LZ9HTmsubh0oIVl35THkWK+45PvhXAVp5aYCpMqsLB5B4MQ7EH4YeVU0q6azc7FDPxxIeXg==@linaro.org
X-Google-Smtp-Source: AGHT+IHmNEyVZZlKybfg9UPea7y36Vlj/+DhxSEKk2TO7a2Hep7AKedtNZcgaCHaPlZ+wjtUuCtP
X-Received: by 2002:a05:620a:4628:b0:7ac:a077:6a3d with SMTP id af79cd13be357-7b157b435d1mr1397496485a.10.1729501624086;
        Mon, 21 Oct 2024 02:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729501624; cv=none;
        d=google.com; s=arc-20240605;
        b=kVJMH0B9lbaTKyivSafuDiAXRnaMSZmJMTPzYGD8cqYVlOt2l+TXta1efrbcf9aG0f
         bQDdpGSb8ipsL9JrwhUmxhTX3KQMgOLba/HNhCwfKGXnYunglO4PuhNTdlcvzd+rTYOF
         N894XrrXg49lQP+QwQtP9TTkn3ZKkWYclEUUPJfexmdkOwZZ5f4g0fxc/DpVWWmye52O
         aGhxBXit1blzPawjYEew4PRPS8+GY/+Mgnzq3olBHKCvRnkeaUoXKeVXpFjj0yXtfZll
         OqqZqFB9ZNsyuHdihG8ceO+QSqtPxM0GmyE8U/rl3yvnwghMUt5ONKLDLuPUMvocRrCv
         C8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=1D9eiNHhKybG69vrZPV59X1C/L0MpjJWJ1onWHxT6OA=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=NsXWIDe90kjeXy1GztAoIMyn0lYNQoYbPjMehlMXXKmLRAXVmGv0ShJqnphW+JXBOh
         pqy063JdA49WwgZmqCfYJpV0XxlSpIB4o1CMAIpXIQPYC0Me3mW6sOatQu1WAQFZTajc
         r72Ys5VVnA/bEFGU5PTmmRuvlRZSon5nq/o/R/qd7b0AI6Ex17EVyVW4pWti1kierz8Z
         SRBpmSZhFzF0EpnjDBLi0OUtOHy/WfPAkq2K7ePDcdLpznWS5Ilqp/UUfllpFIbMWlnQ
         QctHV4bGDcdWSlKi+CuNiG6wxjVk+ujwpN93Uo1uKLTWR1cfwxc/GB/B/ZYbjyZwI9vt
         zqLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a6afcbsi349041385a.270.2024.10.21.02.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2oN5-00012Q-Ah; Mon, 21 Oct 2024 05:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2oN0-00011F-Tg; Mon, 21 Oct 2024 05:06:34 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2oMz-0008RM-5G; Mon, 21 Oct 2024 05:06:34 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX8Yx1RkRz4wxx;
 Mon, 21 Oct 2024 20:06:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX8Yq6l0Bz4wb5;
 Mon, 21 Oct 2024 20:06:23 +1100 (AEDT)
Message-ID: <05d86744-c702-43eb-8d27-164608c6ba22@kaod.org>
Date: Mon, 21 Oct 2024 11:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] [PATCH v1 05/16] hw/arm/aspeed: Correct spi_model w25q256
 for ast1030-a1 EVB.
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
 <20241018053112.1886173-6-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018053112.1886173-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: wp6Ys3Hj7Sfx

On 10/18/24 07:31, Jamin Lin wrote:
> Currently, the default spi_model was "sst25vf032b" whose size was 4MB for
> ast1030-a1 EVB. However, according to the schematic of ast1030-a1 EVB,
> ASPEED shipped default flash of spi1 and spi2 were w25q256 whose size
> was 32MB.
> 
> Correct spi_model default flash to w25q256 for ast1030-a1 EVB.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cf0c6c580b..bf68224295 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1643,7 +1643,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       amc->i2c_init = ast1030_evb_i2c_init;
>       mc->default_ram_size = 0;
>       amc->fmc_model = "sst25vf032b";
> -    amc->spi_model = "sst25vf032b";
> +    amc->spi_model = "w25q256";
>       amc->num_cs = 2;
>       amc->macs_mask = 0;
>       aspeed_machine_class_init_cpus_defaults(mc);

