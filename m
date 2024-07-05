Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp4307869dlb;
        Fri, 5 Jul 2024 08:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTY4MVcsuZAKf1SD1lVlsAN+6XTU89CmUPnu1jay9Bz/TInaysoyIdIrC//TLCrxEQY5wB2V+nSmXsR1jjYGjhNABKUA5v
X-Google-Smtp-Source: AGHT+IEGlU5RT/aeGWNmk3JgZLgvKnqFpIT1tjcgU41gNNKGJZ06TEruVi3z0ObSc2cpIxKGzRvb
X-Received: by 2002:a05:6214:f02:b0:6b5:df48:bc6d with SMTP id 6a1803df08f44-6b5ecfc7a7emr59887216d6.14.1720194763350;
        Fri, 05 Jul 2024 08:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720194763; cv=none;
        d=google.com; s=arc-20160816;
        b=UuqVPIeFA7OM6TE/tIFJTAV+MXZ3ga7QJGRFuJe7UBaoGG80Fs5K17oYzdKpPA6Fmq
         tKphb7vK4Yv+BbKSvFA+I1AxfWk3K4HtaR9qhRh294CH5/xmU0H92N6hDXHB4sYa43yD
         YhW2NkC8luB34dw6pz1bbGu1OhpxryMMeOGx3gxKO9TD9EIAQ3WNKVyozpIB6FSHo1M0
         yxwOxos4kvC3gQyRuat6wtbYnNSl6ij+3yz1ypPN5BRKthugLK+Pga0NDoPNdhMkkZ6W
         QTk0h9EUwbtmnzK49JUR/tIKGOhFP1mYNEc5uA665Lr0ZkPvzkqxQlA437BIluc9ga2h
         4TGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CPgCQ2K8RN3WxfZ+0pNgNHcA71LvrnZcqWRsrJX62H8=;
        fh=u/Fwutaw2PtyeVfujf7uA4jXvfVSTPQeqNMNZlNPzs8=;
        b=MZP72YA3kVD1alEY2qbOJvy7oq9ZepiFgINV66XtBYMjNfsJTR2Ta53KeMbbwHEpEL
         0CWL0SKRyjvPzw5TOunpUMSZnL942n5mjMFLEM/SfUy70CCfr1Mk2N5gOYMVE9wHaSDO
         lkXLqGBxU1k2eKU6YCgytn0bi5vgXAEGrE5tJhdFJbn7Q58DmIIGyHPozh1dchTzjS6I
         RtBr+tVe/D1qkoqBlO4dHji5p+AOgv73f00l1rOfHvQXEiYSyFIEdVhWS7fscV0KsfgS
         Pwy3dS5BhGgmWEr7abnoujygQ3bBFo1qoO7r4KeBcFyDBWm7t/Dh6BaybbIUm+q8Z/lw
         0OCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjHFMvjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5e7e66e56si46822656d6.434.2024.07.05.08.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 08:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjHFMvjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPlEc-00087b-Gh; Fri, 05 Jul 2024 11:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPlEW-00086O-1q
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 11:52:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sPlEU-0001LX-DA
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 11:52:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4265921b0f6so3699445e9.2
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2024 08:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720194740; x=1720799540; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CPgCQ2K8RN3WxfZ+0pNgNHcA71LvrnZcqWRsrJX62H8=;
 b=vjHFMvjPd3J4nyMa7F+nvB3XpDiLjxnuiWjuUAC2uG6YTKdohgAnZS2Kl9P8Rg6+rj
 8UF55O7MKdDLGaW5ilFyohx33MFuMkEkdFnRI6GwgPDKtF4IC47m6PMpDw54cSnCxbpp
 Z3LJjDtEa/n1a20N5OabTWo1DwSKztDgIRewmKv7ev0sdzqfz41bCh7PUXE1aDEvCSEl
 OacH0Q8Z79N5cuXSyXdVpfoueoZjrKGSZWMkv+t1XEwtqd5woaIMUBnWglIHi77h0adw
 eBSTf84wqc1pjcRXKjNeYrXO6WROsblUpTgAcuZa8Cb/nMKK1cFUQFycQU+ijIkivTfl
 p2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720194740; x=1720799540;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CPgCQ2K8RN3WxfZ+0pNgNHcA71LvrnZcqWRsrJX62H8=;
 b=Aplg9VCYUXgrPril5ekEzEChyos4d4MuHDse6F2ESs/R5LEbObnbuovA//gjIexFqy
 KNcn67AdRHsEsVyqiLtU/0BwwxIuYqg2gXH3FKrAXr1xPUHe+Sk0KcMTLIVz2XXCa7HL
 hdsqYCIwBVPvzdlRtG1swqCcXGKoMbZnNw0RQPruvRce2RM6seCnjQfD046UEB/wjY+Z
 inausRiLPcNsxqwxhgzQEwq/rqJWZy4orZ6zmfdoHl/MD9Eh/QRzk6mnOUOgRhzjUjJH
 MzEjZRGogJ0NKsQMedJusuGpL1xIjlvPSUGMVhrvvVQwrThkN7Tq/4Dtc4W1gqpK1p2O
 jcCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiWr5MoOonfUE6TlJ1j7V7mVbQZlF3OHNW3agkeSsenMM830XQuIn/1VvbXhgf+23odK0ekUHOmpesuLpjatrmE9c9
X-Gm-Message-State: AOJu0YwfEBNbI1d1J8N1Jb94qxl21MWPxseNeO1xXY2wfbvi4OMZSsgy
 Fp94W2lotN3W41guyZgv8VltUg1d/IQ5pfhkz4sKNK+He0FG55Q2KGVo3QfuiZo=
X-Received: by 2002:adf:f64f:0:b0:367:94b8:1df1 with SMTP id
 ffacd0b85a97d-3679dd63b7cmr3291376f8f.55.1720194739901; 
 Fri, 05 Jul 2024 08:52:19 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.163.129])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367908768b4sm7729596f8f.79.2024.07.05.08.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 08:52:19 -0700 (PDT)
Message-ID: <b606cd09-3846-4c99-b902-b0b260d91788@linaro.org>
Date: Fri, 5 Jul 2024 17:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] aspeed: Set eMMC 'boot-config' property to reflect HW
 strapping
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <8e770030-29ab-4e30-861f-3e735b25e37b@linaro.org>
Content-Language: en-US
In-Reply-To: <8e770030-29ab-4e30-861f-3e735b25e37b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4c0cHSCSJiBa

On 5/7/24 15:28, Philippe Mathieu-Daudé wrote:
> On 5/7/24 07:38, Cédric Le Goater wrote:
>> On 7/5/24 5:41 AM, Andrew Jeffery wrote:
>>> On Thu, 2024-07-04 at 07:36 +0200, Cédric Le Goater wrote:
>>>> From: Cédric Le Goater <clg@kaod.org>
>>>>
>>>> When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
>>>> property to set the boot config register to boot from the first boot
>>>> area partition of the eMMC device.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/arm/aspeed.c | 15 +++++++++++----
>>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>>> index 756deb91efd1..135f4eb72215 100644
>>>> --- a/hw/arm/aspeed.c
>>>> +++ b/hw/arm/aspeed.c
>>>> @@ -327,7 +327,8 @@ void aspeed_board_init_flashes(AspeedSMCState 
>>>> *s, const char *flashtype,
>>>>       }
>>>>   }
>>>> -static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, 
>>>> bool emmc)
>>>> +static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, 
>>>> bool emmc,
>>>> +                               bool boot_emmc)
>>>>   {
>>>>           DeviceState *card;
>>>> @@ -335,6 +336,9 @@ static void sdhci_attach_drive(SDHCIState 
>>>> *sdhci, DriveInfo *dinfo, bool emmc)
>>>>               return;
>>>>           }
>>>>           card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
>>>> +        if (emmc) {
>>>> +            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 
>>>> 0x48 : 0x0);
>>>
>>> 0x48 feels a little bit magic. I poked around a bit and there are some
>>> boot-config macros, but not the ones you need and they're all in an
>>> "internal" header anyway. I guess this is fine for now?
>>
>> You are right and we should be using these :
>>
>> hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG             179 /* 
>> R/W */
> 
> This field is R/W and expected to be configured by the guest.
> 
> Why the guest (u-boot) doesn't detect partitioning support?
> 
> See eMMC v4.5 section 7.4.60 PARTITIONING_SUPPORT [160] and earlier
> 
>    For e•MMC 4.5 Devices, Bit 2-0 in PARTITIONING_SUPPORT
>    shall be set to 1.
> 
> We don't set it so far.

Sorry, I wasn't grepping in the correct branch, we do set it:

      sd->ext_csd[EXT_CSD_PARTITION_SUPPORT] = 0x3;

I'll investigate.

> I see in u-boot mmc_startup_v4():
> 
>      /* store the partition info of emmc */
>      mmc->part_support = ext_csd[EXT_CSD_PARTITIONING_SUPPORT];
>      if ((ext_csd[EXT_CSD_PARTITIONING_SUPPORT] & PART_SUPPORT) ||
>          ext_csd[EXT_CSD_BOOT_MULT])
>              mmc->part_config = ext_csd[EXT_CSD_PART_CONF];
>      if (part_completed &&
>          (ext_csd[EXT_CSD_PARTITIONING_SUPPORT] & ENHNCD_SUPPORT))
>              mmc->part_attr = ext_csd[EXT_CSD_PARTITIONS_ATTRIBUTE];
> 
> I'm still waiting for the eMMC prerequisite to be reviewed
> before looking at the eMMC patches in detail :/
> 
> Regards,
> 
> Phil.

