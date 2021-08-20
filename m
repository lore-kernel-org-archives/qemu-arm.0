Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1048106lfg;
        Fri, 20 Aug 2021 00:33:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBa8qPlAG2Hyjf7i4RtIAVkTFPRBqfs8EKR4P2d+nAziIcKde39eLGg9Daquo4d8u1Dsrc
X-Received: by 2002:ae9:f81a:: with SMTP id x26mr7663479qkh.196.1629444812924;
        Fri, 20 Aug 2021 00:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629444812; cv=none;
        d=google.com; s=arc-20160816;
        b=XHJx2Gcfp+O3fJR/9/fWjP1cIIubbncLEbhkzME7owzaVdiIybA3qOwzeDxERHjwcd
         fYdxhalkJuKGW6rKx/wVn2LiNWr+DXsShfFHMdlSLIqYZt2+cG9X+X9z/2e+SNYh6R3o
         eCT7hE6XEWN5ivSsW04Ex6bAHt+lhPNgK9r1gyjS2mLZNpQUjwb/VP2kBOjD5ivkC4K+
         D8uOLHJORbV9B01Sk1v/Pk0eosv8yNdby2sfnQ6CaOrD2/t4MG13CM78HcVEyr+8eogH
         etS9FjAsrPhW3ADZ01q6dr12kGJ/NzgQhXryHPWj4YSEkCJoCGYEvEVpKmomjRj+VefX
         wnog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kPSVcZubVCqBQR/tc8m+zDBWBDed9HrkkhFEUxx4BUk=;
        b=acfB1abx9GLaROorqKqqCSspJU93DqjEu61OrYworGq7CoBK6dBTc3dy9reGV9R4j1
         88TDxMBqiRapGckZbVRB6BaaW+uHAqUl1kMCwPHVmrsJdo2lJx18SafgMWvTbBc6UDMr
         /fTEiVY2agvVTnK7IaVed09yjYjefHuGpYqEk0g4h3Ccy4Uqf5yS9KRSPfHMqb3VYucC
         Xbz1Fw8zw8JMdTw0u/aqHDkUNTJGaS3KYaky33REk8wQplnlwYjGWoUExrilMKcTOr1Y
         PwbrWNhx6z9YloU/pPlW+y7rCj7zYCkvVJYsd6xj6YsYEsAwr86wTBmD/wvEstOJFydI
         hSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X2OJ1XWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si3626007qkd.264.2021.08.20.00.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 00:33:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X2OJ1XWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGz1w-0002RM-6E
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 03:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGz1h-0002Ns-JB
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGz1f-00059U-M9
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629444794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPSVcZubVCqBQR/tc8m+zDBWBDed9HrkkhFEUxx4BUk=;
 b=X2OJ1XWX/bnd383rGD01Wn8qfippHAWTQ3kGXDl/Wd22y9rsNR5jIliJvwAoafFp7EZ/cc
 jTyKE6lkXvTovRmpy7mf6y5i3Gq//jdImMf9jGKQ5HAQWAKicdwzBwM0/jJQ77bc70OfYl
 AqIH5qjtL06nWrwRuUpraE+8xJfgPZs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-2V94DKySPIe_21uc19EtuA-1; Fri, 20 Aug 2021 03:33:11 -0400
X-MC-Unique: 2V94DKySPIe_21uc19EtuA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so4456599wmj.8
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 00:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPSVcZubVCqBQR/tc8m+zDBWBDed9HrkkhFEUxx4BUk=;
 b=LmeZCBpqOOVYEGrwm6ATEJMBmOxaCzidnOeOTHakryNFYWkYZrtfEnyCa9iKVCeBRC
 vXMobZMcERhIKV5dc9DJCg5BX46IbHYvNy9BG7vTBCWpYozlI5kXKOPNEkbyhSjo4hPj
 JEgd3CsSdSYPmpvAxCs04VDK//IvyekMFm8Uw+lAFziutPZRR+3tfXLYo1O8FCJQZlVZ
 7mudB1icgWu8mUMX98EKjtoV40J1Ji+jVpr6OPvF3cCkQN/GtrIaz9lv5oGIWWVsLWWa
 xPOXhpHHoMthrGG3iIzoMGQ0nHfoeDYitAPyDeET9bocBvaa7P3cuAothuflDvnm/LpL
 Es3A==
X-Gm-Message-State: AOAM533SOIJHMgRnSsKAkcRY5xY9sdMf4fnrk2cxe1Ik3tIxTDhjL5as
 b55t4lpc1nxIm8SROaeQ8gPgYJLoZBWmZqkivKXEvijKe2Ouz1IPo9cwTA8riOX0NAexNcIBOFc
 aziYVG6z/hvSh
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr2631870wrd.278.1629444790057; 
 Fri, 20 Aug 2021 00:33:10 -0700 (PDT)
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr2631853wrd.278.1629444789920; 
 Fri, 20 Aug 2021 00:33:09 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g12sm5240671wru.85.2021.08.20.00.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:33:09 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b212add7-f36b-98ce-ccf5-c5209afea3b6@redhat.com>
Date: Fri, 20 Aug 2021 09:33:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
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
X-TUID: Vq1YwAj5SgP0

On 8/20/21 4:36 AM, Li, Chunming wrote:
> The current SMMU V3 device model only support PCI/PCIe devices,
> so we update it to support non-PCI/PCIe devices.
> 
>     hw/arm/smmuv3:
>         . Create IOMMU memory regions for non-PCI/PCIe devices based on their SID
>         . Add sid-map property to store non-PCI/PCIe devices SID
>         . Update implementation of CFGI commands based on device SID
>     hw/arm/smmu-common:
>         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting strategy
>     hw/arm/virt:
>         . Add PL330 DMA controller and connect with SMMUv3 for testing
>         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting
> 
> Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
> ---
> This patch depends on PL330 memory region connection patch:
> https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com/
> 
>  hw/arm/smmuv3.c              |  75 ++++++++++++++++++------
>  hw/arm/virt.c                | 110 ++++++++++++++++++++++++++++++++++-
>  include/hw/arm/smmu-common.h |  12 +++-
>  include/hw/arm/smmuv3.h      |   2 +
>  include/hw/arm/virt.h        |   3 +
>  5 files changed, 181 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60bee4..c4da05d8b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -32,6 +32,7 @@
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
> +#include "hw/qdev-properties.h"
>  
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
> @@ -612,7 +613,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>      return cfg;
>  }
>  
> -static void smmuv3_flush_config(SMMUDevice *sdev)
> +static void __attribute__((unused)) smmuv3_flush_config(SMMUDevice *sdev)
>  {

Why keep this function if unused?

