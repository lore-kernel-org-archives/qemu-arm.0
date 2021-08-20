Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1061678lfg;
        Fri, 20 Aug 2021 00:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfxUXy7B6K48PoDuldHkGhKFmFBwx+M4mHuw9yV4+OhVZGFIYe+DZncybxuR1yje/STwPm
X-Received: by 2002:a05:620a:983:: with SMTP id x3mr7490693qkx.151.1629446292300;
        Fri, 20 Aug 2021 00:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629446292; cv=none;
        d=google.com; s=arc-20160816;
        b=t8Mc7VdNg/eByD2brrasNYRKbA4mOO1j/e4Jo6tY0RJol2lOHA0bW06OvCnZFoP3xR
         7dyeLr4prZWtw2u3EP+vfRH5KFC+F+RJ2ZxiSaCrFrlMjOXJintemciJoRB2w4IFJRWY
         gRMDJ7xzf2EiuWquZ9Ie7329ig7mKXRFonbw+wCJeiOzjLUlM5Ehj+ZsriP6vzyQENN1
         ZJHZQYh7xFmWpFXb40vaUgsty23uus/rZDgw/tx5ygNMif/UR80Xb1Xssh7gqI5T/Lqj
         SM4j4IA36kJaFg7T6lenDisn1H78qFVRjXie211l1CPVT7l+XAzBANCKwLVO3Gqdk3oi
         qIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vxHQqtEk8WOTv+2qn5sNseLLXKf5PMXCRmrBfiofzfk=;
        b=wwgPSUX6DLwGPFSELsoPYS/0J1CK5AyKYm6k5dL3ztzlLI75icUIR+Hu5mb/BggfG3
         V6NNGts0u5Iyvi3Znzv76yD09Vvhv/Grb64v3kBTU/8rTT1Mb7DkKP1TpeD/oImZHZ2y
         XQpNCpN4UqjOxpR2DyRfcVblyTf7ZtGGRmwpFbdVrv+G+NCSGM0Gk+1MqJZIgsaV97PA
         B0qkxo8m/QJbAi3YXVx0tcUiLd/s2URsCFeatipiKjxOfBJioyagkptLBoMQi7tF8QuM
         JtQCh+jzWFKamjIJgj7u5OehvgTp8n8dSl78N0/pf4LF0htr6r3/5NwEMhU5DwJX6Ey5
         Rmkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QSoZwVl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg12si4244148qvb.91.2021.08.20.00.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 00:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QSoZwVl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGzPn-0004RB-Jv
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 03:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGzPd-0004P4-LH
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGzPb-0001QH-MO
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629446279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxHQqtEk8WOTv+2qn5sNseLLXKf5PMXCRmrBfiofzfk=;
 b=QSoZwVl+iECa38aCGozSsPNq7K5xKLcMPnbFO8csBYyCQLzpZgjDL7ya1jcHdjBmzmRk5W
 RzAsxJTwHtnNK7qQr9mLVy9KGlkvn22nWFqSk3eMRqMGHIc68PK9eMaXNmzbwGT52A9nqu
 2rAZWLXWK4O8EB8cgLmboxwZl2aW9rc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-NnGcBG8eM-Gp8KOrd1TSDQ-1; Fri, 20 Aug 2021 03:57:55 -0400
X-MC-Unique: NnGcBG8eM-Gp8KOrd1TSDQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so2560210wri.17
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 00:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxHQqtEk8WOTv+2qn5sNseLLXKf5PMXCRmrBfiofzfk=;
 b=ZhOO4hdZ9RWS9VaysIQEgz7aCjHK4TK37Dgtu8EPIRwUOu2MDIDkXMWpvPT5vM3laT
 krRSMbUoNsWv4zlK4UGOoh8XRQSjkkFtBrq3a9H1bM2FWlzDab+/6c+fDlauj3pQCfL7
 qDyEbvSG3aTOXENHtfrI5jgRX7FC+PueuDV7YCoFQyUdT8PocHRIpsB/7f+u2rwcIlhv
 8hqwN2qxkfitHahi7QfjIczB/Eg5JbUgBDdg3Xw6e9eGrzNlFWGcSP7LSkcXLOoUZv8D
 NtI4JIMOnrkS7C2J02Jjl45gVOtnEAJ3cwl3NUbjlks6woWqniWXz+vah21aokpzevUp
 mF5w==
X-Gm-Message-State: AOAM532JORIzzoOAu5C9CwPne7YJo0tlGNe6LnThRJGut7XlsQqYnbec
 VPU1tnN7DSKUYZwxUOBTkAb0GHEkvIONFCuONGcnjkqBZAvge/AFBzTI5mWNFwNXp0+Z0k6THJR
 IiAA2pFOC5FGY
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr8497429wrx.65.1629446274392;
 Fri, 20 Aug 2021 00:57:54 -0700 (PDT)
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr8497421wrx.65.1629446274263;
 Fri, 20 Aug 2021 00:57:54 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o34sm9762706wms.10.2021.08.20.00.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:57:53 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <b212add7-f36b-98ce-ccf5-c5209afea3b6@redhat.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F59C5@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <de3322d6-6ea4-2f7d-22bc-54a5e8171f49@redhat.com>
Date: Fri, 20 Aug 2021 09:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F59C5@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qj4nkYBiKLMd

On 8/20/21 9:42 AM, Li, Chunming wrote:
> 
>> On 8/20/21 4:36 AM, Li, Chunming wrote:
>>> The current SMMU V3 device model only support PCI/PCIe devices,
>>> so we update it to support non-PCI/PCIe devices.
>>>
>>>     hw/arm/smmuv3:
>>>         . Create IOMMU memory regions for non-PCI/PCIe devices based
>> on their SID
>>>         . Add sid-map property to store non-PCI/PCIe devices SID
>>>         . Update implementation of CFGI commands based on device SID
>>>     hw/arm/smmu-common:
>>>         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting
>> strategy
>>>     hw/arm/virt:
>>>         . Add PL330 DMA controller and connect with SMMUv3 for
>> testing
>>>         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting
>>>
>>> Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
>>> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
>>> ---
>>> This patch depends on PL330 memory region connection patch:
>>>
>> https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASX
>> M03.verisilicon.com/
>>>
>>>  hw/arm/smmuv3.c              |  75 ++++++++++++++++++------
>>>  hw/arm/virt.c                | 110
>> ++++++++++++++++++++++++++++++++++-
>>>  include/hw/arm/smmu-common.h |  12 +++-
>>>  include/hw/arm/smmuv3.h      |   2 +
>>>  include/hw/arm/virt.h        |   3 +
>>>  5 files changed, 181 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 01b60bee4..c4da05d8b 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -32,6 +32,7 @@
>>>  #include "hw/arm/smmuv3.h"
>>>  #include "smmuv3-internal.h"
>>>  #include "smmu-internal.h"
>>> +#include "hw/qdev-properties.h"
>>>
>>>  /**
>>>   * smmuv3_trigger_irq - pulse @irq if enabled and update
>>> @@ -612,7 +613,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice
>> *sdev, SMMUEventInfo *event)
>>>      return cfg;
>>>  }
>>>
>>> -static void smmuv3_flush_config(SMMUDevice *sdev)
>>> +static void __attribute__((unused)) smmuv3_flush_config(SMMUDevice
>> *sdev)
>>>  {
>>
>> Why keep this function if unused?
> "smmuv3_flush_config" is useless after our modification. The modification is verified by PL330 DMA and PCIe network.
> But we are not sure if it has potential risk. So we hope maintainer can help to check, then we can remove it.

Either remove it in your patch, or your patch is incorrect and we
still need it. But don't let it as dead code and don't postpone the
removal please.

