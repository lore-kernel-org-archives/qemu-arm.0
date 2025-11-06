Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EFBCCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 07:55:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGup3-0006h7-UE; Thu, 06 Nov 2025 02:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGup1-0006gc-Iu
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 02:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGuow-0000Uj-Ti
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 02:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762415651;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVL7hZ4j2kAuKul0PBILcZSs61/aRtgQLFDp1GSjUgM=;
 b=DRLYw3tChqznJVFMlLH4XowLwr8fVlU1BOTLLMbKQpcklfpVJibpQZqAfHznyosHG5mZ1i
 I6nVdKsDnaUy4+HIX4f+TgNu5oCYkxV10n+UJhbS9JL8345W64N8t56aGlRvE60gtTpqrI
 0iQimxQfBiGlZn4v8OnsOPn+YGuDx8k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-EESPSBh5OoGXk9CDcVHkew-1; Thu, 06 Nov 2025 02:54:09 -0500
X-MC-Unique: EESPSBh5OoGXk9CDcVHkew-1
X-Mimecast-MFC-AGG-ID: EESPSBh5OoGXk9CDcVHkew_1762415648
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4775d8428e8so5394255e9.0
 for <qemu-arm@nongnu.org>; Wed, 05 Nov 2025 23:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762415648; x=1763020448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tVL7hZ4j2kAuKul0PBILcZSs61/aRtgQLFDp1GSjUgM=;
 b=AOKqqIkYzshxvCFw/p0ZI4qyTLyRJhTjgFYfnm3pKXKU2XJYUpf3MBdI1daK0x/1Ue
 wcEDHPskpqgRAg8d/vi/Da1FSjRt3V6vCYCyvAoZ3pxg4tUJLtltn/8B5kAIPXnpdIoy
 tuaGfbiWZAbuTPsgihZ2fBc3rD9SpPsmXEsj6OkIFeWkke69s3MxP8SoLu+G2Npzmm9n
 SMNYNBwZWnOfPUl7EH03XERtDCb3edKdPw+ZgM/XRwsxvvOfT6PqKdl8sJdC5GrvdN4b
 kUt+5+tfDEunylBADObJlF+rYbdcpUikVS6keWYVR3r6YEhgx3MIQyHHjDq1RPqv1UFl
 8TfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZuUMWWYhqM0wM781yQ3qDWFK8fa1sltpL3Wd0i6bRy31ibYgghDLwKAqwWvg0wKfv/ubu6ZKBHg==@nongnu.org
X-Gm-Message-State: AOJu0YzHwau6YO+x4QD9MASr/3fPWhgyfXOpgGtH6bI3Q8F+7lAagAJR
 KQMtNBB+dR26f1T7VBI3NpWYUbAxhfocYJOIXuaSo/FpJH/mqEnMT1WHfInPilWK9E+9NOQ9NJw
 23shmcvi0oMynoffw0i0/FHp2XyHPzMV34pPxOCxB3zXx31ts1TvDEQ==
X-Gm-Gg: ASbGncu/acDx8MJlKXcuR/5LlkyqasfOABbq3PKADx63A56ur7SaYUpAh4zlsZeZn5L
 JqoC+sr2vZWhtggyICirEMX/Z/loCcYz+fWjmw9VOAm+SM7XQmlIRC86cJsBAWJM7w0Fnk2uhL7
 e9lUMK7NYHLmHXvGfun2WDHos7pLu8/9umh6cd2xf+yq5abNDOSI5MGGppGekDHVAibnLZ+wJG/
 1l3ggotMt18nELjVLUNwlYAImApm3E1t17skuwKED1CDFPoAO7fxmF/fxxRX/1YQ2ROhpyDx/ll
 mAD3q0gvAxa0Qwji36kKC+tw0pAPquHj3gmnONxrnHoGVuOAKVKzaOhYFbcgcvW7uQONKbcD7FV
 ikD/shaSTS31mpe3csZraTUWRUOVa/J6jWq0R2aK/Ws+Q6Q==
X-Received: by 2002:a05:600c:5291:b0:477:c71:1fc1 with SMTP id
 5b1f17b1804b1-4775cdf76d3mr58571835e9.19.1762415648200; 
 Wed, 05 Nov 2025 23:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+2ZvyuTHT6PZfX7p3dbGMOYj+5he1F6P5Wccv1LQq9yrpXLYJG4Delw84HlJ0LMhaYsxfmQ==
X-Received: by 2002:a05:600c:5291:b0:477:c71:1fc1 with SMTP id
 5b1f17b1804b1-4775cdf76d3mr58571595e9.19.1762415647815; 
 Wed, 05 Nov 2025 23:54:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477632bda1asm27432985e9.3.2025.11.05.23.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 23:54:07 -0800 (PST)
Message-ID: <d58b17ae-ed38-4012-9da7-7c3efd484428@redhat.com>
Date: Thu, 6 Nov 2025 08:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/32] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-29-skolothumtho@nvidia.com>
 <49215c9d-feb1-4f72-bfe0-799572ecfac2@redhat.com>
 <20251104145041.GE1537560@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251104145041.GE1537560@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DmrBW6fdkHcIiq1DIJGMXyoExgSSwhAsZElkeJQ77C4_1762415648
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Jason,

On 11/4/25 3:50 PM, Jason Gunthorpe wrote:
> On Tue, Nov 04, 2025 at 03:35:42PM +0100, Eric Auger wrote:
>>> +    /*
>>> +     * TODO: OAS is not something Linux kernel doc says meaningful for user.
>>> +     * But looks like OAS needs to be compatible for accelerator support. Please
>>> +     * check.
>> would remove that comment. Either it is requested or not.
>>> +     */
>>> +    if (FIELD_EX32(info->idr[5], IDR5, OAS) <
>>> +                FIELD_EX32(s->idr[5], IDR5, OAS)) {
>>> +        error_setg(errp, "Host SMMUv3 OAS(%d) bits not compatible",
>>> +                   smmuv3_oas_bits(FIELD_EX32(info->idr[5], IDR5, OAS)));
>> let's be more explicit then and say
>>
>> Host SMMUv3 OAS (%d bits) is less that OAS bits advertised by SMMU (%d)
> It isn't OAS that is being checked here, this is now IPA. OAS is for
> use by the hypervisor.
>
> When the guest looks at the vSMMU the "OAS" it sees is the IPS
> supported by the HW.
>
> Aside from the raw HW limit, it also shouldn't exceed the configured
> size of the S2 HWPT.
>
> So the above should refer to this detail because it is a bit subtle
> that OAS and IPS are often the same. See "3.4 Address sizes"
>
> * IAS reflects the maximum usable IPA of an implementation that is
>   generated by stage 1 and input to stage 2:
>
> - This term is defined to illustrate the handling of intermediate
>   addresses in this section and is not a configurable parameter.
>
> - The maximum usable IPA size of an SMMU is defined in terms of other SMMU implementation choices,
>   as:
>     IAS = MAX(SMMU_IDR0.TTF[0]==1 ? 40 : 0), SMMU_IDR0.TTF[1]==1 ? OAS : 0));
>
> - An IPA of 40 bits is required to support of AArch32 LPAE translations, and AArch64 limits the
> maximum IPA size to the maximum PA size. Otherwise, when AArch32 LPAE is not implemented, the
> IPA size equals OAS, the PA size, and might be smaller than 40 bits.
>
> - The purpose of definition of the IAS term is to abstract away from these implementation variables.
Thank you for the clarification and pointer. I fully agree.
maybe we can rephrase the error msg as:

"Host SMMUv3 OAS (%d bits) is less that physical SMMU maximum usable IPA (%d)"
which is more accurate despite in practice here we assimilate max IPA to OAS (
TTF[1]==1 case)

Eric

>
> Jason
>


