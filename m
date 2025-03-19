Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp364507njc;
        Wed, 19 Mar 2025 09:25:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn9iMWIdmuSYtf1Xw7/ZTVWgPKEUTGMgjQLVsZ/XME2wgbPng+IKSPCG4IEsp/8qWdthcfJED1NyKDFw==@linaro.org
X-Google-Smtp-Source: AGHT+IHbWkt1CCCivWziOZtyAUY+WncQtPLeetnm5KR3Veq9xyJY2f7nsfGXaB9gFxpxADL8Ex1H
X-Received: by 2002:a05:6102:3ec8:b0:4c1:9780:383e with SMTP id ada2fe7eead31-4c4ec630121mr2504609137.4.1742401544222;
        Wed, 19 Mar 2025 09:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742401544; cv=none;
        d=google.com; s=arc-20240605;
        b=SysCzUdAdgPj7S7QSLpF3qXwvYBvTFr+1FV7jb3B3bVqESaiXIaWdeubP2gY392rFZ
         ohQj5gNsR0N4bn/7LHrFuhSJraYagVYi84FJu9ocpFET+ArrN1rKHkTLiPl32EqyKW2O
         /0DvcXgLL1hue0jRXF1yz4FVEDRZmNLLMw2nC6GGoQ1LwoNGzeOFyJLyPJCnJkIS5B3K
         HMF5hfFPoU+03XE5iulGhvU66g4+vYzbv5bsUQooAQ16kJrmE6Dh87TwAp6IDTd5q3Qk
         lKpYXM5KF0JCSA0cdAOkUSNV60xbJjZElUHOTQN09eBsk165WbFoDCK01cblj0/xHmyf
         trpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=U+BPo7DV4isdCerOqmtm4s5LeZq5pcN2etZ3ZBw9b/A=;
        fh=nhm6CDd/6M5NJgJcbft/4SBJabm4J9Z4BEPk1qg9m1Y=;
        b=cXjPVk71iGldWcN+9yXm48dVc663jVELGVXFMROfORIrx8nelGD0pxLe1XxuqMZdzs
         oITUsNqFigPQehhD5lW9VKIzJvr2GLzSCU1EYsPk4NZVVutNw6Sj3389b6umNwNVmWRS
         pYzUERv85FviA2hLWkRKslRCQ7GPwoIPXpvBDnuHxMh1kQUUjG2o2NIBhx7zwhilb9Ht
         lgCfnTH7YmXrzV0c29Be0KgMSO+LSh1hTG05qjSJhG+biQ1TFeCk/Aj4j34JIcKDA2bl
         3uCa3FhJoNe8EBp2EMMy/aaQ8J14DKmaGRArfgaQ6od7+ZR7J6LqN+QinDwiS1yYSC0E
         +2rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HXPOEBXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c374ac4f92si4125201137.425.2025.03.19.09.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 09:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HXPOEBXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuwEY-0003q1-41; Wed, 19 Mar 2025 12:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tuwDo-0003GT-C2
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 12:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tuwDh-0008KC-QI
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 12:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742401478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+BPo7DV4isdCerOqmtm4s5LeZq5pcN2etZ3ZBw9b/A=;
 b=HXPOEBXt0TDF9w6tcSJbKg5SySHPjw0gNPuoEEdowjNa58hmHa9UpzBRma3iDUxzjr6zmp
 MCaujIeeYCPogZNUSGn/FkuRQCsAkY7eEFHT0JviJJDaKGnPc/hHy/0C8m6YgemWuEUQfH
 YjJuDb4E4ngNLJ01VxPx8rFifauFMKI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-zrSa6yu0MbylWAfxwx2VdA-1; Wed, 19 Mar 2025 12:24:36 -0400
X-MC-Unique: zrSa6yu0MbylWAfxwx2VdA-1
X-Mimecast-MFC-AGG-ID: zrSa6yu0MbylWAfxwx2VdA_1742401476
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-85db19e5e0eso648826639f.0
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 09:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742401475; x=1743006275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+BPo7DV4isdCerOqmtm4s5LeZq5pcN2etZ3ZBw9b/A=;
 b=QVXgRbTR8LtVel+1UqrZ66mAND4tbWZBkCIHWIz4Rb0kVs27/SqJL8ZU+Iro5PHw5N
 owT/9r6PWUJ6s4R/jzqVJ78g6Ch2gop6T9Lhnj3U3/X1E9pWTuEoO72g8dmnQNMpVmKd
 pbggRPTyNhcJBoUFNo81rwdyHRXtzSno33rbQ1vxNmZ5eMhVpgu6uPJjvINaUmaqbwPU
 dH1LO5mfS/hM0cnjrOlM92CaXv1Jrg+jwixvNR7bgJ16f78PQE6z3E0PAziFpl7C4nnD
 eQRYbelpBNdM9NxlxXGb3iuSZsT7XFVwnv4mnbzxJOiiPQBCwF84AQwQ8z3ZHcpoTMML
 HWQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj9ojbzFXCrFEfJyCkWRni2/bfeKi9kF4btxEA7iAhjWKVdERi0h3N3I31zrKUo8pSBQM/a6go1Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz10tT4VZcmqWYgaxrw8Bqst+iQGgJ7VAWzC6pbTKzKlRUU4yYd
 psIJe4uLwNlegKlT/D3YFM634FPyZSlFoFGfT1ThCbDwQTGHggIYwMDwvNIYBkSBJ7lZHz9RAWg
 qZOsL+v1dnFZT9damuHnOTrGVdEDaPqtvDw3/YlAUBf/M9n6CQjge34Pa2A==
X-Gm-Gg: ASbGnctIdu6PMTrn4Qqp1Iz14y6PUpFFcpXWAYyBcMOIEQNiDgxPACpm7g8AG/pexm1
 Avi1J/vA+C9k/paF4bgLfjKUeuVXigQEUJA2YjPJT3JcFxrNXC9tyNqrtMEJo8jRbiyfDWRUriY
 gWJf4uLXlj0f1K+m/8LlzwBPJwM7m5kyJSlCmwE9unmFhOGrjHb13+VJ+j14+GRrcXylYOByhZX
 FxLIbw57bHTg+XCySdGrx0KEpfFl+g3wECQxLF/LcMpoWEYtQdB9V2WRCI/O6aPIN0jK97Q1L4o
 zxUqgxsJ7xOM7qKV
X-Received: by 2002:a05:6602:378d:b0:85b:601d:dfb3 with SMTP id
 ca18e2360f4ac-85e137c0ce7mr396477339f.5.1742401475312; 
 Wed, 19 Mar 2025 09:24:35 -0700 (PDT)
X-Received: by 2002:a05:6602:378d:b0:85b:601d:dfb3 with SMTP id
 ca18e2360f4ac-85e137c0ce7mr396473139f.5.1742401474938; 
 Wed, 19 Mar 2025 09:24:34 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f290aa0e42sm1655305173.61.2025.03.19.09.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 09:24:34 -0700 (PDT)
Message-ID: <16998464-b8d8-459b-80c4-69da2cafa477@redhat.com>
Date: Wed, 19 Mar 2025 12:24:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers to
 batch and issue cache invalidations
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-14-shameerali.kolothum.thodi@huawei.com>
 <28452954-7be2-4114-8d37-a208250b6f83@redhat.com>
 <42f9953fc7dd40d9bcd4919914530b89@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <42f9953fc7dd40d9bcd4919914530b89@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: voLr3ViOIg-V95ssnkiOfiYwJmuJA4T8RGxSrqHvAiA_1742401476
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FuKhFE1nlg4m



On 3/19/25 5:48 AM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Donald Dutile <ddutile@redhat.com>
>> Sent: Wednesday, March 19, 2025 1:31 AM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>> nicolinc@nvidia.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [RFC PATCH v2 13/20] hw/arm/smmuv3-accel: Introduce helpers
>> to batch and issue cache invalidations
>>
>> Shameer,
>>
>> Hi,
>>
>>
>> On 3/11/25 10:10 AM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Inroduce an SMMUCommandBatch and some helpers to batch and issue
>> the
>>     ^^^^^^^^ Introduce
>>> commands.  Currently separate out TLBI commands and device cache
>>> commands to avoid some errata on certain versions of SMMUs. Later it
>>> should check IIDR register to detect if underlying SMMU hw has such an
>> erratum.
>> Where is all this info about 'certain versions of SMMUs' and 'check IIDR
>> register' has something to do with 'underlying SMMU hw such an erratum',
>> -- which IIDR (& bits)? or are we talking about rsvd SMMU_IDR<> registers?
> 
> I guess the batching has constraints on some platforms, IIRC, this was discussed
> somewhere in a kernel thread.
> 
> Nicolin, could you please provide some background on this.
> 
A lore link if it's discussed upstream, thanks.

>>
>> And can't these helpers be used for emulated smmuv3 as well as
>> accelerated?
> 
> Could be I guess. But no benefit in terms of performance. May be will make
> code look nicer. I will take a look if not much of changes in the emulated path.
> 
Thanks for looking into it.  The push is to use common code path(s) to invoke (or not)
an accel path.

> Thanks,
> Shameer
> 
> 

