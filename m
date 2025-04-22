Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2359973njd;
        Tue, 22 Apr 2025 06:39:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU9LoRXsY2ZMw6vOKjX0p4eSLnuemAgpjHaNLz1efA0XKKTi3GuQjeL6/lhyzF5SG4XlfwsZfcNf09Tw==@linaro.org
X-Google-Smtp-Source: AGHT+IH2TPKzOvkOJM+40uUNA3rlR66qHGgJmw/86Das9x3zzKE0oiLX/iLmkDZaiBeqodrnwkb+
X-Received: by 2002:ac8:5893:0:b0:476:8df3:640 with SMTP id d75a77b69052e-47aec350a60mr207363961cf.7.1745329150152;
        Tue, 22 Apr 2025 06:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745329150; cv=none;
        d=google.com; s=arc-20240605;
        b=AlJa6m3/kH9eKJcRQ3LqZZtOydFC+D/pVFjuqFtiKQhA0W6LiAwUaaUwOzQo5tJJTD
         ZbyGEf4GerSq548dUqDv6SCGLaiAgHPQeHA33/2dcXIe56tChopR9xXhDft7CldfEWM7
         /zbrsujntM+sVyH9KiED9SzoxnpZLrrl1Ijsy8gU/QpG1iIPGJZGbmSKMizXx1GZMBtc
         f5K/aHEm7w83FE7X8KrhrUytXzN94bYslz0k5Piy6UJUGc0WyHO0b1cEztyoLQtegLl4
         0ElMdXJ8nxXZR+LUquL6QlWMEyvopIXOuCbdC2PhN2F3mOYfaA2ym/4HmG27dbuKJuNv
         3NaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=tBNvQFe8SB1bMKeKjhHWuhoFBX1qg25ZMQkEQeThuV4=;
        fh=j1qKwZl8lJmvgbYjCR0fq4TUsSQ++YALFaO/9OwxD+0=;
        b=i+ngUdvI0cEQeyguriAj2uJB9EKtJmDp4Y8YODUVimikYf8xMfbWUSU968ujSBIwAm
         Sh/E/H5sRCkSPOSUJIacl9+MFPeT7yGZb54k0+ar/zC5lJotN/mTcGalCv6JNiNhuBta
         ecQJL009hQPbfs7BsLleqsTpzDUpDwW47lb84fpWvMVisbbXtCO2CvOqAA2JAKjAvLNV
         t48OaBKRs2i72n00Knjg8spgtIqY3BnNMolzpYlhVabdcI13T9CPxODht+bKZvHmRUsJ
         pYsRMUAnJg4DU5ot9LqJ5/MJUXtg9jcHQOGzDeO2xPM6b90vtXslddQ05WjIBYJuUfyW
         B+/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cb72desi113705441cf.398.2025.04.22.06.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 06:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7Dpd-00063o-L5; Tue, 22 Apr 2025 09:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=h5bN=XI=kaod.org=clg@ozlabs.org>)
 id 1u7Dpb-00063E-O1; Tue, 22 Apr 2025 09:38:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=h5bN=XI=kaod.org=clg@ozlabs.org>)
 id 1u7DpZ-0004F5-32; Tue, 22 Apr 2025 09:38:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZhjxH4fqtz4xG4;
 Tue, 22 Apr 2025 23:38:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhjxC275Pz4x8Z;
 Tue, 22 Apr 2025 23:38:22 +1000 (AEST)
Message-ID: <4ac9f7d7-e22f-4197-bbac-1435ca2c0926@kaod.org>
Date: Tue, 22 Apr 2025 15:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/ssi/aspeed_smc: Allow 64-bit wide flash accesses
To: Joe Komlodi <komlodi@google.com>, qemu-devel@nongnu.org
Cc: venture@google.com, alistair@alistair23.me, peter.maydell@linaro.org,
 steven_lee@aspeedtech.com, leetroy@gmail.com, jamin_lin@aspeedtech.com,
 joel@jms.id.au, andrew@codeconstruct.com.au, qemu-arm@nongnu.org
References: <20250422002747.2593465-1-komlodi@google.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250422002747.2593465-1-komlodi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=h5bN=XI=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: ooiUf+ni6loe

On 4/22/25 02:27, Joe Komlodi wrote:
> cde3247651dc998da5dc1005148302a90d72f21f fixed atomicity for LDRD, which
> ends up making accesses 64-bits wide. However, the AST2600 bootloader
> can sometimes compile with LDRD instructions, which causes the acceses
> to fail when accessing the memory-mapped SPI flash.
> 
> To fix this, increase the MMIO region valid access size to allow for
> 64-bit accesses.
> 
> Signed-off-by: Joe Komlodi <komlodi@google.com>

To backport on stable-10.0 when merged.

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/ssi/aspeed_smc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index faef1a8e5b..a1160187a4 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -359,7 +359,7 @@ static const MemoryRegionOps aspeed_smc_flash_default_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 1,
> -        .max_access_size = 4,
> +        .max_access_size = 8,
>       },
>   };
>   
> @@ -670,7 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 1,
> -        .max_access_size = 4,
> +        .max_access_size = 8,
>       },
>   };
>   

