Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D2ACD4F24
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 15:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMp6l-0001hT-K5; Tue, 12 May 2026 11:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMp6j-0001gu-Hr
 for qemu-arm@nongnu.org; Tue, 12 May 2026 11:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wMp6h-0007gA-NK
 for qemu-arm@nongnu.org; Tue, 12 May 2026 11:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778599994;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5+xnXbVYTH65ka/uxiCb0qLOyxZQA+00M7WtNB18gU=;
 b=Pfqt6ZTsRwVox98h7bRXxUpgFaXFLF3wRkXE/d4UsafE72oSea5wh0wHYjtY/hFFGetQ7P
 PuOmUrLXMbj4/cNtl0Hqz6SMxg1T3U0dlySLTT8cpz5+fWLRbpQdT/FuAzKPGoydoCi6GO
 DuTaXpjssXX7BEv9s0b7mGvtcgnu+zQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-ETfG3ZFDMaWWIPh-H2P4rw-1; Tue, 12 May 2026 11:33:09 -0400
X-MC-Unique: ETfG3ZFDMaWWIPh-H2P4rw-1
X-Mimecast-MFC-AGG-ID: ETfG3ZFDMaWWIPh-H2P4rw_1778599988
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48e86e6c6b7so19543535e9.1
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 08:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778599988; x=1779204788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5+xnXbVYTH65ka/uxiCb0qLOyxZQA+00M7WtNB18gU=;
 b=qLrG52+Rpo3AIu5fEV2FbQdiEZx0kC+T9PcsymADM+EHwtbA4YHRoGE2ZdndiOEOob
 CgDM75vAz3mRjNnquMZmrroXUYW1gbrGfJl2nEeE+OGRZ7tNab6OGFBXPa4lCGbIH517
 yDBx1rAv40kwfMycdh7IMjTDEfrmqeLEQxzgJLgI9yBk3n2/LNreWWjy2SMC9q4igGFs
 eCOBaoH9D/OPcLLObYUSW9tZvbMVUstDHi1c4h42ztfukNyLAX9y38uSUus8wG0Gcz2d
 qlBZOHkxJ/WP5qFR95UWG+t32Ya9NAVpnKXv3IqjU8PBDdeqUSxVeViNDhCw+XHe/F7p
 fLQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ80Mtm30RthuPF0hOGaoGabSWUeqkOQZhP61KseFUPrBEcMscyXY/t/BzaAvstyamNj5/8FOPW+Cw==@nongnu.org
X-Gm-Message-State: AOJu0Yz3CxeAxlDurfkrnMo5UYjXFOaZMqaxRmljm+ez8KfnPntRxK2L
 wAr23hO2CBwfkUT+jqm59EBZ04TGMgbf1m3B6OILSvKuuUof3kGkbqPQn4UdIWxPQj21sy14oUu
 9QNqaM+bPY7U8IN+OKq5jc+FJzUit1x/g20Nv5Nked1kZyvBbLyH27g==
X-Gm-Gg: Acq92OE7+aQgJJUbtyWEAxRG4BVlINx4yp5GiAxBnipoXuOBk2KO1CCaYoABggXLnBk
 mChvOOt8fKFZWQl74D6Ab6AmlNxFCBPKOhJStEhcR+l1SvqoVcBBn39iMSAuKK2+fQaZeIYtECG
 AnMxGHAn+ONZezLfkLWidKDrjJRchIkQdtqGV6dFail5tEdozzrNCmFyemcTcWfJY2CDooHj/hk
 OmQwAQiZpho9VJzrfj1OEA1+BbupqDEzpfQ0Yy425svnG92K5zoCs27YbOR+Qo1cxx6h7ytdY01
 w/P+gKhsN8P1aLKLR/UbA5Ff64F6wwiuv3DB7vUvhy+s7GefHFhzUBQTuPKvTAwD43T3JqG8VwY
 YykdUfqOaiLmeAEJZgoMtL0lnQ+gaAW9mAcPnKK2kiWB+SdgZoGO7KKGTi3m4PMMt3wDGWw==
X-Received: by 2002:a05:600c:8115:b0:48a:9540:1a3a with SMTP id
 5b1f17b1804b1-48e51e196f9mr472852295e9.8.1778599987833; 
 Tue, 12 May 2026 08:33:07 -0700 (PDT)
X-Received: by 2002:a05:600c:8115:b0:48a:9540:1a3a with SMTP id
 5b1f17b1804b1-48e51e196f9mr472851615e9.8.1778599987380; 
 Tue, 12 May 2026 08:33:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f445f83sm18667735e9.29.2026.05.12.08.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:33:06 -0700 (PDT)
Message-ID: <ada244d4-0bfd-4bbd-b594-c3278a5570dc@redhat.com>
Date: Tue, 12 May 2026 17:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/17] arm/cpu: accessors for writable id registers
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260503073541.790215-1-eric.auger@redhat.com>
 <20260503073541.790215-10-eric.auger@redhat.com>
 <CH3PR12MB7548053696CA900F2A2349BDAB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548053696CA900F2A2349BDAB3C2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bnEMPU7hLIcTFytNa-v6qVIuJJRzRt_my4TgFAAEQa4_1778599988
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/7/26 12:32 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 03 May 2026 08:33
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
>> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> cohuck@redhat.com; sebott@redhat.com; Shameer Kolothum Thodi
>> <skolothumtho@nvidia.com>; philmd@linaro.org
>> Cc: maz@kernel.org; oliver.upton@linux.dev; pbonzini@redhat.com;
>> armbru@redhat.com; berrange@redhat.com; abologna@redhat.com;
>> jdenemar@redhat.com
>> Subject: [PATCH v4 09/17] arm/cpu: accessors for writable id registers
>>
>> External email: Use caution opening links or attachments
>>
>>
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Introduce ARM_FEATURE_ID_RANGE_IDX macro that converts opcodes
>> into the index used to access the 3 * 8 * 8 feature id array.
>>
>> KVM_ARM_GET_REG_WRITABLE_MASKS populates writable masks with
>> that indexing.
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  target/arm/cpu.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 2aa22360d2..0ac0fd13cf 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -886,6 +886,13 @@ typedef struct IdRegMap {
>>      uint64_t regs[NR_ID_REG_MASKS]; /* writable masks for registers */
>>  } IdRegMap;
>>
>> +#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)               \
>> +        ({                                                              \
>> +                __u64 __op1 = (op1) & 3;                                \
>> +                __op1 -= (__op1 == 3);                                  \
>> +                (__op1 << 6 | ((crm) & 7) << 3 | (op2));                \
>> +        })
>> +
> It looks like this macro is not used anywhere and in next patch it
> uses KVM_ARM_FEATURE_ID_RANGE_IDX instead.

Thanks for pointing this out. Removed that patch

Eric
>
> Please check.
>
> Thanks,
> Shameer
>
>
>>  /* REG is ID_XXX */
>>  #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>>      ({                                                                  \
>> --
>> 2.53.0


