Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp415979lfb;
        Wed, 1 Sep 2021 05:05:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/XUYznVnjOpEE2VRiLt9topezeJDRF4tRZZ8oCI6IGQJSK4Ibjw/Pi4rgNHvkr7LDaV+3
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr36694601ejc.247.1630497927899;
        Wed, 01 Sep 2021 05:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630497927; cv=none;
        d=google.com; s=arc-20160816;
        b=yLmwOVOhFMoCBAXwgsIGG3u8E/tts/1y9v1DKV4eaA6X0UvSWF2xdfWbUsOLgYlPvl
         Y/6SfgjciHMqdRpBxOYoSXddRsfuuxIS3rI5x5HbrH6/m/xq/pqWD8NQgQZ1MBncs4wS
         rpTu15xfMnhIiWF4hu3wtX/0C0zoXafelLaNNTlcsD9b4yncLGM3EFGrVANrbhlFyoku
         cU/4zcA2gZYxZnC1fQFihSDpHJps6H2ay/QRRApq985IWE+4z4nEi5/SneawogKSJysZ
         gbwwLrrnB4FbIF5ZiAFotdA8Dr++8ghtdsP1xGn1v6Nxo4jsFCqo7kEiExlAbzRLJCpN
         fsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=avIdGQOT79cPPUzFbCa/tb70UMmmNKwwLNNbrnRmOsM=;
        b=eqixW+1Wri8Pd9lVHs0vvWQHxc9aaoqnszwsv5xuA7D7VlnF9qyP624AKYpPHz8t8+
         6/PXXEqk55/ifMCPChrskGD6JLDh5FV9y5SToGlS+M45HqX89VCCwVfV31F6Q5maF2tb
         SBPnOt8oLv0fbWgGvzDJhMecKT8aokQhQ1Dq8Q47J/6pP10VW2AYWA0KNOSJ1V4jSS2n
         Tg8mVwTYoH057UZtIdo6PX769Mcb9bAaVhxq+gf0nhvBGIHn5/hh260WYqeMVYtaKOrF
         KtpXNCTHsgdsmdUHsYm49ohX20xtVK098bedR/H/T349MKLkks3I+tZiot8hBjooRb6Z
         BXoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fNpS7DQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si20031893ejk.740.2021.09.01.05.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 05:05:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fNpS7DQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLOze-0004EJ-Q3
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 08:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLOyz-0003tP-KD
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 08:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLOyw-0001hm-BH
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 08:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630497881;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avIdGQOT79cPPUzFbCa/tb70UMmmNKwwLNNbrnRmOsM=;
 b=fNpS7DQG2u/4AWAhS8uH63cGLYKGFaL7wMMYNoY/IqLIeKe10gYkiaXZEi73V1UlZAvLUl
 epvEMmTPOFvxL4dS5ivDZ4bRG+JqZB6FW0FW8fZt3ilj1SdxwgUw/xH7u1oXhiC5rPOr1r
 fe8GVNbiBv5xMzWqhTCbDKwSW2yJGks=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-YJyLqqdTPBeEHQU6OnDm3w-1; Wed, 01 Sep 2021 08:04:40 -0400
X-MC-Unique: YJyLqqdTPBeEHQU6OnDm3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso925421wml.7
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 05:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=avIdGQOT79cPPUzFbCa/tb70UMmmNKwwLNNbrnRmOsM=;
 b=AimYpq4PnX4XOvDMfBtCSoo2HuB1yI9EWu9/EhgA7JSGUHHwULD8AgtcMI6xQxWoLX
 ZyZpOgEXtptevofAqAcInVTywti8Wylsb4zUYsvQ7PTej9U2ljT5SAsmj/r/7Yik97Zp
 zA9drUmpvV29lMRC64VqkfLTF+Y+RsFjIxTybzEiULhZhbr6c354ExRyxeqHkwjKxjKu
 QuHlTXe9ufoIYKmx1Yj3bEh7sulXC597RB1NMnA1AsJQ02O3V0eqS4kPaogD2WELn6xa
 fj5k3HWJJGNELLQdJaUAi5ISaIvngQ7bZDCbiGw2hyBaP1LNuWmeqqiDJ4KdMr5Tg/uy
 x9UQ==
X-Gm-Message-State: AOAM533NX6oCqkSfh1LtKAFIwk2FD4u2Q0WluS4KUwoo8mcRPuRkVbqy
 BonQQrrhbanENgvY8gSoMRPDFHTln6iXz8H4QsMGnZLtMWPi+rMdygj/joEDthojB616QDk2v0t
 31xembHIcvSnb
X-Received: by 2002:a7b:c3d9:: with SMTP id t25mr7858274wmj.14.1630497879583; 
 Wed, 01 Sep 2021 05:04:39 -0700 (PDT)
X-Received: by 2002:a7b:c3d9:: with SMTP id t25mr7858249wmj.14.1630497879376; 
 Wed, 01 Sep 2021 05:04:39 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d28sm20537273wrc.4.2021.09.01.05.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:04:38 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
To: "Li, Chunming" <Chunming.Li@verisilicon.com>,
 chunming <chunming_li1234@163.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-3-git-send-email-chunming_li1234@163.com>
 <7089ce3e-2b15-7cf3-86d9-231c69794138@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B0114302B8C@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1bdba252-d63d-15cb-7365-4fbc666cd075@redhat.com>
Date: Wed, 1 Sep 2021 14:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B0114302B8C@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6j6ysctjighh

Hi,

On 9/1/21 8:51 AM, Li, Chunming wrote:
>
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Tuesday, August 31, 2021 10:02 PM
>> To: chunming; peter.maydell@linaro.org
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Wen, Jianxian; Liu,
>> Renwei; Li, Chunming
>> Subject: Re: [PATCH v5 2/4] hw/arm/smmuv3: Update implementation of
>> CFGI commands based on device SID
>>
>> Hi Chunming
>>
>> On 8/25/21 10:08 AM, chunming wrote:
>>> From: chunming <chunming.li@verisilicon.com>
>>>
>>> Replace "smmuv3_flush_config" with "g_hash_table_foreach_remove".
>> this replacement may have a potential negative impact on the
>> performance
>> for PCIe support, which is the main use case: a unique
>> g_hash_table_remove() is replaced by an iteration over all the config
>> hash keys.
>>
>> I wonder if you couldn't just adapt smmu_iommu_mr() and it case this
>> latter returns NULL for the current PCIe search, look up in the
>> platform
>> device list:
>>
>> peri_sdev_list?
> I think there are 2 scenes:
> 	1.  PCIe devices share same SID with peripheral devices.
>       2.  Multi peripheral devices share same SID.
> If we search PCIe 1st then search peri_sdev_list, there are 2 problems:
>       1.  The code is complex.
>       2.  We may need to search peri_sdev_list multi times. It may has performance impact.
why multiple times? 1st you look for a PCIe RID and then you look for
platform devices? Still I am dubious about the duplicate streamid case.
what I wanted to emphasize is at the moment I do not have a clear view
about your use case and I don't want to degrade the perf of the main use
case to support a yet to be defined one ;-)
>         
> The CFGI commands are only called when the SMMU device is removed.
> So we think there is no big performance impact.

Nevertheless I think this is not a major issue indeed.

Thanks

Eric
>
>> Thanks
>>
>> Eric
>>
>>
>>
>>> "smmu_iommu_mr" function can't get MR according to SID for non
>> PCI/PCIe devices.
>>> Signed-off-by: chunming <chunming.li@verisilicon.com>
>>> ---
>>>  hw/arm/smmuv3.c              | 35 ++++++++++------------------------
>> -
>>>  include/hw/arm/smmu-common.h |  5 ++++-
>>>  2 files changed, 14 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 11d7fe8423..9f3f13fb8e 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -613,14 +613,6 @@ static SMMUTransCfg
>> *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>>>      return cfg;
>>>  }
>>>
>>> -static void smmuv3_flush_config(SMMUDevice *sdev)
>>> -{
>>> -    SMMUv3State *s = sdev->smmu;
>>> -    SMMUState *bc = &s->smmu_state;
>>> -
>>> -    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
>>> -    g_hash_table_remove(bc->configs, sdev);
>>> -}
>>>
>>>  static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr
>> addr,
>>>                                        IOMMUAccessFlags flag, int
>> iommu_idx)
>>> @@ -964,22 +956,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>          case SMMU_CMD_CFGI_STE:
>>>          {
>>>              uint32_t sid = CMD_SID(&cmd);
>>> -            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
>>> -            SMMUDevice *sdev;
>>> +            SMMUSIDRange sid_range;
>>>
>>>              if (CMD_SSEC(&cmd)) {
>>>                  cmd_error = SMMU_CERROR_ILL;
>>>                  break;
>>>              }
>>>
>>> -            if (!mr) {
>>> -                break;
>>> -            }
>>> -
>>> +            sid_range.start = sid;
>>> +            sid_range.end = sid;
>>>              trace_smmuv3_cmdq_cfgi_ste(sid);
>>> -            sdev = container_of(mr, SMMUDevice, iommu);
>>> -            smmuv3_flush_config(sdev);
>>> -
>>> +            g_hash_table_foreach_remove(bs->configs,
>> smmuv3_invalidate_ste,
>>> +                                        &sid_range);
>>>              break;
>>>          }
>>>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL
>> */
>>> @@ -1006,21 +994,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>          case SMMU_CMD_CFGI_CD_ALL:
>>>          {
>>>              uint32_t sid = CMD_SID(&cmd);
>>> -            IOMMUMemoryRegion *mr = smmu_iommu_mr(bs, sid);
>>> -            SMMUDevice *sdev;
>>> +            SMMUSIDRange sid_range;
>>>
>>>              if (CMD_SSEC(&cmd)) {
>>>                  cmd_error = SMMU_CERROR_ILL;
>>>                  break;
>>>              }
>>>
>>> -            if (!mr) {
>>> -                break;
>>> -            }
>>> -
>>> +            sid_range.start = sid;
>>> +            sid_range.end = sid;
>>>              trace_smmuv3_cmdq_cfgi_cd(sid);
>>> -            sdev = container_of(mr, SMMUDevice, iommu);
>>> -            smmuv3_flush_config(sdev);
>>> +            g_hash_table_foreach_remove(bs->configs,
>> smmuv3_invalidate_ste,
>>> +                                        &sid_range);
>>>              break;
>>>          }
>>>          case SMMU_CMD_TLBI_NH_ASID:
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-
>> common.h
>>> index 95cd12a4b5..d016455d80 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -159,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova,
>> IOMMUAccessFlags perm,
>>>   */
>>>  SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
>>>
>>> -/* Return the iommu mr associated to @sid, or NULL if none */
>>> +/**
>>> + * Return the iommu mr associated to @sid, or NULL if none
>>> + * Only for PCI device, check smmu_find_peri_sdev for non PCI/PCIe
>> device
>>> + */
>>>  IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
>>>
>>>  #define SMMU_IOTLB_MAX_SIZE 256

