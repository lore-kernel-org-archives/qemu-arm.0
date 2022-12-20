Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4215976ejb;
        Tue, 20 Dec 2022 02:45:04 -0800 (PST)
X-Received: by 2002:aca:4543:0:b0:355:1e71:768 with SMTP id s64-20020aca4543000000b003551e710768mr16317238oia.39.1671533104280;
        Tue, 20 Dec 2022 02:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671533104; cv=none;
        d=google.com; s=arc-20160816;
        b=0kneRnLEx+Z7Y+eRrEAofPO30+I/fgUqMyO75zLd3HMou7mCqgI5DpBmt8a9Ub7Ier
         +Wrz8COzaphVefl78loHDnZmO3J3sTfgPjH7OIHBM54waoCSD8SuhJBvyG1gGN0pUFHW
         bBhh6ND6MSVQ3L+EORcCzhC+XUCrC2iqFfDuDVQ2nqt1iAYbdLzTVAE7vSdBZRbDyEn+
         sKWet1oSxTxyt2ahOxplYMmycWpD9H28+u68AyBxfuWIfEam3Nz0jBHxdhui8ks+vb6M
         545tINH6N1v1+Kq/4NNFMnqpU6GJjkKOvqy/XYmW94bIRRFH+8PvUYb5R0JCU9xT6P+2
         8Ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XlLK/9t77OaCz0UGM/J8urYM3bBBnlqtd9YmBawRQfs=;
        b=lw5Ev0rJ/p8y4MIaHhvXEe3uPb89Jj6FKNCoufQ7s++r5EfqqWT9x+SZ/JFIRczErL
         foRw8n/mpdI8CkoNo7tquW4EryrfS63Pzi8nlmGIiLcl+mcI1j0LiWf+Qw6iQI2BKo0q
         T1RL4EZDdFdiJTDwnBLRUndAigWrOL5mHTmZZ1+vRmqww+Q1HkMkHzMzFHDXqiqRwhCG
         2mKniErVVsm14rrymtQQOTjTpxhaIEr2CCI+MW2TzPcbXUqu3/SoTIMu6Er6lcCwwWoT
         dVGT354fXiXx9g32QsYncmmmRLg4ojRhptpmw95Hv125MuVF/zIj0W1FBvlS8H1CIIlB
         lgTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZQVqUyf;
       spf=pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=danielhb413@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <danielhb413@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o130-20020aca5a88000000b0035bdb23bb25sor2649521oib.53.2022.12.20.02.45.04
        (Google Transport Security);
        Tue, 20 Dec 2022 02:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZQVqUyf;
       spf=pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=danielhb413@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlLK/9t77OaCz0UGM/J8urYM3bBBnlqtd9YmBawRQfs=;
        b=VZQVqUyfm+SzD4hUok+TQ3m/aULWBHMuCvEbySofZ7AlqnMdTsBLZaI07suorsSjtv
         fe/mnNdO+x5Nyh4McN2S1iP8uLWiehdanPgWngG0vsp7HAFmT+liWyQAyUAGnOfb/saC
         91ynBTrXxHn0zpiO5IoFBLtQGf9Xj7Eq+aVdBBlcPSEApaBll4n1O4cHv/D/CjgO3b69
         EyPb+x4jFkJynEhVkvQVyl1Ne75ux7sCCj6gflUlEIHDXp20EiV4vosXzP32utRaBg+u
         GlumX4I9cssgCKSVY0F31fNZbRNniYm44IhQ/bojX60FD7i3IRMxVhPxOyac884xBk1h
         4cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlLK/9t77OaCz0UGM/J8urYM3bBBnlqtd9YmBawRQfs=;
        b=jYM48ieVu53tIGx2caz62rg7MhaLKuGkUib8dusZ1KZcw8SzmPMmScNV5QYq86UBug
         8KOFM4cA7k1Q/uBRxVdYJybozShxSd0Dwqz45cne3LrT3rWTQq2s9hfJWctElS43aaAC
         w3kZU0TJpnObliLnX09PxlnaftY5plPybPUGbrbqKwnBFNnoc+EH4K8NUgq7Q+Dsf+CG
         BS6+feAm0tBe6eX/D9m0Z1PkDEU/S2Cp0+muTh2GuqJLd5rGRcUtAhBzbUmlm0QwZovJ
         QCQpkqRG46iVIFwgTfwJOcbCr4NR8ZTpooNwBfHYboJbSv3G+c7qyId38uDt836apUoT
         hevw==
X-Gm-Message-State: ANoB5pkGV42BC3qh3STKZ81o7D4+jbWlqY1xO3UNpCvE4MhwGFD5SoOe
	pgKC+howZFM4YsLqWsusU3o2RhnFCig=
X-Google-Smtp-Source: AA0mqf5IhyhoFAFTIOpBSp8ETqrVHUgTAA+/7jM945BelQAHiivdjpQPQFharevJcEcrmsphwDZy5A==
X-Received: by 2002:a05:6808:30b:b0:35e:57ef:51f8 with SMTP id i11-20020a056808030b00b0035e57ef51f8mr17517142oie.52.1671533103732;
        Tue, 20 Dec 2022 02:45:03 -0800 (PST)
Return-Path: <danielhb413@gmail.com>
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
        by smtp.gmail.com with ESMTPSA id j2-20020a056808034200b0035e461d9b1bsm5291043oie.50.2022.12.20.02.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:45:03 -0800 (PST)
Message-ID: <5d727e59-fa21-ea08-112c-3b74db7e4577@gmail.com>
Date: Tue, 20 Dec 2022 07:44:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221216215519.5522-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gpco+SEJ0Vet



On 12/16/22 18:55, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   dump/dump.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 279b07f09b..c62dc94213 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -29,6 +29,7 @@
>   #include "qemu/main-loop.h"
>   #include "hw/misc/vmcoreinfo.h"
>   #include "migration/blocker.h"
> +#include "cpu.h"
>   
>   #ifdef TARGET_X86_64
>   #include "win_dump.h"
