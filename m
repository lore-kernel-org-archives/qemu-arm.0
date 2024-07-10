Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp142333njb;
        Tue, 9 Jul 2024 21:59:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWodX6jZ/vpIQg5+1w0IcH2AUIGgO5i7lBanwGUnPfA8mbn5WCptFPty2bEeg5MMTMzrxo6MSSULHvJCXhwyv1ZiI9HJ92N
X-Google-Smtp-Source: AGHT+IEh1mSSh1iuE4Evv4CS53wH451TDMZ25oeZ5c7N90oM5X4yzqhFsp6MgUotFGuc4zSagXW8
X-Received: by 2002:a05:6102:511f:b0:48f:966c:eee3 with SMTP id ada2fe7eead31-490322a3c3fmr5107746137.24.1720587562973;
        Tue, 09 Jul 2024 21:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720587562; cv=none;
        d=google.com; s=arc-20160816;
        b=OtQdJtUuF6YVBJwibbQPEI+xNZ+b2MFsr9KvSBI5iGcEW5fUNAVgyYS2S+lJEnPwBf
         s3bjkjgPxjnWpjSbjych6j9+1F2O4m34Okws4sh0Svly8snvzgXeR5lA/DQkBVmaoqyy
         WVCiD4VHRqPQIlBAWk/321M5a5r4pKNCOI96BAzY45U798+zdqdDz2UAosmonOOngbTu
         +QhxbBMS/wxW5RRKIYRStlplxuD84kbP6JD7WbKRJEmp4FYf5K32ebJ0ZFRPc2s6G5LT
         PyFB2H10Qlr/echKcAbrg/ZiCqJxaang2lkdiFA39pLp1bIuhOqKWSQyOwUAB6tfCSDN
         PK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=6a/lQeN6SSeFxUrYlWpL8EMGXLEk93g5zz7K4VB+/QI=;
        fh=pXQCCfdofZB5e4ZqzVRXiVuRGYeJnl2WhJnhDCL9qiQ=;
        b=ZpGjpnayUet6cadK94BFwL2cpFhncpJV54mykofZcCjbHZQoFHXGPtprsfwj4KUk4O
         3NZYlyZSZAd8EwcZVc+ApuHbXhfUnaHcBjLTlmNq2r+loDP7azpJWdiJrL5W1we2eBml
         RW3erBYv2lh0jCI+FyplgboH8yQ1K3dInTRZlecbzsg0dwrzqLgOqm2GjE0HUCV0uGH7
         oqkwWYDYcG6AlLNAJDip1q6Bnq1RGTevOmfIFMwNjBjmfiFB0uZAjIeOKl3RN8IJGfot
         8vvfdnzyxAkP94HBhcJPA6sKZc0xk0Z7a8c5dc2cRqZR++U/UDFynL8/Ed3nwrMRm4ZV
         chhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bab5c5si36591601cf.304.2024.07.09.21.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 21:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRPPu-0000e8-Qy; Wed, 10 Jul 2024 00:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VgH8=OK=kaod.org=clg@ozlabs.org>)
 id 1sRPPt-0000ZH-74; Wed, 10 Jul 2024 00:58:57 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VgH8=OK=kaod.org=clg@ozlabs.org>)
 id 1sRPPq-0002R6-W1; Wed, 10 Jul 2024 00:58:56 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJlxY66DVz4wnx;
 Wed, 10 Jul 2024 14:58:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJlxQ2jWmz4w2R;
 Wed, 10 Jul 2024 14:58:33 +1000 (AEST)
Message-ID: <b48bec6b-707a-4434-aba6-6b7416400480@kaod.org>
Date: Wed, 10 Jul 2024 06:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v47 00/19] hw/sd/sdcard: Add eMMC support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
 <e9c273ff-32bd-40fc-8f50-cb47784cf741@kaod.org>
 <fc8b71b9-e946-4161-8750-fffe37d3c925@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fc8b71b9-e946-4161-8750-fffe37d3c925@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=VgH8=OK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ogYLsXly7oeb

On 7/9/24 11:39 PM, Philippe Mathieu-Daudé wrote:
> On 9/7/24 17:58, Cédric Le Goater wrote:
>> On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
>>> Since v42:
>>> - Stick to spec v4.3 (re-simplified EXT_CSD register & migrate)
>>> - Fill CID register
>>> - Few changes to CSD register
>>> - Implement 'boot-mode' reset timing
>>> - Add 'boot-size' property
>>>
>>> Change required for aspeed branch:
>>> -- >8 --
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index 8c0e36badd..563816b710 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -344,3 +344,3 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
>>>           if (emmc) {
>>> -            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 0x48 : 0x0);
>>> +            qdev_prop_set_uint64(card, "boot-size", 1 * MiB);
>>>           }
>>> (I'm still reluctant to merge patches 16-18)...
>>
>> Then, please drop all changes related to the boot partitions. I will keep
>> the original patches in my tree and address the feature when I have time.
>> TYPE_EMMC is already great to have.
> 
> As you mentioned on today's community call, eMMC is a chipset soldered
> on a board, so our boards exactly knows what size to expect on the card,
> and whether boot partitions are present or not. 

My remark was on the use of 3 blockdevs to represent the eMMC contents.
1 should be enough.

Having a "boot-size" property to set the BOOT_SIZE_MULT register is fine.
The Aspeed model does some assumption today when installing the first
boot area as a boot ROM :

     aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(emmc0), 64 * KiB);

The "boot-size" property will clarify the settings. Please keep it.

Other topic :

      ROMs need to be installed early and IIRC, user creatable devices
      are not available at that time. So, when the flash devices are be
      defined on the command line with :

         -blockdev node-name=fmc0,driver=file,filename=./flash.img \
         -device mx66u51235f,cs=0x0,bus=ssi.0,drive=fmc0 \

      the ROM can not be installed and the initial boot will execute
      in place, using SPI transactions to fetch instructions which is
      slower. To install a ROM, the -drive API is required.

> I find the way of building the drive image described in patch #16 cumbersome, 

I agree but that's the layout on real HW. The flash layouts are even more
complex.

> but I'm OK
> to make some concession on it, since "it works" as it. If necessary
> we'll improve and deprecate the current properties. 

I don't think we will need to. The properties make sense.

> I'll repost and plan to merge as-is (modulo review comments).

OK. I will rebase then.

Thanks,

C.

