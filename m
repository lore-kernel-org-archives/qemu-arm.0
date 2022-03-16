Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3607277lfo;
        Wed, 16 Mar 2022 06:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+YhO7ZwC3bZY7vjnXAav8dMu7H3AT5i1T32UbTiuaTdBfW97bQ7SeplY1Hmw59jvdtJv8
X-Received: by 2002:a05:6902:b:b0:633:7ad5:a199 with SMTP id l11-20020a056902000b00b006337ad5a199mr7122915ybh.32.1647435781949;
        Wed, 16 Mar 2022 06:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647435781; cv=none;
        d=google.com; s=arc-20160816;
        b=xmjPWW8DLs7ioeWWoWq9ojpkMMaRBE8NwY8nofyHdGEAn6CftB/B6JnfmFkaxf6ig7
         nEzFKQewx3+wBWVg5d1DZWtJc7Jm52jg7Zfo2hJooCKYrt8lPf/f1HEhGWwBQfWZPgI5
         KOxmX2R8s2VlHhV1fmtRjo8V8Jcgo5SGjgGX1gl9sWvQCCtZteDAe/AsJou8GFsY6mEP
         tuRT5luIeqKcy1qIzhbTJH80WFG3EdagpcGFHaFeo99rckqfmRs61A0jp6ozIrVZ4Cnt
         JNNH+AuxJLwDXs7ssQ4Nu1CzIDW2dsBf+E9p51X9GglZG2TlRiP2VWOwTWwHpjJ9VuK3
         g+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=znjBptJrmO7bEzGPS76/uzyJDSmS7oaMs4zJb8AKM/4=;
        b=utoWIbqeiOsJXSdoXddSLTGuOGTqUXzataYt2AoQlQWHI/7iew8o36RhtTpivajsjm
         x7HUmGAkGxILVDuw7bGAejrChMZhNuIFfiEeh7f23KxabybHty7iiyBNrgvjZ4LUlkTO
         UxRx4lFEFcrKIaO/mHWlIpPEbGAoHmURPfix/AvYez3UX42entjWdMpWV6aKsvTLCfTy
         dpEiyAb+TYRnZ2VmhO26VLPdx+QXNcIAFtin+E6TBZihZ93E4oO2FvtNfhLDcAqohA/+
         +dRbKnAC3ozyD69ze39bdaxHsI2bOdIstjyLVtdThnDWkRhojc1gOpX035SMjMiaxMpZ
         Mdow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=la2L6tZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a257202000000b00627f9a4e736si1815248ybc.407.2022.03.16.06.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Mar 2022 06:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=la2L6tZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUTIr-00037t-Aw
	for alex.bennee@linaro.org; Wed, 16 Mar 2022 09:03:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTGa-0000vD-5T; Wed, 16 Mar 2022 09:00:47 -0400
Received: from [2607:f8b0:4864:20::436] (port=40760
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTGY-0008DH-Cg; Wed, 16 Mar 2022 09:00:39 -0400
Received: by mail-pf1-x436.google.com with SMTP id d19so3837153pfv.7;
 Wed, 16 Mar 2022 06:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=znjBptJrmO7bEzGPS76/uzyJDSmS7oaMs4zJb8AKM/4=;
 b=la2L6tZkgC8EmpYi+Wtax0/5Lz6JYh2pRvIjWcGpuLqYBDQQBsJCRl0nxfYEO1lUxu
 wdgLYuZpf4ann9Cw+6O09A99KQuRkxfeWFOGkXBoxGg11yFharVVOsya8710JBEPFB/H
 yxyE+piUVa0r8wdKrmRBQElu/BsVsg+G929nJllmiR0yRqrycDyWemDTOUblJoJNrNcu
 a8SucrCnCbQwCoi+/WV2+1fwPZmH2JrOYDGinAmcPy0Z1XfAuWomGZIhJ1gXRdQ6lsQH
 b23gQ8KH3gB1kUdhc6ZQ6jQyvio57MskbbeI0Ghpg7mOAl0xxwZc8f8UdQexXWAH2pHD
 Gmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=znjBptJrmO7bEzGPS76/uzyJDSmS7oaMs4zJb8AKM/4=;
 b=IYAxOQ+TkzhPpLf4S9lf3lfmgw7lptI1H3H+uYdW0jiPUz233aX0dL0MQ1+gpP9wpy
 5lwTIFYlxb/IdBGoyP2XP77xZBPur4KR6+H7Y8Tt7fddbtiNT58C7MaR+Ha+AXOPevYG
 5iFkjt5vwqO0fxJ7AiSKDfyJnCTPwNMkNd9NtB1VivPcRVZP7bO9Y9bAZJa20i6d1ESt
 6S3Pm/LygEoQi3YaIYSpBrnzjEJEWYHBdosJDvJhghRQMKcoWptCOtw4aU/QWLITF34m
 +BTNb8+R2Qx5kv9/Gf+Wybj1oKmLiWyiY17jPogLBkYlTGFm0BfGAraIjxwLbKvD7yYt
 brug==
X-Gm-Message-State: AOAM533hi/5VWZzJfTM6oCxExqjeMK1hT1AuE/KMM/+ZUWiEb8yi268g
 Mmw7fYhuqb7YrrD2JyhIpeA43OjTpI0=
X-Received: by 2002:a65:4348:0:b0:375:9840:b064 with SMTP id
 k8-20020a654348000000b003759840b064mr28807936pgq.270.1647435636400; 
 Wed, 16 Mar 2022 06:00:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d11-20020aa7868b000000b004f768dfe93asm3005578pfo.176.2022.03.16.06.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:00:35 -0700 (PDT)
Message-ID: <f4b7fdd1-a659-03ed-bfd7-a514b8e47588@gmail.com>
Date: Wed, 16 Mar 2022 14:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] target/arm: Improve M-profile exception logging
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315204306.2797684-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l1btiXLn9/kw

On 15/3/22 21:43, Peter Maydell wrote:
> Our current logging for M-profile exceptions has a couple of holes
> which are particularly confusing for the case of an exception taken
> immediately out of reset:
>   * we don't log the initial PC/SP loaded from the vector table
>   * we don't log the PC we load from the vector table when
>     we take an exception
>   * we don't log the address for i-side aborts
> 
> This case is quite common where the user has failed to provide a
> vector table in their ELF file and QEMU thus loads garbage for the
> initial PC. At the moment the logging looks like:
> 
> $ qemu-system-arm [...] -d in_asm,cpu,exec,int
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...with CFSR.IACCVIOL
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> ----------------
> IN:
> 0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}
> 
> 
> After this patchset it looks like:
> 
> $ qemu-system-arm [...] -d in_asm,cpu,exec,int
> Loaded reset SP 0x0 PC 0x0 from vector table
> Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...at fault address 0xf000bf00
> ...with CFSR.IACCVIOL
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> ...loading from element 3 of non-secure vector table at 0xc
> ...loaded new PC 0x20000558
> ----------------
> IN:
> 0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}
> 
> and I think it is somewhat clearer that we loaded a bogus
> PC from the vector table at reset, faulted at that address,
> loaded the HardFault entry point which was bogus but at
> least readable, and started executing code from there.
> 
> The double-logging of the reset loads is the result of
> the way we currently reset the CPU twice on QEMU startup.
> If we ever manage to fix that silliness it'll go away.
> 
> 
> (Patchset inspired by a stackexchange question:
> https://stackoverflow.com/questions/71486314/loading-an-elf-file-into-qemu
> )
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    target/arm: Log M-profile vector table accesses
>    target/arm: Log fault address for M-profile faults

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
