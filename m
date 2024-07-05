Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1227419njb;
        Fri, 5 Jul 2024 06:29:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmuytorKCzai0+/HpQpvjuFR6hI5WoIp2ES3cPhxMVDqnIyO0l6bTpV53SeB02dynIx3FgVYCxpS0J/hERs24RdQ9nu+kv
X-Google-Smtp-Source: AGHT+IHXvYU3qjfGRC55lP3zmbjimFN867ve05Ec8niUoaxq0IVoDsrfKGvmVNfWx5ElO2OfuKtz
X-Received: by 2002:a05:620a:1368:b0:79d:80d8:4742 with SMTP id af79cd13be357-79eef296e09mr640241685a.3.1720186147093;
        Fri, 05 Jul 2024 06:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720186147; cv=none;
        d=google.com; s=arc-20160816;
        b=E/2Wrfr6Em0I9B1AO72xzO//ZnW8CtnZw/nzlX6VcZsz0oi3EsINZXW//WNRT65SaU
         v4rP06IFd9rp2yzicjAeVpQ97+6IKfR4W/s54GUR/aLMK9V8zh7h0a4l4VPfzuB+prjj
         wNGd6pP2ymVvrz0cszscUuq7in+GMUwNpdn8UrQ16dutWb8/dQXx9pYNS9PeOl/4NKJr
         Ub7rMCjGo9mBA+cFD9rZ18cITFYJlK/Rw1k4dY5niDSbcAokbBzSGWlNRA7v1rQMCIKE
         Ep2oW37O9g+ux1ZeVqaxGeFsEkB4lYsIz/EvjqjBl1PWBsI3/iCTib11bgL2MHPoIRTm
         5MTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KTIaIwuF1Hd7WTvGDN/mPtt/G1KpBjOFvNeXbcF3s3A=;
        fh=mGCCUhyH9aq5NyV74GKzTgczSU5UuKEunlJw9tudSKs=;
        b=WlpOZhKvYlek8Qe9P1ukMMQPeDxw7E7GwLoja2/UIFi3w6WY/H4bFh+A2+gtL3oyXi
         SEo00aVMomuOLXFaQj9BryruT7RDnm0DDgPbEg+zDWdWkIxnksEYvmXPOTw8OFSCWBxn
         mbw9ImhxS8ZPbhAQiLrn+zDoOW09RNrjs112fD3Fn9m1FiROB7la/ULNq/+uKwyyOwEU
         Kwuq2KUpgh9IAIRTNgfV+sUPqOn6vK/eafnBvpImo6KUsEHKS0OKKqd8d86At8JfqnbC
         abeUyLRdujA5SuWTIam5NZWRwLS+ED/L/KvNBzFoLO1202iONHQiWCthLVQmpGJ4itgT
         0D2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xAfiFf/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447dc7e8cb3si3352371cf.501.2024.07.05.06.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 06:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xAfiFf/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPizi-0007VD-VL; Fri, 05 Jul 2024 09:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPizh-0007UV-4D
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 09:28:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPizf-0004uS-Ce
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 09:28:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4255fc43f1cso11349955e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2024 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720186134; x=1720790934; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KTIaIwuF1Hd7WTvGDN/mPtt/G1KpBjOFvNeXbcF3s3A=;
 b=xAfiFf/qklawdAto6Tueg/AQOXdAfY5stXq1jpIdcijazuM5r8KGT0ygckTmGeNAFU
 t99TWlrCevyUUGKyUxkrZdppY/Usor0eetmDunxtnJ61VKcKXmoHRJ1zqa9weOpvnIL7
 AbSQuRhptuA2tHDvxh8uXorHYSw4kZXF4oxiCOKkCTKBZA+JOytVNXKlrEmIw+MJmfKo
 vXNWHepNMKYnm2Sp+AEZh7/QHxdNdkTsvt5zOgDtGUhiI0vTdX37cYFPAGJfkF7XYqrp
 /Pi7jo7oajuqWS8WIduPhzHudqfAY8fckayKGFNl6IjcSqA8uc2EWQUCsuIQf/E+iyX9
 qoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720186134; x=1720790934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTIaIwuF1Hd7WTvGDN/mPtt/G1KpBjOFvNeXbcF3s3A=;
 b=nDcYPT28D/gnViV8fpTxEC3cKXjYrO7sWjQk9TyIFvUrIuNal1mdgiNeMj4XD0LjrR
 5TNWsS18fOxq0F6dcELViFoRc4bVEDO1xR767ri2nB6HWStzvEElmMNufdJypFGQygZz
 8hF4kXVXyKYCr5Gbu0380BJ0caDDooMxSxeLjFQP2b1UBeOiTHqRrDXamexjhko9zz30
 l6FBEkYBig3M9Db4vVlf3jDvXUiYyUt79XXOWGcjNR01Ni7Slr7ruh0rzu7zVacIMt0t
 uI+jQLC7YtHqGamQEmrZ7NUH68TKBWl0uKsgw1vn8Mabm11auQVi7u/hF/GoBi/bTvZo
 M/DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfkdIzM8qggIeQ4yCRoISZuL8q7AEFpv07SCOgqYZO7MUBLHQt2NmW/zf2awEBCpQWoNiZ0KY7z9pXBY7/kAVKyfPM
X-Gm-Message-State: AOJu0Yxv0W4l6tZuQZ+ECoGYtuxTcbakGDGHX80+gPEjCA1msiJyFVKI
 uDl5JrYAFWr3S3kPxFZuDPn34Wexi/llwcXx/C2hPwFQs7kk8TCvMnRrhH50bwM=
X-Received: by 2002:a05:600c:63c4:b0:425:6207:12b4 with SMTP id
 5b1f17b1804b1-4264a3e79cbmr36017085e9.24.1720186133783; 
 Fri, 05 Jul 2024 06:28:53 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.163.129])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2ca60bsm62922245e9.31.2024.07.05.06.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 06:28:53 -0700 (PDT)
Message-ID: <8e770030-29ab-4e30-861f-3e735b25e37b@linaro.org>
Date: Fri, 5 Jul 2024 15:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] aspeed: Set eMMC 'boot-config' property to reflect HW
 strapping
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-6-clg@redhat.com>
 <f50579b99ef8883dac5fcfc1606a45abfb8bf85f.camel@codeconstruct.com.au>
 <e6ca185f-3f9a-40e1-9ed2-eccfbbdf1444@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e6ca185f-3f9a-40e1-9ed2-eccfbbdf1444@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: O0Fw3XnhKrIc

On 5/7/24 07:38, Cédric Le Goater wrote:
> On 7/5/24 5:41 AM, Andrew Jeffery wrote:
>> On Thu, 2024-07-04 at 07:36 +0200, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@kaod.org>
>>>
>>> When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
>>> property to set the boot config register to boot from the first boot
>>> area partition of the eMMC device.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/arm/aspeed.c | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index 756deb91efd1..135f4eb72215 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -327,7 +327,8 @@ void aspeed_board_init_flashes(AspeedSMCState *s, 
>>> const char *flashtype,
>>>       }
>>>   }
>>> -static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, 
>>> bool emmc)
>>> +static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, 
>>> bool emmc,
>>> +                               bool boot_emmc)
>>>   {
>>>           DeviceState *card;
>>> @@ -335,6 +336,9 @@ static void sdhci_attach_drive(SDHCIState *sdhci, 
>>> DriveInfo *dinfo, bool emmc)
>>>               return;
>>>           }
>>>           card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
>>> +        if (emmc) {
>>> +            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 
>>> 0x48 : 0x0);
>>
>> 0x48 feels a little bit magic. I poked around a bit and there are some
>> boot-config macros, but not the ones you need and they're all in an
>> "internal" header anyway. I guess this is fine for now?
> 
> You are right and we should be using these :
> 
> hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG             179     
> /* R/W */

This field is R/W and expected to be configured by the guest.

Why the guest (u-boot) doesn't detect partitioning support?

See eMMC v4.5 section 7.4.60 PARTITIONING_SUPPORT [160] and earlier

   For e•MMC 4.5 Devices, Bit 2-0 in PARTITIONING_SUPPORT
   shall be set to 1.

We don't set it so far.

I see in u-boot mmc_startup_v4():

     /* store the partition info of emmc */
     mmc->part_support = ext_csd[EXT_CSD_PARTITIONING_SUPPORT];
     if ((ext_csd[EXT_CSD_PARTITIONING_SUPPORT] & PART_SUPPORT) ||
         ext_csd[EXT_CSD_BOOT_MULT])
             mmc->part_config = ext_csd[EXT_CSD_PART_CONF];
     if (part_completed &&
         (ext_csd[EXT_CSD_PARTITIONING_SUPPORT] & ENHNCD_SUPPORT))
             mmc->part_attr = ext_csd[EXT_CSD_PARTITIONS_ATTRIBUTE];

I'm still waiting for the eMMC prerequisite to be reviewed
before looking at the eMMC patches in detail :/

Regards,

Phil.
