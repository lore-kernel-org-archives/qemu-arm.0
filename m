Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp238653lfy;
        Tue, 11 Aug 2020 01:39:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5B0uByGeb5SqJF9GgCSYCkpa0x2Am77T02O6FUbWBECmH/dTZiz34MfaBFnaaNcBVocdl
X-Received: by 2002:a25:6b0f:: with SMTP id g15mr42865619ybc.119.1597135146595;
        Tue, 11 Aug 2020 01:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597135146; cv=none;
        d=google.com; s=arc-20160816;
        b=F6Cp3ACIZ590KPYiLXDm/CMTIMGewoDt0ctv0I2zCJqiCPZQ/R/tPTPzkIDAOEkeJj
         mwOySQpJouwVXEb6blPFRFf8eKAJReWLvsvxH+64lxTkmugQHPzMEtKEPdB0AqRJIX1g
         Pz98cYKLj4/fpo/ciQY9FjeI1sGQPdSH2CL8HwWCOsfd0qjK7v9eS7990u5xyDO4GiSR
         slH5F3mBaVTOHCJ9tF5wPJYtdYwSTxLD6qda0Coy0652TjnzbQfEGZJ0Zn4t4ZWxufcV
         jElhpSaupesRAw/cNoh3dBXmcX7I99srv4Elfi7I0UUWFyJgwnoYMTZWT2yUvKlhnsDv
         BD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Y+8/uorVEJ9Lx8uQJ0InEiz6DidPoFSFfBhX8PcF5H4=;
        b=NdcP+Dy4AVM6icQzYQ+CVss9D0VlZTUuQGxYeZxcejMshgp4DbfbMkVdsCcGOFrUNr
         wONW2g/hAj/KX40D0h8D80SwA0i4iGMFrXSdEWsFAeePZZkiaUD0qNwUuYavHvz4jcHQ
         PCfX10VjDOsLSEPOaPpnxkF1TbSYCAE1Vg3DhwozMA3kKNWSinN7zWVZYWnH53CMHa+S
         9rUe3/Sw880gWQdOIR7MXZXORif+oRGKQyQMSSHb3Ny75nxkPA4kP9b6WgVEAnuZ+ciO
         mAt7x6qR2HmMn3AFU+CY1g76p5049047MovZ4VKn+Gu3a7bHxZQLiULno4IIDC894bd7
         C7tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J2r+mHy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y203si17614122yby.414.2020.08.11.01.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 01:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J2r+mHy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5PoI-00032Z-0J
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 04:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5Po6-00031s-I0; Tue, 11 Aug 2020 04:38:55 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5Po2-0002qz-M8; Tue, 11 Aug 2020 04:38:53 -0400
Received: by mail-wr1-x441.google.com with SMTP id r4so10650316wrx.9;
 Tue, 11 Aug 2020 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y+8/uorVEJ9Lx8uQJ0InEiz6DidPoFSFfBhX8PcF5H4=;
 b=J2r+mHy2jZpuv43FrJ2h8T87UuXc96LTmxaj0oaxnp4myXIKykYMhrIPN5sVLPt5Tl
 iKlUplNjVBGesTucwCCyzUszwVZwhPDkbyhOtkQJu1kWWsZ0aI29pPPaD8J8H9YCFbnK
 Be1Jp+kFxQxXsjzcY7m1RjzxWoKz8OwTf/a+F00v++0DStjsCi54Hr7R/MwN0DkkH5U/
 XCnnG+O743dRheJvklLjZVg2hSry2DZiNxaeAayi6hS+VduPFfTwz4KcFGPDOaFJ+QBp
 s0YeUBVgy7IHO3QJ+e2+cwEeAt+DEjNwU+Yi3LArLtpOlYpnpD/UmdzHtjYdRvysr693
 OQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y+8/uorVEJ9Lx8uQJ0InEiz6DidPoFSFfBhX8PcF5H4=;
 b=H/czinqbx3m1pRDl6HB+4KoImookQwxpSQLh8XFsqRWIa1hpcA+Zfp6wDaeOjH+83z
 iUwTVcOK13nHvJoiUop2kvJqqB7QCdNYOdWioQD0wQJRv7Fe9/av5psrWFPjzrimWy7r
 IVkCGbSmR+OjblckvzPePVX9ktcsPU68FVGnZ6ZuO9s0Uv8+2IjuvlzKZaMZatpAqyXU
 EZPS0h8MnQGtsneG5oMfyCWJiirRBje9Crf4sjpxHptHEQanJWyhDTIS48+ny7OjGmj3
 yeq4uMYyu9o6AD9NLuyYxnKiSunm7lgIeHg3Xl8VJKjDJ4agNdbh8VHbQFDGs+k3EqC+
 hPdg==
X-Gm-Message-State: AOAM532M+XqL73xef0bTI56XWmDf0YHiM/+ldJOAu/02d5pqtVwahNYO
 +V7zn0TcNN5FyqSh5J1Rd44=
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr5255000wrw.135.1597135128136; 
 Tue, 11 Aug 2020 01:38:48 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id c17sm25939782wrc.42.2020.08.11.01.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Aug 2020 01:38:47 -0700 (PDT)
Subject: Re: [PATCH v7 07/13] hw/arm: Load -bios image as a boot ROM for
 npcm7xx
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org,
 clg@kaod.org, joel@jms.id.au
References: <20200811004607.2133149-1-hskinnemoen@google.com>
 <20200811004607.2133149-8-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c17b083c-3747-8564-de9b-773ed29d7f79@amsat.org>
Date: Tue, 11 Aug 2020 10:38:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200811004607.2133149-8-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nYD094jNk6zF

Hi Havard,

On 8/11/20 2:46 AM, Havard Skinnemoen wrote:
> If a -bios option is specified on the command line, load the image into
> the internal ROM memory region, which contains the first instructions
> run by the CPU after reset.
> 
> If -bios is not specified, the vbootrom included with qemu is loaded by
> default.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 0b9dce2b35..26ea97072b 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -18,12 +18,38 @@
>  
>  #include "hw/arm/npcm7xx.h"
>  #include "hw/core/cpu.h"
> +#include "hw/loader.h"
>  #include "qapi/error.h"
> +#include "qemu-common.h"
>  #include "qemu/units.h"
> +#include "sysemu/sysemu.h"
>  
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
>  
> +static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
> +
> +static void npcm7xx_load_bootrom(NPCM7xxState *soc)
> +{
> +    g_autofree char *filename = NULL;
> +    int ret;
> +
> +    if (!bios_name) {
> +        bios_name = npcm7xx_default_bootrom;
> +    }
> +
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        error_report("Could not find ROM image '%s'", bios_name);
> +        exit(1);

Is that OK to refuse starting a guest when -kernel is provided but
not ROM available?

> +    }
> +    ret = load_image_mr(filename, &soc->irom);
> +    if (ret < 0) {
> +        error_report("Failed to load ROM image '%s'", filename);
> +        exit(1);
> +    }
> +}
> +
>  static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
>  {
>      memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram);
> @@ -60,6 +86,7 @@ static void npcm750_evb_init(MachineState *machine)
>      npcm7xx_connect_dram(soc, machine->ram);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>  
> +    npcm7xx_load_bootrom(soc);
>      npcm7xx_load_kernel(machine, soc);

Maybe invert here, if no kernel provided, fallback to ROM?
Something like:

       if (!npcm7xx_load_kernel(machine, soc)) {
           npcm7xx_load_bootrom(soc);
       }

>  }
>  
> @@ -71,6 +98,7 @@ static void quanta_gsj_init(MachineState *machine)
>      npcm7xx_connect_dram(soc, machine->ram);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>  
> +    npcm7xx_load_bootrom(soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>  
> 
