Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179D4E674A9
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 13:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXfnC-0000WO-5a; Mon, 22 Dec 2025 08:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vXfn0-0000VV-AU
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 08:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vXfmw-00052y-5h
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 08:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766409444;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbzYKL4kid0fl45TgaQIDaXjJo0xpcY+XP1aQXK+w/I=;
 b=T43Q/S6MsThsDUjOEOmTVv6QLW6CoGTUryhFZeIt4SM9HJCnxY6Ancr6SOWhlXda0gX2vj
 Xi1UUSaMAh/tnCIHllsIIxLPsTa/48EILam+BwLer+FjoUE663Ca3BeFMmTy9scnFlf/nL
 /+ZvOL3ywAgOYfJViJ1/adW5nlvSjSA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-ToaXKHO-MWaR0DnSZ-ryyA-1; Mon, 22 Dec 2025 08:17:22 -0500
X-MC-Unique: ToaXKHO-MWaR0DnSZ-ryyA-1
X-Mimecast-MFC-AGG-ID: ToaXKHO-MWaR0DnSZ-ryyA_1766409441
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430fe16b481so2002131f8f.3
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 05:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766409441; x=1767014241;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbzYKL4kid0fl45TgaQIDaXjJo0xpcY+XP1aQXK+w/I=;
 b=wrEC1HV7VN7Qh8JB25/XrRGJNvy2AunJd4utAIj4IC7h0FtKIGRExJoTPVOTOowqT8
 AeVU7Rv9Sho8eteWOu1k34DiP9GSmkaJNCJf7Z01/DzJh3BNLhnUjnWuvBjD2wuy6xZW
 kadmfiBFpn8Np5jEaGdKcfxfZnRJJVWf6B9tHPoM/OGlwlXen/wgHq+O3SjezNjGho+T
 zOgI92pz7ifM/V5Jo8h6YlHI0s8HiztEgg47vh8PyHngAF5nACQHj+9vlUcKWXCe6NDw
 2NIXRPIAmcPygFbZXpraRdcWh2lHP2PAPyvXWmsGePPzvZnEreJhlS/UE5Ueo73kUGYQ
 vGWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWErzirkwdcZ9j5oar9ETrjd+tlH8Qy1wvDjSd0yQzunwifNdHA5LxVGtmHDPAQUziQb+mLgEGH+w==@nongnu.org
X-Gm-Message-State: AOJu0YwmzFei7jHYLbuRXNjikXh8rUNjE8l516VFB7bF+PC5BXAtjGmf
 NLMSBbwQYnyHc86OsYDcz8Burg6f3E7OWkJhQBhX72bbGPAJFfQ1uQNiUDLm2jhxHW1PMdODUSG
 WtssGNu8zZ0BaYLlCcNIbfhyMqjL//MejbdcqASdGS60O5ITWmrAwtA==
X-Gm-Gg: AY/fxX4XOmTewBd8hTePKAzjWNrIB3NHarKxwcx7HnWVG+9JaMYBcIG2fFbxb2y6eWc
 23z6wFb2iQgYG5K2myrhb3Nhwar5pJ+WHW+ivKzfWKukNpLsm+BcuhkkxYbLC0XiI24gvtcUMLq
 CVENpC2zY8MbpJaj3BCtwgZ5I3b97UXJQkzBX+nTpTfI/L/VJk1SAkbcXGgotD9z9f+t6Wr9TzA
 xdBz2Y18O/srq3VLG36khBlIDyqaCQjK+f1DwCpWYNvDTrzbhIGjYxcbrdqxb/HI0d0XgaLyjz2
 p0P6U9H4eendRYXTsGK8kcIJhnf3MFWTVnphFNVXopvPHKY22wYlyQF6kiDmFZAQfIsUBU8EYSN
 ayIDVwsqvnz+66I90IRdl9tyVd3SuIqQnCn23YUVNyT95GNXyaUox/iK+ww==
X-Received: by 2002:a05:6000:25c1:b0:430:c76b:fadd with SMTP id
 ffacd0b85a97d-4324e4d3f7dmr11825071f8f.28.1766409441004; 
 Mon, 22 Dec 2025 05:17:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPJjAh0lWUYPqsFueQKbsmYXj2ojv/iXGbb0RKNaQUZcrRVENH0icM2yFnO4llfDZa37/BQQ==
X-Received: by 2002:a05:6000:25c1:b0:430:c76b:fadd with SMTP id
 ffacd0b85a97d-4324e4d3f7dmr11825030f8f.28.1766409440534; 
 Mon, 22 Dec 2025 05:17:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08efsm22277090f8f.29.2025.12.22.05.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 05:17:20 -0800 (PST)
Message-ID: <6bbc1612-389c-4fa1-9fbf-354209fb6b1c@redhat.com>
Date: Mon, 22 Dec 2025 14:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] target/arm/cpu: Allow registers to be hidden
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20251125100859.506228-1-eric.auger@redhat.com>
 <20251125100859.506228-4-eric.auger@redhat.com> <87ms4aoxg9.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87ms4aoxg9.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aTSpyHzDSXMA3KhS63OyGJO7W4G6c_ilmUVHtt5wxQA_1766409441
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 11/25/25 6:04 PM, Cornelia Huck wrote:
> On Tue, Nov 25 2025, Eric Auger <eric.auger@redhat.com> wrote:
>
>> More recent kernels sometimes expose new registers in an
>> unconditionnal manner. This situation breaks backward migration
>> as qemu notices there are more registers in the input stream
>> than supported on the destination host. This leads to a
>> "failed to load cpu:cpreg_vmstate_array_len" error.
>>
>> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
>> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
>> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
>> migration from a host kernel that features the commit to a destination
>> host that doesn't, fail with above error.
>>
>> Currently QEMU is not using that feature so ignoring this latter
>> is not a problem. An easy way to fix the migration issue is to teach
>> qemu we don't care about that register and we can simply ignore it
>> when syncing its state during migration.
>>
>> This patch introduces an array of such hidden registers. Soon it will
>> be settable through an array property.
>>
>> If hidden, the register is moved out of the array of cpreg which is
>> built in kvm_arm_init_cpreg_list(). That way their state won't be
>> synced.
> I'm wondering whether the patch description should also mention non-KVM
> cases (e.g. the bogus reg that was exposed). It might also make sense to
> merge patch 5 here?

Actually the AArch32 DBGDTRTX is not "hidden" on destination but rather
marked as safe to ignore in the incoming stream (so the other category).
So I don't have any example of TCG usage for this category.

wrt potiential merge I agree they could. 2nd patch is an enforcement of
non access so I prefer to keep them separate but will put them
contiguously in the series. 

Eric 
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Otherwise, LGTM.
>


