Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1930506ejb;
        Tue, 6 Feb 2024 08:55:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2heSpz0F9dZeNzUGjutWYbjI1J5NsxtcLLbbb5PST4NwCUkmjApnwir4dg+6drfve/q5D
X-Received: by 2002:a0c:aa9e:0:b0:68c:4ea9:5176 with SMTP id f30-20020a0caa9e000000b0068c4ea95176mr2361822qvb.49.1707238509225;
        Tue, 06 Feb 2024 08:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707238509; cv=none;
        d=google.com; s=arc-20160816;
        b=pOQzZEkgerbKqvjv8CSjm2CGbpozRyE+ubLJ3/E8EPCjkraR7H2aCnlxP9ivGt01/K
         DUqJxSMVqMQIXLomwFuK7fCX6VDNRZvNBW69gVOlePBq2R9UAsd/0ux5MgEfsa0Q/eET
         kynXNFmh+ARtw27Nuc+gJ5p3yk7BHB019+U7iBrD9Flgl4DSKiSl5AH25qs+HkePTnm8
         LEQEsmEdsQPI3z/EUn/Okg4Gham1xmn+ExE2Cf6I0yKZ4BmTjcIxqyZX4N+s0Bnc+aXH
         GmMWP+dtRBGkx51X2wj2MSDs/jvzrG/0A3nNTLURUOvcvHWD70ibyiKphntM0CDIodgS
         EAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=XhQqk1t/5tm78yKRqBQYz/yVCke2uXABjZhV8WbMXlc=;
        fh=Zw37hX1vhkRU8X5CI8u43ahWW0VdFFR+8G93WHued/c=;
        b=t32dAi5oZbt3EbFMOiQxOqwCR4t2VuCLlPaGpygj0RX3enWGtRo9G5rHEYmVTJ2xJs
         Cx6eKvJUXfbQaFOL6hUb2b0OR9Gi/Ma4zf5n+D9HKyCekG7wuYso86IQ3gFHrjhFHQ+9
         xg9pPkAtHpqYfDSnxzmNHIZj9cf1qR3+4N+F9hfnJ0zQpzF5HpTb9Kv78V2XfIx8Ux9v
         eIk9j1A5K+bp8MfYtd6kxyzrZWglOX/jqkiN08LI1Q58QdLN9C/gSXd+DFHJ5iAagF2j
         3MCuk4SQOJT/i39DBrbDemDY1TabDGRIsg8Y0tDPg3CQR6cvC4cbsd6jHS0eZbjVz5DK
         MkTQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCXXtVjw3CRRirxj+mdjWECw5AjpO7q+hGFg8ZzMwOqu4I8/IKX9sVAnTy/9JLKqn5mpV6tdtjmzmSCKd00wE1V0+9vjX8ta
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a0562140d6a00b0068cb94a6c91si525250qvs.87.2024.02.06.08.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:55:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOid-0002kG-2u; Tue, 06 Feb 2024 11:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=f3tV=JP=kaod.org=clg@ozlabs.org>)
 id 1rXOib-0002jv-SI; Tue, 06 Feb 2024 11:54:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=f3tV=JP=kaod.org=clg@ozlabs.org>)
 id 1rXOiZ-0007rU-Tq; Tue, 06 Feb 2024 11:54:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TTq9B5vsQz4wd0;
 Wed,  7 Feb 2024 03:54:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTq983XM5z4wcC;
 Wed,  7 Feb 2024 03:54:36 +1100 (AEDT)
Message-ID: <a9c0d2b2-2bb4-4770-97e5-5a061862da02@kaod.org>
Date: Tue, 6 Feb 2024 17:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 2/2] aspeed: fix hardcode boot address 0
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
 <20240205091415.935686-3-jamin_lin@aspeedtech.com>
 <46d14718-2b2c-45aa-aa12-854a2704383b@linaro.org>
 <SI2PR06MB504143638045D7666B341C09FC462@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB504143638045D7666B341C09FC462@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=f3tV=JP=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /cc4tctieqlF

On 2/6/24 02:48, Jamin Lin wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Sent: Monday, February 5, 2024 9:20 PM
>> To: Jamin Lin <jamin_lin@aspeedtech.com>; Cédric Le Goater <clg@kaod.org>;
>> Peter Maydell <peter.maydell@linaro.org>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Joel Stanley <joel@jms.id.au>; open
>> list:ASPEED BMCs <qemu-arm@nongnu.org>; open list:All patches CC here
>> <qemu-devel@nongnu.org>
>> Cc: Troy Lee <troy_lee@aspeedtech.com>
>> Subject: Re: [PATCH v0 2/2] aspeed: fix hardcode boot address 0
>>
>> Hi Jamin,
>>
>> On 5/2/24 10:14, Jamin Lin via wrote:
>>> In the previous design of QEMU model for ASPEED SOCs, it set the boot
>>> address at 0 which was the hardcode setting for ast10x0, ast2600,
>>> ast2500 and ast2400.
>>>
>>> According to the design of ast2700, it has bootmcu which is used for
>>> executing SPL and initialize DRAM,
>>
>> Out of curiosity, what architecture is this MCU?
> MCU is riscv-ibex and its architecture is riscv-32.
> 
>>
>>> then, CPUs(cortex-a35)
>>> execute u-boot, kernel and rofs. QEMU will only support
>>> CPU(coretax-a35) parts and the boot address is "0x400000000" for ast2700.
>>
>> OK, but I don't get how you get from here ...
>>
> Our design make MCU execute SPL and copy u-boot image from SPI to DRAM at address 0x400000000 at SPL boot stage.
> However, QEMU will only support to emulate CPU sides (coretex-a35) for ast2700, 

The fby35 is an example of a machine with two ARM SoCs : ast1030-a1
and ast2600-a3. There is work in progress for heterogeneous QEMU
machines and It might be possible to model RISC-V and ARM one day.

> that was why we want to change the boot address at 0x400000000
> And use the following start command by QEMU.
> 
> ./qemu-system-aarch64 -M ast2750-evb -nographic -m 8G \
>   -device loader,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin,force-raw=on \
>   -device loader,addr=$((0x400000000 + ${UBOOT_SIZE})),file=${IMGDIR}/u-boot.dtb,force-raw=on \
>   ---
>   ---
ok. Makes sense.
  
> By the way, I will send a new patch series to support ast2700 in two weeks and
> We set memory map for ast2700 as following.
> 
> static const hwaddr aspeed_soc_ast2700_memmap[] = {
>      [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
>      [ASPEED_DEV_SRAM]      =  0x10000000,

Excellent !

Thanks,

C.


