Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F9CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:10:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDha6-0002Z2-L6; Tue, 28 Oct 2025 07:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDha2-0002WI-9F
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDhZs-0000DA-Ud
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761649761;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fapeBS9BlMiWanMAmjo5FOfv9HzZKkc/WpK7c6FKcGc=;
 b=A21y0snpXmioW1ueLBDGHNt4lR8w8E2By2zvaTVmH5MRo77aamhY1kQOnrxtEiCF30YmWF
 prYAn6ZEKsLzlls/CuUktx+LxR72yBkolrt76hxHNEVVCVL77e/PHn802pcDFu00T2nFJd
 3Ydgeb7ST+cm8qEshiIxg/zJVJpobpA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-c7N9hxQWMAqjBEmOfGQYvA-1; Tue, 28 Oct 2025 07:09:20 -0400
X-MC-Unique: c7N9hxQWMAqjBEmOfGQYvA-1
X-Mimecast-MFC-AGG-ID: c7N9hxQWMAqjBEmOfGQYvA_1761649758
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-475ddd57999so26814155e9.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649758; x=1762254558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fapeBS9BlMiWanMAmjo5FOfv9HzZKkc/WpK7c6FKcGc=;
 b=rB834JoSJ+MgCCeJQ0GnXS5k1R7go49Iv0kUPMkx3Uz0UcPrV8AbhFnTYozlRqywI1
 B7ge11UyMp6v9HO9WPkVtebtY/BXpu24hRrA3brckM3UET+hhI3Qc7bcU0suL15M5oqj
 3VXc/0wcWwyVgPoHhtdHZkd0XTzE56L7nJWZWD2T/A6RY0S2g3/HLba5C0MiqFWqlAGZ
 fPPt2IyQeuv/aTnzlEJtdn3lQTg4D5wKCvbSLgZn90QU5aVq4fwLoHYtUQkBBkTylGlH
 IU3OMRjKZCnDsZ3BIze4+1dMt5kdLBY8uvtDkDC9qJQfhcL4Yxmb3mGqNMd9Y+5fTFHC
 ta7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt9fWJrxq8JXiBNmSeCe4W1eIMQ6amouRXr/jOcEdAh39JLq53vHIERdegsuNEMJ7fEsdEBIKEqQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzb1tSAgOKg7VKO88bDSGMqI6uOB50D2o7E1sLQhZ36YB1fiHxL
 UYrlkFrbdQtNEJafn3mkDmzdLgDZmIJlt4ygA4GdD8/OIApF8sLH+p+8n3eYRECeyslnwEikLlS
 BkPf4+E1D8YeCNMlx+GnAHmpjzjj1BaOID+A5e8scMeHPs1ZMbaijjw==
X-Gm-Gg: ASbGncsFrDu5jpPVUcWwQiI2f+WFEwc73conRDqRA3dzOqHb+keI4HbmaLtMtMBEjQe
 8gxwjtU/gK0xAX6rFr7gwc6wUgwD+zmCziMCUa1CEM4SR7/tfPzl1AGFGN+rRurEiTxk1Fv/ukK
 NbNas7uUWUYTP2Afzk88x/Mae02VSbXrZaH+/Nk1qVNGWPH+p99OpAKbOANjrgYyzy+A/9Iv93U
 CUYLaD6PqZgGbsxu8q9pfUEDEew7R7Zw9qTrhkcDiRHkI1vKWxfRBrjvKKpBMsOzqKSR+eGG60J
 9GN+lQMYLvYXyhe9pm10UwhE1WFtglIBak6IwRtOBuZu59it6aGBIjIR+JlhtS7oOeFcXp2pHRd
 uk2wcbd8cOOiqf3wl0cV+4FJtoZrOVQPABjxjVHeeWhAD/w==
X-Received: by 2002:a05:600c:1e0f:b0:471:9b5:6fd3 with SMTP id
 5b1f17b1804b1-47717d48706mr22441185e9.0.1761649757847; 
 Tue, 28 Oct 2025 04:09:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY9PtLRhmhOJVgaKLuJAd1yQ3XJUdvEIF9JnQKeEWI8/jDORg2dqxJeXrB8HT4Jx/+n8WWNA==
X-Received: by 2002:a05:600c:1e0f:b0:471:9b5:6fd3 with SMTP id
 5b1f17b1804b1-47717d48706mr22440925e9.0.1761649757415; 
 Tue, 28 Oct 2025 04:09:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02cbc6sm194271915e9.1.2025.10.28.04.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:09:16 -0700 (PDT)
Message-ID: <96597d95-f338-46e8-b353-567a10913e57@redhat.com>
Date: Tue, 28 Oct 2025 12:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 7/7] hw/arm/virt: [DO NOT UPSTREAM] Enforce
 compatibility with older kernels
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-8-eric.auger@redhat.com>
 <CAFEAcA_DSo7COpwXF_W4sMiwwmGvZy21GON7UbKWm4H5uDxb4A@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_DSo7COpwXF_W4sMiwwmGvZy21GON7UbKWm4H5uDxb4A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jtygVBdYEls9ZcuZeSu381bGAagccS2ZWeiY0pxBiXs_1761649758
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



On 10/28/25 11:37 AM, Peter Maydell wrote:
> On Thu, 16 Oct 2025 at 15:01, Eric Auger <eric.auger@redhat.com> wrote:
>> This is an example on how to use the new CPU options. This catters to
>> distributions who want machines to be migratable (forward and backward)
>> accross different host kernel versions in case KVM registers exposed
>> to qemu vary accross kernels. This patch is not meant to be upstreamed
>> as it is really kernel dependent. The goal is to illustrate how this
>> would be used.
>>
>> In this example, For 10_1 machines types and older we apply the following
>> host kernel related compats:
>>
>> 1) Make sure the KVM_REG_ARM_VENDOR_HYP_BMAP_2 exposed from v6.15 onwards
>>    is ignored/hidden.
>> 2) Make sure TCR_EL1, PIRE0_EL1, PIR_EL1 are always seen by qemu
>>    although not exposed by KVM. They were unconditionnally exposed before
>>    v6.13 while from v6.13 they are only exposed if supported by the guest.
>>
>> This will allow 10_1 machines types and older machines to migrate
>> forward and backward from old downstream kernels that do not feature
>> those changes to newer kernels (>= v6.15).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 175023897a..c4f9b82c38 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -97,6 +97,23 @@ static GlobalProperty arm_virt_compat[] = {
>>  };
>>  static const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
>>
>> +/*
>> + * if a 10_1 machine type or older is used:
>> + * 1) make sure TCR_EL1, PIRE0_EL1, PIR_EL1 are enforced, even if they are not
>> + *    exposed by the kernel
>> + * 2) hide KVM_REG_ARM_VENDOR_HYP_BMAP_2
>> + */
>> +static GlobalProperty arm_virt_kernel_compat_10_1[] = {
>> +    /* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
>> +    { TYPE_ARM_CPU, "kvm-hidden-regs", "0x6030000000160003" },
>> +    /* TCR_EL1, PIRE0_EL1, PIR_EL1 */
>> +    { TYPE_ARM_CPU, "kvm-enforced-regs",
>> +      "0x603000000013c103, 0x603000000013c512, 0x603000000013c513" },
> Strings which are lists of long hex numbers? Is there a
> more readable way to do this?

forgot to mention that we could use x- prefix for those properties to
enphasize they are rather experimental and not meant to be used commonly.

Eric
>
> -- PMM
>


