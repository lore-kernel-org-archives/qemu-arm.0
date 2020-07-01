Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp196159lfm;
        Wed, 1 Jul 2020 00:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjPqDD2Ll6hkTuyt8Bt2P39KbmVx3GrqwmZZaYH3tyNKBsrhdeGkrNSw2fI+FBOa39Vy34
X-Received: by 2002:a25:3484:: with SMTP id b126mr29354028yba.111.1593587777628;
        Wed, 01 Jul 2020 00:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593587777; cv=none;
        d=google.com; s=arc-20160816;
        b=RTr1CvzehCSAMtOefV5NoIFL/m+7a8xEepdqUQJTcx3f9Mh+oohe8J02GpY9glJMtz
         //uByQCvSpBbe8gzBqVvOybADpYf0eXgdTWBU1p+4Lc/jZLnQjZE2M4Zye+nypt8VxpL
         yYjykA3EMT7ZwiB+/tTPnZe12mYjORyCGBQ9dVNRA4WAu2j0vvXtBmgMm+cGgdh6SiEd
         X6FhoejGnECxo8C+QDaeOnj0a14WRZZixNcguJGjPs5NJHsnsxVAcxJ+ObSiwY5d04ya
         69MgBcDyqbB+a6wWxhDOLJq8lzvnBGeBg/zeYoukqIbJ7wdHHIeaimORNUTBDz6V7VLL
         2fZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/8HuZKGlFD1j0ve55LUlrjEgU6QHpegcr4RT72ZogN4=;
        b=QTzCx+Swlfq4y7NI3zl/dgunOgrWZG03JR8s9mz4gaCdqlc3dpt+jG2JKCVPitQwMq
         K5W2K+RgfEOUTLxfbiJHuNcmD3IlXRekL2ey4CnNAouafZIEAqyNCWlQI6StlgEjV6v+
         7WwpX8rDOa1NlED0k8cyBNfwyqV+NBnUEBdTKrsEFoePG8gbbQ3D6+Zo1R+G6FIhB4xO
         UGNBddRuUJtMRmIW4/0fltEzMG0TGWM7TcsdEk2EHM3zR6E1AHZVDIAHnGKx0hjpjIQI
         pPrvGl/WuvRoD346MGES0avUekXcGoYIplHhiELgbHfYJSSXmOBhwM4lX+v6HOt9y8Ff
         XjsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=frGZEHXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si7658931ybt.31.2020.07.01.00.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jul 2020 00:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=frGZEHXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqWyf-00033K-14
	for alex.bennee@linaro.org; Wed, 01 Jul 2020 03:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqWyX-00032t-2G
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 03:16:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqWyU-0000ep-OH
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 03:16:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id a6so17565170wmm.0
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2020 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/8HuZKGlFD1j0ve55LUlrjEgU6QHpegcr4RT72ZogN4=;
 b=frGZEHXxYIr8qSIEEEcvpKLU9zmV6JjUzv5o1t+AD+b42jvoIj7D+x/VrDQA4Tyt9C
 yIZiHRtSsfvpCepuTTrS8SESDnO9LGXV2kOjwyMd8u7bQiDztmKYCFCWyuXaitBlogHX
 UVleVLuQ1B+KiBMG996tpxZ/iK4y1RbFngtknNkswIsxgZgzbo9ykDP/gTyBV17FS4nB
 g/GUhIV3PiGfi/hxH5VhAJyr8+np3u6uz4eRGdhxX4Q60pcSCMSoNAI6nkptkJMCZLpw
 elXLsAH9k2ppP4nHTv+tuxLnFf6PjGKTzjRvalonrpIcVEXIweCRs5YbiWamQpiaEC9C
 IFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/8HuZKGlFD1j0ve55LUlrjEgU6QHpegcr4RT72ZogN4=;
 b=rqRY/LDeHxj1uET/RgGQWu0IjGvn7E2pwASlBwhZ8BnYwrtzNYRkABy2KCsXQ3P+ir
 rJ4zNmqjgHV4K5CoY2ELMu4wg4Ra/2tuvNv55myfbqXWlsaGmndHXcd/Rm4DjdGrqkD8
 GMfKDIb/L/izqkTnYVn85kGooUNsUf+AlpVhG5GKgwgAww+Qzgjy1uSpkvA3K0sdl33l
 DZb0P+BQgnQ4eZe364m/OzNIaFM+AmSRDDlckvTUQqYPUeFLpA0l7gZBkI1ObVWMXP5I
 nzBxa6J80tsqiO+iSSGWkTEiDnr+bQFBichK/bElo1Jt/sWSQoWHr2O0q8IdEAqLDP4F
 3JHA==
X-Gm-Message-State: AOAM531vHymoR/L0bFp5aGY5lCuxnEKRlx/RPLvo+rVXx/3rKEeQEJ+C
 6yh1BN1+iDBGtLCIiZQP9NE=
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr18192895wml.120.1593587765213; 
 Wed, 01 Jul 2020 00:16:05 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id b62sm5968849wmh.38.2020.07.01.00.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 00:16:04 -0700 (PDT)
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <b3480de1dece41ed80091feba584c500@TWMBX02.aspeed.com>
 <CACPK8Xd=zz5oAXxu0Hd_szVQ5btQCMPPP7K7OrvAcoYr7zdpPQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7bd34a68-b851-ce8a-b9d7-14ec169f345f@amsat.org>
Date: Wed, 1 Jul 2020 09:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd=zz5oAXxu0Hd_szVQ5btQCMPPP7K7OrvAcoYr7zdpPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Erik Smit <erik.lucas.smit@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YTaYG/gLGbxY

Hi Joel,

On 7/1/20 4:32 AM, Joel Stanley wrote:
> On Wed, 1 Jul 2020 at 01:23, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> 
>> On Tue, 30 Jun 2020 at 15:32, Erik Smit <erik.lucas.smit@gmail.com> wrote:
>>>
>>> Hi Philippe,
>>>
>>> On Tue, 30 Jun 2020 at 17:29, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> Hi Erik,
>>>>
>>>> On 6/30/20 5:11 PM, Erik Smit wrote:
>>>>> Hello,
>>>>>
>>>>> 5d971f9e memory: Revert "memory: accept mismatching sizes in
>>>>> memory_region_access_valid" breaks Supermicro AST2400 u-boot.
>>>>> Supermicro AST2500 u-boot is fine.
>>>>>
>>>>> The u-boot tries to make a 2-byte read from address 0x84, but
>>>>> aspeed_ast2400_scu_ops has min_access = 4. When I change
>>>>> min_access to
>>>>> 2 or revert above commit, u-boot boots again.
>>>>>
>>>>> Is changing min_access to 2 the right way to fix this?
>>
>> Ryan, do all addresses on the AST2400's APB respond to single byte accesses?
> 
>>         Most register is not support byte access, it need to refer the datasheet descript each area. [chapter : ARM Address Space Mapping]
> 
> Thanks Ryan.
> 
> Summarising that table:
> 
>  - most addresses are 4 byte write accesses.
>  - all addresses support 1/2/4 byte reads.
> 
> The regions that accept 1/2/4 byte access are the SDRAM, SRAM,
> ethernet MACs, video engine, the flash controller regions (2000_0000
> -> 2FFF_FFFF and 3000_0000 -> 3FFF_FFFF), and the AHB to LPC bridges
> (6000_0000 -> 6FFF_FFFF and 7000_0000 -> 7FFF_FFFF).

Useful info. We have:

static const hwaddr aspeed_soc_ast2400_memmap[] = {

    /* AHB ??? */

    [ASPEED_IOMEM]  = 0x1E600000,
    [ASPEED_FMC]    = 0x1E620000,
    [ASPEED_SPI1]   = 0x1E630000,
    [ASPEED_ETH1]   = 0x1E660000,
    [ASPEED_ETH2]   = 0x1E680000,
    [ASPEED_EHCI1]  = 0x1E6A1000,
    [ASPEED_VIC]    = 0x1E6C0000,
    [ASPEED_SDMC]   = 0x1E6E0000,
    [ASPEED_SCU]    = 0x1E6E2000,
    [ASPEED_XDMA]   = 0x1E6E7000,
    [ASPEED_ADC]    = 0x1E6E9000,
    [ASPEED_VIDEO]  = 0x1E700000,
    [ASPEED_SRAM]   = 0x1E720000,
    [ASPEED_SDHCI]  = 0x1E740000,

This block ^ contains "SRAM, ethernet MACs, video engine
that accept 1/2/4 byte access". Can we assume all peripherals
in [0x1E60.0000-0x1E7F.FFFF] accept 1/2/4 byte access?

    /* APB ??? */

    [ASPEED_GPIO]   = 0x1E780000,
    [ASPEED_RTC]    = 0x1E781000,
    [ASPEED_TIMER1] = 0x1E782000,
    [ASPEED_UART1]  = 0x1E783000,
    [ASPEED_UART5]  = 0x1E784000,
    [ASPEED_WDT]    = 0x1E785000,
    [ASPEED_PWM]    = 0x1E786000,
    [ASPEED_VUART]  = 0x1E787000,
    [ASPEED_LPC]    = 0x1E789000,
    [ASPEED_IBT]    = 0x1E789140,
    [ASPEED_I2C]    = 0x1E78A000,

    [ASPEED_SDRAM]  = 0x40000000,
};

The best description I could find is
http://i.cloud.opensystemsmedia.com/i__srcfa3ad69f86b70417ba72d4fcbbef08cd_paraf0d99c20bd457d46a92c72841873c47.jpeg
But the buses are not mentioned.

> 
> We don't model the AHB to LPC bridges in qemu, nor the legacy flash
> controller region at 1000_0000 -> 15FF_FFFF.
> 
>>>>
>>>> If you have access to the datasheet and can verify, then yes.
>>>> Else I suppose Cédric, Andrew or Joel can check for you.
>>>
>>> I do not have a datasheet. Aspeed seems quite picky about sharing this
>>> and I'm just a random researcher.
>>
>> Erik, can you point us to the image you're using?
>>
>> What is the command line are you testing with?
>>
>> Happy to fix the model to support random firmwares, as long as the fix is correct for other (open source) firmwares.
>>
>>>
>>> Best regards,
>>>
>>> Erik Smit
> 
