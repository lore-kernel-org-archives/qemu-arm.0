Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp169378njk;
        Thu, 28 Nov 2024 12:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXuutkObXC14XPz1XI59Swtu8U/wt50ZXbBbJhGbkUQO3eEp5m0IGtEh82fHaZ7vfeY3HxJT05J/8zEPA==@linaro.org
X-Received: by 2002:a05:6a21:7915:b0:1e0:f059:db8 with SMTP id adf61e73a8af0-1e0f0590f90mr4260891637.44.1732825122557;
        Thu, 28 Nov 2024 12:18:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732825122; cv=none;
        d=google.com; s=arc-20240605;
        b=Of2TVBe5IxLk4qBTngHu0MFo9WKlsZwCb9a3jluiSK0N1bQfpOQ9AFR5fopQZhR8Qa
         Ffj8QAB4UmxqZa5m43Oy8vHg/48K3/ZuWg6VUFF59NwV2SPcsVdkp9HlYl2wASr3Lv/U
         u4DAiUw0zj3+VDoHMhwso7f5E3oR4R2DP3Gc7uER8yWAicIUQ7mGYSLv687VfsCTRyN9
         66eKDAnsl4cWy+i8uy9GiOTeCqArPeHcMq1I15OPTBXI7VwQds5irY7RB0Sn1qw0g5yN
         2C/063EKUgYb/HIzX86xC4xrngWob2oToa3Pw592nbNvcwG3tC3qVerPq5G2mMNnBCcs
         OIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P7VRDmje80mrxSrRS6Ou3eyEO9NianrFT4SNXjj6PF4=;
        fh=E7ZCmfhVQ+NqmfUkxGPawNaMQkvHiT1hsRQjAhudgek=;
        b=c/jP/qKlUFVp52sGEj94D/edYQ6ugNl/sh681cj6hgXzRr51biSdXLKuat8uqC+6VB
         Q42yjOzd4KGvzHOSk1WBwFX8QeUESFPGk2PBJqQT2Qgixgns8GUs1cyuupocsv3MwbnI
         Y/lbYgRjl1RwoC8zz9FWXfc3psst60BG7YrjHe+rxhn06xQOIQS2RI/dxYu6hONDzwcI
         i7yQ8p4UzFiCs6mEDzXe7zAcyslgojSzkEmYL/pgiIJH2yer3Z+4UYdv0GLgKcqDGRlz
         wVIglXJBYgtqBd7W5j60Q7aCsoGrRCU7UmAoV76SKmwd+2RSSQ/9MGg3ktLNgvE9Id7m
         3Fcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJoiROc4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72541809b40sor1228744b3a.9.2024.11.28.12.18.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 12:18:42 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJoiROc4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732825122; x=1733429922; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7VRDmje80mrxSrRS6Ou3eyEO9NianrFT4SNXjj6PF4=;
        b=JJoiROc4H6VdiGqCYZyoI1mBaFitNepzfee/ncctElN8XmlhIecnpGcQOEfu6XJ4P/
         KytAQJQuLeDJoYwgkq6CO3DGmtw7LX0vm+4QfUHFsTYbvzzr2dhviqc54kDriLmh7xpD
         gDybAEiIFqhThd2u3L2q3C/18UqV26qq9yF0klDUljwVA49VYpO7Od2SHmOfV1U6qX8/
         6J57Jm8aeFdm3VDBrM1HxVLj7Yx8se1PqSwTCDVbDQuveEH20HUY9VQ+mrfU78EtK0Qd
         z7NG+0RB17PU2R1uYCuCfQTLeq6D46pdoX49rCpiFonEIdTuORxi0fKW2wPbfFRlVYgW
         FtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732825122; x=1733429922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7VRDmje80mrxSrRS6Ou3eyEO9NianrFT4SNXjj6PF4=;
        b=BVvVaUayaU/oRUb1M5UzpJV/WAgdaYTVaqcLAHxXI2GqAitzX3FXo06WuFcJ63zfeq
         KP3mf46GD7lDAspz3PN3H2Kg2LpkKDy8NxtXUFbCMbNKnvPv5TKIlMqP+fPXpbxSBKlX
         1QieF+Rx1/NMCRpuNmxzxtcyYVuoxlKMMNv9cEWj7wLX2unfk8K/yDxTQuXRp6IxMHN5
         JQ+y6g16Fw30K9tCU3VJYOeSO30KYeZJ5YGBriCLRMtZV3y3a1xKXZBmKOi6I7cjkmrr
         saqDFxXM/tXQMbAQcQpJ2Ikf9ptENYePH8/WtRD+OWwlU0fXsdlYxqy2LGdkFJfLnVw/
         9evQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Lw9pDfzBCgxHb+TFE30e+T/2yh++uLB4eqNF+/CUkqPjzYE5AJnmWFr0+PBUK2bJwHN1K4grG7YamQ==@linaro.org
X-Gm-Message-State: AOJu0YxoWtHhvWPdJP+16BF6Hnyg8cAcCNQ1JtKCS/Yp73BFv9Ouj1mo
	Av1TYk8Fm1tPnn3oI2EWB2ItxMEtHKEdz06yFgwSdGnY+a2Z+K6JKwlq2GJw2IGoUA==
X-Gm-Gg: ASbGnctrHR1R23wiSFdf6Jql+qxCzYkpCZvJA4kzJGJ//JggGi+5DNGIObGeDOIrjL4
	yb2IVMQEkMgpNhRbi2+JzMVcXcQlJGLUrLj/Oy6vhrR30j51UPeMdeVqGnWXClwsOvU/6vAZ2Hf
	VoQIAVS0ZQMLQCcNaNvXOZGZXNo0D4zOOtOaui+bjhsMyscZeA1zV0amEChcZEcRDxxQp4Mh50/
	g3LcL01ekFlXjYWT7kha8J0cyngW+8j2QFWXF5QrtCDNPvIlw7qI2xQtfhYRHQn9XxeXmhqbfn3
	DHLxmuxuiuCPT2KN3xJ2HA==
X-Google-Smtp-Source: AGHT+IGgUK727SUUvFIPaTxpdg5ubx2YmiEMFbxErVyFnHBHggw5MO2sKpU8WltenZeqalvHNoN8Qw==
X-Received: by 2002:a05:6a00:4f88:b0:724:e582:19fd with SMTP id d2e1a72fcca58-7252ffdd0bemr12617691b3a.3.1732825122094;
        Thu, 28 Nov 2024 12:18:42 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2e1b2fsm1765066a12.20.2024.11.28.12.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:18:41 -0800 (PST)
Message-ID: <7be5475a-749c-432f-b8f9-dd47bf3efa0e@linaro.org>
Date: Thu, 28 Nov 2024 12:18:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] docs/system/arm/orangepi: update links
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <20241122225049.1617774-9-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241122225049.1617774-9-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: betI0ufEwiyr

On 11/22/24 14:50, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/system/arm/orangepi.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index 9afa54213b0..db87e81fec4 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -119,7 +119,7 @@ Orange Pi PC images
>   Note that the mainline kernel does not have a root filesystem. You may provide it
>   with an official Orange Pi PC image from the official website:
>   
> -  http://www.orangepi.org/downloadresources/
> +  http://www.orangepi.org/html/serviceAndSupport/index.html
>   
>   Another possibility is to run an Armbian image for Orange Pi PC which
>   can be downloaded from:
> @@ -213,7 +213,7 @@ including the Orange Pi PC. NetBSD 9.0 is known to work best for the Orange Pi P
>   board and provides a fully working system with serial console, networking and storage.
>   For the Orange Pi PC machine, get the 'evbarm-earmv7hf' based image from:
>   
> -  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
> +  https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
>   
>   The image requires manually installing U-Boot in the image. Build U-Boot with
>   the orangepi_pc_defconfig configuration as described in the previous section.

www.orangepi.org website is available again, and after checking, they 
don't support https. So this change is correct, and we should stick to http.
