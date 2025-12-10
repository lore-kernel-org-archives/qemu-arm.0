Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F8D3C92C
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 16:18:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTMtO-0006p6-Ic; Wed, 10 Dec 2025 11:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTMtM-0006oc-Aj
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 11:18:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTMtK-0006jh-GP
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 11:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765383493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mSvb0XM6v8n+4ZgqoXh4wmc/kH8env7IqTdZ9CAFVo=;
 b=ahVyal5PgHyI9Zn/gbRSTqo2kJ84Xq+InazUOrCEmUgXqrXCbtq33nZ0pJkWigGmnvA/rJ
 i3ryrU+0teDekUvV0q5Ws0qyIU1RR4TBb4E1c9ENAntB5dBGdtft5P+Lnxoj9wjX3BJ8/x
 1/KnMeUrlVUDRPQWGwJzp+8KEXRKzOc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-q8Uky-bhPt2DGGMmTUJWFw-1; Wed, 10 Dec 2025 11:18:12 -0500
X-MC-Unique: q8Uky-bhPt2DGGMmTUJWFw-1
X-Mimecast-MFC-AGG-ID: q8Uky-bhPt2DGGMmTUJWFw_1765383492
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee1b7293e7so225463381cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 08:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765383492; x=1765988292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mSvb0XM6v8n+4ZgqoXh4wmc/kH8env7IqTdZ9CAFVo=;
 b=JhO4ws8bE3s30xqYT26RdRh5kbkfcoTRp5VbWMt6UEsct7r/SXbKHeSP3I69+zOFB+
 CC3oJaqn6PeE7ZqhX1RDlSXgun1BDa2EmnczrvIwPOEPu43ptegB5y3jkpbgWF8/iZw/
 7AHG2AKe/vp+bvsl76AlIcKzPWs+YMnPtkOtX7UdX2uyP8W0DVy8y5u6yL+YYkOKbQMl
 TQs7UxDs8Pqs7a9z9OgUnnhYxjAnyrRIlLKrR8tDspJ747gDk6QH8HNqt/l0HurEj1Vr
 ZHfwCrvSFYDUJ92rolckGqCSA3tFJ/vdDtBXE5adPcCzk5AJljGdSxwH9c+065Bl3S16
 iRRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8pouNWNEOqzLuKGJRxyT+fnGOJvMNSCVjEMRwM3hx32CSsqor0dxx0Ef+wgBu6DjboLXraiMVYA==@nongnu.org
X-Gm-Message-State: AOJu0YzUcM6+7jGUc63uDKLYb8ZyPtLChJWUFhcVvds53ouNMcD1RbnI
 ZKbxI9QUKX3hVu6ch4vRkCRB6GSvzb6rLm1c0oSkOyGXW3zfAMLyHqHCtjjQpaQigyYwnEtFFNK
 M6QHm9LTQTbQmvC7q7rmAs+H7FKqU+6Arx/JGYTNQP0GCl11r3+oBNg==
X-Gm-Gg: ASbGnctsLCFImJI8VNjekr57pEeFG6AmWU/QTYAHjZ+TfpcDJGXdJndDlNCuc3IWkaQ
 SYkLLEaIXxVa3kEvleSRAXEmRQYDMCJpjLHE2dyHGfu6OnDYx6G4q6KGyGXNPht6ITe6fTC3ptK
 niCLDtrBr8tqNAniy2TqDdOpWlhQuOxAmRi/78RnlDWX0b4icFrX+oMqnfcXYsriumb0cW7pSCY
 OciXjGZbul/pWxJgHq/5dhASn48Ps+i7Y0qRoH+osjKP94WR60zIWh3fr4TI/vS38qGuvoQuwpq
 rPJR2e1LMXZGJUE+TL4ruCIQUgz80zZ7c1eUkzGyAtFBuMHf7aIu39m9TWPMqeax7LtRV6bGcaM
 hTq7VqzqdaVPL7+ngSaq4soxqjwuhSggg9UH47K07/TtY9g8ISxmVU9aFXQ==
X-Received: by 2002:a05:622a:1243:b0:4ee:9b1:e2a with SMTP id
 d75a77b69052e-4f1b1a6d070mr42643781cf.23.1765383492105; 
 Wed, 10 Dec 2025 08:18:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwlVZk7OOsEi+9V68yIVGvOGC66xTxpglSJpR+cQpJu+j4T74KFxE5DoQP+ed01yYiVnjWqg==
X-Received: by 2002:a05:622a:1243:b0:4ee:9b1:e2a with SMTP id
 d75a77b69052e-4f1b1a6d070mr42643171cf.23.1765383491687; 
 Wed, 10 Dec 2025 08:18:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f027d586e8sm118166291cf.33.2025.12.10.08.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 08:18:11 -0800 (PST)
Message-ID: <9bafd2ea-96b6-44ba-b0fa-d2c6075eea6a@redhat.com>
Date: Wed, 10 Dec 2025 17:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/33] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <1ee20ead-6978-4c2b-9b2f-ad778107ad04@redhat.com>
 <CH3PR12MB754885FC0E83EEB2A2D58D3AABA0A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <a2961cd3-e874-4641-9b2e-4951f265473a@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a2961cd3-e874-4641-9b2e-4951f265473a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sxvJ91mIkokQZ6zBI6uEXTMwwtGn9K-QuoBt2xha4Jc_1765383492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 12/10/25 5:07 PM, Cédric Le Goater wrote:
> On 12/10/25 16:07, Shameer Kolothum wrote:
>>
>>
>>> -----Original Message-----
>>> From: Cédric Le Goater <clg@redhat.com>
>>> Sent: 09 December 2025 10:32
>>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>>> arm@nongnu.org; qemu-devel@nongnu.org
>>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; Jason Gunthorpe
>>> <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>;
>>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>>> smostafa@google.com; wangzhou1@hisilicon.com;
>>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>>> Krishnakant Jaju <kjaju@nvidia.com>
>>> Subject: Re: [PATCH v6 00/33] hw/arm/virt: Add support for
>>> user-creatable
>>> accelerated SMMUv3
>>>
>> [...]
>>
>>>
>>> FYI, I am seeing configure errors :
>>>
>>> The following clauses were found for ARM_SMMUV3_ACCEL
>>>       select ARM_SMMUV3_ACCEL if ARM_VIRT
>>>       config ARM_SMMUV3_ACCEL depends on (ARM_SMMUV3 && IOMMUFD)
>>
>> -    select ARM_SMMUV3_ACCEL
>> +    imply  ARM_SMMUV3_ACCEL
>>
>> the above will fix it?
>
> No. I would propose :
>
> @@ -12,7 +12,6 @@ config ARM_VIRT
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
> -    select ARM_SMMUV3_ACCEL
>      select GPIO_KEY
>      select DEVICE_TREE
>      select FW_CFG_DMA
> @@ -627,12 +626,13 @@ config FSL_IMX8MP_EVK
>      depends on TCG
>      select FSL_IMX8MP
>  
> -config ARM_SMMUV3
> +config ARM_SMMUV3_ACCEL
>      bool
> +    depends on ARM_SMMUV3
>  
> -config ARM_SMMUV3_ACCEL
> +config ARM_SMMUV3
>      bool
> -    depends on ARM_SMMUV3 && IOMMUFD
> +    select ARM_SMMUV3_ACCEL if IOMMUFD 

Zhenzhong has a variant in

https://lore.kernel.org/all/20251117093729.1121324-10-zhenzhong.duan@intel.com/

I guess it also works

Eric
>  
>  config FSL_IMX6UL
>      bool
>
>>>
>>> KconfigDataError: contradiction between clauses when setting
>>> ARM_SMMUV3_ACCEL
>>
>> Just curious, how to trigger these errors easily? Any scripts?
> Try the windows build :
>
>   ../configure --cross-prefix=x86_64-w64-mingw32- \
>     --disable-sdl \
>     --prefix=/path/to/install-mingw64 \
>    
> --target-list=aarch64-softmmu,ppc64-softmmu,x86_64-softmmu,s390x-softmmu
> \
>     --disable-docs
>
> problems such as :
>
> ../hw/arm/smmuv3-accel.h:14:10: fatal error: linux/iommufd.h: No such
> file or directory
>    14 | #include <linux/iommufd.h>
>       |          ^~~~~~~~~~~~~~~~~
>
> should be fixed too.
>
> Thanks,
>
> C.
>


