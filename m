Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1151593lfc;
        Wed, 10 Jun 2020 23:13:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ35D+xXWb0uf1i6qEjjAaHyVbdKDcCvZ1FiAejv4MUNG0S94VAc33NPEb3Sznif4P0Iwb
X-Received: by 2002:a25:7a81:: with SMTP id v123mr11847973ybc.512.1591856006179;
        Wed, 10 Jun 2020 23:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591856006; cv=none;
        d=google.com; s=arc-20160816;
        b=odm/2TIAtmpX1BjmgOegWqwKsODfThdurHAvIPIRvsmfSXnVxMNOAjs1KATTUH8/q2
         sIgv+hAs7kc2skBa2keJHR4ScAD2FeuqYno2Fi/Pie6o4awsdwvVLzY/5bNseaNJ5xhv
         jtSLSUMROXa964TQfj2CfMbDsGMoZ1sY8zxPzGbjWLm47wCaLocfMLEKHyC9Vgqcsl/h
         HTfPp93HqpZi2qOARcrx1jjJZhgbaXjirUi0X7YZATCby1oLbHkLp1fs8Egfff5rIv4I
         9qC/nqh9iZqNyxbD/psy/R7pDjJKZHL7AfKtMCOwtv8bDzkXUjFQfUpc65wClZnd0fnm
         YE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=hG/KcH08a67H9TGBUqJ5+qvGW4TckbHpW/Gf+xLf19k=;
        b=wSB9FEH1CYWwr6kMFGMYIMhhjLuix2aYIROgRvmImwAe5/qXtYeUdwRLKd1d02wTqs
         IlpoSt/zW6s0/HSKLAZg9gV+xmwHcyf2t2nVdvskyCNSL4CpzUY6X6BfQY5DJqtgBjXF
         rBUp9TLXhiRVVetZ7GaezT5I8FFezOJG07JRt9DGn+hnk1BBLhIO/nzN7zxOykJWRDUA
         vlqHlPuiOKEYLZYHbfwjwwIeqgnwF7mkOIB810blAAIpRk7IgtblEClYen4/5zSETI+e
         sYEcLiVcOB3YqsHgamCtmc2yjejc4IPkRtdnellu1kg3lhliWMFzxVP6vxtnJgEO2Dnc
         n06Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y76si1543967ybe.493.2020.06.10.23.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 23:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjGSq-0003T4-Lv
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 02:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jjGSP-0002xR-3S
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 02:12:57 -0400
Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]:47132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jjGSN-0005Gv-Hg
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 02:12:56 -0400
Received: from player799.ha.ovh.net (unknown [10.108.42.239])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3D17B2589B9
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 08:12:45 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 86A73134299F9;
 Thu, 11 Jun 2020 06:12:37 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006fdd3bafe-0a4e-4e90-adfd-1a0bc4b34b0b,C0EF776EFF99F305D3CB3540F1F035D206D19D4D)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 5/6] hw/arm: Add NPCM730 and NPCM750 SoC models
To: Havard Skinnemoen <hskinnemoen@google.com>
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-6-hskinnemoen@google.com>
 <18fa4025-0a2a-4427-b74f-2b1b678e0661@kaod.org>
 <CAFQmdRY9f6tV7VoDOFpRJ0x0hr_0EAaGqZwmXnkJpbvmbF4FVQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5f0864e4-5e63-4819-1f30-68a5f207e275@kaod.org>
Date: Thu, 11 Jun 2020 08:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFQmdRY9f6tV7VoDOFpRJ0x0hr_0EAaGqZwmXnkJpbvmbF4FVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14653587290785024937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehjedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedvveelvefgtddvveeijeehieegfeefjefgkeehgfevtdeuffdtkeevheeguefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.98.231; envelope-from=clg@kaod.org;
 helo=19.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 02:12:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 CS20 KFTing <kfting@nuvoton.com>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VS46CJgA5TIO

On 6/10/20 1:06 AM, Havard Skinnemoen wrote:
> On Tue, Jun 9, 2020 at 12:24 AM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
>     On 5/21/20 9:21 PM, Havard Skinnemoen wrote:
>     > +void npcm7xx_write_secondary_boot(ARMCPU *cpu, const struct arm_boot_info *info)
>     > +{
>     > +    /*
>     > +     * The default smpboot stub halts the secondary CPU with a 'wfi'
>     > +     * instruction, but the arch/arm/mach-npcm/platsmp.c in the Linux kernel
>     > +     * does not send an IPI to wake it up, so the second CPU fails to boot. So
>     > +     * we need to provide our own smpboot stub that can not use 'wfi', it has
>     > +     * to spin the secondary CPU until the first CPU writes to the SCRPAD reg.
>     > +     */
>     > +    uint32_t smpboot[] = {
> 
>     static const uint32 ?
> 
> 
> I think that would be unsafe due to the byte swapping, but I'll do it if we can get rid of that somehow.
>  
> 
> 
>     > +        0xe59f2018,     /* ldr r2, bootreg_addr */
>     > +        0xe3a00000,     /* mov r0, #0 */
>     > +        0xe5820000,     /* str r0, [r2] */
>     > +        0xe320f002,     /* wfe */
>     > +        0xe5921000,     /* ldr r1, [r2] */
>     > +        0xe1110001,     /* tst r1, r1 */
>     > +        0x0afffffb,     /* beq <wfe> */
>     > +        0xe12fff11,     /* bx r1 */
>     > +        NPCM7XX_SMP_BOOTREG_ADDR,
>     > +    };
>     > +    int i;
>     > +
>     > +    for (i = 0; i < ARRAY_SIZE(smpboot); i++) {
>     > +        smpboot[i] = tswap32(smpboot[i]);
> 
>     ah ! why do we need to swap the instructions ?
> 
> 
> I probably stole this from https://elixir.bootlin.com/qemu/latest/source/hw/arm/exynos4210.c#L134 although there are several other examples of this pattern.

Some don't some do. This is a bit confusing. 

Peter, should we fix the boards not doing the tswap in the secondary 
bootloader ? 

I still have access to a PP64 BE host to test.

Thanks, 

C.
