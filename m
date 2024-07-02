Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1757552njm;
        Mon, 1 Jul 2024 22:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXc6LMjWsLbkZMc+3qm2RbuF4PZD0jzRzWN6YhlDyJh7Yg4OKMc/TqQtgPPumjADZ9lAFbE0NPfcqYDMVOm6ENDrw12Y1Zc
X-Google-Smtp-Source: AGHT+IEtnx38hhfIqPFsg2b1z/R1jinV8mrvBm0w6JOdnssNFHg7i8gO6AJYHMsItgkPiPJlgqyd
X-Received: by 2002:a05:620a:20d8:b0:79d:81be:4c85 with SMTP id af79cd13be357-79d81be564emr713065985a.6.1719899829827;
        Mon, 01 Jul 2024 22:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719899829; cv=none;
        d=google.com; s=arc-20160816;
        b=SI9UWGR23O/F50qV4ZT7xocAR6pzooH8IN2E8nMgBgHW8f2vpADegh2qOMPRLY8W3d
         /GCtkpRcYmV1yCroMb63jceSs2zeRSxWl9/ML6nJYAWgdEWT6cfVm1MjKaBTUh9A8cWe
         pg+owr1iKg7e2o7uIeVVtnXIZRolYCUEwTmPoTugRdDa1P1YA/niEnhNeyg6bm1i0jk/
         IcUFScLpIV/+6443P4VwPcUZmfrvR+d1qMSBnm9gYnaA8MYIFDgJD2lNYZ1Lyxp9DIzg
         cNQacOtC69n0peRx9aHbOoWjBTJhOFnmn+ktUYxJiE52BjOdgohHcMPH4VCo8f6A1BB4
         6Y0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=bvtemdnPGuKzj6c4qwgZiLscV6UzHMa+WEeA9sTspnQ=;
        fh=GyRCLZ+FHPHbrsiXEBSHGryq1Ew36XyJ1Dr4ER/UGoM=;
        b=z9HA/B7u+MBNqRV7hBpLOZIUO+nHVWYr/IXkkcGek42YQZCHoV7oArCu2zq6x/dT53
         EEAGndR5wDbU3zOgkfIJdqzMHCj0cxjznQ9IxInwM85xWr3/rFRvwNpUFdi5i0ZpEdra
         ZQWRh3oIE+ckB/TFrLqygUYrJKUVpjp0IWd6xyt1uPxCbn4iGxfci0hMmvuU7FX9knO2
         qXKRjswaFGwZdwFg+zt0GJDLxbNj426As8y4ve7gLVPNDgC/kj2aYfeaKevloMy3zt4Q
         YEpMDFXUkqObWYmXQMOHSRo8mz29BJh2fadd0aE9OFZpSsI+0LfOrPch8R/lKF3UK3CX
         Ma9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6934d146si944696385a.726.2024.07.01.22.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 22:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOWVe-0005WM-Hg; Tue, 02 Jul 2024 01:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWVd-0005RJ-VQ; Tue, 02 Jul 2024 01:56:57 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWVc-0007Ot-5y; Tue, 02 Jul 2024 01:56:57 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WCscN6Vkdz4x0C;
 Tue,  2 Jul 2024 15:56:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCscL1CKfz4wnr;
 Tue,  2 Jul 2024 15:56:49 +1000 (AEST)
Message-ID: <ebc70620-1793-472d-8d37-c9f0225cdd1e@kaod.org>
Date: Tue, 2 Jul 2024 07:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aspeed: Deprecate the tacoma-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240625070830.492251-1-clg@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240625070830.492251-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fXIt=OC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: NlwyeYm6Mgz2

On 6/25/24 9:08 AM, Cédric Le Goater wrote:
> The tacoma-bmc machine was a board including an AST2600 SoC based BMC
> and a witherspoon like OpenPOWER system. It was used for bring up of
> the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
> machine which is part of a real product offering.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>


Applied to aspeed-next.

Thanks,

C.


> ---
> 
>   Changes since v2:
>   - rephrased deprecation reason
>   - remove extra line in docs
>   
>   docs/about/deprecated.rst | 8 ++++++++
>   hw/arm/aspeed.c           | 2 ++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index ff3da68208ac..5d9e4d8de725 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -256,6 +256,14 @@ images are not available, OpenWRT dropped support in 2019, U-Boot in
>   2017, Linux also is dropping support in 2024. It is time to let go of
>   this ancient hardware and focus on newer CPUs and platforms.
>   
> +Arm ``tacoma-bmc`` machine (since 9.1)
> +''''''''''''''''''''''''''''''''''''''''
> +
> +The ``tacoma-bmc`` machine was a board including an AST2600 SoC based
> +BMC and a witherspoon like OpenPOWER system. It was used for bring up
> +of the AST2600 SoC in labs.  It can be easily replaced by the
> +``rainier-bmc`` machine which is a real product.
> +
>   Backend options
>   ---------------
>   
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 40dc0e4c76db..53a4f665d0d0 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1379,6 +1379,8 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
>       amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
>       mc->default_ram_size = 1 * GiB;
>       aspeed_machine_class_init_cpus_defaults(mc);
> +
> +    mc->deprecation_reason = "Please use the similar 'rainier-bmc' machine";
>   };
>   
>   static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)

