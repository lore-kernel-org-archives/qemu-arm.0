Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514B1CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 16:26:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFxNu-0002Bv-QO; Mon, 03 Nov 2025 11:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxNi-000226-CI
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxNb-0005r5-H4
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762187157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFJK3Zd/MdURPZNDXI9ZshaDaPsZkvrxmLcHXXS1V0c=;
 b=iAeYTL81cAmPvXBG4N+jrnLqLNuBbooy/wzpXw7xwrQJwuDQ3mzTpJgLHGl+6mkh936BHU
 6eZf7XQ8TR+Cp25ECGVeeEc/unT+Z1+vd7WrxCyOWWEmumxRXeCbyH5kshv5Npr0cl6G4a
 QxqwYp9f8/6SuLwpATOOpG/bClVQ174=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-HPmGuWghNZS67FhRL-abuA-1; Mon, 03 Nov 2025 11:25:56 -0500
X-MC-Unique: HPmGuWghNZS67FhRL-abuA-1
X-Mimecast-MFC-AGG-ID: HPmGuWghNZS67FhRL-abuA_1762187155
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4711899ab0aso41008975e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 08:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762187155; x=1762791955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eFJK3Zd/MdURPZNDXI9ZshaDaPsZkvrxmLcHXXS1V0c=;
 b=g05CCJQ9qDVlPR+h3nBIMagsiF7bBSrCThjiN/I/0SOB+fHmFKkn/8t46jtTa2Kn+d
 GOUrT1jeNtz1hKAsLO8cuBwT8qjzjBlbeoWgZt361awF3gsKHWXLeHoafJ8XPi1G1Cl8
 6h6DBF+IEjXJJ22V3+Z/p7sWLnnLTeHeQ4MLtZOkjs1hdYlx+2eun+jcy75sjlCdulRP
 KmBoeV6zNI3zsZtQ7npfrbpuYi49NrCdSZK2Gd6+N0YwBcsYCIt1eC51xd+SaAp2t7z3
 LNDteRv9AIAyEBVvz3I0FMwdVo3B44Kl1X3+AIe2umHz0n5JOEJerVjaeRWs8iRu4Ykb
 iO3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8v23IhFkGrX12K5lsxF2jwgNqhXfJxRUb+7hkO3HsZFvt6eZ9vVgjLc9TLcgvCjR+WnVc9ei/Yg==@nongnu.org
X-Gm-Message-State: AOJu0YzkvkEXhq3ukEOasgd/MNnIZ6dbNa6WIT3GM+MGIuaf2RuZ2/sf
 YQEY7lf6oJA0kTFxJjM7v7AMVtfuvrBU84MWra/bdzIKWYjt8hxt5Sr3rPCcr0EO7Hz67yOnlrV
 wh0yweinZZYX2V+05QUs+Tm2Aic94kvIOUKN7PNAAuFC6dF0puVILdQ==
X-Gm-Gg: ASbGncuQOZrme0fCOQWVcjHzYD/o2owbn9wVOIND27SYXQ9y83Ce5XVEpC5hzlRVwje
 wv2Y8FGD9KixvbY/Dw/WMHylDjt9fdczUqybLy5MtTgGIxcS0PK/WYfhG+fUu59GvrJiAnUWKPx
 yLXc+OREB+rs51jK5uoKHzSolz1oOhEvq4+SXNzjTOhavyqWn0G4IBuWrdVAciaDCiH5eOsWV9K
 wOhk70/Xqtjm6FWCEmog+CeDiwZL/j5l71gF913QPpr93KOkV+BY5MoCfEaj4an7wwAvYypmPBu
 u9lDlXkJYGif9YDQuruCsfCXj8ELNJi7WuBj/RrjcxAwU9Zl4M16o5gBOVMbMXG/wl5mIbP3bms
 7vm7jJfO1xjCyEdJoc+8IMaZHcsm93e9qkdZEdJIBMSdT5A==
X-Received: by 2002:a05:600c:5021:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-477308b515cmr117450395e9.31.1762187155089; 
 Mon, 03 Nov 2025 08:25:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn+uAJoQetdBB+i301NjK0js0SUYTkzUq3wdhvbVbqhV4CsF0S0rY591u/12NE7dfUaLUhxQ==
X-Received: by 2002:a05:600c:5021:b0:45d:e28c:875a with SMTP id
 5b1f17b1804b1-477308b515cmr117450065e9.31.1762187154672; 
 Mon, 03 Nov 2025 08:25:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429ce80ded1sm10663397f8f.4.2025.11.03.08.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:25:54 -0800 (PST)
Message-ID: <02ee0143-1da2-4e71-af50-b1dc2b920c05@redhat.com>
Date: Mon, 3 Nov 2025 17:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 26/32] hw/arm/smmuv3-accel: Add a property to specify
 RIL support
To: Shameer Kolothum <skolothumtho@nvidia.com>,
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
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-27-skolothumtho@nvidia.com>
 <2e8bd9fe-2434-443e-ae4e-e15352ff112a@redhat.com>
 <CH3PR12MB754840F7A332AE3A6ED3648AABC7A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754840F7A332AE3A6ED3648AABC7A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D8-8Oiqvn7u68yuAKmxeWkFKy946kJ-HTV0laSYi63E_1762187155
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/3/25 5:08 PM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 03 November 2025 15:07
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 26/32] hw/arm/smmuv3-accel: Add a property to
>> specify RIL support
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 10/31/25 11:49 AM, Shameer Kolothum wrote:
>>> Currently QEMU SMMUv3 has RIL support by default. But if accelerated
>>> mode is enabled, RIL has to be compatible with host SMMUv3 support.
>>>
>>> Add a property so that the user can specify this.
>>>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> I have not seen any reply on
>> https://lore.kernel.org/all/b6105534-4a17-4700-bb0b-
>> e961babd10bb@redhat.com/
> Sorry, looks like I missed to reply.
>  
>> I guess you chose to restrict RIL to accel only.
> Yes. I have updated the description. 
>
>  About AIDR consistency check,
>> did you have a look?
> I have added that check in patch #19. But Zhangfei has reported a problem
> with that as his hardware reports AIDR = 0. . Please take a look that
> discussion.

OK Thanks. I still think it may be relevant to support disabling RIL for
non accel mode but this can be added later on.

feel free to add my

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

>
> Thanks,
> Shameer
>  


