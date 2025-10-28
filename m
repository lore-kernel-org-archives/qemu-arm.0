Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63286CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:07:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhY1-0001eR-0b; Tue, 28 Oct 2025 07:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDhXz-0001dg-80
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDhXv-0008Qi-BJ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761649642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiZygqK3nrPdhOoVaeAx5pny0s8zlVN8FdyMOFmhpD8=;
 b=WFtULqflg4CkfSPEyqHVAwfoqJRqfthh8Z4/mY3L1TrdSgGsEf+gDqnVRFYgx0Pv/MxV6m
 ivhlsQl7cGb8soYFGaZcM9pDLtOWUhDYeNaSep6S8DJ32oiHRJEhY9MxUpzjtgcvvGTryX
 G7WYaPWmYAof0GTR5GioatRYYzhvUiY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-R1APfATyOiazq7mG7FB3uw-1; Tue, 28 Oct 2025 07:07:19 -0400
X-MC-Unique: R1APfATyOiazq7mG7FB3uw-1
X-Mimecast-MFC-AGG-ID: R1APfATyOiazq7mG7FB3uw_1761649637
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-475ddd57999so26797615e9.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649637; x=1762254437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YiZygqK3nrPdhOoVaeAx5pny0s8zlVN8FdyMOFmhpD8=;
 b=sBnQFr/YwTRRo10IGlXu+Qx832hc/yjWvSkMOJcM9x2lNo/Fka8bADucidjIcRC2X6
 I/xvozF7cauRzQBvbOFktwuxpBnr982cW5ocI+x2Evo3NSPpe4r7fSYndOE+qAcAwH9c
 jJ4M60RyOehmiKemqPJVycfoqkEyXIT8sWBoN/ogIVlBB872ugHMif7fy2yCNUG2Rcbm
 wxG55WBte5qAS5uSKWUeuD+HksplZVXBhVmdvLXzH1W9IWOEaycF+ORCWFv73d+dJ7OJ
 9gsnnEN5XdoED725ZlaxTTYQ3Wk7ku0smsfIsAIpb2NgWf2tdEoO9/ngpORplgvXwyHP
 pe5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD+jMcBGkFRSf6roUUpoqPYLK1NYR4GiitGbyi8GXRrRyHB1dt1ygRNuJWBgTmoNqjp8KgV1A1ww==@nongnu.org
X-Gm-Message-State: AOJu0Yy6KvnDYQ1KAU1aKfX6FLNzkkQj3k8nvqm6owPZk8nHzC35WMx7
 ypv6xCdQnapQqYwgDBvx2aUkIvM0RUI1s6CJU2E6Q/A3RuMQmcLxu0K3677c/gdQWsaiqk0eclA
 IggdKr1usI+mGCudsozIYE3R4rZGhIPpcI8P+D9dwQVG3wc2tO4zvAw==
X-Gm-Gg: ASbGnct/DeV+j0Y2QvNp4/tmbC56el33eHmcKU1TO5RYt8qIJsupXRSFpcQK5gbbiSX
 ssuwc+JhEMjGYjyHQJat5nkz7kQ3YPBICdaBj1PNjPHzVxvpGCLTiRWoit9fngq5KL638CtYxz1
 xjMc+NjJ6soV4NyH1f3KSKUS6NJIZl1bJRXSr/r8FXUCRT+daD4u9NgL0Sd+ze0etPCZ53CubI5
 OA5DKe0K99iPSQtJiWzRpsSHwzqWO0jGqARLiEFsRVkmBDzjIwDfdrEYAj1sGgh7yhCLWfECY5u
 MTMf/ryQ+r2eTe8OvEfZA1+VYmezPLAJ8jnyANZ+ahdSrqLjXa1LNMzecg94UypsU4S+CdXa55n
 5Hgz5rdkOL8z1oD2xRoSfZH9rFVztt0F6HMgmBCnnK9Y51A==
X-Received: by 2002:a05:600c:6215:b0:471:16b1:b824 with SMTP id
 5b1f17b1804b1-47717e3f3b5mr30828335e9.28.1761649637344; 
 Tue, 28 Oct 2025 04:07:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjKiJZ1L3buHymE+/qfFxnMX4DBs9WMUeaXcg4jB0+smPA3O5BdC+eUEhECQ10KoQ47iZc9w==
X-Received: by 2002:a05:600c:6215:b0:471:16b1:b824 with SMTP id
 5b1f17b1804b1-47717e3f3b5mr30827975e9.28.1761649636876; 
 Tue, 28 Oct 2025 04:07:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a6043sm189636795e9.12.2025.10.28.04.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:07:16 -0700 (PDT)
Message-ID: <5909c005-8a7c-4bd9-84c4-e0d6d7009947@redhat.com>
Date: Tue, 28 Oct 2025 12:07:15 +0100
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
X-Mimecast-MFC-PROC-ID: mytQKZFZbaLfQpaGdaiSyUF_kR7AQfCDsw5SbQF_-ck_1761649637
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

Hi Peter,

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
for sysregs, we could use the reg name string directly once we have
script generated list of regs from json description. However for some
regs it won't be possible, like pseudo FW regs.
As those props are really supposed to be used by very informed users
(distro staff) who need to know the kvm indices, I thought it could be
acceptable. Maybe we can rely on defines to make it more readable.

Thanks

Eric
>
> -- PMM
>


