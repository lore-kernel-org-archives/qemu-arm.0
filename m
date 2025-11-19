Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5778CF58C1
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 17:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLm5h-0008Id-KK; Wed, 19 Nov 2025 12:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vLm5g-0008IM-IQ
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 12:35:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vLm5e-0005E3-Js
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 12:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763573732;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1lw2Z4Kz9YInokjfhDL5D1lBcfHCtYdap07+ltevnI=;
 b=cTznxulfi+OTVAdMiygjXT1UBk77Xg6KecvxQ4EEg3YTI3EfSAq4mHX/HE0zFpAEQaDnB4
 ejI82dMqdq06PaX9CuQQou7rUAzmmpbcxzwjhiTehtn683+HzaGDpetnSNKMK0MWm7G2bc
 IiUQmEFwFWBxWkODvQyLA43OX+QlNq4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-zJB12W1kN2-A1Eay1Q28vw-1; Wed, 19 Nov 2025 12:35:31 -0500
X-MC-Unique: zJB12W1kN2-A1Eay1Q28vw-1
X-Mimecast-MFC-AGG-ID: zJB12W1kN2-A1Eay1Q28vw_1763573730
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so85595e9.2
 for <qemu-arm@nongnu.org>; Wed, 19 Nov 2025 09:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763573730; x=1764178530;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1lw2Z4Kz9YInokjfhDL5D1lBcfHCtYdap07+ltevnI=;
 b=Af4QkoXrDnAxAMTwfst5oWXivgnrmDLg8Vd8667ap6u4zBRp6mIsL2qv2Ssw+75vPy
 6R39aU8ardPkyxVDhkaEfuu1g6yqFm8oiIlv2Pa9cy3qWG9fyrLYvRnzHGbrpj5UPfhh
 YIKR2M1oS6rGxtdt2QK1bBFdfCZkFkOoZxV2Amu1TZQ70ur+qktxVD4gdvoWNAGI759z
 JMPX2finkIyB7SiFzN+bsihvCH0B8C5gaxBcH1ud5kr/ojZDAh83dndiJ4gB+1OQVbMt
 /Ibd2NaK3br/Z4YY8w3QjQktF171v0AsJ5mbS3YbseFyUxzf4wNEtZWH6mio0EawlRyU
 1Ang==
X-Forwarded-Encrypted: i=1;
 AJvYcCU56S9wj4dqLAoT0ly6mOUTZ9j7o3V4nQwvZznCRrLXXDgCb9FAVR644QovBMVZWxO7vhSeDqQGyQ==@nongnu.org
X-Gm-Message-State: AOJu0YzT/m0mZZc0MvdtFf29FgUG9b68ZY+p7g3AK/1XlB/6O/Bc+1Vc
 PRlx0k2aDjgEZFvrNdcYavnQO8Tt0LGJSWWDS9RIDA0vw0LX6mAzricrX6mTAooBiAkvuOHe6Tu
 KEYTttw6ffzuujiImy0/SE3EeW65MmUc7FnGOkASuZd262JSvEVQjSw==
X-Gm-Gg: ASbGnctXbJhGgw0eGcNklv3j4EpmLEdwDIt7gF8pLW/tfNhlaTqyC1VwsMqnl218ybm
 DMoVlCZOqIGVdo2XlZIbEPfPNEJQABddqhqNkH8ampZE6VF8+BSCBIKbiMnS2S3TSaDUMKzLgsL
 PxBilD0YvEc6781W3Lu59PjtYMJX0eiJ+E70byBLPF+7e0LW0dmHg80yGJ4UXF6ZgRzVhUbK2Cl
 Wt4oEgCOqWVmpkJVqSX09j1mi9j+mRtkX6O4jipvarNdnHCYordNvgZ9dtRlfy+d5/UEbg0Qsyi
 hiHiXM8ATdRR7v1Kjl/ghFL4S4tsvBHfuLJWT6W2GPfEtIUASlduLiXusdMtDn2Dj3qlHvJbM2P
 yBdIuiSX82vGDuYhTDjFAy4qq0Dv4TuJQasJnbXqz9DhJZx2XKWHbEcnzBA==
X-Received: by 2002:a05:600c:1c91:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-477b8a8eb6emr551735e9.17.1763573730239; 
 Wed, 19 Nov 2025 09:35:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOt11BSQW1Lkoju4P4M5Du3UOtN23ghkHkf/fVYVD8goCopVA2AsoHc10BtQQdt7dZpxYQQg==
X-Received: by 2002:a05:600c:1c91:b0:477:a54a:acba with SMTP id
 5b1f17b1804b1-477b8a8eb6emr551335e9.17.1763573729794; 
 Wed, 19 Nov 2025 09:35:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b82cc6c4sm3435015e9.2.2025.11.19.09.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 09:35:29 -0800 (PST)
Message-ID: <935782b9-27e3-4406-92ec-462413c3ad0b@redhat.com>
Date: Wed, 19 Nov 2025 18:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] target/arm/cpu: Allow registers to be hidden
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20251118160920.554809-1-eric.auger@redhat.com>
 <20251118160920.554809-3-eric.auger@redhat.com> <871pluq8u5.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <871pluq8u5.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FZeXlLrvTzckdIeVOplQ_hKFoOk4VjTjnPOlO7amkyQ_1763573730
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

Hi Connie,

On 11/19/25 5:35 PM, Cornelia Huck wrote:
> On Tue, Nov 18 2025, Eric Auger <eric.auger@redhat.com> wrote:
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
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - Move the property in a separate patch
>> - improve the commit msg
>> - change the trace point to just print info in
>>   kvm_arm_init_cpreg_list()
>> - improve comment in cpu.h (Connie)
>> ---
>>  target/arm/cpu.h        | 23 +++++++++++++++++++++++
>>  target/arm/kvm.c        | 12 +++++++++++-
>>  target/arm/trace-events |  2 ++
>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 077b0cce5b..0a283940be 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1044,6 +1044,18 @@ struct ArchCPU {
>>      /* KVM steal time */
>>      OnOffAuto kvm_steal_time;
>>  
>> +    /*
>> +     * Register indexes that must be hidden. Although normally
>> +     * supported (defined in TCG description or exposed by KVM) they are
>> +     * willingly hidden for migration sake. This may be used to allow
>> +     * backward migration to older versions that do implement a specific
>> +     * feature. With KVM acceleration the indexes are the ones described
>> +     * in linux/Documentation/virt/kvm/api.rst. With TCG, this is the TCG
>> +     * sysreg index.
>> +     */
> Hmm... what about
>
> "Array of register indexes that need to be hidden to allow migration in
> certain cases, i.e. when a register is exposed in KVM or defined in TCG
> but not actually used in QEMU. For the KVM case, the indexes are as
> described in Linux Documentation/virt/kvm/api.rst. For TCG, the indexes
> are the TCG sysreg indexes."
sounds good.

about the TCG index, I am not sure. It rather looks 
cpreg_to_kvm_id(ENCODE_CP_REG()) in the case of Aarch32 DBGDTRTX index I
need to use to succeed the migration



>
>> +    uint64_t *hidden_regs;
>> +    uint32_t nr_hidden_regs;
>> +
>>      /* Uniprocessor system with MP extensions */
>>      bool mp_is_up;
>>  
> Otherwise, LGTM.

Thanks!

Eric
>


