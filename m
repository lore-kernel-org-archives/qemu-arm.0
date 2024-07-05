Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1008782njb;
        Thu, 4 Jul 2024 22:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+D6bJu/RSetVc1U0IBgAbX0ludpXr8sPQvIN9cSLfsuPL19fnNhVtkOnKINE2qx0kRWHthYE/tI7YOw1PSA7mYTOvqNKM
X-Google-Smtp-Source: AGHT+IFqUsniatlEJ/sRYnGY8uBuW7LgddnFUV0xYvcRcM4PClq7u/34xJ3R6FlREQFqqEqEuB1h
X-Received: by 2002:a05:622a:1821:b0:446:4a66:bf44 with SMTP id d75a77b69052e-447cbf73a2cmr48069321cf.55.1720157945779;
        Thu, 04 Jul 2024 22:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720157945; cv=none;
        d=google.com; s=arc-20160816;
        b=RoTvk1M97/i8ifisHjn6jB1e2+c564TFyP7lxaYRyJklk20NtZou733OCU/cEDflcN
         o3MftbTy13KNBk7JSzPnXp9Lo1tXOp5bw0mBFBbdbx7PP5T7yqq62o9nj3mhSjIeqJRE
         YiNHc9mdxp98ZCz2KByUdd18wR6nnBGC4ZNE5LW6Reg90QgVnu41uARZWeVur29AvMzB
         K9qHy3g7m3XMRlDmeJ2YyyRBbIU6OY5JmZAuY5lhkZ+JNCfGVu/yhrtfg690V/MHIwUN
         1F71+3q2BGI1ZdwuY93ynHf05ijogC8LdKs7i38NTpRTqsA4DBRpk0e9VoTqKmW1WZn0
         JLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TEksHmUWt00lTxG6oU7rGTdcMcd0W/EM5mkNsWPPkY0=;
        fh=A5LU2oQgDdkfwMTBBmD979Z/ElC0PVoi4ryVVo2kRo8=;
        b=wOKC+kHkfYOOGKf4BOxKVzwkB29gihLPrnf6S8RdjfNHXPUeXUh4vDYr6bZtCmWcT9
         lUbslmHXDGHwEJCQjjJD0xPRNnFlEtGso4TRA3ao4Qv/oP0plquuoH/UHDG86Di1wlex
         S5SZeaVsbvDXULD5UPu2r+NSRpCEGnFb3Ovy1JHvSsOT8PylaXYI/ENmCpPbEoDZz1OS
         w4Bq9IqyJuBKMKFz6TTTnvZDcUdjweQgANEvldV0rHuJ6PtJTOWqn5TXmHid7fDUQMDe
         M9WqTbaAlr/Wi2Ic1hs6KD0zRcNsE0HlP9X/yKBmiPAYut8Hk9F8TBPCT+SjhMzyG9W0
         YrBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W7kU3qaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4465cbb12a3si156023351cf.595.2024.07.04.22.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 22:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W7kU3qaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPbeg-00088m-Nf; Fri, 05 Jul 2024 01:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPbef-00088I-IH
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 01:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPbea-0008E4-RT
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 01:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720157919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TEksHmUWt00lTxG6oU7rGTdcMcd0W/EM5mkNsWPPkY0=;
 b=W7kU3qaAKExmKJ0O6VGf6NjEES14GHeZsSsn8U4wUgQntJeC5Y6S/ACDyO/3yTuzzfTcXN
 PptQ/BOSTrk6d1rvm0iP5xHlYQk1GsCV5E5TckchberT80Mgc5xrF9MkKf7BN4Hmr+kdYE
 VpuCBDu3jPRqVpHDjbyMGkxFUwS0bcQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-jXIFMmXcPyeOD299rTeGiQ-1; Fri, 05 Jul 2024 01:38:37 -0400
X-MC-Unique: jXIFMmXcPyeOD299rTeGiQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6b5de421bc6so18356806d6.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 22:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720157917; x=1720762717;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TEksHmUWt00lTxG6oU7rGTdcMcd0W/EM5mkNsWPPkY0=;
 b=VatDiDZ+/ONjo/Id8kLN4guzTxS3G9QQ7z9Q1cRKJUdD04s/dqFcu3u3TTuJblXjtH
 36ehmciNdcDj7czhr9miWuTCurQTpkBzEl/wrm9YgwScyTI3JbBtc+ymFGNiMs31xP4j
 FrJ/5JXcGCipZD+RiDvW0FgieHS2BBROFXiei7AaIlrFVLwtKtjQWxeLqhk4yPdOc8jt
 JiCNfeHu2+MjOEwVbvPiVhSNInrVTzT66vmB2lK+K+nYMcu9ypkfL88aCeB/8k9qTS2l
 5lIcgBhrXvmrkUG7HG2343HzLFoTUyrhq++JV1YZI2Gu65GiIMGzccQOB8MkO2EhZ9mZ
 swEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFZzCjPFSKG/2fq9lAVEEFHzwRKI6D+rTY1PVVtLTE2wcb7Qx2RGOyuujD55Cs6VEO4lgVk8s+shOr1w7tkSIFL6dh
X-Gm-Message-State: AOJu0YygqNkfUJkYGwqfXuXNXxDDqPorAVOP7JUuKMxm+PqJSqT/qilo
 iJPuYGTqXy1ARtezOQBHCmu3dErIrf5humgmNK5cpmXs7HKmBl5JW/2lswJ7qvxGC00Vq1BNfQx
 u2bt8vnUEe9ee0NHg1CPj7KrK/w6Qq3LOfXWWAHzPb7P4uy+2Yg==
X-Received: by 2002:a05:6214:53c8:b0:6b5:42b7:122 with SMTP id
 6a1803df08f44-6b5ed196d97mr40578036d6.60.1720157917354; 
 Thu, 04 Jul 2024 22:38:37 -0700 (PDT)
X-Received: by 2002:a05:6214:53c8:b0:6b5:42b7:122 with SMTP id
 6a1803df08f44-6b5ed196d97mr40577936d6.60.1720157917060; 
 Thu, 04 Jul 2024 22:38:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b5eca5a923sm12310716d6.47.2024.07.04.22.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 22:38:36 -0700 (PDT)
Message-ID: <e6ca185f-3f9a-40e1-9ed2-eccfbbdf1444@redhat.com>
Date: Fri, 5 Jul 2024 07:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] aspeed: Set eMMC 'boot-config' property to reflect HW
 strapping
To: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-6-clg@redhat.com>
 <f50579b99ef8883dac5fcfc1606a45abfb8bf85f.camel@codeconstruct.com.au>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <f50579b99ef8883dac5fcfc1606a45abfb8bf85f.camel@codeconstruct.com.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: oZ8LYlYT0azZ

On 7/5/24 5:41 AM, Andrew Jeffery wrote:
> On Thu, 2024-07-04 at 07:36 +0200, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@kaod.org>
>>
>> When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
>> property to set the boot config register to boot from the first boot
>> area partition of the eMMC device.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/aspeed.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 756deb91efd1..135f4eb72215 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -327,7 +327,8 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>>       }
>>   }
>>   
>> -static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
>> +static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
>> +                               bool boot_emmc)
>>   {
>>           DeviceState *card;
>>   
>> @@ -335,6 +336,9 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
>>               return;
>>           }
>>           card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
>> +        if (emmc) {
>> +            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 0x48 : 0x0);
> 
> 0x48 feels a little bit magic. I poked around a bit and there are some
> boot-config macros, but not the ones you need and they're all in an
> "internal" header anyway. I guess this is fine for now?

You are right and we should be using these :

hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG             179     /* R/W */

hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG_ACC_MASK            (0x7)
hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG_ACC_DEFAULT         (0x0)
hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG_ACC_BOOT0           (0x1)
hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG_EN_MASK             (0x7 << 3)
hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG_EN_BOOT0            (0x1 << 3)
hw/sd/sdmmc-internal.h:#define EXT_CSD_PART_CONFIG_EN_USER             (0x7 << 3)

So I wonder where the 0x48 is coming from. Will change.

> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 


Thanks,

C.



