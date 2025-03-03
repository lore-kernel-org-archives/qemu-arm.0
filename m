Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2610840njb;
        Mon, 3 Mar 2025 05:30:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+lturwhdVZ3glrIQs1Y298JSqLjFgO8Iab50rf+erTfklk97e5Xgf6yokjA1it9E9hZvc97IIZt/uMg==@linaro.org
X-Google-Smtp-Source: AGHT+IGd/+GdFEcN6slLzffsaBMw5Guj4Iw7q2F3h+I/dwXIXyiRdTcBSMW0Pt3jLEv7DnCtvGqq
X-Received: by 2002:a05:620a:268b:b0:7c3:ca0d:6ba2 with SMTP id af79cd13be357-7c3ca0d715emr40292185a.58.1741008648015;
        Mon, 03 Mar 2025 05:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741008647; cv=none;
        d=google.com; s=arc-20240605;
        b=K2T2RaqO5fXq1xeoAevxXcv+Nm3HcyW/abNgmVF8gLYanp1EhiTjhRADtIQ9epffzD
         aNem26S9mjah9JYM6eU2hasx04/q/Fcrs+3xpyCBRbfjk2b2wmNnItzioK0R5lcKDOYm
         i/S2YY7IjKmrnj3cYy8mxygo/z6akJYoC+oQxoU00yRyfOnwrTMSMsBlor9J4kYgCaD5
         DAA1GMQnOe+ENeCmsEq1SG96On4JYyjm9n/UraGNoFpGjU+IY7E+Kbfhbzh9BCr67MFM
         eQ0Sw5fEm1pUAaVWGm8SLzqQsaVA4O3lqbPFlnWOeIcr8YlQkNBShPoxwhKKdLzZxpMO
         fNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=o/rfoX8XWUB67kxTrj7Ps1R9rYIvYsiNGziU2shv484=;
        fh=Z2qDztSV8CWVU0ChRWBZcc7s5uQfKpc4TkuCRqvdIcI=;
        b=RyVRiXomUXptaWQHaenIiN/vfdsdayGLnaZIX+NlpKi8KFvkif6u8r63A4A3M/goal
         X5v2fZOTNTO5PZ0oElTrJPrCMjfMUrbLfPuf9ktJlcC3/XkZ9vU1aJYWaxIJSLz608tt
         0OROFfXTBWCkL1gkK83BJPDpIZiG93b0rdUEFov0vJhV6P/O0RP8+FgWXlFymsUh2WI2
         FMgoPuH9JWtOEy6wqCd2WSYTD5I6UUN1WXI9nwGxyLHl0+++WrgOqn78vDjkOB8pTM21
         TMl1nFtaKHd+Crh9gHz0VMo3wqGRyXk8N/7qBHxm8aUC/0CHpb13j2BXy6CtmOOKbaqL
         k2kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e5bc9si88006196d6.9.2025.03.03.05.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 05:30:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp5sV-0003Zo-8l; Mon, 03 Mar 2025 08:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Robu=VW=kaod.org=clg@ozlabs.org>)
 id 1tp5sM-0003Vr-8P; Mon, 03 Mar 2025 08:30:30 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Robu=VW=kaod.org=clg@ozlabs.org>)
 id 1tp5sH-0008Ml-Vk; Mon, 03 Mar 2025 08:30:29 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z60705Q30z4x0L;
 Tue,  4 Mar 2025 00:30:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z606x0g7kz4whq;
 Tue,  4 Mar 2025 00:30:14 +1100 (AEDT)
Message-ID: <2c8e99bc-bf5d-4447-84e7-8d4d5fea0add@kaod.org>
Date: Mon, 3 Mar 2025 14:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] hw/arm/aspeed_ast27x0.c Separate HW Strap
 Registers for SCU and SCUIO
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250303073547.1145080-1-jamin_lin@aspeedtech.com>
 <20250303073547.1145080-6-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250303073547.1145080-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Robu=VW=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: UmyCKIibGPU6

On 3/3/25 08:35, Jamin Lin wrote:
> There is one hw-strap1 register in the SCU (CPU DIE) and another hw-strap1
> register in the SCUIO (IO DIE). The values of these two registers should not be
> the same. To reuse the current design of hw-strap, hw-strap1 is assigned to the
> SCU and sets the value in the SCU hw-strap1 register, while hw-strap2 is
> assigned to the SCUIO and sets the value in the SCUIO hw-strap1 register.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index a48f47b74e..8c225d4f90 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -331,16 +331,23 @@ static void aspeed_soc_ast2700_init(Object *obj)
>       object_initialize_child(obj, "scu", &s->scu, TYPE_ASPEED_2700_SCU);
>       qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
>                            sc->silicon_rev);
> +    /*
> +     * There is one hw-strap1 register in the SCU (CPU DIE) and another
> +     * hw-strap1 register in the SCUIO (IO DIE). To reuse the current design
> +     * of hw-strap, hw-strap1 is assigned to the SCU and sets the value in the
> +     * SCU hw-strap1 register, while hw-strap2 is assigned to the SCUIO and
> +     * sets the value in the SCUIO hw-strap1 register.
> +     */

please move the  comment before

     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scuio),
                               "hw-strap1");


Thanks,

C.


>       object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
>                                 "hw-strap1");
> -    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
> -                              "hw-strap2");
>       object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
>                                 "hw-prot-key");
>   
>       object_initialize_child(obj, "scuio", &s->scuio, TYPE_ASPEED_2700_SCUIO);
>       qdev_prop_set_uint32(DEVICE(&s->scuio), "silicon-rev",
>                            sc->silicon_rev);
> +    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scuio),
> +                                  "hw-strap1");
>   
>       snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
>       object_initialize_child(obj, "fmc", &s->fmc, typename);

