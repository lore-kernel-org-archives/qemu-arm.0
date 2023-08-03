Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1300100ejb;
        Thu, 3 Aug 2023 13:47:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF6rjug3woYpMgZ7u5CosBYclM5HkVZ+TIZRASMlc6mg1WWJeUhpTe9F2deK8OmsXzhcLJO
X-Received: by 2002:a05:622a:349:b0:3f6:ad2f:3922 with SMTP id r9-20020a05622a034900b003f6ad2f3922mr25961310qtw.8.1691095676133;
        Thu, 03 Aug 2023 13:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691095676; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2U9i6yQE35QGZ8hbEMSm34tvx5S2E4LJmpLkmy/vDNZhFA7iXH2R+Cn5Ol13d1o//
         BltqFf8YrJ0LXvb5LvC3GnHoHxUI2lySZxaBoGng9IgqJ7srOlroiC378TUhRys3um6F
         5Z8St+IkzjiPhQpmeEKMbydZm/bxHe4Hjctvk9wdyIiiLWh1sqiXs+S9ZfIpEJA+wFRH
         pAId5+P95STIqtgtH9uLoZXsCJBLlttHUISaxt+f1X21ixrStWlX0/7ZkTr/MTDmFf0g
         amjzoh1TSyAikW3braWayC5Ir0RTEsVARW6OyFSb2kk8pzPrRMHA+1VSKkkgmojM552I
         Ss9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=BlWJg1wd4aUj0IbAvh9yMbtktOKdjfbL6LlGBkEqqOo=;
        fh=atnfWDP2VbQISFfq7Yvjm5IImcaYPip6VDo6r0UUw2c=;
        b=F699JBC2GnurvnXIQxO5CbdkJNGEYAPcMy33odSHIvKkjEjgA6oPMz2vOyec8X9fIl
         yko+cmRd4Z+459CNIbcNdCU1Abvg1FrsXfd+zGhQWwiHpo3bBxCuBFrog6dqWOblRv6y
         FZY17Wt9h0FJo+4huoF5WqWKvmRchX4fdu9j0bdM7qTJa6cJLdSZT21/EtCt3R78/dFw
         nsQriSbvb8M8LvOhRVyVjQ+EtHCHnCZL1vFT6OEFvnswj2hti8gtjliOMH3M0cMesMlx
         qBJu1LSMONZm0u1ydrdXLDqMR8BXvJ4xHOMVjPVnXrxQHSgDeHXMzoRgzo7QqLz6cqqK
         nYdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a05620a258900b0075cd16ef9a3si290707qko.504.2023.08.03.13.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 13:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRfEP-0006jx-UR; Thu, 03 Aug 2023 16:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qRfEP-0006jl-3t; Thu, 03 Aug 2023 16:47:37 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qRfEN-0002N8-8s; Thu, 03 Aug 2023 16:47:36 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8E79240002;
 Thu,  3 Aug 2023 20:47:29 +0000 (UTC)
Message-ID: <a60506b6-5033-4c42-0592-c673cc01f7de@tribudubois.net>
Date: Thu, 3 Aug 2023 22:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/5] Refactor i.MX6UL processor code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
References: <cover.1691010283.git.jcd@tribudubois.net>
 <649a1160b36c58ea89daf02a11b12f2dff164fee.1691010283.git.jcd@tribudubois.net>
 <14c9fd15-6925-79e4-3120-87e302de0e1c@linaro.org>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <14c9fd15-6925-79e4-3120-87e302de0e1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=217.70.183.193; envelope-from=jcd@tribudubois.net;
 helo=relay1-d.mail.gandi.net
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3gPqSZjFq/JV

Le 02/08/2023 à 23:32, Philippe Mathieu-Daudé a écrit :
> Hi Jean-Christophe,
>
> On 2/8/23 23:08, Jean-Christophe Dubois wrote:
>> * Add Addr and size definition for all i.MX6UL devices in i.MX6UL 
>> header file.
>
> I'm OK with your patch, but some addr/size are added, while other
> are changed. It is hard to review. Having one patch for changes
> and another for additions would help review.

I tried to set addresses and sizes following the order set for devices 
in the i.MX6UL reference manual. I found it easier to follow then (and 
make reasonably sure I didn't miss some).

I certainly understand that the reorder is annoying for the review. I 
can try to do as you intended but I am not sure the reorder review would 
be really easier.

>
>> * Use those newly defined named constants whenever possible.
>> * Standardize the way we init a familly of unimplemented devices
>>    - SAI
>>    - PWM (add missing PWM instances)
>>    - CAN
>> * Add/rework few comments
>>
>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>> ---
>>   hw/arm/fsl-imx6ul.c         | 149 +++++++++++++++++++++++------------
>>   include/hw/arm/fsl-imx6ul.h | 150 +++++++++++++++++++++++++++++++++---
>>   2 files changed, 240 insertions(+), 59 deletions(-)
>
>
>> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
>> index 9ee15ae38d..5d381740ef 100644
>> --- a/include/hw/arm/fsl-imx6ul.h
>> +++ b/include/hw/arm/fsl-imx6ul.h
>
> For example here:
>
>> +    FSL_IMX6UL_SNVS_HP_SIZE         = (4 * KiB),
>> +
>>       FSL_IMX6UL_USBPHY2_ADDR         = 0x020CA000,
>> -    FSL_IMX6UL_USBPHY2_SIZE         = (4 * 1024),
>
>> -    FSL_IMX6UL_USBPHY1_SIZE         = (4 * 1024),
>> +    FSL_IMX6UL_USBPHYn_SIZE         = 0x100,
>
> Don't we also need:

Well, I did not modify the i.MX USB PHY file by itself. It is a fact 
that the last i.MX USB PHY register is at 0x80 offset and a 0x1000 
memory region for the device is certainly oversized even if the 
processor memory map is actually provisioning a 0x1000 address space 
between distinct USB PHY devices.  My intent in lowering the device 
register region size as close to the real size as possible was that in 
case a device was not "implemented" in Qemu we could just map it as an 
unimplemented device (allowing dummy access to the register range) but 
get some kind of platform "bus error" if the software was trying to 
access some "registers" in the upper part of the memory region (as you 
would on the real hardware?).

So 0x1000 is not wrong per se as the USB phy device implementation code 
is logging the illegal access when software is doing access over 0x80 
offset. This would just not trigger a processor hardware access fault 
(when it could/should?).

>
> -- >8 --
> --- a/hw/usb/imx-usb-phy.c
> +++ b/hw/usb/imx-usb-phy.c
> @@ -210,7 +210,7 @@ static void imx_usbphy_realize(DeviceState *dev, 
> Error **errp)
>      IMXUSBPHYState *s = IMX_USBPHY(dev);
>
>      memory_region_init_io(&s->iomem, OBJECT(s), &imx_usbphy_ops, s,
> -                          "imx-usbphy", 0x1000);
> +                          "imx-usbphy", 0x100);
>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
>  }
>
> ---
>
> ?
>
> Thanks,
>
> Phil.


