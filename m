Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20922CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 15:56:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNusg-0004eN-Pc; Fri, 15 May 2026 11:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNusR-0004cP-5V
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNusO-0008Np-Oe
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778860499;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A97hbXYKzUL1GQXcULFqEomdMtwQ7TyYIOUUyECdXM8=;
 b=NS2hX1Ba79JzrP+fffepBxNaZDSPKFj6gpilMcTZ9WLK1LwWtvcgvAwWYkkazLITKgCG84
 XL7O5/nqD2kJOcv0FZI9IDJNsPMLStchunw6c/ux8TfLxgy5WhkvLcMDmb0Nhg431ItvDw
 EZaCkEE22v0ct6n7DB/dQtNNY4oOp2s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-1SV3usDSMJylIeWnFsdEig-1; Fri, 15 May 2026 11:54:57 -0400
X-MC-Unique: 1SV3usDSMJylIeWnFsdEig-1
X-Mimecast-MFC-AGG-ID: 1SV3usDSMJylIeWnFsdEig_1778860496
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fd9c22b8fso15363485e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 08:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778860496; x=1779465296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A97hbXYKzUL1GQXcULFqEomdMtwQ7TyYIOUUyECdXM8=;
 b=mtq304f9Qynqm+Yc6G3RAOJEoZokcqqejK/V0hPBjf19y5ztoabZGpy+2W9Mm8yE5L
 XCBawMA/+tY7kx+PP2cAyD6kPSBvgZMQgrLix/VIMHOn8kpzxm9367ZiwkyedvyK/nBp
 qRy9i7N8Q/TJflxo3/+ai8ZGi6r/tvDXMN0GDtSRAV7h71KO2BGvzbIaZKwyveEZfiGB
 AyRKWSB/dYN1jhbh9ojeJpsBbtOFpEJXcr0SJJTTQJ2NK6c4VL+pu4uUKvLp7NWnsl7G
 2DYGtbiGunr/FooXpduhGjMvOx4UxZI4+vtT3jZW5Siqjem88RoPw9RP8yjRZpscn/lE
 9Nzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+6mGL4LQfq68Ln74SupC7WIFeJrW4VHn2Ho2ntzLV7X5RK85dariXjnfJSvFqtW50iQzP0i+utAg==@nongnu.org
X-Gm-Message-State: AOJu0YyvIJWDbw59xhMVd8ACT2R70Np+s9fOPYQXDnsKpdQfxbHCP6l8
 kGISBJUcYD4YLIUP7hizJBSxhLttbQjrT0pTm8qLZqAZdL4ax4EMS2fN45Dvc0YqbNL00C2E7Bv
 WsyBZfGtPnJNo9bVN96KMNRaz4Kpb6lc8+4F48+oWuBrQUFvYreJdaw==
X-Gm-Gg: Acq92OE8OCWmNKkCl38xcNF31ZJdzCkqGpld/qJsHxMGc9iQbp9TDdYXDfzYBoB6Y8d
 mC9SxUnCMlczv7MC+OmJNZH8YkyIbrs3quMm63ctA9kemF6vtWxpujfG3JHog+HkQkapjeD8YS2
 FNCmUngXT0mNF/sdZdEkgGRbbiD7RHcdMWbwa6ebrNw70CWnhOEuMo5xwkw9aL79F+kloVmWRZg
 J515Hwp9SLzsUeyAOknqbITyI2jKNCBoww4SzAAAkmi8tEjGK6grae/0V+SS6AyOacSI7/96Tpe
 afknxcaa2HPrBWCM77qPN1ib8JJmQ2NtBzGptiA1Map+jcR5FhB1m2Aj0vVN/nMYu0qAkxP0U7f
 J7xVxdbg119IIKKstzqN4GH6rsxQ76Uno0zNiWtJDVUVcgJ2+/Jzh2awVMie+YCIAqHbEgg==
X-Received: by 2002:a05:600c:4692:b0:48a:592c:e632 with SMTP id
 5b1f17b1804b1-48fe6325f18mr69509055e9.16.1778860496306; 
 Fri, 15 May 2026 08:54:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4692:b0:48a:592c:e632 with SMTP id
 5b1f17b1804b1-48fe6325f18mr69508315e9.16.1778860495789; 
 Fri, 15 May 2026 08:54:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1a22csm14852814f8f.19.2026.05.15.08.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 08:54:55 -0700 (PDT)
Message-ID: <1d4360a0-0611-4b3d-a7a6-3815d57a1d6d@redhat.com>
Date: Fri, 15 May 2026 17:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 02/13] target/arm: named_cpu_model: Add ID Register
 Fields
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: Shaju Abraham <shaju.abraham@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>, Jon Kohler <jon@nutanix.com>,
 Jonathan Davies <jond@nutanix.com>
References: <20260513163356.3033159-1-shaju.abraham@nutanix.com>
 <20260513163356.3033159-3-shaju.abraham@nutanix.com>
 <0b9d0320-96ab-4ccd-9440-0c0494af5aaa@redhat.com>
 <189B12F2-68DF-4442-8657-D5F295F710DC@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <189B12F2-68DF-4442-8657-D5F295F710DC@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2tg0_J5aiwN6CH-DsWJb1pBydf2dZEQESijXASEwPfM_1778860496
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/15/26 5:27 PM, Khushit Shah wrote:
>> On 5/13/26 6:33 PM, Shaju Abraham wrote:
>>> Add a declarative description of every architecturally defined field in the
>>> Arm64 ID registers in cpu-idregs.h.inc file. This file will be included
>>> multiple times with different definitions to build the per-field arch values,
>>> per-register field descriptor arrays, arm-idregs table etc. The architecturely
>>> defined values for each ID register field is extracted from kernel's
>>> arch/arm64/tools/sysreg file. The safe-value tags and default values are
>> In the past we were rather advised to use AARCHMRS instead of sysreg.
>> This is what is currently done in [PATCH v4 00/17] kvm/arm: Introduce a
>> customizable aarch64 KVM host model.
> I am not sure if we can get safe rules from AARCHMRS. Otherwise it’s fine.
I don't think it is there.
>
>>> derived from the kernel's ftr_bits array. Aarch32 ID registers are added
>>> with dummy field so they can be defaulted to 0 by later commits.
>>>
>>> X-macro structure:
>>> IDREG_START(REG)
>>> IDREG_FIELD_START(REG, FIELD, SHIFT, LENGTH, SAFE_RULE, DEFAULT_VAL)
>> Why do you need SAFE_RULE/DEFAULT_VAL? As far as I understand this is
>> used when we have different flavours of CPUS in SMP and we face
>> mismatches between CPU features. Why do we care here?
>>
>> I don't see safe_rule used anywhere.
>> I see arm_idregs_reset_to_defaults() uses the default value though.
>> Should we use the Registers.json reset value instead?
> Kernel uses safe_rules to show a common denominator of cpu features in SMP and same rules are
> used by KVM to verify if certain field value is valid to show to guest on the given host.
> KVM_SET_ONE_REG validates the writable fields with the SAFE_RULE defined in ftr_bits table.
OK so you plan to duplicate the logic at both qemu and KVM level. Can't
we simply rely on KVM which already implements that logic. Also if the
check is against a given host, is it relevant here? I need to look again
at the kernel logic though.
>
> So, SAFE_RULE will be used in v2 to validate idregs even before we writeback to the KVM, and to
> pass supported field values for a property on a given host to management stack (libvirt). Something like
> feat_AES supports (off, aes, pmull) on this host.
>
> Registers.json can probably be used for default_vals, but I will need to check further on this.
Registers.json gives the reset value and not the safe value, as far as I
know.

Manual import of those values from the kernel looks tedious and error
prone to me.

Eric


>
> In short: default_vals -> show no feature.
>                safe_rule -> valid values for guest given host values.
>
>> taking FHM field if I compare with sysreg I have:
>> UnsignedEnum    51:48   FHM
>>         0b0000  NI
>>         0b0001  IMP
>>         0b0010  F16F32DOT
>>         0b0011  F16F32MM
>> So why do we miss some values?
> The table was created based on sysreg file in 6.18.
> A script added the arch values. Register, Fields, safe values and default values are
> maintained manually.
>
> Warm Regards,
> Khushit
>
>


