Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1757630njm;
        Mon, 1 Jul 2024 22:57:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtEbzw5RyB0MqrdFBv3x93DkgihAQsy16NrdIOkNV4wUYibx+ad/95Dj5mgUyNIeeBiR7RhfcK7BMkcx7WM3Ink/sY+pC+
X-Google-Smtp-Source: AGHT+IEJ1miIN2aKbzRF4lUeDuPWitAoILI5L5Q8bHYy4ObFF1PT0O6slzDBWIfcCfoxAP5dPogf
X-Received: by 2002:a05:6214:5086:b0:6af:c2ec:3313 with SMTP id 6a1803df08f44-6b5a545b323mr158115636d6.26.1719899851058;
        Mon, 01 Jul 2024 22:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719899851; cv=none;
        d=google.com; s=arc-20160816;
        b=RkC7vZKBkyJmQzxLY/Rgds4JNIezq4TPd9THC0cUF/nrkPEORy0gJCWLhEGnpfgddK
         p0CGgupj5oZmGi3AIwbBHPWCS1dg2pgLd7lwN/d4e/olqBr06hvr0r4hsKq7DBnpTU+p
         6XH3emHTEAF0RMcsAb40HXAa3NhJyd1332Cgc6xEh1XzqMgED7ihO+1PTQpaXwPlkYKI
         HUOO8Tns/CgwUfuUIzd0JxBenSpMpmKja8nzVAhYEtt9t1Kd9MDSUB3hAVd7Dk4J6Qz9
         p53ONXAMW3JHtHjCWRCML7dAl7eXxZ3XLVD6aiSJ6ITjo0/wnlJR/n7F7Dh7wZEdfjjA
         JnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=C1KvnYJu55hTyCLG1jm4TMq1FtwHeymDqFxijB63VyM=;
        fh=wQB3y0QfZOTScFSF7ePz31ns8HhdNXzz28N+A/aJsrY=;
        b=wAJFjFRD9UCZpTBRMAKnvu/AhfFViiCMWgvQpH4tsk92H98G1WhPGVYlmKn6QXiozY
         bTgx1WN5/rp6d4ERtgtNpL4ufsiqkjJy8l+h7Jmj41ELCuDQvZujpld/o1NFioMzPHVC
         8beglDfz8DZdIQWgdGNt+l6JUTmYZyfIEsWbSGc5G6Iz8TSfIppeQWCeyJY2KbQfEQqs
         R9TbUdeMNmzpEXQ4hPLHuchrfEZMj4uZHvNVn6JdODYdfS1e6XbjUfCuGZqoajeOAfrm
         ISG+sZkk+UzvlE6+fnr79IZdoiwDwtWH+iN93/itQevbXBgVIYdHYOckay1JlNML7txN
         mp9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44668fda0c5si52753141cf.530.2024.07.01.22.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 22:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOWW8-0006do-BM; Tue, 02 Jul 2024 01:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWW7-0006cn-EF; Tue, 02 Jul 2024 01:57:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fXIt=OC=kaod.org=clg@ozlabs.org>)
 id 1sOWVy-0007Um-RO; Tue, 02 Jul 2024 01:57:27 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WCscn32j4z4x0t;
 Tue,  2 Jul 2024 15:57:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCsck5M6Wz4wnr;
 Tue,  2 Jul 2024 15:57:10 +1000 (AEST)
Message-ID: <9399eeb7-bf05-4b8f-8d6f-b8d4511320bc@kaod.org>
Date: Tue, 2 Jul 2024 07:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed/sdmc: Check RAM size value at realize time
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20240625065839.485034-1-clg@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240625065839.485034-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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
X-TUID: Ab+qRHYCO4Ae

On 6/25/24 8:58 AM, Cédric Le Goater wrote:
> The RAM size of the SDMC device is validated for the SoC and set when
> the Aspeed machines are initialized and then later used by several
> SoC implementations. However, the SDMC model never checks that the RAM
> size has been actually set before being used. Do that at realize.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>


Applied to aspeed-next.

Thanks,

C.


> ---
>   hw/misc/aspeed_sdmc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 94eed9264d09..ebf139cb5c91 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -271,6 +271,12 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
>       AspeedSDMCClass *asc = ASPEED_SDMC_GET_CLASS(s);
>   
>       assert(asc->max_ram_size < 4 * GiB || asc->is_bus64bit);
> +
> +    if (!s->ram_size) {
> +        error_setg(errp, "RAM size is not set");
> +        return;
> +    }
> +
>       s->max_ram_size = asc->max_ram_size;
>   
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,

