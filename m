Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2993EDF04B
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 06:35:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqQHh-0003g7-2d; Thu, 12 Feb 2026 01:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqQHV-0003fT-Cl
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 01:34:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqQHR-000733-RZ
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 01:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770878064;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=niydyansRn4CVMonTmoHm0Bhb8Q7Fv00ACBhWPYs0lU=;
 b=bHJmKE7F8gotA+3QXhO9KphVq9z/yBHJZ94iNAvM0PkV5JHwk2EfSrNrsNbxE5KoVx74Uy
 MMvMwZzA3CsYgQjkk/eaO/Kx3S1juj/wJQ+yX8K9FLUmTLXogPl824HiwDtc2dQzSJNStE
 r439KWyT5SoYtJtVIyzmsFWV3VJMMa8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-J5CJKPuuOm6GyGLMo0Sjmg-1; Thu, 12 Feb 2026 01:34:23 -0500
X-MC-Unique: J5CJKPuuOm6GyGLMo0Sjmg-1
X-Mimecast-MFC-AGG-ID: J5CJKPuuOm6GyGLMo0Sjmg_1770878062
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48079ae1001so60287375e9.0
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 22:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770878062; x=1771482862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niydyansRn4CVMonTmoHm0Bhb8Q7Fv00ACBhWPYs0lU=;
 b=i74E+Xg9jQmnhhsT1L0q8cdMP/D36ESVR8EQwQfdYT1Gz+WV8Ya9FwcTztVJEIF5kM
 EVlV3ilikTZn4d3xEWBmqKSGTcb1hloc/AHxXaVna9zZTbqBzWhjkL3dJfk8wBsY7C3n
 AG96OpILHhzLyUEPfEk+aJRkGX6N4dM4ebu07GZazOxyMusP0t12nz35As8XAuIUEHNF
 /SrfwlXFP/qcaR1/LIBhTkOWsQzKFO6jUkC6GX/0MXdP7bvYDxy4yFxDiCErV3axJ3A/
 flXA1BqGC4cWt1kFi+INIXdQD71lm786Z07XRe6ymnDaXR9GJkquheNwH/sVKh+Uhrkk
 pKTg==
X-Gm-Message-State: AOJu0YzPG3qTErnmT0o/0QkMxzHR1dCDZV2tz/gRFxn0D3w2VwL+YSpQ
 P+1oOwQZTYnjFplaUvuqvr9wqPr8mXeasuDWqiML3XDXAvPNZeIuPrzO0H6tqQTBGulFtVl0RSw
 AYoDSOw7xN+lJXZ6Nj9TtMcC1fASwMCkqz82HMbMCfTHlZM7Q9uexIw==
X-Gm-Gg: AZuq6aL+FaYhCSwJdPRlTSbjfQQQL/T2vtjH645kkAJaAfKjjGoRZOGqpkKSRI+Wfuh
 7syqMevQ2keKZFqIW92C3k2VenpBB73AMEUD9258pj57E0FKrdunq0PmnBwM2WV0sAMpu+QFPI8
 3RtlKLOKjfxs+Ko4BGKcouMzIcywco6Nvpv5d/sKDwRQtDV7ZcpJxqeGmn4gIHcODuZKCi7rNEy
 /98k61QFEbNzx0brZbXoVh08cOCqsKh66x2xo6F1WwmroR6G/e3UcC6+hQK0ld3zxDdCfQ10sQ8
 fjk+KEyrTBCl4lYBDWvaIU4+rG4HCiy7S4KtujNcLFsiKlCGXaH74hDe/2n0c/Ht1uIozyagCu2
 OOgmNKVKzW5eOjp3ycYCjHex3PwN9j/KYUVVc/WxPornED1GyUSCPdsPj8QafnYgkV1N30w==
X-Received: by 2002:a05:600c:638f:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-48365716db6mr21908685e9.31.1770878062098; 
 Wed, 11 Feb 2026 22:34:22 -0800 (PST)
X-Received: by 2002:a05:600c:638f:b0:477:7af8:c8ad with SMTP id
 5b1f17b1804b1-48365716db6mr21908295e9.31.1770878061627; 
 Wed, 11 Feb 2026 22:34:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e59c19sm9242366f8f.34.2026.02.11.22.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 22:34:21 -0800 (PST)
Message-ID: <f053853e-577f-418b-9bee-e9aa8ca0ebb4@redhat.com>
Date: Thu, 12 Feb 2026 07:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
 accelerated SMMUv3 devices
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260211083415.133534-1-skolothumtho@nvidia.com>
 <20260211083415.133534-4-skolothumtho@nvidia.com>
 <aYzFeMh1szhJlJJk@Asurada-Nvidia>
 <e66e82d6-0953-49f0-9d84-bf2776e8f3ce@redhat.com>
 <aYzJhEFg/zxtrJ8z@Asurada-Nvidia>
 <CH3PR12MB754855AE35A087B900B0C311AB63A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754855AE35A087B900B0C311AB63A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vhd9L3lK2lZrbRjCubpOewLrvcKIdnxOn47PNkNdfTg_1770878062
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/11/26 7:43 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: 11 February 2026 18:25
>> To: Eric Auger <eric.auger@redhat.com>
>> Cc: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> Jiandi An <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
>> accelerated SMMUv3 devices
>>
>> On Wed, Feb 11, 2026 at 07:14:40PM +0100, Eric Auger wrote:
>>> On 2/11/26 7:07 PM, Nicolin Chen wrote:
>>>> On Wed, Feb 11, 2026 at 08:34:13AM +0000, Shameer Kolothum wrote:
>>>>> For cold-plugged devices using SMMUv3 acceleration, the vIOMMU is
>>>>> created before the guest boots. In this case, the vEVENTQ is
>>>>> allocated when the guest writes to SMMU_CR0 and sets EVENTQEN = 1.
>>>> [...]
>>>>> @@ -1605,6 +1605,10 @@ static MemTxResult
>> smmu_writel(SMMUv3State *s, hwaddr offset,
>>>>>          s->cr0ack = data & ~SMMU_CR0_RESERVED;
>>>>>          /* in case the command queue has been enabled */
>>>>>          smmuv3_cmdq_consume(s, &local_err);
>>>>> +        /* Allocate vEVENTQ if EventQ is enabled and a vIOMMU is
>>>>> + available */
>>>> Nit: though it is just following smmuv3_cmdq_consume(), it'd be
>>>> likely clearer to verify the EVENTQEN in the callers.
>>>>
>>>>> +        if (local_err == NULL) {
>>>> Does eventq need to rely on !local_err from cmdq?
>>> if local_err is NULL we can safely use it, no? Or maybe I miss your
>>> point. maybe test !local_err directly?
>> Point is: if local_err isn't NULL, why can't we allocate vEVENTQ?
> Technically nothing prevents that I guess.
>
> The only thing is we have to call error_report_err() if local_err != NULL
> and then set local_err == NULL before calling  alloc_veventq().

Besides the implementation details about Error handle usage I think we
shall first answer the question about the relevance to allocate the
veventq in case the smmuv3_cmdq_consume() fails.

Thanks

Eric
>
> Thanks,
> Shameer
>


