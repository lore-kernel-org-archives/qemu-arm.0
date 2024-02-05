Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1122453ejb;
        Mon, 5 Feb 2024 05:20:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqdMbFjM/zkfx7zr84f+SdLeNW4+EiOKGgVvc4Wz/OZKTLX4sZ78ch+f0mEZu7PJRo3jDG
X-Received: by 2002:a05:6808:201e:b0:3bf:c0bf:dcbe with SMTP id q30-20020a056808201e00b003bfc0bfdcbemr11035320oiw.6.1707139250400;
        Mon, 05 Feb 2024 05:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707139250; cv=none;
        d=google.com; s=arc-20160816;
        b=rwyjyWoNTDkzvujed53Y+xlRTkSomuy9i0wrEMG2aj0m0+aQj4RQ1PUipENgv4W/kS
         4AHPmkEHnvnmhs6IT94hUfKLD59rFAj3zKjr6k1QGr8qd/3Dydz5r1SsO4yxuwH9F2HL
         ePrzjFJxrq/ZnbZDv3i8iNlZuArdsuMyVUJ9hDUI4752zfhKZGbZPKIy4bJLcmuPm2sM
         12+XzAJoYTnqih3dj6tPtTmkipdOACJ3SoBH5LPq2NYcfuko4Q73fzeBzM4FQjX7mo0Z
         itg13AYHl3h9OZI0aifVyb9drGx2Ay9HA7EoyzzCDDjmdblvf2jbbSvMn3e/UiQx9xM0
         Lqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rMFog3VK/EdPKpm1Du87+mdNAZmskRVnC3K69Cf1OQ0=;
        fh=rCaSNS2n8YZ6LA/I7rL/POoyKihZ3/9GbYMBljDkQIs=;
        b=iewFNSahrRAzJqdHKorreuFSRGLCBQ5ReMxltXEHCkbYTs6gHrUcsK9UF6ySmCKYEC
         fPu5A3a+UDCKM6Vp+e5Oljpb71Ql/Stp3bzzY4TPaSGYI3cEgpC9o7TNWokrmUuO6sx+
         +6RtQb6hCEhYjieTrE0tddF5ou/TvMcukH+aNE3DKRuP+x5BPpu3ZO/3kKyfxBCABknS
         5WFtmP3Vj6edGZM4HRwGwGAbJnGxlZZ5fwooPQnjLlnFTIKT/kpWkhvkgI/MPrhP1bd+
         wcfSnYj9AXLHXenaCeDMFTLlAfpfSteovgCbPljx7Wcy2YOd6iq+HGbPY1lStoXBEPZu
         izoA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sO5NLLdN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVKGsyr55SbK616gcZiBlFZmcHv+sAmlUVBFFesB5KDwxZEpKkrk7trwKsB2GuSyNBFKfEIu+/q5nYJfxj9k1PVlNDJSXq7
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq41-20020a05620a46a900b0078569cd1157si5484113qkb.175.2024.02.05.05.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 05:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sO5NLLdN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWytm-00071v-Oz; Mon, 05 Feb 2024 08:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWytk-000717-VQ
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:20:32 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWyti-0000z6-9X
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 08:20:32 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a354408e6bfso925775966b.1
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 05:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707139227; x=1707744027; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rMFog3VK/EdPKpm1Du87+mdNAZmskRVnC3K69Cf1OQ0=;
 b=sO5NLLdN616BlGOK0vm6cyyFK+2F+oFLd3mk/fS0Vf82fZxM65oikSCHC368fw3E/Y
 AYxyiRVoz0QxP8GLk24KyEz8Id6L9vt9UhkNyI0OEchE5HwXx8haFbw49rOzJ4S0ObZw
 vOFjvydILKGSToe3jW9serZMyrsYqOOnYsU0Wt0AfF4G0kTMLK5edT44XQ9AMwXOJI21
 Ld4F+878asTDDvOOjuYcUm6wLB8zaYwovd//PRyfzg+iH7STQgkB++L+IG6dLrs+hVFt
 4iGxmZw0ScK4HxLk+1ntep/hqAef+ohdicXFMMCexwihTCw5yY7Wb6MEO+U71N6to+Q4
 0Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139227; x=1707744027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rMFog3VK/EdPKpm1Du87+mdNAZmskRVnC3K69Cf1OQ0=;
 b=lVeo336EtdaDDO2nmn5VVRJHp+uo4j7TsCswSFZ3rKqHJTmqyVjKMUWaLrf8rQEKvY
 9KmkzUZUAkZM9RmvQW911nuXZewqfN2Ortqt5Fvp5qxmvlJ3eOSXpfiJOsMEBxQnNn0S
 DaS/4Ez7t0clREJhoHJS62L55iMocTig0GnElikb7LLdcLSMy6vrZGsjzor27F3ytItE
 E3QUWdVVknuqhr0gFn7bScC3py7Tn6JsuAupoJLB+9rF9AGRwgBmlwrdjCzDEB9J9/Os
 WUJm2uls4bghGa7y6F7DmVfferX26uKuwJUlOOnTMD4zFDGzke14LdxtPHdKo7YA7+YR
 NrWg==
X-Gm-Message-State: AOJu0YwqlM+RSib7odegmkqwYyNH1NqzgesvImdB7BkSLP3GVTyO0rlL
 2x5biCg4Fv1iBCjd1nlMU32/7SroLPqHngwnmz67Mecs9k+XCBUxYAbD1MIoerg=
X-Received: by 2002:a17:906:379a:b0:a36:6570:655 with SMTP id
 n26-20020a170906379a00b00a3665700655mr5871394ejc.14.1707139227358; 
 Mon, 05 Feb 2024 05:20:27 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUtKezGxD/aMbI5VKBN3WI5/TucpdISM+q+grpyTcYGGrmMnfpPE0nODWUPE8DHgYPIi5wQCzKVVsIcRk08yBz7WdPvzhKtW2jmvI60YAszM4eSGREq7MJt8j09utxPj2dnhKmcIM5QiQdQzKPtKHPI54/TUv1QW0o+TsnwyW9aZCDL/G17+myrxjjx3JgtKZxfNBmFhV5bn5pVc9bTWKP79M4yQVBC9MjkDSu+SFtt
Received: from [192.168.197.175] ([92.88.170.125])
 by smtp.gmail.com with ESMTPSA id
 fj6-20020a1709069c8600b00a371eced193sm3809761ejc.49.2024.02.05.05.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:20:26 -0800 (PST)
Message-ID: <46d14718-2b2c-45aa-aa12-854a2704383b@linaro.org>
Date: Mon, 5 Feb 2024 14:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 2/2] aspeed: fix hardcode boot address 0
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
 <20240205091415.935686-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240205091415.935686-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: EnAtt6wdCVc3

Hi Jamin,

On 5/2/24 10:14, Jamin Lin via wrote:
> In the previous design of QEMU model for ASPEED SOCs, it set the boot
> address at 0 which was the hardcode setting for ast10x0, ast2600,
> ast2500 and ast2400.
> 
> According to the design of ast2700, it has bootmcu which is used for
> executing SPL and initialize DRAM,

Out of curiosity, what architecture is this MCU?

> then, CPUs(cortex-a35)
> execute u-boot, kernel and rofs. QEMU will only support CPU(coretax-a35)
> parts and the boot address is "0x400000000" for ast2700.

OK, but I don't get how you get from here ...

> Therefore, fixed hardcode boot address 0.

... to here.

> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 218b81298e..82a92e8142 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -289,12 +289,14 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
>                                       uint64_t rom_size)
>   {
>       AspeedSoCState *soc = bmc->soc;
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(soc);
>   
>       memory_region_init_rom(&bmc->boot_rom, NULL, "aspeed.boot_rom", rom_size,
>                              &error_abort);
>       memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
>                                           &bmc->boot_rom, 1);
> -    write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);
> +    write_boot_rom(blk, sc->memmap[ASPEED_DEV_SPI_BOOT],
> +                   rom_size, &error_abort);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   }
>   
>   void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,

